Received: from out-zbxj-a82.jellyfish.systems (out-zbxj-a82.jellyfish.systems [198.54.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A995030EF6C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180107; cv=none; b=sDy4Rm3w0otR2uvwKXt4r14txtB0u1mPPXB90ahzNqvnVFCxg9Q6FUyG8U2irmu4Y0M8mfTT79Uv6l2G23Ltf4FimB6RbvAFl8GCwax64u2HCZjvQBO2i+VXjNE3k8Ah2YLZalFTEJJGLg/6YnmjnP9PMfLGFJVS1SiBXIQ+FlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180107; c=relaxed/simple;
	bh=7jY9A41SlMt+zz5Lg8UB7nGuOgaMq2235miUuh8pC24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fv5oVNn8HRVMqTAs7DQjg3F9vL2uYe8gFXo58ieSgAytCJiFfL+uF5MsBQPScwg7gxMCioqkJ+bm7hNErUO6CD3D9MA7bH7ndmARrfU7iCgFeHjAVl8hVXOxwbvwS36JTY6gLF2ng+vB9FhZANQIq4Pr6ZUosOdAKRg/kx3VmIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=pZs7Rztq; arc=none smtp.client-ip=198.54.127.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="pZs7Rztq"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hypg7174Jz8sWQ;
	Mon, 05 Oct 2026 06:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1791180100;
	bh=3bseDGG7gqJHvtnhTK5jGTwFBoFgdBRmb/bKEa5O35k=;
	h=From:To:Cc:Subject:Date:From;
	b=pZs7RztqOL4hO0tWg0RvGxJzMcJdTsBx00Qe+XEs5o0VTHkH7M+2EZgMANAq6+vVF
	 HyWf4nGPVlVAf2BsrdOK9KbfwuOWR+W90L2iMsNbg/AdQd9b+Caxagt30EV4NbCB4P
	 faTuMIDarQuwO2IYOWeOI5LVxCmypjmMW1qMU4bc2XKo9qzP7FCDVkrrNpxfzeuNYJ
	 yJavm7Pqi/wBOlSm3faJPwMeuYZk7uMk/189uJ4Pjy5JsRtCgVIWRkpOjYdi/Dj8Er
	 gkTen9V0OutB6vDhhdZUH/W0ZuXYKKk+Hes+KCDP4xFXokeaXVBPRQ+wyaOgnmU0Aj
	 HPBEUpWLx82Ew==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Subject: [PATCH] staging: greybus: audio: fix use-after-free in gbcodec_hw_params
Date: Mon,  5 Oct 2026 01:01:26 -0500
Message-ID: <20261005060126.93732-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Automated semantic analysis via Coccinelle uncovered a use-after-free
vulnerability in gbcodec_hw_params() caused by accessing a list
iterator variable outside the loop boundary.

The routine walks through the codec module list using
'list_for_each_entry' to locate a matching data connection.
After the loop exits, the iterator pointer 'module' becomes
out-of-bounds. Attempting to pass this unmapped reference into
'to_gb_bundle()' down the line triggers a critical kernel panic.

Fix this flaw by introducing a dedicated copy 'allocated_module'.
Cache the matched pointer inside the loop block only when
'find_data()' returns a valid reference, and route the subsequent
power management execution steps safely through this verified object
tracking reference.

Assisted-by: Gemini
Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
---
 drivers/staging/greybus/audio_codec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..a0645bf83097 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -396,6 +396,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	u8 sig_bits, channels;
 	u32 format, rate;
 	struct gbaudio_module_info *module;
+	struct gbaudio_module_info *allocated_module = NULL;
 	struct gbaudio_data_connection *data;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
@@ -439,8 +440,10 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	/* find the data connection */
 	list_for_each_entry(module, &codec->module_list, list) {
 		data = find_data(module, dai->id);
-		if (data)
+		if (data) {
+			allocated_module = module;
 			break;
+		}
 	}
 
 	if (!data) {
@@ -456,7 +459,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	bundle = to_gb_bundle(module->dev);
+	bundle = to_gb_bundle(allocated_module->dev);
 	ret = gb_pm_runtime_get_sync(bundle);
 	if (ret) {
 		mutex_unlock(&codec->lock);
-- 
2.43.0


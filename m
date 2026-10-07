Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A38493D55
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364348; cv=none; b=GR35u/YKr/Vl2KNlUbKQapk/T5CWX5E38l2cePdSj/ETt9PcJ9ElAnHeYwIX3XRkMoy7S4kpk0Ce5mv5QnagIwkbI6sg6ZJZOw+06Z+3EB18Xg79whKXFYOs+t3YHc3iR+btTlxz1IVpt7Nfvvmh8XJHCiGx+ngyx4P4V+LX/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364348; c=relaxed/simple;
	bh=6RJ9482rKNjR6yltvjYFmB9//6oUoR7JNtNpyrstTc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IcZCLYdUFScw4uRP0+42cOrW3UwkD8i30xUjw6JnlLRfEeVK3usEayRMhljAigQWzY0FQKR/xmRPMYxtMipBHQa81uFDRUzEzNKEPY+i8nzAGh3JDMUsOWk81r8TW3/nSLJv6/iK27l178gPUEwd0Vajzv4xZVSYw3gq7AnakGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he/FAgMC; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he/FAgMC"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34c4a0868b6so3362530eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364296; x=1791969096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVw0aa995nfgwPwgbdZc1nogZFK1e4jUFzuXB8l3Hp4=;
        b=he/FAgMCF+HxeEvkrFgKUvdBej69W5QGHaOMk+uOHPhWYXdlwkhZ0kw86fCqlCa3Po
         +v5ZWUkmrPCOJIJCdr+Euxm/4GVFfAIMQV4/qnphR/y3HurQ8sQBzDa8ivmFJDnSmyIE
         U2PcurLX4KWX+xp8Sg6dTHbDoNMrn5a3wt+cQajvZ6lctr4gLQmLhepk9/Enr4H2y1J7
         11l6bjiXeRvcuMiCvQDxx1BdmBjUPX3ldL18CBJmyiyxR66lgn74gr6Yc5j2fmfnQPI/
         dM8WfMCk8SUAKkLp8eRC1boWkb5EbaJjEyQIjZGxnWaRyeI84ZAY0nDfeZ2B3rqc+Dtf
         nWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364296; x=1791969096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVw0aa995nfgwPwgbdZc1nogZFK1e4jUFzuXB8l3Hp4=;
        b=eSbeC0VuvYbYA8abe796OmDecvymnuKDuZgPZjykdRxqO8BTbl+F+LxYCp7y1uog77
         ScTceMnakZ0g4K3of/E/bMNlwKuFG7dxPXnTXGAc7T/OrcQmLdCKJXJKKcIkW8/6EK8w
         ukmEJZ3SDDstuFII5w/cm9AXwm3sC1EYdqAsxIuwjbyAyIX3M1T7t5kzwjg+XbLJFR3M
         PbmENQ9ovJ6Tb9aEPp2Wc2XmViGX3XzVzNlYcTw6Nl/q2jMpAz0FAY29faNTjEdLS6pX
         bbEGdCMX8eUw47MO/BVHpmN6bSqnRZI578AVn8MUtHfQ6rxjg657yppcHqJ0UBDLjbw5
         s6Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwEqS3m++u3eVtP5oseAng/y1vD1JlCpDQavMPXUhXQL+Bq/30jWGzuwh0uL0t3GgSxeqRv5N8bu3ai74E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjUeAPFZefTv3s0oKTaSbG95vH8Hl/InCSIkJUERTHtwdqex+N
	oUBSK3AWaQFpvV3rCfBFXUIZLwEuYFpJbqb+GBNPJbv24ToGk0AlK7N2tUCPKrIV
X-Gm-Gg: AYBFou06IBBXV9aDgL5DDW2zR0hqLlEJlKMOyaiUqammJ90XOPn661EQIT5XkraXo9J
	lApXa68kSOiy8u2ptQd7s9ofU0IgH9qRy1QoK4/V+Spglv7UbS5t8DNoj6cgrAnE9WWejtsYSUO
	BJ5KdGwOg5qY7MehzyamGeUkDMeWzspAY2CGTgfegjU5jEero32CahXut03UP3eqvGxqNHinxtU
	zyY8SuOyJtmY7T95/K5lneDCmBumSp2uqs3F4PSu4Y88IdAERfVPP1qJWBsurvEk+0S9i31TkKN
	tkHY4f20NQUcfdPIWrTPaomFkSosTwlfnBn8KzpMeUVzmr9l3oa99E6E+HCSJhmYBnDnxZ/qVLQ
	FLrVY/oRCUNNIxfQEZjtH0mkxNMZ42xwARtQGX9zGJ/3stm0Aiwo5WtBdC/icuJODz2etrTm27P
	SePiiVFboY/rI3DGScbgFGNdhZQ1jumvyvInII5GaNb375yft/eQzU3TQ2Zxuf+54QbW7GhbT3u
	vzV33ev/EspOFCnVOQ=
X-Received: by 2002:a05:7300:ed14:b0:351:694d:9ca1 with SMTP id 5a478bee46e88-351694dcc07mr372391eec.27.1791364295776;
        Wed, 07 Oct 2026 02:11:35 -0700 (PDT)
Received: from Hruday.lan ([2409:40f2:1168:fe18:f738:9eca:7e0f:4b32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c00sm6459394eec.8.2026.10.07.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:11:35 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] staging: greybus: audio: do not use iterator after list loop
Date: Wed,  7 Oct 2026 14:41:04 +0530
Message-ID: <20261007091104.15366-1-shreeramrahul94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the list iterator variable outside the loop breaks iterator scope
semantics and can result in invalid memory access if the loop completes
without finding a match.

Introduce a dedicated iterator variable 'iter' for traversing
codec->module_list and assign it to 'module' only upon finding a match.

Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..f4c3090684bf 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -395,7 +395,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	u8 sig_bits, channels;
 	u32 format, rate;
-	struct gbaudio_module_info *module;
+	struct gbaudio_module_info *module = NULL, *iter;
 	struct gbaudio_data_connection *data;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
@@ -437,10 +437,12 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	format = GB_AUDIO_PCM_FMT_S16_LE;
 
 	/* find the data connection */
-	list_for_each_entry(module, &codec->module_list, list) {
-		data = find_data(module, dai->id);
-		if (data)
+	list_for_each_entry(iter, &codec->module_list, list) {
+		data = find_data(iter, dai->id);
+		if (data) {
+			module = iter;
 			break;
+		}
 	}
 
 	if (!data) {
-- 
2.43.0


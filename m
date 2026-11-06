Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990433;
	b=YzJiveVD262RRYqQqCzqkRUs2wZK8ErK1cpvxSN+HLXwMafRc2Pz3Wibwx3FDdbYmQLK
	 NhGnNVgTb+E8sWqAkpxHp00liLxyGKlwRyki2lurJq6L2oXN/X6KCECjeh5g9bjfO3Exf
	 PSs8wg9SBjfvFD/z/lt32+sIGnVfdHhb8Tb0c/F4mdM1GEZAcNJnXdM8CRctUHZhVasNe
	 mDnqCLMymAQlb0nrg1f9NiWTuzPao2yGgfdHu7OMnUiWn438bsmehmLoLBI1HjDI+8MGP
	 btjpRQB9B7zcbEBh5ftrmuDQ9ijTZa/CVTtOfcwGq3clUrHi5fh15CUsorzYh/LLXMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vYU0Cu9JcID5yAMPzRs7M2je5qmnSyymlx29rhLddj0=;
	b=mRQppAx/rC/c5shO4ZFk6pn3SHZC2Nq7ojHvxKEG3DAjGJln+ErCVHXjCAbPtLfYVnX8
	 uREIvQccruoi/cvwHGfwjRwW79VPql+/YQCxTAOf2b4xD6ViKRuDkBTsYsBBAYbCRv/yf
	 O1IA7MkV8bsi0vR0bYOUHIp+CptTlfmWiITp5B4C0N/bgaaSpdPsGHCnzQg+xlutsy9O7
	 L4Y1LDu9D1upJEPAYa1YZ8JRkXcHYaQVUkH/Tisp/pe1Oz4Zjm/wdmxp5IMM9krKQHARj
	 zLgHfvXdsrc4PawDmPciLuv9I3yVKC7H4bSISQC+SG5QUPADD6mykCndUKvCxDYnI1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PvwzG6y/";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59C606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E59C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvwzG6y/
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-19305bcb72cso919201c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990432; x=1794595232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYU0Cu9JcID5yAMPzRs7M2je5qmnSyymlx29rhLddj0=;
        b=PvwzG6y/YoteN55M2ufyriOBO9fAs1HgQDFd/ZHL5f/c0XP02ly9n/nRbcfNkRJlwk
         5CMXaj19wn40oRxXehlYY6qHL/xY1NAaq16Eua28DKpHbb6dlbL9+4uuGvGorWz6oNZC
         WoyFas5fM5hp3/ZLLiCpZZIVW4YQAMW6+a/rLWLv0FvpUNK8oAN2gF+o81NYA4SF5jE9
         PdB/PA7IYCeKe8JJ01Aar2bCi6n85H4kQ84P01jpWLVDw58Ny3/9fOOQIlMzQWtKtf8g
         R/CT/bkJGlHmm7ZL/mlfQs5bTJOBP+YwkSm5Y48DZKTihiwSOMtA3tSzstdC9SGZtA2Z
         HObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990432; x=1794595232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYU0Cu9JcID5yAMPzRs7M2je5qmnSyymlx29rhLddj0=;
        b=ZvvgPeVkt6mzZDZ4oTtMlFg1KG9dCXrRdaHJGr4n8ar5dBbH204wSK2/+u3cOiZ3PO
         secsG2PQ4l0r1f0WJ5mHB7lgHTryYZlsXE5qOdPjYFop1SWz2GlM2X7hYX6GMKrJcL4J
         Va/Sphj0Yw1yi/8ln0t0juJ/yUJtjXlIbCCuutAdEKcBEmgKF/ZH0vnyK/gufeXaHJG2
         g66x7KwUMrY3YFlzcOW+8qRKn+UErA16+4vzyaLUhVu6h7W9BhfGsMuXMf0m9T2EOUZC
         8ji1RpxkzB9CvLjXeQqPNMVF4v35NyKg88UGZKnweHruIvWZ26K842Qfp20Wzz3JNRL1
         71pQ==
X-Gm-Message-State: APuU4Z9UmFnnCjsqzoRANNEDrEYm1HxlYhh5idHM2mkL8YAdZTECurmJ
	E7NHQZurDeb2fCUY8paBH5IJa/Kq7OkzTW8OWRF5lJVVEZ3X8HfdIXnM
X-Gm-Gg: AYBFou2qBFp+SvqRXkEr/QDKwlHnS0lHms7sapFQ+aSss1iZlS8axq2OCvc+QXibXZ7
	V/mT1yAyDeQgg6M+G4edzMybvid+olCmg+x/JxDku7500CzNCaSaYchV+VcCK0Tv0V3F5l9Kss7
	9jyfxarcXVQ7/ktR/9Qp4xGM7qAY7n9pkj5q6+yAxf4Amo9h5+9yIcuii4wq5mG5wBEtJ/iTpwS
	L6ZlG5I4J+IfzED3y02UWONAFStaKDEobWGEdN6EIqgSu1fvNy0P2KAP4cUCuSnEv6rC2tNPPdZ
	6MaEcGEKB26idsHSIeuyl1RLriB+CO4cDKSZ3jHmxGc4LIY4QL7x5bw+L2GwHjLQm3PWRCyTXFs
	HnPQfV0OrfDVJvNdzzwS3lnu7a2rjEM5VtgFGPvnA/NokC+NLzPH1H5HD30tkRdnV+HHuuk5/Md
	U122dq4QI8MSH3sXXMHk5hKv8P7VyYDYOH4767SY6KCZBeQSAIDU0PlThsDlxbRdRumD4kRyx+M
	Z49efp16hye/3luVFR248IQ3BE/b5buxTIklXRWlClmYTAKYB2t+jxABiFTn07H8LPPE0HJ7GY3
	1HPFLhlS51mRm7/wUN7laaN3420bVOsh+lNSMaz2zq5N99QNGRBa
X-Received: by 2002:a05:7022:2206:b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b25d2f7959mr4976305c88.16.1793990432426;
        Fri, 06 Nov 2026 10:40:32 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4879adsm8622836c88.6.2026.11.06.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:40:32 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Fri,  6 Nov 2026 18:39:53 +0000
Message-ID: <20261106183953.2762-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
References: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mode_store() updates led->mode while holding
snd_ctl_led_mutex.

However, snd_ctl_led_set_state() and mode_show() read this
field without holding the same mutex.

This can cause a data race when userspace changes the mode
while another path reads it.

Read the mode under snd_ctl_led_mutex in
snd_ctl_led_set_state() and use the local value after
releasing the mutex.

Also protect the mode read in mode_show() with the mutex.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..044430b2f1a2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -140,6 +140,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 {
 	struct snd_ctl_led *led;
 	struct snd_ctl_led_ctl *lctl;
+	enum snd_ctl_led_mode mode;
 	int route;
 	bool found;
 
@@ -168,8 +169,9 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 				UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 			}
 		}
+		mode = led->mode;
 	}
-	switch (led->mode) {
+	switch (mode) {
 	case MODE_OFF:		route = 1; break;
 	case MODE_ON:		route = 0; break;
 	case MODE_FOLLOW_ROUTE:	if (route >= 0) route ^= 1; break;
@@ -382,6 +384,8 @@ static ssize_t mode_show(struct device *dev,
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	const char *str = NULL;
 
+	guard(mutex)(&snd_ctl_led_mutex);
+
 	switch (led->mode) {
 	case MODE_FOLLOW_MUTE:	str = "follow-mute"; break;
 	case MODE_FOLLOW_ROUTE:	str = "follow-route"; break;
-- 
2.55.0


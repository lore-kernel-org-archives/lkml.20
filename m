Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553709;
	b=Bu3vNj6lXyxw0XBqtpaiNfuU55slYEKLd6123omq5LhfkbxdKURMzah2BHMdQ10A4ajF
	 ctVyTAKZLG0Me1Uo0DoYXkDIsgT7P2p0uVA73ESsDeEn0BmuEnU6sP0t66BFEcWeZqafN
	 0ETFtA++0iqViS2wjk1vSyGpVryoWHHOIvWB3mDq08+pksY18LsGRiB3Qi9LVHRcViPrc
	 2XpkqzM/jwXFZqcKC4guX5R+HBCyPnwcZ8ITglBJPjOBQYEdFuyF/0b5DPz1OLRURQi9D
	 lCayUhBreh6xIQ2yDguJ7zpmiwaVksbYTpH6q9Nkfs7jvpwLCTugFp0QefNrbYp3OGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uRhiecFFAaHK0bLgXDuIKi/zmGv5hdM1ZUcVNprqX7M=;
	b=S3Qy8nWtlrQ7g3zpfsSky91+h/hC8B8YpXDHW1jPyqe0HW2FAVE8MfmV1CT8Jq9bvai5
	 z2S55/4njHIq3fNiRcyRhVqa8rWADRQeGvaz+8Yv1jOeZXtiHDCqYaCRarImsQ/HkHjcj
	 NTIlsrIluNBvsmTvqMY6VZ425E6BrY4VILlZtBtbbebcl4UKwhA8IKBIcypPP53vxaTxw
	 r7bT02t2bc+kG545ZXXpjg3HrNuoFEbCLmCcyS5Q8mjOe0DOTPEmfujFm5XVslKTx3UTy
	 LK4nn1nyv2Rm/bajsqGN/GJBfxHw3IUpjUZH+ngEpnJKwNH/uQoGtix5N8m8hr6e/Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=PUpolHbV;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC05606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC05606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=PUpolHbV
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ae8607e8afso15880227b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553706; x=1794158506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRhiecFFAaHK0bLgXDuIKi/zmGv5hdM1ZUcVNprqX7M=;
        b=PUpolHbVNgTgC8bZhMGuYtK7yEUlqkpbpOeh1TlpJqjQa4zSOgln3OsDnW8XLbaXty
         y0L0LYnWNT18H0QYKizB2TA83wxL9/K1sHSxdR4Gzp4CkqIArlCW8xk6qronoVGgnhUi
         49G8YvjrW+S4eK0xbLiSai4D452S6TbnLyOMYfCYo2zh8dLKQ01Sx7M8Rcr/uvSNANkI
         vRBg9/O/U/q/kY6Srp4Ff+lGjSiYr/wXHmcgHeyK2P6btYep+iNW3BZu0CSRDn6dhtwd
         2lMrMHcVYYfaGBrawW+hfCQV110+JTX9QptpEq7FM9rSSUg1LNF5JvU+CNfgXzgrLY6T
         /umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553706; x=1794158506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRhiecFFAaHK0bLgXDuIKi/zmGv5hdM1ZUcVNprqX7M=;
        b=aVpELs467vRFek4KlsqiqX4tFUo51il4S/7n67JfbA6mjbeMsWF+D+R4OeUkFAKoZl
         rkvcvZGLeWd8sXs7iLzDYOEAxgmdU1oKDBBtliRESdgufW9fAfDdsWg9hLs9ds8DCIGL
         8JpENQd0D5P3M41GvdgnQJRgL5VP2KupLmVxWHhgpxB7Lv/afA5/Tkcor+vtECADt4/d
         bb3ZVjQ1iHy8FvEHWaYsdMLMWiUCc6Qe89cUzAIs3QmOMRTqadry2lU7A8NUa4nczWeF
         xXP2VkDrlV2DrMzjZuMcZET6I6hBtLkgYwjYSDBRA25ga7C0PyqwbkCMi2SO47tUoMRE
         6O5A==
X-Forwarded-Encrypted: i=1; AKwUvBxNCwOSanW8TJzU25dqV5xIslon6kM79KYJgTMThoGpeddXNMhdt5nvTEATaj8DRoVQxXS+PxBL9xgWjDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qQJbJCDHepHk4MAvw4ooeqY8+Vk5JZfEp4z7ASHhMRw2uKgmC
	HMO2LbVgeMMoVIS0zjgJ1YTMbDO3b2tB/PmnETd4lPIBlk7EaEsxZE1S/7+cNujB7Q==
X-Gm-Gg: AYBFou12XsbwTT5wD9KgvQx7nIC2vTIStHuxSZaT7UriVyRfhjZAav+f/LnIrrK+lHD
	ZJXH38lX+VeUt/9Vs+E9NjH1axwu2Nd8ReUxjQwRDhKQLtWitobl5GlO/5/nSDmTposJvyqD2DX
	WTCKHgGImHZ+1xD4zIO1Cvp2YWfAAdGoLq0Dm36pD523alInjgakm9RUg7erqCvkYjQMLf1vLf/
	ViStqR5HW+v1/CD489to6bmMRU6AUB06qlp+cFxBI2WxHnmfbYx/g2Nt4x5ieM1MwuCN6uJNdmV
	igiHCMuJMLaEgnXl9WX3irMLC6TSLRgqOlHUEdm5uti8MyKV4M/hSI0kkG8ntsuYDhq2J3chQWA
	H+ElOb4dONvJLeGSXqtaBxs3T/bCb2jNVH89ZeTtLVDl+HTg1f57b51yMiASp2Kj/TYx8NimFGk
	ZEe0PAEn4fUOKOAElTirr093trpfbnbElCnUk0APyHi7HrNyR3BhUuAtvAfd+TPxQ0sxrxqR2rc
	ltvTUSJegLnuQIpFr6zauC0Y2jljH8zi6dxvIZtBxCTqsfBbbqyqAVwUl7N4S4r8raG7Jw=
X-Received: by 2002:a05:690c:920e:b0:8af:1cb6:30ac with SMTP id 00721157ae682-8b2b67dca4dmr35715977b3.67.1793553706619;
        Sun, 01 Nov 2026 09:21:46 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:46 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 2/5] ALSA: ice1712: Make chip_init helpers return void
Date: Mon,  2 Nov 2026 02:21:31 +0900
Message-Id: <20261101172134.3451066-3-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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

snd_ice1712_chip_init() and snd_vt1724_chip_init() always return 0, so
the error checks on their return values in the probe and resume paths
never trigger.

Change both functions to return void and remove the dead checks.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/pci/ice1712/ice1712.c | 12 +++---------
 sound/pci/ice1712/ice1724.c | 12 +++---------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 1fad8c418132c..ae1a9de22ce20 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2283,7 +2283,7 @@ static int snd_ice1712_read_eeprom(struct snd_ice1712 *ice,
 
 
 
-static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
+static void snd_ice1712_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ICE1712_RESET | ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
@@ -2334,8 +2334,6 @@ static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
 	      ICE1712_IRQ_PBKDS | ICE1712_IRQ_CONCAP | ICE1712_IRQ_CONPBK : 0),
 	     ICEREG(ice, IRQMASK));
 	outb(0x00, ICEMT(ice, IRQ));
-
-	return 0;
 }
 
 int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2504,8 +2502,7 @@ static int snd_ice1712_create(struct snd_card *card,
 
 	if (snd_ice1712_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	if (snd_ice1712_chip_init(ice) < 0)
-		return -EIO;
+	snd_ice1712_chip_init(ice);
 
 	return 0;
 }
@@ -2683,10 +2680,7 @@ static int snd_ice1712_resume(struct device *dev)
 	else
 		rate = PRO_RATE_DEFAULT;
 
-	if (snd_ice1712_chip_init(ice) < 0) {
-		snd_card_disconnect(card);
-		return -EIO;
-	}
+	snd_ice1712_chip_init(ice);
 
 	ice->cur_rate = rate;
 
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 651d926635675..d4ed7050c533a 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2342,7 +2342,7 @@ static void snd_vt1724_chip_reset(struct snd_ice1712 *ice)
 	msleep(10);
 }
 
-static int snd_vt1724_chip_init(struct snd_ice1712 *ice)
+static void snd_vt1724_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ice->eeprom.data[ICE_EEP2_SYSCONF], ICEREG1724(ice, SYS_CFG));
 	outb(ice->eeprom.data[ICE_EEP2_ACLINK], ICEREG1724(ice, AC97_CFG));
@@ -2364,8 +2364,6 @@ static int snd_vt1724_chip_init(struct snd_ice1712 *ice)
 	 * since they cause machine lockups
 	 */
 	outb(VT1724_MULTI_FIFO_ERR, ICEMT1724(ice, DMA_INT_MASK));
-
-	return 0;
 }
 
 static int snd_vt1724_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2511,8 +2509,7 @@ static int snd_vt1724_create(struct snd_card *card,
 	snd_vt1724_chip_reset(ice);
 	if (snd_vt1724_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	if (snd_vt1724_chip_init(ice) < 0)
-		return -EIO;
+	snd_vt1724_chip_init(ice);
 
 	return 0;
 }
@@ -2703,10 +2700,7 @@ static int snd_vt1724_resume(struct device *dev)
 
 	snd_vt1724_chip_reset(ice);
 
-	if (snd_vt1724_chip_init(ice) < 0) {
-		snd_card_disconnect(card);
-		return -EIO;
-	}
+	snd_vt1724_chip_init(ice);
 
 	if (ice->pm_resume)
 		ice->pm_resume(ice);
-- 
2.34.1


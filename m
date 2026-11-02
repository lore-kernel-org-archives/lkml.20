Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612314;
	b=F+3jY/CEtcZgmlpR+WswXKiJ5thRbJcBrsEfhFEjDRmL+GiCze7cUdAxEVjokQ1aLY6k
	 k5IkX00Nx1zNTswwiAqWWug/5O+Y2vGkFiD309RnVr5Eo+80PqJE4ZA121NUduPi2SvKW
	 Ra8fNZxPKJXO9ElXQDEh29IF5M6EA0xee0Xs0Af0yJtlLXBVJ/IsMEsjvL6BTDALNDSXo
	 Z7NREx6l2pgV3JPaJ8Z+0FtayT2ZrnVqk7P21oNY4rhclCMmRpcPbWAKlsn4NyoGPkvvU
	 cUBZ3n0RFJIGrHd4pv8qwEKsCguD2po3GlZffjd7hGaZM9etGpOtAms2RTia3W92HGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9W6SMwMnOG7tjkQ5Ri3kpEZarqiEynjz7U73u8xMxLA=;
	b=TKw/ZqRKBMs6ixjlqT+0ovmXN3ZK9AEyW5hBQYIuQEQYcspBS0+vAv6zB3zP+AYyxyOz
	 eDVnZuGeB4Hsn3npr2o19Up2tFrhGdBDeAP8hdzdximDhBoYEawT6YQ6/DHqQNMztDTLf
	 yPbvoS884xE6kiAAucx4uAUJP/zsHSbtNqq83ckUQV0ngsx2RIHwzyU75hhP+SzS8iMc/
	 1HILpI17/12+/Nz/ljxwV9KtnDglHgXNOlpIK0Ki2L6XjHYE3X0PrpgLzE9EImsPT4sw5
	 u9ZY3qhLf8EBMlaEF7Wqw1kYeencn5qE5mn3SD1iIfoA0cNNo6eYMb9GoYnDLWPNAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lpDNggkl;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lpDNggkl
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679e6ab6471so3328201d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793612311; x=1794217111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9W6SMwMnOG7tjkQ5Ri3kpEZarqiEynjz7U73u8xMxLA=;
        b=lpDNggkl1wdDfUyHy0IGsj330/0ITDVxw0HAC2o42SIcmmsQg4sCcTd221hmuK8Fwb
         KTrUnU+ZKoPmysoWazVFzL9sObwRnEECcVx0HkmbI3HxwBLyQ6hVhmgqdw/JhH8BROcT
         dSeXbp+Ga19xif+mRpVGQh2G8ASyiUj9r8gIJvbta0yRPyFjgteQIGqdNPRu60itDSGs
         pYmBZIvYFHPdsy6JzghVuJyaYXANwi97nSAVFQZJmg3/7mWRDv9uRNx4Xg4Jd7XB0rcE
         O/BX6zPEBvp1mfQrHihqnelbKtTQpLWZMs5yagqMjosFZeQI0qlV8VNmE+tnFiABu/R1
         AVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612311; x=1794217111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9W6SMwMnOG7tjkQ5Ri3kpEZarqiEynjz7U73u8xMxLA=;
        b=NnGCZV8BxpOh9CbiUU1FaDQPYBP3FE9lbfwdyY5Jeq3uGTjhg6uE+B2tWMqaSDqZsj
         m+LTC0Aif7xVx2cfKYBsnc/NmuS6WzCfbuRQzUJPTk3/hKpdcUJUGvGwwdSlJMsf5gZn
         YZTMfuWxfmMH2qY/Z+6T2vVoQJSIZWOGUaNyg9gaE/B9JlMCbJHemCyDor9jRYCG5mdA
         Ds1UNSqUJgQNMvaoQ6yKWBH8exhcGYHzoxDpTvb2P/ErpYaT06b9rlKCP9XHuNz7DDLw
         EKlTlEDQSBv46k8dY7bMda+ju+YfTrNvlwf37sINjr0YZXioZJVaaN7ey5vBQE/0lX/x
         unXA==
X-Forwarded-Encrypted: i=1; AKwUvByJLgP6yDun9OsMa8UdAOxFbVOYkYl/R0Qafdb4cmjl1PQlGl6T3CokPc8cXHBjc4v7B8aIa1hdb1AFGEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87s35A+lISz17z6imyvtytVGPX/oa2qeYn65aWiYibAVnTJrbS
	yuTPUagZ/V9T1Z59qqBfMipMj+Fme8TE10GsEIlu0c1J3FJ0P+lHQYpWPHFzaCCPuA==
X-Gm-Gg: AYBFou2Fkif93HN4UF20SYgwwawyqg2KOPjJSYrNOKLUBsNtGPaAb0jjjF7m666EAm9
	2PNXynoNUvreIINE5I6OS6ohRMNDKlXgBh87pmqi3WS1OwIjXf5AhZMneIno8hXSNGQwaDMDtLu
	RZrQlVzJo0Duq2TcMzoVxwyCEP/jlXBm2KvMLMxrdk655nmpNny5FoJ99niiDgVInOwdHkFM81W
	APOWbd3H7cfmksSWBczlpUFtwLOdLaKxsYCfO1dZ6v0YIUsf0JoR7sl22jk6/lFjPGZTU2NBX13
	C5hANHlJi9vA/2OSL4JQEwlZB1ZLXGswhdUII+iLASbXS8TZ0KADfqTokcBExh+4Tm2VqCp3DzP
	VyANMiRoeBBo0I6jgllGmh3Xq+xerFPnoal+XxfrmgfG+pVY4weo6gMUsxoferI/6GntTW7voxu
	wfYO5ZcVIcKWWpejAexBmwJWIRYkwjZbi+6has/039tbsvOJDb1qoUporhKoe2VwCyL5/LyH5Ie
	oIbBAF7R8hNP5quXCKx61o+xKZU10V9TECC4a0T5TYALnbs52ekPvl02iqBx+SW36qUzz4=
X-Received: by 2002:a05:690e:1186:b0:679:a925:edf8 with SMTP id 956f58d0204a3-67ba50a3868mr7303167d50.44.1793612310652;
        Mon, 02 Nov 2026 01:38:30 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2e0937sm4731269d50.13.2026.11.02.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:38:29 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH v2] ALSA: ice1712: Make chip_init helpers return void
Date: Mon,  2 Nov 2026 18:38:24 +0900
Message-Id: <20261102093824.3123528-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
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
Changes in v2:
- Rebased onto sound for-next, on top of commit d54819ee513f ("ALSA:
  ice1712: add a board-specific EEPROM initialization hook").

Link to v1: https://lore.kernel.org/all/20261101172134.3451066-3-ingyujang25@korea.ac.kr/

 sound/pci/ice1712/ice1712.c | 12 +++---------
 sound/pci/ice1712/ice1724.c | 12 +++---------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 5481720a17ed6..2d4c9bdfb62f2 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2299,7 +2299,7 @@ static int snd_ice1712_init_eeprom(struct snd_ice1712 *ice)
 	return 0;
 }
 
-static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
+static void snd_ice1712_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ICE1712_RESET | ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
@@ -2343,8 +2343,6 @@ static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
 	      ICE1712_IRQ_PBKDS | ICE1712_IRQ_CONCAP | ICE1712_IRQ_CONPBK : 0),
 	     ICEREG(ice, IRQMASK));
 	outb(0x00, ICEMT(ice, IRQ));
-
-	return 0;
 }
 
 int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2517,8 +2515,7 @@ static int snd_ice1712_create(struct snd_card *card,
 	err = snd_ice1712_init_eeprom(ice);
 	if (err < 0)
 		return err;
-	if (snd_ice1712_chip_init(ice) < 0)
-		return -EIO;
+	snd_ice1712_chip_init(ice);
 
 	return 0;
 }
@@ -2696,10 +2693,7 @@ static int snd_ice1712_resume(struct device *dev)
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


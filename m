Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752757;
	b=yUe3ZyugJG6pUOaJiyOzv66qG1go9vQHKZc1lH2Rcsp8uShrfKcZZSnJ8F9zL+IeL3nA
	 WcNIFMj88AoiXsWi3r55hVsQ4AGd4pdPxwECzYMZWvp3+CvwI7mou8NUgBMLJCdkGsHRw
	 brsCd0Ws31dN8AvJqIZ28tUOmwPId2DogKVu2lwT6qMhG5WWKE4Gx/+AN1aeB0Z13MAZp
	 rj9K7HntmbZiG64kS6Ak6X+1somRtmKkW5ZQvqJ5w4g+YiHWxI4Q3AKFp7tM8Gm6bHl18
	 OSDhP19lYbnxbX9EP6s76gaK6s4EmMGsU36IpEKXkM/a6oZ+4fXXXV7L5e62r0xkkCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lkgVhVfj20yX1/5QJaN7L/GgWOPHnBs2SlubpdAOVYU=;
	b=wJw5O4MMv+qnlNWTLN4kfWDqneARLQEX9mn8h9mDvydx9qCsLJQ/SYCr6uq9nMGZUnVs
	 PFbOPlPoYpqFh13Nnm/spaolfLENeT8UyLyPtvUxVxPPtZ1HcFvJNQDO3ilefem0uwK4I
	 IOcQ34oXsfi17kirmozL8SC9M/Pg++PeD71xoXqkiUQ6Z6dSBYdz4723/Q+VLuY5aUfXe
	 X49KXCSK7PWlX3goQRdr9VmPK3SWfHt5+Sy0EteOMUo5KKZ7pl9H0qoX2G8N3onSzKnDX
	 fIVG/jJfoDfIg1dTo7TUpBX0lwlqfo5CTpYHHLWJqu6cdhbfU8O5CmwSojbNt04nxbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKJu2mC4;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C14606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C14606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKJu2mC4
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1286208f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752755; x=1793357555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkgVhVfj20yX1/5QJaN7L/GgWOPHnBs2SlubpdAOVYU=;
        b=gKJu2mC47aDv5AW84RsaoI0pS1sDh8ljzENd8XmJVUqCLbFFCydF1Xj8mYJkrd2sjI
         4i3KRKFOeogx7KeMWiZjyx+kU4HOGnjgkTArjWkGEYOEAhOO75yk4b3MnX8eHjfBds6I
         scU49clfAygXNIpFuzjGG7ZR1uK1/tXF96xb/n9kSc7/f/1mIWxNXHvzXovKxJzsClRh
         i3wV7bACzpbLRLpAHPmHvnlTg2K6bvICVaMlmq5jCDcTkjo1wiQIV3yL5N2IqNu86JLR
         57v1a8TLVjyPvE9ap2cwKl8UmdwB+0JAW2GGc/nEteB3VOxslHTvV5vDYCqeVadKjPCk
         Cavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752755; x=1793357555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkgVhVfj20yX1/5QJaN7L/GgWOPHnBs2SlubpdAOVYU=;
        b=tpIE9o+BdZy1uKNl2+gApfUZyASlRquRFSlvT4eD2ZNCTMseVUhNi4Wi97Aeakf2XW
         owGagASzxg+QSxrpErcoxcDAiUH76T1AucE2jTFzIM3J76jrodo5GmalKj97Efkm2ew7
         9fVCXVMyqaBNbSVcCuU8oj2aC6Jy6vAuKhq6jsvzTivDFCMxe9U5MpHWhMm0MaDO76zr
         Xfk6SxBbMH0xGM6RJaj9sNNTwHykKoDZSdFJGcidl7+Pw19DwcksgzYllip6h8Wc/+KS
         dphj5zmEAp7sIYkAbaKlXFFJfn72x5ACdKh4NbcCfQr290aGIcAuy3u8jJMk92XOoJZh
         +KqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDeH3d5K0zMr8TgjySE4EDjshi1JvVc8C3xTEBzDvKgJKEfuCkERJZCn517qHRrbqmxlwK5L89yBIhSq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL87hNKwarsS2KLS6+3IVR4iWrScMwsGDYOfILy5sy+TTxjn1vX
	rRY57Eegcaew/9Gxp9L4F8K0ZpP5ySALpeuubPysACOnQYXCEkjKeYxo
X-Gm-Gg: AYBFou2aBp3q7odxMarls1D+zD8zmNjipgj8CJ7k8RZ/ven1ITR4Eu3M6KM0u+RrMDv
	8QC6ygtTzNShcyR7zHIk/AlfDSX9xmC7GYfNusm4qOMSQxd4SmrH8Kw3faW+w9D3S6+TuWOLNFZ
	IACdJ5C9nOl2IFAdq9ta1APAPzB7Sfi66FnGkB/VoY8ql5Q4r2i4rqb3ZTRoc69dHDuvaTeI2jG
	fqvjrMejBwYogpxAPpK1ZfRfTil26jcxbIHHo4Nvvnl36SBCp2OVRsDzcZe/vkv/osbnEqrfHiT
	v10++ufcCNZxf3HLr+DTVFqZrB5HsnISWL4QbWDnJMgFvmHmCwhIKoNKPMpm+TqPiGG9SKIbDTx
	st6Q7vx3jA2cL3jpze4YS2x6ixoy3t0QvmGgYYmQGXxsWlOpLNotPbSmOXuUtLeCq36rLhXfr7F
	9YMa1LtxvnWJXWM6mfHu+3OGI89d62xIk3fJ2xrEJG+UmxkR2TW1RMxZoDHyPPNp7fZcQJJeokG
	3V02TO7r5uj5eO1Q17ZVY4EcVKdyggs4bEk008A5N7oTaR/mxq6tnBNrWBiY2YwEYd0wkWGUxne
	xUvoGR8=
X-Received: by 2002:a05:6000:2f8a:b0:48d:fbe0:62e1 with SMTP id ffacd0b85a97d-48e2d278e85mr10121108f8f.27.1792752755385;
        Fri, 23 Oct 2026 03:52:35 -0700 (PDT)
Received: from thinkpad (46-138-54-86.dynamic.spd-mgts.ru. [46.138.54.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025d76sm4282184f8f.13.2026.10.23.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:34 -0700 (PDT)
From: Andrey Zakharov <dedemorow@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: [PATCH] ALSA: emu10k1: Pass destination size to copy_string()
Date: Fri, 23 Oct 2026 13:50:27 +0300
Message-ID: <20261023105027.53135-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
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

copy_string() copies the bus and input/output names into fixed-size
arrays of struct snd_emu10k1_fx8010_info using strcpy() and sprintf(),
and it has no information about the size of the destination buffer.

All source strings are static and shorter than the 32-byte destination
arrays (the longest one is 20 characters), so this is safe today, but the
safety should not depend on the contents of the name tables. The earlier
strcpy() to strscpy() conversions skipped this function because dst is a
plain pointer.

Pass the destination size to copy_string() and use strscpy() and
snprintf() instead.

No functional changes intended.

Testing: compile-tested only with clang (W=1) and sparse (C=1). The
function is reached only through the SNDRV_EMU10K1_IOCTL_INFO ioctl of
the EMU10K1 hardware, which is not available under QEMU.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
---
 sound/pci/emu10k1/emufx.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index a33817aba17f..d49866d9961e 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2423,12 +2423,12 @@ static int snd_emu10k1_fx8010_open(struct snd_hwdep * hw, struct file *file)
 	return 0;
 }
 
-static void copy_string(char *dst, const char *src, const char *null, int idx)
+static void copy_string(char *dst, size_t size, const char *src, const char *null, int idx)
 {
 	if (src == NULL)
-		sprintf(dst, "%s %02X", null, idx);
+		snprintf(dst, size, "%s %02X", null, idx);
 	else
-		strcpy(dst, src);
+		strscpy(dst, src, size);
 }
 
 static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
@@ -2446,12 +2446,16 @@ static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
 	extin_mask = emu->audigy ? ~0 : emu->fx8010.extin_mask;
 	extout_mask = emu->audigy ? ~0 : emu->fx8010.extout_mask;
 	for (res = 0; res < 16; res++, fxbus++, extin++, extout++) {
-		copy_string(info->fxbus_names[res], *fxbus, "FXBUS", res);
-		copy_string(info->extin_names[res], extin_mask & (1 << res) ? *extin : NULL, "Unused", res);
-		copy_string(info->extout_names[res], extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
+		copy_string(info->fxbus_names[res], sizeof(info->fxbus_names[res]),
+			    *fxbus, "FXBUS", res);
+		copy_string(info->extin_names[res], sizeof(info->extin_names[res]),
+			    extin_mask & (1 << res) ? *extin : NULL, "Unused", res);
+		copy_string(info->extout_names[res], sizeof(info->extout_names[res]),
+			    extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
 	}
 	for (res = 16; res < 32; res++, extout++)
-		copy_string(info->extout_names[res], extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
+		copy_string(info->extout_names[res], sizeof(info->extout_names[res]),
+			    extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
 	info->gpr_controls = emu->fx8010.gpr_count;
 }
 
-- 
2.56.0


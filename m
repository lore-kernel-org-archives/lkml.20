Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7993F3285
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461883; cv=none; b=K5G2nW22OuQlfAcfKtaRuqV6XQkx98+11hvCzjNc6cHjYOaK3SEvepUzs3s3HrmwTfR6PwyUsgouZR9SQOSqQ2pS109RnjzKkJ7k49yR/Qew2/45N6xtiUtrNxpgUFF+Sgoae8yyIwtI9HKAz2P37SDTlGVXVTVVhPMW4xQFt5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461883; c=relaxed/simple;
	bh=RJ7NyXIgAY2k+Qq8wg3GdjnBGDCjLOJYLLeRxLlYiMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFo4NDcZWMQq/gDfxrwuuWvruRS6xJw8udbQrE/YDU2oYPSDAmcyJSxJJ2W/jCrLdmWgovGwybC3qp9hUkdrBVi0CHTjGzvDFX5kjvF0+pjpRWx5vRchPIYj8JFSchRHRDAUj/8TVPvZSXIw+BxXpWRCVBw582PXZltcN7ayBsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLv2Kmtc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLv2Kmtc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3071175a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461881; x=1790066681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0a2co2ZVWH38/vm2oqn2WALPT6cpKDc3QBizBjbTyI=;
        b=gLv2Kmtcy1fsUG13+jGkCGtXUAigX84yvNai6PDVNacfFKChcEHLm4fV1qteVM++M5
         uCpOo6IOzud5fEVNutuDCF0Mt8HQYW2g1tdUz4gT0bOElw7f7FQKWtV3TlLH47Zvjq4w
         5ejAjIXop8qmZnUzeryHYuqtay8rdhmGJzMHrcq6PBXSLAeOGAp+SPGhihjkaUEVigYt
         SWOcN2TPOIztuoXohvBXLqgsC+QNm2FTmLsy6b4RwUQXg/y/Y6+yc/7n9TJw6WXU/30h
         5pSald2rzhO704JFrBevLJIAieif15xR7ifVbQhnriI8uqtiesBs/KXUoiVykqZ4eDJe
         OQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461881; x=1790066681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0a2co2ZVWH38/vm2oqn2WALPT6cpKDc3QBizBjbTyI=;
        b=F7Lex4Q2JIIGCPQjtj3dSrbs6h7hw05QEGEHRKOtMBl0N8sy3r9FewKuHQ/Akr3RK5
         z000q2o2ds4NU74YZEdRa4n7HfmzWuTSqxWwJNdGTSXeQ0E76CbGXqTg2ZvD2ZVbRSAN
         A2ZhlKcEH1LCGRJRVTzYIwZ92BHu9uJhDQfeYx9+1Zzg86mD/+yBPmXwI4OysZXrp9l3
         9fcnMh0urjpW6xaFMxdfgj8mAIqno+qqvCTWcgoZceg3Kd5z0aEt2s3D42jr7OSoHbtn
         Pzm6nJuQgAlqCOKrZpMqN1kXFOm8NIFGje/JBHMZ4Lx7Q0PFkHwo+FFuGvfIUCqKaczD
         jrnA==
X-Forwarded-Encrypted: i=1; AKwUvBwOi+w7CRYecZzo61c1YBxyU02x38CJn7gLvi3OYOM9Bpl0XrJII2mNppL96y+a/kfLPACUHWZ5eiA+Cj0=@vger.kernel.org
X-Gm-Message-State: AFuF++nKMcY3jojYKvg3wUhQDDp9F0A/rVQzAe/MQ87zzMNCA5j6p0WI
	8lr8voZH2Cv1x/CatfCS3O7GgClte8uo1MGY2tKsPpuTSrXnWw/wBFjz
X-Gm-Gg: AYBFou1kNjfrB48Nv2duagPG6TKOVE9Tk3t4JHiQt+4U1rN83xW9oLx3hknSYuYgEQy
	k9vZGsm24Kjvlf4pAiBewwVoKjf84QmxI+6j+47ut3wY2qQA8ZZpJluYbZ0arAxzmbUul2VyjgT
	NTJJ3wm0BlkwJY3lnrhAwOYusU6gv28scmmmJ5chvcl/rK9kkEEIgTFHHDbmtlhyxK4ACTOJ2je
	cOm4iSoUgx3HxMw/q4Z+pBGFrtwW7zfhWeQVBF7OisxvhGY7yGPQGO/WfJWq3NvAkJrtsjKGxeU
	zsf5nfL15W373KVW6/lcC5dcXaY4D8CYvxfEjgSYGV0ADf5MxpqCrWd4Kp5WGVZ5Ou8vpkDN5gT
	v/eLU39crheQL0guWSuSPFXL431yYEcMWzGHbCxoUWwgGmA2aD3LXYEuV9vw+ORDY1sxOIB3uIq
	A1McKlog2K+HLWydm1lSO2MobI6b377rSWCNRDWjqkkdEQFBdVPyYUZTeLAubv0vxCgRHVWU5N2
	ktqdLl8fpeY7MRwZTayun8fCbU=
X-Received: by 2002:a17:90b:3b92:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39debf6b6dbmr12362587a91.2.1789461881008;
        Tue, 15 Sep 2026 01:44:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 04/23] ALSA: i2c: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:05 +0530
Message-ID: <20260915084424.1007757-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/i2c/other/ak4113.c      | 2 +-
 sound/i2c/other/ak4114.c      | 2 +-
 sound/i2c/other/ak4xxx-adda.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index 6ef5fffda8d7..9405d985a87d 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -130,7 +130,7 @@ void snd_ak4113_reinit(struct ak4113 *chip)
 	scoped_guard(mutex, &chip->reinit_mutex) {
 		ak4113_init_regs(chip);
 	}
-	/* bring up statistics / event queing */
+	/* bring up statistics / event queuing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
 }
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index 71efb29b6c7c..4c3dbbf8c316 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -135,7 +135,7 @@ void snd_ak4114_reinit(struct ak4114 *chip)
 	scoped_guard(mutex, &chip->reinit_mutex) {
 		ak4114_init_regs(chip);
 	}
-	/* bring up statistics / event queing */
+	/* bring up statistics / event queuing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
 }
diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index 9dd36b82a6ac..e7410f0f8660 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -147,7 +147,7 @@ EXPORT_SYMBOL(snd_akm4xxx_reset);
  * Volume conversion table for non-linear volumes
  * from -63.5dB (mute) to 0dB step 0.5dB
  *
- * Used for AK4524/AK4620 input/ouput attenuation, AK4528, and
+ * Used for AK4524/AK4620 input/output attenuation, AK4528, and
  * AK5365 input attenuation
  */
 static const unsigned char vol_cvt_datt[128] = {
-- 
2.48.1


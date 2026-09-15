Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A88494819
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461899; cv=none; b=VXHGp/ioHROOfErXu9ppIdXGqbKeeoqLXpiZwI0nXwhgeIpU3/3katG2XRGzh0EY9f8JHSUKQJ7CKY0BPqLyJMTiYPGwq5XPWKHhLMXs4HY+f5Agehcb6FmzdqJjL7zmsD5CANAlYqxUjV8qMLX3ywYmJcDbZqsF13I56/VT2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461899; c=relaxed/simple;
	bh=/8vQTsAacrt7tq+CmZEqjCdzPBMpFxzscNzh2mve8hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgucMNNskxonLpUp1HyNVwnbMLW5o+pJMHIyWG7YFXhPrVHc5Pj9/t47RLUbXhfU6nJkJRlyVNVMRFWU2Xgkej+VsKbgzc15tyHo+/RX+Cju1BVmWHJOSc9uKzRDJLBOshQTUVM3IT2t4gl9t+cQ6MOwdyktsguRfxDaB20Oecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCsh4f42; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCsh4f42"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so31629265ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461895; x=1790066695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pv7hnek0M3kdITeC3SL2hfj05ljQFsw5RFgfNprat8g=;
        b=mCsh4f42upLYTYFuetuvTgN5Zy8beJU4mZfQ/tKctqQKtiNS60Sq36GWiQyn92sLSw
         H9CI+X5uti186YldPLVqV55Y2/j9vf8Bsbj8dtLdgm7jSeV4VwKhqr7d8JHkMi5GutxR
         Rm2NUB3Mcv7d746Mhf6NFtLSZI5VDvUMvqCBm51dbqsxHT+8HkRUrx8bgz1/Px1Qxbqi
         d+ktpYELGzxNpoxUe4fuQXm5tE+deJKOO56dhtbK1ClWywzf7pDKL8MTbaQZz/QoA0GM
         PXX/UEISj3myHa0rjLN10BwT8kNUDJQUEy6kl5um5JYWnPpNbqmkQxjFO/C1nEd/jnW3
         lo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461895; x=1790066695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pv7hnek0M3kdITeC3SL2hfj05ljQFsw5RFgfNprat8g=;
        b=ULyWjZ93bl9xeXcuOK3w/8WeRgKUFjWcDvWDy7EPAcZUadnWKxnySsfS/+TSLxturt
         guVflSw+ioD4cSpXZEO0p50BflbPyy6UrwFdFlEaOi7U+VGL6LRDTNS2rVGClXKcDFGA
         fqdwVTVysvV3O6vyPgYKj+1sPtEtNE7/dfcWgLnceqMiwjzlMBKM0mcV2YmmjKXBIQmS
         9mclm4uPqRyQTvwyR66jw68XyKbvoJ2ucHI0ooFj0aJJSXNckFxXQzQTD/pKBnHqR09H
         dwjMIO4WK8PcdxUZJfdPKH+Wl+yrQxjdcgVA0p3CuR6ZkiHTlOH6ajMdUFdAyR5Ap7gX
         a8dg==
X-Forwarded-Encrypted: i=1; AKwUvBz96QfJmB+uUdJfG7DGU1lseS8A0GPysRZLJw9n0ipjfKx6mr7Jwz+q7dbmjWzDQTSoL3uvY7/vDuFiRC0=@vger.kernel.org
X-Gm-Message-State: AFuF++kkGfefJ7l3O5NM1lRLLHD/F7caq1uv4wAy6eeATLY9XqE1LlfC
	Rd3mVRjC9GTCx6Z6cSQJ7TCdw7GnGVyhoPoKktgEAeM/MJCTeZIBySkl
X-Gm-Gg: AYBFou0ZaFA9vdSyWJqxa/lEKqFIWIkwwRy3AhEG0ymP172Dj6pBTS3Fg8lus/SQChF
	t2xXsDY6V3XPKCtp8wGq0kmRCTjHPh4Rb+heztDF87UVl8N8kmLSNggG/ymf/49W9gN0jJcogdu
	BT2QHiBqcnzdVcgzxu7bOc/uJjoXoFEgaxKYrqlTgsZIpGUEs2duKP0z4ltSexRFX8ZNyMAf9g+
	LFKiJKWw2ymwf5AZvGNWbb6rI2TJPt8Z1SR90EP9+9EWlEzDwCHzngDLBTSF1ACO1uL2xv0UWmr
	RqsQPUCX/ppEhWouQi2pFudqbru5iz7+XfP0ScwzWCZSMrk5Gwvklli6jy0PLUynfkOXl/6ARgr
	Fsbpp3Fq7Wm/EXBvwK6zyY9+M8S5BD7gh8CgKK9kxsjuiRnX9qmnajpnNyJmPVwBRU4BBxbWFL3
	DB2NG6VeLfqzpNnS2i4cpX7TcWvChvRp+0MoO+SPh/v3kRNsdN9RqO5FjeDtipfXy/v0DuYGT9I
	XNinMaYet2lMAPzHT5YNBmF2g==
X-Received: by 2002:a17:90a:fc48:b0:39d:f5d0:88a7 with SMTP id 98e67ed59e1d1-39df5d08b93mr9931365a91.15.1789461894767;
        Tue, 15 Sep 2026 01:44:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 09/23] ALSA: hal2: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:10 +0530
Message-ID: <20260915084424.1007757-10-hemanth.selam@gmail.com>
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
 sound/mips/hal2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 2beb6a0dc3b7..84f265335cf9 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -375,7 +375,7 @@ static void hal2_setup_dac(struct snd_hal2 *hal2)
 	hal2_i_clearbit16(hal2, H2I_DMA_PORT_EN, H2I_DMA_PORT_EN_CODECTX);
 	/* Setup the HAL2 for playback */
 	hal2_set_dac_rate(hal2);
-	/* Set endianess */
+	/* Set endianness */
 	hal2_i_clearbit16(hal2, H2I_DMA_END, H2I_DMA_END_CODECTX);
 	/* Set DMA bus */
 	hal2_i_setbit16(hal2, H2I_DMA_DRV, (1 << pbus->pbusnr));
@@ -400,7 +400,7 @@ static void hal2_setup_adc(struct snd_hal2 *hal2)
 	hal2_i_clearbit16(hal2, H2I_DMA_PORT_EN, H2I_DMA_PORT_EN_CODECR);
 	/* Setup the HAL2 for record */
 	hal2_set_adc_rate(hal2);
-	/* Set endianess */
+	/* Set endianness */
 	hal2_i_clearbit16(hal2, H2I_DMA_END, H2I_DMA_END_CODECR);
 	/* Set DMA bus */
 	hal2_i_setbit16(hal2, H2I_DMA_DRV, (1 << pbus->pbusnr));
-- 
2.48.1


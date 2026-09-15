Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C63B7767
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461914; cv=none; b=BB6NGAtowOmOy9OF/I2c0zHbJofEb3VFhqAxacTLoZLqX0GjGWzgWq4jqqCQ9eNdwdVLzZw21XyK4FFIj6034PY8izvmJKNoSsNax2vPxodKQM4py09HupSdAP0mApBbl6RTHJYTFtvU1nkBOBRbJEDAmk2KTv+X8WgtStAduh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461914; c=relaxed/simple;
	bh=mTix+tHFqz/K6EHXch/VXgMJzAY/s6N3yALq3Rr1p2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W44UPCZ0wSiKqyC0nt5PhGbnpKUn7ZEMN0tRbnRU4Bg5qOCckDw1gW30F7VSgOB5azS+nzEHyg9n1I0xs3iwWpKU6bamgwv4BjFzXKX7a0cfWvzzEWXIjmjoPrf63e9OSpfGuE6DE1aOLdd8DZFOnlt8ixfJjJnVic0ureH4CL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBl37h9y; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBl37h9y"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so2592106a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461912; x=1790066712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9TZDSMbnuEhFGKGm7MDVdWVy6UrGTdWqyN+axgcMGY=;
        b=JBl37h9yCKJZHoObtnW+g2mGo7vxu+J7lJtC3SJ7uEaOki8O73hfFwyBgq0EshkBao
         Flir/lwzmAf80rNapV4br6lOI6dikVEGFpI7K904saXPq2js6SoKZ83AVkyAchiegT8X
         z1F/aGriSGawUeAC0YLRUuu2fWudCE/H1JnokJY29x/QZ1OBIGJAmnnkQMmg+QD0W3Ei
         ClOm6TvecQOj44bmRTExkDi7JoWt4XR/jcHXd0TIpgUcNrR5/8fJSXiWyyrll/Yy4qwA
         tAIMPqoEnR5rHgduwOtsGTN4b/SfwYJeoXCxxRU8yTBkPeFtEfCzVvrtdunoPCH38WYo
         Ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461912; x=1790066712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9TZDSMbnuEhFGKGm7MDVdWVy6UrGTdWqyN+axgcMGY=;
        b=MA90u1wL2fEsnEAv/LsYYp5lmoLT46ZWwmNixafvO4kqcmH9VRKu9n/xFIUMZhaTZj
         L5VIfyU5H/TrW8lSA3Ug0D7WTTMCk9oTSbO/w0LAxyZEbL3HcW6m1EH0PGZoYvrfYDUT
         2GCckiT8huQziwGk6ZSpEhplPy3Z5051zoUP10aG64mbx0waoTIrDCfR25WB7yzq0V+E
         +0rEJXMpNdhPvXytjhJDkKDAhmWW2sjEGXt7w3JP237uhxJm8YsDB6gqieiKMYISpc3e
         PLIIeWXPBBejPxM/FAJtYeR4GE4t+ocN4yjqsxvdte1+rU08LNrwocYj0M2IGwnReMgI
         r6NA==
X-Forwarded-Encrypted: i=1; AKwUvBxi6cBHoUH3zrlQegon6nf9F9h9S1txReTcIhWh6Z1DVk7wq7qswnJsC3VY0/AbLYRCGthcRWOTe9Re/b8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2MWlRzwNMGH/CXBT6TEIjDz5smg1fPkfG10hcycmIpmKHI8rY
	k979QBHzi/7850cCSBlASJKccxnGHnG3gjLFewga5HuqNuL0iDYY1riX
X-Gm-Gg: AYBFou2DfYwqqKWaQRotSysV/wvtWf9VcQ2sg+7gcn3ATAfFAWr6CdlZ7NPE8LYwrkn
	X/z5O7fjM7D0GIPdT0WwWxy85zCFn2WfnyVwSkSDv8gnEcLi5/I8fcdIefXMg5EnXdpPt8Mg+Ax
	CWh1iS4va5M6q80hFvgLl1/+2npuRW9QGvV6B6/K7BfKA2LClMPvuDO9h1i8cvAaFsukdBnvR+l
	BX16915jmWxcZhPRUKRKxkRRagVW+SVK3o2q4EZvJnDGCHrvWTqO9iWf8a1/0rDlrQHUkyFX0/T
	p9xJvtWUFLd7WTzrgE7GUiaCALqmyXctVxTPGne5LkEvuU3LkDFTxaLcS3P+OTdz8C+kBX8SdL/
	OT/5vH66h/KyusC1rIkPKQKUrRzGPwIKSv3FuSx9I3DcDZ0O1cTI1nCFh7BIjqcb+91UnUd1zMV
	8QdEBhQoXkgqKhahgcc6I0aRkw59E8s9AwcshZVX7qvTI7XhHRxCxQT5Q04xFXQ8uoYJcKdAEDG
	WHZCsj/b7yfgJO134d1IEZV0A==
X-Received: by 2002:a17:90a:c2cd:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39df2a10424mr10369646a91.15.1789461911702;
        Tue, 15 Sep 2026 01:45:11 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 15/23] ALSA: cs46xx: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:16 +0530
Message-ID: <20260915084424.1007757-16-hemanth.selam@gmail.com>
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
 sound/pci/cs46xx/cs46xx_lib.c       | 6 +++---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 19a6927c079d..a16586f7d913 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -315,7 +315,7 @@ int snd_cs46xx_download(struct snd_cs46xx *chip,
 	dst = chip->region.idx[bank+1].remap_addr + offset;
 	len /= sizeof(u32);
 
-	/* writel already converts 32-bit value to right endianess */
+	/* writel already converts 32-bit value to right endianness */
 	while (len-- > 0) {
 		writel(*src++, dst);
 		dst += sizeof(u32);
@@ -474,7 +474,7 @@ int snd_cs46xx_clear_BA1(struct snd_cs46xx *chip,
 	dst = chip->region.idx[bank+1].remap_addr + offset;
 	len /= sizeof(u32);
 
-	/* writel already converts 32-bit value to right endianess */
+	/* writel already converts 32-bit value to right endianness */
 	while (len-- > 0) {
 		writel(0, dst);
 		dst += sizeof(u32);
@@ -3039,7 +3039,7 @@ static int snd_cs46xx_chip_init(struct snd_cs46xx *chip)
 #endif
 
 	/*
-	 *  Assert the vaid frame signal so that we can start sending commands
+	 *  Assert the valid frame signal so that we can start sending commands
 	 *  to the AC97 codec.
 	 */
 	snd_cs46xx_pokeBA0(chip, BA0_ACCTL, ACCTL_VFRM | ACCTL_ESYN | ACCTL_RSTN);
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index fd19365026b4..71eee5cb478f 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -160,15 +160,15 @@ void cs46xx_dsp_remove_scb (struct snd_cs46xx *chip, struct dsp_scb_descriptor *
 {
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	/* check integrety */
+	/* check integrity */
 	if (snd_BUG_ON(scb->index < 0 ||
 		       scb->index >= ins->nscb ||
 		       (ins->scbs + scb->index) != scb))
 		return;
 
 #if 0
-	/* can't remove a SCB with childs before 
-	   removing childs first  */
+	/* can't remove a SCB with children before
+	   removing children first  */
 	if (snd_BUG_ON(scb->sub_list_ptr != ins->the_null_scb ||
 		       scb->next_scb_ptr != ins->the_null_scb))
 		goto _end;
@@ -1656,7 +1656,7 @@ int  cs46xx_dsp_disable_spdif_out (struct snd_cs46xx *chip)
 		return -EBUSY;
 	}
 
-	/* check integrety */
+	/* check integrity */
 	if (snd_BUG_ON(!ins->asynch_tx_scb))
 		return -EINVAL;
 	if (snd_BUG_ON(!ins->spdif_pcm_input_scb))
-- 
2.48.1


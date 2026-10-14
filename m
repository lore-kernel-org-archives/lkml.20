Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5654F85D4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977360; cv=none; b=EBPvwng6XD6Tw+saK79bQzDJRRCCVDoqPTgLY22a1CnXzsd9pZTV7JR596kgoaRHKLr3JooYKBFVLpT4pwPdwAZeNim0GOvtk8Nq0WYE1+7FlMjBQ6TBWpw0eJjSc3ENizOEAxvVfaYWn4nI3oZFDFSrMfHV448JYy9xAV7njs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977360; c=relaxed/simple;
	bh=FrcNfdCGRXQV2XLuFfm9IEUoceE2LS8bhDtNsZ5LcbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhOCT1mKJuWZFwy01rPEgeiJuifIFeZ/Ag47Y5/rbt+2LY4qF2VsDacyDbZzMUmDtNLPSab33l1swKf13wj2MwWkXIMc9S+UVcFC01zHBu9yI1BcxQmigvtYcg4o30SplnVsPfSEFHDiPbC/5uuMBke4xmGVwpIcTalukGs+ETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iX9P7zfG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iX9P7zfG"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so3024035a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977358; x=1792582158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1sL5YKW6sSHwjhzZoNxtMN0yJVPNXRcLgVr6dD+pjE=;
        b=iX9P7zfGAYuilMuyf5vqUXQNN7lDExOPmDZBeyF0mK5ARQDUe+GlDOIAr0w0rGwqZg
         hnXuMV8K+wYqIyAFq5gaCOg1eDYbqmXrOKa983QY0hDUF5EeM98/ef+0bn+iPmSwVe/R
         06VDGXcfztQwbZYYJa3ugFnqfIozYt/anbx2fDI9UgxpsQ10NsI+LbH6YzSNUzaMkj6b
         L4tzji7NGsROFcGrXu+FJyA86gHRrZwBCfhOR7P2saPqugiz8ciyNkKur9cO8A33Pfs+
         gt20f4c4N00qaPPtPechF7fsgHyEy9lRXT0smBt7/MrohmOBBa6q9DjasSTcG5nVbxfi
         h5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977358; x=1792582158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1sL5YKW6sSHwjhzZoNxtMN0yJVPNXRcLgVr6dD+pjE=;
        b=Xq8GqqZjzmeh0Ibb7Bc0nnBuV+FFGN0xTgGCJg9Ch+NmGyaznxgp6Kb/HLcrC/XGm9
         a70kqBVU5OhGRW5XfHo9573EHVjkSllURGwx8C0ja/0xRPRpp5z2vkkQZ2gCeahLE0Hh
         AilQLaHef0WEX7jQT7GikbqBXrJB+NYKpfZt6d8imSyovShLgGJfBnmcg2YUubOMfN5Q
         6JZZsN4K5REStyC5v2Qpp/UHWCs+JFuUr+6CCBkFb9rduLX/n6t5kafXJvSpa/6iqhc/
         624YpOxnfSr5Gqu4x83dkPSfPWKNmFsP1skCcDGymhfPPO4zGtT6ldZ6iMOJT7lwa1h1
         +TuA==
X-Forwarded-Encrypted: i=1; AKwUvBw09zeBuk+ZpUxVhMSi1UXdad4dbL33uNHEXrmullrEanYBnpgf3RvLuSrw/iYBycEF8yFITtu3c3Y0Yo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBfW5CjnkId1yVaXLIA5fqWv6jthotxTWMm9+fZgpoJdujVSm8
	zJXn5H4saXLJcaLI/Sk2C7nigZZGRi3pEWmiIFxIbTIk+xkCaOJwfn44
X-Gm-Gg: AYBFou1mBATzjixqdTuK+xM2ES1yYBG70d1PZh+XLBWcH5w/sLhqvhi2N12hlHT+bJG
	7zBpBwpywWNnbd6BMxmjm3oBpgvtG9xT1hTW3SwqcLXXaTomSQ9yt7FRuDZ0coK5tdEfcbA4tUC
	qxZhxymekJ1RAs/yRWfeswnhPCNbEE3AyRxFnYT+j8efl9wikGVbCPSOtReHtpMeVfJVdAdqRwn
	CaS0UzyLODtkpPGWxPaYWujslv3fIRrXP71bS3NbuAnnDRWzJCzV/GQj1cnryaD5XGRlcfLiGvR
	/8fZkajeTg1iWnBBqQrmlaWMynJFadxlhUCIXgrO3rUbeBhq9196TBarBYVKdk6HoDoeIRkR4OC
	lN1FUFTCUbTgNS96IBqQqC/naFNTzEp1Rc4FX5iEKfBCj0M4uW7/vhqxrBWIJmZ1ork3M1dQccV
	/789ufXpzbV754hYKfaae37bFo8s9s52l5+ln9pGAR/SRcE9mDGWyXiSCYRgwNJgDLVxucI5Fb4
	3L55KYtjNlvVU2Gu97LPLqCgePXWVaK7qg6Ham63bikr/blwwga1Yvbd93qgpm0sDOFWuygjjd+
	qbvgTGhX5JXP5wUf8iOHmj2r
X-Received: by 2002:a17:90b:5805:b0:3ac:8446:c1b5 with SMTP id 98e67ed59e1d1-3ac8446c284mr408851a91.31.1791977358023;
        Wed, 14 Oct 2026 04:29:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 11/16] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Wed, 14 Oct 2026 18:27:46 +0700
Message-ID: <20261014112752.683032-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 75d4d0578bcc..13e5bc02fac5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3132,7 +3132,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0


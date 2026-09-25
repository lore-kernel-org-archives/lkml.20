Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D83C98BF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311863; cv=none; b=aDbIxwb4+s5J5BizR/iG/eiFOm/cmK0aolov2eqrVQ6UoacWGmfdpFnJw5MS35Gm32D7vPhgztrLH9PefvCZh+4moMH8Cab1RFHLQycusy03U/2FY5Op+axbusKjJRJgqQiHleXfLUkgxcg7s7Z0seBMrq6xV4H1C/4PYg8//j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311863; c=relaxed/simple;
	bh=R4W/s5gJc4IPH9tGG0NMkgYOTqk1l/A5nm8KgAntf7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdKJN8redhvf65Hgbb0SQstpV9K39mk+my/P3k9bCvlM6nLpoFimhsnmHRFL0matqJmdjV17XBMBD2OGsF9E8+nmr1x3AhOmwuuU6JDc38VEMBLRz94V+RR6O1ibCOA9uCnywEp8J7ol/PNhVzOVluyU35OIhabzCWiiqhqulpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzRrNepT; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzRrNepT"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78e1a94b8so45991a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311857; x=1790916657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=CzRrNepTW8T6Q/S0mNOKV9chHEu/BXRYCFPv80nOxvDiqvGtOpoII2CK0I+C2yR0nd
         VjAla9vykA/UVwA+VijVGeK6hr9D5xjBvvLX852EMcXwVD9EDxlZoHg8gBBmqyNc3JKo
         TQye1uD0EA0BXor2oXkjrAX1uhXCfYDQbNPquH33dpKBRl1+kjiVo6B8NnzLWfqhPryx
         Hbn6qyrlWtrowWdMUpxmKy7H9DJFtBXQgv26DY9kI29Ks70Q11ZT1LGN6iT2hX2a+SkK
         FXKpGRiyzzuoFhhrHPOPVHf10ICYS8XpSVuX58valUHXvtUvV5Pf03RWteMm5UPtKKrO
         iAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311857; x=1790916657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=c0qgqTuWzg/MwYbkBpFUODqT1/jqVtNqfBC48JDxLzzvvuWOIkFZrJihKXQ1F1JkY4
         rbKnMx1Ta0uui8YzX1hhshoWI/9YZbmymvsLKLb4hn5yn1s1gayg0DnUNrPQoclmb9YS
         eGtJ1wq1pXv/l3eVzQa2r51lfu5KMOMaVyBf/YjSI/hlgxfVHQbNC10kL271YGYVpcp1
         HqBUm5O2wVNNyC4K1Y4Q8znPHWlzHTiq3HrNDxiMmvzGsN+oYIzJlfLWU1Ls/RGjbNBV
         d1c8gEe7sVZKkH521aPWv6FPWtKU9NnzEoKKK8v095YUxuegM70TbMp5ymQwZA8OMg17
         1WVw==
X-Forwarded-Encrypted: i=1; AKwUvBycrS/y6Ziird6G+pfY1Bn37Veyw5260ClXhrk+XOH5LWvMwdH7kh1lrt1b6HtDKbAVW0ElYAmZKGq46mg=@vger.kernel.org
X-Gm-Message-State: AFuF++kpcHnaw00hwMBh51pgnDI320xeTAdx+JVlEK/Sgdbb/AO25xFf
	pi4Mu/974SPojGuK93gCcfI/DM/ZVQN7f4zEFqbxq13anSfILCWJR5n7
X-Gm-Gg: AYBFou3e3HPDMhJmoElGQ2lHwjzlCOJVPw0RBetQLBo6tFxFgl7+Row55sTFzMTiar2
	aY6FtMKAW64wYtENLje+ZRPGeBsTE7ebFv2/i8J810Onl5ihcg7ujs23ERIscIHrNgDK6HZ8l4W
	2rrpmcOdjq1NBpydkub631mdB8K0H1s9OwvLoibYRAKX9k/G9AxhxmEp51yvlCGinajywJlYXIA
	FUbuTFLbGqOM2DIEBrjtvzRxPVQG2xzzP3yelBDaGVffdrE0ldvwIZVCqCgVQSvikVSFMcly/W6
	wa3BiKzF+Qc2/ymnRnaqy5Q9OekoYgmVyJAydbHSFo2b2gBld4xsOeNbbMOfZmrcs9lxaHcrlah
	Kd/wwF8vmX+W487vdSkoWBYlPhVKaJUbCx21A/yK89SXSw/VZnNS4anhrDiA4VtS3iFLmp4B2X5
	f4cl9peBMTbIEO89x/TfPm6RI5bGa7J9VhP62Alzy2bufsGA6uy9i3PyzLA2ISygw2rejdDZ7iZ
	PVdhDbjkm1AHaxEG9WV5zv9P526psHm+OLXOJPQXm/h5fTXM+jX2OUTbdU8UZPzCibQX3xehAAl
	Lu7XBFzg5Ghvig==
X-Received: by 2002:a17:90a:d643:b0:39e:6a7f:1dc7 with SMTP id 98e67ed59e1d1-3a098db98a7mr4301609a91.35.1790311856643;
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Fri, 25 Sep 2026 11:49:08 +0700
Message-ID: <20260925044908.450775-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875388;
	b=TI2WgQaZSQ7Zw94o++Zp5IBJQWMUaUP8EPWjf0nKUEa2zsJ9I99cu8F9m4QSrsd8oukZ
	 LPPheXCujNutUT2RLVHNzt6hjN98Ff2Q4jLS3p1+astHQnRwQ1Ed045TtpqigddYHi+FL
	 5XKxLi7A5UPUFTCKBIVvUNVdWH/YeOtuVQCoS6jWrQk1WDRjN3eHGX2tmXwZY0DJg7dKC
	 21JAK3xifqwdJCXXu5NQhLZPtIn4Om17Wk7Joken53CxestltNFxvRJGcmhvJkayJBRAZ
	 bPq3uYH2WQjGdKBfdqIHFBObUeZn/cG5LTNA/7X7HjRk716ojhy7e+ghCWAp0eBT4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WU0mTIuYpv0rehcbLRaasNOk5Yx7WkJzHYLOVNfF1wY=;
	b=bkcGunMVYHRjeEPLF3QB2TFEa6QATcVkAfPoFUpgJPDkEd9Ixlr/T9xUGsa3S0V2TXdZ
	 r/7/ZhJgdDJ39stFDik9oo73cSDGgtzk29TSCyHUxIJ0yu7h+f+RFL0g/B4Mk25askHJA
	 i3F5bqU36S3audldyF9FkwPf4Td3XbLuw9aXwU8XT9BxAICQDba93gimza3bZO+Mlm3BO
	 X5uF+qm+tWALeAlR+oMmAXygm+2oAsXUWtcF9l2ki1HEbDIlnuefS5UngHk2KhN1d4gXp
	 LOSOz4SRdOeD7/0fU90EZ9uQFeD9Uk5RV8oM6KrCpYYUczjPMlWnJQsfPRXYYTMcrzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsPaJdrf;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200E606D81B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1200E606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsPaJdrf
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2909941c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875386; x=1794480186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WU0mTIuYpv0rehcbLRaasNOk5Yx7WkJzHYLOVNfF1wY=;
        b=TsPaJdrfPMNSicoio0TvfmbAOmwFm+KsdgoBDi6nJGpBVwhhBbxcGnOIAvtheSdFFK
         R6hVLA094QGG/Qc4t7zW4+xsMUQ2jpeKVCadXZ0rt1dty24liR5QDwTrI32ynBQZhYzZ
         /HaBXtJLkeLI9QA92GbM742hUAQk0rshzUxN1oQCWxDXi4VgdeEAsGEFZe38yABq0mlR
         D8TgJVcGj4GlOQtSeW4DLx3TRgkMYQnqHNXl+xdp41B3BEhsfdD+iiN9d2490tB/U677
         ZOBgEdqRlJTAz+PEGiizuSNw208ie6mX5HjaJWcZn6MLhJuJ+yEq36DIr0gfDUz7YWIv
         fEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875386; x=1794480186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU0mTIuYpv0rehcbLRaasNOk5Yx7WkJzHYLOVNfF1wY=;
        b=VgyAg2fI7ubPlSYvbCHnV999B7rE9f7BpCXTgw02hk52dpDFhUyWTZ/54bNhsQZDh9
         Pmwmh6GkYv5o3nx3kHJBTYig379F+sxyXWbYk+M8bFpheFVnRulBbyWjvn4UQrI37dp1
         YhJ+T2Fzy2uGw1CP0oijYTCnRn6bQlQUo6QGO7lqFTybLOkfbCsk9iJkoOPFq8lI71/i
         Ve85J0l0QJh1KqdYH1Hu/z52jaejWJ+e/ejBzhJgHuTn7wCp42RgPxvCluqVNhHspshx
         YZdeP59ybOalt4rdDeS0KUYrv3cE+sYyz8FNvniyJ7+lc5Jz+/jZP1VxftAPPW5NVahU
         iIxA==
X-Forwarded-Encrypted: i=1; AKwUvByS0rY0DsHwrTsUE3rWBe/mDYpJfVDzpGH8d+zBWpv039ewWUNzEdDiXnuHcZAh+VostMGf8Any6TqJ5qU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ez59cEpA6WJE0/7S1eSHt6zQRq5sqwJRTw7YX9e7UgkjJoqf+
	n4RWGzgiuM5ZSDeGxcltlxRDBm/ENXYwXv2oGckAzZoXKpDoVsfit85UO9Vb/A==
X-Gm-Gg: AYBFou08YLbKS0d5+TJ0Tg+gorOgCoHiNaHGuMn9jJmjxYM727W4aZltB6MO2XyqOyN
	cl/Y8/dJnq496PVfiL02dsjCKF3GCi91Vi4As4Kr8yx0SbFsoYVc10Em8a+PxqoELnCz1wu4rpG
	CGog9jFNT4lh6Vvi0eAT6gh4u2Wgrvo2WUf9eUMyyiKlfWD6opCLNS/j7XW6MCoqnXd/jzRtHqg
	aGAKdD+g+b2fMWIJaXaFx15fBtK1EOtQQ2/Ti2y1LylakIGBQCZ7mbhqY9W6H1uLNHHb1nHs+Lx
	xk3cqvK8z2KGNLRF3K9/Jb4L8Ah3WP2ZlHCZFvNOeB7pDvcZ1is8AiBw4++zT+7DlylJaEkP2bx
	OA4mGudzVA6IwfOd1hljiG8PtLbyli2hoQ3wi4XOlbDZ9xkGVhQdNr3yPh6EK2XTVdURDTz9wKu
	JNKXb3klxH6er8kyV/wE7hAAvYoseFccABAvPEWY154BZJ7n5yvmimxcpdL45LPSGBRdFHHUqqN
	oF2SnRb5iPtBuVuyt1lNhQ/Fr8xv5VBLwJ2vo4si/FaedSdop4QHbtTYuFuK2vyRAttlARRo2ta
	aeD35wQzXRvcfk5mjfAH4BhC2Ykt7c+rwg6mXB9vTHx1eKChBVZucHlr9/09cw/28cruM2aywOI
	XfO2mpLpzz2RhoFHzFeng2VEwrOJynfRSyBn+d/sy8JWA
X-Received: by 2002:a05:7022:7f0b:b0:1a7:2ce7:ad10 with SMTP id a92af1059eb24-1ac5d69f67emr26766196c88.44.1793875385784;
        Thu, 05 Nov 2026 02:43:05 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:05 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the driver
Date: Thu,  5 Nov 2026 17:42:27 +0700
Message-ID: <20261105104237.38542-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

I've continued reviewing the FSL SAI driver and referred to the
i.MX RT1180 Reference Manual when looking into its register
configurations and behavior:

https://www.nxp.com/docs/en/reference-manual/IMXRT1180RM.pdf

Link v1: 
https://lore.kernel.org/all/20261030091404.18757-1-phucduc.bui@gmail.com/
Change in v2:
 - Add five patches covering disable handling, documentation, 
   ISR error handling, BCLK ratio validation, 
   and preventing incorrect CHMOD writes to the other direction's xCR4.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
  ASoC: fsl_sai: Use optional clock getter for MCLKs
  ASoC: fsl_sai: Remove redundant error messages
  ASoC: fsl_sai: Propagate device tree property read errors
  ASoC: fsl_sai: Drop redundant dataline mask AND
  ASoC: fsl_sai: Warn if TE/RE does not clear on disable
  ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
  ASoC: fsl_sai: Check regmap_read() return value in ISR
  ASoC: fsl_sai: Reject bclk ratio smaller than slot width
  ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4

 sound/soc/fsl/fsl_sai.c | 89 +++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 40 deletions(-)

-- 
2.43.0


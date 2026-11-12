Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480701;
	b=AbUvsDugd9BQReQYVQjwQYAp9cprOSaPBFlBJ1pU6k2IEKelAG/sJ+j4ODn1dim6A8qf
	 wU/YwNUUeMWzR64j/ih8PkZDaPWC6MXmOB4LrRBy0pg0ODk0CPYWlNa8heLI4e4r/ZAYq
	 iZOLAnG2mo/9GJmxFqvHAAvG36JAIivkP5xSq8uvDJARRQnttBLxGDiZIjzPh9yUOyUXM
	 ndfAXtL+V5xSJ2hQnFFPKl6NFZR0qGz2kC26mNiG7dyOUZdC9QiGQvSP5qUAIjW4wox00
	 EBZ1mDMQv2DOUTD1+5uuQkJQB2PILxC/Yf2Y2WZ1JUK773RowAZcZAkMmFyfgzDJHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
	b=LnwQBnaja50PDf49FVM5SXGGUWJDxDxVlSW/Qgc0XpHAHfKxtqShB9SsAz4ATE5FupTG
	 NqPGEr/Jri1g+/prrFCth9iCSCeROOhluoMP9eTVbqxIHE/jO8T4+SfVKuI7IuLOkq1te
	 YIdIAaJe2Wlol5orKqvkarEBOrhrpIizd5W13Ct4xiX0JOEYs47huusantYMhAMnCqCOm
	 5aPajGyvPmaHuQlcevcH4l+Cossni+xwbrKbpjNJXLqEWjfytugbFsHFMAO7484Mb+U9d
	 XIuZTT9Xxjm2H1KTpdkUhByFlQ8O6+RAzpD4ikHLNWrCr0LyfJb4B8M3HLk15KpQ7Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5Hzdpnv;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7861D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5Hzdpnv
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so8142440eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480701; x=1795085501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=W5Hzdpnv56xnGSIdF7f1NnPQkvWUeCCH786P89ze4pD0moAfYHx4RmVKg32LSkXPXT
         TNv2v1OmzKNNKKxh0u1IZHWkUvYo3XGEEFtjhWl2P3o7VeFSKMj64vXsp2WohnuhFv4I
         8JNfsE1vani2GhMRVyuwMWHDrAKEtyM2YYv0K47mj4qF6mBlTF/3iLMg9EuvRrE1YBLG
         W8ryjjzKc+mM/09CPYIrl0mPiUsaBZol5cZe8IyuxH2958H0QJo9UKAaqUvQP7tmkVct
         RHdm/5HSftbtPpc6Uprb8y9mz6UJOJ4h+zyBQS11yctNta2Lv0z5ewB73vq5YMi/35qw
         sKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480701; x=1795085501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=K8XAB5HsejH/XCPoWAkIVOgyNeslGCdmNMvVeyYphTgay/0QTlg49s6QMXNX0XlTyX
         tiXithnkUwUl5RO7QlK6PrsFCESFjJGo8x0cJ0/4F0X6Vjf8F963S+QHN8VbJa7Qts4F
         E+ATsz7h/VA+bxECB/JV/onCIS6wW2ljTwEZfwD5HYLn30jWeSEvEQlZEE6tCEy3Z2fG
         HXmStE+6+Awc1i0rZETyLDW506BRl/H1s4i1AKgCLKUEfBQEXl/Y5LQxo0M4wpOcwdnT
         D1rpfzsca9Z0qqxbSxcxL+eOclx61bMSoBC9W5rRHj4feLlu3OzqQWM1i45xYr9JL7Or
         xTDA==
X-Forwarded-Encrypted: i=1; AL+hErHobjyLayg4PiwhsUMMmFjUwrwKt9zyaS2f0P0RHW3MpNrn3mYQbwZRuIpWYi1pEJ0b9x881S41I3j8dRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+s9tHk383UzWI3TNN+kz717rvZjTKp29SedLnbT/8B+NQfW0g
	wBLYyfQEwOa7OeWMhacsJQoOQlHRwhEgcA55cJpWM7ThNWD/PL+tZOYJ
X-Gm-Gg: AYBFou3ANGrhEvH49riKiRa5IIF6Po1Gy/ZtfULIJewAr69/Y2WlW2Qn7DmjYK3aG70
	noFm1rHWWzfSCEoaSd/AZ3VT7woKAVUOsXBiAuT1QRwu/XqC79i+/PVQwW66lBGaeF5V1U9eAya
	D+0bMsfunclwKpaEWEb9HHwx+x1VnQq7DRQg3oK9GQ9QjhqbYbNmc0HSOE5zsSlT05O8Iib0lma
	6LL6jodQB2D5Nlg22gfN76+oPqPMQ5S0U4uUU50iBsUKOXHL+UVs76Uz13EgzN6ZSSQnrcsrJ3e
	L0RvNiE0WlWEKXsjRzYNT0RyMrLJPY3sVaF2DF6oUK0KVxUzOH6BWX5ggzSII/OVAMUNYOJ4IE/
	qYQwMsbTCA+fZexCxahr1WRmrgWzfm9zgTHbeHXdTO4CmE24UDyk1OrbBj02yiT+vxQmxJlWyto
	RI3CfHn07qqwwOuPkM3n4c2x4eLq/uvRtl1oXo0NtOZcE8wgCw/DdGoOA12uqWrqsf+ZekerJaB
	TDKp2C1Pk9/KbYwVdZ/p1att112Mwvn1K9Hd5ZHAnIfLyjJ813edYNYX65Pm47r1kkRFDR3Jf6E
	FrtMse3nGpnpvDoZ4Ql9QrbrTMiEUeD7T74YdEdYlrIE7dflm+JP2Onjc5DINe2Pf9hlb2fiHrr
	QkQK2r5LO69apcrja3aVKa9P0Y9lifWikXrcAFca9KNi8
X-Received: by 2002:a05:693c:69d5:b0:376:a6d7:8f60 with SMTP id 5a478bee46e88-376a6d790bdmr5227192eec.40.1794480700454;
        Thu, 12 Nov 2026 02:51:40 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:40 -0800 (PST)
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
Subject: [PATCH 2/5] ASoC: fsl_asrc: Fix handling of deferred spba clock
Date: Thu, 12 Nov 2026 17:51:13 +0700
Message-ID: <20261112105116.32274-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

The current device tree binding does not describe the spba clock
as optional. However, the driver currently continues probing when
devm_clk_get() returns an error.

Return -EPROBE_DEFER when the clock provider is not ready, allowing
the driver to retry probing later. Preserve the existing behavior
for other errors.

Fixes: 13b8a97a760e ("ASoC: fsl_asrc: spba clock is needed by asrc device")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 055593d5d37b..c91ffb5e0c5e 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1315,8 +1315,11 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
-	if (IS_ERR(asrc->spba_clk))
+	if (IS_ERR(asrc->spba_clk)) {
+		if (PTR_ERR(asrc->spba_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		dev_warn(&pdev->dev, "failed to get spba clock\n");
+	}
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
-- 
2.43.0


Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3003C8C49
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311841; cv=none; b=mQUVr7YyPWTUG4FDqFpsTHwQrZKxssMbfBT/P4Af+lomLdvwr0CawgZWqX1xVtndyCddKEZmZywbJNSFPuDrxC8EJxcIp48DbROEifxLjBGdDIo+Wd0cJTBzl0lV1xJlEeX0AmLFaNo7c+AFk3VebRwqAD4pKX4NYaEi6GTcgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311841; c=relaxed/simple;
	bh=ypQXbofgJUYSU/ugIyK1wgNOcXryRiZTUAAMJdAgMxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2jbly1FEh0mWp+VtW4Qxaa5PPNk3JhMXdI1n0tRL4n4ZN9mvkmhwWyGdvNn9J5NUasT2tpPrH00qX2bEzgObwszIXWMsQ7iOu6KhnrToef6w4DlThR7avNhmegGuGOcO+tvz41Facpfu016XBZFqXEFYdydkn4txO4iY3OAJgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDMp7irg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDMp7irg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so359184a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311839; x=1790916639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=jDMp7irgzhxq5JuYWCIjqZbNkqW5YuhuQY2+2q/bVUWjBR2b7SpvHWnTTM0M+Zb1jx
         3QxKROAtY82SW5kCyH1oQGygTy0U8bPtlCg39s96MrTnBlexnV9Pu+GHNFISCglowR/U
         K7NQoQmMnUDyi7B2/+FQR7hAAvAqIYoUZjmyM4NQRYLE2YGXys/mFAJHqqX8S9q+ae/4
         IJij0HH0dWtGczBDO0Bnvy2BIzc8A1Wk0K1xWoQa19OSiDRdKQZV9F4PaVCITCUCUqH7
         raxFccUExQMnlOZPtu2Xja6RQ4eWXSBJaX4Fs1MRB7GeR32+VB721t1A7sp/G2C1sm+X
         kpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311839; x=1790916639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=xmtKmvptSY70NVpQmhLIkLLen/rzBQU7ykkxiR8HsfzjMexgNmy3wH1HQFemd25G5/
         cjHBxXCjY4wOj/Jlh0VBtR+H+I4jxle1ZXs0+RH8YL/bh35SwIHJJ4xXGOYzGspTS+nK
         4OPmJ/HSO/7xdwy/sPGP5Ity+Vxhq8c3qAPilbeQbKMFhB6xA99Mz8CDeCHUrk0qIl2o
         PEyYHspxQOuiiKpNVpY2u3LY6kX8jExQM18bFi7rReEWQY/FGHEc+GvyrfLlwfX3dJ34
         mpUIuw0DNX2xak7SYmJnfbvrfN6vYvsGAzV2LzjoKj/Ugg0uowwixwP+Bgn+CErH7+YD
         zTVg==
X-Forwarded-Encrypted: i=1; AKwUvBwNNofGPcpxn99XfpOur4mxNAsigEcZSjjVkEmUivfYy62mEgiaykXLu1TD/nYRCXg07UXhoa3ZovZiFgk=@vger.kernel.org
X-Gm-Message-State: AFuF++nulihKTTdkiwPDXyqVtSg/dSM0og6hQJnaqwcyqHLHCaVNj/0X
	iV1MEQWmwdn8lpQk3tdTCZThMAmUvAKG9sApWC4hP1tG/Nf3cizx/8Fs
X-Gm-Gg: AYBFou2npMV7ZSGF36bSc3GugAoAP14hwvA3fqnQna/bPrXiQzi1WqjVYNlilAHQ15f
	86OaaVaZ0c7Maw0gjJFhPLN7Jb2r8IUiHjlBHcxF3YfdG079s7gtjJdclEjOz2d6+l7x/w13d4S
	F4QaIvEPJswzovK1y8l3SC8+HPxXkvqe0hH6kJ+jW1MIDoLBgUeEOdmQrn3q8xs07IGaeVjWPW0
	9R4V6l4xfHr7OoH+eWcB5cDOjQ4rVSaZCJH1w9R00ROsX7czRvE7Z3V8Gzs7lLM5WBlafEYqVcM
	iMjM/JZccTbv1TAKtjRHxpOffX8LzS51rclu+wcGjhXwVKoJ7rouS9nb5EiQ+y930iC47JwsHEh
	NuKLO+QZypcMsWCcbxeOCAHl6ZTOqrs1LZF9TAxKV5s4tUXMgyfbIDTi5cDQY9+ouu23FlDQIvJ
	YXNNGc5Oe52XKchC478+5a8DbxqzO7vXP45l9AVF9RcVlSrqVhEX8p7iBUKLqT7yqyp3MWyuX/L
	UQ0lfIh5zZhIzs71+kUow1eFWJqxb72PLdM5c/Teq+4vk/XyyWqPVq1R1dubni2ws4VX0a14Riw
	QBfOyNisLQWgJbemA5KTkls2
X-Received: by 2002:a17:90b:4fc2:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a0c27621c1mr188132a91.19.1790311839074;
        Thu, 24 Sep 2026 21:50:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:38 -0700 (PDT)
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
Subject: [PATCH 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Fri, 25 Sep 2026 11:49:04 +0700
Message-ID: <20260925044908.450775-11-phucduc.bui@gmail.com>
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0


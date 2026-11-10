Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297563;
	b=xvVM60M35Ch6AfsHp/QgqubwGs6KFRj3Of1x39Z/J3ut/vly52B03Db6F9+wPx/1KkpP
	 7zx1Gf6STKmCeEzEND3RUb1mPhqKh7buv4zz9FnrGEGtJTRR4bU4jLAT1BS5C056ytHCo
	 /SOViG0yyiSKx1jFIwoo/37dyQalMbcos7WqH69jX0ev1eLuw9pKoyMYqiFgvFs7d5Uan
	 ZpvcvKVuk52EHla4kdoWgaO2uTgG2ZwKryHV534hBa5ET+u7wGU8LBCUMhbiXvZkTSv0L
	 BtUBpwUY7VyE4TauO1G8N9KuK4e5poogOZzy3WoUZgazWWonlMRUCM8lHnX2WP+T7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A3AZfHlonGfOYkB2NhiE9hp9NLJUEbt7yri4wujwdi0=;
	b=RYNjhDE8S0PsrDyj8gK77gIm7NqrlFeJHuGojdVNvIO84xuKj2rW6Z07kSMv0qI0VOe0
	 hzyCRH3E3ZVM1MSm/hnsbb6QQEYBmghnGQm6pr8hDUhy2XFTSq8onhsr2YNbDvKFY4qpj
	 tueykPONQclOsgKd2AGZ1TUElcuxVfGO5FtwbOuycAsr2kPSaKYhdy+JSupYCCbEYY1YP
	 pA2hEJ+8qRKRQn4FgriLSXzpYxi4WdRb+S4uRXT7ZcJEkEBSpU6anUVhJFr4P9IgPEFvt
	 0qUrfnFdqYla6tiEy6Vn10D6yJZ9im2WmvKhmT9BTj+ZmK3rv4MBiOYDwFEulJOgWFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAwMKi9X;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F28606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F28606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAwMKi9X
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fb88ea38cso2108640eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297562; x=1794902362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3AZfHlonGfOYkB2NhiE9hp9NLJUEbt7yri4wujwdi0=;
        b=YAwMKi9XFLZ5irkrMw6df8yap5eYK1ArDn2oh52v1eKdubyn5mPHMB9Nhj5WA1rHOi
         hJ5AuqXPSz8JsjNTcGh5z5f/75xHMx1PLbVrGUfDwzrLsN+mhS84jVUanS6Q79E14uaQ
         v9fxOVXXw7rfrOCSN1q0wmaGyrCpdx/OYtANVEpuiaOZh5itLfurij5UZKNkWCa3P10W
         NcHjrUMd/XcX4I6Mec7xAAfw9r47MRwzwjKRh483QMc1eAO7QfkuRrr6zOr6FV+flR4A
         IcbeNtGwgzOTm2Om22fmxxVqUm0ihqwEl7QIbZk4l/TdABRYJ2lDZFBkdCKH6IBokbur
         s53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297562; x=1794902362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3AZfHlonGfOYkB2NhiE9hp9NLJUEbt7yri4wujwdi0=;
        b=cYBh03CJWmS1goIcdW7uirOKjtiOw7lY36wYGwmI4ypVXqL0GW7rwzocZO1aKeASni
         78HuFWi6sEWYzIPp1/+kOPhpaQ2daMXq5pXZtQ2iRaYGXkrpkYiJCUTnfxIHOmolRif7
         hP26U7Ql16Jo/BM1kNla0VGJGhc0Z0xjMPxtoHGF1LDhAXT23KzurJNuKCeXmlcUwLjG
         7LHlxw52l3eomysQIwTRSEQdPW3c+5c0t0B7QZ6lvCbLUwS1i29XkVHzycNcKaiBg/TU
         c0Qe/GYlxTurXWqZob4IIfVkzi2stWf++ct4XIqtepDOScNUJ2nK7ND2a+PCmb//15Ix
         tVgA==
X-Forwarded-Encrypted: i=1; AL+hErEVl6DhseJu2BW+HCAt8ou50B1wUt5SnDzk90fZf3nhc9fmV3gUICGp1Ni+AtsJpCU/u+oOW0XA1PAtOwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NxX3Jk+eIsEQqrf7VkMdKRaRp1HcfcZx8yvs0R08A/kau1sTK
	bwl4petOwhNclixRKHQaUat2eN0gJePh9D+RtBzmnaTG124tJGc4AILI
X-Gm-Gg: AYBFou1ojEy6kANTfD9aqKQPXrpVeO9j0Vus/tufmHtY3WMOBtqLyyrJRPf56U2ygwn
	HR40w3tAqlG9qWdmZKgQkt2TfEM8V+1yDxont+Dzj5ooxCd45+6LM3M4W6hgCc8AhKWkIfsn3Qm
	1F8jMusMbCxf8evfISQnRld2sNXOfTAa5L/SLmrBReIyi9Uq61L+sHsXozSbDt50+snH1UcLBEA
	KcDhhKvjSoMlVenKk2NXnQ+8as6Cn6Z7dnSnTywhJlzbkV29bBBhj1U/8Hb3wP5TxW0XYbOeQYF
	9W5ntdBnQ10y+nPMaqu9SwwIqUPRJEDh3IVefKWuPG1DNuO7IJg2XIeXn3r1jVSroWHH7oyzY6d
	5LlpyCCB/AFuTTiSEWKgQhDPztPVDmEPxB7hPUViFLmqbCdGT9LJY7YVtHqjkOY1PSPg6JYuGfr
	0qhEQvjKiI3wDBf48JkWqrBTplV0DbKU/fQFM0W0j7p2w2cd4xRvt5Tklkz4Sxr4E5AMcVFWOIf
	PPAH2zskpU3EiIvEz7DGsouotoKcLfgLwjO4GbDLSmQ4qJ6U/DL/heWeqew2aUUW3+UTWceowmJ
	bH6EPGF7/u2OjpEnxZwVoJULWpwXImDTqSjGwgzLvc8rJRRTRFXqEWVX9tqt+TD8BXv7tvsuS6G
	tLrFDJBx//Rpr7cJAJxG2Ua8wPj9qNDg/kPQaiOay2jno
X-Received: by 2002:a05:7300:e9d9:20b0:36a:2f6c:490e with SMTP id 5a478bee46e88-37508f421a2mr2946764eec.6.1794297562223;
        Mon, 09 Nov 2026 23:59:22 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm4498321eec.3.2026.11.09.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:59:21 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: fsl_sai: Report dataline configuration read errors
Date: Tue, 10 Nov 2026 14:58:41 +0700
Message-ID: <20261110075841.12104-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110075841.12104-1-phucduc.bui@gmail.com>
References: <20261110075841.12104-1-phucduc.bui@gmail.com>
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

fsl_sai_read_dlcfg() returns errors from of_property_read_u32_index()
without reporting them.

Add a dev_err() call in fsl_sai_probe() to report failures returned
by fsl_sai_read_dlcfg().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 59c9b8c28133..16197f9ac2d8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1621,8 +1621,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "failed to read dlcfg %d\n", ret);
 		return ret;
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.43.0


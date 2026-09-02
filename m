Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170D3769F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371403; cv=none; b=OgU2X5Rh9NOgAV6CxcnhT4foW2KIFq6YL3/W5yPqer26wg3/QewIjetiFX2VU3VRgqfc42LzMNLcuKOSnCh2xpcruxYLBhyj91RM8XhVL+m6HUSsDhfe69Ga+v8mrwCA4/bg6+eOnfAw99rjCkvPtUSIWVH10gIrMZSAWzWXmqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371403; c=relaxed/simple;
	bh=1pAy6kKMkATvkj+AU3EcJaBus59hBYFwa7SSmE3+JAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y51DJdysx8sEFVJwO6Bt9WWtrs1BzrLtr+S22lYmawSxYvES0cJ+EDmXR1/ErSQA9Gs/6Dtd/rQMUOOW5cH/7KrX5CP10dvNWo7K1qvOSpqVbFpzoFIodC46mmYugXsw8XPtV/G7eCbzbI0LSODr/7JxIydxlqPlaeeXURQueHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HioRwMIO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HioRwMIO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b9320423cso13966395e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371400; x=1788976200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=HioRwMIOfxItzS2QqjfGWfqJAEwjqwyCuw/qTuiTA96re9vB8KynZwYq2kVlawWP5P
         OZebXvvYzmzkQLqKWOVVKKBdD2zg4y6/Z+oGIjbZS7vC1OItZ8tR7TXCA7Q2y5MdRqSV
         jBq7YEoRVwjRP14dylWMGz5XEz9k76XR5gKz9RHJxXJsXTNd9JW9aA1HhDmI1ipQRWbs
         1qp7baaFdshs54QY3SeEdkNTYQ1Rfo3rcR7vjB6McqZen4MaX30XJ+YwqL5aUoW+dYU0
         GptmjQWHHHuOZRCdgKVh3fiN8LbrOJAqMrhapA7iOWkqYlSsjLHFpsO4AVWdWquJkjMM
         dM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371400; x=1788976200;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=V8qR4mkiLiwqK00OajYiZF6CkuG1b52IsnANNx3vAWBbDpma3VB9xvdfNM/ZyX1BWf
         TD8O8r8vwKsIwnKVP+xAIs1DzKUzvhnOSwM5vD9r1t8eXNtGd1MWv4PTwYJ/aKyVdp99
         Z3BzgdrgARMaI/revdosFhTHzo/9Uk9norKPfZDWOd1V3tdegovYdnXD+Hek5lfRHREh
         aqnnEeNrM7NVOR66vNfLqW/4lbGjdEaRMIsaXBVyvw93thw+iXhV2W1GCneZmEB7yl93
         fESyCH/BkaQpUiISvI0QZsMvE/7wJ6+2D628aqZ6d6xJ94Bmux/p5KClhUfxV7B1qZke
         aJ0g==
X-Forwarded-Encrypted: i=1; AHgh+RoHb/fUZig+nRW05GZKGqWEguvmR4Wx742vcsLeOYRZSFiCJRVa9Qae+yY/Z4PDxOMMBEgeFzSG3ZuKxTg=@vger.kernel.org
X-Gm-Message-State: AFuF++ltUa4bwdAnZOPBmcOiF+WrjDgQRPU6ou7o/DWS1DMwfX/mL0OC
	IjZPcPOH9DZtq5BkkuUKNYp1b3t1Fp/MJFVqN0dmL3iIbif70BV0iyBA
X-Gm-Gg: AR+sD106mv/PxoxfCRSMm5c+CMFlr/LAxPIqOvtCwX5xWorFwVJoTDheCeNsxdaChri
	8LxSsZUB+/I2NWYfJhRj7h9HsvUCSK1Qz9CCjEEervctZd4ovtJXz6HhAKmkaW9DgVQbs0//scO
	StS5/f4NHCMjF//qsu+RQSLLrLt0dEXmvr5xFv6F0HQ6q0/MeKdW/GaCbIhP5A2IbW7UUzN2RQ0
	VNNEK6Wqc5jBT4GRRg6BYVEE02yFKx3VH5kAMSqtvIf1C8Q84wb9+k0sfJBccUcAcf7oIrBp8PW
	Bf8z/O/t2s5Cki44WddNe1qvGh/zZN0rHBuW0zut8MDA8A3wlrvHrV3jPm4fo4v+rYikACyam8E
	2rOWHofCIu0s5QaVEaNgIf3iQuVl92nuzNVz43iMj8qU7EbHGok54qb9QPJfXpdBUD313iaYQON
	32nBQipeR3+n20yrgKCUkoLK6MtUa63mxBHLJp0y8sM8WDNwIDTW9/Z0XWyEgFjCcuGm3YnJCiP
	2vs53NcdLkzX6BI/RstD60gOBGp6eScFF3aS55PnrU3c4NI/V4nBoUWWoxHbLdu5JwYylZO0i3d
	6WmJjfJd+7NZOYwfQs2tO3BBV6qMMdUyoDt7vhDUopgc9BVtvlLXBl+IuU2SiYhV9xoGVDdLUZl
	J8zwVEQ==
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr127859415e9.4.1788371399822;
        Wed, 02 Sep 2026 10:49:59 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm141698465e9.0.2026.09.02.10.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:49:59 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data
Date: Wed,  2 Sep 2026 20:49:55 +0300
Message-ID: <20260902174955.207878-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The regmap member of struct imx8m_chip_data became unused in
commit a71b261c19a4 ("ASoC: SOF: imx8m: Use reset controller API to control the DSP"),
which converted the runstall handling to the reset controller API and
removed all accesses to it. The struct member was left behind.

imx8m_probe() only assigns dap and run_stall, and the imx8ulp path
stores its regmap directly in common->chip_pdata rather than in this
struct.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 7e9eab2e30347..c2b4d379a3a3a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -36,7 +36,6 @@
 
 struct imx8m_chip_data {
 	void __iomem *dap;
-	struct regmap *regmap;
 	struct reset_control *run_stall;
 };
 
-- 
2.53.0


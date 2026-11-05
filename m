Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875419;
	b=21YryUCMM1VzppfTVo5l4WkkcObvjwtDuEMKO2irz8i9hadGjkDbs84WvAdlhpb/d8+k
	 DdHzM8Qj1KhSYOmIBe9qjDrn4yK/eyGQX+WpXYvywytBiSCY/Xw/lhsnGiW6ABnOn6HVG
	 H8QPlRL9ppyRgKraoz496pDCREziEq942ygQc085dYLoKDApnPfwzKQSlybqeo6uEXysz
	 /7mKTggMqAjOEJhR/MxHD7JyLtVKSPfhAIe9GZQ2abh6a3UGm91Q5xSbWyadlhYZFjbkt
	 WUDlsJmJ0gPxbwikkytFEUt/ppm1Tj/zCGaNaKPmOsVLFRYvkY7LPgpzKZzINAzxjNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
	b=4yn+733jUbw+I26MxX/8XY2ZFm4CJsVJuOYItj1+zT29qyBO1Bwy4N02GqK4bHzj8I6B
	 7UhyHD6jCnHZN1PRJ7Y5cfjbrDRJczTVNd7oCc2yDa4rqNsNuPGvbmRWtDh4V6HMDMskQ
	 iTnC9TA0DAopztpYAD8jBzRXv39JmUnt/dkSsS/BuJxvnYq71nJz8v70PfuyhqPZTsEXI
	 2GJe6wcMrx0H0Vsm7Jyy5yJyS8zuEwHWQP/+xskg4ax5NVuVPfdNtWO96TjIbtm1sZ+XN
	 OiskuxQmCDqRj17rKwXha57gUGnCQnvMDb1u0jeEQLPowLhAtyKIXk71itQ20u133gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/I6sTG9";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F357606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F357606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/I6sTG9
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1989947c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875419; x=1794480219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=y/I6sTG9kAMzO3v3PVfvzCxwYYPiYbghjnVa1cHegzah+YMTDiFbdYIVtDRd0RJAp2
         weKv+B3G7Olp6f+2tvNKyVFTkhQiXari++x8/tYAiUKzI48i05xdni57UGWBpPI0krSg
         kyG2EaQU7h2ehXyzxTSRzuZVXeTNkkC7JlrYG8X1xDC63Io7d5IZ8AhGrvAQW2lLhlxB
         Cdpvmjyk5ysNQ6/AH77/ZJHjCHVVWd4S1x9X4QhUYiwvyZ5Vvn/fsuKDrzl25GhjuZHz
         liETzKOOdovBixeOx1aOFfkFiDM7NAfkQ4TsmBa+gHNk7Nf7YNSJo8T1SH50eEp0j1ms
         8QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875419; x=1794480219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=QxIOj/5ZN5Hg+E2TqWNUJ0HSktQHEpRAW9iSyKK628ilL70uEG6ZTRpnszO9qrcmTV
         j0Uw36RtlIuyZpJxxjghrwPr2tSTqrBxVoD2Ja4Lc9vYztCRX365UCyaPKMMv9Pp44kb
         KQMGCfcgXUZo9t9/4n/R2VBcS557YswHYEO9wpd8pddY/c/X3mCPusxFCtK6psmN/DiB
         DXPVfEfgfc1T2IeqtVEUO4tcDmw6PnqtFcB7PifascIviGxZJt3zDywc+ipV32HQsNql
         2FosRSAup5zDkPnU1XgkrvtWWnfHpUZjmFRMsHp2pWHc5AQ+A/3nRoUOOfs8SJ8FIKRp
         2WQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCfQjiMijBzxlQktf0D84FDBhEL4OkPGSpQOoJ5I3SQmF0XgKfNQo6JyiPAw9yJW3vYBy6QDZ20wHS4yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3TI3M36bGXElK4fIglGQ5nVKJf7u+fYP4WOtEZ0RDkaglFoNW
	35A+9bUdmuuKyO3Zrcp0A1KzGfU6v50JOLRouQx4nz/RJ5RUg060C8oz
X-Gm-Gg: AYBFou0Mg/RDZ7wZ58VeF8OG9PJFJMsB3TFAgkXwZagLcnN1eiLdwgbG5u8urUGQl6J
	58PcZvYcOOCPIScojnQVsHq83IFcwMACBnVohzZme2rV4UAIVEifaZdchDR+kjXmYzaq6jHGuv/
	qIrc04YbfbvRu4W8cgvZK2j3Sit0W6Bd48p22rlhgU9cr6eYnzuYSXtEUYdcm+tE9y0kcEQeDRM
	mjNRpABHztwqZdu2otthLw3oTGe9BfqBWg17Ns7J8X5xPIVhEsKZ6Hck0l1hMPVYdmzPel+jE1u
	pHouiVZj6OdveNQg+BMKVsxhXEacJa27R6QO/GYb2kBwst2YyrRni0plYSBwuJtlwrZv1yrUMvb
	QJnx84TUSru/WpCgHqGZ59jEYXtqlqHstRAu7ki7t1MereK90xsWeD74q3x6T+a8Kq8rhOuVPVg
	AcO2iM5Q9SjtW8+Tfmn2/YbOebaefKNWo40jwYYm3BjGF6D/WiuUguxrWyaF8ySHPqmqNC8aA1X
	8xvVh7XiOEnOZLft+cnrh8EB+2LwDhtb/Ylyv+xl/v+N4+nfV1qiCkJWeHEwFM2O/Xshadge+vs
	XzTI9KwyErx0oF81/s8YrodStnhMxD0OvcL6NAGA0Z5nEcoeMwlcO3eI74P0TA3wbhTQPhk1yTO
	TOY5I6pDU84sTTLNSyi8cgiEuTNPbhrjemIz94Cr2tDxG
X-Received: by 2002:a05:7022:3a8c:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1ac4fa14bc6mr32640189c88.0.1793875417516;
        Thu, 05 Nov 2026 02:43:37 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:36 -0800 (PST)
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
Subject: [PATCH v2 05/10] ASoC: fsl_sai: Drop redundant dataline mask AND
Date: Thu,  5 Nov 2026 17:42:32 +0700
Message-ID: <20261105104237.38542-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

The rx/tx masks with bits outside soc_dl are already rejected just above,
so masking them with soc_dl again is no-op. Remove it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index cb07e7d13132..8315a0d8893b 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1510,9 +1510,6 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 			return -EINVAL;
 		}
 
-		rx = rx & soc_dl;
-		tx = tx & soc_dl;
-
 		cfg[i].type = type;
 		cfg[i].pins[0] = hweight8(rx);
 		cfg[i].mask[0] = rx;
-- 
2.43.0


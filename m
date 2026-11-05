Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875397;
	b=He9ce9sRjPRFHZbwiGlJmulDN9rKi8aHVZ11Fe613r37Peew9Dw5AdBe+pveA6N/QlPB
	 6LMDkpCpaXiUXz/JIS5okArIeL28m0kPkv+23IQPWLMGzZGg54dblIqUi3zAprcbgD4mS
	 rDBLZxLh8ZklgWqBkJv8Qyqb2lTjQgV3w/WYUwZgGgKTxMsD2UiADxLUZbGGds3vxM6s9
	 Okipe9yo2n9BD8x+HLIZC10GyQEXvou7r1W/so/887uR7jgp069oujeuVLDDhNh2RfjH0
	 fLznvvIdnsKid3gmuZjfemYYNPOqUaWf7GmHXXwp8u8Q2pZ6301/CbNAwTLPFW3rJXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
	b=r88AwsvELUXSsaRnEHsHZfEI9woHF6BCncTFeZO82S3WqeJ5yCAg/5Sq4RE+J2l/mapi
	 SmXw3tgUdNhFQkxb3Oub8yrg2sdSrUyuw3Gdm5Fe6YEqAHvifMoCHkyPDI87jjLxCEakY
	 ADTMM1OjEgjV2VlhHRIClQZr1G4cuTMF+5fB9kKWeq1I1yjhMEhl3644C5zLJUY9OKesq
	 EK3lb+FaklW5LuALvQW7zmdZc1bykxh8Y65MdugGwCu31lIy6pZZKx8+39hSRlaMfaO5P
	 6Y0gpA5PeAte9GWObkRM7ogZ6zv1HoYGk7sEz9v5jYBiBzOZ2XcWq6uEpfTGsd5NpJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCihkUr7;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F8606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351F8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCihkUr7
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so2402905c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875395; x=1794480195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=jCihkUr7ExR7ixQkjEC9I0PzTY9rJYB6o1SRh3dtGPuzbIGMYLRqpA8hj2egFk+y51
         vfF+WD2VocguhfW18P7f7/k6p56+KCdyw+SOaOSpTFkpaJ27bNsrexryl+7ou664Ng1O
         9fFz6NQPq758nmfc3Cxri8NMJNLRninmxOfwvMdvAZExWol1ayFt70ZK4s5FMl/BuweB
         EScAzoxLHEbR4W9nbACfC2kULsDbATaw7IVtajkdiaiJB7L1iszYPK4SZtDPfujl0bWi
         oSAveEOIZXxJibqnhy8lSMOKdVnT7c3JseP80Va7UkbDWYArUl6mIHAFoHyEJwGaaMMq
         shPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875395; x=1794480195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=N0V4YANPSr51FI0y9vOJgGlaBx7nk3IXE0EO+ji07xgnYQL4TP9NV3myzavN8Hr6HS
         cyK1ZKOssOrjquHPF7xs9+6HVHSJD2BEvm/VN2SNXh2LD4NSwifttSDbYG671Gu+m9vR
         sof9YWGnRaQy8m4sgBHtLlPgpBnUITrLGz5O6tfsg+wt3qCnppX/O9Mvq7AApnEn5ezq
         zHIQZNAw67dmYd2NLc0RPohJmNEE1t5R7/IEXowPx0QJQ8YEcx9oNv0XBkPLuEUpKVxp
         4N0P56MkIeJgetu/LTydi0jUhAtv2XqDqg73aUEztUMXvlFRXsrQ/lLYC4/Vw2to7dZE
         Uw0A==
X-Forwarded-Encrypted: i=1; AKwUvBzr4JMlEkitPaQ+xIDNYyO68bAFEEdxoyt30QWPiIN+w9eL2xqaLlUu3+UG8zDMRHkTCasr0PbYNIzzt5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vwIa9ry4aH9mldd+40D53/t2MwscmGvc3WX85wXycibLR1UGH
	BC31gDyzGl4Gww85Zwmx+XUsLQc0Ib0TfX7mlsMGLUEZG7adXNB92e1X
X-Gm-Gg: AYBFou0d8aE4ln1g/+KsfNiZg4IZAeDmfgeSH2dBNBjDYNebAUJQLJaQw094GlVnACu
	7i23bwGxJto786g+vWsHC5PyexMxGzQB1UsIYxvFCgn25dzS29nPUdRDdxjUdke9R0pJzWmM3cn
	mALKx4fGaEC72m+upJpQxyx7Eqi9CS+Qw3HF848yxd3did4FbPcCTxItKeSMv5R1v3LrGjnpVrW
	M+aYzcdyUbiCXNG0S3ZEqvbmjo4CBMdcXZFTaliX+oqiUVGOjnAM7W3C5kDlS1DpM8dlM7B3h/q
	R55jV69598A3tOd6NF/ERAHR+YdDK7MZ2Pa13Ypit7P6sSOTct6BvXhnpfgQeVAkW/8EpP7bFt9
	MteGpSjJ134EVXVoUkXtG84OntbshOXz0qZBwmQ6Dg0cTvopgV70p3zhCGL0fBG6THbGfBg8SY2
	AsJpxIdxru+JmeSA+KxsR7ofsI5621B9yPjRclyKC2aaFyrhApgPrhygP9oI5HjuYtPSvpOeGh5
	/rCc0uv9YBDVXtYEpmeAiURMx4p5LT4ug6gzPVDJpGQ+HHlitTYIYpbGH/qTzoSTs3nOzTtZIHL
	4w031ToA7Nk58qYI+vHQe4VAuOn5Z5UoXn3EBpX1WXf7LSrJ879cpiI5gNAtNA8ZjWsa018WGm+
	5G1+T42D0uKgoDWXcdIELZq2PVhx+4ecyIqxG31gMkDlhPt1rCP/XfCnw+iUnS1CGJA==
X-Received: by 2002:a05:701b:2806:b0:19a:ace1:793b with SMTP id a92af1059eb24-1ac5d888f2cmr30014440c88.18.1793875395166;
        Thu, 05 Nov 2026 02:43:15 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:14 -0800 (PST)
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
Subject: [PATCH v2 01/10] ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
Date: Thu,  5 Nov 2026 17:42:28 +0700
Message-ID: <20261105104237.38542-2-phucduc.bui@gmail.com>
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

If regcache_sync() fails during runtime resume, the CPU latency
QoS request remains active even though the resume operation
failed.

Switch the regmap back to cache-only mode and remove the PM QoS
request before disabling the clocks, ensuring that the resources
enabled earlier in the resume path are properly cleaned up.

Fixes: 907e0cdebc1f ("ASoC: fsl_sai: Add pm qos cpu latency support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d232c8f53061..042885ba415e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1981,7 +1981,7 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
-		goto disable_rx_clk;
+		goto remove_qos;
 
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
 		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
@@ -1989,7 +1989,12 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	return 0;
 
-disable_rx_clk:
+remove_qos:
+	regcache_cache_only(sai->regmap, true);
+
+	if (sai->soc_data->flags & PMQOS_CPU_LATENCY)
+		cpu_latency_qos_remove_request(&sai->pm_qos_req);
+
 	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
 		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
 disable_tx_clk:
-- 
2.43.0


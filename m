Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913DC4248D7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856121; cv=none; b=Uab7vdkO9RLSRIP1AtxkIYSnSQGkOq1H4dwv7TL+Q/Ef2gCtgN23GRBIIOc8CHAfstC3sicNq3G4svRDgLhZiJIO7B6BnlISAhy+z6Pfa9H2izkm+nALDFmW8ub6Du1qVCDsjTta/U9U4N6kxqVl7ZvMAENvuRs/eBeXji4eEAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856121; c=relaxed/simple;
	bh=JxnapY64WEraZBfFqGiiqSghc4VaHYhDcojpYQOcQPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSJJI2K+50SrcqBTzDXe7lYfSyp7XtQcZDhajV/0oTNPmJV4wB+d2OUIQ88btghtemqKtu81j8JMHa9vchGPh/UUFfLTem5zut7P9sOIbLXVnmnvYbF+594vkAwSCy7s7kGIVmrPbnHOo59gzGeEoRg4TIMXF90jVk9X6i18L/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEUDUKwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1lYs+9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEUDUKwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1lYs+9y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M5Of2363340
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JXNafIa8Dz7
	9WQZ8cwkWKsQ6SpxY30pfaCRfbyo2NUE=; b=dEUDUKwGZWCGzXrPfWL+dZkWkI2
	18rgdi0b5IfbdvOhX/qJbrjQT1f8ypmWm657Fw8qlLRXWk9zmlcDBKRC+D67ZlxK
	VSBqwKKptkl7S4tGX95xsel4MF7JBNNjdIYqryIy8xYSbJefWcRtVTUiXC8qNQc7
	h7VIWIMCzfTBEBUOHdeDBwbsybkp0G5fZvwjKVYVQRkoyNzNcykoC0lP+06zu6zw
	XVmHu/h2tHADjDrePIeaY9eUFLsIJoWEKGV9ghJgL68dU4sex+1CjhRtyz4AlOJc
	AHNwz0JEQhdcZG/aRMDIKGqGVQhYzOfxFqKQXJqXyVVm+jh9CK+5HtoKWsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguh24t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:28:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so1040096385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856116; x=1789460916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXNafIa8Dz79WQZ8cwkWKsQ6SpxY30pfaCRfbyo2NUE=;
        b=c1lYs+9yO1KxOXlt5qg/zcwq5toNOUj52r3QC/9zW0ToTWbQnYpNsfiOnp+GrSlX+v
         gTxbwA3niCScku135UHGYenqWZ1BWIzD6PhDrRojBkwfa//5PIiAshFDXy6ZoKBaf9Y6
         ViqVcIuJgpfHcRNvDuJqiMwALGp6xcAnlHtqQEYqMcNgbfnTzUMfA6B1ZrmG5k/JUdL/
         dN+Tit9iNvzSjo0AMFBTXkVCffC+F9x0YT9ZPGRx1FCCuKe03QA61+rgxDbZqAddMF/X
         2xiynQ51dtsXUUvg7IpYmibtUxp748wGKGOwTEqfE4604kV9ONc3EE7ZNew4hl00WPqy
         aVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856116; x=1789460916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXNafIa8Dz79WQZ8cwkWKsQ6SpxY30pfaCRfbyo2NUE=;
        b=r/7eTevLS/E8v0Q1IXzqUt+jumv7EpUS/j4HlFoThyuCZB/vUgHbfexH9HAovO8ULQ
         AvvNkT79LvsiGmR2w3KxUGuhhX4e/EQSoIJdjKaeKjRNHFWbhw5zXukZVdI7oM8Rr7K8
         JQ9HFSdUct1/5519GMH8KkyiCHKj+b2AKBiX7EX60RSL/LYDjbuMRNdse6QFZTfFCLT8
         lkoHvWXWBE4cuSZTYzqgCF0pBaSBnwdgmoTMvOhwESlQ58CydlXS1RPtQ8NbjFc3hbHx
         gbfvSFqwBqg58oX+K9gyJec+AM+6Cru7w+gNq+3T/JEYufZ7IMPFPOcl4jKn6+Noe6CT
         wMlA==
X-Forwarded-Encrypted: i=1; AKwUvBzSE3Bmb2+Xiw0Pl16ezc6S9+g2yc2k37u2NZJUdh8yLJMHaPtztDb3UlGlpe7/YVMK/f/eXNYmF0KMCyA=@vger.kernel.org
X-Gm-Message-State: AFuF++nDzoy7VhOe4LyRzMSMKcBrctITjDZy7sJ4/nhoNVH9k0F3W01i
	dHwJIDjufkgArGYEYGxPhb8Ji3LZFSBcgk14fb4K/GDISK7mP+T4DrvBooQNPznSanrvpgjlXKj
	eb3ZdBcw2+GAF+DSjpJTY8I30D4cl/t8GKbcDdceyyhitiAzDRIKBBxs+VC9MGQi5qD8=
X-Gm-Gg: AYBFou0jfvtKRl0yovYm1+FrwgSyfJYeuuFdPbSOrE7NqZ6uzTysbOaVVHctavSM9fq
	ePoOdALRDvXHtL7ngj+UO478nHT50fLLEig1j0SE11g+70qrQDG+Unyr8rKC/zrtMkJPIkubAlm
	n2V6gyUA9ZvtAgvrZf2MhUd2C4MIq7glKJ828Ix8AbAKflD1KWAbfkW/DSO8COJ3ERUzwyAzqII
	eDxhJdXKoYrubaiWc6uGdMB+vZSP3bAf7GHshq6KwfwbPautXsEzr4EAX8GqAdnN0qz4DAnFKGh
	poNbz4e5nhFfgXxeQ163zkTg4boCBWRTUJQSeIqmJPO1sIPQU0Ebc6bhrYdfg8rVrhjYuAc7NwR
	inzOzsMiSAj2/2g==
X-Received: by 2002:a05:620a:a2d2:10b0:939:8bfc:471a with SMTP id af79cd13be357-9398bfc4f1amr1804849385a.49.1788856115959;
        Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a2d2:10b0:939:8bfc:471a with SMTP id af79cd13be357-9398bfc4f1amr1804847385a.49.1788856115562;
        Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/6] ASoC: codecs: lpass-rx-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:04 +0100
Message-ID: <20260908082806.648797-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fc734 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: EgcbY7VoEH6FW1T6LMjDJgNmL0NhkyiW
X-Proofpoint-ORIG-GUID: EgcbY7VoEH6FW1T6LMjDJgNmL0NhkyiW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX6BM7GqB/je1j
 L+9C0DGOJCNnzJMBc+dFvRTL5hZMJnev5q86uDa8g3+tD7NB1nBn+X9lool7vRN286hNPC9g8h7
 b6Qcq3Pxs+EAtEewtA8HGEQsuM0T//Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX5dvNsGQzEWrf
 GFxOfzDaV+Lua7RCo5wvpSumGRh9DGBCaqn2Y3nI7vKb1bAuYFJRUmrMoMxmQBCMntbGaMaeakn
 dTKF1pcz4sC8mSeLazeFw8d3PaERr1XpNw/0i8i1bIainacSRjq/elavbR6sy6WyyWIyZfzp57c
 f22PMnmkgZMr5DTWGmCEtXYyCvy7QDHXBB2TCuuQfqC+Nn6dJo3el0/Ij00A4kPDIzDQA5C20AM
 d/5nBOmVemNjrLuQiNFrVkPevKsipYbR5ptDRPmGUQ/er6A/h3s6UoMQeAqzGyWYIDG16tvlphR
 q4fYfJtr97/YbiTtDfDXLpBdKvEdCa3AwZIY/PDnhlnKweW+4L06ZfHRQsWDiNR1lDeXguzSEKd
 mCA0Ib5vdiakzyuMPsbb610YLvs95BDXzlm9V8N726/QbrV3P9Bn8VrHP4ZC1I2P5zosv8Vcacr
 p8doqPuNYtgHL4bSzVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller
can't tell that value apart from a real hardware value, so any
un-defaulted, readable, non-volatile register that gets read
silently returns wrong data.  Since commit e062bdfdd6ad ("regmap:
warn users about uninitialized flat cache") regmap dev_warn_once()s
the first such miss, but any subsequent miss stays silent.

Switch to REGCACHE_MAPLE.  A cache miss returns -ENOENT and the
regmap core falls back to a real bus read, so the caller always
gets the true hardware value.  Write-cache behaviour is unchanged.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 4dac376927bb..fefd4430172a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1674,7 +1674,7 @@ static const struct regmap_config rx_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = RX_MAX_OFFSET,
 	.writeable_reg = rx_is_writeable_register,
 	.volatile_reg = rx_is_volatile_register,
-- 
2.53.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF242DFE6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856121; cv=none; b=dtcE1m7FvR8eRl45ZRntkYwNekkJDMBeaVvycyIp53tBWCeU7hl2xmDrZ+Xx/h33Jxdsz4TL1Quwyuaxqsmigc5C6W2KswkZzc0ZAvzArA3P9DKMCFlqD1iz9uF0gqmc6imhsy71Knq+DWXiXWzjW2JRWW/4cVc4CQCW3lJfNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856121; c=relaxed/simple;
	bh=z9P+ywUBSNkvNLZ0UrmxpKOG870Ab70CHNlvp5eJxSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwcKFJHOJQTJ1Fl80jseQT/B63VGbNTIr5HFi20z0LcLMEZRhfTKOU9019uG9UPNmp/Be+/pdp7Lho79YQp+kPNTKWAVgpnZ7QV+5FZV0ER13VbEBVuxkSVooOjReM1SFYVcpzCRckEMEhfB24004gXuCJx/bJ042WlOXAqmHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUyu1woa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da5b91dz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUyu1woa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da5b91dz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LlJC1477673
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sO8eEMJF16c
	3bC85Z00Il17KWtgP48sEVSRstL21fnM=; b=PUyu1woaiCQvYq9ktdRE28uIXgJ
	uYCqmccQVV7jCFZbSOimX84cXYBuyYm58R19XNjBxewLnc3bq3BMzARoQ7cjP2PN
	9roacdsHFbrIB8Veln0lILQTT1p7BGbUAqWLHK8sukAqV2evS/mE4aPeeP2JV7N3
	2h9ejHBJC9xFe7huJnd7298e+IyCssKU+7iR65PmjcN0rnIrN47mH3/0QN1JAq+Q
	L8jQxJp/O+aqi1QvogOMQre6KVZMUVd9+UCwPtp0EKP3+ZHQmqaUOsVpP4q4sDzV
	0MeVCFSs/PEotlyKvCQ5U13godf9wtRye4+nqHeMfr2XfbIn+zL9IHOPTYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjh0d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:28:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939665a1ae6so434970885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856117; x=1789460917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO8eEMJF16c3bC85Z00Il17KWtgP48sEVSRstL21fnM=;
        b=Da5b91dzUs7lzn7xvORPBcAKohR7qzipE4VZSkabCZH18aaZbFaDTJVjav47FlWHaL
         7YZkaSS+g/ezSX7d5L1OlUQYwu/lFTMJc+ueIshSU7IWBoSWD1M4erIhJytQQ0xBCgQ7
         72E3gRQGrNwVzn9C2kZqUbqq1sWQBW5wJbp1jBU84eaOL2VH0cIRVH+CvD7i8uOHSWD8
         jYQXwcvXRMj3oUrG8IP2Ozok9OE7la0HEkPBZWyAaNdksS8pji261qrAXROE4hgeA+Tn
         voBaUwVFu5jnnUvqEKNmKFRJ4tosQJcU+WtSdkxaJpnyqF0DzOn0erxVGkT6NIM/8YQD
         w97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856117; x=1789460917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO8eEMJF16c3bC85Z00Il17KWtgP48sEVSRstL21fnM=;
        b=linRlCGDGVjksN1wye6w2QK2Vv2CCLalAYYLz+QYaIJJfV6Sa4ZNZCt8UsKW49pVXj
         VpXSjPdaJahXe1+WrRu2jaI+R20TyOImbts/HyBMkEnptJuB+OgcotnqsZuLdbjRwfLe
         vc+9qVyIG+6MYClBBTMFVUh7/9t3U2IXMsA28bDHBK6Toh1p+2WJmDQjYvYOmM544Ake
         +oyAM152vAD2hA4YkoxcUt7H0kNPdEsrnvFQ8Cok8+PYSlFb3psEMe+j2rh5zkIjgNsj
         PvdVyNDkKvK8LGABHO2p+6gcXAawxNLHP/NGyAyTgDlaZxC6pFBgB5fGNAFACLZ0c/Ja
         a3NA==
X-Forwarded-Encrypted: i=1; AKwUvBxBG+2Bw1xwrXQHeAI93r0WMzq92+xTF/nkgXrUHM1FhS9qVdRvSdGsY9dRlsXyBMuLzI4iW5R0+A4BZWY=@vger.kernel.org
X-Gm-Message-State: AFuF++nvARooSeAi+AH3TWm8hkCNaD0uHJJIBLe1M76vILpSebdALk2T
	5oQx1U/tPYUYRQcOloCiUOF9h72n3dDrbgAOXhvj6873aIPEC4+iPD/4NPJorSblaJICd8RllgF
	6wqJqqSZG3qVlzo+XV3cKsbfBMUGQggTxdsNxFJTZGCeBsB3tosF1IkztzKV1fEueF6o=
X-Gm-Gg: AYBFou39FhkDr0onzD9HJsOjfbzp3g/CMu15LwS2IOaTACcZ3myEoV48+uu/SN4WdWT
	o36IEkWcHSnsL5sC1+JBJhZeY4fK5r5WjqV8Xt1FuxkJyvtk7rgP7I0elb3r6sf35/PyvqGYT+A
	IjT2EvcyDBqcjbcfDVDrFh37xcHvKgGIk45YvSmTiDfvBCopVeWXzC5QdTHpdUvnG/JX7VthRpV
	QBzfdY94nhQcTAWK0DGTvDknJDa398tJK44NT4kl4EqeyFMBN+Et3OH/GPcZDxA7a1IEYaJG8/o
	ka3vUZWBmhobgUqeLJVk+U+TbPlniaJhdXMBuql4yU9M/ls3+vXhG2bx3uh1pGnDFDfYVho1U+9
	TB6y4RKlmHm/gTw==
X-Received: by 2002:a05:620a:a38d:b0:939:6132:62cc with SMTP id af79cd13be357-93980426af4mr2295508985a.27.1788856117166;
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a38d:b0:939:6132:62cc with SMTP id af79cd13be357-93980426af4mr2295507385a.27.1788856116729;
        Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/6] ASoC: codecs: lpass-tx-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:05 +0100
Message-ID: <20260908082806.648797-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX7N9nlpznbuEP
 SUULUdYkxacLkbg+vkEklrS1v22cAP0W22kqrqpkI5Y6IJYW03xQmFLddSLs8GHKyE02WYKenzN
 OoYf4rYZ4FV4Q7QUNSTjN6i3QjacgmI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX0Jrh8okkczrV
 pXgUM+ECIuNGB9v1sLY0jVE0xQq08xcOZpL89HWS2sRLDbrOn2fLM8JBJJ04NXz3O8vev+jHC1S
 yfsa/UMSG+x33eBXdDbAnzIahBc0Ag8JPpvlbN0LRB+GNB/JfsYlTJHIM73rCjkAFx6wFignxzv
 CSiH+wa+8+Qr12DnPymwfkN2PYn4X84dmJkq42CzEGdaiXigr20TMAQWJOvBJ/lQmFooZScqZVd
 KSr/fJc6rrVtjDHS2cOOGqAgYZ6/dXzGfjg2yd1guG+AsGZz8BuC+qOHWuafYM3pJDI8a3DdgHv
 1PenYeOvAgYw6MQNuahMYas3BjzsXsZjrNuabP0LzuFaix0p4/ul+CiiZM3zC8XsjugK38LT6Hq
 FIH6EYk8dS/ks0YXQsziaRuNqTsEdIBVGVqV2sm9/ANArvvzpFY64JygCjXvKPTI2MhmHQUk2T3
 47h/a2jmNWyVBx2vLmA==
X-Proofpoint-ORIG-GUID: SVVzQANMMRPcz8XoAWcH8x2lWQzOhKen
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fc736 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JkBDmzDGGkIbPcWOdIMA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SVVzQANMMRPcz8XoAWcH8x2lWQzOhKen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
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
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b73a19eb9981..b1cd5e34624a 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -602,7 +602,7 @@ static const struct regmap_config tx_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = TX_MAX_OFFSET,
 	.reg_defaults = tx_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tx_defaults),
-- 
2.53.0


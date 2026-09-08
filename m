Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36743551D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856123; cv=none; b=pdMIhWz1ljxSRBoGiIeGxKDGkrZo3We2sR4NEgBeSDDjWKUbNm9Xg+A1bZ6wJSSIpZvaURqYTbzzbrGp0DaJ5NjB4rudzbw19rn1P9sGhJpCirFba0JGqRBVyI2oiZimHBTlasOy9uYLIdQrOhCrQvuNN44rRzyaa8TdXbfJmGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856123; c=relaxed/simple;
	bh=UV6jW6PMil7wWOmF4aoKmw9vf001ePaKteC/8MM4q9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4lf49PaTLeG+mr46IIztOAF+dVgsGgrRdQUlp8cRwy26IzCS2aMBGWGwbs+r1fIV5r944UmRzwzlU+QdTA2GY4zpOANfewKs+sqcXBFefn7wzexL8gDPYVNKCDNioogncp50tVGqYeri9JZbrSOd1HZOKlMZP0UzlbMaq5RUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYhXzThO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5Bd86CJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYhXzThO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5Bd86CJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LqFL2502437
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7hxdjuB2VuJ
	ASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=; b=KYhXzThOSxck3UYlN9f+e1kCMbQ
	VFMseCENxvIDaByXZfg7lE1h13bkZhQ26t3hK1avdwB4oZLSkjpYDZ3GVU8mcLjY
	+VtXXAltAHICROviLOFGYpODaVSNKcDVSjIz5AlfBi4h8Vo09Bgd6gL+qs6C+Dmi
	Nmm+Meh4XAN0GNnV/OgmFoMuRFuq00oaliyPuAMvZdUrnYTj02wcNOZRK3lCzzf6
	AL/6cKGOTqk29BlX3Ej2AfBZWkjS7XBp8tXUNtNHF6XsroLSPqfPZuxvGvSV/GHV
	s+TOBpWyAKvPNUno/IeNdnkpwa9fXbcU/VYLlzCXffA3iLJsLEm5EVWvhqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7gjfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:28:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so413982385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856119; x=1789460919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hxdjuB2VuJASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=;
        b=V5Bd86CJD/ELymYVWsPVPUEFZcCxNZh5zdZz9SV2hECvnIxJOPo+q+dyXk8sg05fDu
         QzAd2e00cfsAFtUwtLdF52EyB2nRXbppmckdvTAcpica8qPjNQkz5qdk6OKRG1nlVRhB
         DO1tDcmF4ZvNS0uS9uj/tuWfBcxa8Vy+G6PhaN3H/CKDAIsZfSNi3vvYK9+ijDRXwj2K
         cxVUG8Nn3IWYCXhkGbcDwoo72o08z28jFRqHBJxHfk7MHDcM3NVSJHWRl3kiusSmZARz
         psFWE5lr17VDlkVNLBFR6pDCX7pwLbHkxeeGU8fBoOYdJqgMXHWY/V/biwruUB8uRn8z
         Z60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856119; x=1789460919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hxdjuB2VuJASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=;
        b=Ro88SLs9yD9OuZkcM8vqmHa1+ImHcpb6ZNzSv0aZjZAw8TZqVlhAMaBE+5JbN3NxsO
         KndeHAqTQ7Vcojbt98rF2sv+ifIiLA8Zauu/bDvUeVpCtSxu7iyXE0yZLbjv0EZuZp5Z
         rOtOq8pjA/gOinANOp4duvKmb7rYXXL2V/MMefIHEKtXjsGt7lqCEDhfe+KiGvYWcBWM
         QzShcGRBwMWImanRc3oUuQpZtZKTsVGrR6OsuRRCJ9mPdXC4TnVvLEm97K34qySKmRB4
         9pYCgHV82qllOS0ypfIhDoExGDXyCIz3I8bO6dz0pDZPyZH+IoKyMJ6n1via/yFai/Ij
         RdfQ==
X-Forwarded-Encrypted: i=1; AKwUvByvxDl1mr72wuem26m7hnkMTvvsvw5V/eOBrCRoLiP+ruBs1Y4twIHFGe9fE7zUF+Qvu44kHw+sIEE/vug=@vger.kernel.org
X-Gm-Message-State: AFuF++kTbxqWoDg4f4c2LZLBrJMmAjR8we76zp7H4TLTsFKseelzZeHT
	TDX8V7zalmAjRR0+pPchCR12aOAvhIXvLWJXGkFTF1ZSuh+CS5XnF+zP7uUyDzJqidUVRUyTwwk
	w7mr7ByVVSD8MegqHJ4VwFGRyKdeP/DkVN94C2adHG7baRrR2rTiYI58oM7manCybjU0=
X-Gm-Gg: AYBFou0lATg2N8p1qeFHGqkaHCV29dXtT7g6ntai4IszmO6Qg+oE6H5zWRw7DMx9YZt
	9hzC7AR9dqiDeETB7bH+CNsaLWeY61Xg+onZDXJdIvDgRSFL42NCgf38spY2DxPZOYe0w3kYL/y
	+PM7CFmgb8pBbwUB9SfM4CGwkG9RI7WAW85mnJcoLmqvj4wBrosZBMryGumuP22QYv+3Dd724gg
	YiiqPhhgKtzrAXCoUufiVfZMXmaFJVbAqyFUoHkPHwhjX5rqsQiYJDxOKWIbppBbiBmla9yLPT8
	6iEmypBRU3i4DjPFcWqVr0SxkVeJGgPsdfDsP1fJT5ML82TD3UpD/vztzxvbLRUn24PehfuqBWc
	9SwnYPW8sLazFNg==
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr2943832885a.49.1788856119109;
        Tue, 08 Sep 2026 01:28:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr2943825285a.49.1788856117945;
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/6] ASoC: codecs: lpass-va-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:06 +0100
Message-ID: <20260908082806.648797-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fc737 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXzVcfs6zrHQg/
 Zd6n4D7yvXbFTpLpViTTNqdZMMG08kLxQM38TwSOTCddmJtWy1k/KKPInzjma27qYN/WlQ4uwdb
 rlVY8OL6BoEQGVwzJFsFOtGlfDdLjCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX3n85B6qnWQIs
 NqGSvsuSNTnQhcOf9gqBdNUEhKHB92TlVoIxc+INeFaYK0fAF4ITmi2KS3HwzWkJlOfjyFZv9NK
 dt6YHRlrWOYesF14hp87ENoq6qNPxowzIQb96op5Xts1l+bQyuTJ5/Osz+mqQpln5dmew7AA3ky
 jpbas5IdmxM6nfuY5snRIdSFFY3jHoyT6sI5saFfLQ+BAcCXwlmRsy6/7ZSB79JK2yS9ZX5imri
 ypBDMh9Rz6gFKW9e1rw6mVY55VM1ou14cHATgREAj2dM32wg90jijPohx3+DP2hJj6PRT+4MZyk
 ubuOTCMw9IBElKYqj3gOrnbCvHolgoXE2vCw0LycX5K/VSlGFqAwLCoOzZhSk7ADtftGbYj72rY
 kKx/GaQEFKd6ltDD4Dwwg+aORMZBnUSr15rVay2hFYqlqsBOTpyyPs4EIGeS5I8MkzpGZEYtOs8
 fn/ZUnOlIpZbB2kwCqA==
X-Proofpoint-ORIG-GUID: NInfu4q-1EJ2j6eu8SvgOeG6GU901GaT
X-Proofpoint-GUID: NInfu4q-1EJ2j6eu8SvgOeG6GU901GaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
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
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index dbc5795b9273..f0797715ab54 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -454,7 +454,7 @@ static const struct regmap_config va_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = va_defaults,
 	.num_reg_defaults = ARRAY_SIZE(va_defaults),
 	.max_register = VA_MAX_OFFSET,
-- 
2.53.0


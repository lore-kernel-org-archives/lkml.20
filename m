Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02ED51122E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684756; cv=none; b=BYS/yzK7gNJrO8lcLuZG/ZT3cCshgdbgT/QJ0qf1ckQb3aKHhInNINL/gTWwZoxP0Ahuzhe/FRXI8aXKodufmKFmqH511m2aGPTNwRSZ2GHFmt6iSIP/eT6YZIxvHkugG8hm8OvydDJXWg2Q003NEy/g6Y2slBlLGevLADEd84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684756; c=relaxed/simple;
	bh=LlWU3yBVXRRJfr+LivnTiGZtuaci3yz8ELmy/Q9s3bI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cDpmL8EwKxiHu++cOGXsC7pYgghHUfQLnoJQxzD14TjKFwl+IEzeHtEFOu48IVvdoDwhQpfOcEqm1oU8v1pr5mfeUFDAgUwggS7Avl5EeijlbELlhBks35E+PxE1wrN/jyorfERcnMpC//yvM61s6+Yw6Ud744RzYV4rySAbMOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ug3b2INA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQZvACYN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ug3b2INA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQZvACYN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCE6g9528961
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l+1/gp30Pqhkzp+lEQxy2S
	DB3xgsxUhnhSlDGzy4Fbg=; b=Ug3b2INArsuIsQlsI9grN5HafqFBq0+w+ZRsf0
	FuZx5dxI6t8ODWG54sWEMjRxN7DkR6qWgERVYIqst2dPg8cwiIaW2xGaWcgZoqjB
	2OCBZxtquP/zOwG7icOi6y1W454Qe+c/9g7+jkdSA9b0t9ICkTXpFwxzkmRVuqrq
	vKIgxS8SXFm7N5i7BgIP9UgaAY0U0TLMcQv+peVa298GJLE5TJroWkvnODsaXq0a
	kJ+0m95cceq5GRh6ZJ+qrcKYw/oEi1ogzLBro92zw+5u30mLeQRpRbtLiFYF053M
	ur7YYAwFGod40yjJ56Xarv5OjU1TJCJmX0KihjfWTyAHH2kQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2d8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:25:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179524bf03so423846d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684753; x=1791289553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l+1/gp30Pqhkzp+lEQxy2SDB3xgsxUhnhSlDGzy4Fbg=;
        b=JQZvACYN8nowSeKolZYQUqwHntQDaMR8REQXjuGb24PeFa5Bmuhc5oGO4BXtVSRVj6
         JUkWf1k0w7mHkmSAkoEv0dIx6EfwWcPzf62vW+0kFNO8XHrvDZXwfqKkJIJa7Fj6P6x5
         QxyZcRe4Bqq95TBJIzE3e1lrvlPnGA83hG2Z3X/nDWox+OD1ECDX4PKi6j7AbkjawNBJ
         eh2Xwpan0Hqv9XWjZzp+2BTES/VkHGb5sBcCETSVvN8mQMgSr/cbKNMXeGOJkdqvpIiS
         1U+bPKG2MDDiFj78AJgJDo+m4ywWCFO0B5KXNKzA0SjfAQe8shhQe3wEucXtnH3eyoKJ
         svog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684753; x=1791289553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l+1/gp30Pqhkzp+lEQxy2SDB3xgsxUhnhSlDGzy4Fbg=;
        b=nYYl7F7GqG91ccCc3HNs0lJazZZ78mSi+f4DSS5NoS3pz0qfvAX495NdeKdYc4Oqtu
         yMQPSljucJZwYTsbIVP7Ci4wQLDhJAdjFad9p0lirBnimVL2GCz269UwfaNCaO+lHXVM
         TbW9kKo9kclPYRD2peRRPiLNeswsa9rtpmg6VspEkXLAyEd8SWu4xP+7KSvY+hkMnQ5b
         mJ8ol10eGX+usMkCNaQh/fpnnDMUgLFk8l/bvguy6mxnVVqfuc/VjzDpn1PalOmTYvon
         pPml1kNyPsCCaoGpAQ2OByBaMVGKkT6fqI2hKQJEoRFcN1A0ZGo9cudkBJy1qEx+nRkR
         g5PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpUIY1VvZUdL/Tpbe9/1nINbR9oB8lRBkahL3lxjUJThgDe4u9ucuNtrSvxdXKQYStXNzpN6R/uqxnp1g=@vger.kernel.org
X-Gm-Message-State: AFuF++mASCUsLk1bFXJG4qG77hD5p/0zd9QcLmUJJDlsHfq/ZF+wxtBd
	9Zh2UmPaUZcXPxSWSjuN8tHVcLOa+lo5bapNgRpmpSf6RfIpnCZ5H4V17yA1FxmrZFtcipoDeks
	svKBqwr2CVLjq0kXdu/FnOt6ux8nj/wykn8HQH/wJjyNkwdc7QXOCXCKHJuA5DRIrgB8=
X-Gm-Gg: AYBFou039NGWytCLVlaB8rL2i3M7OgUSyvWrbyHNlz3EoTatpBDYq0Nhhyts57MqhVo
	lD2MNRwzmCQ4v95e29LsD7MkvOqLbYbzHXoF9gOiwhL0CPS9KdKU4D91vKO39eosLybWpvp6QWF
	4U+H+AzAPT582sIemVa1l9SBW3QPT/piH9ZYiNNjvCxzq3G8u5kR7YDGk1k1/LK5BcpjuoqApJi
	vUfJCqc0Ywc66HwzjEYgMIgE4i2fAVawqWWZfT8aVdYRL0bC96Is5B+K5GZ9UzeAYjmg4xVGZvP
	90kHaiHq070aiagg1KQCwiwy1bd4a0ktIOKEInIwdE9v2El7ovV2n9Mr11fC7n3M0t4USFKHSdz
	bAk/foc9g/2DAni+v67NFnwkOfr30wjBhLRZQ8ALcBFT3BGfjoqUyZd0HSy50edqUfSm06jEAZl
	kStbif5/4qFh9zirc4NoQMH6QRSvABvvoXEMmHvYVdv88WFHztlMk=
X-Received: by 2002:a05:6214:5f09:b0:914:4e89:132e with SMTP id 6a1803df08f44-9144e8917cfmr188842806d6.26.1790684752569;
        Tue, 29 Sep 2026 05:25:52 -0700 (PDT)
X-Received: by 2002:a05:6214:5f09:b0:914:4e89:132e with SMTP id 6a1803df08f44-9144e8917cfmr188842066d6.26.1790684751847;
        Tue, 29 Sep 2026 05:25:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d302482sm9103956d6.12.2026.09.29.05.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/5] i2c: qcom-cci: Enforce the required CCI clock rate
Date: Tue, 29 Sep 2026 14:25:44 +0200
Message-Id: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiuu2oC/3XPSWoDMRAF0KsYrS2jqVpSVrlHyEIulWzhoZNW0
 iSYvrvL3njAvSn4H+rBP4lGQ6Um3hYnMdBYW+2PHLrlQuA2HTcka+YsjDKd8kZLxCpxv5Ol/sl
 C2sHaJCzJC/74Gojrq/bxyXlb208//F/xUV/a186opZJAiXzwSuUU3vvWVt+/aY/94bDiIy7ca
 O4J/0gYJtBGCMWEtXIwQ9h7Ij4Sloli0VudNcSOZgh3I4J6GuKYIJ0DjwBHSs8QcCPi8xBgwmF
 2MQDERK+GTNN0BncaLyi5AQAA
X-Change-ID: 20260721-cci-clk-fix-fe145b2acfa7
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX/8Rk7wy7S/ln
 V+mTnFquMrxiNNltB+dkr3aH39QXORj7t/LetAfu/fmqp7xk5BCePtbb6MZz0fvh9sdsTEv5SX/
 ADcHM84+XRGDqxlD+0vP0lM658G8syQ=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbae51 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CakdkRaH-b5KpuXxX4YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX5VHHvHwsbH+A
 Fr0XKU0VfxmbNWiwYZGbIJNrXaORNqwIqsLnYR8mtTS5S3fbPdhSFAKBENqlP58ICraPZxsQlin
 Uw9f4oinAK8FkkEOsr+hZkokULNmk39lpuhH1eXlJJZWWOxPhCPCChQQCf17HD77rUDQuWJvxER
 Q706ftDTZH0iOD5A3/Jl2K2DCcayTbeGr4PQgufYO9Z3m7Y3JjjltQFz0uGD/xjeW1ngK4/kxoF
 7/YkOrBET+CcQy/9goPa8kc5v95Rstf9Ub0+tZQCaW1bUvQwdQ9bdEkJQRBUoJFoG4lX9fX6cKE
 u4/55T5EmTFw+v2O1qduMHCCoRCkS3xLNDIUK+0dptmKEP7p0oErzYEfAnBKl8IIXlFPn17OtJH
 NDCQbcOne1iFLpYqdAgbm+2I7YRaPCN4sCD76puqDIbtIuUvkgbeC9vamhRXk4ngYiX2qy8bEF1
 o3V5612gdFPaCLg6uGA==
X-Proofpoint-GUID: 6OzUsc2k2dnUatlBK-YC3orubx86i01f
X-Proofpoint-ORIG-GUID: 6OzUsc2k2dnUatlBK-YC3orubx86i01f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049

The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
clock ticks and are only valid at the specific CCI clock rate they were
calibrated for. Running at the wrong rate causes incorrect I2C timings
that may violate the I2C specification. Today the rate is left to the DT
(assigned-clock-rates) or the bootloader, which is fragile: the driver
owns the hw_params and should own the clock rate too.

- Move the msm8953 to reusing the common v2 config.
- Turn the timing table into a two-dimensional [mode][rate]
- Add the 19.2 MHz Standard/Fast timing sets for the v2 CCI
- Promote v2 to the generic common table for all revisions
- Actively enforce the required rate.

This ordering also addresses Vladimir's point that the clock rate is a
property of the mode/timing settings rather than of the CCI revision.
the per-mode [mode][rate] table lands first, and rate enforcement is
built on top of it.

Patches 2/5 and 4/5 are the result of discussions with Vladimir and
some code sharing. I would expect him to add a Co-developed-by and
corresponding Signed-off-by tag if he agrees that the submitted
implementation still matches his original intent.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v6:
- Fix error reporting in cci_set_core_rate, and prevent double
  reporting. (Andi)
- Link to v5: https://lore.kernel.org/r/20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com

Changes in v5:
- Check the rate returned by cci_get_required_rate() and pass it
  out via a pointer. Never call dev_pm_opp_set_rate(0) anymore,
  error out (-EOPNOTSUPP) when no rate fits all masters.
  (Konrad)
- Set the CCI rate once at probe, drop the set_rate from
  cci_resume_runtime() and the set_rate(0) from
  cci_suspend_runtime(). (Konrad)
- Declare the loop iterators in the for() headers. (Konrad)
- Drop the now-redundant hw_params[].thigh check in cci_get_hw_params(),
  cci_get_required_rate() already rejects rates lacking a valid timing
  set for an active master's mode. (Vladimir)
- 'v2' is an arbitrary name, not realy hw revision, mention it. (Konrad)
- Collect Reviewed-by tags on patches 1-4. (Konrad, Vladimir)
- Link to v4: https://lore.kernel.org/r/20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com

Changes in v4:
- Rebase on andy/i2c/i2-next (527dd7fb6209) (Andy)
- Add 'select PM_OPP' to i2c qcom cci Kconfig (Andy)
- Link to v3: https://lore.kernel.org/r/20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com

Changes in v3:
- Reorder the series so per-mode clock support comes before rate
  enforcement. Introduce a [rate][mode] timing table and select the row
  matching the running clock rate. (Vladimir)
- The per-mode patch only validates the running rate (error out on a
  missing entry), the following patches enforce it.
- Split the addition of the v2 19.2 MHz Standard/Fast timings into its
  own patch, keeping the [rate][mode] conversion a pure refactor.
- Drop the "Revert ... Remove unused struct member cci_clk_rate" patch:
  the per-mode [mode][rate] table replaces cci_clk_rate entirely.
- Introduce a common params table (revision agnostic) (Vladimir)
- Link to v2: https://lore.kernel.org/r/20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com

Changes in v2:
- Instead of adding a 19.2 MHz cci_clk_rate for msm8953, switch it to
  the v2 config (37.5 MHz). The msm8953 table was internally
  inconsistent (Standard/Fast for 19.2 MHz, Fast+ for 37.5 MHz), so a
  single rate could not satisfy all modes. msm8953 is the same HW
  version as msm8996/sdm630, which already use v2. (Vladimir)
- Remove the msm8953 fix tag (Vladimir)
- Apply the rate via the OPP framework instead of a bare clk_set_rate(),
  managing the vote across runtime PM. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com

---
Loic Poulain (5):
      i2c: qcom-cci: Switch msm8953 to the CCI v2 timing/rate config
      i2c: qcom-cci: Support per-mode CCI clock rates
      i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
      i2c: qcom-cci: Share the timing table across CCI revisions
      i2c: qcom-cci: Enforce the required CCI clock rate

 drivers/i2c/busses/Kconfig        |   1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 332 ++++++++++++++++++++++----------------
 2 files changed, 195 insertions(+), 138 deletions(-)
---
base-commit: 527dd7fb6209857f8ff4426055b3a418e60faa8b
change-id: 20260721-cci-clk-fix-fe145b2acfa7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


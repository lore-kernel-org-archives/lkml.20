Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C348F006
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045302; cv=none; b=gU0EsZFCUa1tc01DdQX4gIjW4MaMy9UzxsVxxYcCeY2ha65VUF/n5zVKcO3PnEZbdDox22E+q9atGZOToSbGGS0B9pH/T70tONxY4KgRJHOoj3zsNZWD+ICseX8T5Xa+gD/fdpEWVAA6BocnazvCFMH9q2fQ+6a5xG04hR5Z0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045302; c=relaxed/simple;
	bh=FH83gjvUcfIeCErQI65OdoWy/O1PNOOMftHP18oZ0bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k06RYWrexj1D4J8zhuEXOmHZnbL1m60CY9fx5s57IJYOZVCRSNn0okV44/zsUrAB1+4rLlkc4qk4rwRPEVhaCHiHWomQjik4FqQkhjZHvA+SqJphVa3lrUmM6CEVwKw3mH2kvVQp1au5j/9954zx8Xw+7mb8uIP+R8H/Yk5M0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxaDVQI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhys7Nc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxaDVQI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhys7Nc+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7rFH1087169
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qtG0cBb0lQeEd2d3yykjcL
	apyUMy4NUKgnPZ9aBJatI=; b=UxaDVQI1fEl+rzi+TQoMMkvl+kjpudZSfjbkm1
	FHgzkKYKLXOqJVJO5m3E7LlqepmMlM6xpytiIbq/Tntn3mmlx1RfV4TdySU3zXnN
	DpcZItzo4LgnaOn2C8TxVDZKLsqg+zKEFEzLAcRLDQ9rMPe4Rl/e0cHhVMpGEi11
	CcwJ3xSJtJeQFlL0B+c77yX5QLjXq5twH5XlwOwhTDQWbtrIFC97CQovx3htDnS9
	EmmrlmPEaHZn0WxBoi8CwdZAMA5s6kWhtdII6+vBwR3XngD4VMzIZ9aWEmDD2Jo9
	Kl/I8lQerT+pIQhzDBUBvR37YdDNm0WiinqtB8SVa4rplDPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg3yv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db8c152622so25803115ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045299; x=1789650099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qtG0cBb0lQeEd2d3yykjcLapyUMy4NUKgnPZ9aBJatI=;
        b=fhys7Nc+6xnjO3uFQ5S9sfDZhjDwf/X6M61mHFlqMfdiCjljblRSBqxQkVAbyFIG6f
         qnkDxmSxtwoZa2fqwl3ISv5WUoHGQcxynfaSi+lnxDsDKrDuXd8Ij0KBvQsvchO6+pAi
         1IXQg2DuVBtyu+P7QbyGnFdLtuKdvUpOaXNIu4mjV78+OvQ0UqutYFXQrgIaaVSGC5h8
         zg84sedHakhxfVgIdu+QsKt6kNMbwGUIQ1pJcCYSGupp+XZGd5puxsyQmbneuI+W6XXU
         DAKjeI0aGq8YDgOXDxWJyVRc/B0XkRm3m/JLA4hFkvOv6cWoWniBgPduIPhgqIWJuMC6
         1N0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045299; x=1789650099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qtG0cBb0lQeEd2d3yykjcLapyUMy4NUKgnPZ9aBJatI=;
        b=n8YQkn/Qg4Hqhq/yJ+5IcZQtT4EvmlysX8FMxigyXcjNJuQQsMKyeE3bfEMJL7IcUp
         ZlGw0kayEkn0V4/H6c6Re3T6jRt0l7TqmD6vfPtUfWv6poSw+Jukd73iQ2FcbAoJ4S2p
         0K9WqnBKg+9xSqq7E2eDegwiFVIVzADtjoHPPfYVOowv9D+vKccOATtsT5vtRzNKWddj
         nKmWWl6VR2XLWbrJNX6WLGT3F5L5yCjr8DmE8vL1YxZRthsHDiHkHZnvmzugQKXwZQ0e
         EDxdpihZm/9R4F6XgFl+Zpu6PAscORFM99a8z7oIuplaHXNg7yWHOmi62InHL17na7Sm
         Bv5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnJ9aXyrXumEc4yv1IuVRK/rHLnG25AE8pDq3cmPWvegSupxXXVLCII0rcA4JC+LWvgeXT5zofv/EjXrI=@vger.kernel.org
X-Gm-Message-State: AFuF++lbfxwd1WqqZKietRzflHg3sMNW9inw91Ue11SimiyOgXzCHAJ1
	1U5bv2VET2pmGYSte8OcFv0VampIEHVXXFza4zwp6+ypizmhXAZu5cDbCD9b1Y3Vfi0MBd+9Jt2
	3zR1duodITJ2VJGL9TG1Nu1JQ1wCyziOxCACHU1+HW+e9i1e9wpLPNZodiHIYb7hsfEM=
X-Gm-Gg: AYBFou2rAlQO5eUKYNNsBRUjYh5TtdCeJyrQ51g3UsoH4phqMo0Be21oEdHfjmw7kEo
	fuwVmZ61eMvkRjlt6s1LX/yy1fivh4NpBf6mNWbhQNRL1yhLpfvDY9avWRe+wkFxyJGr/7MERWK
	tE5NBgmVFLytCAmEhgArKdIr/soFuedXusCifzrutps5gUePYbL6uaDi3nG+Q7IoyLIMHnZSkQW
	JnyJyvdTV3okN6ho5t4WwPbYZA5iTUDbuZHzbp2XjnyZb2XSJxRcOYcNJygL6IXKhKc/PPxogUX
	bi+WdoZrpZnweHrGtGxF2OqMNvaTyh8PgjAzgpV1UoUSo2oBjjjBNXLg6T5PdcIJXJLniZGdv0O
	gjckb5ZD4cWqd6YgPTEws0whwJJ6LcmQ7AhmM
X-Received: by 2002:a17:903:2f8f:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2db12357370mr566337165ad.2.1789045285711;
        Thu, 10 Sep 2026 06:01:25 -0700 (PDT)
X-Received: by 2002:a17:903:2f8f:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2db12357370mr566312755ad.2.1789045268289;
        Thu, 10 Sep 2026 06:01:08 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b9f0sm88424805ad.20.2026.09.10.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:07 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] nord : llcc : Adding LLCC dt bindings and SCT
 configurations
Date: Thu, 10 Sep 2026 18:30:42 +0530
Message-Id: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqpomoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MD3bz8opT4nJzkZF1Tw8TEpGQL4zSLtFQloPqCotS0zAqwWdGxtbU
 AcXYO91sAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        zhangfei.gao@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2aa33 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iF6ZZfrMDr8hCcISYuwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: tCm6Uu7ULb9Wq20_QggSZBfFUca7SS9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX3kq2MiJVxwRd
 4khzTKpxTjIFAuTCicU8gjtbCWItOhlyM0wS4420nV3vfz+max0bIkiM9w9NxBbHQdYIZ39Oa5p
 noKI78LvM0PCNQtRt0ptl7itlLJUZGp0dKoeSD5iz04+HOtxmGpPNVV8FxIqHHAYNKDCxPyl3fX
 JsnUxgQvhkdnVZt9uUXGUeBduUiANxXZMvacefL4MQ/c8wLC7QzBLNCuG9apalCRxYBM4V42NzC
 rahxKaslYHeku8t5e27ukCL/ms9C1bVsxgJ6HsnBDzpW6xLU9dxFvWp5MtJA5GMhTy51863jznv
 pFWzNNKgilD72r1J3ne+U+rOqzZVzbYYdKV9XN3uZT9naCOR4a5ANMepSONn7ZlpDS0t7kCGr8T
 Vbg05kJYpJg94uIvCLKzClX5woEexW/3ik6N+kJR741mm3mkVyzmuEcQJ+oLS8RK50JcHT5o+yo
 0Tv8V2yQpWOl64i25Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfXzBiGzwLVEr9P
 EXCRLHqRXFMH7Nr2npQolRsaaoMryQjQSmdgQN5Itqseu3SWfaCKA8m9tewsLkDGBGvgdeFzMJ7
 uELrXkWrnajBewwfddMxA2gOV68zcEk=
X-Proofpoint-ORIG-GUID: tCm6Uu7ULb9Wq20_QggSZBfFUca7SS9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100156

This series adds Last Level Cache Controller (LLCC) support for the Nord SoC.

Nord is a multi-cluster platform with four DDR slices, each containing four
MACH9 LLCC banks, for a total of sixteen banks plus a shared broadcast OR/AND
pair. 

The series consists of two patches:

1. dt-bindings: cache: qcom,llcc: Add Nord compatible
   - Updates the LLCC device tree binding to document Nord's sixteen-bank
     configuration
   - Raises maxItems for reg and reg-names from 14 to 18 to accommodate the
     additional banks and broadcast regions

2. soc: qcom: llcc: Add LLCC configuration for Nord
   - Adds the LLCC slice configuration table for Nord, derived from the Nord
     AU (Safe IVI) SCT table
   - Includes thirteen use cases with unique SCIDs and usecase IDs
   - Sets no_edac flag because the bootloader leaves LLCC EDAC registers locked

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (2):
      dt-bindings: cache: qcom,llcc: Add Nord compatible
      soc: qcom: llcc: Add LLCC configuration for Nord

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  55 +++++++-
 drivers/soc/qcom/llcc-qcom.c                       | 139 +++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |   2 +
 3 files changed, 194 insertions(+), 2 deletions(-)
---
base-commit: 693de981a44b0e7e3b6a73f0b0bcbae9c8d068e6
change-id: 20260910-nord_llcc-51aabc83f8fe

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>


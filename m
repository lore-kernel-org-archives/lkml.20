Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9993388E74
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793221; cv=none; b=AZVoSEHN/eYQ9vtyevjcQ6tNNZfvdiexeHFJc71V1m3ynhBlbuSHi0bwC6aUqQCFyf9N0z66BP1j2qHu/ulRSYX/P2AskkfieQNcTokxdW1cn3z0ruYyzKYbjEeprBA4t5XpE2EpDTi+NfpoTVKGkziv2H2l4/wwCmPo87sAJXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793221; c=relaxed/simple;
	bh=e91GCqlvcUlMbFlsj0lGXM4SjotkKNP7xTOL1aANvcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WM1Ax1v+6w16MvxKAQUKXPiVErwfK83Mb6F6Oy25CGcKCdtoE0NSHqRjet/mbBD2kPTZQTK0B26AMXudsYlokqmKKmB8kbfpEN6nhkD5w6dxvAFwQk7fL96wzyWIzfnPsjamd0X9ItyGV+wlsFnEydZuzEyPTmIX7WytzbOQzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8ZWVrfW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPDwvHQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8ZWVrfW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPDwvHQo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3K9fQ2562527
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=; b=H8ZWVrfWRk20RPm+
	nowfsn07nncdCIV1BOgN/tFQbt2O9GiXwJjDBletXPPGBK6eLDaxbFgJqkOfJItI
	osgy6FdFV7MmKbyUV2Mn7nPV39AfQJqaqOm+CcZcFMtCObn1aziz6/1MuMLQuiiG
	0e+uU5UVdqy1k/q56F1ASA+nreMMm82ufEl5rbgL7cFO3xOR9ttKEG4Z6aBzXTTr
	Gd9VtSOeQhEOMON6YzhRqgaqpWtzDm13TjV+Cz0+LPPG3Vscb98MZKueC1cMxKDW
	ztxFOk4yWkuqt6hrVr2fVejnfYxmdDeZc1InTLO8z3qcxBFIUVzuqn6VsnH4P/5W
	kc5gMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnrgeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:46:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso2820697a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793212; x=1790398012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=;
        b=SPDwvHQo+j4M5YyRzWRZBslDIDkmXg3NgDtIzqPqg+NAri7t/D4ZiXLpLoC1wbcA0j
         f7PVPjHquLr9+sc8UpBpp6Ut0luk+R51nabfXtfJFqx2c5HUfKHk9rBsDXAa85lpAp+s
         5glED6QiXzpu6nHj5JT0ggipT8pAiMjj9Nj9WjKCqESn2V/Ct71JIsSp/vADgIS9xSvc
         W589SKeygwalCgfi4opB2kUEY5x3Ci5epPfYOKGEDJuT3C8JdP+rOPae4q+ClVv3ZZ6M
         SKx26J/uI14p8q/C68wqS1A6Mf3vVV0rg/ezXftVQ/8LwnUXBcYkyPhvDBpko57cL6eM
         /L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793212; x=1790398012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=;
        b=2zq0z2TAwIrhQA8dIBokTySGIEkG/EOaLPoobQdXDjknHShJiVx31QBlCDm0pHGgr/
         DSk7RnkVumKSHQuAnyh9XSAY3ar3SKtANliLDJUG6XLRRu4aheKycVOnAkZcebJpkcBd
         WdxZw5dSf9JmDOPA6DyIUPUqDhJAAS8gv32YZ2LmSa9zeeHFiRedcJOvO/Mi6XpvaCC0
         txuIrl92UFXhsZygbuIl2U8EjQqidxTFYaPpHqUVbvE92cgLJTt38IS8xLzTJLWi0Z8c
         oRFDDQaj6SQlV9nYLodh9IRlk9yvSsnz/4eowIvT4dGg6eX4kwg5KhU2OGY+HC1ILkUz
         a/7w==
X-Forwarded-Encrypted: i=1; AKwUvBygyQg0FGWcNAqKZvIicwsjJXBnxh4ROJQSrLLispWuM+jtYb0HXBzuBSEwrqAf6r1Y+EVr8PeeZsJV9MQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mdA1Ti+bNvkfymYIbWaJGJHstcjwdSYASiGGDB65W2NAE2mtPI
	Ryclvb/GDO4nTKEtLW8ZPhW7MHS+ZkD7Q6LDzyHTylSFXA/0RtZszV67+xF9ZHjaWLrXsEMhoNU
	BOznw3DVLNQiapQzP7eJymx2sPltJlwiQna7mlAhp5DAngA8M6lV87jFzAgfQObR96E4=
X-Gm-Gg: AYBFou3OwE2ISw8R/D47KpMIBDvFjKUhoMOfxLYBjHZmBTK3gaefWchgKyiY9qkqFdW
	reD9Mh/rcOrgq0yTJrVIKWCWaqpzBy7dC/eq4IVFmyCmsQ8XdNJw3MCun9m5X6ypCCdpIfP2I1t
	M3Lc1577PTOrzy50hDZqOZUv1TQIEZu3FwN6RFhLst2uE5qOXqSxItIoU/TVlo/1C/fRq5/FhJ+
	E0dcxWNp4nXQmreawTqc4nho7zk5BHhYyhFJ/ad/yOhKRLsXXkweoJgh62vuO0AyluDGkyc5Afi
	qIcB4oT4TZvJzP8ToqSNq+GsRcrKZ2X5bZcujnfmvH6N45RRIEpJtgG2Ry2jgtrCSGAjDTlI+Dd
	sEpAcjjo5cdSjfwwWMTJAAumHPMYQV9UC
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a197:eded with SMTP id adf61e73a8af0-3dda197f7d0mr2506823637.60.1789793211815;
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a197:eded with SMTP id adf61e73a8af0-3dda197f7d0mr2506798637.60.1789793211451;
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:58 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=722;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=e91GCqlvcUlMbFlsj0lGXM4SjotkKNP7xTOL1aANvcA=;
 b=D0ZjnZIo+eVMA1MLgdiKSpQUDOrmVryJMUpspf+xga7RikKcNGirtO9wKIPfOGFKgHaJOUf56
 qYnvLzjH1fXBtsOb1JoTogm0F9rzWujrlTINgCFm37rxz0M48TbRwZD
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aae13bc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX7cahTDQRc9/P
 p22MHLq27KwkLhukhSMPETLgD/Zo/5IoE9E0NBYpZksNvK4eVmk8IOWFI1Qr0Bj0VQrE97ewY8O
 +SLQDbJ5YmKD+llheEZga0g8V0si2No=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXytsoFlDnWHej
 Q1XgcGewULFGJL6G55d2ALkdc5CdwaPM7zo/ZKlbQsElRRXBBCR+oYKxMCDlnYYIHDsTF7Wj/12
 H1SBumDV0m8+EpR+5E6kDjp3YwH63daQJWkmcUGP9zjEW7MOhC+F93OasBR4ybIzxFJn2LbA8az
 8tFtyrixq5+27u2HImRRnDhiIHml1hl+tNj/6j8XU/a2ZAkcOvue91ld2d8zahiR14veK7ZwAPY
 +Cm/otWjfju8anjaqo7aJqGCnQU09kBmVTX9pV/2yEFmdVxiVc4NNpaVt/b7cT1b4zKu9dgWjxY
 TdBRtshB2t7qoJtIxecn0+358LBnFhIRdhKBlKSpqL+531cx06J/sZgP1mKBvDqF51o42/F/OW/
 9AJq/KAe+XIU1ebpRsuWXlXYCiEPKuEtl6zAZh/f8kPskqIlkMJ01iOdCOxykAUJErpbFibOjqV
 msJU7THu0LAOwYM5DTA==
X-Proofpoint-ORIG-GUID: 7jdsajt9-veJD4Q59v1Coq1BmbqTvuce
X-Proofpoint-GUID: 7jdsajt9-veJD4Q59v1Coq1BmbqTvuce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 802987da3cfd..6e0b7a54523f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -415,6 +415,12 @@ rtc@32 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1


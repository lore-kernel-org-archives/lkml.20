Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4082468C36
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778288; cv=none; b=Hkyb9eihOOxeR6LJyMjRYstXLrMvasbigPxCBDIUWhO6qShiXWnTAHutcOz4c3r0KWYdtwGcCxVe5qJrHo7FqKc0CFq4mnkd8QviQlveM9aYxRxLSmqlG33TEMNiV5Hmfd8/+EHVAQOv/xARySW9kYP95cE12EglidOLrkPlfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778288; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDu8j8awPaLWZT5+auNOTBYI1GFuNCnVRqppYnHFZnK1yGR/L8GXRLlFgOwTtubldu5cIvkG0PXCCfHR+Z3X/mboOyvNuP/FHc9/Og5wcDo/TKDZff1xD0boH4nwyVoCY2idMJJ8OMQ01ZNzKW9BBaGurwczzeO/GQlBdqVcjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkS27gba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDgJoUUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkS27gba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDgJoUUu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnQVF217656
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=NkS27gbaG9d3MtXD
	EallBjS5w0lf0sqjQLAsXEOywa0b2z0b052QCQ1y1M4O4+dlsA9xeG4HXFExz0h+
	jUJFk+4RqFImX02ieA2adl1CAhMSFb5om239ggLmWUazZM5TEfE7Ewxcwo3il836
	f1Ji8CsfCTH19QE+PrT0ijMcCR8hjrb9qMkA5WhC/t32O8AsaMX/OhtMtqwQQGfH
	TpnH25dfQ3pHJe0vBfyVPf2gIYwgiUsW+B0F8WMOEygtZOZqn6BDC4anI5hne7V2
	sop9JBy0pZYYFF9eDfhigjSL1J17NzdSOe6HMexkmybb/FHSlMtkX6OLj096ILr7
	W+FUxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgemc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:51:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso529029585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778281; x=1789383081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=SDgJoUUu61Jeo5iOkwn2qsI/lbN9q4MpM+53znFJUH3P6d+PLLgJGX5yLQoRT5lk6Z
         v10NdLNb+zkdEW4x8F/+HTR+8HQbbzM545iXW0FjjvAqy9z7rww9RWidiLXEBtDurWWU
         NBfBWxSe64K4qisQAADl0NH3VviYiuxWzqGztdxrGvPwtgD24uDxsPze/H19kaDJ0IeK
         fMhZQjc8zhD33lGNFN9xftAb4rI1PJ3iQ8aUo3kvW8nL8w3Bq3hiZtVjvg804K0T1agO
         83rUPumybMDKBGZxCtnxS84rk34Y4UNtLd92hq5kkoqoi9HqRR7W95jAd+8945E4CobM
         MP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778281; x=1789383081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=n45fLZtofp08IQ48cgwf0PK7hWKRNp6l69ZDmlZdGanYeLVX7v51TfGAt1pqJNh7r2
         FJBeFcVQ5dZDt8MIg7uOzAY8vhZLYmUlwREDwcZrkEtQKK+G1kjmEMCkNu5HpeGqUAIC
         3K3rNrjUktHSbTZqjl4v/QOX1yPHtT+xVp8gQQv5Z5YDB0liQsNA6yM9Cd5MdCtdj5TF
         Cyqj5fH3nHZmDAxIklkxF19SCn3v/1DgR/j8bHCrlKWIg2LoD7aKk2nCp4fNbKiQy552
         r1odr+HWT8zLdg6nkcLWvyN/8f5dbpfxQLkBgjHmDRdr+TPlc/R9Lz0uj02LRS/5kfqK
         xKCw==
X-Forwarded-Encrypted: i=1; AKwUvBxb2pB8GVin9FJvTfWXZzvj3m/kfDlJTSNFO00aNh4y+mu7qdgQMxdTWSGLHSYpeBTvjBL1IybTFP8nzqI=@vger.kernel.org
X-Gm-Message-State: AFuF++mkA0K+QQIEst2Mt7QY9dxiVmVv3X6dP462G12DLDWnEp5Cw449
	uySIoRyWsNBhcUTB2kOexkKlgJeU7z1Q0rsNjySlfoQRfnSWM9U6CrITHwDKdcOL7WQ6X4w5Zt6
	nQwhN5LVsETiDwaJD+SeGS9YMdEYSTTqfGQcq5BIkGaiUfh//ke9Cc6D2HUC1j/J5VOA=
X-Gm-Gg: AYBFou3aMv+Wrm/vyy5g9NiISJpvr8gWrxFvxtYP6XlTiiu4FJLQH6bbRPcz/+vA5Kb
	6CP2eOJKePKZwS3K12U83SLkMBgJIHghoUiULUjWg1ZN7Eg3No1Hb5T6DaUJHleigUCtoIQ46Ye
	t41wqiY6ZI3hJZz1cTz3pELNfhuthFpZgRIsOwxc24WzrMVBIQJeUeCxNBMK8XEbsUXvkvOHYaM
	Ayn0DEKUDcmM/Sw1iyVolSRIR7tGFtnzoJt5tUaAP+NqeJCS8KGfsDcWUi0HNwvyWHOj9h7KLKa
	yxaM9hBzNJJhpuNjQSIYQSqT8+2HreF4f09J5uIU8Kiqy1Pf/ocfhZkPAfyTA6mrmWANA/+KKQM
	dNL1kSTEEiOJL1m/TakICg7fan3E4QJE0dRTQA9QcfBis6YO3HPkpmmoywIggm/pLiwPu9g4E98
	nah7J06qj9sIc8MnYyH9KB9qJVh5UDB4/axabwvQGaKNS43+p57G0=
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237087985a.3.1788778280557;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237083385a.3.1788778280175;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:13 +0200
Subject: [PATCH v6 3/8] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-3-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXy0rUYg4hmABb
 3SoFEEL63+6gjG45MXnyKGCrQbcCCQfjwwJmPN9yR17y9Uldw6JbpDVFuRhQFrOfYQQIHOuxWnB
 Im0EmLVhChHfi14S+8ZUH+fd9rw+VkRuGthj7W/k1yrudTpg2DMPYm94X5+DjfCA/BLHD3FYnmg
 FcbGTnOi0QWQRK2XODWhcyTXh/coUHSdO4Du9VG/2Fm35uWHBDO7l+p9o9ivxFIbzQ3W1r5m3ow
 yLnLo9H0tQUn/SZ8gc3HKd0Yg3P7oKOM18tOG0m8rxwH0SdyJ+0k1VvrWxCFiAqbk7Nf0OKd3ks
 T5Qm/qN3h9YXgO804LHS7fQXAbrMsVVysFXs1wAv/MOaemjFP3AGzkrYXOPEROtvFiL8pHETaNI
 9fUPgpqfgHUqRI9XHEOOP91MXCrnSZ/5dn+u4N9zolFsGw4rAZ6tpbQbYR+X6suDWRmxJ5UDhzw
 lX0pwoKM2UgCXDboC1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX5wcDeY0KewC8
 qmB5lV4/FhmALZ1bR7NydAH6dbUcMMpwnucXtCUUGUpZ4l+Qn4LWHOoF7RQxHMHFZqVmVxLsfFT
 bnSLvOQrOT1EPWi+yg2vACk+R94T/Ko=
X-Proofpoint-ORIG-GUID: 1_O9gYxdwIqBvgh_Y8z-wo9JbK07MWTu
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e9729 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1_O9gYxdwIqBvgh_Y8z-wo9JbK07MWTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1


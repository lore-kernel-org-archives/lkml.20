Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572664;
	b=FzFx90/uRZ75uB6TlHigvC94uiD5GEHBVnsca2OAg3b3VRClVs7O3JMPrrPN40/FXgFN
	 pDs3tET0nci+2Mf0Y0dQqu2/Fn5YVnbEGBULm05jEHB1Q1Z2fS9PWfrCZpQty4XVcanKR
	 dGfz2gLyOAab2nDGhv7ZmNEnRFTTUfg04VC/gbzzO8ENGEE5Uyz8NKPiDCL8ZqLshbh9F
	 o2TnXvPNyUZ+y48MRLw+TO7u54uLqazRYbUVghqZGrrYhCmhPl7TebRu/IExtfy06eQzP
	 ehCQWwnb7cj4seFCWp8Te1/FpnXGAMZm92/cE7w3yDHMSGBOF9tB9bqP7Iu/XgEpdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
	b=3RNvnBMKoCBy4UkRYNWwf/pkMOvT1Rj5/XxZg2Ss7kVQAzxYL9t0ub+2FAfPfhNsLUGN
	 4Tt0c4YK/gJ+CzpAsPbyPNPiEw2kL5d8qAoaOTvStjS95liPRK1HAJvehRbV6+sLt0LcI
	 YZW5rkb4GWzoSKAKPLLBUUPonjpeDhAEGRsg+yH/t1nerhVL5+p+VqBgUT3lBjdH2tGyi
	 SE9d6Ji6EKz1y00N3ZK2wcmsHzSoxj3Vazb6lW68GncOKFPa6CM0GfagphNKL1gDrzsRy
	 DUzYwAmY335BfGiTQth17FHfJcnVrmi4LDTS0YMtkJpKMu0E/wiLe95GQ3AjhNS1ECQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T68PIrv9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036760A263C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7036760A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T68PIrv9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKgf6583991
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1I5Fpk9OxKRpuP/kBPSyuF
	L2Dpl8V/mFpHvK/1KMpxM=; b=OauCjCfQOozEM3K2Exonmvr3kZRLjOm0YoBNZq
	hxY+6PeQPkkaSy2WiF6Zx7MR/CCoz+o7VWJcuCXinnzDncz8EgJTd3WGiALX5Ebv
	5cb4Jkp2ki59qMi19qzDCs3iidv10CLpbYIDoG6BOx6gA8ZJ8x3ri4Wh3GPi0Dxq
	bkwh4UwwJ9f8lNK6cVQMc64IUnkuaMQKBWEYnvb6nAS503foatQgt67FLDkrpV7U
	bPq+tbTruAiDhaOQKH9uHdZpyFJUK9itzowJdzZiNWPq8aZLuOvX3obi/WjLD2on
	osS82S7pFTuNrsqsx1Y6T9lWBddqOPFIFMuo+z5c6+GJaVsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0akpxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1517839b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572662; x=1795177462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=T68PIrv9vBcKLXW/e4IlShurs08biqGVfu8AP4+VFrVQE5dsL0bnviIqDARVu4+Rtf
         6jqyMOs3ybG4+1nJY2OGaV2Q/HI4RVHoM7+hcnM36Ome0UwVT3C/WPBz9Qzj3S/KziAx
         pOGMRehsvdlA8RnKKjBK9RDDl/sZ+PQnBeRQmtO5repbH5dUSoSBYBD9XLBR1xGowNSY
         CmwWXDuKrRkezC9PHRQheY5dLUygtXBPVPTU1YM2XI13Ovp8II2tWdmerPG6vhiQHDZK
         Xvn2L6+AhnkgdaBHF5fjb+F5hGeIqYFKVZ6Gf2yLvM93pgCObP/Jro4ab+oUAhgRyeqZ
         m38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572662; x=1795177462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=qTTYSxgmCmuYEgxdEThlj8A8JzTwVvo1047KfvnE/kTOmu8d0Bb/FGWuNq5b/HGDvk
         H/CFzs9EVrOyHavjW84YRPr7M9QA+c/OXF4mB7HEO8U643u6XlgxoMei5CTheIjsd4BA
         58sdcHpOz0PbMWb2hmKje1NGwdYiGfu5yMoKohd5PvYeEHpyHYLeN9weItx09uS75x8s
         T+baFNCmx2RGi5v3EAuIRqTmGJY4H2Y2rMeRN7c90Dhbp+inK7eLZhfScR3hF4hFZgEj
         hJGWaSwQ4ns7VpGN0nmdbEEfsvnsAgyfdAajRphsueEWwlS7RPmdKxr5R/nqnIyajOiv
         uNiQ==
X-Forwarded-Encrypted: i=1; AL+hErHMdOFUUE7OmB9TAJawWVzvFhdXkBPcD5Ky3vALDmbZ0vULdIeI9LQs4oBZ9xB0FVWvl1SdKVQmO4/hjS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cuSXADkJGHk0g2KluwZOq8wiOqV0xSVzNFt0KEJ6yFWGtY3xh
	DnmDgWHZT/6H7/b756utIjp5vjSFs3y3kgJx2KdcOfWToj+ZoPUgBHdE5hmfBClZqVQmngtb1rb
	/2y4J+O6GSpUhYNX8uATgTA1l2xRuslKy7wz6OZQ8hNKaBW297CPMKBRM8Hkengjqh2CBFfbneK
	kaGQ==
X-Gm-Gg: AYBFou3MCIcpuSOTgBEjmlU4a61ZFiFW/vzyNNJI+tLt/4QFJazvNl7bHkcxYCcC9j6
	EUdaDD+6F+ltDLdJVexHXKOS4DcjyqwdXoH4QzHPvK7wDaEFDMwZFk558jug9CuE7WYKSJkhGuv
	4PE3Wz00PVlKZEHriRoU6dvVU+4SKi4s3/s7vNMEEz3tStZC1zr7Fb9A+xhqd3t7bB4pCpH0CGl
	COqyC1inSK4G6aNO7OP/6MOZaQkFLanmqHeEq6GKHdcgqYbtwxgpK+v1X9aETmItb6K/uKQ8eAA
	ARo24wOWug0QhQd3jrd6kDtP+TliyiVf1vePCOVwFTQHKbyttYpug7oTqNeltNWb52zyK5xx4Fu
	BaG1eBg2DL9cjDpBWAkDGDv2vDz4tKjJ9P51UABK+YKWY51TzZAqhgdZkoitATDFokoTH7EqOm8
	yotr13un7j6A==
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537424637.7.1794572662459;
        Fri, 13 Nov 2026 04:24:22 -0800 (PST)
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537401637.7.1794572661989;
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] Add binding and fix SoCCP carveout for booting
 Nord devices at EL2
Date: Fri, 13 Nov 2026 17:54:11 +0530
Message-Id: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGsB92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3bz8opT41Nyk1JSUVCAjx0jXwNw41cg02dzIwjJVCaivoCg1LbM
 CbGa0UpCbs1JsbS0Ac0uM2mgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfXxyNk2TwtIwsm
 JuggMIDSxnvESCnUT3n6mYM4k75d5Cv7U37bYNa3c3bhSZcepNNt1XB7ZUs5UkoZQVegoHwZIVG
 3hUgOWPzQDvdJ0dyosCa99VV5IuqRpI=
X-Proofpoint-GUID: gS5rR157GrTH0MA9ncjh_FV9ue1mum3C
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af70177 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7kJTSH_YnVbI9ikjjQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OSBTYWx0ZWRfX+lHg5gKqdEEq
 iAP+WrXx11drxXSceFgj+7ws2+/WPF5J+jpN1T9ANwYTuVIrFpkaiOhSbUHxHN1XIqwW1Wap+6A
 KkmkjO8V8+b7JVVeb36iHKZs7UNqKk7yg32ll38HQlXVPLLzvqa5lwLvF16gi4U1uJ5EiPa2umO
 1axaoqenJD4xsuHKxBHGpWXrzDvkPK5yw9LIUtuana9iQ1HucoRvQkxsxW+Sf6IQHjO5IuDTcHB
 d5C7tFbcN+YTC/T7jZww2ts3jW8tLfFO6VC2d8DrQ6zaTWs9WoMHkB3Y4hrJsMOD2ic+CIAM0aI
 gUaIyImoyEdxx3fjVQ/Ki2hvL8oJ+V/Xt98hUMjAE2Z3vRXZYaRiMfMrIbNukcPc3QIs1s550ls
 3j63jyHoQKakbzKVrjbiv47FO/vy/Llse0/Y3yuPI6ZYmVPC9OP2kCwR0XlJ59WawKPaQI2devX
 wj+rt+TmK0fhFfZFALg==
X-Proofpoint-ORIG-GUID: gS5rR157GrTH0MA9ncjh_FV9ue1mum3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130049

Nord embedded based boards currently boot Linux under a hypervisor 
that manages the IOMMU streams of the remote processor firmware. 
This series fixes the SoCCP binding to allow two iommus entries and 
maps the SoCCP carveout privileged-only to avoid a stage-1 permission 
fault on first instruction fetch.

Dependencies:

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

[PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc support

https://lore.kernel.org/all/20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (1):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Allow 2 IOMMUs for Nord

Bibek Kumar Patro (1):
      remoteproc: qcom_q6v5_pas: map SOCCP carveout privileged-only

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                  | 16 +++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: cb70f5c1654381390efba76b2feba8be2331b83f
change-id: 20261112-nord_embedded_el2-073e25c7289e

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>


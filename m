Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C2736B90C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973544; cv=none; b=nKLycxWARkWAx9re6gLEDrvcJro9W/DqJ8dOCrNrWguu78+zABQ7znZSM9NqqczKE+2cHbG6clwpdyI4kOeXkML2f5QZBkaVCmUGxoetpAsq6K2nDXVgxY3bRknKFlWHKAB2EI7wYFG9YBGyvmVPxeZ7UJ8ERn7CENU5MSzBQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973544; c=relaxed/simple;
	bh=+CrABi2X/StxEwnWst3mUt/1ibBP9K16D9ajzjNs1nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+g6zn/cMjFx6wmEcZHpJ1qyJabZpN+IesZth1xKVZE/tWsseDjh+n/f8T8CsbALUot8ugdvXMWPtGqPBM0BPykNVVNYN3oeORuwARzU5BuN2fA58bp9dMUjA/J5jjbZC+jIWVJ70XhCUs6XacU2eDunkklYYxBvsRxoucbeJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEmW03b2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhdtkxPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEmW03b2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhdtkxPC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZQiv3490655
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=; b=SEmW03b2oK+Wmo+L
	G58/kzIvyv1Ib5YIcJZe6CfEszuxtsZQMykRd2B1l6ShH3OmY7TJx5kHdAxzX0Tl
	8IKVnbGGhYwLSrRY6W4kE0spmAiGPlLejQEup7pLhc0DQcnNaqMSnL7KD6KkTLvJ
	/ozior2MOQMus/imcDwfTVHS7SxsZaMc4qcNs9O+YFevOhnD6ZNAUJ2p2qQdjeRD
	eOM0qH0n7I3bp1UxJ/LEdKD0hKEVw5iq+Q3/jm1oPI0nvLmcIypG1/Ttkx4wUE5Z
	ceXJFrkvzrXilhJCYSpL+EJlf1O5iCaLoMv4NfUCkR6iY65E1jLFACKHrwI4v6Xr
	q1kSgg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9w082-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc51591102fso3962822a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973541; x=1790578341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=KhdtkxPCUOvq2lOPtzNEU3cXIO/2E1pRk6GvanrKMlOL3nn+sF3M+gR0CZV9mGUnb2
         kgvXMqSyVQS85kxOh+M88vQLe+xHCpP1979hzT62WjV7VOzVmaQ+4Yvjp/X69g2lEX6j
         HjhNdYxJSvDDoeG5DSzfdXgosNWRZi3E8wtneNmHoc7Eby8NFjntS1TyyJS5UL9dcg5L
         tGUbbXr1aEPtj1vSVdsGjt7Cyf+jmH5E73Q5VSYFk+lPn3UACNmhkD9WbOhixUsloE9W
         IFAhFG1g9wQy8pAUcLoqrtevuVyLCyw2IRHAvSE17D28Hu5tSXv0Ai74+1RnwsVn+1Tv
         lFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973541; x=1790578341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=eOGIduAhJUYsvWBP7s8cyMaevV8zmTCcD21YQsCWEJFAJRz8K+icBKNU6+4PGZiI/N
         K15DwTKR9mp5126SPoNrbmRMz/AzJSSiBfot1E7WUhtpuFTSErJuWZmx5lmRJU9j2HCw
         8n5qduvZwHFcJOECf8LDEUrmFVUc/DzZeMhUzwf0f7qPlNEzu5nten/9D/7vRmEzUKNS
         +3UynCcLHMXnNNkfzGqcUKFiXNlWUEjLFhJ5/ul2PWDsQ+Q+8b88RRsoiJgOLEjNnVoh
         D6PQkXyDGlWfoyDOo1sCVLRWsBmsMbJhvCchDz0Q02av9QOwRyuMIGpSsNvn3Avbko3p
         tl8w==
X-Forwarded-Encrypted: i=1; AKwUvBzU5nweIuLKrb3arSCktkL7t8ZjF497vdGNx5y1lTGiemw1RqJwRDTNl2a6RHAYjzVZcZVmVltioazssr0=@vger.kernel.org
X-Gm-Message-State: AFuF++lG4BYVKLzjTOgqOuSdtdh7hpB4PbLC8Oflz+aBpNfHfUBIdsSk
	9ie5WlvGpCWf2lDktR4q1KhrxOjAFfreT5FVPUc4uwvHlZD9EY3qAj4PhsZgf0TizVYzMhEM5Vv
	1LDWBXxMd7sABOHv54dBYsO7vUCCY1QQLz1qzd7odwtU8ftB8KyLh9FsnV1N25sRvVhY=
X-Gm-Gg: AYBFou2dG9Rx+V+FcuCbZU8/zzB/T8EskPTRTIQR4kjOX6wl/iE0w2G0HJcihS67KTH
	cHrEldchVq0Hx5ocCdMyWJnBG2NecQCXR7F1eTB9bFO/La3nFBKFy/ozsr3q79PU4bPmJC/3/5H
	zf5vf54GGaT26mmrtEicUxXopH6fntJcQCQbOL1/OsSJKJDHkziFZCOm4teyiHfYV7SUvaRDPDc
	OLm8q9szI2+kqF0uYOI9/IKV/J7wpw3RMmJzjDekLdUYhcEfwMV+qkbYpABYyFsXURPcp+47Gun
	rhxVZYQzsFqT3sUi3lys9jc/qk684wN4r0Pk39a3s4DP4K3IB6l0k5TtK3FlB2/KXiX3nb6+qRz
	HEl2nOOlPBbNra7sxyBnj/lky8EFq22D4RzoA6jMUuYQYSrcZMrB21R15En6nlGpyAK8wvDfFtK
	1dU3/XIULtQifOoq14zwq29sfurUeS05eIJg==
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:34cc with SMTP id 98e67ed59e1d1-39e6c693638mr9665637a91.48.1789973540952;
        Sun, 20 Sep 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:34cc with SMTP id 98e67ed59e1d1-39e6c693638mr9665620a91.48.1789973540557;
        Sun, 20 Sep 2026 23:52:20 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 12:21:53 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add few more SOC IDs for IPQ5210
 family
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq52xx_new_ids-v1-2-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
In-Reply-To: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: _Dm1ea3u0QHKcOAHsklDo5i9EfFFOYCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfXxOcl93QJIYw2
 87SWvgigynSyQQ9EMVJKskUXJufWzHYsp/FcmrGu9pdmymP8wWLVYxR96UlM+iutMRi50AwsQ8u
 amzE5iY0ho3bKYBsSAOCbPfrGBJGL59G6ETT5hlbljp1gFKEp1ShEQfC3AYRxpGI9Z4IWTyQjqK
 L/y2OaFfwQjiDRJLjZ2yPFS5RTDJZ/O+c4/5KQp/kT+RoirlIqfP85Msa4Wv+ZRUEiO084/NH32
 o+AV1H1eAWrcIg+u+PdWA3lZnfbPZQkjIdTlER/69P+01ePxxjt51JaMnYWmWhNCmiZd7GjX98D
 y9rHZBMUlbS4T7Iu8391UrsBKmpfTbMv9BV4pmuPxmVsQS+iL/r/Pkpb5rS5Y+httaOTwfhZlHz
 MF8XtASaQeNurJKd/b/VhDVqngTB58lQe20H7ePu6XuVof5P3d3ipj+hxUD63wf/gz+Yy8RvTYk
 t+IlSQ/pzSe9orfgjkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfXzSGeEgyh2eBS
 prgOPEuEul6BK3ygTmPstBxYdu7o/5NOPkRxcLhZPerPGgNxP1HZgNX50oPJwU4DsIt0oqYb1mX
 7Zok0mHPTFanNq+m8LYo7b7dG3DDxDg=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6ab0d425 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PP8aMIA6NNbLyI7UcOwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _Dm1ea3u0QHKcOAHsklDo5i9EfFFOYCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..4e7e14fe7231 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -558,6 +558,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(QCF3211) },
+	{ qcom_board_id(IPQ5211) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1


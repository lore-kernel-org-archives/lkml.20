Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC60483BC6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533525; cv=none; b=it4JMAQroszIr27eDJKsxnhe1wTKJe/akPPafSTUcZ6esDCA80yDSO2krAj2SPsn4VlZTqv4wHB+32mV1JqxZqGRkOT9ZV2vR7MQ1tI8ekalMy6mBujLMMV08iVUCGyXnUbL3B6KJt7eovUrjIHhgxFbQr9RK2zWUV+fV6oZB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533525; c=relaxed/simple;
	bh=k7ywAexLRndNEzyP9Z/lW896GOVpIW+d8qP+ys9ToFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3n29/9IY/uJPefPCannwrgr9xtnwVEnzYJx4T6uSqOE/1/XCmocHR7C9BN5fBtbsUEG0Ov5MYtlz5UOD2T1JXVuUbEXhr3x0mxhxwlpiLqg6aJRGeTRv+J7dK8w+wNR95irbLQj+OvuCqOtyrp8XUwb4/TlVhZu71OAmD2QQWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsCoz7MZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLrr5RRc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsCoz7MZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLrr5RRc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HOV51089441
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RPo94BEyvNwelbWa1uloETmy3zp6o0uSUEe/frqI6g=; b=jsCoz7MZVgBA/+p6
	BPW77tt2wZJgdUrIaHOLNGDoHeNDWWuX0wlNjcrbft0UdDfkWjQ208u1SnInLlfG
	Qu+DCRhZ05ifsLTSRcXjVnxl939SOgaAgG80eirn7qzf6LibIa8xhf4Srfg4Hl3M
	8CA8TaBnC8lO7TgJrN205lYxpkxS3l8oywKMBCYJOPBBylDXaCSdb1WG+MzzUtBY
	iodHql+1KrQTXTrxqBw8XUf3XU3IfuUWVpX7yZolMMKOXOQx7b8TR7hxseaWccbu
	7zjJTZsruKheP76fhrBdIbhjvx9jT4UQLc7aVjgTY0oGyEyHyzcCYs8+RmnCRn4Q
	UHREGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvawuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:11:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so1123097885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533518; x=1792138318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RPo94BEyvNwelbWa1uloETmy3zp6o0uSUEe/frqI6g=;
        b=KLrr5RRcUBPcxudpQAvh980lfnGiq56+GFWfTAJNI1JKwd26MOD2y7w8s0mNVx/4TO
         tpwCXTqpa3wrt3zAbTbUBZwMqgcvPQdSoRAfYPgCupNKcqEJ1Vu5wRcQ7HjBdSmacRcd
         7u4An0wz/JWuY39UnoSG8S5F8o1+PBr5BH71VZOK/Y9OJWliefxeOkNe8e77YBGExvX1
         QN7MA+OdykVA+I1sO5gkShQQchi32vpZI1UU9FAqGmQsdsPB5eNI9I3Jz6cRemlkwPnV
         8/HO/61zed4woVFfsiD9dDUCUyDA8+HOF77b8N0ahCbZz9D2VhTyKVXl8egQ8tf7HSUt
         eJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533518; x=1792138318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RPo94BEyvNwelbWa1uloETmy3zp6o0uSUEe/frqI6g=;
        b=kigsETAQS6KjlG+KQLxqJ5GIlEGAxAAkav8rBvqnTWexr4hZMRY6Xx/R5vUhqilgdy
         AdDlQeoeYwz20jY4GNICBUSaRa454USZX/GvcF/K6Xsk5L9KOkQwCE3zBFOiRuKX91gb
         d3U4tUmvToSmy83I6J+DNEWP03onq9CxTH23uOVnsMJmJsV7PQRCZYpTyRSYGrk0KYHJ
         vGEdzo1Hpw9Iovk6SgkL1wFoUeY5r/98ofObzNDc1/vEvfeShjz9Zp2whe1zQUSicFLC
         N97Uzbj0scGvCCAa0QyJV6PdkwprnYd2ToQwPR3Qo15kjO9meOBIiwH4o5ewTph+QZwm
         lXxg==
X-Forwarded-Encrypted: i=1; AKwUvBxSv+2OgbTmJDuL3GCN1dRCRDtBPJlZniTxUuuXI95L0BW09OqsfyG39up8TsC73e4/zMbCVLjAInZmrJc=@vger.kernel.org
X-Gm-Message-State: AFuF++kvEsztQwVC/iNuIEINYhO423AVD/FnYyEHc9Pl+A60IZ/NwRSP
	YUFRxEG/PqLsF10ZHt9b+lzl0Jr8wZKOMLoeAL7zCZ5sAKgG1Y7vn5uilS/a4OkwXsfRn7ANFxv
	ldsybSNTRlKjef34OfhVI5v5cB13Ef/pvpfjfPW3ViyDcyX/FDQfu7KMweavpdfrcb4QrEFdvJr
	yJuA==
X-Gm-Gg: AYBFou1hRLWc9kivfrqRwc/9mpksgADBSpfbZOAz2WtsxgC81X742sjGy2c09zOeK6p
	3bAypMhlSZBhsjwfL6TD2zXtdQApf5fFBoILR7u3GiYmZ2XhCoXXMQXmcjzR2XXZmpkLkQWpWf/
	Y31ocqic1GDcBm3bRLItRLdugy+88jorh5UmIhROLChsWu5sTrEaZd7Ki8gKq0p/afaTtDyzPw+
	X75DkAHwoZXvSIZUQfKQViMYBiqy2k3Sn8RdfKlv/ItI4VdzuzGocy5QaXgONuj5KqtvmtBkMhr
	ihJuPdACEKyagIdrjH/kHvYhxVBK8RBDZKSPlV94OAIM5174UZ6XlFRziDqGToTWdSm3PRlSKVU
	EY2jRgncA8MeI/TBK9rX31By5WlNOCRhwzJpS8mzE2QhWnxL45xVc8mqHbyFz5VUNNu+P
X-Received: by 2002:a05:620a:17a7:b0:93a:2d07:142f with SMTP id af79cd13be357-93ebd0e4d38mr168101485a.7.1791533517946;
        Fri, 09 Oct 2026 01:11:57 -0700 (PDT)
X-Received: by 2002:a05:620a:17a7:b0:93a:2d07:142f with SMTP id af79cd13be357-93ebd0e4d38mr168099085a.7.1791533517486;
        Fri, 09 Oct 2026 01:11:57 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm130780685a.18.2026.10.09.01.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:57 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:11:21 +0800
Subject: [PATCH v5 2/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-purwa_camss-v5-2-58c13dc7c4d2@oss.qualcomm.com>
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
In-Reply-To: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791533502; l=1376;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/TJrDepvDQN4k9e00zFZKeEsnj6jABLsbv9gdVxB4I8=;
 b=WgCRIeffyqi/H7/74r89XYN8vZMlIxplmdpNxwAE6NnuiU196LmjqoRtvJpFD2qkxX4AHegVX
 ZyK/uUrJh1YC1DpomPxFmEVRtJnz8nTH3ROjvP+rdK9wRkzJi5M+r3k
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: -GRATqvgvHLaNQnfFynKVaRC8M7MtY5W
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8a1ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Bfuyz1jv6nlCx4zFUcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX1ny4WG2n+LhN
 p45/C93LuZjllHYOqbBYRaCKRkP2V4OEf1rEyUEHMhuYBXnNVFLW35zb6+wytg4gnIXGW7D0cbE
 cyb4tHQzDopKFOoWJ42paqbfTZu8af23USNc9OoUXK3QC2ZmQgU2G6RQgp3pcVL6EQCZlrI3QcT
 e8zX6iBCMFW7r6zyQvzIuqeSrrm2gi0Hez+BY0yLVQJEuy7565lQoH6R0dF9+oGAQ9+vi0aEcPT
 dZL1JP/lWBBIUZmYDMue6YbOAeTqRXYDrNNOA5TyruVnKengwGNBPQRM74NSwpc3smUklcxslLi
 rSd7iVP7xA+AlTAtB7+7wN+HThxBoK6ZohKruIgd/daEFvyzOTzmyJY4vr75weh8MvYoRZYOYAy
 RoRpHjU8soEDN0nQtEZ+M92gALtQRJ0ZMSdEKiiozfWXzRi6MgNFXC7MfyhGzi4KpRHSzY330bF
 isfmY6WZK2MU2vbX45A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX2QxuYskZ4YhU
 zda1SqM9TyovzQMdGdsyFy5GcaO2QBaXSl3zkqsgvzhWewKxzempRK+6Cpn9QSfzreBoUVwqKrx
 uUvBVo9Ctz/O+Jy6PLHgZAvSxPoi/bg=
X-Proofpoint-GUID: -GRATqvgvHLaNQnfFynKVaRC8M7MtY5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

From: Bryan O'Donoghue <bod@kernel.org>

Use the default case for the common source pad format handling.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..b1d9fe0010e119059c539c20c238c3e050ff7036 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,20 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	case CAMSS_660:
-	case CAMSS_2290:
-	case CAMSS_6150:
-	case CAMSS_6350:
-	case CAMSS_7280:
-	case CAMSS_8x96:
-	case CAMSS_8250:
-	case CAMSS_8280XP:
-	case CAMSS_8300:
-	case CAMSS_845:
-	case CAMSS_8550:
-	case CAMSS_8650:
-	case CAMSS_8775P:
-	case CAMSS_X1E80100:
+	default:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -414,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	default:
-		WARN(1, "Unsupported HW version: %x\n",
-		     vfe->camss->res->version);
-		break;
 	}
 	return 0;
 }

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736355;
	b=smPMcpRicz1ssBXFOsY0Y8KuyxOTEqljItgOW5CKUqOlsIrwxNAUimAYjCXCE/fV09wR
	 hHL+5i9A06v0LKj+6aRVtfZ7eN5xoF1/HFpbMF/0YoTIQTYYuIygEgpfWNiV1u/qo0+PM
	 g9j/VTcEDanxgrmcNHw9Qn45+aX7XX3kXC6Plg3u8R7Y9gNTY6q/NoBY6Tv764add9l/k
	 Hs576mutznuSTXja42mHAnE8M6A5kgzdJPymycYXJpdh6nujfZHld2FuPaB7q9T6RcUs3
	 kWYSXd/sIKzgqFCL2symK7+qR9SOlaVmlXXMqfCKM6lDLklKZqeWjoOqyShBFmc6L4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=EqJHhGK+zs2Mp538lYSe48Yvuie/XNm+WkCgLKtY+ofh+JF94MtEgfpSJYtwACtgXW0K
	 wLXoK4Vklqk/zbGbWFzjTaMYS02zg6cOXC642xl9tkgi5SlYL/e5z61rQ5luJJqHrB83J
	 ctZt6vLRpmMH2+DxN3Y3HLX9JxUq9m0m45IqZQWavh2FEJyUOjKBVrDIMfBvhlMQ637mS
	 X3RMG+bqr5rxcwctRlGB+YSmTB8C/AbAzm1hjKyHYLwDzDjjjMtF9WLZW01YITCGzJJu3
	 7PvcRADHnT6VzD0qLvnmDBSR9+3N1A7d2pINY7u64eyXd3aUGQgzwu97d5IUxNG2xGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A8iYZke/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D7606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8D7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8iYZke/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IpASQ3673212
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=OrdkKGXMIYie7ZBw
	gX1jlhQeGe0W6e+SD2J+U938n/FIjb6t/MrnoJrjkj9ngAeb3GyWdxwYhUMijSz4
	c3MESy5kh9H1mf14YhEvsnc9EaKlIp1CnNSmOtUSa1tnBYWGFSqMV5ru+0SCfMyk
	wzcaZ+gwn4ZTlGBFp4Q1bLIHntDHo4XbHS8uKEWRIuvtNDR+IqmjNaUSm5I7U7OL
	TYg/LWQZ7thcXer47bFvIdxhgoVaeJgDwuP9+ryUvJJE1fkf5NfROFm+5+Ov/qaP
	hEgb0CNvqMcydckZ8VngxuvfEki4uNsQX7ujeWJ/FRwUK3mE5jG+4kWryOGCHAeW
	QfEXWw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ng98f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:05:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so1174184137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736353; x=1794341153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=A8iYZke/o8wtpJunv+zXr0VhcPeHQyuBbFbYkQwcpmlVicQx65rhK+ksKl8jrhCHc/
         70Sb0Wz7JCgpGTyAGauaFMNmAsHPcVxOtl2CbTEL18SNcCs7mxPZ+WOiRvuWzkyZGagB
         d5CEEdKlu/+Nn1YSPB8wD3Q2bGppdm7fSBUkNZ2EtqpJIz4z7fsOMvdhKHSbTWSUelDD
         BWNeUUcJVWO5OFI3ikqaSbSV/eB89elGVox13SWGI5GJ50HJXQQOaH/6QKKXYxWsilJK
         ogi6n3BpTax+g5xwRotoMus0iyTVO/SwYasf9Y+hP52EmgvpFLC1q3fRmkY/6pPS3G4E
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736353; x=1794341153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=ypihWXJC/WCVcRe/GJSMFc3dMb2unr9ibczaub5rt1dEuFlmS8F0x8Y164Z6rI9VjN
         EU0ZwLE0L4yBYuee3ZhOzh2z+ENQYA+OeQGJTJ59ZItqh6X5LXU8y7qihWbE4eh3F6Zx
         cY5RI5++jKHIH50fpYOGv4Ujcd7WRCfiVsbJgI8Se6c6L8E+dYn0RU5L2EkwQSL7oNID
         oBJOjKX+/QkflqAvs5Ev7moBmTmKLntm0RtAymvbcJHCFiQEB66PIjixqZYEeUN97e9j
         hICVCYKgLu/heJJZ7OdozLBPmKeHrSMCRTxhQHlsQcXnSRV7BESiAv0tPvY8SYFD182O
         VTVA==
X-Forwarded-Encrypted: i=1; AKwUvByW67T7xMNlX8DZs5sQYOKYoZdppTNao0pqz3jLdORCn5d/dzgP6c4k5k4yagbxA3mQur78RwJ7bqmkgmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IRcgMb1fWgmBzjwC1K9U7fetees2YNCN1vFCav3Qp/A9XE9xs
	S2qaqOi/smnoQYYepxov0jpheZ//0/TKUvxMf4phMBLajW6Q2JNHCgsNQbgFsQIBHvviLkXUJQy
	k16sywpAuLtk4nk75Aq4yCrtYseHuFtEW0rzoKI+J8X/Dr1gJGZs43imXpxWqcku7zsI=
X-Gm-Gg: AYBFou1/N1P1jzy6Vn5XKnLVUTR7Ga7FQIHWS4sHhhNZd5KmcS5NrvgLCUt/8f7DbI3
	Vu3dvzXJLt+EJxww+2iRdfB9XUVqMAzrLDib7nDEjmmeqTSKS7yl60piOHdNiMiDiigh9xv6thH
	RNkqzmunhUGajlEIb2C4u9WByEJeXpRaNkRXf5fgHuBeVZxr51lrnN5Hyzw4fPUc6Vl5rrjX2zk
	sAobm9O24HOZR2M4SjWgl7zvONpLzDdFm4U6Mke/u6/VexDxdsMtRN2A427FJJl5Qw3eypm/m4A
	3HUnSW02v0RQ3zdlBtZtYl+9RsJl/VVBC4u/9bkuejpKcXtDF57I3oHmhH5S0Ef5BkHm7Rw+8Sy
	WW1qK3CSb9jRMQI7pYDXc502u5zg0G4IUGqt3DRAiG6a3KjYDKcj7k4m6FEGyxnk5BQSOs/kB2T
	4IIEO57+lCHFhrSN3M0w937qA6cY5t87k5LFEnsFNwF105rSo4wRRZM/jt+x52HDe/leZqMPwqQ
	N5G6VDW4QSzOtF2ikw95E7wTZou
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651417137.5.1793736352887;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651401137.5.1793736352383;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:45 +0100
Subject: [PATCH v13 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261103-camss-isp-ope-v13-1-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX+aU/dBWH2Yg5
 gqnKJAztkTVFGjpyk226kJMtczYjcMgkd9x3+M+CV+5OBxb/QPUJHQ0LoFKTEFmSTOrg5RRQ7GY
 r1+RAUjj+UImt4XiYi/kjb7dSpQ16VHti4zTKl267UERtycbwNvkbywd660w56p1O/0IWZINmLq
 CxbVtKCqoPFUYLPcr0lP3Oc52IusMiT06CQxV46teh8Z6rEs0w3hNMcrWNGMkyNNpA3R/GNVz4m
 jbpaNDVOS96YhGJx9P+FcplzFTB1ZK4ozTIg4aLE6p/UKCg07Q1NEacEOaunwRF1IK4Q5APFXv0
 +19HHEeAUiHx+tSK+lLqKsunezUp45eIi2fnzsQZ+v7o8/vxJzzrU+IXuJWEs7S27o++wIjIkLX
 +IESMbY1IuI0879Ftq4AUTX4wE84XibK/HlWv8qzoQod4talt+Cs2wy2HqC3J1nVzaewHHhJenw
 gcupm/0bDcV42DNO4+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXwjICvULQaQih
 a23pFd9P4g+54CXX+kIDVDwNProNhn00rXUJ93SFGjEWG2pgATw8ebv3zSddDx0uvZhDsRGINEq
 1U6U46VdbCQrQL/z4/tPdzchwXEmpB0=
X-Proofpoint-GUID: 6rHUcRozfH6_uoEWt3vuC52wrkxGEZcs
X-Proofpoint-ORIG-GUID: 6rHUcRozfH6_uoEWt3vuC52wrkxGEZcs
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea3ea2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B7147CC91
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327399; cv=none; b=nh8nks1n8g2v1ty2uDWithdYGbldDs9p8/nU1Lzqou9sROqqIizG+6F4YrHmRkKofMS4wAEl+PxY2QBiQp7fDX5Bl3/Klyo8ERtXk/hDO9RJlUDh/7ncWpEWY/xqTEu5OmL9Cqa3iCXEUM0zi/IvjnF4965zcTYUqzvUlnLYIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327399; c=relaxed/simple;
	bh=t9VRl1nMX4c51HXGRlVcUrJ2vYPgoDYjYMTLiyXwefU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLjjprwdNo2RbL3Aj+TZ9dZnt9BQ+MRhgmFKln1UuqdKoAVQVCYZ2LLzIhTYB+ev1CiZuLAMUsKrEUfnc/1v3Lp+3lHV3D79xTmwGNuhG6gJE+n1FlKhgP+RaNFFdoDtsVi+miWopuItyXg56xpimjTmfV5hsqM7mQTPeO6EB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/QXYNGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjPv/i3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/QXYNGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjPv/i3Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YYHK208419
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=O/QXYNGBS0gU2Wwj
	BSACMd2AutM8Wriv9s3EDD/t0SeQ3tHAxUJCPc5yhB9muONFusmu+Jjt36mWXMtZ
	t+Rukl2AF9W/Asz26zxAB/wEvf44UQL57ydgo+ggP0bFMSyCVJdW3YbuerqVOtXg
	wEMK7PfZeq1HgBMmnBj+ueByLT1p4ZPdd8kZEWxNIYc9UxYLQto/IpPtFX8efeQN
	0c1W63ycPoeuBp6YoXZeB8+pYDJPyPBIdXzyn5O8Xm5FLMHe1dVghbAZRFKZ3MSg
	Xw1EVOYHHsr7Apwf3sjreOFobu+8QRIqL+hlO3zS1jw1YQmNs85WVCFQRYsRJVpk
	IFGSbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tuf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so145371085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327394; x=1790932194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=gjPv/i3QM7yR6P7n1zqh9tT5okYYsu7GteMflD4j0ouMYrFaLAIv1BRGX9/liZl+sR
         O1M1MZBlBvwYn5CEsxjSWdQl17jWeHyYYqZ5l/Jzse0+aBPm6489ZeF5m7CLtbRL5Aay
         9Y/bZaEHQ3Prfxl5pYxUO3Ge36isz6KUcHNCV6UHvvCRGe+R7rx6K5ypK9SM/92/cHEI
         wBLkvH/3s4nW7gFrSti2SGtix8JwEgWNbvbbp5/q91sLAHe6LtQQ1bGo7HeuucqY2Fko
         6FqCh4k2MswEQRv6sjuJPTc/KwG1tdpZdupSH7h4zUB8bDRVABuZXS96lOn846R4+bkU
         w1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327394; x=1790932194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=kDcmuamqnpffOvoeo0BBldyWzBl0QKRJKlBKdh6xn8x1t25TsF7Cyou+XgrDYAGVJ4
         muY9+1aXhzLJZu0z2xCy0I+neQBydMnd574DEZEcVxNSqS33Wul47UAiX6oY7lTYsR2t
         v32VkBlLhKEfOiJJ8oSDkJsf40unzqhQNDJGNrmDGmhqx9rFimTPnUm3WjNBlOYYgvjX
         /KIoDC/Inq8jklUbkUfVgdTh0caIySMXN+OdGrwQUtF/9Lcp0nPnMVKN/lnt8WwASlUV
         1+Tajeu5hwGBQ3E/vFDp2DHGuIC2L64ZN/CxXin3mH7XkT/MnIb4qV8bL6OdXGx7F7RT
         Idpw==
X-Forwarded-Encrypted: i=1; AKwUvBy5uwlylSNQS263NjZsO65vdUZPzK6DHm8457ZwnqIgk12GJqy9jRviL2sP6n1Au17i/m7ahE8DC/DKTC4=@vger.kernel.org
X-Gm-Message-State: AFuF++kXwQ/8FWpwk4tJrDi2kHreoahzzHljoiVHoxX1D39OSTfuydh2
	ase0rPGLJW9DH0seLtc4X77tXByz3FJMUC7pejQvKuXxjSAWoRPeY9XrewLUKMBBq53Aodli301
	H01cnd3CdnEDSsyl3wrxSoYQ+2ECsWvV9Q6mjXqp/3UaECJhDxXr1V6GZFIK1zdRTijU=
X-Gm-Gg: AYBFou39jGxB02rRDesmmJ4q+vE8m90VVEIaAil4kiIE354oxheAS1DVpn3Mx8W9KVn
	nb0I08tTz6X+av6ekLe8aFAWN4VvkVq/A9WIuA/xMbfZB9aipWDookXgWbsbg86wlJKypxWpGyL
	6eekrirb5Sp19dyBwW8SKa5isptsTnXuh0jHhJFvb2wZG6/0MieLKdmEdo441UtvkGtsl5buJ+Z
	zsqWGYQG1+xpOO5wo0iausVOLmjBpd197XW/rpOPqW2WEIVMHsNFf0HUGz0iBnpauAybc6dNHIQ
	hDkd2pi+NF+k7hErqrA+6CorqWeIWFob/cW6MNCOnU0rooKjRfx454cFTC6G55LRkHYsgjwN3XI
	A+J+ML4OdbJsk3LPDWb1+XasUalHEC1yvzH3cUKQrMsVQ/aezutn6Lim5VpwKHueZgPj133Lh9b
	bPLaHD7KjEndg0kashO6xdW9HeRJ62Iika/g28TjI6wjs+eBvFXY8=
X-Received: by 2002:a05:620a:4451:b0:937:19d3:3fda with SMTP id af79cd13be357-93c43c1247fmr298752585a.28.1790327394330;
        Fri, 25 Sep 2026 02:09:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:937:19d3:3fda with SMTP id af79cd13be357-93c43c1247fmr298749485a.28.1790327393853;
        Fri, 25 Sep 2026 02:09:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:48 +0200
Subject: [PATCH v10 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-1-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXzPIB3Z/jwYzN
 o+w7iEVi1+5xxEvoRF13bSvH2YTh7vhVQqmA1g1dRxka+VtX+VhcnoKjz2aqBrMna/nZeZcFxOa
 wJpIr3z0xNqqb8UXKr7BRXBa3qLlQI1mxVtB54fi0Zdm7o6LRQYYcj9bJzvvgT6yILVHRS/hydN
 jGoIwZVDVFHS598zUv2NSz+DcM1ADA9QPjSwXzXRTwHnYNF63PTw7Ce1y9v+CJ/8QPQU3h0yu7I
 +rw+yq0cDl6O5klWvIL+ODBFMe5UtGnAHDazsLTiiVVk9qo8gLJuKH9FVyqmMMbMGhcD9MrD6Ro
 Q2TMP3//c8FXpJLTAarhc/c2wdthgwOjkPD5PBqMY3JMe8Hpg3BmPQJVJb8qTLH2i0lcYBORLZ9
 hAY/AdRpyL0wMWdmBeuqsJWOr7QxWLzfQBbtF4gBAY/vXom43C/oq1/vZhvpA/eXGZ3HdRTYI0w
 BffC9tYUxElVbgJuPyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX2qT2LXjrxtJJ
 03yg9SCwO1beTV2lvrZVz7gwdE5oEaBvK4/5byLtl9OXsW/YJMxZKLb0tMZqDR6cQfBUdr8AqDE
 v6U3BHKfwwYxqt6alikL6QCRf/N2mLs=
X-Proofpoint-GUID: klx8MWeY_73VGBP3VUIVErzYNqBhQQdO
X-Proofpoint-ORIG-GUID: klx8MWeY_73VGBP3VUIVErzYNqBhQQdO
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab63a63 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250036

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

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


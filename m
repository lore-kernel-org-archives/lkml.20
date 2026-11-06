Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973329;
	b=PnMgYnrQ1d5RoYbSiVj8iLqPOlx9Db78tpL0Gv7I2//BNWAQvvqPTBalZKlE2ZuBuUAm
	 o8TPEflj+wZ/Afy/uksIw2GD03th3E6yx2ImjRaHJn7XsXCPUoNG35O7t0oxYRcvJCrlY
	 pUJR7EwkRoGH/qLlxy3QKL/hN3LVzuWBfnAnSBFSOQtDChiw7G216M4zFPeKPRV15VNxf
	 35w6/oAJQq+BtahNtYs+wASgAXImkhlOTa4pq1owNcAHGfo4AACP9NYo246dpYrXnbZel
	 sxPmUEPUfjn6Yo8oHp6CrrOSOyRwKRS4F1zl15u3nzIiVe5Eh1gxybnUx8hSjmMGhRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=gwYG7YitLaNyE0cyEeXnTnnL2dLhfuTjOwYR0H97eqFIK98e9Bn1Vyfrq9JTmu5JoL0y
	 SjsYQWadj33RWucOcb+HZNnfcMhWjE/FnDfD+jMzp4mQGGIe+DjJeANxbii5RGlnEsnT8
	 eDhI5IU/LgSJTyVKdcI83DO/tYZhX6hwqNTocevXvrNuOzQJLoAa/QWBNrLhnIYRamBU+
	 vxHPrfxkm4h3aj1QhxBPNSEJ3ueTujIGJNsen2g7kcsnsgNc8fm1lTO/8Cb/wlAn6mdJY
	 4h1XgeO3ESHSOBJDB3i4mhDqW7andZQ5ndODjPsXDTOpcaJQexPa3EZfegc9FO+/lOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bm5Znuev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=de+Ll0Td;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE1606D839
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DE1606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bm5Znuev;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=de+Ll0Td
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoNuC3034442
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=bm5Znuevrh4SmsgD
	vb6RvI7iPS2Fr56sekLTNlHWe1dwdGAcyEAwWtZRcQMaUMpi2827p8iz5X0w73C6
	gM8gsIdM3YDa6mN1YUYOTNTf0su8wIjuylpKeXBx7lfQ+zVSiB3eEJTtkkMyZde+
	sCMr+9DiT5MeeBEJdblEkKQVe6cUswnuspjc6QZlyLtAnN6rdTqB5TUibrakXBbC
	nKc/9yTZwxiJtJvoPJvxH7Aj6r/NsITdvweOxIE1xXU01WAITbBQLM1QufkfYvzV
	DqfKEGR5ae2YOhA52leR+Zinzd5TjCrFVUhVQ9icA8GFKfzPGVEJZcHad7JvBbs2
	p0HwyQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paayh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99082f450bfso512050241.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973327; x=1794578127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=de+Ll0TdO6I3gn28LBdVHqdTL21TYIs3UW/Itx4mJT4H1C70WWUx2q7hh3OWlywq6s
         6AlwHNnzCt81CPbaVb8YHTfiwtEmp5CvLbjajapScwB1/0sMpjtzs59iTMK/Mov55Lli
         6BcGRKxhS2BmX2mOoXkwD/rMRya2x88hBuSb7F/zJ6omKAMWEsK/TNM2KqRPYLgP0Y+t
         gDgrR8g3nvQKwA4AMDY1a+NrYNBG4+mQMz4Dy3IyGWOxgXjhiYM2BrMwA86ylf4mi9ln
         KvHs7Lb7WgBZnoGNLCQ+3e+qTWXnvqiFOeLNn11jFgo1byLE47ZF9lzmaRqp9PwwpchR
         lO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973327; x=1794578127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=k/BJs52tfQ6feZIBdVv4vu6xJmz7v+PnQydQbIhpMOIQVrp8Tk9xTE33x5FhWbueZh
         Mi1zpFI/VNtJbogCby2YoFML3TC33LwaKpUWK4AeJ3xo1NJq08CJtnDTkhFAai0+SHXc
         X/l9av7fxuosIoe+qUrK3fHD8rYxX6zyheZiE7TlwmPoaGjOLqsC9Y4kOHm04LRSk0G7
         cJELN8ksJcY3+9/z/Uw+Q/3mA5j9YaDuzrWkTfVu9XvMZUm8LXa37V7TxjggaNJQ3Gk/
         5gTypp46cN+LT5WcIwf2PelZe8+K7aXKnQ0ty941OlPkRU80sg2JRSdp9hdO4z2wLogo
         G8BA==
X-Forwarded-Encrypted: i=1; AKwUvBwpuQGD4g+Ak/yMfwkiBzHdHBtpaW8yw6aXoA4PUvGkTRNtyHzCGXgh/NXSCo4w+oQJ1ur8zD1m7qg71mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/et8vane43tJwU2QMbSMKCtnHtx4deHM6JpWuGnnoB0qZnNfEt
	igCNF8LIOlRHxTvK7WRY77VhuM8Yks1EasjysdDxezqbZGhVBgUwOPTFz/y68C3HZmf1A3t59hO
	8byxQlvgQz/+Qe/x9WIaUAGqfLunaNwxZWuWSYM0iBaZgeSYF2volEfSgvtrC9dx21DE=
X-Gm-Gg: AYBFou0ZB8g5kF8Ge7z5A4M1ZG+oq+ZWVtRb98SfBlHqA0ehTG8DgodO4qkpCw9zh8d
	n6TIdG1HQ4MPoHGGH4PxKz9qbDl+m2kwnKMcAzNagY1wguAClnUm6jG5uqrdHFTBvdHMSWTgcWB
	4ZYgp5sr/fu1a5/1kHHXrqewm7U7fcgL6yrHs6sv8oJ4oENLGl9a99T/i7Ka87ke5uc0xIJDG7S
	UiEMoiJR3/W6K8PgYfjfYvlbJqKnPdp5XwOtCFmyY2x3BVLlcy7yeUmXwvlg11+tHSb1xlxmqq0
	lgZk+RYLK59Jt2p9o6eJyuen0HudzwVD8BD+YcrtocnxbBeyW3nV3m6eRAqhRbqHTpjOAioFyW8
	f9KtMpwGW4p0QGLhEv+Uj4vqbER7O/SN5m2OCLt5nKnRfZCXyowVfDegi2o+LteftVJASjyQqRB
	A3EF7k+PNwz4Vkj9ewCIt3x6AOoBFQXJv2Aw6k9TlGsHJ5/GTsy24sguTT7LW7cennhtLmRpbg5
	oNBc5XgJVieOT/OYxyFvcFEhpcx
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr1816165137.6.1793973326663;
        Fri, 06 Nov 2026 05:55:26 -0800 (PST)
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr1816146137.6.1793973326222;
        Fri, 06 Nov 2026 05:55:26 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:17 +0100
Subject: [PATCH v14 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
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
Message-Id: <20261106-camss-isp-ope-v14-1-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
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
X-Proofpoint-GUID: mmTs0omE294eFDXeOBScXsPixqOfT9nO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX/ktQ0skQSztt
 XWrSjMDTdIb6HKXaQ1srgG4JQbTjYlBKnIPMLr7lb0ntLUVgoR1ZdF4aud3sFFnYwcR3nH04qoL
 J384Wf0ZorXHIeMUQIW74DqsgZ/yLptrJal6WNFwd+N0Aj6Pw6iWwVWVDHmPc2j43RZ1USdXelZ
 2oY/s1dqRhdWaoeZX+dySd8yWAALBl7B0MQDsQphnPcgbJ/lQujz2cQMb5NBLhF0dRUPEDOiinu
 4oye2bA+c/BBmG2i8fW7b/lNZDpcvhG4QVae/hRRcDkRWSXHgLzpUBO3ahz2NDR3sm1VacUMo3c
 YgQCFPKthf4ii24DbtaONnTNlUKH1xZFcuNihCfBp0gaT37J97J5o9+yG0KRkL79q0EUL3HsNSj
 9GIjiq3qFTaiXrVr8SqxnbLkQs85QjaQbJ2CM6d9ZlPdY5XCZEyLgf3Oa2+pgjn1T+pGrvmF3s0
 4YIUuUVLqKvsyb3AGxg==
X-Proofpoint-ORIG-GUID: mmTs0omE294eFDXeOBScXsPixqOfT9nO
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aeddc4f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX1MklkWZwlv/v
 GQG0aOzBIMl/UfGw0NXX8O+gxRQ6BDDRhlrs1wzXVpz8gL2azDD8AntUoWRAoo9LEKvLzU5Uq+U
 8RdnGx1As0kXuRMX7Aay7v10sSrQLE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

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


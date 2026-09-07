Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0046AA9C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778283; cv=none; b=auQGpYsCSj2+8svatgdQ/ZDa8LCC1AwQBdlwOTCNSxZo725bU39oHUgfaeC1VnGklCnYi2O5jPb1WvGPZaCj4QKeVHodgZ+0udYO+OySt50dauccj6hKyDRjCFVMi/7IowfnELT2UoWtPlv5dTe2YvoBRKw5+RN4MWE40abAteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778283; c=relaxed/simple;
	bh=TwbZMWaf5zHMMD2gf8LfNRX+QQ9gQjR1lauqLVDpOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwLVFJgGTxeJo+ihczMQMtYSk4pSF8i+h4fzJZlAwLgHphIQQ417hea7D9qLGu4bgdBUQ56SoYlAlflX9GahZS4x4A/HFb8R7rYb8LyoxpRkkngvKb1KSTVUEABBF956txamcQIM7hiDSd3UQCoUOHafGg972Th4JTEyDjmY8vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYMywZUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es6pabWU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYMywZUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="es6pabWU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnSF03777807
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=; b=PYMywZUjHZOZ+ucH
	uIPoYtEMgKVdton3e+zSZUdbwWz5+nZTgeIUVlv3sgiWN+o6QX2TCdUMZrnlXDUZ
	jxXq6nH/yTjuLAw9bGlZ9jodiBUW165Zk+qFeuLZBGAqIFtsijWt5gDm8LKc4RWc
	rZnGs8m85D2GrWpdr5F/WPxtqxkZTCotOiD5rIKBhLwf+MhC9kF98OL1ie9Um7w+
	BjeT/pVR0TPy2td5CtjmyX3NQI4X59293u+KMy38330tu4hNixcnv4e4khTzcv2z
	tR+pc7oRTFDhgIuF65d0Zvt/wZiXihHM2HJbzc2EX7FcRWN2IoPp4PEk2nhPDu+C
	1Uqveg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygq3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:51:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so421606185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778276; x=1789383076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=es6pabWUX+EFsaxTB3iKn9J+tK4XoPAw3Yv8aYBOGgDSfYTi2bNj70CpsbknQLI2jL
         hT5WIGaUCN2FlOd/l26E2CRCAXghujqztdCBh7FBN+DZqsP5g8+o0pO9zLEWqlEpxqK6
         HU+zlZBUGVgTRpd5TbOCDu8TN5Ojof+8HYxiGWqp5A8jKC5cCIJEg9Da8519FoJId0Vt
         b3BodW4ICwwOZyVXZQSH2QoxlQ4T+nneIk08TywSMVOTUITaCZxiQmpuYIpokytAKsuo
         KeLqAYkEG4vDtK9nW/WiEiZ7bqJ8+P83ASPamKIisrEfyg48O/YlJ6nJD2An8cB+z/rA
         tanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778276; x=1789383076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=GxTnXLO2+R8flxlbbrmIq1qqjEec+5T84GIoeo4xMw2osG1TKEcdXMoT7AnzCWHlrK
         5NaRkKoxOcK+1PH6Sm/oQ8YTNliTMkCjZDpUUxk0KqTuhx0n38llFPAwp1L1ZgrbEtl0
         pfQ9ELJ3SC+NJeJ9JZ+ZxxWQ4vFMDHHyWqYWZZSoBYCfV2XC/K7NTNI3+sPRqIIKFXh/
         Ni8/eJuMtUhX7YKXf1gG0xH7Q+odeudzLXjUNH4//cwqO9mXuYs9Uy5b7CK2agE5MKYE
         9uHQNFt3FWsMz2JwANVu+OFfGDLLc0KwT4phIaVocoQLH7q/9GePFbvz2Y6DPqzHWZDw
         HPUg==
X-Forwarded-Encrypted: i=1; AKwUvBy33f1bz4wk+uvd/BRAxMiEiIPMPpMhVSD26pt5816xLrvllYkzAFAGriEtkkZhHjqC/MNGuZhLaMlXFGg=@vger.kernel.org
X-Gm-Message-State: AFuF++kv0G/taWXwUzZJ0T017Anse9Zl/EAFZ1qttBob672L3vVAjlkQ
	iRBKjkuTgbGbLLvwJZcyJQtw7r+b3pZeDqL2eD5uieONwofZ/4HIRty0VXl/m4Svx7HiS0cU3g/
	PP3+wI/6VFUT+TXo1ql7F2/svBlailDWdQoyAt0igfx1+j9a6xanzjCI+a8bEzaPiuqA=
X-Gm-Gg: AYBFou0V4m8RW1tyU+eziXCOCAkF/e3pKXf0+rEDx4jqLNiRQfh13ZwGVyzddRbjtYE
	LLTkwlYC06lj8QE4ZF8pqR7lNIwsTeZz1oD454YBpyM4uNtwXabuXbGW2UEc3wAgxwAEueQ8AXJ
	lMBYC3lIAPu+6I7Yk7xEzTzTMCW6RKE63zL7ZPnFVU9izEHezSfPJShfQe3fhjjtTTedH580VTA
	YocOnNGUNU5TxaBWPsbzXNjkCQo/UDIqV4Pf85U+8WS13r3cdkdcyiBstTgbRnToiQs4+Hcn3dX
	F/Ct10n93fSOi9vVVE07IFz54AE1/LvgG5HDk/HIFJUhXBCp0M9KWoofAZSSqVLud2h2THZ7KBg
	e1fSj/6SGYdlLoHbOMDhSQmF4yn4zEDttR23Lkn/tHVoPTRRu/r+4l0J2m6GoWv43B5pnY/eRn1
	rYj9Bn81mk7nYkm2owcXG2nhIfX63AjKh+//yrxdDqUxWQZe6LN7k=
X-Received: by 2002:a05:620a:4490:b0:930:9585:e08e with SMTP id af79cd13be357-93980328d99mr2054533885a.10.1788778276637;
        Mon, 07 Sep 2026 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:930:9585:e08e with SMTP id af79cd13be357-93980328d99mr2054531185a.10.1788778276164;
        Mon, 07 Sep 2026 03:51:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:11 +0200
Subject: [PATCH v6 1/8] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-1-6b915b9c5131@oss.qualcomm.com>
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
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: fxg2n6rNXY-ls_N_NbmJsCjsgoLtO1p4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX8WI3BohmIwa+
 1sSifzQHvkVvi+W0ZLqSHuwpHx4AVlc8esLza1sQCSkIvOH5XijuoXp1wgY0x8cl6hJhqtqTuiC
 a53uip3a2p+T4q/NI+Q3dN0I13KDCz2vfGt80Ps6jFEUob3gV929ewB0WxRAKNXHVGogQjiKup2
 TYorYgmHHc+qbAyXptOJdzDUxBQRca+z+Z51qv3XyODKNQEkCE5RUmnq6Fn5+hi2jLgtQPIBOTD
 yx6Ep858Qutshi5lex2WVHJTqWLIxOeMhHiLHSCBTogmVukrJjfEPHjvITO53AXKUr1XwmvFw5J
 81TOWmtK2TY0AjZZGbjRb1TotCHafPjLLchqeDw9vrSFapAYX6mAA7F96nFeUKTlrkiWy/Cdbhv
 /x0/8ge08uHANDPQSUg7yxakNy0Rsrf9t7caO5yDYVvXWmn6loWPzTiEdLT9R4mTcavepwBEP1h
 4IVoTcsUg6U55l4xAkA==
X-Proofpoint-GUID: fxg2n6rNXY-ls_N_NbmJsCjsgoLtO1p4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX0kRMepEmCaQZ
 aVuEIwUt9/9m1f2auzChVT8d29WccSpcyJqvOYLkMxOlU35md/KENm2lAypqxYSMtpkORmSTulO
 eYpHwdPMulQKkVGxz0UUGcrFTIJFA48=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e9725 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

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
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..fce574d9268a019aa7829e8dbc06a6187cbc5c62 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


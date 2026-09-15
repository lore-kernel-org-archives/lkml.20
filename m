Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191B3A4508
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459872; cv=none; b=E80lOJJbfXhX+D0/yn2j3kapeB7FoZmS8/YP/uNarsSM0torFsl9e+XXvmPLAbbzlIlBVfmUP52dwJjeEjWc3dxG9jwHa7+DX/DAU+NYDRNAsgRnAyG4x7OnKkA14Uug0JPGo/B8isEJDsCumIOyKl+iBMO60zsuq5nbMtH55Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459872; c=relaxed/simple;
	bh=TwbZMWaf5zHMMD2gf8LfNRX+QQ9gQjR1lauqLVDpOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9cm+UmcGE7MXPplJgGxwWDVm/xt/I7CShZENFieYNhd4Z/6ISpIO7LIodlq0nBZipz93BWUU1FbvLAFXXwRjIkz32y2zra2hgM0w/19O3Amn8lg7Pi7RAtOinopAjqXxICe9F1Dnfu+ghGXJCyQDRt2UXK4hZJ6TpoX8GpGkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmgdJY0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdcVKAP8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmgdJY0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdcVKAP8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F7Wjhk1790787
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=; b=cmgdJY0RFDho3MfR
	glnQVQdP6xuWAmMhvCZrUpvkd96Y+xNJE3HUhlAYqc+pQqHPpCX0EnNpbUDg1fEC
	LjevAMIen2bKB9LDxzRAgSylPUnr26t8aAZj/yqPBoiu0LwYswPFGbGGfw5VJdnQ
	JpJytloqGKuvJbDFGxJScA12zDZm2wEOB58mHAKBzo64NvxFjYMOucaOMd4ana37
	fyfYTYpJF2f8pqS8XCFe8oLsAh97Gd48Cs5uNKCOlNMi7dpDMHJHKWv7KGqDFeyb
	NEIlkQDmlzsM5EAiMb0VS88gQr45hisBT67ayzMocCoPxn0Y5MPHRNV1uKhUYV1X
	dExy3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp85fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so651346385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459869; x=1790064669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=gdcVKAP8u07Bq/aH3A4Ru6ZB68Il8NcOLpmo73nxq6EMygOpGDmVklnPgwn5RR4mdV
         wTYsJcuUhCqF0070NyWUnUV+sTGq9CywLb7/2kI2g+ipzlVHkheb3dg20v9qJXCmx1s6
         gAgY2yqjupIjPV4fpPFrMeE7rNsth5zzh83HuE5pQ8nVb8fy+bkWpVlIqXyyxGcss2y2
         XQ2czEueQqfeARgYgUA9097oyjJ+VfwCBdpELOLE7kh7S8WHnZkwe2VQjqb46q6Xny3A
         8i9648lB2ywsO+uKK3WwNPhSLoTy7YSm1OCuijDPpHW3S9VqV8yV//eYcFV7DZcnEMuv
         zr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459869; x=1790064669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=x41aDBPcZouavaN8xJT+CYS5PGYTuZcpW4Djfuub9T9NVuf3lSkxtcPgY0VElGHV47
         x8T5O/sk+Kb6wYw6SJ3B81FoEXcwre5OXcgT02X6wsEq7QvsQngxkHtaN4PAGhkBDqmm
         WZcIW0kLXv+OC9LgpmZUhkWeWQp8WDJVfpw7EJqdJTZmhADY8r5gpP8epza64nP6otGg
         VDWWAfPQBF0KD1V3ZFh/Iphgj/Bu77opjvSLXiFpRgdMw+KWQOfwaZMRUmtPhZJRjX20
         FD/06zPaGR1vRdWE8HEyVVl08bsCA7NrmvtU9Pll5WVKZSfaP6UtWC6ESNcVFuPccA6K
         t4WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOUiPKJ1ZilmPGV37UPB+qoh0Mjn1gEDJCwcUAuLh7By8n+m1LfR9gqNEC/dszLPtxUfjpCQE9bDKjnFw=@vger.kernel.org
X-Gm-Message-State: AFuF++nUkZucEsyVhPop2/Jd1fy15T+C3umrgNdrY/sjIEL62YPD7EPV
	UCCG9kZqgeA/Gqb54/inuVPgp5Q7Kd+lP7iwhsQrx2EJZffL3eiy7FZBCMXUl6MkDtGvc9YYGhW
	GTnGEzfWAkDpD9GQwPR/GmO3V4F28LGfthtqgnG0hsNEzUfISalll3OrpKG6PsJDGUqkSlifOD5
	a0ww==
X-Gm-Gg: AYBFou15G8jYyLskFxhRR0rIqPrAHYDgRC8kZLjPmhFW2fIjPOETpfqsv54BkoBi+/O
	mWbXKqqJCvcER/A+oXYOpNk3jTYOceOoKb773HFSUMBGkJBB0jaRUckZzr6kCGrKpUc8rWbcSAt
	/bUbnerofZ9h3onRNURulY7hejGJ778gi16XUKkjypY210NvHXKUnbXme4qUGrV2e3v5piW6GCj
	2JUU0/Ljs3mklBWBHl43r2hVrpjOTZDwb55IgrLun5gP2KtflgkEIvu0LUYMx1mKPLjB0F8VcIJ
	1KBn0TKNyUpeDFCTkyO3r+L7nluNYlMPojVHIQs0+D6slEvtgCZEkUo1UNkfehp58kriUapjOmB
	n4E+K3KZQzGt6p/1WQhuCskL5wHiPZDqXWaC61uTWSkOfbCPqOrZv1f/qhX8y4c5zwob94GLjaM
	AyE4Z0IwQOahNTcFojzFl42O40XEoR434AByCFOzco3MuWAzvBqVQ=
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr1026087085a.24.1789459868548;
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr1026082885a.24.1789459868076;
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:04 +0200
Subject: [PATCH v7 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-1-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXzBq+zeaSKXzO
 zKJykI7Do0FnsKpjlQ3A3yL4A0uuU1iPJy5XnG/i/Xnp1jX8VC6LeeU65h5KUIAzAb0TFvut06d
 gEifIAHQqGuUwRYlokBEQXSiJTAH8dk=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa8fd9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: X2KTPgfywylCBWZ9eQT9pI4LwcSDr542
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX+krKLralfcFE
 E21SckzLwh3o1xVnF+YmHMOfCTy6BnAYubBex5lo4eWIwEwcz0BTFkIkzcpqRit2lLa17tLJRV9
 xlG4PcDKjOh5ZZ0jfs6Dx5F7RygxLcvy+3iYKM7c7ceABqQ5QQl0sam2KpVAt54e8pms1gT/o4E
 HujOaA9d0vmq3400NXav5QANaZOaXkWxpzcnHnnspgCf7pxislmC7WICJYo/LhGinptpv3y3PvD
 fE1FMvidp2ZXjdIouu4XqSCFd5oghUf+4Vt8k8xlk9FZAGtT645uJHUYas4nLLdS7Rbq0cFRKr3
 yfr5zxBfUPBOpy/XzRzklcUMBHhLvI3J1yr8U5l+xU2XXkZe2IrII4HBpUFa94Ndi/okA9DblU0
 5u697kqc/dlIbFm+B+tdNlfzsrnzhGZ/3fYZUZVto8iRj90mnyB8GFkh/T1JM1e4099VpScUZqG
 7GU8cGbn95d7vZ2Y0eA==
X-Proofpoint-GUID: X2KTPgfywylCBWZ9eQT9pI4LwcSDr542
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

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


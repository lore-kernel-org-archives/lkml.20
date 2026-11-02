Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634803;
	b=EHJKmPOf3PNqLQp12ylbHpKYDnWOj52vrPZsaO01ttR1B5W3iBvQztC5gBSAtaIrDuv5
	 tw7ECvPALljUHQ+fUfBqf0tT/wORdfd89L9x5kbgW4fRwBRfOMLNC+5nwfO12X9IyXqQz
	 u0kF+eomA6Bex/PjSCDuvz7piyL3SatKHAS90jc8hZFt6J2pY6Xp5vO/3kWVdA2OrppJD
	 OfTSevbWVnfHuCXqOstUYVuhbDRy33YKGTxKNb4/7OHLrtHGWG/1XPiJQu80H/sa4Ah2+
	 FgLiSs8dxsPMa54Sb17cuHhCjnIUccugsEcHuoOUKvoITnl2zMxpOf8ywXJzpaqwrUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=slRfGSNhUsHNI5TRCe7jXfoPSsyK3aB3gWSI0EpR5D14VExOnp2ruwcyWkzxkccqUteM
	 Z13frLkvp69UzcBFsg/DEolkTPRals1VeTSdBKkk2DAhEI0sN7Xhgw7LEPAj7voZo48iS
	 MXtt4vVIx2lybISI5Ag9EKkvd3RrAGO7WHAuteSDWvzCExT4wffIb6dVzdQj09ibP5F/9
	 pgEjBP6Rq5aVO8zLWEQuzxQS2RsMxZ1TDEvUgeHnKdfyso+0pZUbDxssx3KLZMaOcMIdM
	 rGL3+Rlomye+3R0DsXa6Ci9NnFC6sTHJk6OBTfnqDkoI24bxYM657vkku5ZsoVRFcmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kM374WtA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bb6GR6/1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F13607A8B5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F13607A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kM374WtA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bb6GR6/1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpHor4069976
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=kM374WtAawYrgcPU
	3m0FBrc4GZOrBLrImookpjbxtv6IW/CVCZfSvubGAeEEx5c0RvbQj6/Ch6zBkfmm
	1+/iJawSkOr9GkebN9c7u4o5mibgNUmQvKEjxzg0y7SyK14FPlaTYcP4bH8pOutL
	nKq6bIPKP66gtmF5g/5lnfRZu4tODup2wQNYVsnefLaG6KA7N4o3Xk941EuJNnc1
	RAxdBCGzc2G0op+wLlHVva1bXpS5VEm4mOQyIFsVhYPYU/aDxl9z/GtKNmhcDMBZ
	9ElhGvpqOeGKkRgck0xZGMtYHqHWtdNlyg9a48yFPlzBIwtUvg018qpxpJuluTgl
	SYqSIw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h3em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:53:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso3699599137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634801; x=1794239601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=bb6GR6/1vt9QyyYzVNEwvjLJ/w25kNwfdChTLC/JVA/VawBfUXoK+oTbly7UscdgSJ
         7RAp0uKZZkz/cJjF+wjELVWu8AxnRZ0nyaIAzc7U+FFtDc1ka17z17ot5fcwa+42Kq4Z
         dJ0uGJrHZUq/lepbdCUnfuTgeNfzaXUw8VLmNK4decaVVqh3xj+nIzogUwRmFup04YzX
         lGz4nqIi+rVYZ1hYrqqYDBookm5yIQEhGoEjPdtAbwRqCn94J5mvK3dmV0xCp9g2zS5I
         L/+kBSnBuA+2oW+MXoKXxS4/Md+r2YHb0hrqN+01PgZStpV7edV2oqjRxHxw8tR/jAZN
         0s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634801; x=1794239601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=A4hDqPseuwOS2N2mvGfpBGJ7BzUapWbljAFDhwCn7QL0R33GrUdv406L+Iw699HECE
         LQljVbI/0zE7PJnuXDBBDgNUUkcv6KNiHVZ6hRCaLwf2/LLM84QKEc9yHqF1f7JjnHIu
         kYLoqan2VNeN8v7dOicwPx5KIW72vkvFys35DwIyaFpqEar8azS6cxziHyFl373g0GVO
         CqSFwmzpRlnRYarnnzhMaixvAfLIBX092wmT5k0I+GwAmyfAAlJiFSzShv0mj5wVnI9N
         U/TzFosuE0+G7YSciKXdW8zOxrgb+usgkiq8HCDw8jDBKxllFKWjvVe1ynQBeL3E6xqm
         2szg==
X-Forwarded-Encrypted: i=1; AKwUvBxWiER9ab6VjSRhUbMBCAKnDz3D08eZZzpo8TzCANIUmf0a8DKrHls/MoKslDXx4LqSykzHfuJIenvn4bc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nPyNdfr8zn3R1pRBQ9frgmNZdkqfvWSTStNFFyb5NTAEByhUJ
	tJ0gH6SxXj5OcyzI4L+iaMweQ8RLMou+SN3aVjOBanrSmG9tQ9z7qDUVBTKbJEQuG74KmDLHX7W
	pdkG/etSpIl2uey8UYSdwPFuIufEWmgwcM7+DfbW8uQKAWGF7kxlK5/jOFUfQ9lYhA8w=
X-Gm-Gg: AYBFou32S1N1LPaEr7TJboyEzz1QnQbuGIVtjXhgTE0MroxDxdBorXG0aUz99nx4tdH
	CpGJTtWNTIDPHLqvK60sj8UyCXYZShqeVAHOMDxrEG0bORH3K5aQ05dLBd8O+oqgDivmgmCS5ms
	FxSpvKBVbYeMTaJ6rc3QhZBllwBF4pTF0H2kJLYnPJrhz882E+t6+QWjo6MTGvmqinlL8oZP8wh
	Y4LLRcJ07ueLd1jbpHS7THb2ZOJTa2hqLZkfS99Abn4KRe5qKN3Lfa1SJna5teX+Wq9PuONrJXI
	oF+LuX7MJ3101Qed/9s6z1Asynylqc+89QXGpi2Z014qoopih0ewczUJGzK2pLnvqt7uWBH4DDo
	KqnLVMx3W+SpdJv8XK9+dNZg0LtOVM45qBKvlHyKpocBGWe6M1XvhKb4M7M6Vqx8IfyePiR0Onv
	DBciBePSZVi8w5oOHA2mqM16XnJpNFwl2j3KP8X9ABg81aPrBSLYwx/gnhGxCxCrqRo5EnMs8Xr
	Y9PgUHkV9zMoKIMslypdOBmqw4r
X-Received: by 2002:a05:6102:4490:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d053f25b2dmr4101182137.4.1793634800690;
        Mon, 02 Nov 2026 07:53:20 -0800 (PST)
X-Received: by 2002:a05:6102:4490:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d053f25b2dmr4101170137.4.1793634800239;
        Mon, 02 Nov 2026 07:53:20 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:19 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:32 +0100
Subject: [PATCH v12 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
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
Message-Id: <20261102-camss-isp-ope-v12-1-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b1f1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: nfgg7lPY0ljPfGRAnDk3gsT45HsqZkDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3K7r2n1C/DNK
 idvA4ssEJFbJGXK2e2cBYDZ/s89n4pa4tJ4wBRfU7Wu3xkl+zZmGjnOf0iVSBBQRvRgEL19IP4d
 xH/cgwWfZqcWWt+G67V/jwFHeUW5A5/Kf8CY5V6cIj+2YFVU3OqvGiPU3rU00wTSDMcGInxvzIP
 plIV8yCTHMO3Rgf+gReTwbBB5ABUQLWoa71zINEgQf6Gy64ObESqB7usKfuENgLdwQ1l7gnWT66
 +UsChoO28cWLvjGwd6IagaGwXd+TT+tPAD4eoIwyR/4vVQcs0ghydJabQL/+hg0G1JzZ91BL8BB
 A3B2gNJePgFWfLgpGvxIIV52FXBzuOfgATKOjr+WckUHCEvD0j3+VXJWQfxUadKmNrx2P1fiOtS
 MAibaG7MvsS9kfq8bJYC5otTyQVkzHQxeZNOLihW+fMD2tCRz5tWIfnahJOcGok6m/vTVd+V8Vh
 RqyT5/VAXHC8u9Ka/jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXworsz0xCf08a
 D3Fq5DcuoC3jvbn7imTKJGejwtEUfFXSkCThjxJwCQAJTpNkyAZgxojSB+FBrQuBDbYWUfNiWgC
 Spe/+zacfsLl7KWkajy1rx9O6EqntVo=
X-Proofpoint-GUID: nfgg7lPY0ljPfGRAnDk3gsT45HsqZkDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

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


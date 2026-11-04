Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810197;
	b=5AQU/ipmM1huRCLV3uhh+3kbveRF/4yU9ioRUizHjrG1q45/mLpX9sIRLExpcpUABTNw
	 DHQqvzvsS7uibp865HgdVdXs5yM09Dl0HIS9VLZm6yJZRn3hp8E0OkX87zqAaQ4pH6lHr
	 ykRtrnr/3VTDoLEJbZ54shf7XLztViaeYnGuk9S5SMu89wC9GJLbYUuoUMXHmfFLzrimZ
	 JW4Evug1HIuT8xULQ9e7spclyp9UkjVljos+vLmbXaZiYtzExm3cpwVlCh5Dng11XPNFD
	 sy59biTTcU3KlvgobLcFgTXDD97Dr1Fe04ix1DD7n3HVDqmGZA7uvMlSE7mcOdH5fIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=;
	b=IwiZVj5cMf8iV8ntgDGLEFYlQdPx25Q3jggu6+30Lni/jD35goheuMB9HRtQJdrGLARl
	 egDMqn7dSRf3fdQ5spDWX5gI4YqJC/gssOHPsZkBEsIBDQzaPbfXsawsYj7LnyMb5ngqO
	 7AfagOooVmRmSJ9Di6ocLo4Ba1stCy3D0l2pFUORavDM5jho1fEihUOJ/WgOibJXW8lZn
	 5YWVp5LXrcbxovLbjYXQ1+zlsi44t/tS4Bv9Lp1NHuxK4F4fk46sj01RukGjJWkY+ii5P
	 ReFZASj8TMgHYR4e1Hmz5ozNTrvEX1rKfQezsEQ3rygTeMrNSeP78cJsJjeBDheLHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFi+GMAT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RAHEQk/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD827606EE9D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD827606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFi+GMAT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RAHEQk/x
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj9BM3208786
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=; b=cFi+GMATdZpiLZQ+
	ESk+1+NNVpPg8fSXYpI33gSwGJrZZFg047bQ9eo52P61uKZuXhfBPl+MGofxZrEE
	X34fMtLJ4MJFRpBddLB9lVJ/N8zXNfBotRltZCCFnA4FVsYI0BQpmVNg7cfS5m9s
	k7jAeL7i+frt04nIaaQkuv/8s38X4Z/CP/kk1yKlKtWBzCkGdrMDjkja4vmbFudU
	khTEdls1f4giQbAlFmAMpRn5vm2iCrlJX3zerrSEJzpHwwBRxOO7OoqOw0a9cBJZ
	1sa1XrkMSbsG2hgCj/go6zGUHIEYIqtLBOcMnJwGNkLeB0nH8Dwug6DOkEG6f3YC
	oa9TMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj0j8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:36:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so183122085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810195; x=1794414995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=;
        b=RAHEQk/xM6vbi+BQRYE9v63XVAP/bAeX9w0IjCG3AqPGNCt38nt5UnToDkRVROFwli
         lbk7J3XKsr1sD1CZkeuK1oWgR2GXlBCzucc9kLPEFXl8/RTu/x1m2LkeKiBNNneXdoOu
         /299iYM13TlszEHHGsg9sz1N48qS8QIR9XyOrJMfaJOOOOeDCPB4/iDUw4T3j9z62ume
         zslLwBveCPOwdKAoJqCDt4tx8YLBFLj6axGirNRuzkwNJqaF2Zd9glzoSiqy1kquadYN
         gtoI2RBEPQAdBfCXEVnLN+9ElwerrwB2TDNA8zNZAIo9owobc8BDCsUP8DAfdrsM14xp
         3mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810195; x=1794414995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=;
        b=PMDWDUi0ySz5H0Len8GtxUItMVWpmKPhpVLPEeMcwfY+z1OLaUenTS7lELxY2VavVo
         2+M9UZ4rJaB3ef5IB+2hsAfBQH6NzYI8yCe76R1KLrJg854u1J/vlj6NmQ+GaRhbkMWH
         n16PgTH4f3MKb5R8MbRkJtFs8aDXgHh0mxL1bXrVomXBXNb5HhB4o3lUl9qb7lo1Fwm7
         1yzZt+mLZVRMX5eQHRbd8Vwf2JTo9BV3fd6BsJ4UNTJbNoDhzZfkrYDAlKmhe7Fm+b2h
         ZFYv7XgxrV7DfY1w7qZo2V7yZuBwLBEnQLa/98cSYtLOkEzoIah0j/dp+NcAMU4P8LgV
         /L0w==
X-Forwarded-Encrypted: i=1; AKwUvBwTEKxiehokqgl2p62c6CBgXObU0LiBOmuExK9U5V4JapUWR8HzCe/Cv81+gwQC9/9Bh1nqwoiz6OFNg+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cpjbr63HSJcRJUgapP1WqpJhE5rbvkshLw9nqtr7uTOVhLAe8
	DkzRJUFj7J8sI88U/on3q5JZrfS109GojVod896Dpst8oZQoLhXnA1Opt/RpdW7Mjcoqc1d09TQ
	8l/tSKGfEe0vLLdVdTbyJxl5p981OAci8b0x61xc8QY4AqAzrmDdi03NQQWZR32FgssY=
X-Gm-Gg: AYBFou1J/jaTuPMBjKCvE0jCXYzP3GAcqzW2Ttdzptmki9Q7mREhF121iM7RHESiP8x
	0wH0Nqfr3czFZQdZsh8WOK3+pdvdha/DE6UqrNkUYtpZxztjKK0G+7iKuY60cRJiWuzNI374XHz
	v/+dFNGdUGuPKnKBGB0xYP4+N+L2QVaN0PXgjI/uDWtdP/yLR8O6SWLzg+IhYLme1RJSUNTajgc
	YOLnp74uwbkg35N6vOBt5oAOkij8c3LzII6xV4D90jLctjSdliKxAQL+7KLyxhKgMxPEQw2qqUe
	2v33zhopzBjiFvgoUOlrPh7gZ7B0e+0qBB9HmDcjZrkTgu+9vZIfxXqGTyJHDKMWglVWTktJrSZ
	gQf6sqd0ltfPTUaZNt9x3yTgNKaOWvVKkX26J9mF9lpk68Hq4s8kVy4t2Uu7RatfjwYMFqem/Ns
	BBbhcYbQm08BrZBv9Zw23nVkfG7fS/rXHVqD4YAZq+Lmjhv7ZHiM0L0HhPNLrC1Q==
X-Received: by 2002:a05:620a:608b:b0:943:f2ea:5ee7 with SMTP id af79cd13be357-94421659ddemr2603616385a.23.1793810194820;
        Wed, 04 Nov 2026 08:36:34 -0800 (PST)
X-Received: by 2002:a05:620a:608b:b0:943:f2ea:5ee7 with SMTP id af79cd13be357-94421659ddemr2603606985a.23.1793810194196;
        Wed, 04 Nov 2026 08:36:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:08 +0200
Subject: [PATCH 4/7] drm/fourcc: describe the Qualcomm UBWC layout
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
Message-Id: <20261104-ubwc-format-docs-v1-4-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEuVWpWw+ZvRtd/ph1qijykYD+geIIf1V4AoPskkiBs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618DOnOCXWOdFy9DrR+HTZ+OufFZQnRzOL58j
 QhxFDE2o1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfAwAKCRCLPIo+Aiko
 1TkeB/9/YScH28RnzVapYiP/35zH7PBwopbsXbqYiu9NNpAg8E71VSwtVG2P0Ts7TpgVNvFIvl/
 6vdwSasVx1ubjKGzAn9YtmrTKVAHq3/wKmVSrwXHrIYFsz/JbjUU67Z+TgV8Es/pNifCDt/ppr/
 fcZjFclGlr0Uv83d871E2h34UvBGc4WSdwGhf6RDLea2csRitdQtZnQ2arZiQmlc3rYt93mazm7
 4LgxvpTxiIusG6cvXAaE3JPs7IVg14uFcPeIfRQY+XVN9YcUqCe6yFLsAQXcVh4eUc1C8hEggbi
 XD4tydgQPJdu8/ZImTv9xbJMRE2fgHPaQhjBVHw9W1O9sN+o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX2coDqBDlzKhi
 HW8TowZ6qdE1tGV8gfT8+a9sVq1XCWtoZGgVKucb8Br2AeK3X17Fw9uwu+k5474a1hI0v2+5Syd
 wTeR0enxMtQmWoE9DkgnLy+KXBHcscK9t9NnriK/duwTzW5Y95tC2Z7l+RXtt+ECyKF06xib0nu
 vn/xwWq9j9b5S5Cgjuq1vj9I0259h6RoxOQK4idrdlxcttAwev3/QlX9tdPEhm+kUyDqFN3ogPl
 cwbgugf38158h5l2aPFc05Yf6NpqEM1OGjTKmmUPjC5zUHe3zmVW92xCNHnUMRl7GvwrPmTHKWE
 LhxALkT+A9XSfAq9eqaSdNPr/9Tzt6b2olJSdVfrLEHzaozzl5wB1mtMs2wkHyiQZeyDyC5PuDw
 DV620T20Qr+vSrN+hQI/7fc7fIX4tqhgX1cBUAXNM9n89WvLYrNzIAmaLPIaX35aixPtXI9us52
 ZZUuKgheie6uwO31Wsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX6dgFcfpsgZdW
 iujDmFU78wWVFBpqLE2E+iBOItLsjcXIHXWkDgoUJaYGs7biEH854d7thN5l50kfbDIKLi+CkNj
 ulPtPFsatYX+5Cn1QoQstAu5rqjGlLk=
X-Proofpoint-ORIG-GUID: 47PoWXeX0YMsjqzOlnGaHVe0WXt2jK8A
X-Proofpoint-GUID: 47PoWXeX0YMsjqzOlnGaHVe0WXt2jK8A
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb5f14 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TpXcIlR_JNNDu9J-qogA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

The DRM_FORMAT_MOD_QCOM_COMPRESSED description talks about macrotiles
but does not say where the metadata is, what the pitch refers to or how
large the planes are. The msm driver derives all of that from the width
and the height, and the GPU drivers and video decoders allocate buffers
to match, so the layout is uAPI whether it is written down or not.

Document it for the formats the display controller supports: the
metadata before the data in each plane, the tile sizes and alignments,
and the CbCr plane following the Y plane in the first buffer. The
display controller has always fetched it from there, ignoring
offsets[1] and pitches[1], and existing userspace depends on it: turnip
reports offset 0 for both planes. Note that P010 stores 16-bit samples,
unlike the packed V4L2 QC10C format.

The layout is stricter than the display controller or the camera need,
as they can address the metadata and the data of each plane separately,
but other users depend on it. The video firmware takes a single address
per frame and places all four sections itself, and the Adreno texture
descriptor for multi-planar YUV has only one address per plane, finding
the data after the metadata. Buffers shared with these devices have
to follow it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 54 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0bb049f91524..4b6a4a827f6b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -820,13 +820,53 @@ extern "C" {
 /*
  * Qualcomm Compressed Format
  *
- * Refers to a compressed variant of the base format that is compressed.
- * Implementation may be platform and base-format specific.
- *
- * Each macrotile consists of m x n (mostly 4 x 4) tiles.
- * Pixel data pitch/stride is aligned with macrotile width.
- * Pixel data height is aligned with macrotile height.
- * Entire pixel data buffer is aligned with 4k(bytes).
+ * Universal Bandwidth Compression (UBWC), a lossless compression used by the
+ * GPU, display controller, video accelerators and camera. The compressed
+ * contents depend on the UBWC version and memory configuration of the
+ * platform and are only meant to be accessed by the hardware. The layout of
+ * the buffer depends only on the format and the size.
+ *
+ * Each plane consists of a metadata section followed by a data section, and
+ * the planes follow each other, all in the buffer referenced by handles[0],
+ * starting at offsets[0]. Each section starts on a 4096-byte boundary and its
+ * size is rounded up to a multiple of 4096 bytes. The metadata holds one byte
+ * for each tile of the data. pitches[0] is the stride of the first plane's
+ * data and must match the value below; all other strides and offsets are
+ * computed from the width and height of the framebuffer.
+ *
+ * For a width x height framebuffer, with subsampled planes being
+ * DIV_ROUND_UP(width, 2) x DIV_ROUND_UP(height, 2) samples:
+ *
+ * RGB formats with 2 or 4 bytes per pixel (cpp), one plane:
+ *   data: pitch ALIGN(width * cpp, 256), ALIGN(height, 16) lines
+ *   metadata: 16x4 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 16), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 4), 16) lines
+ *
+ * DRM_FORMAT_NV12, two planes, Y then CbCr (V4L2_PIX_FMT_QC08C):
+ *   Y data: pitch ALIGN(width, 128), ALIGN(height, 32) lines
+ *   Y metadata: 32x8 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 32), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 8), 16) lines
+ *   CbCr data: pitch ALIGN(width, 128),
+ *   ALIGN(DIV_ROUND_UP(height, 2), 32) lines
+ *   CbCr metadata: 16x8 sample tiles,
+ *   stride ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 16), 64),
+ *   ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 8), 16) lines
+ *
+ * DRM_FORMAT_P010, two planes, Y then CbCr, 16 bits per sample:
+ *   Y data: pitch ALIGN(width * 2, 256), ALIGN(height, 16) lines
+ *   Y metadata: 32x4 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 32), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 4), 16) lines
+ *   CbCr data: pitch ALIGN(width * 2, 256),
+ *   ALIGN(DIV_ROUND_UP(height, 2), 16) lines
+ *   CbCr metadata: 16x4 sample tiles,
+ *   stride ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 16), 64),
+ *   ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 4), 16) lines
+ *
+ * Two-plane images are allocated as a single buffer holding both planes,
+ * with the CbCr metadata following the Y data, so the CbCr plane starts at
+ * offsets[0] + Y metadata size + Y data size. handles[1] must refer to the
+ * same buffer as handles[0]; offsets[1] and pitches[1] are ignored, userspace
+ * should set them to the CbCr plane offset and the CbCr data stride.
  */
 #define DRM_FORMAT_MOD_QCOM_COMPRESSED	fourcc_mod_code(QCOM, 1)
 

-- 
2.47.3


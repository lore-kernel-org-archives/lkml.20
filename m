Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499633;
	b=3IA8tezMnKrDXFk9oce3cuscgr5Cq4BhUnfsCBqYYd8dFYSgxNfgAvqINqzshR/OJrar
	 84ioSHMO381nzV9CtJJTTCzNygLEDai+Tudul0UN5BTuVTJZ6x3J/OWoM2m0hdCZLuamk
	 bln+uh60tCKjdHT64pyvv+ymqA4uw1NN5MGdltjg82ACR7dgN4pgsHitUI+Z0IhNMY/eg
	 3HLVd0FpG0dConuGCR8iukeaV/ig+1qaof0rsW2F55S6c/TMH8LnEM/ESuVgWjienp2AF
	 C8feqyTFciksjs4cCZEvNYhEyHd6TClEXI7U1+UJ1Nl+sV0laPbR61cWLIgqEYYMKGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGIIKwgCmHqw=;
	b=FzO3pKwq//QaH31tC10DZpZH5I/oeoWomUaNSWBsPOWM/cbx3btNEBK28jV4JLig6Lkp
	 SrD9MoYW7W6C64QzoXne/i7uOadU9ItgX6gdIteTi6/Z/2Dkzvl7NS8nGRFvNaiSE/dxk
	 FWgmX5wqMXD0DrW4HfJ2l4LhxFpbtYNwMn9vUJWvEwNGCrVxnqsepAUgbTtPOl6udZ8IX
	 BnjfMa0a6AObJS2NX8RVknkOZrnBi5177fQ05EXJDd3nSTLs/Faa7wthVEE3oVICwXWj8
	 uCsTTpWczrUmb5WSzCXVo0DbC6q0BuyHLwS1T3rFGb6vI9e8ASl1/wJ7puxrta2O4lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aFB/Q1bx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wmrv7179;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFB/Q1bx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wmrv7179
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZl7q3181052
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGII
	KwgCmHqw=; b=aFB/Q1bxcYpelLMYfZoTooptWvIZo6UX7IIgZnXH6UQ+lcftOEv
	Hi5o7GVWayaQSDX1K5054dKvvTw1/7jsBwf242mKTLPqWcnI/lcsNttovr3lFTBq
	4wOOEHFl0oZ9b7R4MoztOTXG60bNC9N2A8uu4zGk0S6LYDdHUwm0OHMV19HNG0nn
	1RQZPP7aBP8sGBVGBaFjdLxaffQsXZ9rei6L10YuIVmSIKfNIxiuSrxLMtR9XYQl
	XZUDTqM254l78S3lD8DHZGM2KY3vn6AIQro/sczKL6RcaiCv9kZt8WGvmB13xZjU
	OdniTa7pbATRWGd4o8fJI5jiSWyG7hu3dng==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j151t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:07:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8aa185840bdso3407500b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794499630; x=1795104430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGIIKwgCmHqw=;
        b=Wmrv7179I/4GLWNPvHuuQqB7EfvOgtl51h+sY2vaVpQzYrWYjJYt+gAikNoiG8pbAp
         vmY0dEZl3ZVfQNWQhz7Acx9R1bPX47YTETpnyD09LXVvnlmCL1gIT9oxDoxehD5GQgE8
         Xw2dzGBXsykuZr7c+B7A7jc3HEpUMl60y9S1crczKcOX+t9vYf8j0FwmLrfrZv2zW1zx
         5QCp+j6TGszwWHTgsGi5FcPkM72UKmWx1Mr1JwdGYBbgEj1X01/FZGYwKzHgrACl9lxm
         JUjnTtmhn0CY2SSRozn5P5zK7jbPEeQHmnVql41PwdQsUf3lTzgFaXOs0hZgjYn71uIG
         FIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499630; x=1795104430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGIIKwgCmHqw=;
        b=tqfh0VvJNRPZomFBz+WBhASj87L6aHhfVAnytgknx8HCEtbrLeLkQMnWSGcCrMpiLN
         7W8kpb6MrygKBSTQS/dQ8zGuiTuu0c5MKayJdGErnRirIYGmMGJzoHvpPq4vLsxaQokI
         Ho9oV7J7Cglb/V42GQX7ZdXi2gfazDFaBNIJ/l9fRaGzgHHg+olc+TM5YqNoQiwnwKJk
         gr0fhaxmo+m0I3qAWEKlAgmmAuqolgq4BHWjU7PAKORByVoGRFnJaaYZJ8exmHoHdXIn
         LIauWb/C+tXF9MnHYyyZGt2/cAxSemywTD9QvTG4JigcbaBGDNMDrfEv+nBioH7MeDwS
         E+lA==
X-Forwarded-Encrypted: i=1; AL+hErFO8shCr5VvVL8gLOOTshtL2fpq/9koGWywthl1otA5l+lFOsW3psN08r+G5kiEnBOxnmwFKEdzy/vJjO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ps4CFe1iCha2Zyvont06N7V8Txk65BrhjX+45NDLoUxoysE3M
	+Q0WsxmjSuRJC2xc/907K6Akhc8wbQYd7DpNf/6KIV1PM6TzBQhRi8u+Yv/VZJclKL2VFeYOWve
	sq9feGr40GhdivtSNCzdaQYKfN3tFWOrjqoO44UQ44MEUkE3U3bHKJzZM2sXapfBrBAg=
X-Gm-Gg: AYBFou3vxwWsCSgoxkigK3pFDAIJRic2aPibm+gxh4ox8BjpS+qN0cXBWTb+HaTM2kC
	vVU2C0d9f3zJ8W+mLjprW9O4yvQGjzs0Na1rRg0N6GBdqHwIgUZcVo2tW2yiFLfOl+K7uGqnOpb
	S41EyQD003+XwHcqRh9XnEfr4QY3lsrxkVaNqc7GXNI9t8O57KQ8+VaXEeMzvQWMJnwFTkVeSsZ
	mYJ73e+Zk3uKCYE2rLAo4PeMuZyCdjprK7X/6fVFubj98TC3RH2gu4ZfhScs12R2vitrcvqGmk9
	RQiyyWKi3v3iQeWYllinWtyK2gUZr9EnkVgW5IAdnEeNKajzUj6WWRUg8YNB/b2QI4mdrNGst6v
	wUGf10Tt9GL7RqE4l+NxyHIfdkm9ONyFWX6aP2KWRHPsVWQRw5CFzWrhD5Ttt7LGiKn/gbAfd8M
	oioZHmKouUreTjj0wPZjpvrDXt05l48DWw9CTZ+YDqVVEboKkXBimSINWeThYl
X-Received: by 2002:a05:6a00:189b:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-8bc1e1d2a29mr6061960b3a.55.1794499630442;
        Thu, 12 Nov 2026 08:07:10 -0800 (PST)
X-Received: by 2002:a05:6a00:189b:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-8bc1e1d2a29mr6061911b3a.55.1794499629987;
        Thu, 12 Nov 2026 08:07:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b27e8sm3588199b3a.16.2026.11.12.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:07:09 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: Fixup hw_err_irq messages
Date: Thu, 12 Nov 2026 08:07:06 -0800
Message-ID: <20261112160706.387641-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX5E0LyP6Mjt0V
 yjwh5z/jRO9jiFdRJUDyXfwoPwEcaN8MlX28DZCLGeOmO+5XepBKfFFT52TGrXZyxDBT2/+GiKe
 IaCDqmxi9HlMPJmmT/zIEHbkTKRymtg=
X-Proofpoint-ORIG-GUID: hREdYS6W3-HfPy7wWZTtgqjX-ApP-sVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX+treiuebL5yz
 dEOHKVszhupSTkDuVrK1azFUSX+eu2aNVSo/MiRU66SNWm9KvyzJo5pUVZsXRkzoF8i6ReP1lJz
 /p3kcoNTYbT+bLBVFs6zGudxo9Ag4MuG84gjubuuigfcc846RfwZYZ7bKBiXqF1e38A/13AhOwL
 OKJ5KARPRbWF4e9dfwGLEGb/GaP30cy/4vliQxuuWKwvrIYdlqqBz/RLWZa8xM4JiGWDgdp5ttf
 ABo1WyrnFFucxT5B4W1wiZs0MfZuDXSIj3qWNERxphm3FyT9cBgs8ohkV4rMeaTPFHFhHN4w5VR
 DGwyO5BT+BvxLvH32czvKHgriqBqBJ/FhWFDKQoOZccPpYU36emfVKjAxUabZdG+d7Smta/8f7S
 tOeR0YLeBGBrXg7RVMiyjToKqmN3tUb4UgpeCuMmd/UmxneHrqyhMUcrgSxKRQRmJc+kOut49yb
 u/y7JOp5Vu8HOtovdqw==
X-Proofpoint-GUID: hREdYS6W3-HfPy7wWZTtgqjX-ApP-sVz
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5e42f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cmur_pPeXtk5nLvMRVkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

Handle all the pipes, and don't clobber 'status'.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 58 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index bbf5ca4fb6fc..a1747990e10e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1048,24 +1048,37 @@ int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 
 static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
 {
-	u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 slice = a8xx_get_first_slice(a6xx_gpu);
-	u32 hw_fault_mask = GENMASK(6, 0);
-	u32 sw_fault_mask = GENMASK(22, 16);
+	const u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
+	const u32 slice = a8xx_get_first_slice(to_a6xx_gpu(to_adreno_gpu(gpu)));
+	const u32 hw_fault_mask = GENMASK(6, 0);
+	const u32 sw_fault_mask = GENMASK(22, 16);
 	u32 pipe = 0;
 
 	dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Global INT status: 0x%x\n", status);
 
-	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR |
-		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR))
+#define FAULT_MASK(_pipe) (A8XX_CP_GLOBAL_INT_MASK_HWFAULT ## _pipe | A8XX_CP_GLOBAL_INT_MASK_SWFAULT ## _pipe)
+	if (status & FAULT_MASK(BR))
 		pipe |= BIT(PIPE_BR);
 
-	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV |
-		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV))
+	if (status & FAULT_MASK(BV))
 		pipe |= BIT(PIPE_BV);
 
+	if (status & FAULT_MASK(LPAC))
+		pipe |= BIT(PIPE_LPAC);
+
+	if (status & FAULT_MASK(AQE0))
+		pipe |= BIT(PIPE_AQE0);
+
+	if (status & FAULT_MASK(AQE1))
+		pipe |= BIT(PIPE_AQE1);
+
+	if (status & FAULT_MASK(DDEBR))
+		pipe |= BIT(PIPE_DDE_BR);
+
+	if (status & FAULT_MASK(DDEBV))
+		pipe |= BIT(PIPE_DDE_BV);
+#undef FAULT_MASK
+
 	if (!pipe) {
 		dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Unknown pipe\n");
 		goto out;
@@ -1076,31 +1089,36 @@ static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
 			continue;
 
 		if (hw_fault_mask & status) {
-			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+			u32 hw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 					REG_A8XX_CP_HW_FAULT_STATUS_PIPE);
 			dev_err_ratelimited(&gpu->pdev->dev,
-					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
+					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, hw_status);
 		}
 
 		if (sw_fault_mask & status) {
-			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+			u32 sw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 					REG_A8XX_CP_INTERRUPT_STATUS_PIPE);
 			dev_err_ratelimited(&gpu->pdev->dev,
-					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
+					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, sw_status);
 
-			if (status & BIT(8)) {
+			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR) {
 				a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_SQE_STAT_ADDR_PIPE, 1);
-				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+				u32 opcode = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 						REG_A8XX_CP_SQE_STAT_DATA_PIPE);
 				dev_err_ratelimited(&gpu->pdev->dev,
-						"CP Opcode error, opcode=0x%x\n", status);
+						"CP Opcode error, opcode=0x%x\n", opcode);
 			}
 
-			if (status & BIT(10)) {
-				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR) {
+				u32 prot = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 						REG_A8XX_CP_PROTECT_STATUS_PIPE);
+				u32 addr = FIELD(prot, A8XX_CP_PROTECT_STATUS_PIPE_ADDR);
+				const char *mode = (prot & A8XX_CP_PROTECT_STATUS_PIPE_READ) ?
+					"read" : "write";
+
 				dev_err_ratelimited(&gpu->pdev->dev,
-						"CP REG PROTECT error, status=0x%x\n", status);
+						"CP REG PROTECT error, %s addr=0x%05x, status=0x%x\n",
+						mode, addr, prot);
 			}
 		}
 	}
-- 
2.56.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3F47CA74
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807639; cv=none; b=sX93NhF7pseUw8uHSqCYREiO77gbyNH0ZSE0+vcsSb71InXwoWrSWIzGuFa1KkeE58wO7qL4fuP27hqyiO0lr4H8mdOmB0s7CPQgxHBw3trXlf3jR2DmlgP7mNGsliBmwzrjmHdu2zZJhglpwAXAqLhf03HpRqBgQT5ALytrCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807639; c=relaxed/simple;
	bh=U64K2poQMp6VQd8aVBCl3XL7cfxJ0PNw1WCfEd9FTIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6ff+Wca8IWdQ0pkzOdgv2JswxzLWhyKSYJjxnbJab2jVTnEbrJ+EB53tMqKA6CKUcPxOx59hiEufny3pezKuJN5k9fVYodVdwG+CpH48ZecGgW0r3vF3R4iQUFYerJ5H9jKb5Hn9CrD+vfwSFFn588rEHzCJY40K/MtxVHOSeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hb9SCpvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgQDy6uE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hb9SCpvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgQDy6uE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsgi1404471
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLztm++Njhd4pXPyAbFeeqcu95PDUfVugeFnjo+4eAk=; b=Hb9SCpvcaHPhInbL
	eFtl0Af/8vprbIOEAeM3n/9QnCacgHC45wDU6krcv0XJIuehd1mwAeH7T8xkpiDc
	poGBVXWKynHV82ujI/kOEm3FrM6tBtzGsLfMJBc2apMxLWu4qWaqlKUDHUhnp5Ln
	PTpaurUOO9BLaWQ0dyvfZTqgyxpDI4W/vcgQVyylMgVOy1jv/rVqfUGUkcBy9Ejr
	zeRzbjWVWaAQLfRbavh4hiStEcQwPKR6SWkAlTRfg8DfB7gQI1Yv1y8o5CP3GqFT
	B2UYzwmfn5yd5GZr4x6ZQ+uGL7sWeQgfO9T4blGWYvPvn0b9Hbx53dhiSQy4+7jS
	oAfm7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ks14q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2460835a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807636; x=1792412436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLztm++Njhd4pXPyAbFeeqcu95PDUfVugeFnjo+4eAk=;
        b=QgQDy6uEh/b9P2mK/2NVel9ex65Bvf3gjH/OrGrCLPcSRpnt1hWWLjo0V2V8PCe5Dr
         UixwoYrwKgCscmlZwzjrfYICHCwES/q6F576m+0CUDgcrxCVCq/kvU/oUslie37A2Sbq
         OJPC5cMMAme6oojgZC7R1GlrlgrsUUIlpwFFTiqGNoWtzkI94AR9nQDKzQ05vE0gzley
         vvBAhC+KegeCwEayph4+h2JkUO6rGgLVf7m1wUkXkajI0SV0msuBBjs7PbBTjoHmfg0v
         jjXOpTnmorDJ4VkXiU7/yJoId9NN+rTuigp5mE3DmX8D2IfFhZX8w2fAw3VULOM9s4rW
         KcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807636; x=1792412436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLztm++Njhd4pXPyAbFeeqcu95PDUfVugeFnjo+4eAk=;
        b=p0Bx4R5q3bPS9YCdHx26w2lo6/mPWsJJpYYMKdgy5csyKhj85lUlCTaLCw2cQLhHlK
         jmN3KO6CuTWyYSmLsbPHVVTjMJhO3wDLLOLKaXythehkoozg+KePlwErhVPBHby4HZLW
         f7yfbBXSNojGnXpAicNhZQKn6Tag49XLozDOcEon1eTcHsMyG8DKZwd+DvcDm2lZJ8Zm
         8A8BcVjutkdwRmLeMMOpvHfxDMDLVIUTD3PKry349fmmvVjPz7rp+1MlKTgTeg+SXOrD
         cv1UxRXbdzqcvJt45iSRiWtRnC8hp+0Q2flBjJmPQ7ZXLfCynKfSZn+/vaxl0oH1/WDA
         E+Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzb5iceXZgWN0siEZgUz/p6KihL8D45M/Tdy7KFvR6pBdkblQ+vRnveVE9dURalaZ2nyOjZQSJVhR8GdjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxOWFVQJ3p/yP5npqwoxPr7Ktf6eMBPlBMW1Bx4N8cu/W1vaEq
	rnn9tHG4+1QPJYoA5n8t1AexDcj8gpENjncHdMNosrG0+Az5hdleoFvrAWt7X7SC80skaf7c8So
	+wl404RkRZT2qg3whRS6bGYNXy/hrn/cC9BmFfAe2s9FMPWE7Y6JZ7uhwLaGgNiNz4vnN4Am7qv
	8=
X-Gm-Gg: AYBFou2OR+StV0yTJNwvkQcYMQGOGkY1C3ppdnTOUwsFIq6lBy6fz4TdkjwKqneGkxr
	RFOb+12ofaiCHw1MBMLw2LRJV7DVKUx9oXOQMYdPSK5edxMOnKWC+Nx//ujB9v+X+Bk2Lvidy63
	ezK+6PGRie7xby5cL8tx54qDpL7VPzj0uqDICFdgj922KocbgBVJsxiF8lzafNXJzubEASIXuCF
	fhwFUc0uE+IqpZT5aty30XahGksev6GVX4gCWAXftHw/80W93y1AKsN4xDPYFPRLzkEWuallftm
	cQtzGE/GJzGiDJCJs76tWzHSPN/Pa8uemXsrNjFxO7WT8PdEmiKDNAm4VthEXseWQkhTikOYydU
	2qSSOd8GPJUKXUw8TD+Smm0zM1fss+BF/hUQh
X-Received: by 2002:a17:90b:4fd0:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3ab3a778837mr8216196a91.30.1791807636373;
        Mon, 12 Oct 2026 05:20:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3ab3a778837mr8216156a91.30.1791807635718;
        Mon, 12 Oct 2026 05:20:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm15935932a91.3.2026.10.12.05.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:20:35 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:22 +0530
Subject: [PATCH 2/2] soc: qcom: geni-se: Avoid redundant transfer mode
 selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-cache-se-mode-v1-2-22945ed0da29@oss.qualcomm.com>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
In-Reply-To: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791807626; l=2203;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=U64K2poQMp6VQd8aVBCl3XL7cfxJ0PNw1WCfEd9FTIM=;
 b=O+wuJLVkixUvOT3tBpNJtQIV0xtyyKQPyjL4PIKixVBqYLU4OIvktP19ebESQhpFHewjlmuyF
 sh2Q8PF9yeLC5na4j1MNv7VC9aGGEX3tqtq8h3Grxz84nInLgoexCe/
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXyL/lOu2sU5Fw
 Id3xjjDGOEwp8gTaq+Aomdfdoe8CgiL2+Nr2Z8pJ7YoSCqUSbaBi4stY7Peuh4ueNbIB2kIKikE
 f+5yx/78y1p6FdOZRrO0I3NU2NpuIFLrmFZ/X51BDrdRtbxlLKylRPCXAswqUjpww6pl6TFtWOQ
 OsXjVyyzYvTleRjWafB13ByqgKFXnDeStVGopH9f2Th1vYYVPmdGxYdgPwbweQYizM8/bg4sKzB
 nj/zslceLgK2/3OR0xJtbEgo4DCJccXYw9lUA8kIDttJ5WZ9KUfpxpyXSLrz7RbqXk8mXU6nfzt
 3gKULlJZ6YF3hIdJxzHXKSB2zaEqe9Sl9xSaPldb0eSrrgjn74/fWocs3mLE/KK8XkhLhz3z36F
 a85YSH5uGWljXvwnv6NeJbd/2/ALpePDdowKswy8+jJIrAUOLzX9PYpAPj8W/kSLbSEqYDFd0SH
 wz408NnLsGAxNS8b1Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX9ljNxXnTWos8
 VwYLaVJ4IJsmMn0BQk2+Gs/SFTBypWen4RHtKCi47CNDRNjX4CAP5AxYjFgkyOLVPz4P3+VFAmp
 eGTXCDSwK6WQMbXzHguYtK8DeNsB30Y=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accd095 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=J0WuJNJ1EvBZ_6ANFisA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2kpHzwKlveCaM9b3WIgrXsep56JBAQwD
X-Proofpoint-ORIG-GUID: 2kpHzwKlveCaM9b3WIgrXsep56JBAQwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

geni_se_select_mode() is called for every FIFO and SE-DMA transfer, even
when the serial engine is already configured for the requested mode. Each
call clears interrupt status and accesses mode-related registers, causing
unnecessary MMIO operations on the transfer path.

Cache the previously selected mode and skip only redundant mode
programming. Preserve pending interrupt status cleanup and GPI event
routing. Invalidate the cache from geni_se_init(). Update it only after a
valid mode selection.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 11 ++++++++++-
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 311046544b4c..ce4de4917a83 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -370,6 +370,8 @@ void geni_se_init(struct geni_se *se, u32 rx_wm, u32 rx_rfr)
 {
 	u32 val;
 
+	se->prev_xfer_mode = GENI_SE_INVALID;
+
 	geni_se_irq_clear(se);
 	geni_se_io_init(se->base);
 	geni_se_io_set_mode(se->base);
@@ -462,6 +464,11 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 {
 	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA && mode != GENI_GPI_DMA);
 
+	if (likely(se->prev_xfer_mode == mode)) {
+		geni_se_clear_irq_status(se);
+		return;
+	}
+
 	switch (mode) {
 	case GENI_SE_FIFO:
 		geni_se_select_fifo_mode(se);
@@ -474,8 +481,10 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 		break;
 	case GENI_SE_INVALID:
 	default:
-		break;
+		return;
 	}
+
+	se->prev_xfer_mode = mode;
 }
 EXPORT_SYMBOL_GPL(geni_se_select_mode);
 
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index b3372a3147a0..f77c3a47c3d0 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -78,6 +78,7 @@ struct geni_se {
 	struct geni_icc_path icc_paths[3];
 	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
+	enum geni_se_xfer_mode prev_xfer_mode;
 };
 
 /* Common SE registers */

-- 
2.34.1


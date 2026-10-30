Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395986;
	b=z+Vlor98PXB4dh8QiUWa5kF3/Z8cRI+ERwDX1HZkq37BMOov8BcS1+yJqcigGF7L/uKY
	 QKn24rwYRM1HyQio1XSB2bCFBQP1+SBGxb6YDD34vDdfPk6+bS5EGil95JaiqWg0U7F9D
	 YoiTSBhQ9hKFxlkWPAp4+UUIScoRvmDrJboxIdu2xPaZuM//gtz+aW3+a5TOMOmRi2yfh
	 S2/9XCBwJyyNMekP5Jk2MflURoARAwsgbJz8d46DaVvcKquFgKZC70DHPkZ23++0avRYa
	 jMktY5vDo6tFv9bnAHZhavTDEbtCCX+ti5d4O6xAe9iUndcchXap4QdaVbUbqBIeLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
	b=0dtKRMbCW+4wjEoYwx7QuHh14pSqrzjxmXZeLLRFinq4k2L0pJDGCjIx1ZwKFIHqWny6
	 mSW2yyE+rAkBVoHKA06aJeDYyPP2aOSp1/xc5pNIwtUGMMQQVqqAc6SEA78J5D53Q/yn3
	 vyuok3fzLQGbVzedzWGCfXVWSyK4PlXCz+vQ89/OdH13dVUfqLG7sDszYiGlC1bXwSi9R
	 XDFtd8fHFMXBlwXq0Eq5bse0vGc6U1RQrjCExZgWZ77960yjfxEQxjIy00T82SuR2Qrbw
	 VW8atNcXu+rK5oHuFab2G9ass8UoXz2XdMFqCSkjSQ5VR8D99zD2aG0YUmnicNhgwjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJWHGY7U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2jjX+F+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9660A2613
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF9660A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJWHGY7U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2jjX+F+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAbbm3852717
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s64e3dkDh8b
	RM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=; b=IJWHGY7ULHQoU7QAD34NnNEBZPc
	G+dQ23rqwp0I2FrbXe7f282DSCnH5ca3O23GKsgDecMzjxrleYDlmwpauQO4OmMS
	P0jqAl3w4ne+orXJgLY+95FrDfFRnFbwgTIT3dR1mux36URKraE0wyXU5KlVzIBK
	ubX3ibe/MG781RJeYfpNu7XwgUv3veojHTUKCI1cDXQuP8QWxsqHvJfd8jabBN2H
	qs9VJe2JxyRHUDnn8MUepPKPFOb5gCOEKimik44nQwhCIVejyYIrrAfGx4XHWmWn
	RBBkdP5x22G1W5Dh/G6AvJd5mJzPY0XrA7QJICCjmRG5iJRLD4XBRENF15g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x1824c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso535079a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395985; x=1794000785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=a2jjX+F+800xi5hGQX+38lV7MGTGtij8RACicKAAqf0Rc8lkezt/0P648qfveTsT2f
         6FTcZpLW1B5ramLXEAjHYkyEsLNCGUolt5xfW4Ld/HX/nXocmazdQYKUbwfK1E/R2TkP
         fwsAqLUeR5FF1XkQtenYPXLYo1yeHikRz2fZCxulhNqBTZLOKEGSeZ44hVTQi3dfxW/6
         G+W0/XOPGeEKj6BpUy1yc34E/gGC0JHDuOug+71nn5wJqpUigixWJ4e/WU++QlJ1rN+s
         TqNpMLffHZmbj0EyQPZru0FVl9uoLkkOn6sXBQIvvQhst+KrV8lBJWMoFI0O1XmJVk42
         28eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395985; x=1794000785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=ILNbPBBefYBY1AJGJWOyD1UCHc3d0QbSPixMOAqh/ieAaY1V/E3tUxT0v3qDGiZKm7
         iP1p+3QtLytebey3nII1h72G0mhtRFMQIDMJ0y8hDoqJn+zJkC8+lZt2XnPYB0og6gmA
         26DTpl5hoeJQUDfE6IusqI7ogaZ///BTu27EUfZXrf7HmvV9ekLVd1QG0BKSZ69xoq+6
         GD53CyamvA92t/x4TwmQcap0rLPSYH+SH6BGJBHruYb66sln9mFISVCQ6X+UATkpDG8Z
         wor62I65TFXlEh1e94WTRm1MCKVs/fwOOdApq2mPXg2xEBDUXemq1MD+BFnPV/WEneOF
         Ru8A==
X-Forwarded-Encrypted: i=1; AKwUvBxxNhEImqGJqFLLtYwbfHhNFO2jk/RgTMGoXhDrnHK4X9uyOock3Beu+MGFy+u6tagiciVqdaJGQiL+l7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWHztGsLGXp0TvHYNqTXUjwCd3cZ2UCyiLG5cQJt5lhBS7t5pq
	N2Yxdaf6EfCxr0diYYo4sq88SI+DDznGAqgJpdu9vqHJ4/jYvtClPiyNo0oTZkzpsSluiP0BL06
	IBKGyJ6/UaA1dCz847vs5bfqerh/1vQOVn6cYAJqe2W2QCttCNbJ7OZvqBsHzv0I/DCU=
X-Gm-Gg: AYBFou1PWf+o9LEb78leJu7IowlPyR0DGDaX88pjcsKngxl4LVFUpINh70Kr9Q7MFEi
	xnyYZMA6MF1OUB8B+2G55SuSjAXj6i1Z/5AOpVihqTIp+RxGpXCjN2bIu2aoY2O4KbmPrNBULm8
	euRHnZ/VehIyY/A/0M12drK91tDQeiZoWL0rawnpajHS6xDXXEa8Cmtq7t4luQ5mkRvN1d3KTx3
	tPWO9I1PdB+vngdeh7QdRypgYiDJlCMehan9u3cxkqn69Odmn+7ndEajM8qSvaBRU4L+nE6g/Oy
	qjGaYYkRLLEcDS4Bki6VZJQX0QSpeSec6dQL3VQQ9KKfgYOs0HVqY4P5lqxepdzlR7P9HdThzJb
	w8h9wsqUb8uiSAN2btp1pMKJIT7PxxaeYNMHlUAwwKSZ1b96hQiKsPOYi4L+tnyG2xP8JMlflxq
	CnW+0fg0JiLvVcW0ok1BqXlA==
X-Received: by 2002:a17:90b:3881:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3ae89814e7dmr2877747a91.38.1793395984676;
        Fri, 30 Oct 2026 14:33:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3881:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3ae89814e7dmr2877720a91.38.1793395984160;
        Fri, 30 Oct 2026 14:33:04 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm10255599a91.1.2026.10.30.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:33:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/6] drm/msm: Treat !mapped as an error
Date: Fri, 30 Oct 2026 14:32:48 -0700
Message-ID: <20261030213251.55365-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: bIddJc_9FGdQjeTu3g9a6qvyj4nYY-r9
X-Proofpoint-ORIG-GUID: bIddJc_9FGdQjeTu3g9a6qvyj4nYY-r9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX7IiXQk0TuNlQ
 Xp5NNbJSHZFNtxqHhvpyJxOLC+DmkJBo6ET3QPY20xcdwgGRexUcxSrRKMmjY+nbxMUdKSr1K9m
 YDyUoJy878zEwSQ7gn8hU4C5nhs/fdmr95QW266mwo5ru1/HFyqiCPkh5DuhELxGQMKgxbSZbWT
 PHkFjWuOe/gtac7mSN2vtvs5pcK4xTtgvVfkt97XvKooEba0FqnffHG9f+/JvxegfIP1onAFANr
 f+UWM/Acj4cKDGTn2WJAHFFdFdoOiWXMfNAGE7c2XJYP+ifjOSqI7JhicjtM7r8bMZ1NR8Bodvy
 zxyuI270RnGyvl/pa0uwSx/gln9KGQc1phKssp/omAzEfyg9ZV0qFPZmN7Orc5dJMPM0xV3zUdk
 mHNvpTCH3Ib3sESyQYo4ZqbiSVtQT79JsoaMtxyVMRStkMPn/xL4CnwDpucU+SdZAuB1lsBSplM
 6/McRqCHWXxUQ2U1Bow==
X-Authority-Analysis: v=2.4 cv=R92WitRX c=1 sm=1 tr=0 ts=6ae50d11 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IbsCIv0Bno-BzyZ2rGMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXynhxPYiZI9FE
 Vp9aH+SMSCo920LQoiISKCwjgQ4t4+vrDAC719IWPa6BRRP2LsyK25wrvk5GsJbiLYc7rQVlU0G
 caw8FO6Ii4W7pDbPum+jf8u3/ahzoe8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Rather than silenty mapping nothing, treat this as an error.  It should
never happen, but if it does we want to flag the VM as unusable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index c2950d32c507..255972323f9a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,10 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 			size -= mapped;
 			len  -= mapped;
 
+			/* If nothing was mapped, consider it an ENOMEM. */
+			if (!ret && !mapped)
+				ret = -ENOMEM;
+
 			if (ret) {
 				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, ops);
 				return -EINVAL;
-- 
2.56.0


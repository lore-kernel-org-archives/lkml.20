Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395199;
	b=RjDjw6+gzK8Y+dMvy6V1egABcK18KAOj4oaPfF83VBA8V6NyxJ6RM4cMhjusEZhP6tNd
	 p1Yk4u0JbhDN5LVyDze9zl2V+jYM/LcCK4cBabMicZIL638UuODJTZF5ON9p6dKyDiQLN
	 AsSm8eH8VsIeYY6xrBunpXzlcAqZRlxorT2QxwBxfuqs+MliOc1Qedlsh4pKa0rc1GNto
	 1TxY4i6gSK3YSZYHKXwVgG7zxaDCYWAnC/rbtOLFYMs9Amndt9iKF+YmqMFQKPNwd/p1h
	 exn7BiMchygWp/jvwqAsH9WSeA5j208Ibj/6BFohK8w6VrzheU7/kULgyaKVsQpA2Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
	b=vnoMR+k44DWek2Ane1IALcZVyco+2mAIx2vcVLVOu5wd91xNljOH0jo1YvravIwUoVdw
	 sh8t7H4nYkTjbbVHl8NzbMoud9pdIzIg2OVZ49XjtB1glFvpJh57d3oeuamXsHd40auVW
	 v4CBFrd7s7yqdk6lMzwHjPv3m7hrP/bKyO7Rd5WHR5r2AgumykEZfeZpg1EM2LcUMl1DE
	 wq4WhIXaNMQSG9WnTfTXwYou/P3tuzOxQzO/Wc7BqjqZa2pdzz6JZhHII+u61+5Cmt9Pi
	 VJeOxx4WmqcftJSfYUzxQAmj3Pi2fEP1oOzsjUunKH8JvN++7VAgCWk8EcxrZ9fwmEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWMqRK0j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEqlPshY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3660A6F52
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E3660A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWMqRK0j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEqlPshY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAbOK3367912
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mvo7MCBtKan
	n098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=; b=bWMqRK0jAzC9hiMUeHLN5I/G2dL
	ETokMUQEMbNyy4pm5qWIW0DXrp+h0Rn/15zedKBdZraRuGnoNerikPotR6bQj/TM
	/2pEw/JjbX9kHH9IE1+Hs347ilBd4C4tpy6Fb++k7ge2uYW8zZrvHh/yPVoZWhpt
	03BcXhVE/n/uHWtBpNoQDk+ymrfNgojH/ei1GAEugiqytV1CkalgBkItk90WM4t/
	/X89VpKRa2gWDD/FFozk5X18fE18HRTE2YwSZVwzw3hzbt9G+m5YsTR62nm7t7OA
	AFNNU+RJW7KYSyoumNaI+FewHinBaJJDMgBsJQY9geHxP5cfJPZQNCQbtPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x080s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso951147a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395197; x=1793999997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=DEqlPshYCJLwRlkZJRKgmay3c2LeSU9AmiChmZ9OKG26fN1Aq+i2GS1ICXbn0yK2F+
         T7Eu98fG+HQdj/ZlJGZpaV8wjyaId3FPGGKMYrszke6QP3XGu2oSQtYkbiclLFF63yNv
         B4Cs3SwbRBy4LsWOunqPvn41SjANf4+9Y7x8FhiIRauJ/Ukg8b67kXpUEd2hiqC+R3ni
         64ck954I4RCut92yrygNm8AKw8WoGncfbJ8FWiTHiMU0wCzVO6HVdVLDT2DacfpCPylf
         CkUraH3z45bQItbjP5jaUki+mghMppsRQSNjjlCy7UnZQDS7KCpiyUrH849Hg7PCFCWj
         GH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395197; x=1793999997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=D54yhykmnf7H8wVMEGwZxTFMlswPiWJmv36+4jE+myCFkRUsiRlkUD4bQn8weCZFEb
         kE5ZMnNN62pfC60CkJyJ3VLmEtrbYXcIXzet48Y5LDIFl/J9KID2WYuEDiZnRzfAVwEg
         awXNqcc6/bzkdZCG/FiMHZVMY/r53Ahpa3/DIvXbm+MQiHw9jPpgYtT/j1xYrhASnXI+
         osJkrXdOvnYR2dL+Cuqv1eSF8hWFAf+MtpqsEgrf7DPpqOEa3gh0UEjSpR7h4KdhHdm5
         C8eVBlzk0NHiY/+A9qyI8sUvuyIuSSn7KrSzHRCDKxf6Y2Nj6cIhUyLmE+zQ6kKa1Nvb
         cvUQ==
X-Forwarded-Encrypted: i=1; AKwUvBximAin+JnU8nFMYdeoj05d0h0DrLZPDMB+Kq9nct6zolPzmBYp8KpYcWkAd2VpqsgIIBX6htCTb5pUTa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg3CHRdisCfjSHjny+ZCzWvQAue92h8B/mNhqCIXfSns0qAL1A
	PNm3h0ESjfJPMuNi6t0u4RdnIFeYiThbDNEqnBRXt2h+vYSWuPim9HjX0wbmLV6YDNQa5ANfvIE
	UFenA5t5cZCkN6SidqtGn0BfHcuYDGdj8qWOx/JxfAOGtvE4Eo0ez25AQ0HhHf/y7EJI=
X-Gm-Gg: AYBFou2zmAVoV6Wdc3cSr2tsewgn+nlTbLuywAoGmxvjrUYd7ioWcB+lm8QvKYdbTid
	6kegNQqBgnypJqGP+ICiZyACRDySLQ52JnRax2GSqEPyDiqHrRy+mdrHrolf4n45QhwSDYve6mx
	Juj6YW012t03mEE/wMUDkuZ0h5RhLoRhJXe94DQaoUYgbROpyJ9w520gWQihT2z/ngvvjojSbcy
	1RrZDhaTv/Q8hxWboXW3SC7ckyM4CYZt5wfToDcWgCp6LxcY1ChzvdNMr9IH/AxTA1VZZ9F7SSI
	W+Kc/03N/BssgZQqTwRnmxso8EwkIwzPzBVfFPl/y0mlCo6LuSrSduVgyeHHMi8C6XZA5PRWwwD
	Vs+ZefAngLZXIsr9LZclQ5efpA5XmMGusDWwrRZe1A+0/1ynuUcEeC6TL6aKhjFSW8+vFcZp6gC
	WSHrLSnph0AAPhmRCV3NPeZrU=
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr2799605a91.40.1793395196859;
        Fri, 30 Oct 2026 14:19:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr2799590a91.40.1793395196372;
        Fri, 30 Oct 2026 14:19:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ecaf5sm5291613a91.16.2026.10.30.14.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/19] drm/msm: Inhibit IFPC for state snapshot
Date: Fri, 30 Oct 2026 14:18:14 -0700
Message-ID: <20261030211928.45761-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8PTpfxat80EbFO6_ne839eas1TapuZxE
X-Proofpoint-GUID: 8PTpfxat80EbFO6_ne839eas1TapuZxE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXxemCag/TZnOl
 lsbxgBYUU5E2ZmphK4gonPZiF7CVOXMIKvJvlGdpTgZrIiYP5dcGrBLgZMhV0+G/dN5bgtUFtU+
 tXau1BKLeRSa16hFmJHO90AE41666uw=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae509fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jgQnFmZX3A3noQDnNKkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX5gw6ku9aa12y
 NZQbIgomwYWq4Ce6vSkq34h1kwyFSQZS4lcfZhEl3qykeB9sU4okAOO5B2/ZFLv/5+kV/pwTW3K
 h/jN2Pn5DtGCLnRuxO95r0R3G4e4CNX0KBqkFKfJ1kzEqfof5FqJtX3gkF/HAsXyQO/EKT8qKkk
 eCe5yoQObU+kPdI8A/bGb62nCQqxFi4eIb32PLfDaX1ZZRGZVIYhf6AcNON6mMJijTWPkCCHntM
 zn6q4o2DF6BJXDHpoahY1s1DsjvW/IJ1jrGjRC06X6HYAYwbTCT9/W56EzfomL1c5pD6aq9A+MX
 YaA9rKc4RMZ8s1DZ+Yze1kaiYKmONo4L4pruFT4OXUetWC6XWoe4Qa8C14tKsAPzmFG5kQGCznE
 NAaN1y6aK3olx1jGuwy4TA/87ZrBBcOwc4udfnl306XZ8mS1syl0enMTa+kiCRHZUpWRRD38lIP
 yiEcFPp5A+FTYK27Itg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index b0ddc02f67b5..224401b4ab12 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0


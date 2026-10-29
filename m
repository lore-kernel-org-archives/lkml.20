Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305114;
	b=els12SbVa5sL4/qspnjZgvXOrexHz4afj53+F7/VNk+w3ag8jkCe4FjOdjatupslSFb6
	 7ckMpo/NIxS7+o1/ttfvnloXDMGEpy6IYa3I78ENzwOvz0UQKJPijVnQcYlIKWOYpuLzp
	 XAQkN+++rktgdNkngQf5KIqVofAOwrhJNGbL6fizp/zgz/Vde+IXDIbCtX+XADSL4nAus
	 dXN+TdBfuz2kswVattyebTX8jLBV5n4tZ85nGU4XozK/7q82Ra2K08jVczjrvI12sctqC
	 fcW7UBm2mxziCFLHYrCFmRGfLu2gqRGn1UVhv/I50pWJk8Y+BPXUYdtcNipXj+nvWRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
	b=l0pQ8fIPM2/MQnbunB1IhcXOcIVyb/FS+2I0CVOOHi0Z0NcfOwFFGn+AGzw0PJxKMVKk
	 Tw54b9+ujzpmcB6CoQ7TVm85i35eCVvMk97LhqDoq5PW6ITXJoWuw2c4h7xvWD2ioRNaT
	 30LXYHE1E5SD/RcSiXMFMfXAd1u1XMHh6OkBupJOcfgmo0NBrxgVJ/7EcVhpv/HgfRh48
	 4ehsrENjFbJNUfvjf9iHOLGNmyorGtpuRbHr5mKQQE5k0M2Pv4vg868BOLzYeKsoPNqxV
	 Wm6sVF/vUqRNGmJhOLR1WjBDqJPpSIppYm+6qcufnQqGQJcndn+dbzV7YoaYLDRUJ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ4FsQGE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMxcAE1c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F1C60A2619
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F1C60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ4FsQGE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMxcAE1c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjeP5061365
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QK2V0ULW7LP
	9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=; b=CZ4FsQGEN+P6F1229Rha5XiM/C4
	dp5HvPnCQThF0buZ9fZlDGWhTANiNDt2RZpnJAnpsAuIjmYMjxMlBICy4f+w4+uz
	mpElpmjJEtgBHP1gd0SaM6wa+kjZUlYWt4gjkzWcRgZXBjLILh0DpWa6banTSgdE
	VKsukQeJbTOeNDFtyIzpFMmChSRhH4RkClka+yTsd2cTFbAka3mV8OGZLEZy374f
	l09Jc0XpPCzhkx4BckMrzpY+ysGZrNjjz7ypFHewgoxXlUjfJl9A/lzPlg5dQPo3
	g2yREVd6+26cV41a2wyASfI2+Rzb75O4RcLvb3wk7D5moeIdv39DDLpacHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmby38ab6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso273885ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305112; x=1793909912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=ZMxcAE1csOOIrdXExeGVpLxWfwFqHpmOgxez3r8t4qIX8ogmIjmhXnsvCHEj+6mYkM
         9D/8xWrSa4EB1Zx3WvXfcUhOG59p+rzgOpiBK9zfBzLvn8uglX0RUsIyKW8hgDOd/umC
         EOZHIGvMFqT7ANRVmL8j5kNLQhGEPpzfID6ZcbkM4HzBy8iVSxXWRSL43k8bvLsbB5nZ
         uflWQpl5E5KVKE44JZOyXo6lyRqMs9MQh+LQidtqY8MHNyYZ/G7WdtkUUfBsTx+CrAz1
         f5DORrVLi2Sa324x4Xta017I2zI3YItUNEV9Px3LEcpg04fw/ldvkIiHnG4/9biabLqA
         Qzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305112; x=1793909912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=jO+DGQmnAbe0M2qVFbUo88EiRPATUSKPNWRSpa8UcfvEVmRG+fILB9WvwAdrA2e34p
         wg8yMFpJspsu9Z0vebZ2tCLWfrCpf9crMFWctc1CzelzKN09iELjTG9QIt4z+CTFHsdL
         djwbU9OyEVSIaqE2/WF/qXpoYTIPcc/xYdMo3fvLGo5wdI+T66gb7S4SwIULjg+4EHia
         RfZROQF9JvCsOWC60ROLSGoYXzNMwJlh/PVm4+4xIKaA/wfzg6pOO0Bs2+tbmmH61+et
         VeiSdeD+YsMJ0NB0ldePdZhR+VOaa/tYnM+uGyQt4LHNBsd1dkwvOJg/grf77CKLRp+X
         /Mrw==
X-Forwarded-Encrypted: i=1; AKwUvBxQWG3TzC8JkNXZ+z43g7nNEdC95XceeK7YpbsCHzYkbiZd5yhgiRWqJzrUn3O9C9p/g2vw1roL3/ElU1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtsYY4OrN/9gUITxstqp4EyM20fcxMZgzDWeuxqTeFIuSJLHtx
	gATke5YvUm6jwv+uCjLDMmEzrqpvewjEiwICkIy442GqEpx4BewPKJ/tTW634UtW0e/WVAiwE26
	MGHZevlQ2ruJl7VRj5OGwNbH9CAO7vySUZnktg97MppYpcyGDdwXj5tgl+1OM/yeZn1M=
X-Gm-Gg: AYBFou1MXq6apywiOm5PMPR5QpjGluZ2J0YOi6ibYtilcGvCeR2Kzh8VL53cLwdNPUO
	xl4uYNd4WQHa44T9oVZYxvYmem1PMAthK8nniSQpRvGMfBdPjWOETDgmeyVYFZM4ArdqPgI9LK+
	BxEYFDhb217TnCToyg9UbORgyB/Vmzug46r7FR5exIx4SgSnYwq6mKTvq3tgPhNhNQPcmliwsGV
	VD4pHKuAdHnCLzDltUbebbA/V+SjrtdvVUoh7+U/6kIG+Fpgxnoo9SxcM7vz6u8xxXX4/FCx3Jf
	tfiuC7F6A7BvViHFlNlxdwcy2K4vYyNQ/bgdTgEfNCj8Bp+Y5Xt5EgNdkerRqnmpV2uSbJKApzl
	A1KKffThQLb76Ktt2JNFkjoo5Hkw9uESOdmgcB52+LlM+0KetKLNC5MImbO2dSNQmchgievX0Hr
	ojjMuCbf+UP1W+t+FmbNeveQ==
X-Received: by 2002:a17:903:1b25:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eb3649bc17mr4538075ad.12.1793305112536;
        Thu, 29 Oct 2026 13:18:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b25:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eb3649bc17mr4537925ad.12.1793305112136;
        Thu, 29 Oct 2026 13:18:32 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb369304efsm555475ad.29.2026.10.29.13.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:31 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 16/16] drm/msm/adreno: Remove temporary __maybe_unused
Date: Thu, 29 Oct 2026 13:16:26 -0700
Message-ID: <20261029201730.151754-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX1mnBPmi+YBXJ
 KPo/LWngGeaA51rkZhOHs8wu2OfRx/kyF7YsMKMWsopitILvt+1lucAq/4ynNZUc1OEkzEreu1b
 meMOaXuoXr74wOnoU/Q6HaeJ42V7gJQ=
X-Authority-Analysis: v=2.4 cv=ZvN4uN7G c=1 sm=1 tr=0 ts=6ae3aa19 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXxrjrf+O5CwJL
 igwVcKVq9schLvWVXVKVu6+dZoEDy9DfeFZcsWH4icvE+uihwFwANXqbN5qUk7MhB0lezBXOK34
 OQ5LVbMkpbyVLIIDbp3CAO1HPLtTgWYNoXZc9w/6/7AXA1d3PiCzVLBWuXjvbVBt3QWDZU8CB0K
 gsoWWUCAT7yaHw/KzoaW5zzUOs5XG+ZuQwqo3wXZ7g4hFvsIwRy1pWD5aHr4/ncUdVomGzvMdU3
 72WNUtyrs7iZ6q179vuKTtn/O0xtBBzYGxx0F0Zx4YZbsOQzkF6S3bEy5auT2LHA37n/vyNu8Wx
 uhJKRkcKYv4LTs6rf8wai2XlBAujPw0TEGxmWO3nq53kkUPNrQTdw6JZY6DafpuHh72mMQfWfh2
 9dUECWAE5K4U1pYtvqsqI7NZZIp94jDs74LlNqVW6Bpt3T3ZdJ8w5qspGJv5kIVDtVDiOAU0A01
 Lm7kcUOrANea/tmp00A==
X-Proofpoint-ORIG-GUID: CtlPq_mLmuSPAKDbfuta8njWKR9r3gFe
X-Proofpoint-GUID: CtlPq_mLmuSPAKDbfuta8njWKR9r3gFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

Now that is unneeded.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0


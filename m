Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395187;
	b=gWvk8Ui1NTFFPpFKyxLDUXTgZwHPR9Qm/Pa94M9nTA36VN/crlMLoOGaP+O820f1nZsA
	 zfQbIm5ECOT+EdALa+dDSFI7+QXLdpLir8TRc3XQ/JRvkl9+wh9G2ca/pXCb5Npc5PKQp
	 AVlRICPz4W0cGq8f1Sx1coQ/iJ+bIDef61Q3HlGotb/EFMzUqDKIEopGBjHe8kirrXnWb
	 Q7J+CjN/uWpf2u3O4j7NEXSUXy5xVlTw/sYUXQO4QxWmKrE4TR7AU3mJC6aZkiiWvZR24
	 M97jV+Fe1ujb2lh5wYY/J0k7SIajDA2LwZDyMGQ0tHDEeQ07C6hc08kluw7n9I1Kv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
	b=tDP1w9hjYn6yfAfxPFbOlRHh1Gcaf6TldEGkbpdkd1B6sXA2GT6EDvgVRnUqNqCMxG9A
	 Czc6La5khJ7JH141PTjdDB5pNBhA1ufLw4WxI72lW8YKY4bE0ZTvE/WesnemBcSmIISvT
	 9tewRRJm3KTHSGYwGoPFUKjdyLOH0qQ0kDZXl3E2eP6xatusxpsILaRXmXdgdf417i9w4
	 e+TJ5JNIxNbs96fT/i1geIKC/uGflKiCvd8DibrpHramQfLJ9iEtmc66BcX9v1J/qnyY7
	 ZI/Q1HyQQaaIp1GDANGTiAaCi3A8vpODu2V7GyKC85pab3oGRJbMbQ7hMuksXTN3yZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B3W/fV2G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Md7y0B6i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685860A262A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7685860A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B3W/fV2G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Md7y0B6i
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULEcSc807344
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=en+kx17O9Hv
	lGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=; b=B3W/fV2G7l5Xpz5s/J9CRKwoDYM
	2OQXLI3NKQAcqjTP/IG6Hop7NkiNCVzAIPoOKQTGXiH06qONoAKiYya6IIeYZrQe
	mYMM3YrmjwoWASiwXQPg/3L5+7A2QkYDmKevtOXnJR675wHYWWd6Yno95K51Ye5G
	/08UoTQxKgUV5/IhnhUgsQZQDYQ9YqDOp+Bw3/WQOxQj8FCuU1OYisNUhUhLsGom
	ufFOrDU+JgVyoDdhFWvvITgQd8eeK4OL3pGnFgLvW3FfbxF8NWsa4/LQErgIeEWl
	sq7gVnZooWCcR2rRtKbS/bgCMtUGfaw2HgLA0Qn1iUu2qkjI/KhiP5P8eaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x1017m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1524121a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395185; x=1793999985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=Md7y0B6iVKRRbIKD5FV9YWhWhff++sBB1otXzdMqiCsBgdRYlUxS4tk0TpvIuMOLXe
         dGC8LvmKY6C3Q7UkhlYoRpG1ygf5hBpcsOWk5NToKohWcgLihyr97IZNX9ocfEU0dW2l
         8NEpeqoNQibTZxHJR6IRjNnLGjZPGZPgmy1E/idMaZF1OM7I3rLxFy/21tWRb0WOzuAY
         tgN/6/GEQiGQOwW9HNqlZEpzNIJKKZmpba97/d289T0KAQECd8/xm0Vh1Mz3i7cY+B68
         uyF3Iuy9+7/zhOYCXibkO2590sMBHKbV4U8iYFhy/pr+jiMzhnMoHM2SEyeAhgnrSLJP
         wqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395185; x=1793999985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=GYvIBecp43pgnroI0Ql2AB6kfAaeqscVS6AsaeMeMTMOCZM+97o1u7wMfL9ZoagAkZ
         W7CMAhza0lGELFYLKgkCf//icFcyOCABRRXRQhL8Xyy2yP4QXORUHDDt+QK4Wlr+Bdoy
         SUAUWZna+mQuhI/MMb3593UCr0tIvFcor0ye2/NBAd9fEDj0uXvxG148abHEGPnM6HoD
         cbTYGZiBX5CisT0/4hpKoSNQ8uozEEJD/ZJ82xbi8IMmMMGJSniZcTJ68e5wavmLYqxQ
         b42WvlOo8G6/dGH2sVHyfNGUhC1775NkiLhqx+BjSlc+Yk5zXja1FnY+miyVK4wdbBTG
         4Sww==
X-Forwarded-Encrypted: i=1; AKwUvBxqvAy+w2trpn4o2+Cs/ntei+fvg8mBIFffahNhiQMOnK3zZyFCaKqyLo6PjnE43NY2EDcaPvwfOyxrjT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYITxYvtsvC5vVtXmHcFCcEAoxtYsrU5NkMWicLuQl0sUy3m7K3L
	QQyfVCPUgqR1M6slWQxc41FrGftR0ZdB7TBIl5/MD0x+I0D9ST6/hoBP6pIukImrnu1vHfqwqnF
	69wPkyftAJ2gMVTsW0MCq+Rr07pEValyjKNjsLzA/sjrBzGf8sI130SVuWQrmfLxz1Fs=
X-Gm-Gg: AYBFou1Wztxv53p5YxNYKP6w/ZLljFN6ccBgN08743kZ4X/yowaNOlYEpMAvCKthfZB
	/Vd40xMAV/SZ+llGuwgXKgNkjd4tea5+18/q5OSbhDbB4634wYF4gGcbw9N74pKv+w2M0rE1D9x
	yHvrOP0L5Kso8xFPQJPG2+GU+j2y4qpcOMVwJepW+6Y0ZsfmtGksQ1nGjP1HRDg02U2x861MIPv
	DuB5r70ABhmUpdDi3Qzv1+olraGwAf1WHbsApyVeqnqiUtPqNhGor1XE4f3FqKSdB2lqycXk19T
	QuLmazyuXYloUdL4gcoRGUEvpWevTXf2ymZwql1GLMQrDM83Fmwu2zcSVHWOt1ff9t4R+fnBlYI
	grEBx3PWHS9fIulqgbWZe6DM/MxXkknu9+NnRvxrBfEY+johUmKaNPS7EolnHX1qOzxgEXrjTIM
	mgpstKkybZ22sny0kIQb8MpFg=
X-Received: by 2002:a17:90b:57c5:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3ae8984acc9mr3134544a91.57.1793395184788;
        Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
X-Received: by 2002:a17:90b:57c5:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3ae8984acc9mr3134512a91.57.1793395184364;
        Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8803a80asm2434346a91.3.2026.10.30.14.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 05/19] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Fri, 30 Oct 2026 14:18:07 -0700
Message-ID: <20261030211928.45761-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX/qh4dn5i7C8u
 WC8HmEdcyEuFomeuJrbABzFXVFnv5lfYOJIYvXKQH4VV3IbZ9P9+LK5Ow6Cqrztq2+IBSPGSbEm
 HTRwdYYLTO1V0YqAOvOEQqMpdKJVjmKGsxcXkFLrs9zdJGpceN0Vw063VJT5tCQGmJHfIbyXz7R
 UE2FmJUAbMHHVAQHVAvGBoh2a6VNrT58fl5kQdCOwTP4PHybvgZXAi3lIYxDVGvGVdde7x8oQMW
 UL/CTapNAYemdelVh/8tNPHwqUQj6nlX/+DYmQMB1ipgc0K7BaTd+sQLRy2KtHikmy8+rn5lGBg
 tgbAQ6BuQwb5HrMQKqi+Cetlz7a4MOP5n7t7TAhGCYj0C6JQUbWgaKyf7R2bB9I3q1dEShEhTUT
 aoP6IH2f6g4gFarVvS/QfU80xnCUXw==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae509f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX/7/q9rxY9oJo
 7Bz9l7rXbyXeymLDXrmzEe0LvE4XN8POW9lwfdNGjBJzZiVveKqA+BLRnRtWoTMhrCJVPdnWQci
 XT+CBEq5IqfHrKYBPF2qkI4z0/9MMng=
X-Proofpoint-GUID: _QhvHtSUODSubMKmdL5eC-FHKh8ehAqq
X-Proofpoint-ORIG-GUID: _QhvHtSUODSubMKmdL5eC-FHKh8ehAqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815187;
	b=ImLYFaV1bQNGe3kqXYLEXGda+ZBKyXG8Sz4hlGNNAlOOgGONF8wg/wevodPwtuhCrzWA
	 RohR8+O9YiJW74CNohPkgTcUHJuQtqxHyqb/2EjcIHHC4sASewajrahEcL8fQGPIMMf0s
	 KqKh5362J+HDd65oCmSlnXp+TS7B9u7tOAmtytYlkm8fc7SCeZe0dq+nUj6Dus4uCMLo7
	 EknrBGtcWhNUid/pYqA3OcGEbqKDQnVcftI39/nr3cw/TZXH91ulhX5YFKMLwwFWhDwYU
	 PH/ZnA97oYvaU9twXYXT8i4GrmbKkp4UZIFFYc5a0XJgIACd6Jg2EXztv6o78Xfa+/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bJZszEO0AROxRXFKvPGmV2rnbIDeStcxgukOo5uOajw=;
	b=bWRfPJV1yMXLuaxKBoI33ZmrgN9grLaM/WEZEGwplquqD+GMuDuuqavUI5OLSAV9Cax8
	 DmsHQR3fM8iia+lni2rO2/rxz/n3zMX9dH/er0oC43jmg+QLJ/p37C5m2y/msvF8NW0aE
	 qgDwJA+9orPMPKzG/+u001RmIyIcbIrRit8LQ6zx2Bevtqft31bOPJjHrvt6lMPpMSoVX
	 3c1Bm5uh6RCT6ZLo9TjpqoErHsq5m+GFYCEopYh8EAdYtB1g8my59xg9T9ZhjrCM5sa6b
	 8XHTDYLqb+ookOW7a6jVtiByj6xD8iizIsrO1VrzQhXeZlK/EcYPI0SQL7VMnOCVvdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0PoMoIk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DInwBrZf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A4607BC5D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425A4607BC5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0PoMoIk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DInwBrZf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjDeY2244242
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 17:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bJZszEO0ARO
	xRXFKvPGmV2rnbIDeStcxgukOo5uOajw=; b=S0PoMoIkilIeLfefd8qwuh3k1dD
	TNW2Y+o+/AKAvHfEvrBNHghpc+VvuhpwVpcu8D4c82kDQBFsRhYIAmaeZlAAcIDK
	uLzoDSCKDGnlHOX0nueZqJquKdaQVIP0XKejnJnbnRfMFWQur8g0Cl68atp8IpXN
	43cTAEI46Fg82Y4EaKU/Rnm42v0T8Epkhs1JkdHT/0/Q+CFeQt3XOWfECW4m4IqR
	8kiZAmBUcQOWxjzmPpL32SUIU9jnlDnN/Md01o1jbvbJKvKEXXN9CuDTbAhygNr8
	1bjoZFAc6mrtvkm2VmN9OXWt0K5OUaeKdZg8cxnSCwXDUFKL2xwaibDFasg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyhp0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:59:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so992692a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815185; x=1794419985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJZszEO0AROxRXFKvPGmV2rnbIDeStcxgukOo5uOajw=;
        b=DInwBrZfC4dPeVw0RBs0g1pO1JIaa41sOnk87ItVTwiSLryFP4p5aJiBB+6EZC8Rov
         TFuxzzXw2HD3YKOysGXHlqWu/UIc2jhoVgKNmyLh7GWMkoBj7ngZxJlY6B5IFV4EMfGJ
         7Sh48Fd60zClHo7+tssS+oFS2RkwGH6nv8kq0dWgSpwGDM/HIDIofWoG9sXBvR4zSfT/
         LBM2mu9hcDA/AeEzyb9ga2MOWPShodMz3Z1moWdvXbK010asPRRjwCSvnc4Z5bajIxaL
         3/mBOSgxFXpGpksI7Mu6naiUeuZnWXIflskbnSSaxRYFs3c0jvG2RNoeS2Cdvpvot2Bg
         EbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815185; x=1794419985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJZszEO0AROxRXFKvPGmV2rnbIDeStcxgukOo5uOajw=;
        b=m7SuYMi7Ekf2jBqdbGylpe04Bdx0bBk+11Onn8Nl0HnS6NO7wa1ELnHOyXiLmDSbpI
         eYsPbzPyNfKsNjcgIjNHWzoSDBOWR/ju5dEKUcDuoEFAvo8VxD2y+dJH3hCkxyQZmFZU
         y2pVuIOj1DpsMRcoEZcbiApo6PqmtSiHznGnV8Cu/onIfsH4vVPFvNTyCwl3+f10HdFI
         mpxJ2WaVV7y+19biH4MjWCMIIGnpjolAgmmcrey6kg6JTt3QaRnBNQZDgOeTGuAg20Jm
         7hVY/FnS1TlYKVSPnEz1dvHWBtCgMUmn6FR47WHbt0QGMWCRYEC8f5Bvtr8yBUFZsNik
         Wt3A==
X-Forwarded-Encrypted: i=1; AKwUvByBvwajh1aKnp5IZX3jPVn3iVIkuvYNPVrmbocJ0/okgnyI8mvpmLyEZJXLsrozbhmZW1WqD+NTUr6htxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Eyb9r12GzCLLN+Wm8HSh+B6c0BruynI00huatUQu4NK49RMir
	rL11tFqEUMzBGXovhUKAvquqZJpBtHXO2Wn9xNkC10SCNGrj1HjW6KwBm5CCLPpQHQ6AjtQdCZz
	+SJW1+CMV8RHsmZS1c03t/sw7lAw0AA5WQ8UJtjrJfIMjczXSnB06n/yswqTW4sV6me8=
X-Gm-Gg: AYBFou2csl/YIOlcodlqG8du++vxvP2ETFY7n4BulUiK/j0flLphy8Gcbv9YejikyYS
	4sJcuzejeNv1B9J0fDp1oXgUmtEc7qSqhL+Rvsx7Ni3gZxSOi0uQCTZnHNcKY6+g1QFEjqSajG0
	05nZa1OKBKXqA7CvuIaEHJqbu1wYqmPq4Ivs24Ku++dhnz2mVpgtnTdeEX2sdTXPiBcsZORH8uM
	0ostqCu0/nUgnfM0Ri+h8C4PzlT0zH2xYmTqXa/mJ0mR+b4F/nT8bbTnypXwrKQnfZSsLrM7tQF
	Mrweqa/xekYI1j0fjhJo4uo/qBmhh+fV307Fi8seEJEDQot66m2hIac9a9mnActPELapyRef4UO
	cluG2UaioszcnOZhyUquztksWCDt2PwBjPf0mmXk7GyP+v5cU7QaNNa4s+8Qww1G7W8jC6tCCaL
	ei89wcSCxd00TCSarBLwXvyl+Fi3kw1nXYzOTGBUGI1H4gcg31ID07XPgWl04=
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr16723794a91.10.1793815184926;
        Wed, 04 Nov 2026 09:59:44 -0800 (PST)
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr16723775a91.10.1793815184450;
        Wed, 04 Nov 2026 09:59:44 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm41733a91.10.2026.11.04.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:44 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 6/6] drm/msm: Inhibit IFPC for state snapshot
Date: Wed,  4 Nov 2026 09:59:26 -0800
Message-ID: <20261104175931.28475-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb7292 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX5Wp1eCmdLEFt
 yYM0g4iMkJACOpKQEWzmDJg+Dg9QaA+ITGYCnqFWSey4xWgrb3JGkjPaq7BuIZHwKAV2lHhwmhN
 esSR3QUyjkfRW/AuM/y5KXBsORTiOWLiK/spgXVZNM3Et9o3wRvXYscMAzUeIkSPj5HhSDP7gl/
 c5w4zokzIPEsfZsEriqNJBPYYFIl2lddngmabkLFOz79cqKDqPYYomKsX9HlNOujY9SKljDMRy2
 R5OsYFsfI7zXJwuuBNEO8dPUnQ2dZR3k8QWgyC6cuLiywyTuhBKh/JVwRrRZ02s8CUNSHw09FXf
 VYKoEszA8ZIHgOiAlJ3D3HrUXvDhkY0FYcYPCm45J1w3SgYQWJ2uT+dzhRVVKkglq+b44FMEIUi
 hMUbS5IDaONi87eI3ShrAcBYfRoKYIe78hREjHFSlmlKuaM9x75qMD+LIQe8ekD9PF4LyGg57dG
 tVNjK++sJIPmOMq6qaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX00nsnmhypYXL
 753qt4fH2zCKX/aJMnkzRDia1hH0kVVC78+egQn7dXUVx1RMpDUxg1nO0EvmTyIOUmDdMY275k9
 YmNDZs+h6fe5OZLESg621wMt7LcIbM4=
X-Proofpoint-ORIG-GUID: _ttUlF_sw1mjlzvA9ODxJD3KwrF7XDbe
X-Proofpoint-GUID: _ttUlF_sw1mjlzvA9ODxJD3KwrF7XDbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040071

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 136029025b80..b993a556a816 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -83,6 +83,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
 			msm_gpu_hw_init(gpu);
+			guard(ifpc_disable)(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
 		}
 	}
-- 
2.56.0


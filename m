Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911290;
	b=GcK48ZHKsV0ksVfZZredmif62HZTOr2QuMd0lumEF92DN/uQMUlsqHAU8sVWDFuYweqn
	 SUMgEkNPxWkwGDfOak2g8j9P6NZzltiS7m9kfh+AnIkDQ9Xgk31u0jyVN9ksMVJYMtAn1
	 eyzZRitRer0xeprnbGHvcA/Tann3l+YdNP3XhMA4w50dagxhRmVkMbSFMQmF4f0xGXPgl
	 w039qc38dADEUrsiEoW+Yd0yaVyAyb3MGpXj6D2soLgvWf6+mEDMLAPUZZv3d85ffFQtk
	 mhd+4cR0fhaaUzzPN6U/f7oSCE6eFaMXOoUoGBHEupgirR8WRLezDxmT6cKUi423qTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
	b=lAcfaYv9c0KsQIlDzh+RKMm6Rnv5u09c13kKlwR37p69DI7BR8uKknZqlGxoDjOioefI
	 5objopnt0apPU1F1kjiP8AHm6RIF2iLLCdHRKOJ2nflGKGPWMhr/wf739GmQeKFQ8uTvv
	 VAiumOqEzV5z1Mi6bc+SXT7ebHigiPQMVfbBkuwafiCb0Ya6zbnYoIIklELcaS9BfOkut
	 oqCHYxejKprLfU0jXfwByHN1xv8ZN0s/elmb23KFmJ9ZcHJydoCBzlrwo+vgwoJIZ1jnP
	 20OmmXd5oadoxKmyJ8PgbeYKRopK/r2XK+acBdFwluQrcuG5D5AT1SJlFhmCOhrvBCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJfkeRG7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyG2m6d5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463F606EEA8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C463F606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJfkeRG7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyG2m6d5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeFIW2513498
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLNc8w9O9Js
	SERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=; b=NJfkeRG7fXXps78czwVSHql1SEz
	+yEjvlAKxpCDE4dtWezDUWS67mbjFPotDaP03r77m2BeDrikshF7d0W9leSRFaiQ
	pKuNAAaBUsXC++KU4urbgzonp9Opf7X6djvuKkR5DsSc/N6MHrxILWDb4kb53GPK
	wvcWq9yS8MlmmPifV4CkNtxFPbBpJN7Z+v7B9fXrNohpsMSnZMMkjeat6CV91uOT
	EAca5RSTbKfaKhJNg+fWamJCUQjXRgIOgzW3LuGhKV72C47tsS103kqxbC4qB5k3
	jRoqH/59NbTlfg+j9KECvFVawSLDpBWO8xJS5ynmo+RRM/OJZvTVKfJ7tFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatksb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:41:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so2481265a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911288; x=1794516088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=EyG2m6d5lPE5R1R3zXshEDXFndkZm+G5meO9wqr8LdMm7CTbiFXDmn9pCuyf5z8jZI
         dXCSALj5Rc2Fqg4eBzAw4Ud4Z/eKN4BsuD9O+7Pm5zXQJvTaL3nir/1A5XNQYrf4uhLp
         LPC9rTG1K13ywRBNWUZQ6d6XpnT23VxpRcIjK0c6GXTbUzmlB5f+0YytWe8R01RHiJfZ
         K1HkxxadYq7PwQ2fAwx0dSl1N64Y+acCN3zrMBu2egMZkE1gzumG5rci7FYE4GLK3qsJ
         7fsiDgX/rLLjTdknhZt/9ApaIJbr6r6TsPRW+0GurE+zPNiE1RXEZVXcg6OjKuCLyMgw
         W5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911288; x=1794516088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=I/YxCib/nibyde2PEVYJ58yuShwlOdoX08c/F+pifYuxPngv4i6/11vMAzsXJ46qDN
         Sz7/kMonQY7MywlBhy2QaTVNQX84H1FeGdn4nyCG7UIv0z+GCidjGXE5UepxkaYp6/x/
         lLuRORAMO1gPE+sYzj+Deks07Ha45bB8Vhmy9tnSsGunoYNi421jWKCZpXTbAw79Jzd8
         hdZCGErl0ZUdVCOvkQY75o/7AdlF2SklFXxypHZl2DCnMFY19uLUmZ3ay6gOdQskoo/C
         b/guEcBQIAirRCp5A+XtEhthmVAM9Arg3pNcaX/rfmmFSA8r5HRcyVIeL9dYu4w3w5mX
         ZZpA==
X-Forwarded-Encrypted: i=1; AKwUvByaAA12BwAfL0266qkiDF2LNX9ELUw5cbGdxufsCw42M3B9Y0KcSLXYo8SA/eidxPaw9/y7zYW1FS0elKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z86DavClHoGh3rBxHViy4cIReGUYdVmI+pM5I78q79KVb2nuuIU
	pIOS9GO8WWuG2DJsx8MJTiNTRuI4LBg2MgAcD6WTVdRYf1JT7lh+hkpcTy0w0fIK4L80OKGamHk
	HuDzs1qLQ0pkxQ1cunYF+On4w2cwJqwixq+iDRC75h/osmFQb8pDHB2SgIH0KDySJsnA=
X-Gm-Gg: AYBFou3fw4wU3Cc4xQ2EVkUcBe9RIRTpuJ1OaTAt/i2r96sjJXyUo/ktQMMTE86hMKi
	0+MlVy80pa6sH4XFij9tKaw4U1Fj7ZtFO1VTjiAfFyZZmLDSHUfwuARJJRqLB2ydJYjpalTKgEr
	+89HvQsZYZjE2Y46gEk+Ode2udHFJx9HqQ1J/WvbhaA6QV6XDhEZTEb43ixvdKFEBnCSrk1MEPy
	W17w/rdROC7BAgqoWSMfuQbVqVFoKmbPCz3LKJWmPO6o9Cct7pm7mWFH4MWP8cWsPTHr8BNGmo4
	unTSfYejNn87BKt1PxKWYgsWfQVfdpQijJB9wQ8xj+mOzo5jfAIyofusqsI1Y6d2WqJ3e4Pvk7S
	9TNvM9xsnx245m20oe7X0MmDV7Ha69WzGz3QvLEkK0RsarHN3KeLtChPVfK42YEUSC6DaWJivns
	FddqooEbiKlPDn/TXIN+gtQU6Hpm9CGh75iDeo5L4NtdzpRgFZ/KbMaW6D2Tox
X-Received: by 2002:a17:90b:54cc:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b0db705cedmr138276a91.31.1793911288261;
        Thu, 05 Nov 2026 12:41:28 -0800 (PST)
X-Received: by 2002:a17:90b:54cc:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b0db705cedmr138248a91.31.1793911287831;
        Thu, 05 Nov 2026 12:41:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm4817238a91.7.2026.11.05.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:41:26 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Thu,  5 Nov 2026 12:29:41 -0800
Message-ID: <20261105203057.66520-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX0+saL+BlBkg1
 C9ePpmOPZBfMmJp0ngU8qb8k4PjzsMp6YaTulMP7/nX1TgmX2HsKufNqwd4Wpl3FI4uLfAoRvTz
 9+81L7XlrEP+F+PCyVXfYZhLAwQYlVs=
X-Proofpoint-ORIG-GUID: UljF0eXVLpBn0DoLo_TlTf7YJdeeahhO
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aece9f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX8gEsFN2a2Zdo
 HEp36B8ltDN+SkSiNnyOdhv7QFgRL2grxYA9pOEpjug/x1dRONsRIQ++hikYN/6dEILbEMzJmbA
 whvNWQvO7TMNiwjvoFTPjfAslXgHm+e6rIzg4s50bbADnzp4TS9LloLlWRDImCwvJ6dYoCQWnXe
 nuaUCYOnGFpW6MdgBfTl6kVaQrMXzP3sSAjclaLVoRSEpCsv5QU15Bf+HczbcJE6Yctzf/nDzTD
 eMgHvOxAKhJaMJbATsDiwPc6FsE0TISV4ioOmEKfyIkajgoghjdUwhasfuDyiwRunTuEpqf5Fhg
 9dN/4+1xSmlBLH4H5gjmTq0FQhrg+bahYB8t11i8mzMz1qRjXKvaR12XgWjo2qQuCPEjvYI2aEX
 UWRnt6TkmmisRS1UJuazc+n4aO55Ku5/B2EQOiQRDNBEZUS0kwdZVMNsQa3EVt5Z1q564Mnuh+3
 yImabDQGwZwK58wJVPQ==
X-Proofpoint-GUID: UljF0eXVLpBn0DoLo_TlTf7YJdeeahhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4c4b904a8657..c5c928c1b084 100644
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


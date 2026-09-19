Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1633659EB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830131; cv=none; b=F1BbBBOQav9adULm1gEOQ88MOSgO/dYSXvYw74KTR01JLf4B5jaBrxTwPF6h+2zmcydVjGCu+JGjuQ1xzEpq+U5m/l4XBr76aHswuibgb9/uQ7/DTqNQeoo7B+UTdNC+SYbb4vxDgfc1NGd64gLTwitNLyYIZwj46TZbjjN5Rrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830131; c=relaxed/simple;
	bh=Iq5wCYI4y0W4CO8EIKI1BJMBBMwBjbLDSVf3wHXjWNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjJqryIO0SuD7HCTFTPKzqMMM3gBCLin6qb1+/tLTxqAO6cQAH1/eeFgKeMgxNTNZAdJY/pMNABWbHFSqWPXeTFabKSjVNNuXwOjBSYFmzzLzj3PNYfMf1Ju15nxc2JB1rmhrDTJ4Z3csGasRibXXZ5AmTWs+Nz2kcQTiJzRWko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7ZY0YhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBEqaM4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7ZY0YhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBEqaM4m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDKEpN3064145
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=; b=f7ZY0YhUSOf0HpjX
	ctTCgwiYIP7vPW0r+GlufaGoFYZ+HV/3MvVfAGAdURU77H52IW909HGdolkoRK3q
	K1uXFKJA89mO6aghfcXYO4FkgWwjGTn8ISPsBIOZqrzdgASwLHKECgr/Uh7w1iCv
	d0sUMJWZGpwXPlwaiSoSn6sHKcoKovL8Vr2UeXApyJfryd70gFW4E2tohizGuNd1
	wtAOmPl7tRCSJVvrOBSGy5BlOJ7RXsXPk8tcqbqifVts6/p+tNhjeswj+3U3JYAr
	MTB55XZE0FNwyjj4Iw2e1UqZQH1/Nmun2WUm44HYuQIdcCThNZ3y6DGWcWEYnbDY
	CijVJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9ry9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:02:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso2909849a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789830129; x=1790434929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=;
        b=HBEqaM4mI7iuCzhxkGThd8GMblkzUYzYNZBTbt5Hb9a8Ab6Lj95eUNvq0kTHmH06aT
         DQmw+rStP9rAdVZbEjzG/p5j7nepsdMIgFRBxaRaBk059pZ98nJ2jjwYdlT43/xJxAFQ
         mtF0RqtxMY8sW5TfaYNMFoVwvL0520Ht8uvsZFe1tNWB5CmXXndk/3QNI29uhtMXkmdI
         IdZKzYjAznmlZlsPVlG8e+coWup406PX/ND2KxMQCUH73kkG/DuKb5lU40DgenSF97Bq
         BOAar+H9oiiQIbHeBkdL2Goy5tCwExSFBKXfR0B28Jkw/sle1p6QYaNP3MKNH0/1PYrw
         0FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789830129; x=1790434929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=;
        b=rkSKWw8LO3ffbuRBhqTtLcev2DvK8FeSCfuKlr9HnBfgIi9gcTvtal3dJcH+OZS/IL
         wUoqvtDLDX8ybsATt3rtnIBpfOz1ujtRD+9/AWtfnGHCWXhsdnsMuPnjlCFx6Cj+HS1i
         oWA6yyUFkv6F28f0WBkEtddYyKtsCmlg+hVMD0F/Slm1uopsN+YMhPY111W41oowHPLB
         v0luK/Np0Xyude9SSNWP9edvW5GO9PkpsypJ/QyiRjzRV2dJ1pVKsZO4y29iuStnM5Pz
         IroDe3EhnzOViOkeOHg8vS4hm5vNwZVfjkBu1ZC9+V5pjpdz9pCgUxC23qK45vbJb4AI
         1H7g==
X-Forwarded-Encrypted: i=1; AKwUvBzF7ZRKIeRqdYgsPFx4+nt6cF9Yismah2ahHQSaurCXzI2sz2TEcYX//0r5sHQVLkUQf4ZfBIDVyzbGIaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjx5PDVOpTCSWoihw/xvB0RErsWSceMi5lHIfECrLEQN68MEI0
	JwTdGCkiCEHVgT4+WNFUgQxsZbruYlpFXV/qlBLmR1zgK+ocVtAZfaMijF7ox/fc5lUPvIIBazY
	z0NgjTk9IsYtLyobyfO4DbWtbVSp4+tipHpB8xWtsR1it7ASSLztBp8/DYx+bbd1zHSQ=
X-Gm-Gg: AYBFou2Og1/bTBfJV3iBDfSZ1CwlMif/3TQXaS1N8r4SjeoZnjqWAZ5Z2bqeWM2UDCw
	qZw/CxzR0MFKo/KFqio+hJ96TpFT9Z/itRt03kxzEjyPVSb/zt9qeG2H8AZZqjKITvCe2vnWiF/
	mE6d7FuBaqTcKatw/e1L/D13FifU6K7Gw/s0aVWUW1VWLVtA505SRynqIvrFly0D+IIUuiNsS2Q
	DlNXWs8/zfXFS7IuCXVu6OEV41iTFruGdtRJ83rPXcs3TS+abj3wl/c3rGPsI8cBhPGSY9jx1u1
	GJ4aSGjlSVWBPBRvnKlRw/mJiIKXrWLV+F+UzKPsx5DS5nTEKDh9hjTiPzVIe1aExAw9lJ0T/Bc
	5ka/dYdPg2gPS
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr12911310a91.16.1789830128701;
        Sat, 19 Sep 2026 08:02:08 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr12911270a91.16.1789830127971;
        Sat, 19 Sep 2026 08:02:07 -0700 (PDT)
Received: from [192.168.19.100] ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5045206a91.17.2026.09.19.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:02:07 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:59:35 +0800
Subject: [PATCH v4 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-b4-imx-simple-kms-v4-v4-1-53b1fdf4589e@oss.qualcomm.com>
References: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
In-Reply-To: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789830097; l=1626;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=Iq5wCYI4y0W4CO8EIKI1BJMBBMwBjbLDSVf3wHXjWNQ=;
 b=tmqa4fZQfIDCN/GOTkNIfTyEWA8UTbv055ypJ64BGtdU8/5Urz4AvTiLV2g1hJeags1QTwq3Q
 58mlELqcocmBR6MCKokP5AWbZEcfz6PmdURks+gKVIxWlxkwIohtakU
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-ORIG-GUID: AV9Tfkf5FI7btHpB0o_VrsdllwVobQlr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfX7yovgj5RxKOL
 UqGW7WgW9Ykf/mfoLMXCyf7Vpyk62epREVn2SS2UZ3Rn0FZNnW8zYKQrVXOASVm04kyoW0AdKWS
 8ZB5++swYEKyyM7QMGe8tUuKHEruU2c7Vln1dqcVH+h1nxCplwIEZLgjF6KSeu66/CiGbsus7Ue
 IAzz+vgdjsIgRmT3lFly9OTaAy7cvmZnhpD9tmLXpWULDVnNgcJ1U9RQYILbxw+6rrDagGsm+BE
 ooIFp8zNYpXOdhL1nSIhZaVSCmymUTlgWrI4llyG54dA/JpiYt5N8zAGQ4cwjQNrWHPblWE7vlQ
 rSleEDst9FdfqDCnmeZHKDPA1oYjBEJc3VaHncmd/lcO1r/y0B3LlQi6FIW8bwa7pS38pOt84+5
 BFUoNEQbQiITOoEZKJVJhwDSm/reUxuINhtRH8ZhS5NSovrHsJ3fwWgY0JaOPyvfVk+oyQuwxUa
 5FuFQWJzQ9pSuKKpmhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfX2M9hRnHLHMpo
 hPUoev70rOUcbxmzl5AjGyYJRwx3MWYlVgUJv216Kww1eJ1yNS8CymmFYXwlaitFoqaeKYa7lbX
 SsWQiTgJefwxUp3VOagpHnyBokC1aQM=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaea3f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xnl2VaEmiNnR3tlLptkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: AV9Tfkf5FI7btHpB0o_VrsdllwVobQlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190218

The simple-KMS helper calls the pipe update after enabling the CRTC.
On an enable commit, imx_lcdc_pipe_enable() already programs the
mode and enables clk_per. The following pipe update sees the plane move
from no CRTC to the active CRTC, treats it as a mode update, and calls
imx_lcdc_update_hw_registers() again.

That second call has no old CRTC state to disable clk_per first, but it
enables clk_per again at the end. The disable path only drops one
reference, leaving clk_per enabled after each on/off cycle.

Skip the register update from the pipe update path when the CRTC already
needs a modeset. The enable path has already programmed the hardware for
that commit; keep the event handling in pipe update unchanged.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index c67fe80b8115..e00e52c1c46e 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -310,7 +310,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
+		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
 
 	if (event) {
 		crtc->state->event = NULL;

-- 
2.55.0


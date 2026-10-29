Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305106;
	b=mHJmOaMB9vCtXYUaY4d2k0+Ejq6dZSCiGIST7fxwP/ndM2SAvtlJaLU/HkrL3kFeMQYg
	 TPeDPp96skop3G3KNNOvhhyKJDPUw7GOk+8OL2YPMo9auf/6c07GImzBeTKAddZtCvisn
	 z9wu3Ms+dECmNwsxi+nFdvxt/2Fwq5RT0bQvAyr6a8dhd+Ll3VP1QhWyC7I+e0oLhxZG5
	 3QjjVxTAXoQy6D2VCkp346MTrjxjwnhURI98Ef0Vy8tn9dTrBB4DtOxSA9FBFf6aQ4wBP
	 b3aoZ8wTV0H9SvfRwYG/5JpnqSBSU0PItFW8SSOfJqFEQukKYdei+X1X3e2YAj11VoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QGEFaZFYDRaQbRQD6wVlp2pG82rEYBh4up00CriDTqI=;
	b=GwF3a0WeT+ryx+38atuEMdrnj5nEpRkWXtm7iQimDP+sDFK4Al4yxQ/U2xkfNzHnGnxg
	 217nX3lzmlOtOKWOplR07t1oMtP7WTXgVVFF3LUGXP5bFnRicrnH0M37e7UPLkawJhdcE
	 qVD0h4PBqVXnRD3XaBY3quSfM6DXtERpQaKUm8Aal0fgYhECXfM90AKVmRUieVo3Da/k9
	 LjbIv8hQaafW8wU41iBDRi6Kr8eM8vGVs4AZmIPzEKa2W+t3cpY2MrZIHvcIE0TT9t2jE
	 8Ca8TN9MDJ8DyApiEwCo7k+0vM6MmKMOIHR1nEHG0HdYz6MfKXJ3jHSsmwrDhrwY55w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXYmwNRB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ell5bXDA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXYmwNRB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ell5bXDA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjWD91657749
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QGEFaZFYDRa
	QbRQD6wVlp2pG82rEYBh4up00CriDTqI=; b=NXYmwNRBkc84Ed4AGATMd7TBtS1
	vxRu1m4eCeR3Eqbppb10/R90dXZ/pwlzl8QfgAp/vS8Xzq68VfFKTM90Qxjkjv3s
	cIYk3adlJ/aut9W5vkncufqs7jQXF9lv0Eg1Bm5gHGYAmIH3xD7tM3Y5buqDG05g
	E+1lEmAwj0OrFEm2p6GODHtOo11kAhnA2T1SmufoxfCw1i3QRHmouAOGyoNAONUP
	ITXMknc+MYm0KobEQ3uMnGiaAz/xDaiGswoD9xuVOrWHgj4TfFps1lQGvPKuEk+i
	zPjBzkmorz9P5Z0f//Yc8757o3SxzWweFFQdrE27xSyGtxEiCs6Qt5i6F6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmaunhhb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2521308a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305104; x=1793909904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGEFaZFYDRaQbRQD6wVlp2pG82rEYBh4up00CriDTqI=;
        b=ell5bXDAFqEt5L4Ga8fX9B+lw1+gqdcgHUoFKPiMkse0uZHUd7Sid9kKdReo/ODJYu
         /g/6XADtVfC9hi6LhuRQuwacym5bFHq2zLmQ5q+qKiDSZTmNJYMeOuH3mkvQr04i8RRn
         W3E14dygEPxmoOYK7fbuXpEQRo+qzK2GhueROO99hJjVVMrDfyoh1dCjfuuYd77AUu0+
         ALU9qnYAu1tqe6QDwn/tHK4lAeoD1h5Ndm2tgJGJzgbnYTPoTed15eUSdSBmryORqKOB
         emYzXquONZWs6FILxuDEpRYS8HykyobXpVlwuyGQpJvSUWS4rYQgcqN99pkRd1kYhKIu
         U+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305104; x=1793909904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGEFaZFYDRaQbRQD6wVlp2pG82rEYBh4up00CriDTqI=;
        b=UVhki5h72K+p2PR1/5lSGlLldNoGlQ6H1HkWh+D6gyZeJ3ZEK3tIb9AkAiNeESRw2o
         H6Evosskn5o6D4q+ByPgs5ug+A5TFgfT1sXBtMnhbYnNpFEOCeN2l4drEQ0YFnSW0LhA
         2WJeXHD4XcmueBhrCZUQRaQ9ezyJANU+JRy/6EhOGsSRB4y0U7nbUrVdChB4Eo0bQ4VI
         hqcp/QwekgWdl8O5wbY8UoKcjNayutRjZ7X1+dzLtWt6bc+DFRebQn6B6qC8AmywH7yu
         uo+xY8joTQ16xkMtApi4tSb41s4JTAjfdZF1WhnbROyr8zZseKRiThifGmaIHU2uNRE+
         an4g==
X-Forwarded-Encrypted: i=1; AKwUvBwPtgTsHoSSQ5jo/IKXMHGpn186S5t2BBXkALxZdDFlgJQ6v3N2koLmJTAiwyQwSIDpDSsYX+WBQNudkKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgfDKPgUjesQelIXCTQaCu89CRyNJj3P8tALYRJ3M0QLDv0xnW
	abnryd4ty0e9B09oT/21gXgW+k3i2Le///rCkoVpojiJHVtaEXKhT6IOpLU80vZ+I0miU7lWNXL
	PcCE1WdrUoy9aKuTikCerxOvHHh1k8IhA99whLsna1/wo/qv6ZeQYj4yqFisDd6vDfgo=
X-Gm-Gg: AYBFou3nLMGSVP0kV43VjU8/NKZg1XwKNEhR7NfGuJi4khwLv55IVATzD1l19zIypzF
	rNujlleBjRs/1humL4yjNeUOBu733mAL/S68r4k42YaRpNdRndldk7nbtAD9KgL48sFD6a2Juov
	g3BDnNbddrOVbo7YwFU2KrBZ03LMivKd2fFPTS+rL8b4kS+stAa0ssMipWajkibWfUTVeMd7YY+
	ONBpcNZ4KijQ7IJau2+pC0c9DZQFJCw6gcsWxfe3fnYwYbm3lt2WBDi8F0CDslxrX4xcGSKpt/O
	OyKMpJwwesZWfl7AJgkBQWLZL4sHCkoXAHPtZFFZYDDNEQMUIjwptKbhn90fQa1jnfnzSwrWpg2
	S1sA8yoQOP29mKyHWHbjM964Ow+gZPkDzrD3KhCSRxEPODEMZA7dOqkDD4xDN7vp6whDNswk+GF
	rEg3BEo/xBlhOUnnchd4VkaQ==
X-Received: by 2002:a17:90b:28cb:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3ae89767d80mr73852a91.34.1793305103605;
        Thu, 29 Oct 2026 13:18:23 -0700 (PDT)
X-Received: by 2002:a17:90b:28cb:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3ae89767d80mr73815a91.34.1793305103000;
        Thu, 29 Oct 2026 13:18:23 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm5548239a91.7.2026.10.29.13.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:22 -0700 (PDT)
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
Subject: [PATCH v3 11/16] drm/msm: Inhibit IFPC for state snapshot
Date: Thu, 29 Oct 2026 13:16:21 -0700
Message-ID: <20261029201730.151754-12-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: n0zcREn-JORjqayOFmUkCh0mVafCxGeD
X-Proofpoint-GUID: n0zcREn-JORjqayOFmUkCh0mVafCxGeD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXynYjKXjH7F/Y
 pvFLtwIz2GA/2pd/sLswzLrorA+WNPFFR/zjldkN586YlMM+EMGdwwXl2X9r1RKTqI9ytpUABZN
 xrMhnvBBlDBclb6BCJatPFKM3OJtSI//Au0XIyUroEYpq5a9C3NfwYLkOfCUV5aGSSpfk2OwQ5g
 P93M0TxI3Yvoa/KTG+ZY1U+YCgUIDhxFSxrIwHpNr6eTyaOYps4dn+305SjlglQLRXa2ZSfoEku
 uUBHPFDmtBKKy+k1Q3P2nmRRCFnqTpsrIG6tEzYFhGvuObtuCmZWSBHGyPtnUe4X9cqVxw1fEO/
 qrH7zQxd2H0NNjD/auCjCIlRmZmBipw0dxwA9RRMxMLgRLTvb7y2ohVLE/TynqS9gC+Dw1naHfG
 mevv7reKncjqmUG9sFELnkNwiY2LJtLGLwtCsKgAZFZiijTmM9uh89kIv/kAmYHhWE9nM53rFEx
 JwlwmvxkVbaZn5izLYA==
X-Authority-Analysis: v=2.4 cv=It2L47/g c=1 sm=1 tr=0 ts=6ae3aa10 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX9szn17KIHHGD
 EAM95180y8ppejNv3bo2mIkBSrezcm8pOZ2L2Q0FBRn2p0msudlpKuQoB/EP5aCU8VIF3VIJhaz
 mYfM7qd1pyEReQQQyF1T6oStpt90fR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290079

We need the GPU to stay awake for this.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..f068315541e8 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -86,7 +86,17 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 	msm_gpu_hw_init(gpu);
+
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	show_priv->state = gpu->funcs->gpu_state_get(gpu);
+
+	/* Re-enable IFPC: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, false);
+
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	mutex_unlock(&gpu->lock);
-- 
2.56.0


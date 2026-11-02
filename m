Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635812;
	b=o+AQbA73wRPS7RHR8igX894CV4HgYfif+VDxfhe01NVeVuJAOL1liAIL1CHJMHP6aCAO
	 dkD82IDGmq2CwECwt6iKhhL+EwtowhuJoprm1DX5UEjM0+AbfrqrS0R2qEtOEl1YNSY/n
	 4sE2Bi+cEAaLHreKeAPNxGPtX6eUi0bCb9s582We3G8d6dosejVpg9qtNdriSdRqH0/Mu
	 PiDRDLjB8gIHXV6xQK+qmV8uXIecp5FeGdonCDZ6AgL6mDuZYv4bIjDQoG7ZIVb2YxyJO
	 CGwAmIL2Z+hxwlzbrajZe26HMcEHgFRUM+nsHFRwe4at4mEIgYBjiGpIk7kLW2U21QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
	b=3YBCMepUu7GuCks2NZ2hn2UWA66fhvdO5G4ODZJx3q1lUlNPklfnzaLLkxj06M3lOVup
	 /+FuPrWAW6L9ahFS/1nf9qf9BP8cdftfaFfMM+XnCPUaozWlWGcOi4JaLZKfO3vAdJL3X
	 ibJatQvV5PHaYy1z5r1brGNXp0h3ZYXeE3H328vyhu7IrUL9a/k6TOXj4IIEoiN8WhUEJ
	 XfVN3rexRhOUIWcWr1ZAnxj30foIjCMqEGCMTkJIfMOFV3q16NE0LysXzOpSMYpwCW6jx
	 GsuPM2J9STu/Jxv3G7mQZ5mjd5w4PlSzos8dCEPOJpB8nA+RRFqLGQbqDFLj/fmK3Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhXxMwHp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EELs0oDo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661A608059A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8661A608059A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhXxMwHp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EELs0oDo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp5bJ894077
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 16:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e1U31KgLCeK
	QL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=; b=IhXxMwHp5nk3o/6wKy5aRu+1kLw
	Lxo2k5dQh+5ZEm/hm9jptMBaWQZxWhqX2q2Dhnl8cOVQcz7PE6mpFG24OYGEbM52
	F56wQJJtoxaDpiusSTsUG0k7t242oOQe7Czrz8Qy3NsBU6H4BknMZ4SyxTx4UHbg
	XoVxqAF+ZdTu0YiTFo9IzuiVa9TG40qzS0S7eodbg+yl7+9Cz8qxvJuffBxLJkvq
	76vAvScJkFQORQrv4RMXHaVJgCfjYdP1k9fld86B6gfYgQ2vuFKCeWd3cl5q5kzU
	VEbHXU4IPV4MZrzFbMGL/pnaa+QdEnXMpnQ7wryt4vGE5LpM5JLP3kX3DKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsrwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:10:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea381ce04fso39150275ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635810; x=1794240610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=EELs0oDopTOklzH/eU8Uk5jAedzFaQfNsJGufIbluQRzvhSRKE4alqh7A24Q1nGCFk
         ekgKdtscKadw7k9LsgCmqND0222PJ+jPXZD2h12ow1WOmv42tQw1eXhSp4LEjvTTGRzN
         4Iwl3eHX5t3hD2dpZo2n8a8WqG7se3x2YBa6pKQTfuFXxFdYaF3jHaw9yc85swUA5b2g
         OBtdCRaW4WCRFo7GgghBWmdkFABsfJgt3jbhRsALuNvz4XoHrCbOONtzFjAQHnSLrfp/
         4GHT4gs+57L43Wxsko7zs5Q8VFJK4HVzg5WE03jS5aBcvhUfPxFMaGpB2XgSw5hwHR27
         khug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635810; x=1794240610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=KdpAvOWm9YaHNsqh5Ei9WNsD99yPun1PMYhawxPNjNUN1paY3TSsyDXJWJDa9mcmIe
         5FYl7OJbR1rLPeosa5PH42xgTQojlIct8gc2h59YnAZntYdz2UcwkW3LOqMjcs7fXSXy
         ZlyDzj2bh19RLsGN1EeWOJTMipsc1MJxP2EO4iCH9JtfQ/Ka7IHbJVCh+y7Yhsdq+CPa
         l8hkDDKZ2uFkp6YL402H9XBkwittr9pzF+iEKczlzqyTgssnidfoVx1B1jnqtvv/haEW
         M7+X1mfDNQoPpXM71ewkI9VRwZRm2F4nCHYBqpwiseL4vUn2yG9HiHVSoHtqDIRE5+DK
         AFHA==
X-Forwarded-Encrypted: i=1; AKwUvByU0DPsvQh5IHU71aJ4pGQwAHosq9V+QLl5ab7i0qln5j5NZfoba9zakMnZTXX+EE57+fufRF/DVtwpztI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/krkS54XCry6UzUh+pKUAzltwr6ZYuznEg5yMClkEVaKL6xZvA
	ug0sD12Rjmho2OLiR50sxvhdWhA73w7c6IZ0ZfBMjVHmzz26CzU4H+XydvFSnqoI3DpMuFpJsEU
	AfOZrNS/NLkNMNbhOqRUUcYXhImV5ZMR5GhHCQmwxRGjXylPlmERewb3LP6WhBUFVsyg=
X-Gm-Gg: AYBFou3TTNIgtmNspKJMj4Dc9nRSIdbmATdABzlWmfoCkKzUd2qYqjNWO2OWNpj7dFR
	y+nMVy7kjg4qyklPSQFQZQP1rWJdWXBrWs8bul9OxKz69X0ubqg9Cb157ydMIBUfJmlZPhFKpaH
	NK6IqkzVu868D+HoMgl96gAy2lwWvN4vm+ZjGc4og/XF7f2jQm4fKIaK94PmNGta/hjEHs7bz8S
	0lg9FJwAVTLGDi6YeHptmAwgOmwr34pTCFNM/CmURT4HnYQhUygel8eo9IeooAvmKQW3qBcdX4t
	KbKyW6ME9GLSrjbWiyzaRXyvAJKjp/Li21TBDMQn66fcbmN+bjp1Bt5buiuqyEE4/0elk1c3uqf
	ib6Py8q6pfLbKkseF5SIApsRBzwS31eBELAamS10q3o0UaBQgd9FLTTTHYXif5d0O9Vg+iLv48h
	O0lDSmCGUA2UE9uuZPbDzmYHk=
X-Received: by 2002:a17:903:3885:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2eb1ac6fad6mr94302435ad.30.1793635809858;
        Mon, 02 Nov 2026 08:10:09 -0800 (PST)
X-Received: by 2002:a17:903:3885:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2eb1ac6fad6mr94302195ad.30.1793635809241;
        Mon, 02 Nov 2026 08:10:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39247e32sm30294415ad.27.2026.11.02.08.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Date: Mon,  2 Nov 2026 08:10:00 -0800
Message-ID: <20261102161002.497152-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
References: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8b5e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=5-JVGYL1QLZbPSRHqMAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JPyRNE-UHSc_7Da1Um_xK_3ars3S-R_-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX4YaMeCqlWgpz
 YcQPGqZaliwBKTZBJugdHhby4MO7h5JVOhai2ejUH5BTMhtCLMv1+/6dViljrSXAfa3soNe6w6a
 X2gLpezLqZBMOg4M1jEcu9H+BrngcTA=
X-Proofpoint-ORIG-GUID: JPyRNE-UHSc_7Da1Um_xK_3ars3S-R_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX764mh6EfUm1E
 ndRpvyb+e1cxJFYkAmjOFleHIxDB4Bcl4HebRE2i+mhTv0xcjSzJjuV7Wmf6CEAoE46qy8HEa8Z
 UBwQ7YbnVZBVZY1acb8Ne3LsSziTo4O37lJ+XBCZOWcCRXWdMybNhWs8Kg5wu3EEkglUfwQjSFT
 IfppkqFKxhUD6W1zNRviPv5GHQ2L5E5NP/+3FchtwNxCjfYFZlmIXFOZVhiWIJ+c1KEfBXbUCe5
 e0KzURxNUTIRxF3K88zV3JomIoy5Jsfl79b4qm+k0lmASbtcTEpqPh8K3TSHntbl8glrbXk+/cw
 DwAUmH3mKEhpjj/GuqDRuNTt2F10qXLiHL1E0dOqdb2Esf1GyNBs4iw5cxxb41+8qW+Cy8uveCn
 UYcbImMwNyb/Csk851So0UsHvvM8OGUQQm7bG9ETWbNf8O/cz1poG0unFowtM4vk4njmXpmN1GB
 SJLJDgjtoQ9bPf8uatA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
Only the VM_BIND ioctl should be used for binding objects.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ff6cf39587c9..b558d07ed2b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,7 +272,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	struct drm_exec *exec = &submit->exec;
 	int ret = 0;
 
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, 0);
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
@@ -589,6 +589,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	if (msm_context_is_vmbind(ctx) && args->nr_bos)
+		return UERR(EINVAL, dev, "invalid nr_bos, must be zero for VM_BIND contexts");
+
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
-- 
2.56.0


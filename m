Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640013;
	b=ADuxeRFwQpw8jsVIA5T45cFCUVHy2nJoprAQKwtadNXK4xbE6Yzsp2+HmmgYSBnbgmwv
	 Fk9QjtiZzq8v4aeCw8brXvQEIJIpjOreklzSXW4Thg1cINPc2iuohGIlje3CBWCLq2NbU
	 BaZzxeAcVpm5piqx8GybwI121GF1pXvCYdjVOHKPBfkkyoSEkwFhpULFvWo7yGAt0Wd2u
	 V+aiHVpyiw516pgWDvL01Ti5FqZm4+eVKpUlbI2uo9kjOWuj6NWFTHQ+B6TaHYaFqDFQA
	 Y13kneg0MRBL1L6z6670l1TUhQz5EkTuYU2iac+GS7KRC3RecERGF7EQjNlVJWbOwXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DPKvk8czbS62fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=;
	b=N9XVGrMdZBRtRxHKpRkN04g/Uvv9fTo5HI6UuEn43zglxPt4ZcAcMPdArJdCRg4YPPUp
	 wgLeU+ZSc08Vh9uK+x/Q51IsWNGjIwDNw+TIyPaqrM1q3asuXvqhOWsVZrXTZc+MUVbxj
	 ibOrFwUSwPevX+ZWx5bes6MZj7BJmmecrCSFf8rrJdlvIyBq4ZF29/ujV8DlOXiCX0i2c
	 HLMC9eEgaNQpHhsTOSV+iKdfXMhhUGQ56PdVJ4qzWKtha6Q3nlTvhbBrxCUPeLW7Bww/A
	 1CoQSIiqt7/C39nrjG1swPA/KuwPDMWsj6RZ5Bct4tpJuAhY3yO1M/zXpsfDCXBjNaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SeOJnIQr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMgpVOlb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029A60A0FC3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5029A60A0FC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SeOJnIQr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMgpVOlb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZ9aE3888927
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DPKvk8czbS6
	2fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=; b=SeOJnIQrqDzYsLP6avWHcV/Rcf4
	8TuVu6a2mZujaoW3QTz2wxf9MS3xpFlegqU49GMlh6qfMzeTTMMgR3pxJdDObJPD
	BjBgIVyc0H75bdK2Y7E4rScr7hcVlw20JcZ7IcPcifSagSV2E5q0BXMeKwmFixoy
	WZFD6bXgxAwgC30AfAWDFXXvxo/sV6Y0ykk44+gZgF+7yEUM4N/OJcZe/JsRdnVy
	/30HutOk6W8KGMPMAUwwhQKOx+RdDpCVomoGG4ppOYdRP0u+45mHtzGUCTI8uyBb
	ZNoJQkqHYdJbMQReO1/wpywO4J4/yNmQVRMVjN3n3vo7eqJL83GJHDtnaKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrj3tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:20:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adad90c894so3471629a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640012; x=1794244812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPKvk8czbS62fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=;
        b=BMgpVOlbxiyUZIpbMNokRFSJ5BSYDX7sUk+JxNraOhwldS096+VSl9op+g/vdgCgRI
         CC9mAaepihYGkLer8PkPIw02H0+1XtgRYaLYVrdkrb9zcaqcfNLmplXA7kjod93LYI2s
         IOkHFKxlRpXpAdpmrG24zpUHmymV76clZipapycnIWRydCC9JtHXKxMfAoXNn3Qfn5TL
         zPhLdiRZL1ggbN4WrRDHJxHcbkA1lKNGeNPXIErWX7OOvouOcX9Z8TtVvC+FT/tMrR44
         dVoue1XURg6lRxLOI9KDUnxYVFAj3S7eplKMtGTMEGK8X6H2Df+tTCjdNahXulgcIt0w
         vczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640012; x=1794244812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPKvk8czbS62fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=;
        b=hIpEuDjy9KLgvwW5xJ/sNXpPQilWjLkES9npsOTnZZZjMuShxvwr95SybrBE2AYN/S
         lxr2iNiox6F73FYPBB/1z11jh5zL2xsc8PA3rUiG4O6hhQnRUfDkda1EFM3MtVQtEluq
         YD6aUlHJETLDLmOmoGBB/7wU/41MdwAWhtuiTWnwtKSSi1KD0moEqz2ybhw5egBWhM2T
         yztdXFKgcE8sj8zRnpVs028GzO1vD8Mwp6l6xW1E/xNGtabkEMBUHp36Axc8MN8w7OxR
         OlcfdayhSeJcNHK+z9VCzxUODtQwOZ0WfWAVUvBUf+i1VN6R8AK1c3RT+CWSfuC4tjj6
         4/Fg==
X-Forwarded-Encrypted: i=1; AKwUvBz1bJkxB6YGWW9uRJ9rvxchalEF/d+bJJWFVpgTWvmPv3FTf3ohKXt4bWbjRX2TsvabLq7GlUq4WPbO3JE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8He5VjfRcvBcY0ju0r4AhA8aWhhD8Rp3FJvjtNARmGK5rUi/Yg
	bIelnHnbScGaXlrMDUs/6lUZwWo9wf3290kT4Y2g4TAVu5K6T3GqaDkRz1d8tqeBnL/iduiJhX5
	NaJyoEWHHt31yebCxFMwcPZz5z1aZTkbfr2hlySCUfwa3MI2ibvJe6ByEJNL8Vlc6KiI=
X-Gm-Gg: AYBFou1eORx5m64zEVHZVyhw4wlHcfaCjJJ3T+p4SVdwJPLYv0ykmSDIn3Kxj5tYmp8
	2/BW2g5KWmbliUsCvnMc/XySe0W4x/gt0b8rtgV/ZYVkpIsrIKxKM60sQXlWAnjHkMfDCDCKmY1
	KLxs7P+ET6EiFirrWGYuaVs4hhIya/UrToNlayT+VMDYXFVp9qj1hLZYWqQ7CODI3E6kHBOTUg0
	WQDD+JncbnnzBM7h8Xv1DjmelbwdFLSoihD42om9QXcIVdtTBeJu9KOEpMI+j5lWz/ikLXgmiGQ
	Zxmcqx+G5rfLFn7/J1cb0oZnaoblgabrAU4uJ7rDNA+FdtRA+xSW0wKZGlF8MOv2rAIxO7vdv0d
	5/Ucug5K9zM0nwuZnafLH7MZeGj+FbZr5hpjiGfZl29WPIRG7SDfZzK9v9GZHOhUFLDxqxVqHPg
	awmC1nAE+TqLX1jMlxvAcbmqY=
X-Received: by 2002:a17:90a:a68e:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae898166e0mr6719683a91.31.1793640011990;
        Mon, 02 Nov 2026 09:20:11 -0800 (PST)
X-Received: by 2002:a17:90a:a68e:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae898166e0mr6719665a91.31.1793640011535;
        Mon, 02 Nov 2026 09:20:11 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm61637a91.4.2026.11.02.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:10 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/4] drm/msm/gem: Clear nr_ops in lookup_ops() failure path
Date: Mon,  2 Nov 2026 09:20:00 -0800
Message-ID: <20261102172001.508440-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8c64c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q3LUg_9hO3srVFazYnoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -JAKwp6-cLlcTFpcSfgJwMvZPGfPQlyl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXzgC1Gww07rFP
 f8PkPqvbBCbNYwbSY9ffZlPzjoKPNmVkQSpfEYV89/kOK5G8kil3FRv6b4tIKpwU6SIBM67OPQM
 gVBckuNTzztXA/xPeAmY/N7SK47uh1g=
X-Proofpoint-ORIG-GUID: -JAKwp6-cLlcTFpcSfgJwMvZPGfPQlyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX60c2YtHd5/Nh
 Q9pd+ruoWwsdQoVp7TAej8gF/SKyOA32rGLKXWGy6arjA+1CwnRNs7JTGudK/H/Hw2TW50MTLoo
 /0hRYC7P7MY9dkU88E7v0WwvbDWV5xbgU/gOodSxIxNv7KfB1Lm2nyVfw4S4hprmBZFKcTL3UrT
 0eJeNGqmiy21FDaLEtCiv/liBY+qGDQQOe2r7gkkBln4bnFr+x38RK6iSv7EpX9tGi8gelXsTao
 lMK8RRq+be8hJLdg8BJNdbHkeffia9DHumoCcnQwP/M73ZTCalhoHO2xgFZVd32uM/q1YBr+z09
 XZIRrySpXww2tEjsLxeDSJMMWlNYGQm8lkP/j6egyzKMLlsjKjYw9fSx2sS1M6lEYt0GMXmeqtT
 whOLnPODIX9x2MexslFcS61A3UINR0x9C7hs0Yupt/2MELftX3sQfigWfgLmN3wRg93GhpeSiKP
 CTez4jsdEdpK6rf+sgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020069

We've already dropped the references taken in the handle lookup loop, so
we don't want to drop them again in msm_vma_job_free().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3177461d7ad0..8b702422030a 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1088,7 +1088,6 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 	}
 
 	if (ret) {
-		job->nr_ops = 0;
 		goto out;
 	}
 
@@ -1143,6 +1142,9 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		}
 	}
 out:
+	if (ret)
+		job->nr_ops = 0;
+
 	return ret;
 }
 
-- 
2.56.0


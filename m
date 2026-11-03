Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702749;
	b=Dda39cr6LqkKFzG45NGHDMFl6Z46w35VScGfOkKptgXTCBHbgYHc58LH6+TuHdNWJ+jM
	 nX1rWEoILTBGNLYtgCPJnqrW/FMqzHpNtiV6Nmws4ADIjQtIM4dyj6UoT0+jQrIGH9a90
	 SXGlqs5hwVVBIVLyODSJ+CEaQ28QeucLOyUo4giyansK1A0PZhuTyEwaAsCXAeKSTAH5f
	 UoyW6QNeNo+qRX0ZNvk/eXAUxC/Vce4eoqPKJnvN9OFA399MhffASs0UBqoPjiTceVH4B
	 DOp35I1OZQmKJV+fS6jDsyOdN5AmqD4VEHJmW7E555peAzwWaffgLozfUhdvz3P6rQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sQUsbB8JDR0hlfeYP3b+MPI92fDANQaYTSrWpBXHCUs=;
	b=CPdWgrRdbDeaZCY0PLqTsIsu+e5+QO0aTapFM671158oZtmN+pMMeXjn4J1FEdM0bFAe
	 l5wKyeb6IxLJy6I+bSh2L8/MYOvNGiMcnb8295Wnout6S1AIkx56sqFJzV7Is8sQvSrpE
	 8I6jg4Pj1mi2ULuxuOiWBCAMPLDXJD11TXO4EBYbPvdmnmISUIg+lMwEaoLl9FY7TIdaz
	 pWjlWv4M0nS83xLws/V496fYmhLFb7WsRPzx/xiFQuHtNdcK/zeZ4QxsgTR42jskc1YqV
	 U02SnPy2s5ddjxWQPZ77Ee3CDN7oY8qb/fUW8vI2yIpJRsILJ3Yda8Cvb1iomBHcPrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTT2VRoR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jH7IFOfr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600386070AB7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600386070AB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTT2VRoR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jH7IFOfr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAMx32554830
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sQUsbB8JDR0hlfeYP3b+MP
	I92fDANQaYTSrWpBXHCUs=; b=MTT2VRoRth3fsIer0GQOfPtwdbsXlOFMMu/bZq
	smnTyvf5hs1gQbBWFZaeOMwmWvZXqL58RZMMep/W+9gvu/61U4nv7bjqFGHwAitk
	awvacaHLDM4aw6jPsMEdOOnuXgerKnCqGxE5La9DUFW63wCnM34/Y3fkk7nK+xu9
	TqWLuxsL50/IP6wpIk/WcHWIhX74MhPHsKg1xtMd9WQghPFx4XVBPJDZm9sJuBX4
	Dis1GeSge56SwmuoNTXBSzwA3VEgKz4QLr4yqiI7R03/oD/cY/0PqiADFzPAW7Jx
	jO69JCdsKQzSYII9rIo3xtw4MmXB6d10sRqU4PlIzXOJB3FQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjr7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:45:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c73709b84so2947938241.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702747; x=1794307547; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sQUsbB8JDR0hlfeYP3b+MPI92fDANQaYTSrWpBXHCUs=;
        b=jH7IFOfriebAD7JRKerCb2ozk+etWWjMn636L0jNyLe46+gdXYQT7pPWHIr4fIPgNK
         bNEvgyFOPQyvtgqw9OoflBpWY20uFQDSlNYhLSSqTy54oAMf0qI3YEPtFufm4Qy6eBQV
         d1vghMYNFVJVt2EWTtBvjLRSRptLaUIzaDJhz3UQsuHA4pY+eEOmVG4gelgP2zLcaVqz
         FSF7JzJEhdZXkZ8PmHyCCBEeTSWfUJgiK8McBT6bS/pv5DMpNexLtnt9uxgaGRmRjgHH
         HEszdC1mE9n87tyRPgP5/0XVSpMNiDwCmp1KrhgnBJXiLX25NloN/pK7iVFR9wXnfJwb
         ZR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702747; x=1794307547;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sQUsbB8JDR0hlfeYP3b+MPI92fDANQaYTSrWpBXHCUs=;
        b=V7bS+DCelyodjY2fcsK2HHzQ6xq3SVYMeOAMDWrDQ6t6piavx1LzCKMAlDhRfL3reD
         cgjPP/suMEjHugkvm9gSOxaXe9MIZvRBE/fl3xgK9WuvXcqHQ/XJTKwWc/9OvxVZZiOA
         b8/IqtHSmOyBq+v9v2x8zg4vrqbjkEOR0IJru1w1hhkyI3Vn2S8Fm4qmm+e91yOijyiJ
         vsqyo8+BSE7kF/5Tk29AwrkxE7Vz/CQBycK8ee5UXtBpgI75+TmS3Mk4rF5a/iBf3TEJ
         MLSe6ltHLhSv3ZjAYa53tqEVl7Tx8tinxvQQMADJGTkAqKJ6dwl9RnvOZ/LLoaxFqHhA
         V48g==
X-Forwarded-Encrypted: i=1; AKwUvBwUIPeuZwZQtU3q5wUjuY6t+ockIOHd9YjrEvYVoMNBQ7ayH80EmQVprUB9UknYSASPsscYJqKJ1rN7PUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ROekssqQ4+J85skv0ShFMbn0C/u8btAWwWSJr0dArOaEpMGjd
	7VwdJvnRw7A5GasgL4WuXiAr2sMiUtDDYm7ByNutgmZvjwphGBc01OAYtB6hFwyZHlIELy2ZqYI
	8q18SA2RoCLL5Jyn+yvoVVQPyJJtPiK96gL4d3vQ0kt+FPBc9TlUgxWzUSHpoAm4XVj8=
X-Gm-Gg: AYBFou0JCLWesfB9gPvwVl2rJ0uO3SE9ZoX4wtWhOwK3dAGFM2F7ZrnsdmeNfExkH3W
	0os6tNuobtEIKG9QXl44abc0VMwLNODXqehKA81G3znqAZmkTlSWJbLcvoBIhAeW1Rs9R3OL4BC
	WwBCiVeLyqGYWHcMQJe8wsdN12fHNZHjwc+1cJN9/hZmBdNBjENOIasgg09HqbB2/5jDrNYSiyK
	UnwYaymJlxQvvicaWE7U7YQSmCJsR+1r3z9bh03eURza5KQ6T/kWNjvzuk/16NAHq7a0yK2IAjk
	Nu9Ujh8nNk0bXEQo0uoseed8zo3dVD3INjwsa1t1ZeC8+ssm2+geld9c1DSSH71AQsvkGyNra1W
	kjSCB8XKsZNd3LUTH8X8/h0PWiG7quHiUZ1j+h3NXlz9cBF94p+yf3+/lCA==
X-Received: by 2002:a05:6102:fa0:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d072725679mr5226898137.26.1793702747181;
        Tue, 03 Nov 2026 02:45:47 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d072725679mr5226888137.26.1793702746514;
        Tue, 03 Nov 2026 02:45:46 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm24329481f8f.10.2026.11.03.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:45:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 12:45:41 +0200
Subject: [PATCH RFC] drm/msm/a6xx: Reset the GMU state when restoring from
 hibernation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-drm-msm-a6xx-rsc-restore-hibernation-v1-1-3250fd8eefb6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFS76WoC/yWNywrCMBBFf6XM2oEklYpuBT/ArbjIY7QjpJWZK
 IHSfzcq3M25i3MWUBImhUO3gNCbleepgd10EEc/3Qk5NQZn3GCN6zFsMUnGrBn9UCuKRhTSMgv
 hyIFk8qU5cG/drjfkUhs021PoxvVXusD5dITr/9RXeFAs3was6wejYIGQkAAAAA==
X-Change-ID: 20261023-b4-drm-msm-a6xx-rsc-restore-hibernation-912730e2de2d
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7149;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qIwJI+anuhK4OswFhTkGj1T+Dl2W48ywh87lZ+o7+pQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6btXX471MvJpA4yJSF93dasqyXvTejh12qpt1
 p/qDyvAmkCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaum7VwAKCRAbX0TJAJUV
 VtbbD/9a0+dyf+ahoquPbCOpK2oHblfRHZjnF+7V6JBTwZhXQDgjZQq6T9OM3iSevcOxE4H4kRV
 smFuUGb4i4dgWiRObD1VXyW/Wb5x0T4DaGCeRpG5gw6C/gFxJeV2IgA5+LqeMplAiAm1iVuey95
 6N1nJoSyd2Kl259tQ0rqc7ReUFEm2zfX8LV04XG1aJrBxqaODFeCMmNy7V6p0FaUpw6Aw4wqNOH
 3iBEdjg4o8j7v3DkKcJaeGqsVyTK0ZlQEraIH+PmH0/kAIWjR51TDYGNuYTPPim1GlPno542CMa
 my+JCQqC9492iLhzeQY5SgBuALT2vB5n58Us/4XwpjyxSdtwkLNQxqZsx5tzRxbMVX1Zx2jZKp4
 7W+hRexlcke/MbUzpqFX750XGpn6dyISp6yjHfdNKiy0PmCQdWPgPuxTtSfzGvVViayanQuMXh6
 IPhCcEqmOjdCczA4kDKIdfVOG76Ct7RQf1lCHeNXt3Ve4D4VFyrQKme8vExFTsRUEht9nO2C9hC
 Ykz/710BmSl/aHOabEQYiWaOLpMWBd/LsxxcClx0BHH1DWb8WMlvQPn+1ylL0tByovGgXHP/JDj
 3cr5s/PsAtyQPCvEnUq6rNglWUGZZSq7w+H8MuODCb1p/iFlo5R/mfo6CnHXFnPiXTjZ8ICzKeV
 6cK05N5ONgSyNnA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9bb5c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OEvzuKR3CQ4-nrwu30oA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX4Yx9lU967i/9
 gJGCVQsz4RlXnb/4QYO5zKq1YTzlLXiFixoQdpw+TVANOSMRv6ZFP/t3tXVEG+og1EARLtuRX89
 tuSSOUDO3qe7fDOmGWocFyCm6E8QtWPPoBHAOP4xkqUKo8FQES8XxqJwDs8p10Tkmju6jBTpoUs
 vG++XdCMC7Gjg253TIazpjWXkBwdSwhj4J+K8ENGO9PVtx2vWPObf6fSjy3vpzcZZOelQ4eFMfO
 BVpVNJ64WRIsPpnRTO8cm0//cxY4yC84mXv936sVA/hoR9BBf69W40pLQxIPJd7lpjWOeRq16dm
 H5CitPRpGKg/9S/6t0baeENILmgBYVxB8RXP/mMTveZLFJ8wtbNEs5+/qgx6xLh3DmiSwgdNl+f
 aa2pbYhPuKd6JWGLZpg3aAVa102seZKtD5CAux0AWJNdY9oD4VJ5aMv4qLgqGvCFAgugdx4U3UL
 i2BWZrseYStkRrkSDig==
X-Proofpoint-GUID: jIYjKLkR00LqiJa_orbjTMpWFhovJj46
X-Proofpoint-ORIG-GUID: jIYjKLkR00LqiJa_orbjTMpWFhovJj46
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX1cIsY8AKhDt3
 07KiuEtWvIro8fk6T5SoU4A6WJ3Ng1t2pC4slCqOvkNLFP+oPauN14HukLEWj/jVaezyKmWoy54
 kDiAg8eJrUVKpNWocp3jQVgHw9nu5p4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

The GMU puts the RSC to sleep when the GPU is suspended, and remembers
that it has to request the RSC to wake up again on the next resume. A
hibernation image is restored after a power cycle though, and the RSC
then starts from scratch, in a state where it does not answer that
request:

  adreno_gmu 3d6c000.gmu: [drm:a6xx_gmu_resume [msm]] *ERROR* Unable to power on the GPU RSC
  adreno_gmu 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
  msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 44070041: hangcheck detected gpu lockup rb 0!

The first job submitted after the resume hangs, and the compositor is
left with nothing to show.

The GMU secure init has the same problem: it is done once, but the
registers it has the secure world program are reset by the power cycle
as well, so the restored kernel only gets them set up if the kernel
that loaded the image happened to initialize the GPU.

Forget about both when restoring, so that the resume starts the GMU
like after probe.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Sent as an RFC, as this only resets the GMU state the driver keeps
track of. That is enough on the Glymur CRD (A8xx), where the AOP
configures the RSC and PDC. On A6xx and A7xx, a6xx_gmu_rpmh_init()
programs the RSCC sequence, and on older parts the PDC, only at probe,
so after a restore they are only set up if the kernel that loaded the
image probed the GPU.

The zap shader has a similar problem: it is loaded once per boot (the
static "loaded" in a6xx_zap_shader_init()), while the secure world and
the zap memory region start out empty after the power cycle.

Would a full GMU re-initialization on restore be preferred over
resetting the status bits?

Tested on the Glymur CRD over 9 hibernation and restore cycles, with
msm in the initramfs of the kernel that loads the image. The GPU renders
after each restore, with no RSC, OOB or hangcheck errors.

Prepared with help from an LLM-based assistant.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 ++
 5 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..1e6e47b635f0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1319,6 +1319,16 @@ static int a6xx_gmu_gxpd_put(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+/*
+ * After a power cycle the RSC does not expect a wakeup request and the GMU
+ * secure init is gone, so start the GMU like after probe.
+ */
+void a6xx_gmu_power_cycled(struct a6xx_gpu *a6xx_gpu)
+{
+	clear_bit(GMU_STATUS_PDC_SLEEP, &a6xx_gpu->gmu.status);
+	clear_bit(GMU_STATUS_SECURE_INIT, &a6xx_gpu->gmu.status);
+}
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 92e8c8abb86d..962b497868da 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2796,6 +2796,11 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	return gpu;
 }
 
+static void a6xx_gpu_power_cycled(struct adreno_gpu *adreno_gpu)
+{
+	a6xx_gmu_power_cycled(to_a6xx_gpu(adreno_gpu));
+}
+
 const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -2831,6 +2836,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
 	.gx_is_on = a6xx_gmu_gx_is_on,
+	.power_cycled = a6xx_gpu_power_cycled,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2903,6 +2909,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.mmu_fault_handler = a6xx_fault_handler,
 	.gx_is_on = a7xx_gmu_gx_is_on,
 	.aqe_is_enabled = a6xx_aqe_is_enabled,
+	.power_cycled = a6xx_gpu_power_cycled,
 };
 
 const struct adreno_gpu_funcs a8xx_gpu_funcs = {
@@ -2935,4 +2942,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 	.mmu_fault_handler = a8xx_fault_handler,
 	.gx_is_on = a8xx_gmu_gx_is_on,
 	.aqe_is_enabled = a6xx_aqe_is_enabled,
+	.power_cycled = a6xx_gpu_power_cycled,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 79912a33e17c..37266d64427c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -286,6 +286,7 @@ static inline void a6xx_cx_misc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 va
 		((_ring)->id * sizeof(uint32_t)))
 
 int a6xx_gmu_resume(struct a6xx_gpu *gpu);
+void a6xx_gmu_power_cycled(struct a6xx_gpu *gpu);
 int a6xx_gmu_stop(struct a6xx_gpu *gpu);
 
 int a6xx_gmu_wait_for_idle(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..b91b32e61fab 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -402,8 +402,28 @@ static int adreno_system_resume(struct device *dev)
 	return pm_runtime_force_resume(dev);
 }
 
+static int adreno_system_restore(struct device *dev)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+	struct adreno_gpu *adreno_gpu;
+
+	if (!gpu)
+		return 0;
+
+	adreno_gpu = to_adreno_gpu(gpu);
+	if (adreno_gpu->funcs->power_cycled)
+		adreno_gpu->funcs->power_cycled(adreno_gpu);
+
+	return adreno_system_resume(dev);
+}
+
 static const struct dev_pm_ops adreno_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
+	.suspend = pm_sleep_ptr(adreno_system_suspend),
+	.resume = pm_sleep_ptr(adreno_system_resume),
+	.freeze = pm_sleep_ptr(adreno_system_suspend),
+	.thaw = pm_sleep_ptr(adreno_system_resume),
+	.poweroff = pm_sleep_ptr(adreno_system_suspend),
+	.restore = pm_sleep_ptr(adreno_system_restore),
 	RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..7ad8cbcfede4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -81,6 +81,8 @@ struct adreno_gpu_funcs {
 	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 	bool (*gx_is_on)(struct adreno_gpu *adreno_gpu);
 	bool (*aqe_is_enabled)(struct adreno_gpu *adreno_gpu);
+	/* Called on restore from hibernation, after the hardware lost its state */
+	void (*power_cycled)(struct adreno_gpu *adreno_gpu);
 };
 
 struct adreno_reglist {

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261023-b4-drm-msm-a6xx-rsc-restore-hibernation-912730e2de2d

Best regards,
--  

Abel


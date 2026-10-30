Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400086;
	b=p+LVtXzWHt6zCi5ZEx9E3NlJXhVbhA27B3re4yeHLh5FL8Z3YaClg4scr1zOl5ybmmPB
	 dbPCdCxVNm4przX79qJgRSWr0GRTaMapg+ePQWr0cEDAWNRXdNKc5htEuIaG2x9Rhqgm1
	 vebFlaa+fwoJ4rIHBlK1bKYjoYG1Gc6jj8QjBi73PtyqxK2qDfpQtjMHPlWCJPD6uLCPB
	 ONmpZXWGnRPR7kPU8qRMHYhEKs/IX2q13mBOmSFq9h1s9f5zV/pKPj2fFTyWqK6TZqoX8
	 WkzpfSt01e9fM69NljHaBME7IzZJg543R5llT+SqbpTq4K0/pZ4tLno1BlFReF13fJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=;
	b=RKiuB/DFZOxvbPagXH/UK3r8nvvwUDTQG++Ostg9e1kE3OztfRTyWmb3qy1bgl+Aln/J
	 pt6sQd7p7u+U32tZe/PWo5kJmE2zcqcunDIdye9bMPmVOzNTL67JK/QUpZLcMX66smMel
	 nhBDBHoeJ4n9a4Jd3GwlayUl2W6MNDSSwt+ctQlbhcRLF5vvaRiTLmJ63V2iFiaxUIb5T
	 RG6Gwy3hzG0eWHyRrkaNiK6OC1kUivwJ/3I9H6ouV4Tl86+ZfYpgS+N2VqCh4GFaDyJZ0
	 HHHLR8yDmJwOJcqhNorLj3EbhUbYqlmCsGyq0gOHNXW2gKGsIMNNdOgPPHtIUYWmlcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FIor1cX/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WD7hwcqS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8A606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C8A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIor1cX/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WD7hwcqS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtNDS3463635
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=; b=FIor1cX/x4KrRYVr
	JMMahIwHkbazCSokigyudNhapGXQyhnD1JzmKQEF/LJvtvo6oUutN9cwkdX5ImI3
	yNf2fDFsfRYVFD3ft5GSwOg7QHx7T64tTFjXTsw8ClDGMgqkmyNJ0J8GtEx71PN6
	O8D2mtNtYIeM3KZlwZsPxrfJnCDmsFCYbi6oUaYh5G0mMrWU3hBRxVNxlL3GwGWF
	pOhfyQCdNrvqELMZOidIFH/EcTopRp264dv2eWMDMCxhdr81hjOORnEpo7hhFhGK
	Wd23iQWqTztJIcDfEjnP1nkpJB8s7o6qErV3XMcx85XxDmdFwnLlUnS/o2xrLWzH
	XnAZ+w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x087sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:41:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so4883158eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793400083; x=1794004883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=;
        b=WD7hwcqSV8K8vkhesz29czBynq2xsBgRBkwKwYF75347fbC/lj565lcQd+0Ohb21O5
         XNVE0GZgQnCucirFSxD33ZHVEMewVe8P4bOuWwcpH4GaC108EbMiDjyQefR4vdoxwNB+
         4AvnYdwZyJNk7M3b4iREUjgQJOSeCk68N7H/Nc6JkpwNI5NlVSmVLIBL1TYk+xh0R9sP
         VKptE2eCyUD1B3a4z1eL8zdNEHYOvoqYA1ABW/gubhe7QRPMIzZWZH1XtQg52wx/k9kO
         bWJO72mR6zyoLey3rG0wHOU4lLDHEOQZ/SYqzOHyT+DoEl0m6Aj56YbHVH9mybZASt7j
         yxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400083; x=1794004883;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsBzW7xqQveqByDeByAFTWwNeMndMEtpm38WVOhX+aw=;
        b=AbIrymU8KJRJZQQmJuRiQq5Dt108piUhVkfx1RmDllir7ri4u+IRfWrkSKtajkqseq
         ehAvsuCf/GDGDrUZfHhJcIaPFHSlhPa3NAMTo1CsLzsbtJ/ZoBY69msIrhCsg4BmNWIG
         e5dzpanK/pdKazzWAEA5y3XitANEZtGaa5Im15KgFfBjpO+p5ZDz9/qeqP0wHU6BN52m
         JuRd2Q8lPHeo2q/7wil+jW/TGTvwR3w0W1LHG9kgWyp0WQqA0NajIofUyM+F9lEtVZk7
         JQxQ9sfr5FNnidJwm/shH7EryOcRvP5iKgq+btf8/ZsYUMguHZC9c67Z8o8ekOv6t0GU
         h1oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDm8o1bybz4jZo4BzWcaTgMfIJUZM0zHgtNZz9sT8JDWEWXNftZyBjoUErB/DiGFyfGVef/3zy/ELpNrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwllmjSFer4rXzWgxb7B/B6l+nQZkl6B+1hm9k8bQJaZMYmBqu
	Lez50FtlvJoZRHpBBJQTja48Z1QikHyHeSFfYE8CtB9hc5hW6vwr8QrsMcPCQKbulZ4sNTTRUqX
	HWlYSj5p5MFDgiw/2aj8p8aLr7mlftEe6NVvPBIcTIfa/nHa8tPGA6Tq6Hrrju/FJ8FMB3WeDkv
	o=
X-Gm-Gg: AYBFou17Pn5yp2bziH4ejoM1iAOHv8mb+RSTYEB/RPYu8Z5og77zc3EoSffU2IV1VPr
	C0SONFwCNZvReQMK1+CkCcy8rfzMPsJXnVHYyOldTaz3kHopxPj8UqF2PL4aNT2D6oGy49VOVV2
	fyOsPBxP4cnnb8EkKW0KT3IVppGhZIzGd5VqAiFCl++wrnPtYKdyR3ZPDNEaY5GlasNBGd0+JFW
	v9pXyJ1vKvAydl7U9E+oFE341JQK84Ax2zHDejO42lsB8I5eSsx6rUc719Vomndnr9ASTC6Npf3
	xA3IftxQmXpjtyi6pC0n2lLTDReDmQVkvu2vauCbcNyoa7iTM5LkuSWALuQKNf++XcwbF596qDo
	MQwMUT8Ul/5B80E7JnMpcgiR4Z8JbbDGeilaZgqMu637735vMLN9PDKkzIUp3fIwEZ0MaucpTo6
	W9XOehgAfTiMv0qKT7/S20esZ/O6U=
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id 5a478bee46e88-36a42412f55mr5914686eec.29.1793400083265;
        Fri, 30 Oct 2026 15:41:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id 5a478bee46e88-36a42412f55mr5914649eec.29.1793400082551;
        Fri, 30 Oct 2026 15:41:22 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm14002245eec.16.2026.10.30.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:41:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261024053838.3569557-1-rosenp@gmail.com>
References: <20261024053838.3569557-1-rosenp@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't select ATH_COMMON
Message-Id: <179340008113.1790611.5520153588822009643.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:41:21 -0700
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
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: -VZtW8mJLnCqS0mKXvKi7DrxoQY_8f-V
X-Proofpoint-GUID: -VZtW8mJLnCqS0mKXvKi7DrxoQY_8f-V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX13W/0CV8qJmi
 oKJZSE3to1L5eNcsJDW8bFKAiugvPIG908p0exPxRUHhdlwKeniln+uNrs2OXQpNMlBgvKfMl6R
 2y0PN+ftr01jshWMqKiJaYo02WcgvQU=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae51d14 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sFLP4FgJ8RwY3w-QHdIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfXyPiQDubE8OuY
 e+yteFRcWyy2CnMHr239PFMTbP7eh+I6/StDCLAkEc2i35Qw8k0r0xgADCVYLnFVbip88KV7uJ7
 mOKYP0anM8jhg8v2vyFV9RUyePzxK1Q0YQcUIqHIJ5blY/CGDW/mq8q3lENklbYHsCHhcefU/BG
 UnPkA5ZtDfAMJiTOjaYEyMXSyuoWx0g4RJ2wJe62ac8RGCL/ulXSubP5ICRmOmE6jRjYHAUH6pI
 nUX2ZnleyT38Fz3QTLMhhmIJe0dmejX7idHbyOrgwS+EqGclD+HTXA0NTx/K4Yruxz+ZR0afV1r
 uNSA4fH2gKIMcwW0obkDJCtmBpKSx9xYrdW0w+SSBwAj7CeuZhraTglgMxKkPmsCkho1VNlOm8F
 vRj0fZjoSTsipDxsNkpQzD2+aNxsw5xSc3OaJfGE20js6rfGdikyc/6tYS0KPSbDglE1zryYo2t
 W92LiDSXwS5DhEl6mMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300090


On Fri, 23 Oct 2026 22:38:38 -0700, Rosen Penev wrote:
> ath11k only uses the header-only spectral_common.h and testmode_i.h
> from the shared ath directory and none of the symbols exported by
> ath.ko, the module does not depend on it. Selecting ATH_COMMON only
> builds ath.ko for nothing on systems without another Atheros driver,
> so drop it, like ath12k already does.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: don't select ATH_COMMON
      commit: 70f43c2c73df0e769995990a7b330ee56f0e1fdd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


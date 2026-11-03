Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793721887;
	b=w6cQ2sZtIK/OTl20MMbskBSx3cx7AYizw7cto/ttwcWV4k9WIu4qpkU/yDAcMs0ovC7a
	 /46AEaK3pI1vDizQ7fA+aJC6lZJpOG+j/ZsaGbFOSZW+naWzQlI0hRi+PNZQrZsCnJncF
	 RZBQHtPRl1J7/bmoWvYqZsUy7inBRb2dTZmX08DIawcaoL7hqS6C49wRQjMhzMvMLQMj1
	 6tbXwkuLlTrNErOxhpM0O4iQT3/5ccSCOWgD7PZYLfAt0rwHHabOf9GbdwwD8E2dCdGBB
	 UK6as1uaRVaeJDMK2N4HYE3uK0mXNa7a3u2dnST8PHkjBFS1WlyDz0EtJSbZJmk57/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gipF20o2h34hBulprmr5ZDNI7YyF8KnzA3/1TkP3zHU=;
	b=e9tEnOclX1a9OdlqeaSaziMMe7e2lcvWmsstUkFZL4ego5cqkGFL+qwIwh8nP6NGFKVs
	 nrF/+pm1noqWfODJXuG2n8+uiUxakdi7+MZkJ1vzzJMBwyrwbw3v6dL0hDfdaCbOYNTdv
	 HeQZIg10SeJ+PHZ3JXrWzHG0CbyTHzo7eYn3afS8K0cRcBJUutCCupFoVLEN38pwGQgc3
	 l5NUIuBEWtxpl+x2IQLO4Q7rliolqq4MSgBnmsSpKc6xLqS+HRiXOrW4dzS1ZAEEyniMI
	 dUVMrLGSAo05gCt2X0DgLUDgaD3ZuwcxI2L3lI/ur2OT0mXe6+wuwtu8fedYLkr9+cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlWUZvhi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRg0Jmxi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449A606D801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8449A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlWUZvhi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRg0Jmxi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA6xl3081277
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 16:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gipF20o2h34hBulprmr5ZDNI7YyF8KnzA3/1TkP3zHU=; b=GlWUZvhim3fVL138
	By17xJF+HAFdSFb5vFlTwCUaaqsy6LeegwVzhxrS3+0sXI5qqsIA6aMowswYfofc
	9rDMFD9+8pw13kTTpvHGQudOSz6PqOYQjddoesXcV2A7Zi6LPPzlkdJKo0JUmtFy
	swaE3AEnWtXhbYVPDiemQSYtiVG1WWmBqCr0ehBbwXs7dHujbHC5ZrEEpgalhkCe
	4tj7v34iHfH42RL11z6c8GvD+ybcJvb2TLOY5Hm/DJwb9z+Hc2bBaOctj6nN86Ny
	dUk5c3FHBUVYiGmIyMP67B2bbTio//ikap8Hbvg1Yt4Ckjbf5zc5WByqFYZ8dlOq
	4G/iYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acm0sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:04:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so667695085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793721884; cv=none;
        d=google.com; s=arc-20260327;
        b=rQxjJ6JsVi7MVtTK9FYrvUX5RLzdSNSaog9bl1m5VTNVS1nf5u+L2mW4hFkz1r9fR3
         kiR8hEu637uFxas12yBklxb5LlE6Llv1dbUQ9n2n4HjsODsEBRncc1r95Aa8VLl2ahE+
         fxr83Oyoj/bz7dewB0brLuK5s3/8ZiDn3iscPjx7vsVndFWWml+67TgnW8daShJuE4wW
         FAE/Zn+Alm7ZhzfKVITjpRy8d3pKhkIlcbp1hctIPvQq4I6hYrYqduSp6sXfIoXpJp/f
         0RRUsleUPLuC5L6eocctJnTNaqJSbGI0AqRsnbarfSx3n8lkrGLMAnRvplAgBonWUC4v
         1lHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gipF20o2h34hBulprmr5ZDNI7YyF8KnzA3/1TkP3zHU=;
        fh=WE6W8ygHHAnB+e5CXN5rhD694tF6tfI5i1PXpqfH5U4=;
        b=b0dFTeA68jNcr0uzgOXQu4qDSQPrloVgCgIWY2mE66+N0VA6gbE/rfdcJxnAdADMkE
         rZToqo6n2vLUUO8nK+wXF+4GvMpVelzqEII4EfP+R8AuI8zzh81gK5zFsBq5ESY2J4jD
         AFTcVuA/0KhhK69qF7gLeM+XI12KIX2h/OLSZ6bedBbsY2MK2//Sa0H9ouGsmB0tL0wz
         3sKPxY+lNYHjvwhmfLZp72TkYKVZz0w1RMHojHjfRYttQaP6s5XD1VZiumuFbCCdeGec
         /nO7Ulg2wH2vYtyhHIVAaC1l/sbRymcSWQ3DMB/tmHcv/xYMmpb5ESKgQCP+nAE+4RSt
         HJ8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793721884; x=1794326684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gipF20o2h34hBulprmr5ZDNI7YyF8KnzA3/1TkP3zHU=;
        b=IRg0JmxiNFL5tFu2TjUf+fzxnf1SRJB3BXITVRaTgOhro0rjnl3SbLEESnTCrgMgO/
         q2ndJMpA32jDnZCEGwDrr7GRHObBMz6iNNwMGBSkbynkhU3lW4Gu3XFmXaEuzPqdj2HI
         9w5XPfushC95fBgAi92sSSb2uUgH8WBvi2Np10jm/gm8U/x5EW4VA3gJkGatvhR9O15S
         oZTKxevsc/ktPNbUuB8MfxRYD2mnSqPQvmYq3poHSIv0odzft6mzbSRQ5Qvvvpx1Mw8P
         dNoVZNx3ol8ixLlzuhx8vFB5ikLv7VdSXHjTjxAW+KrKB5knafLOPmgxH69plFboiC6A
         X8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721884; x=1794326684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gipF20o2h34hBulprmr5ZDNI7YyF8KnzA3/1TkP3zHU=;
        b=qsuMX/EaWbShPpqW1fUwwqlYUuGYxCvhGi+6/NUQuMbrfC6pkhBlZLNpyLFOfOsKf6
         AV4dT2y59Tj/XK0P56xn2+tk2nmrRM7RMQw8WyGmmXE0LjzxUCaa4PePltuYTHTxiSHk
         2H0cc/GvL3IVRq0lxjguSZZ3bALac6Yh3l5dkfAbiZUU4kLPZyorwnGZd4OeEp/sJMJI
         olJ7fbWM3b01x7DNs74SwyKYhgm21HxeSJdjT7cq9X+n9Gar8grU8gFaaApb8kTECI5b
         XHiIKm/g57ez4BFN0gWH6cu5hk+C87FlJVsoVRe4JLopVbds4AUR2wvY0Ol2609SIy5b
         Vtgw==
X-Forwarded-Encrypted: i=1; AKwUvBzj9RpR2E30IrskxID6xyzNn9Ab0daQ/Y8R+ndBiqJ6acqUmR1XTrtJW/Q3GmOYdYhkjGDGA27YJd4pafk=@vger.kernel.org
X-Gm-Message-State: APuU4Z83KUKcnQjJuNumq9WUih0KNjQGT9uyEL8Id60744iT/lISSVhD
	z0PrJkBwHsu1hC2fJM6N6OmxHBKo24cL0ZTbGW2H4LXN/k4Vghcgr5MKQoU2eT4Nzvfsjrwolf+
	7MpWJzWvm/iEFN9DSdR1bHCM4zCfKIv6TuMbtEHGcZ4tHjNIkrVXz80ui/3BZZLYVTCgsWwn7P5
	vNCUQpYuE3k7OOOx8jaalCpFFgUjBBXjLctcJSqTauOg==
X-Gm-Gg: AYBFou3AuBkyS/gLcQuIFCHz1gGtRnQRyjFGvah6gxHrovvmTuQb0KYYmqHOuU2pC9j
	0ofbgBJHsywUYQsBcWdf1W0rM8pcsOQF6o74EermZHi48/NtxzXqyKGoNVkhjyJpK87xe162LXw
	mfEeh9+K6MZzt9yTf2AcuMVfoKeoiEAWhsBge4NeUGaAS6d/AdW141R8QcNwZdDGR0Bnh+Kqcrh
	GK5iHeSqivtYlcmMKF5DohAXyv1g0IWABae2Lr4VZDiJcxYAgVlhbTXo8jRpwCVITejS1TWC+4=
X-Received: by 2002:a05:620a:4405:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-944214cb71fmr2205524485a.4.1793721883590;
        Tue, 03 Nov 2026 08:04:43 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93c:7a5c:77d8 with SMTP id
 af79cd13be357-944214cb71fmr2205516385a.4.1793721882884; Tue, 03 Nov 2026
 08:04:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
 <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:04:31 +0100
X-Gm-Features: AclHuK9dPBw-jO64BO1ihdfRNLN-Qdvw27QiCh5hGuNrF7OPnfM6M-1Uq35l-aQ
Message-ID: <CAFEp6-3iRLDJUHAEa4qGGcqJYUSB733wKBFDw_k5NF7LQF+jQg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6aea061c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=6-Cr49sz5ZyKOFeZGKYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NCBTYWx0ZWRfX+brr0QkWeDTF
 VlJH1ofEPUzPQ/8Oru+hmxC70bdUESsi+aCl25zvHSKoiVfu0X2laZVabYG/vjneD/WPcmUcLbm
 Ni7byp+HIJg4nwn+gIS1JYPjUrM/IYwGQGqbuPtJMCf0qdLCiK3eg1bP+ao4EqXvG4AtE1v+C4L
 DRkSed0I9pbq140j4fUMZPJJlBLzumGitEq3TngOtiLATU9gULGSug23EQR9xtaPxQnc8ntJ0p+
 bDvvPEwk5CulYcbw7cBmvZx9wpB4ei898DoiUPRbm54hukzWmhlzSxjuaKDT+l3ybHnD5OLHhiz
 VjXKNn/xiNZDeqnczRS2QwLU8KYKg+Ii3AsFPbCrOvKKAjAr8N6BR9F9OuJ2MMXr4HZwKj22xkN
 jslYQRAA+xh/lm1wVW3T7qEntACkc2zMHxgWj1dzDFXQcDKh8FBJjnlXtCxEtPMrb3nOgFKDyRC
 IDqWjlVb8lvnpA8PADA==
X-Proofpoint-GUID: 8uw5ICFT2OEqwteyeCienibLCBWIn88D
X-Proofpoint-ORIG-GUID: 8uw5ICFT2OEqwteyeCienibLCBWIn88D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NCBTYWx0ZWRfX5qam1IDH3ils
 nAoHR/1dCBRv18Uoig716aWIx3+jD6Hh/1l/LlbHdYHgTdI0yta/BLWg0Nvr7oqZXpOSlhn9bdO
 rKQls957+7hOQh11g1yV1PKOPLKu0a0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030064

Hi Vishnu,

On Tue, Nov 3, 2026 at 3:19=E2=80=AFPM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain with restricted access to system memory. BAM-DMUX DMA mappings
> and BAM descriptor FIFOs must therefore be constrained to a designated
> memory region that can be shared with the modem. Accesses outside that
> region can trigger an XPU violation.
>
> When qcom,vmid is present, require a restricted DMA pool and assign the
> entire pool to both the local and remote execution environments before
> requesting the DMA channels.
>
> This ensures that BAM-DMUX mappings are within the assigned region. When
> the BAM DMA controller references the same pool, its descriptor FIFOs
> are covered by the assignment as well.
>
> Track the assigned execution environments explicitly and reclaim the
> pool for the local environment after DMA channels and mappings are
> released during remove or probe error cleanup. Skip the reclaim and
> leave the pool assigned if the remote side still holds its power vote,
> since it may still access the pool.
>
> Fail probing when restricted DMA pool support is unavailable, when the
> VMID property is malformed, when memory-region does not reference a
> restricted DMA pool, or when the pool is not attached to the device.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/net/wwan/Kconfig         |   1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 114 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 113 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c5623161526969814018=
7ca3141dfe48dbf 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>  config QCOM_BAM_DMUX
>         tristate "Qualcomm BAM-DMUX WWAN network driver"
>         depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
> +       select QCOM_SCM
>         help
>           The BAM Data Multiplexer provides access to the network data ch=
annels
>           of modems integrated into many older Qualcomm SoCs, e.g. Qualco=
mm
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..c9639474e58acc16ce0d04f18=
1b2e999cff42bd1 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -9,14 +9,17 @@
>  #include <linux/completion.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/if_arp.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> +#include <linux/swiotlb.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <net/pkt_sched.h>
> @@ -75,6 +78,9 @@ struct bam_dmux {
>         struct completion pc_ack_completion;
>
>         struct dma_chan *rx, *tx;
> +       phys_addr_t dma_pool_base;
> +       size_t dma_pool_size;
> +       u64 dma_pool_perms;
>         struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>         struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>         spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> @@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
ruct device *dev)
>         return 0;
>  }
>
> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct device *dev =3D dmux->dev;
> +       struct device_node *rmem_np;
> +       struct reserved_mem *rmem;
> +       struct qcom_scm_vmperm dst[2];
> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +       u32 vmid;
> +       int ret;
> +
> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> +               return 0;
> +
> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\=
n");
> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(u64=
))
> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\=
n", vmid);
> +
> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> +               return dev_err_probe(dev, -EOPNOTSUPP,
> +                                    "qcom,vmid requires DMA_RESTRICTED_P=
OOL\n");
> +
> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> +       if (!rmem_np)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "qcom,vmid requires memory-r=
egion\n");
> +
> +       if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) {
> +               of_node_put(rmem_np);
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "memory-region must reference a rest=
ricted DMA pool\n");
> +       }

You later test with is_swiotlb_for_alloc(), so isn't the above test redunda=
nt?


> +
> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> +       of_node_put(rmem_np);
> +       if (!rmem)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "Failed to look up restricte=
d DMA pool\n");
> +
> +       if (!is_swiotlb_for_alloc(dev))
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "Restricted DMA pool not attached\n"=
);
> +
> +       if (!qcom_scm_is_available())
> +               return -EPROBE_DEFER;
> +
> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> +       dst[1].vmid =3D vmid;
> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> +
> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
> +                                 ARRAY_SIZE(dst));
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "SCM assign restricted DMA pool fail=
ed\n");
> +
> +       dmux->dma_pool_base =3D rmem->base;
> +       dmux->dma_pool_size =3D rmem->size;
> +       /* Track the destination VMIDs explicitly for the reclaim operati=
on. */
> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vm=
id);
> +
> +       return 0;
> +}
> +
> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct qcom_scm_vmperm hlos =3D {
> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> +               .perm =3D QCOM_SCM_PERM_RW,
> +       };
> +       u64 src =3D dmux->dma_pool_perms;
> +       int ret;
> +
> +       if (!dmux->dma_pool_perms)
> +               return;
> +
> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_s=
ize, &src,
> +                                 &hlos, 1);
> +       if (ret) {
> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool faile=
d: %d\n", ret);
> +               return;
> +       }
> +
> +       dmux->dma_pool_perms =3D 0;
> +}
> +
> +static void bam_dmux_remove(struct platform_device *pdev);
> +
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -796,6 +892,10 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>                                      "Failed to get pc-ack state\n");
>         dmux->pc_ack_mask =3D BIT(bit);
>
> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> +       if (ret)
> +               return ret;
> +
>         init_waitqueue_head(&dmux->pc_wait);
>         init_completion(&dmux->pc_ack_completion);
>         complete_all(&dmux->pc_ack_completion);
> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>
>         ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LE=
VEL,
>                                     &dmux->pc_state);
> -       if (ret)
> -               goto err_disable_pm;
> +       if (ret) {
> +               /* The PC IRQ may already have powered up the RX path */
> +               bam_dmux_remove(pdev);

Calling remove from probe is a bit unusual, have you checked that
everything is correctly balanced?

> +               return ret;
> +       }
>
>         /* Check if remote finished initialization before us */
>         if (dmux->pc_state) {
> @@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -879,6 +983,12 @@ static void bam_dmux_remove(struct platform_device *=
pdev)
>         disable_irq(dmux->pc_irq);
>         bam_dmux_power_off(dmux);
>         bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +       /* The remote side may still access the pool if it holds its powe=
r vote */
> +       if (!dmux->pc_state)
> +               bam_dmux_reclaim_dma_pool(dmux);
> +       else if (dmux->dma_pool_perms)
> +               dev_warn(dev, "Leaving restricted DMA pool assigned to re=
mote\n");
>  }
>
>  static const struct dev_pm_ops bam_dmux_pm_ops =3D {
>
> --
> 2.34.1
>

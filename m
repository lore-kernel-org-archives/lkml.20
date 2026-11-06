Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793953787;
	b=34DvoqZ1athyd3t07Pxkwhl2YiEOVtGKzDuWXfU1fHnyH4hHVIkfIVBuZCph3npSJNfj
	 caHxSfsqE0M40JLvXoa+GeWS5n4/WpitocdU+A9cX7ZSqOuGSB+wLWmaCB0+/1PZMauL7
	 qRLJahUV0MTbYX+eeu5ljytcByJIo/vBiaePtGMCObTEXVegfbO0AihWZ0ubEWJpWDPHD
	 GYq95YMKkCEXxWuTShsQkQjL5r5P7Qd5EwjU+wyrPe9A+XJjfMH4K5wsVgE4fmLrR2k7o
	 aNLWzXl2pkyCXjoQCFusvLrsn1L6mM5bJORK1tmxxIH1k2tpyd25nF0jJIsdoYkrnvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lspgAlthnYrGZRuATPSodRZmgQPnRZvVXdKijz0s08A=;
	b=pibt3pu/Xg4/YZoC0wI4Kv1gV+bWvpwDKbOvBFA6Ld+ogklE40Rj1Yny47Uev73eRCMY
	 D351ZfTqXvDu3dCuwCW0cLfwXRllYWQzI1r/sUE451CLUq1zVOJjMnJ9zr29pZ0yHVyuY
	 1T37dYl7BM/kG8gU76YWmPHjevH2U2kKAeZ4Tlzt0IhPwoPw2utMxQ+lNdlSMfjsJdw1u
	 FZEoaDfT/aa/C5QGV/hyiPlmxjO8Z7a0+vAoeUWwqrRzvmJEgFvaPLA4hixkbzk/g7c2V
	 H2xCCPkVoi2PB4TTWfwSGy29AXrhe/OwbfFflzD3puhrCty9IWoPbr8QdPJJs4mEIvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYER0q9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iz9BIzeV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB041606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB041606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYER0q9D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iz9BIzeV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RKGw1679586
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lspgAlthnYrGZRuATPSodRZmgQPnRZvVXdKijz0s08A=; b=DYER0q9DHK4x32lG
	j47YlBq8wRYrTIPacttoJN6NEvlevERicqCDHlNKMar7aRkHGolJwH4pPqP/BbAO
	8B2lfOvX/9TYh1K2bAi+KNy+6712GoEvjGbz2Cm5MH+n5bj1tt4pY/8Gin5JtBCw
	2Z5JCIz528EpHwlZ1XcETihKJTitV09a2IV/Xj7tjpXwxjA3yn1/dTMCQv997UhG
	hMMi+p4ugi7FGqdpuch0u1yOPDoIsiX8MuvaA0Va6llV9b+nUoGPep/MFs2IG4UZ
	eAnDErx8GH17xONW9MUAaDzdpHWBjQz/+MqwevxCOolj7nmrJIy1am4LtD441V4I
	ibA/Mw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc9v6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:29:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb0610cb9so2327016d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953785; cv=none;
        d=google.com; s=arc-20260327;
        b=c6tprK6GH2cVbUQNV/nSsEONx27Pa0KfBLaFyrRHgX0RvFQRSDE3JHedXOmv3Hq398
         YNAw0+s+qvpesRTdoF13nnUxhM2NlUFYNF26fptVrkXCiG/iVjh8U13hBTJlTMQl1vYD
         1pemo7HhF6d3bbt1fp2LLHdK4rV18oMDUeiNOPH3AnNJHOzEI2CRe1ruPwFjQq7Fu6iW
         /j9ov6WMmnSLC2UqsvYL1uSuBtNt+4k95dY8aPq9RCdpLAgLKgAPnM2V6Wu+TQ2TamCx
         nYYPb16Wv+PMldXybqoYqgUKlO6CdiyPdaBGmpL7gbs8ZwH+swDMfrGoe7jmHa/JN4Tq
         9xXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lspgAlthnYrGZRuATPSodRZmgQPnRZvVXdKijz0s08A=;
        fh=3+uHqND62KJzwTsG+2ZnL7kd54r+etOq1gJIFmYZ6Xg=;
        b=XAkKe5m3RQUN8ln1jB3OLh2VIHN1U1yqmdPLyvkQBYb88/nTYHkoK0jZy8NJUGaQo1
         yfxaKIFH3aDO2rKF1rf89AGV0Uz0AWji5+m/gMXUuY1Z8uFtpsS0faVmt+uLQgnPoYkB
         arLbPbXbBvzC0yCLmpyZcoV4L+muk9Y0ZtCWWhjurHnEouGwW47TSWOMlMHgjuc4g1Y3
         huYIqx0t0WXCMmqmKsyeib6GwWQM/GVobVeve9SMVQUNIN39xcKpTHWcDwd72pPz2mLF
         y7Zxhtf1mgEhBImAyFNAJ4a4fmAg4ToAXbXBrjyUyNp1iMUEUtDvq7ZvzJ4/K/UEZMv1
         o6Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953785; x=1794558585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lspgAlthnYrGZRuATPSodRZmgQPnRZvVXdKijz0s08A=;
        b=iz9BIzeVPFYY/BS28BcpiaCvJpug+uTScw5iutcHS7Y/yxxDB2iel1BFOAyv/u5MmO
         R9GJ4dy/I3Fv8hdXEEqFj/sPBmuzUG6X/7TmsnEH/TsPSZ3UGmRiXZ3S/G3xCUz7ZRrN
         WP+NPmNxS3Ok2uN6CfkXfauDgD2QfcXcDWVSvRZSisMTsDfXP64F4hYcz14VIeqSVdoL
         0x9hQjodqdjSUM18V/lQmVhubCG0YcTpuHshJ8KUkEdQbD54HKDy6ri3Ta8GmGQGidfz
         YKkHZBQVhYqUYTgE9OkbbbJWHJAZDRto+6cIEH+OVAy8xvym313+x2a9zABblQi0x3wR
         9HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953785; x=1794558585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lspgAlthnYrGZRuATPSodRZmgQPnRZvVXdKijz0s08A=;
        b=kcLFuMrqJ3Pc+FfIzJSYSJY1DwH+QjBDmwimyAX7hAlnih4QrWslRDvWAb1sRQIEBt
         5PwIkNso6etvAJ13Q3BgAPRcVDZ0fwhLuwB2z8rg35grVxGq72cPtLKPU0EYu6TPtgKg
         gkHVfDwWc8g7vQuBb+b4do3vl9pK8Ol+8DnKruEaHJSp0ROO8x3836NKac7cYBd1sVsi
         D1fUaIIznxafa08XL3y9ksnVCfmUEehIlnFXrvEfhm0uRk6YcLnYclVtuU3M1T0U7X2q
         ZUYoWwUnyYEPCwBs9gm7cAJ9cZVcBh0CyH8T6swKQSfnhzL4Y9g8io3NTcoRDjSSvnwW
         668g==
X-Forwarded-Encrypted: i=1; AKwUvBwxgpX3zWaRvvIaa+uh2jSfykekKaxxbpMEaQotgQwlwt10+j3P8c08jRhEaWglyXABsF6V69GSg4aNSHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RFarfygqd0PTKzlZYcwsJHwgmSY4BSpnyEBiuNwFK82AV7IDR
	msxJ8dwpChZL9ZQ1mzXvrGc8tBuTCLdkK2LHLa1JYS/WdibwTzbVFJAFyBxikEJfkGy4NsuqVxS
	PqQcD8h+FNXOk/+t5FqV16gu/SyO0VFqvGETbyIfjYfiA9Ho9+HthyiQmYug2w6ArylEBM8q40r
	xiOnaWCgPXhFw6qouXC8MWVBh+o1Db6eXdc1zkX1aAIQ==
X-Gm-Gg: AYBFou1qxI4mjRfqtflWNberkYRSLHPh7mbocELXKdy3t362iEQvWkD5hZN7wWgIpoG
	RpjFkD2Av2rrI30z07HqkR6B/CgCU3/Q0X8PDOPfp8M5fSpHnQfUNyyiTrtQFNuAsYUcBHQa0fu
	7/wNMWBP4Nf2B9Y7kmthbmnWmh1td9KRLnR0raICho0848Qg01AWxoaMbB3atpOipul3U1JxVm0
	Fd3F8jPwrCpwVMeV1YyFFHxM9YpVhUzjLIth9m5l9et5UGm1IhQO+U9MUoleudlNklzU2b9fKE=
X-Received: by 2002:a05:620a:880c:b0:93e:e2ec:3bf with SMTP id af79cd13be357-945f35fa8c9mr219199485a.78.1793953784824;
        Fri, 06 Nov 2026 00:29:44 -0800 (PST)
X-Received: by 2002:a05:620a:880c:b0:93e:e2ec:3bf with SMTP id
 af79cd13be357-945f35fa8c9mr219196785a.78.1793953784241; Fri, 06 Nov 2026
 00:29:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
 <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
 <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com> <187f3c63-5550-4a42-892e-ea660247edc9@oss.qualcomm.com>
In-Reply-To: <187f3c63-5550-4a42-892e-ea660247edc9@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 09:29:33 +0100
X-Gm-Features: AclHuK9KmFIa5I3DVvqSENpdtNvDH4nBFYKazxwXUK50NM0qGLd1RiVXrz7dc0k
Message-ID: <CAFEp6-2nSM6zgyrgxwP=qrE3K7aXk9cSZmhdY2F9N4Zq8SV4Kw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
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
X-Proofpoint-ORIG-GUID: TDZxB8x8R-s7ssZLV3h-XuCEl6KNaSYL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX6GMTEM9n0L8y
 B2dIU1/03haz6/CP9QE+S1sUymQ7gOOtbVOIi1tAEM73JGxINSnjqUQ2iLznueqhnI+Tb5A5auk
 LkpNbJn1gZSG83QCU3NxKQs/kVtv2ZX299tFPzM+00ZpPdH9f3AUndsmLQrUM/oJMtwW2nNH5Pg
 /StqIFA4jKWFjXQyR1FFWQ5/C7/xusUcrpqZMX1V8YaWkuxTMgFJOlP4M4nxGBpa3v3ovNNuTRg
 ChKsOxoQHmbzaR0uEbCcuLaVGm2g7M31tZi/flxcRqvGe5AGrrPTxVUF0QXoqFsXXdFI93gYyA3
 mjWkicDMfP9vz9jgFoRq6geiIZUYUIJK/k9/dsujGPbXXv59L9WSAPWjp8xbRy7kf7CJfaMRN4b
 99UKifU7JEfkOBPPrAIiQsx67/AKBtvp8pQDxVllaN78Ur6QKw/ikFTqMzYqWTsNmCjW/MZvzY4
 ijACC2SbGaNdbtSWsqA==
X-Proofpoint-GUID: TDZxB8x8R-s7ssZLV3h-XuCEl6KNaSYL
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed8ffa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=LdAwe3Csj4YLtlX2H0sA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXwV0SeqvfTZ7s
 oSjN1GpPidUAQBcJ6LNH/6CaUijZCauOHdRcfl6KYVE+Z9eO9PFTFDThdpQ77xwBV/KE50Fuffm
 XH602DdbbhnamdpCVxtg7qHE8tSDwYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

On Fri, Nov 6, 2026 at 5:36=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
>
> On 05-11-2026 07:51 pm, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 11:42=E2=80=AFAM Vishnu Santhosh
> > <vishnu.santhosh@oss.qualcomm.com> wrote:
> >> Some Qualcomm SoCs, such as Shikra, run the modem in a separate securi=
ty
> >> domain with restricted access to system memory. BAM-DMUX DMA mappings
> >> and BAM descriptor FIFOs must therefore be constrained to a designated
> >> memory region that can be shared with the modem. Accesses outside that
> >> region can trigger an XPU violation.
> >>
> >> When qcom,vmid is present, require a restricted DMA pool and assign th=
e
> >> entire pool to both the local and remote execution environments before
> >> requesting the DMA channels.
> >>
> >> This ensures that BAM-DMUX mappings are within the assigned region. Wh=
en
> >> the BAM DMA controller references the same pool, its descriptor FIFOs
> >> are covered by the assignment as well.
> >>
> >> Track the assigned execution environments explicitly and reclaim the
> >> pool for the local environment after DMA channels and mappings are
> >> released during remove or probe error cleanup. Skip the reclaim and
> >> leave the pool assigned if the remote side still holds its power vote,
> >> since it may still access the pool.
> >>
> >> Fail probing when restricted DMA pool support is unavailable, when the
> >> VMID property is malformed, when memory-region is missing, or when the
> >> restricted DMA pool is not attached to the device.
> >>
> >> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> >> ---
> >>   drivers/net/wwan/Kconfig         |   1 +
> >>   drivers/net/wwan/qcom_bam_dmux.c | 108 +++++++++++++++++++++++++++++=
+++++++++-
> >>   2 files changed, 107 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> >> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c5623161526969814=
0187ca3141dfe48dbf 100644
> >> --- a/drivers/net/wwan/Kconfig
> >> +++ b/drivers/net/wwan/Kconfig
> >> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
> >>   config QCOM_BAM_DMUX
> >>          tristate "Qualcomm BAM-DMUX WWAN network driver"
> >>          depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_T=
EST
> >> +       select QCOM_SCM
> >>          help
> >>            The BAM Data Multiplexer provides access to the network dat=
a channels
> >>            of modems integrated into many older Qualcomm SoCs, e.g. Qu=
alcomm
> >> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_=
bam_dmux.c
> >> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e898=
37f296ee13c0c31c9b 100644
> >> --- a/drivers/net/wwan/qcom_bam_dmux.c
> >> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> >> @@ -9,14 +9,17 @@
> >>   #include <linux/completion.h>
> >>   #include <linux/dma-mapping.h>
> >>   #include <linux/dmaengine.h>
> >> +#include <linux/firmware/qcom/qcom_scm.h>
> >>   #include <linux/if_arp.h>
> >>   #include <linux/interrupt.h>
> >>   #include <linux/module.h>
> >>   #include <linux/netdevice.h>
> >> +#include <linux/of_reserved_mem.h>
> >>   #include <linux/platform_device.h>
> >>   #include <linux/pm_runtime.h>
> >>   #include <linux/soc/qcom/smem_state.h>
> >>   #include <linux/spinlock.h>
> >> +#include <linux/swiotlb.h>
> >>   #include <linux/wait.h>
> >>   #include <linux/workqueue.h>
> >>   #include <net/pkt_sched.h>
> >> @@ -75,6 +78,9 @@ struct bam_dmux {
> >>          struct completion pc_ack_completion;
> >>
> >>          struct dma_chan *rx, *tx;
> >> +       phys_addr_t dma_pool_base;
> >> +       size_t dma_pool_size;
> >> +       u64 dma_pool_perms;
> >>          struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
> >>          struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
> >>          spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> >> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume=
(struct device *dev)
> >>          return 0;
> >>   }
> >>
> >> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> >> +{
> >> +       struct device *dev =3D dmux->dev;
> >> +       struct device_node *rmem_np;
> >> +       struct reserved_mem *rmem;
> >> +       struct qcom_scm_vmperm dst[2];
> >> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> >> +       u32 vmid;
> >> +       int ret;
> >> +
> >> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> >> +               return 0;
> >> +
> >> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid)=
;
> >> +       if (ret)
> >> +               return dev_err_probe(dev, ret, "Failed to read qcom,vm=
id\n");
> >> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(=
u64))
> >> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid =
%u\n", vmid);
> >> +
> >> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> >> +               return dev_err_probe(dev, -EOPNOTSUPP,
> >> +                                    "qcom,vmid requires DMA_RESTRICTE=
D_POOL\n");
> >> +
> >> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", 0)=
;
> >> +       if (!rmem_np)
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                            "qcom,vmid requires memor=
y-region\n");
> >> +
> >> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> >> +       of_node_put(rmem_np);
> >> +       if (!rmem)
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                            "Failed to look up restri=
cted DMA pool\n");
> >> +
> >> +       if (!is_swiotlb_for_alloc(dev))
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                    "Restricted DMA pool not attached=
\n");
> >> +
> >> +       if (!qcom_scm_is_available())
> >> +               return -EPROBE_DEFER;
> >> +
> >> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> >> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> >> +       dst[1].vmid =3D vmid;
> >> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> >> +
> >> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
> >> +                                 ARRAY_SIZE(dst));
> >> +       if (ret)
> >> +               return dev_err_probe(dev, ret,
> >> +                                    "SCM assign restricted DMA pool f=
ailed\n");
> >> +
> >> +       dmux->dma_pool_base =3D rmem->base;
> >> +       dmux->dma_pool_size =3D rmem->size;
> >> +       /* Track the destination VMIDs explicitly for the reclaim oper=
ation. */
> >> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL=
(vmid);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> >> +{
> >> +       struct qcom_scm_vmperm hlos =3D {
> >> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> >> +               .perm =3D QCOM_SCM_PERM_RW,
> >> +       };
> >> +       u64 src =3D dmux->dma_pool_perms;
> >> +       int ret;
> >> +
> >> +       if (!dmux->dma_pool_perms)
> >> +               return;
> >> +
> >> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_poo=
l_size, &src,
> >> +                                 &hlos, 1);
> >> +       if (ret) {
> >> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool fa=
iled: %d\n", ret);
> >> +               return;
> >> +       }
> >> +
> >> +       dmux->dma_pool_perms =3D 0;
> >> +}
> >> +
> >> +static void bam_dmux_remove(struct platform_device *pdev);
> >> +
> >>   static int bam_dmux_probe(struct platform_device *pdev)
> >>   {
> >>          struct device *dev =3D &pdev->dev;
> >> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device =
*pdev)
> >>                                       "Failed to get pc-ack state\n");
> >>          dmux->pc_ack_mask =3D BIT(bit);
> >>
> >> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>          init_waitqueue_head(&dmux->pc_wait);
> >>          init_completion(&dmux->pc_ack_completion);
> >>          complete_all(&dmux->pc_ack_completion);
> >> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device =
*pdev)
> >>
> >>          ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LIN=
E_LEVEL,
> >>                                      &dmux->pc_state);
> >> -       if (ret)
> >> -               goto err_disable_pm;
> >> +       if (ret) {
> >> +               /* The PC IRQ may already have powered up the RX path =
*/
> >> +               bam_dmux_remove(pdev);
> > it's still unclear in the comment and commit message why we can't go
> > with err_disable_pm?
>
> Agreed. I plan to update the comment in the next revision to:
>
> /*
>   * The PC IRQ is already enabled and may have powered up the RX
>   * path. Use the full remove() teardown so that RX DMA is stopped
>   * before the pool is reclaimed.
>   */
>
> and add to the commit message:
>
> If probe fails after the PC IRQ has been requested, clean up through
> bam_dmux_remove(), since the IRQ may already have powered up the RX
> path, which must be torn down before the pool is reclaimed.
>
> Does this look fine to you?

That looks good, yes. Also, could this be avoided by requesting the
IRQ with IRQF_NO_AUTOEN and only enabling it at the end of the probe
sequence?

>
>
> Vishnu
>
> >
> >> +               return ret;
> >> +       }
> >>
> >>          /* Check if remote finished initialization before us */
> >>          if (dmux->pc_state) {
> >> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *=
pdev)
> >>   err_disable_pm:
> >>          pm_runtime_disable(dev);
> >>          pm_runtime_dont_use_autosuspend(dev);
> >> +       bam_dmux_reclaim_dma_pool(dmux);
> >>          return ret;
> >>   }
> >>
> >> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_devic=
e *pdev)
> >>          disable_irq(dmux->pc_irq);
> >>          bam_dmux_power_off(dmux);
> >>          bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> >> +
> >> +       /* The remote side may still access the pool if it holds its p=
ower vote */
> >> +       if (!dmux->pc_state)
> >> +               bam_dmux_reclaim_dma_pool(dmux);
> >> +       else if (dmux->dma_pool_perms)
> >> +               dev_warn(dev, "Leaving restricted DMA pool assigned to=
 remote\n");
> >>   }
> >>
> >>   static const struct dev_pm_ops bam_dmux_pm_ops =3D {
> >>
> >> --
> >> 2.34.1
> >>

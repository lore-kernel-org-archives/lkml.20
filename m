Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840220;
	b=cAgbqjPXOqde/G0q5lY0XBuKqHMAQLycLIlPZiXS+U6688sl1PV+Sap87tCGtvfqXZWa
	 qhuNLWwok/GsVlX2FMNsY2qUD51T3qOJMkTT4QzZ8R9QTE/hAKxF0/s/9hPXA8jcQln9j
	 GabHSDT8+GvfYzcraffo5+mOgczUUQgyUtL2cCEyqQG6ZQAixMsH3bk5iRMy4fwJeYyRK
	 2kFrWkdoGfK68BxAEY9ambxfFhG5aoqE1yCSmBx09kPcAiqhf+25VrLD8GMPLelNGNgw3
	 M6Z9R90le7xJPnjOQbCuOba9pqUz6ZBya4a4kMmft9JECstX3UizZCtO3jinoDasm4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
	b=L2YBiQ2H/QjPLdQdaMClIYFniSWjeOETLxWj+cUIIK4Mj71ETmq4inKvVKEqM6k3rSUX
	 U1Qj6m/oJPOed4mdk1uUyOUvJ6oU5sGd3UyJslIdBdFm/S7XNdFXap+KkXBu6c7Cj5enX
	 djI6Rbm+REompNXlWeEYbJn4IBDsNpaPT/nfCMHtftdJ7CznZqr3gCPvjPTUOcPYb2Qo/
	 d7esFNKZaAq2o/YTp8MtBOewIOBfMoSRGTOh1RbD/AM43mF5iY4aTzHUiXT+yCKE8vOsd
	 SQvfLhrS3IbYb4w5RDyh8wlzLcCR/PLfAkCR1Uu1keuSNpdo65lWushzNaYT3dWAUpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcs576ze;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H3hBU68/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC9E606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC9E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dcs576ze;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H3hBU68/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrSpZ1727178
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=; b=dcs576zeWpW3JA3/
	SlVKvLItkT0pqWkX77JFcr2tcQAXVweAUhWj8LoQl6+xca+c/zmji7RBc9kOgxES
	053l/EMoqXaGMJVU1Ak0niIXOi/dRTa1dIXm9QcELtvHcRZ1ta6AKfCaVHcf+PKU
	JXDmWVvJUmt8wIuUF2lSNeRu6tu3veJ0afhDCyJPbryAnWG0SEMiBFFiLcFGQcSN
	nP5+fhLbTex6HRRR2DwXBOkejJcAlXXMmGBHGK8bd9aqhRrJbozbsOiiQsvys5qj
	suCD4mXCcbuxxQ38znCPzEoEP/4Ah9m8fUTCSDhZiIXpfDMZkzC1Ciq1RJBKSHVw
	c1yJRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgyex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:43:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso174711185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840217; cv=none;
        d=google.com; s=arc-20260327;
        b=FQdj4NwIybWK2vzU8z/NqTPEgVZPx17BkFHkqZpMAK7/gUVwQoX/UmjE/HsOQREFz5
         DpCrl722Ivcg9V1wrfJ2/gRrRqZgyd0Q24L7kL6AOnTg5Yhn3KCF9GHL72r7/RdkGXPJ
         SkoW9teifRLHuLAqFO7oAeXd+39jMPTRm7BRo/oeXTrSUd0nTGyPDoKiOjZmhq1fixZx
         pNbXn0EhNuYK+nyTppekEghUQt7ezc7T74CZPBoevR8DQ6qE5QsoV2C7cBUdv7G0DY1Z
         VvNVvJLL2WieaN3mdlMemvAv3lTB1hX4lDso8PrUt/rtPjljd1mOYT4hoQ4F1GB9j4ST
         r1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
        fh=Rsj8TSo9yEU8IMgnggdwmo1RlrKcBQVhGivANEoPos4=;
        b=aNkhYTq7qPa2ap8HApeya4iT7j1Q0urrop6ji6OKzIHpKgZHsC6LJ9v0OOD+Bp8ljc
         YmwdsEt3tBlreiGBY60Altr9qXHhbEnrtpEQVquuWDZskAY9otYcfP6fw2DIqzXUwFSa
         bAaVBG+A8zjRzhaEQh0Z3Fw+ln4oQKGK+mnGylH2zytfrcBhWbUPpGxWP4rQfyNZx858
         qMJRp4OKWMbWZtZ1QhPeanx/S6mA2eKiGDI0G8O19kgIW9sDKCOH8Aw8+4KDSxzogv1t
         GQDrpWD/OWR6e0wXo7tWJM8cKr5Pc83AU4Sk2wk5ix+ytV7JeCGZLj3IUyyKba3R61K0
         /Q4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794840217; x=1795445017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
        b=H3hBU68/gDEvjiYayDkl0LV0r2r88ykPrkZra/QfzF2lSNqqROY18wtt1PBxVlDCSC
         EXSRsGBkkRR3vUbEcefTgSiPFKy+Gk8w4TNuBkqr7NzL6kXJFW9QBhhVQDxPt9TFGoIo
         iUk6nOpy13+9TZd4H86ft64RdDQZc0D5e/Sne4WBJfCkXdxksSNDB+365zyWtNEJJEwc
         UHsVPPGtUvUpYo7qdUqhzSEoTVge5SIcghXbFv0Tdb28dAAqul0JlYrCKbF8AqZUv4gh
         rSvMUPvw6YZ+jQHkpfZYCw0WF2PiIpjvzqoItial1IWJ7yTpB8dZO6h8/RQcPuyWPHBJ
         fWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840217; x=1795445017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99tPBASnMsQoEEem09X2b+vCWXJSKFkDcYEJLVq5QQw=;
        b=t6u7d2M0Wa43c+keaFNlNPhEmMjfnpNTUGdI1zZBc7cDouoPnNszdyC4kGUarurT9O
         TJKjStBYNNHUnIkmftQD9ucJSXrk0gib26Hy45w6ym3+Qis1OYDqo4/mMjPwvHlvV/fK
         R8S8HJEKFpqAE+vsK7b28baMttxlncHq5OHRNcgZkyPxEZYsDokM6JUtqSXtXhyZR4Dl
         rYDJ0nuHS6gTt++PeKtmK7oMg+hB9A1n0JJ0rrisgybtyMQmmhPioWWC0XIP9uj2K+7j
         AN3oX6E1BGQOkZehS1mH7dNdIx3zhDxOHaNgb85EXK7bw517iJCv16gNiC76eFQpRI6K
         0rYQ==
X-Forwarded-Encrypted: i=1; AL+hErGXb64dJSLZS6bzOiq23/3V8QqBx4yxHNolq5BfOTtYFGKxVDhMxZpS0wPLI+i4btzB+3Lcov6q5vUXkio=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E0CSQwoR6JsfEWqMCEkDXVlwNlIGoFEyXTMtHMwbc9f0uh17F
	w0WPEAqXHVFj5TgNtiBfV5FfQUXkZ9K20HCojHINPxz0WSHP03hSPMcGGd0StYoJiQTxdyCvbzF
	Z2QoB/1Cp4HaGfdhg0miA8t/+gpKySpdSAK0dyItrsWagLp61DA2vAfAW+zsR6jpcJD8POkrKX6
	EnqxvKCDVtYgu90U6PVqLKI76fHXg55rmJk0F6pzLEOQ==
X-Gm-Gg: AYBFou0LFI78jLeJiJMdKuQJXYBm3YMowtiW2PIA65g0bBSrsouDvrEwWzNz41W8JpY
	V5uWgtnOhc70PBHc+OkoSUbAv3oc+g7ATWW/EZjluG8PuEw/KAcofkK1e3OG/TiH4ftdH5XjAm9
	oznZakBofuGQca9HHFhMYLN0tvcc/U75NB3BUi7JKJH+xbBzdVDaPOhFk+C2LBze54W49GXoq/C
	WQzbD4x868ciSFGMukhjDMba9yvuW0so2aQRv232l7neOT+dn/HtH+hxvtGtpBUHCKXL4jNtyg=
X-Received: by 2002:a05:620a:272a:b0:949:6e15:e1d7 with SMTP id af79cd13be357-9496e15eb4emr987960385a.25.1794840217244;
        Mon, 16 Nov 2026 06:43:37 -0800 (PST)
X-Received: by 2002:a05:620a:272a:b0:949:6e15:e1d7 with SMTP id
 af79cd13be357-9496e15eb4emr987954285a.25.1794840216706; Mon, 16 Nov 2026
 06:43:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
 <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:43:25 +0100
X-Gm-Features: AclHuK_Bk8XOrKfHomMF_JkgHrazKz6XRclBUvJ6QaoKb1UyXuL6aLCAmjha43E
Message-ID: <CAFEp6-0tj2Jnd6EBpLVVsCvt3kTOP61vMuNMV-fmyh0WCu2fJQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
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
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb169a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=0Mq51QQeXCmcnqE6Af0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XGtvYcQ8ADjJJMK9RxZf4iAzfku2Cb5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfX4zieJo2OZqnk
 FEK/SBD0H3Wfha7684V40Pgb1tas5qytZf6mgAceO1kN0QoXUtqoeFZXnw+vtuss9N37T2QbAxn
 1vT+pLnnuY3pO1IFLSO8sOnV3AVPao9d7lMV+rVoDuYHgmnBF3MstaQB87Px6yE+yixnmk+gQ41
 vvUipPrPU6HQYZPm4xH3hH47qKr5/mJqDLED34yN6f5RC5809B95AdsdotldkrLuZXafa9/Isos
 UGJoTcQf3ZuChu9JvFHkJVQSqelQ3TKdfbTDpdoa7uZE30eH+bksjXa4NJxmgHUq6wmTkvthDPR
 BIDk3L7Qtr1hXxgQEDOQSOmVRzc+ng7o/vgaWjEWuTjbTllhap+48A+Z33GOln9u5ibW5KZB4Zt
 LLgqHa2lqBqT9dWWb8vNdJTnoMyxnwKU30iWzov7HgIg2K+hlOBadHdW5h9YVvOoXigawYF6WPG
 4EItdxknlasjGp91Plw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfX3yuL8RgxmwLY
 JNtHURPQ5W9n3ESCA1+W74yiyD1ppspFMHiV+ULMZ5kJlCJbr7juKX/rSchlQqch0Ql1fKMQCgS
 3YcKAosgEN3yGMJgFJeXx8gt3FSaRV0=
X-Proofpoint-GUID: XGtvYcQ8ADjJJMK9RxZf4iAzfku2Cb5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160058

On Thu, Nov 12, 2026 at 10:14=E2=80=AFAM Vishnu Santhosh
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
> Request the PC IRQ with IRQF_NO_AUTOEN and enable it only at the end of
> probe, so the probe error path cannot race with RX power-up.
>
> Fail probing when restricted DMA pool support is unavailable, when the
> VMID property is malformed, when memory-region is missing, or when the
> restricted DMA pool is not attached to the device.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wwan/Kconfig         |   1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 103 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 103 insertions(+), 1 deletion(-)
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
> index 1479f8362e04e4a5f60219922dea3540921de13d..04f3d46d4c3f3e18cd5313a40=
7b8096d04dd857f 100644
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
> @@ -760,6 +766,88 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
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
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -794,6 +882,10 @@ static int bam_dmux_probe(struct platform_device *pd=
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
> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>                 goto err_disable_pm;
>
>         ret =3D devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dm=
ux_pc_irq,
> -                                       IRQF_ONESHOT, NULL, dmux);
> +                                       IRQF_ONESHOT | IRQF_NO_AUTOEN, NU=
LL, dmux);
>         if (ret)
>                 goto err_disable_pm;
>
> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *p=
dev)
>                         bam_dmux_power_off(dmux);
>         }
>
> +       enable_irq(dmux->pc_irq);
> +
>         return 0;
>
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -877,6 +972,12 @@ static void bam_dmux_remove(struct platform_device *=
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

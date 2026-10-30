Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357993;
	b=4A2Ypjeap/owAYUIDPGJmo3Rg3ZMrf8/0beR3tLYlX3DnqUv2fU6jDojPbEV056bXUXn
	 JrolCxeZTcN2vhPFP0RZZ6e04XkAk2t8JFFa+iXQHc55cmoUr2G2/WTiovxsZ/HDfxVDe
	 i8096SxFxU47v0UjoNjsUC3s0nxuXTRdqQmNKs5iiyOBlsTvS7KZTAw43yfqsYwGc1Mzl
	 0RQTYMAPrNUgTyQ+Ylqtnq5co9U96UjeMUwsw4zJ0Vw+d84UnG6a0EVq/tjP9sJiKxbrC
	 UheKI1N1svR1vdEoYb06vl7VLAR7Ml+3fndjDsWgUsKt+fARZIq6RxUEmSFlzxU2PVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vDOT/HhgUHlU3MjW8x4oJxTOedSxk+uzqpn5UVeZzvw=;
	b=E4VqGebFLQK7wy+jGgKpXy2gjp1rnwJa30JwHel88Ls65jCsIqWWokeT1v8MOMfk4pWy
	 HhXiac/rv+eLkqHV6Vxc6JW8rbYRr+nGQqjjBttWtqmpSoCucxFcHlwkzOBnhOuUkafOH
	 C2mp42+RaYECNTets6NeHs+3gJNeA/vY9+mxmmnIpe+RH41GIRrnIoraJuXz+Cz/8rJMV
	 uDU1+oiehFnNqUZbfq9sDu6imnTWd29HEINdFdUjOoQ5ym7IUHR9oHu8+KthkZRIt+wB+
	 hkFxf/11JqrvvP4vZrCK3jNdpEYMI7OcQivx06lmgI+2t9uNnN5nLwSR2kk4slAPN2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiZbw3Iz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPvqMUXH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C30A606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C30A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiZbw3Iz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPvqMUXH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F5QD1120769
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDOT/HhgUHlU3MjW8x4oJxTOedSxk+uzqpn5UVeZzvw=; b=fiZbw3Iz2WVzNyiL
	/M2RUyBdusck7Lux5DYqrcxzaHj/uIZ2SfnlUQ3x37efH7UaRhxFCiMKKqBSefBK
	n7MfyvAT8G5bWUbskRgoz9VjgVk8lU9IRkCnPwDtmydCno4pmJ1y2xLJRbFuWfNk
	i1uzkPSKpOP0uAOCUhobWrU0WiuIjDEiPnu3AzczA4ngNEuscVMMmFjLvU5V/if2
	dqIrn4QxNTsOSrNHAO2oBpV1baQCMsoiV+B0ZiedKB0Dkfrmq9Ku4wizyACfCJuR
	PA1n5GjLd7MYerUpASZi/ZRacUk5IzpHDNf0k54p1HibIMW9jdtNVfkX6VPNlKWV
	3oZ99A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjjp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e987ec84afso6127945ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357991; cv=none;
        d=google.com; s=arc-20260327;
        b=o4FOlQapg0PbS837TfOVI4J6lYJULf8/M8YeWsCP3nGSt5fI0JNAoWpbCyGftSuXjy
         go5M/+vYfeNOOtNlTVVZ43rRzlB4tNOp0XrUyQgtNIohkid9x31upAOr0cGFL2O5vSng
         h/lSlI/ge2hVSEl2Jrp86rfkqe3ZbijaXnbSRPoAY9XZDvjW5/5qxtKGbObJOES+cPyv
         q5GF2r6+z4uLJg3uJxWp4RkOQbq86HukDnupROHULPcGBTB9gTBTzZ4H24bzSVfxmWIt
         RuXgQm8B8gJzRd0a3zVQLNKl4mklzbhpNujEMvdoKPA/+OHg1ScVWGZaMegW4xFIOaNV
         lo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDOT/HhgUHlU3MjW8x4oJxTOedSxk+uzqpn5UVeZzvw=;
        fh=8TD6q0bncz21bH5dJMUpvta4OgC2V1+LZZG5ae5mmpk=;
        b=gEBufXVjvcsS0ZQmeibqeFuCWbmifaFQF9HDmZTqxaAV8Xs7eLi/oYxw5M6rkhaJmL
         /UXD03/+7bGK2FbLpfmSqvSRlzMm0OyxnUTQraIStIVv1oQdGIMYogahY4gUywqunpbN
         m7y57u4yZRfpP8gW+zMxsgyidQciU9QoldkBnaS0626miUEEjlhvuoI0kiyQPiVLf51q
         UWLaylK/yMkRbXeYQLR7juwC54DD0IedNFNyKHA6A0Ow6nD341Idfij8mQetqvBfdmLy
         ShZoZCKUfJq/SDlETlM4G0OMBeJm4+cLp2J6yO4moOExuC/f3xrCO6TN3fZZi3Gc+3bF
         W6CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357991; x=1793962791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vDOT/HhgUHlU3MjW8x4oJxTOedSxk+uzqpn5UVeZzvw=;
        b=YPvqMUXHdb8aPsannhpl64ZG5AkzK6DDgrvV8I0GT0j/wpltd8KaSAmcQNVoJitj6P
         K9Q8738trmpUYPAX9rtQJNYGficFAR60/bTZRyA0j8X+DT6C2PtdP6ikG2n3u2pGqS/g
         ZCSTHAbSDLws7AuCQcJ1xMlpsFKeg/cm8Hd3odO6rlZIR1dwlGjV3ilF3XmXUtlnswa4
         tpjRNotkmd3SZJuoj0CjmBokTgprUcuSZGOEOdk8urO+V6uneQnFcj/MpZyAISallfUd
         /VVEfD4MOYb1A8/WGugt+L5/vYL3XIibeAOPfUPgldcR1NPBQXNNXBgEJitU0OYKoP+6
         fR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357991; x=1793962791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDOT/HhgUHlU3MjW8x4oJxTOedSxk+uzqpn5UVeZzvw=;
        b=lQFqaG+YJeqgNLlzP/cLWR7F9w4+cXFzGRyl4YE0zXrFWWVdBuJjlUEjoeW9E3EB5S
         gE1nkxzqH7s3NWT7eZ0i8eZqwI3OKVyEWmaV5KYY4G8+CCgqjLjUWqfgvt5UZkh85p12
         2KFBKBGqb5iLrJ3Ie3QVIvxP5YlAkFC1McgXd4N/atT7uH15XCGsrDb1NC4SX1KCFODN
         tZc/zfcPp3AWSVw7OEbjhBLJuGgEp4ZvFUegTC5mXLTor5+ig4PS5Owhk4+lLOmlTHGs
         zufiDA4w0m/fKen+Eij0FtVYHUIv8pk3180u/uMgmS1PypEssw03kbxX2D8HONiF4ONw
         OjtA==
X-Forwarded-Encrypted: i=1; AKwUvBzwNcg/ES3mV8o0yTF5/ueWvTBMLbXqftkaODCVEzUjsIbgsfaADqL+hhrhFh9iK1uMCMyKMB3iZaU4cQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKz93p923Fb2INB+V5fKnyPr6o69rAP6H1lEwD2J+LCQFx2Z96d
	48PfHHAUNOEjZFmmJJmsyw6SPVZq+J0e429HgP1han7lAkmnECfLJSaNrXYd8WPwM/Ir5zPjSfc
	v1VnuAaOjAYtXVeUIXuf9mxlr4rfBdTq04kcAYTYTZ1IjaxMWnAQturTQIFq3SMxaJ7VWwWRHT5
	BQeDO/0jl0oVbeWkcBQlto29HCT8xJRKQlM4kW2OH1WQ==
X-Gm-Gg: AYBFou2Isjiivh8/Pp5K+X2MaiR6xaHNhKv9FAb1UnQWV9wl/Yqp59jydAMIhxN10mx
	dKH5OrvinmXUX42986uInqfQ9IpnskGMYKF2vHJjhWeyTFvF+iPgYmsN2IlHvpYb23rQFoZr47a
	LfjKLRsIEhkiuMFkJ0RIyoCX7vE3ucDufgtXB8QFlK7Om8DnQFhReNfjR1Fw==
X-Received: by 2002:a17:902:ef02:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb36395e9dmr20826065ad.5.1793357991335;
        Fri, 30 Oct 2026 03:59:51 -0700 (PDT)
X-Received: by 2002:a17:902:ef02:b0:2e9:5714:6087 with SMTP id
 d9443c01a7336-2eb36395e9dmr20825935ad.5.1793357990908; Fri, 30 Oct 2026
 03:59:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009084604.385664-1-jerrysteve1101@gmail.com>
In-Reply-To: <20261009084604.385664-1-jerrysteve1101@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:38 +0100
X-Gm-Features: AclHuK-45tf3ThWkqdvsO5mUJq1nqk2GuMnJ2AywcP9iKz-UYyoXJpN2C39r6JM
Message-ID: <CAPx+jO_+XJvyQUMepJLs476BSyfme8gorvoA8Moo0MHduXuJaA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-dwcmshc: downgrade HS200/HS400 clock-reduce
 message to dev_dbg
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX4YgXDxZuxfUz
 Lyz/6X1VQmhXDyXOgziZ7HnAmeaBmcjV61tGta7mr/gNhNICf2OfHt5auUI8zotcFlYXFXpz2a/
 uN5b0mV2I0/On7QZazq6Sj5VmgB6VXMUVynvcSxii+xzZ5sHkVUFLHX81I62WTPHaHGXAOioFqy
 Eo0uo4bfUXzeXB0UDScJEJWQMcnEzorEWhKJfVbLE1rgnNsYJ8eYKXaRZ5jfkAq42thy2KlMpuC
 AVC9yLWjreKYdpfIOSU3xxJcKDC3OiTnkXdQnltp8SNhfLR95JcVuaNuMg3LaGmL+CDVsTocrpy
 YNDSCiLY1kaQV2GuwsbZE9X+AKAaMxIhT9J4Q4UEXHjVZKgQyLte/HvQAPnJ8F4TaoB2nC3RGy/
 FWE7Db6Seadqq/cDsVFmUSejQddg/5cO5yS92DE9JONnSW9f3s5vyjZN1Qt3zn0VuP56wMk43rm
 ebNiBI+ImIDd9yDAfXw==
X-Proofpoint-ORIG-GUID: SzrZz-boIBMvBrjkP1ClnJohsZs82EmY
X-Proofpoint-GUID: SzrZz-boIBMvBrjkP1ClnJohsZs82EmY
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae478a8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=hkP90TJc7pLw8sFzWZEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX/s/pvalGTilT
 QPmfBVnVeFpo8BjCVWfwf/hoJ7ME27N8VhRHX+aOsspYv5BFnDTOZOPEV3ofDem4X4qqfvwf+QI
 byh8fpb111mNKn98xFZAJ79KGRkvvEI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Fri, Oct 9, 2026 at 10:46=E2=80=AFAM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> dwcmshc_rk3568_set_clock() refuses to lower the bus clock below 52 MHz
> when the eMMC is in HS200/HS400 mode, since those modes require a
> minimum 52 MHz bus clock.  This is expected behaviour, but it is
> currently reported at dev_err level and therefore fires on every boot
> and on every suspend/resume cycle, cluttering the kernel log.
>
> Demote the message to dev_dbg so it stays out of the default log while
> remaining available via dynamic debug.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci=
-of-dwcmshc.c
> index c688f3eaf468..b4fb1c1e6d99 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -790,7 +790,7 @@ static void dwcmshc_rk3568_set_clock(struct sdhci_hos=
t *host, unsigned int clock
>         if (clock <=3D 52000000) {
>                 if (host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS200 ||
>                     host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400) {
> -                       dev_err(mmc_dev(host->mmc),
> +                       dev_dbg(mmc_dev(host->mmc),
>                                 "Can't reduce the clock below 52MHz in HS=
200/HS400 mode");
>                         goto enable_clk;
>                 }
> --
> 2.56.0
>

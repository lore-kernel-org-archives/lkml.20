Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794317576;
	b=aaWMhb+4S5GDMuie7GXwX+LCzQs0CFDCpO9uX094vHkALfP4d0emKe/mZSuj1wU/aDwY
	 TvRSRl4+85zRJI0D4/vTYyJSrXJEDnhRNHOGiNF9Q1RyWe05mo/yuKNQL3GkvvKEXM2Qc
	 HyzHOYBNEkH0VogF5OwujSz45A8p7LqdpWnPIm4JXEjzWAoe2KMmidnR+q91xibueYVHj
	 jtL/qasKjvb3ZLkfRVXf8DIcudwmn055hXgeiCC8ymBTZOm7YdNnMmkQCxLNwjFBo0JVJ
	 BGhKeYIMe6JKaRLpM7t6erltFHc+cmKN0gPYdLzF1290fBh2xeymNaBf95YsB2dzjXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
	b=PKHJcxfVDqoVEkY5KA87lzpR3ewTVGRv1Y09HM/zU55b+fpyGvheVed3HmQnazEFG2ne
	 74YeLj7aOYh9JJ0cWi7zqoxlZHXUOunHsvsLw2az+9rKH6NJet7IDDym5jnf7RuKJ4WGc
	 o2yhzI9veepxZxWulG3eLttIXARuKGKbHZRJzD8PyLAyMJdy0fgA9Zr/N9eELYYEtmLV+
	 rBdUJ7buBt7EhFuWOpfi/IKrM7nNYNyySlo4NyU+Wc537+IEaNKqGEOBqTktKNVv9BnDX
	 6KQGe7aeFpHm6QRFIr2uAuKxys0cbKOWLkONV5iRZIJjrdsqo2Qk0g2wtr2sluXewgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iuDAJXJ8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kcQRF/Tq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4720606A7C1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4720606A7C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iuDAJXJ8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcQRF/Tq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFwO3178183
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=; b=iuDAJXJ8ws2c8/K2
	9/o3QwBAzIrsi8dKAitTKKwMebOCcGsdncMrYeleUcLsB5j/j/rgFl0IO8SVhh1c
	0sqUwqtdGa+Y0kO7rCpBuFWHEqHeKMzEQ9u7irbHB7QEIyUXRrDCkZLjBfHvtTWp
	qmSAP3EjY3nc1/DUMsjVLTggzBiW2vNBIq5Gl/8PEMWNF5oLWkm//dElZKDsn8ad
	kykVh3RoE/ai7o6uZoxYUzi64iqxzi4/+QvTT9cKqom+ahvKRxgkh3OPWee3d60C
	/mMy9MCtEJfafT1UXMQfxk/xh/tvNubKFkJeXTRTGkXpDILoxRVCkqhf3CXw29pm
	Z3UFuA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufs06y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:32:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso20396155ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317574; cv=none;
        d=google.com; s=arc-20260327;
        b=YjOT0KtrfPmgyYoGBreA2dnJ+x36X0eQbkwqqXoG9ao2x3VK0Nd0TE7QsyKqZ+xp3M
         oZGo/l1BVmHnNQffF00t5AcBjQFbBLBCTjYSsTa/6xuKIHFDzrDykTZlwGJ+OO9HB6Ze
         XrEAVdsHUHSv4HbPGaImsjLpFrvQhHp3+TSWGBK+oM+vnQKqADPnPtwRg0gAAe32F8fI
         24fWmf1lBPVGn8uxKUVCbt1qpBWgIaRuHbrvn0D6cdj5Bodqeul2cG7Nli1bH2/a//x0
         +gc4qoANyfM8kN7LM/lJva4JCarXpTHTw4hWDoW+tUDkLGUlJzs/rTqTSOTf/L5sWiha
         Bbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
        fh=nW+f+5MaWdt1d8UQAv9Vto61coVTTIZdpxLI1l+ESIA=;
        b=m29GsECE2AJI+reD65ah7h04NsrtgoOj0TfIesgdevbLFtFd8ed2vQCPhdqfDZjhVI
         aVbJJrmprPkJQlQe0qR6AolfjQ7SdFvmeYAVNxVb5bdLh+NvUJ0sMFz9HSyc5s0Abp/R
         ynfGt/Q86ylMW81IaWSkPFEftrm8+Wa1zbBoY7kuwEIs4QQrztyg3cj8D8yS8fWrnUXC
         BIPT2ZdlNmcGlY7eVdLRZm9osuKF+OGHN/UeQsEJHGYcaU/rVmea2u0+c9wPEpdy9p9u
         aRbGRZEDg3TgGrd4s//KlIogD6edMGnhAq1Ep5CJubQEx3q8mBQIo/7fYAw1uzkbwkkl
         SYLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794317574; x=1794922374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
        b=kcQRF/Tqt39wKKnhc/DX9C2F9JhOeCW6ZsV5msBKJhlfxjFJ80eZr9H8x6oMVya/vB
         so3OL6w4JfZ3AZeyc8DzzgPFodx1hdArhpVnZk+AlMV5g/sLkChzSffCbpHK15cI50wD
         SMhEWOb55f+5wH5K2xVWTzeQKygfVUDgcszO2gK4cAzcTEU7IasV9QFgnv1zK017BejM
         uSNgyFtxBeEaeugfZ+CUXkesgj6JIoLZHTzH6W3icIvC9uC4F9uXb/hK28PJnPY1PCkk
         /fdxNbPpDSVjd6iCHAnMVKgRKplvth4wtIP2EXANSlsCqgUH0t4rg6nikMGiQ95MY0G+
         rn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317574; x=1794922374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Z5YcW7xlIzzHsxLmHKjmX9pKRKSjf8ynNvjp0PPJ5A=;
        b=LAmi73/dX8X+5lKHtWCVZoeFvoxVmhzqxRNtNUePZ994zKeq66jFhqNWXtCBCYEI/Y
         BTgFoLWJ620mqNT1KOMdZINgD1un/D1ELKJlCyfgkh99qiiX4QY6lCuxf9ORGtzuRn1h
         spU7W14lNcIjQUKhADh0HmN5mbTktpuNKhGwpusbODPb5zqIa3+qBqeWzo9k+0qo4O1Z
         //Orv9FzF75k2tgMn7X6d0YAoKhJ7TYltjS6j0KmHB2yMe9uhFSHK5pvfNJkLnF9JNtE
         aObfBTC3HH3l8vVNPOLjMlqvNa6vdoGYQSC51keqgbQtntU93CMVV3maCFB7V3v+ks2G
         qq8w==
X-Forwarded-Encrypted: i=1; AL+hErEY3jgiseljJKwbKaOo18qXQll81I5eYYFxKpLBdHCUAy9m/EYAM8Q2VjjjQj3fzJFC+KD0d9QGDhsqB50=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tKlGp4YleSJ+djRJdndTpbt9tAWotmurFP3oA2nAeCH8qdsaj
	Xg1J15fJLFogCe7Sbm25nMSJ2do7nEiWvGLMc5U4+gUhNRTvraKNPNIPhaCLX8Wc8L8ML8tx6Rg
	dNv9kI6+7acnyU96zbouBVEs3YtAvUyG98SAmJWVN0LFzn6ZA2/j4irRH8tVsCvltfvcDCp+Vf/
	TV9dhXLdvoQ8zQsIstwLpFHjS5HNhXPaxQ5Nug5mfFfQ==
X-Gm-Gg: AYBFou053Je8DV3iRzbWJO328hygtcS/y9nJPpoRpSk/Ybav/yxynsFgWsG/j6R0wby
	nXxwzm5S8CF89Ptj1iMdmeFVPstVldVmlE81UAXv0+59m8QwHTEiGgbxbESZY/ZRBQdxMf8b1Zo
	CvsTKoRG22vHvuyHo3D1dxMFCrFQAV9cGPo/akH+59F7ck2ij7WcE5kEVeAw==
X-Received: by 2002:a17:902:da85:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2edb9162f6bmr24070645ad.24.1794317574310;
        Tue, 10 Nov 2026 05:32:54 -0800 (PST)
X-Received: by 2002:a17:902:da85:b0:2dd:ad73:5b68 with SMTP id
 d9443c01a7336-2edb9162f6bmr24070525ad.24.1794317573847; Tue, 10 Nov 2026
 05:32:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030215427.488298-1-marex@nabladev.com>
In-Reply-To: <20261030215427.488298-1-marex@nabladev.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:32:42 +0100
X-Gm-Features: AclHuK9cSqFPuGhIfXjvW3xjTIABdJvSnxFQcMIeO9HCW1ENUGZJbxffDIA9Fdc
Message-ID: <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Marek Vasut <marex@nabladev.com>
Cc: linux-mmc@vger.kernel.org,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, kernel@dh-electronics.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 2qnm3_g7kq_-S9RuDp6ddaaikopeSpX0
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af31d07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=p-LfKV-GAAAA:8 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=zk4-lHRcAAAA:8 a=JfrnYn6hAAAA:8 a=phlkwaE_AAAA:8
 a=T00PcwSzXyzIdGW_Uc8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=97BuGM4RKn6GwmfqMd6i:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=7cv85riZL9-k45RWW8P6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-ORIG-GUID: 2qnm3_g7kq_-S9RuDp6ddaaikopeSpX0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX2wYlKOnP0HsF
 LMiviVDhKBge5mUJaP9V1Ay17mgM/AgpC5/YwCM/3lwav/ho1fE7mwg02+lD9bZRPwYURXeZqtl
 DnBjsyEBWnK1J04LvV0TEztH8EnipCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX6g3igDIXmS2e
 mygbVvX7J3/hZp4f+zEN8HS0d8IUZVcJ349rxChqcYIPcWAN5GZn+C4XqkPibfJjQb6Qp/nl5pG
 RIT4mWamLgoarfou/cbcT61BZIlIAxLqtNcrxcGIGudMlip9QqoPbIyR7UX6a6BAK1/lvWgkWdk
 KxiQMRIIw87UdCLm3V3p3zXJ7lPnEDVqqFcNCCXigaEdNhSuT+8++vAFfxFoL2F6Sc4e3I1rdKn
 p2jh3kZ+gDrzruc4TzeCkTH7OET/ATZ693fdGg2QT0EwHLav/dlsiD8kLzi2xP7fsEob8GDkqBi
 YXrtDdeEzfysTRaB2AHbOtStOJ9PX3ohBlkfBkbKD3GFRKG+VTHrc/KBZ61Xq8KdTqZyCPEE+wp
 xId7fLf5KQyPJd1ayD5zkAmOfv8Tmm7cnH8BNWJCrUoWkEX+xwdbRmg3B2yLM5/N4IXLWjq3wZe
 D3tYSoyV0K3KpGkrF5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100053

On Fri, Oct 30, 2026 at 10:54=E2=80=AFPM Marek Vasut <marex@nabladev.com> w=
rote:
>
> From: Christophe Kerello <christophe.kerello@foss.st.com>
>
> Manage MMC POWER UP state like MMC POWER OFF state. In case of low
> power use cases, it will avoid random initialization timeout. This
> fixes a failure to switch DDR52 eMMC to 8 bit mode due to -EILSEQ
> returned from mmc_get_ext_csd() in mmc_compare_ext_csds() called
> from mmc_select_bus_width() after Standby1 suspend/resume cycle.
>
> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> Marek: Update commit message
> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_=
stm32_sdmmc.c
> index 9dc51859c2e51..659a5040729e9 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -368,7 +368,8 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host *h=
ost, unsigned int pwr)
>         if (dlyb && dlyb->ops->set_input_ck)
>                 dlyb->ops->set_input_ck(dlyb);
>
> -       if (ios.power_mode =3D=3D MMC_POWER_OFF) {
> +       if (ios.power_mode =3D=3D MMC_POWER_OFF ||
> +           ios.power_mode =3D=3D MMC_POWER_UP) {
>                 /* Only a reset could power-off sdmmc */
>                 reset_control_assert(host->rst);
>                 udelay(2);

What exactly will this reset?

Kind regards
Uffe

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318001;
	b=CQpGGtlvP4pVQuvQtH0fEsj3ndlysat0MHkSGifewxpDXLz3c74BrMQ5fehgkRTJni3Q
	 G1drIzsQengzI6uSDQfVdnEvg5MOUElghndrRmKo5dCWh+NzpLSnvJN4O9J0CeqYpQEmZ
	 jTVlEMbWu2E3f9Jl8LK6Y3VAvQSeFNVGYV0hKw5GrQ+aqclK9fJlryQriiSLHd5wkwQ9C
	 EGJIa+J5iQCZ8ZsDmtGiMSDCgOUkT+dXgrWkr5l6gO7eC2btHhjhEqcg6UffOv7mVd19S
	 R35F5PpscwDnufB+JK65ZXLPNIQAJRzmz0VbMdbxXyYguYUKjsvfNumuG+VKnJW27mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
	b=T7OziQ83mQPNZNlhy4s1yDbqf1+QdTF4Y6Hm4EyyL4rVFylRqvTv2QTn0m79e9FC/xK7
	 gb7MuD5fgPf5gu9Bly22IxuORSTN7BPiYVEIPWmkIuetaqplSa6m5qPWHLntnYGJeQ+Uu
	 F8XcOGPYmj/NXCyLMakezqgaWtit4ChpSmhvSH/jfsI3pk5sPzrYlHF/KYhBo2Nkz2B2v
	 K/CqcRxkhQCsT0mLSdZ7l01wwAkIzGKER2z1MxnpIt9y42hvY8cDuBRYqmnAdWu5ajaB7
	 REKnYkIf018cU5PUEMe/CDJFYmqbijpHitCPmEZ76D1lPJGzLXxeb839+tTsRAIr7vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0mLqlxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEBTT3ni;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8145B606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8145B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0mLqlxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEBTT3ni
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAVW83840129
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=; b=o0mLqlxoSJH4Vg+j
	xmwO9g4nHNXv/rczj6LLRRYhI8zuBowS5nt8SyRGQ0SPUTsx8d0zsE8MV9KqcoCw
	xbKZjqX7pye5oSoHGDt2R9bnFLoutzMs2bNQ06GVuZJv0Zap74CZRwLobZDA3CiN
	H0jDzriebLpxV80HVbkIElkKidp6vx4UMrI9aYBdpjx3NTstUyFC9WfmmEVbgFoE
	rlh/slodkkYFGELZgaA+bTRFCHudApaw/fKC0c1d5wUNWKNJ7vQuxP8tx/schRNJ
	W2x6aQzLEeh0M8LwOMntJ32rl2rBfy7c9semCBHWqm4acybcmQz5hWK5E/BgbX1w
	xcd+dg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg3kxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:39:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso19878055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317998; cv=none;
        d=google.com; s=arc-20260327;
        b=peVUv5pqQG6hH6CnMXUYY3pwtAoVu8m8LWEC33oJGeTe+b6R7mKT/0Dzzzx80VncUR
         M9AgtwTi9wfTFiPF3y+kuoOO1VdzXcF0jDuMVENP4EMX6FXWSweDuPoPm5lKH8iqdCM0
         hqalki6YoIUMLzxbasErnK/xtFnPVGJ+sUoGh96dZ1B4ifQTmlKt0r6I+UdHdxJdifsL
         o7Jo3/XgePm7hYk/Fd9inPu18wgdwUSHATnIsvU41ew9b0yZNFGsjgIwyRIkiNI0yTD6
         d7rMWzQNmwfwyRDmsVXnK+Sxaf94LgRAlJtPD/7vPW6nPUk+pet3OU+1CbHorMePpK/S
         VFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        fh=haTSDQIwwh+GXu4ypzMBtehsFLBW0QEyqMBDLFDjxOk=;
        b=FYnF9rck2HPCyUOzA4U39Q1zQpYXRArLq3JOAekE3kPHDOJcBK0XeFBqRcNtK5h9LE
         FpQH3HdcLJu4Unvj/9UfKRjD2NnbiSc82crCADah6uTbvDPDi3AoPmL472cOiGVkZnk2
         dqV2DRE2so+cb3OYrubntkV023hjnOt2Bwd9OMwueDagqfq9cflR2Q23R2rfu4caw++R
         hxsLkQfpplRJ4lZulqytwJlJCyuxRohAbuU5rNWxSysRl2da1alWZxSt/rmABfJCB+NR
         FdWdy5gnLThlD38TSO1Ne2YvPVLajhjS//H0Esln98jNIaxWaUia5MHjmK2wUdKJaphy
         bkZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794317998; x=1794922798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        b=AEBTT3niRxwkOvBn5PfTYHEEcXV9y8DYQTP8wphE0jO+4mXDr2ZbfkA2tvfdDnGzzh
         ZclOGEnMaeeN3UQtEfUMTLgzHclU0Tah1YM+Z0gFO2ainIiuXbOedLkYI+y5j0Kni8ej
         lc6AF7COX8bNd2bzDoTLs14dtLxBGMDsRM5i0pWSjcrR2MPWzYqYz/A8PEhTJ0c8VPGK
         8vHHFWT7e8wawGvKvPSst/FsnRdBAWG2PCp7SSMerzx5XjmfVgV8nMUAmtchlTH1I8oN
         YGDLpl++Cj2oLDZDJaX1rkDsd50jOS9ZCG0YTLWYC/hUiHoWv4Uz1zXE688NoTM9RvdB
         7fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317998; x=1794922798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg6oCc/9mKynP5F9a/znRNXHsUn30pti9r2EQTEQynM=;
        b=LYaBN/2ujXvWl3Tpit9PfSnsE1QiOvj002yCqveiTDD68KERrrFPTKGzfoH91/K+7J
         6JWuTSD768OcYAe+/EKylwNxkzMe7NNRuvSe6Kh2zkLeCwObzJzZ9HGftdtRv3vqT1BZ
         bVFviWU8kQdoPE/MUmHXGUkSoj4WpxeL1urWa4eWOl9ZFwMqq7A29UzYHhVbvyfqBmGt
         qGQwI3+/8hrA0C2NCELNyIQsY5WZJdtJe4c1o2iPkfW4JdAC9WCYEl8KO6asuXVkDY3c
         y/SsPefQUwd3pPnvTorERHFkxcg553HR59rzF4N25hdWUpn+at4nlcEP4um5p048mgeQ
         6qIg==
X-Forwarded-Encrypted: i=1; AL+hErFzR1l+LfvK2mRQ9VoivadmDK38AKLyVgIzDFTWOK7+OkOGqhV4YaCbbWuLfaIeXh8wCJeVbymddJz/NSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vEtvvf5FPJV0Bggj/vllS2764fnnSaNfYn5YvlTBwrXO3i2xP
	MYj65NrYHtsfN4R0cif4FRLCWCZxEmU4+iwejcyToI8SfvjwPzzOGZeJFB8OoICYXathB77vxrX
	cNYyCcaqeZNMxNx8hGqJYJAMx4J5UtPV1441pcYatJqy7qJkKI6zB7E7FwzmJTWsJy0iNclADZO
	zafyZDvSU7N0kIniwzUFMQMeCT2Mb/phb0aZXB9SYKGw==
X-Gm-Gg: AYBFou2vQWzxPrasgBrDCYgAmBACw0lReZ8P6OKIQuVnJhzXUUxPmwVNxtyVz87c/iA
	3c1byRbzdOQbydHhcYDMRJ99S3bWWURy862HzixWAkx1F5KqMX9MhtDoMhrveoBP5zZxLeJn+Fk
	IURDpDHf6+jj3g2LNcbrNPyAsP96xpQCohqFwkY7ZOcKEfo6zx3RVfXkypLQ==
X-Received: by 2002:a17:902:ecc7:b0:2ed:29eb:177f with SMTP id d9443c01a7336-2edb9164bf0mr23948585ad.13.1794317998171;
        Tue, 10 Nov 2026 05:39:58 -0800 (PST)
X-Received: by 2002:a17:902:ecc7:b0:2ed:29eb:177f with SMTP id
 d9443c01a7336-2edb9164bf0mr23948385ad.13.1794317997703; Tue, 10 Nov 2026
 05:39:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
 <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com>
 <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com> <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
In-Reply-To: <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:39:46 +0100
X-Gm-Features: AclHuK9Cj5Yfw2Skuhr4nlPjsEojXxiMikKw6Cl-Wxr-T9dRxocHgrBfMronDNQ
Message-ID: <CAPx+jO_oAnJFY9hodP6gxPCD2ch0=+0MNXkKoJXz=3OzeAq+iQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: HELPMEEADICE <yuanzhenpeng210@gmail.com>, linux-mmc@vger.kernel.org,
        ulfh@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXxN24So4a3fhW
 uog/n7trdjw8PyIqec27xAm+DeVMaXyjPnmo+fD7XizNHl6DwYJuqR2mQRqmL4jjWiG4B94L7me
 Cnn9ka7Vh7gsQJyguRFeMpVFwJs3evxoNZ5BPmnsEMI8wgPkZ33cUQekxEttJ/GenfmkAWvsGPk
 Xu9y511t6K9/sVBDgJgPmYczPB10n9RceM3KfZVFZh8ZPiua3bquFevLySkuAfMs4nIPkdTJ5k3
 qGvNkep+HA21VxM5je7fU4174qMJraKeb4sWw57hPtE+IWyuuvkL4N9eqRBkafPpbo92RoEKjFt
 8UVCf61oqukcsBmw8znxatKsqWVrpVcdKl2R9jRof3sYLU9YQEY4tnDQ+AOt/G+uePO5QXg+MNO
 Bynpo3f+FNdo9ydeEvxnNPa3A5vp479EcJOnJt6xiXtvgsulI1y0/16BOYaYTpFlyRMBqG47JLM
 HRZEOLrxI4ScsDkZ6Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX3FFPiVAlTbNs
 Y+Nz9auYqHQ8GoaoYlPjrKAHJZbiKAyS1DkMHI4vZWgVh2CO+jkShL/Z2FJoFBJekpGYNEefONF
 /XSnfI9535YXgS+WMQxZeTYpGDW5CV8=
X-Proofpoint-GUID: v9v5ZDF6epd_-eh96wj1Y6GzM2qab-0c
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af31eaf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=mK_AVkanAAAA:8 a=pGLkceISAAAA:8
 a=BQpyg1UmJCR0kPwaJroA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-ORIG-GUID: v9v5ZDF6epd_-eh96wj1Y6GzM2qab-0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100054

On Sun, Nov 1, 2026 at 11:52=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi,
>
> On Sun, Nov 1, 2026 at 9:55=E2=80=AFAM HELPMEEADICE <yuanzhenpeng210@gmai=
l.com> wrote:
> >
> > Hi Martin,
> >
> > Thank you again for your feedback!
> >
> > I've completed the comparison between the original driver,
> > MMC_CAP2_MERGE_CAPABLE, and the 128 KiB bounce buffer implementation
> > on my Xunlei OneCloud (Amlogic S805).
> >
> > The results show that MMC_CAP2_MERGE_CAPABLE alone does not improve
> > performance on this platform.
> >
> > Runtime instrumentation confirmed that:
> >
> > - dma_get_merge_boundary() returns 0.
> > - host->can_dma_map_merge remains 0.
> I see, so that will prevent it from doing anything.
>
> > - The block queue's max_segments remains 1.
> > - The merge-only variant behaves essentially the same as the original d=
river.
> >
> > Here are the sequential read results (MiB/s, mean of 5 runs):
> >
> >                  Baseline   Merge-only   Bounce
> >     4 KiB          11.81       12.20      13.01
> >    64 KiB          12.88       12.80      57.52
> >   128 KiB          12.97       12.80      67.68
> >     1 MiB          13.11       13.05      69.43
> >
> > The bounce buffer improves sequential read throughput by up to 5.3x
> > and sequential write throughput by up to 2.1x.
> Let's wait for Ulf's feedback in the next few days if it's something
> that should go into MMC core (either by default or opt-in) or if we
> should keep it driver specific.

I think I need to see an updated patch to see whether it makes sense
to move this to the mmc core. And even it would, we can always apply
it and make rework on top.

Kind regards
Uffe

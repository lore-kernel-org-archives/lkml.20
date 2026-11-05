Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888481;
	b=ysD/JlCXBWfBZ5MWy7GHOeLWZ2ZnM5ec4eoWEEzMvSP7uj8ps9tpYdQ6WN2lTtmx7sSE
	 psnlvikGbiJ53EYo0pQSojlLJfoiaj/qjnd+iQgD36r0Uno3eIlW915VqKOAnz458apov
	 NMb1Y3llf7XvS59858ksIqJZ/Wm4OVy/24c82eDobKYFY+L++yKRkbGQu/Lfyc9eu3TW7
	 pJnBJvRfK7g+1McrmHMrH4Cx9yZHBZnhV5hB1TAJKMky/baJaxyYaFiUEGnI/qV7n+Hq5
	 ngtnlPlL2KCHC0olFa9NUodv9OSS0lk5n7KFRMx9g/W4EdltFnfL4UWUMu77QUUENGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
	b=JhfXM4+m3SB4GBtlfPOWxRx/yB+/WyRW6yqAlEeXa9FftIC+ZNuzKkroywu7HFOuE8/l
	 nKJojoVAWKPbEaHeBN5mlGbVJgOik72SPw9ixJEQozZWJ6eUF7hD6tHWd4xzeLT1B8//c
	 RCs0rJalmD4hSLan2rINYR6FnkmasbwKQryMLSxqfa3REmEaGjLVxi+FhoogUdez380JZ
	 IB4/j3bDWMqD32s6xADcS+1oUbhSk7/xq43NYJQx9E48YoWS527RE32IO31X8eQd8kXVU
	 RUE31TcvX4nxbqMPWkOkuVaf+GdgdQ/pfZJvtV/F/YAl4IFJ4xmbxObaWOUCZxm6/Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z2e/SkPu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcM7wiul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3F606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E3F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2e/SkPu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcM7wiul
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tT2J4084601
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 14:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=; b=Z2e/SkPu7L2GS05A
	KEF0QoXLTF+tskem44qdFmcQ4m8hGZkbW8eEEabv+0D7LqbedqdXz3z8sBZUJyUh
	l0lO+fl9YewoW+UTadB2HXu0ccd+1uksr7cmPbQzkGSxPh03Cc0x3XAIlsYV3I5+
	Z1rnYjGeJ+O7KubJcNEYQo1TpQhOv+dXdaXi9uxR2lrXfZJxZKw2nt49lvwzJ7XF
	95U43Ak5fWDo385xXMLNTGpKUhJHcBvaZBvDjpc1nuU0Hn1Zb/TbEMldk2uSWI06
	tedjRzvDTuv2rAxCjaSCn2HAWbq+qXD15Djbq6x4ae07C9y0N7mlEv4jcXVAhbUF
	1+/RNw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhks3ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:19 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-540537f959fso2463964b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888478; cv=none;
        d=google.com; s=arc-20260327;
        b=Oal1GKmV387MREARRJKLkFTASTtxYMO5JYAugkSDYRDfPbcTEV1kNi0DaUBu0FR7v9
         JcUE/U4tfgSWCgAU7zGx1+pd1x161gsJuJd8E+8MIKsI7bN22fmR+ipuzx8rtGeNrt9J
         8q5ylesTQsJXwkYDLpQao7dJUAQII4a4XMZ4UM2A6vEOQW6AUrhWwaGhQQfilptTm1d/
         dimF6UgLjQjeBmvv5Q/H+/7W0TSmMAwLw/Sco4raBzmytP1znTEKbxBuGmKVRYvAqffi
         Q1So6DV0UJ5KVvPwavnQf6pQagSZRrS99WDID1zgYFehoEfrtkLt3mcJS5KwtNZYYtsm
         Q+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        fh=q1YqBofHoTC/Qm43IStw5anI00WhkUrQJ71PUn2/iGc=;
        b=BSgDRc6UO3SOIFTaL50wFIAbRstXWPA02zP5S86ESs3zW9iY6UwJwt+DycVtghl/m3
         afBa3TAFGc9UHHmceXPGYdt3c0yA7SFj9GVEGvEYlSN/9/S+fTc/NST41kCmM28UFf8s
         r+CXizVgXZKM1QrqcwGx/9EidPnRmhZNsdfZ1g4EBql2/seLXIe6jQ08bJ5AwxqZ13dS
         W64RsJzVtshRdc0Fd5iFKXaZ9pbsLvnED8x0Lf3AcKWIw2LlBmUKj3jvVLk0tBLLyCzx
         iMxDI1PbVAGG0ctWF+Fdac79hXaw1YvNYKszEgHYbTmhU9SthFQ9vWl4IwCyHs4Xepku
         7zUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793888478; x=1794493278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        b=BcM7wiulN2onL9Stej9lG3ShSmTXjIwEr4GbzZqK+vYk7ePAcOxfGc4tcXXz+EaW2S
         E0aduvygQ7VJ3apN7cyNCiMF9Ui+DSOqd72mrSXF420SSoVw7bem715gtN3uvwM+EZ9S
         0DzskTdefL5B+nrY0DrwLmYtWbqzVaK5IGkXswPhgGQ8OWMG0Xp5rHuLfrwvbNrw0Ic9
         zwwcbS94iSYB6Sis4lJxarOELI8mD6pLqQJskh/hJIh58tmG9K8qgH5zhTO+BD6vMioB
         Ei/D0RdPAE7YlRiO/4n92tFLdnTz9zlHLgqmzRB5Q1lwwN6R0nFmMUAkfVkVj1000iMT
         GZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888478; x=1794493278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        b=lJA0MZsmVb46jgkkPS94IwBDIj0i9Gf5d2BTezuc1VbG9KCmiSdoFlns8PmtwpKkBc
         LSGGdytEPOD+uDqZV1IEbqUc1AZzFi6IeLGISAUxyg/Iyr1C8gimQi3WQ9V8eHUnalIO
         19wxENXBQZer+3+rBS4Ziq3hJo3QK5mD4XZSYCByklYVUtFR6xpj2e2Qs6LSrQZcY1aD
         wJPYR2J/ydo98ZKSqTjWTzKi50eUahtA0o/GZ6yA0IJ2UxLvvMMWAzQECOJtTq+9RA+J
         BFBEZfVlgovNgidHlPyzlRA7mTlImJPHB4VpUC/HPFvqZrNMzosjBzofnyfGYY3HLJTK
         UlgA==
X-Forwarded-Encrypted: i=1; AKwUvByWJLNf18jLrmJW8fgKewLxl7Zh8shWAARapUQOsHuVtPx4g24MfmMP1xM6/h3Bwfq1hhYNCmMQfYj6RRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YlMsnB++PODs8itIZ7HyzOt5XbHUfS4joFXIX8hatUKZkBHup
	W6cDyxxp6NZyZVEaHMyvRaMP3mTLAJrad0B6bGa7Hh3OspN9a/86gwkftrvUZthn0SB4+FGxJBP
	Vn74aSKYc/F+2jRUdh+KIR4m6jZGqsIAIDv5Eg2IUKv4UVnzxE4NgzQANSbMUEj1RPiD9gdqNMe
	TrEN4n4XyYZdCy/sU3+8+MvNmH572B22lDwb6zVjNdiw==
X-Gm-Gg: AYBFou3JGSFEbDGBEz20Bhf937PEPMMhqevJ+MtDji7cf+3wWWmYAi35ZaZAci//NHm
	47dHocoi69yPULoDdYIGVYF2LMNPcMYSTtfMIUWsEybRjSy+nkUYiP8JamZ4At2xeF9YkqTO/no
	dUhJb1Uko0iJcLpS5p4FhrmY6x8oZ0ZhzoLrKhTv1UdwS/8QwZKDjENaFGmKIYgm8SWwrkbsz9Z
	v50WRyHNSqwzDiS8DZJ1zezVmgafi5HbWxlpBD1Pqkg1TU7OwmpQ/XbRceg4IO9hfH7io8zcdg=
X-Received: by 2002:a05:6808:3195:b0:531:3bcd:41a with SMTP id 5614622812f47-5640de0fcb5mr14781274b6e.59.1793888478249;
        Thu, 05 Nov 2026 06:21:18 -0800 (PST)
X-Received: by 2002:a05:6808:3195:b0:531:3bcd:41a with SMTP id
 5614622812f47-5640de0fcb5mr14781235b6e.59.1793888477697; Thu, 05 Nov 2026
 06:21:17 -0800 (PST)
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
In-Reply-To: <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:21:05 +0100
X-Gm-Features: AclHuK9os0BZqz_kwvxPBwRIVDtXjvDQwiPkF7CAbQf8APB_kH8Yh96-royZqOI
Message-ID: <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX0SPR333BOMVn
 E75yaotqqGfF2xeLmot3jviYk8G2wkA8TGQCJMLIa+o6Fq3W04YXMn4/nswqPggdQUD2VJxW8Qa
 pbSmxHKBuKak+VfUGj3SWpu7XVwuCea3d4hgS3gYxVACE6PZkjUbrPIQm44Zsu8nVU8GIzyMB40
 QOz37KIUFpulUfKR43LkVCya1TjKkb9CVKh+xpLJ1EYDEZM3m0y7q8ulkv8xOrz7NBrkEfkJUGV
 u4PKqh6iCB/8GExY46w0y/V8p95NVA0PNwzt73djbFVRR2fu3j0kiimvQlEcVYFDaBvNFG8JpM8
 NG9LS/482+xJXcLih6wWbWWj6DrywFdveYwIiGldT+mFvAeuSqKt6Vf25UV95yssQugtfAFuni/
 qWoeH211e5yWnAqqyLoXgMpJVcDwrAMrdj7e2evnAK1JZpMbgDzO5Zl15m2tbHaasmSVEyQlnt7
 2AVNMtzvmGnTe2Wc43w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX7qFQAPhp/bXY
 a2r+nKzYjPm5VW/hD0vOss/BGt1ogj03bq0WTXUUP3cZNseT13TaNLEyNFPomdyf3BTJcHrodd8
 QaIS4NNqjYmGH6lUWJojBephFVwXWEg=
X-Proofpoint-ORIG-GUID: -xYVoTJi613Fxvhgs3a2zg8oxlC3C9EH
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec90df cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=0Mq51QQeXCmcnqE6Af0A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: -xYVoTJi613Fxvhgs3a2zg8oxlC3C9EH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050057

On Thu, Nov 5, 2026 at 11:42=E2=80=AFAM Vishnu Santhosh
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
> VMID property is malformed, when memory-region is missing, or when the
> restricted DMA pool is not attached to the device.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/net/wwan/Kconfig         |   1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 108 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 107 insertions(+), 2 deletions(-)
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
> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f=
296ee13c0c31c9b 100644
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
> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
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
> +static void bam_dmux_remove(struct platform_device *pdev);
> +
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pd=
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
> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pd=
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

it's still unclear in the comment and commit message why we can't go
with err_disable_pm?

> +               return ret;
> +       }
>
>         /* Check if remote finished initialization before us */
>         if (dmux->pc_state) {
> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *=
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

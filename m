Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A5502568
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784280; cv=pass; b=jdODdn3lwt6H9L2Qn2Nsp4tOEXMDbEgUaViTOm7Nl/6+4h4pJjPrMjEyI/8Wj/GVAt2Pj1jJxqaVO9UUVOePe7yKSS1YD1ChcVluGrDBHGL8L3SRBN4lUiwipHh8ejxt4ut1HKsqFzwyDRLCv4Vkpq/zG7p2yGKlHEOb8DK2qtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784280; c=relaxed/simple;
	bh=n9fFaAGplQpnkm7Vf05iAz9kVcqoT3sPQRPD8gh+bT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unYl64FtUHWNQfi/3BgbdosokSRNLafUhNLZg/Ec+1RcEu5E73yUEtW3w6pMlDRn+MoSxMJDE4Z2YsVLgZrjtHfFHNdqNtTcGvdXfHQjnoi9HOhj4HyMGTpyJqjOxcVmQwjdUe6M8RN+9AKI8d5sBKtSS4zkDjC45lnVuSSGubM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2APh1dR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RO2rSfXm; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2APh1dR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RO2rSfXm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxkYA612259
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=; b=L2APh1dRJOerB4OL
	P1t9c2Y59+gGCoUq2l/4h21nVCaB6uiOsOnQs84z5r2jb5dQA07xYsNnISKluWxn
	7CFAtbAIXKXYSUxMLmfNC7azfgIe7g+Loec7Qk+0fFKu8dqZjJPFQWS4R9Prs2Ar
	W7y8ul3qjh3icyQuf2mIhTzslSdyt9C2IrOvNeK3ShQP7oAccAQojUDmrSmFYkUh
	iIcKFZJjrBKHkqaSn1j2Co2qBk6xUUK6nn6tKiwhEqSZuNSBPS+dQu9DelDXLWj+
	cURjdM0r1AURAAS34VgIi5K6Tr5RQCw6vetpbGX+pRIbWhWMUUsmgJukfZCOm+sI
	Ze7mBw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh81sbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:04:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso4974883a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784272; cv=none;
        d=google.com; s=arc-20260327;
        b=kg9x666MKW16DYVSU/o60jMo6AnQaQO9R6D8z48hhNm1H5UOMNkwnUmngLZAkhJf+U
         XHGVrfGzJLdCi5GvfCXQu/QEB548feHypHZJusg3a8zJOdx5cZoR4f+BnOGnh0oqinKZ
         ZoH17wBTSwy3tuUSubYJM34uHmiq4NkEmhwOrC9XousdHUmtG7P2O4psWqvUZQj8JfFS
         Gi5Bpk8TNK8In6FpXl59BnqR4SVtjMXumPwo40PZ7ASBKTIYxtRdqpO60VNrpDYKvWDh
         A3z6l5gFTr5clDyXPQCwv9yOAEbDjS+Iw+Cgen1vZ8kiw6mCUH5kY+UoshsPxLwiAwnb
         hbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        fh=6uQs7ytX52BZX6rsdPFgis/z0Vv3Nerw63L4Te44W3A=;
        b=GT01ko6kWaSo/9GHVhix+tgrWGGbO0P4BgLU4LyOm6XCy50x2PPT26ZJwCZjE10f2w
         U1FQlq330nTsuQoREyQu3ZBhYvE+sHcwbAbL46paOwQ14zXQE0lHqbGpzU7CjMv1gvjC
         +5YQ4tfGHRJpqkxaYf4WztlIA438oTF3jNtt9jwKvkJHorrHfoIKZmX8N2b8mSsizoLA
         xbIjbz0eoHmZgrnrD54DwIdq7TXv1ojJMTkJ/8XJl/z5TNd3Xz8lxA1UhHP208Tyw4S4
         XEwgYB5WWEWVJ8YzqbplNXJEuM496Ev70lnAQznn4rHRoFPAkAL9zhqm4o1IaOgCnZAM
         tCDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784272; x=1791389072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=RO2rSfXmsKWLs1sMhLdxwK8JkIH79EieW2q3q7ZeeFC58GAkgQaJQU4n+NJEUv3Fwi
         Ep+xxeE0YDTkdJlifhishOsGWO/ke3PgxnX3bDHsSYlGfnUwVTRLANTtUNXB83oAuAJb
         G9iiHBVCLkTU3Tt7yuWQ6nKj/F0+TQppHB1jNlmfQlr2v6CQGgLJZIwdwkC9lh0+78s1
         wQ16ZRhbIviafyOZfxElkMLfuCK4Zz+rfQP4gmI+eRuvGFs3PuDk3U4gUVEkIjY/dSTP
         uMyMV+WdyDpEdufrBlLqEqVnmoZs3gbjzX2ACBWVnceG7TBE4viUL5zlOBAhT9ybCmR4
         d6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784272; x=1791389072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=O+wmB2w3deiaXybMnolc50Okh0ItaKVtwbfr+3HuS/hm/YBTyGYJRmTMrXrHFgXcuz
         8TYFpTNwox66Ygqpo9hSiztEm26HGBE1rZVimCNg6vkQFxysVAd4P4OnZINDWtroUoO4
         9CN2MosPMpG4LS/Nw+sNxaYIprKlQDGUpkok7YcDhLgC9Kiptvf7BgRdmEi4dyDalLnr
         shpxyUaQcPP6RRlUl2EbXFNSBx+aKt5uhHY7r1TQlh59K/b2Iwkursz8xF164Ta6FT+/
         FzxTMsbBIgNecKfe/l/yuG2FUKfpSuIrfWuY281ugJPSplWu6Jw3K39gxjT2Y4uuW5aQ
         siRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/iREstvfh8zpd0cIL59H5VMdfp/+mVcpyDn1XuTvsLCoFZbx3XohL6EA8uMbCQEhJec36k7NyCOAH5Uo=@vger.kernel.org
X-Gm-Message-State: AFuF++mIjWKMP7VdhLh8kqDCFemArKrk81UVjPth3yO/48c3MvVrJ+t9
	IV+rhOql16EtOV9Gomby1Fi5FnDqzm2I9hmyABF583Y/k3TxsK26rbWU3WNHd/CmHmzYTi52q+h
	pV9BKHGsCDTMcA77WHjDQL8K2sX94Oxj9UIvZxfsJU5b5PMFUeOHJD6bno27ZoB5evUZ1GrTunR
	W/aup1hJCAFmq67IdHPWPiQOYaykBs+qagBPxiAqMKGQ==
X-Gm-Gg: AYBFou2Y0Yh+o3YSpajMZyGcWHGe6cGPg5cTIxPuveNtZ3JlvwT6qUZ7xhrdhZiYbbg
	58N+CgcWcnHjiwC4BVhlxCveozesJkw+JfbPvUZg0SZKJb98azuYmp1DUeLZcHyV1rRpQYjW1p7
	xFQqCzYPEHDdIvsHyqveuEwYxXVYKczlJli2KNQXtxEf7WwOntOASLVaZivw==
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3de9e8b7c77mr1829489637.57.1790784272506;
        Wed, 30 Sep 2026 09:04:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3de9e8b7c77mr1829465637.57.1790784272140; Wed, 30 Sep 2026
 09:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-9-pmazzini@gmail.com>
In-Reply-To: <20260927151016.186493-9-pmazzini@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:04:19 +0200
X-Gm-Features: AclHuK9W8iKpxeLaY0dvpEbGt-kGPjsZMSlSCjzDyfjFsqRteSj3h5zChvT9XB4
Message-ID: <CAPx+jO9aML0ABRF=j36s1HfPu405L18X6VyzppyQv_N10JPf1A@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1BGYZmKWCFDc
 Az0H8ZZzlbuubEKTI6dYA3N49xB0+RVgBQUD11x2DN/2ZpD15xtVyv7cU7PxNqvtWbNDqHyCALI
 ofN22mDvdErxcEzauC+WsKbNOeHNJBS5Zg3reFnVsSG3C39U3SU1ekh1wzT9V/OwUNWfJkuLnmm
 tLH96ioG7zZI5E30WS5QWGyUmsDtD5l31MXD0bc/PVC4DXX1U9r9YsFB9ygcxYphQESiwF8SDF+
 kxHeNJCR8Dm+O7gH7bZVr02C+IuSs9IfmV85WLTHVMivA7amYL7QVDsUX0FjKKYG2/7ROC7n/te
 26/I/0uJCm3aAiqo1hMWk/M2SGsf1F96gRTGXPV5Vod1Ij0lGialMFAVQBTL2UyMbXle8oeHRG+
 nSxW0Z0hcSbg0Z3if/hizMaVGfD/YqXSBPRLVa+sJzk5K8yBzb1d2JHqp0xsKeanoA2UrswzMs2
 PC88kj68Dj0jAgO9CdA==
X-Proofpoint-ORIG-GUID: ZIJZmxQ-xNqOnhTxJx5fSwvFZE7DuwOj
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd3311 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=kqsBenvbzo-VylAG1WUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ZIJZmxQ-xNqOnhTxJx5fSwvFZE7DuwOj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX275Rqx6RtA4z
 XsRHexO5iZjZSKTJM1BM9wDg0vkzMLxbPiXsB3M8zCbv9hRvWpp/3u02vtlK7QMcs27/yzQJoRv
 LU/hKZA0ZR6Sfkd5ZJzmOeHysCBPwHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300064

On Sun, Sep 27, 2026 at 5:12=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> Add the MMC and eMMC compatibles.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9e9610bb1eda..c2ec7151dccf 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -32,10 +32,12 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun8i-a83t-mmc
> +              - allwinner,sun8i-b288-mmc
>                - allwinner,suniv-f1c100s-mmc
>            - const: allwinner,sun7i-a20-mmc
>        - items:
>            - enum:
> +              - allwinner,sun8i-b288-emmc
>                - allwinner,sun8i-r40-emmc
>                - allwinner,sun50i-h5-emmc
>                - allwinner,sun50i-h6-emmc
> --
> 2.53.0
>

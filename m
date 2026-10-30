Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358000;
	b=5XyudCaGW1VLeUJNgFtoTGazZEBMkjrkHqwlf9U1BHJ8UOsDZ05FsVBzKIkY00WYOE7X
	 mPFxYJL82QWly0yqUyr/Mwlda+DDIWKhkdnHccWgqAiqYrZZldry7YwQbOZqXgSTD25UN
	 T4+LqGJNpi0Yz2Jg/mJsNyGkJjd8Ii5Ml8zcZPAlOeg1dmINkA1d976n0JR4A4p3weeAw
	 UVzwr/s4y3ZJJZ5xOznRp0gVNZ6F23rMWSoDT9gyOc6ikJJDKBFFSgvbTlIZqOA4C3GUL
	 eJqAIEVi8t1gKiQKTJ3u8st0OXAxiWMMosWd6dso7ywd2U++Vs+qivIbcRmEKwxciBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EcLCsoU7qX638cxDk0Jd/yubXQHRR3XeJ9m/9WOyvSs=;
	b=V4wW098ja2qnJgCaCehbMf5JOEBPbcjZJRt1EIlq2RL2LXi+Baavzi5Sxl78ZKKcwZdp
	 luSu3Rq/TTaWIFKMq58aQiEvUunP8RgzuTntW/gTT0163iqdF4Ev36bhhk/3mzTt6P30R
	 oVzgC91qqSaYROq2pwj8St5qWcl396cVdxy5TMI7jIk9mxPSN2TcBVjIImJQVBmDvCEix
	 8wWwz59m45C5ejHaEmS7aIQzzZIZPbWETY1xsIHLUUlu6mjl5nkL9ikpyC91ULqzJCYHY
	 JWWAwlAAEqKyHUzreLG+aLkSCb54a1N6f+i0DUdQKhqS2E4SOrkFkzXAEG2CyuFHxTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXhLzYuk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aesnGZtu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53935606AC37
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53935606AC37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXhLzYuk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aesnGZtu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F1Le2682857
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcLCsoU7qX638cxDk0Jd/yubXQHRR3XeJ9m/9WOyvSs=; b=ZXhLzYukr7bRodcp
	7FjdszwOLwwhhddZ5mkLRr7V2Xr0S01L9vr17r5Qo9+W92E27JW/x03551CT/Ceg
	1pUgElCaL/hPgfwfSI3bAFLLoUH9W+HFRBveyY4Tx8Voo8DYnfJPTdnurU+DrMh0
	MfRLMo3F+CMnUIAed0I/AinSC5zSTTdCrpWDtL0zg3xbGwDly4uJwFE43CE//Iiu
	tfxdV5f5nW/lGegRnzb2AoeMXrGhbLBvqYqusTOFGD6PeUm6E+TB0nMgZ/OeiUr+
	GjNBXY9J4KRBNel9CcE1p9Zeqge9VcVHf/lj9GKqJTamq2ay1OY+Z5Fl4CLPGve8
	zX/J3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjk9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:59:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso820052a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357999; cv=none;
        d=google.com; s=arc-20260327;
        b=HQzR3y9OvnV++NAYtId4Q6CqX4zfOWGGI1U/q+Ki2ONv7uZFie3Rp53aVkLkStLEa+
         RKdmFV/U5UMyBXGZ5lr4ZOGhCzCXou/RH7YfJ12SdC/As3+WHrXeUbYm3k2rYL8uHunO
         PepyNXRx0Kwx/8g1dHtawEvivswz4TncxhdOJ3rsA0oUgITwDIU3uIF5AxBJ81CD8C2o
         XzonSci+JsBIalCOT02SzLpwq8jo6pLYcbYXkBQFNqDOY/ydWsCb9JIbXva6deamKLRS
         uxc4u6D3tcALncWlL2WYXEX4QyABGEgmSzBvwXBMQyn1+3CAt1KMCbkMLPkB3xMZECiZ
         X1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EcLCsoU7qX638cxDk0Jd/yubXQHRR3XeJ9m/9WOyvSs=;
        fh=w4fjhIqXwsKpGPtcB7BYArsvvkpoZCI2mn76BtUZiDU=;
        b=sTOok3TdiRMGDCvkzsZCxlOomi7ZO84gu+olq3MD1qrCxx6UvX4+6/yJDb2A+ooENn
         kTZM6juJqwCyGYhqiIHlIFvYbb8q1Wb0j6VNZvOsxfLDM5REVH14RxyGOACYTgwHKCnl
         tny3/jklD1v/ykrplV+GaXws7H+bLVlr5hEPDsjUMI/fvGylDkV9FF8x56YNbdYVtJmE
         jW0VZ1O/WrJZ+Tr7hHA4sCvY1N2rsfrdKcfmvvA3O1B9PKZBPdJavgLCYdSgkwyNqIww
         RgbMaJyqGmIkGa2cYJ69mlUyslzUe0hD4qOm35Jxbe2D+vyjVU46j5yH5m2yAxMnCia4
         d7cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357999; x=1793962799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EcLCsoU7qX638cxDk0Jd/yubXQHRR3XeJ9m/9WOyvSs=;
        b=aesnGZtu3RqWp3zIchK+VbFOxHdOXpm2qmPJNhIABRM2KmQlPr+3PAvxFXnm0iYIIZ
         r4OOcimTQ32cHV9Qb+hLS33EZvHAol5jqLc/AldRO4hVRtda8x4flN5NIEC6mLoP+ECD
         hylyJsHhoSFdSkcS2H/Q+pNdvAn1tYQ+Jh5WyvPD/4cR/NN2ZfM+EPIejVOCHdv5EPeD
         BybHizPZr62tQb5eBMbEhOjBhX38kZSRukzEVX/JIMFMPh3iS9cP1XoGCdWrQKsSYAqu
         k/dYiCOyvpOjyelVc1EEICEQgwG0VTKyqH9JAORHSVUdrtxA+T/WEFQLpN02oKyWXGht
         C7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357999; x=1793962799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcLCsoU7qX638cxDk0Jd/yubXQHRR3XeJ9m/9WOyvSs=;
        b=x2Ll1wR8AzOOBA5OUA9axwkwjKrwqTp0TDupemdF8GvjVjnadsfgbN0fO7BhPLwGuX
         B0aqclgx068452zpcNwHYjFQznyHFY/wVtnUKbfeEmypeIArfhjoVQhOgmpE9nqYBp3n
         MudCRXs9Ke3B/RsrQruwDPSJ+2t2GxK5eL6TtvqRyrlPwqZoznQ23OYq6tRG+s2Nf04+
         75DS7hlo8SHKWBR9GCHKmU0m8BkpcK7snPXWpEpNySVUIfMt9LXpmYmaJeT38n9wxS5y
         pOww6xUGcptB+Po4q031vpoeqSpdIhRz8rllx2qgs1U5yac5agjLq/pzKayYTOPeRvOm
         yneA==
X-Forwarded-Encrypted: i=1; AKwUvBz2AHyeSopLhF0VLY/xryecE5zvXg74asCQXLkoS4Ox1DciuRiwKPX3xLRLEofhTt7pgLtp96e9A42ObPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4ZcXUDmJ+Y6d819QMdwJIK3QnqCvm7TrhpQPGU2cpw9lc7SNZ
	pmqdW3Y9L9ecnEYLNTLCZknsxmeoGwCSFPpFvsK1dKPyBAGpQaYTw+MFYWEuY5tfJbqN3e0Zdjy
	PeUe3JgTXPmZkp1DNR4T5LO6SFsQwsxY2kdt2qX/OG7bSp9YSawt7BPlspvM/tjbqz+SjL/G/F3
	gBqbaOLpR5Wv9eQe8p2ZQCf7eQc6n6+cdQNQtgqobB7w==
X-Gm-Gg: AYBFou0oJNbO5WaT5nbmfVzuwU18485KoJgX3YNCazQ9S4HWsVWBD7ygMMkUQcNin16
	LhIP+hv/GEXOSLqY1nfhg5EWlXUVrQzLxIS5LOg8S1eOJcJhoMNjv07M7hBduufsaOWy+Z5bpl/
	UvE1D0TRuMhzqq3ntKsUT6kcOKBRIHv6jPlQtKn+TnxUpgNVA9d/JIRvXi7Q==
X-Received: by 2002:a17:90b:390c:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3ae8985c4e4mr1479446a91.64.1793357998957;
        Fri, 30 Oct 2026 03:59:58 -0700 (PDT)
X-Received: by 2002:a17:90b:390c:b0:3ab:e588:c2a8 with SMTP id
 98e67ed59e1d1-3ae8985c4e4mr1479432a91.64.1793357998487; Fri, 30 Oct 2026
 03:59:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-patch-ektor5-dm8168-mmc-v1-1-2d148ca0f948@linaro.org>
In-Reply-To: <20261014-patch-ektor5-dm8168-mmc-v1-1-2d148ca0f948@linaro.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:45 +0100
X-Gm-Features: AclHuK839QpP0W8Kp5Bw8lXv87QTBV3y28VjWmXAjWXxKjbBKuJA2Nd7uXoE2uI
Message-ID: <CAPx+jO9ui40cF6yqZdEQxx8FcHfrmCtKO44GVKcjwd4FxnvbWA@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap_hsmmc: Do not log error on probe defer
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Ulf Hansson <ulfh@kernel.org>, andrew.goodbody@linaro.org,
        rouven.czerwinski@linaro.org, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: JegqkLAIXk8ZYBkcf1_DL2MJicOj2qGp
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae478af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=V6vyg7vV4w0SYrr6CqYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX3CBZJDOr2vKa
 Mdn9eZqokIUJRTyGeE+p0lGzJMqLhEMLhvH7Wl/ic7WPy9EQsDvATR+2Cd3Z5I3dqdzI1zSMlEa
 AIEsW+QJcP/AltkMaTRyz14ooao8usRudb8z9rnJPBAyq7KJkeIpDeoJUIUU0dlzrt1oLMtUROM
 ygVimvpTgaV8pKMoRqj209TnTaws4cm5U/OediUMcqAu6yAZeGHWuvSpT9E7YzKLbuwv6F1KxZj
 y5oSz3KLJtUq4GTOxq2RUI7lrcCBJBCTN7v992XNpM3fuTX7BfuEiNeemtLwWovyCg8P3E4sP9p
 1t80YoXTcvXzEP1khrkiZpKjUKEeBOox8hEoNNX/5QIVvBU4mORKcQRMu1BCUWc0TPytKCKDene
 qBPqTsYcNWzxs8R9VWSbW/01oJEWGj7sZPphFWV6nPQWFHz3Z0QA2oUpM+iEFnbunkvVlV/WQSR
 FPAoc2ur0Vnky4Ewnfw==
X-Proofpoint-ORIG-GUID: JegqkLAIXk8ZYBkcf1_DL2MJicOj2qGp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXyqutD9IrwAEs
 kDtu/dm2TrR5gxYNba6tiDVwiYFqILOr9XBvPbZg3Ubnqp77cRewE24bLuwvb8ETAkbsGMtYlNV
 c8zMAPfF1thcrxkABaBlr1YVjlkpUdM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Wed, Oct 14, 2026 at 7:44=E2=80=AFPM Ettore Chimenti
<ettore.chimenti@linaro.org> wrote:
>
> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>
> Do not print an error message to the log if the return code is
> EPROBE_DEFER by using dev_err_probe instead of dev_err.
>
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.=
c
> index de5a3b70107d..ed52adb38fd5 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1892,15 +1892,15 @@ static int omap_hsmmc_probe(struct platform_devic=
e *pdev)
>
>         host->rx_chan =3D dma_request_chan(&pdev->dev, "rx");
>         if (IS_ERR(host->rx_chan)) {
> -               dev_err(mmc_dev(host->mmc), "RX DMA channel request faile=
d\n");
>                 ret =3D PTR_ERR(host->rx_chan);
> +               dev_err_probe(mmc_dev(host->mmc), ret, "RX DMA channel re=
quest failed\n");
>                 goto err_irq;
>         }
>
>         host->tx_chan =3D dma_request_chan(&pdev->dev, "tx");
>         if (IS_ERR(host->tx_chan)) {
> -               dev_err(mmc_dev(host->mmc), "TX DMA channel request faile=
d\n");
>                 ret =3D PTR_ERR(host->tx_chan);
> +               dev_err_probe(mmc_dev(host->mmc), ret, "TX DMA channel re=
quest failed\n");
>                 goto err_irq;
>         }
>
>
> ---
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> change-id: 20261014-patch-ektor5-dm8168-mmc-138c9ab3f014
>
> Best regards,
> --
> Ettore Chimenti <ettore.chimenti@linaro.org>
>

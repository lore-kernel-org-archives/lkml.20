Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2F4E3258
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612048; cv=pass; b=Qvcd+zIwU7CmG6fF4PC+3e/HI3PpfmULluMALH2cCL3F6Grn6ZaFD4mC5xpITTE5jf2U5jUfgJ8VajMK02I+tFufS0kTQweQ0MPqwCeieAvsnorWgZpAmmWUKVW9ElCD5ra6tJFqvPfPz3CtcLI2M5GjXIS1EHI+ymYP3mr0M60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612048; c=relaxed/simple;
	bh=laB01Nm6g2O5qjF28Y4NhRz2GOkRSZ1m6qBJQS5vSWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o04Lboc3kokDeM+fut2TPMupiWJYt4ILDZQb+przuVgSayMT09N37Tjo62q5my6pJxub98Xm0wz/+NjgqsMfChRLbUXGvmcS2V3LVj43oLLkW2Ochki8olkH9xcJFgj0ZjobhUBmMvC4XHBSVveQEUbkWyitLA6tP+wIUC+ZupU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvOlzfBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5K4LTJn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvOlzfBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5K4LTJn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdrhn1908463
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLY8cueBZQsQi8RKd3F4kvLNmBHf3Rx9A20BdfszSZs=; b=dvOlzfBbD1FOz3as
	MMRh5DzcwN35T1zsbfVo8Znr1wueSLn+HGG4LPCIZbBV2UeqT1fejqDA8W9QNzqu
	g4w7BcVNNBsx6R+S6gvIN+z86hfueICiSJbM5LlBhWwW4MWQj8bM3BrfMczUpfrT
	iEFSIrt1DHDV+W7N5dnKkT7UP6oy5X7Coru9m8gnnm5i/F8cXMq5HltKwuUfFQ24
	s/YfNunJcghDb4UCWqBQl/0Q7+Z3DByg6iou7etk9Ei9qgyb5G6E8ewIFYQeAZ11
	8LmtGEO7DUa/M46UtblTzCYJxAiSrgJk8SpLTDAEVTKoYB9rHK3flOhornNOcpPT
	TEbLFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxjcgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2448685a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612039; cv=none;
        d=google.com; s=arc-20260327;
        b=rg/UVa7gpZOvY5x9DolX7p7w620ng3DUTN49HbHct3qlXNwRqxiCL4kDJ9DifrosOr
         0pnTqPBJPmWf1bYznyjKasBf8g5Bb6xQfRTUYatXnwxUiQGgWlfTr88sAR/04jSqS8qB
         bR9cm+tbu98g+FeKYhxSVgLWeXqJp91piX2MF2uCaCA0hodvC3f/NfTjI4v+VZ6tvZfG
         AUNua0mNAveymFGJq/JmiTcrx1CrmkRp8PZElaRKXgoF1ftsEiDXG6oQLGXwqsb+WPFv
         qyYpmTZ0b0p+IW6DkEY2RWEs87WSPQJG/A4a2MRQ7PrAcvAUwgGohADe0PybPcXQkDwh
         +dXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLY8cueBZQsQi8RKd3F4kvLNmBHf3Rx9A20BdfszSZs=;
        fh=Z3CnadPyVpjZyBu+sMSfvULW5Sjxa9fzDMTEYLCikmk=;
        b=PUEyBfPvkyV0gasHFBb0wCAUMSCX7EkgRfMz9U7r8ODtcr5+F0lCs5Ux3SlMjT9fIv
         HcmXb8yiNaM/QULDKidOehJm2mct/4XkGuUbKRGzwtaZK8a85nL/T6d6DYtDx5wV43y0
         Nlr+4vd/JmvDONYMl95FL2RRcZDesgynTYvHt/dkpgBV/n+YaPyOwIwBfVjFE9upeAsf
         PkTKvTvSg4hIIrP229bk/9Wt74cVJzTQbElZviR0rRYbLUmfWl9vU1FQ0fID0BkdbnOe
         m5Xh8w8C4LZIUpEPYynSgtw1GZxrl4i40m4VxUlhkQ3Zj2AQyZzDDin57DVrVN+T/gKn
         zTrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612039; x=1791216839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLY8cueBZQsQi8RKd3F4kvLNmBHf3Rx9A20BdfszSZs=;
        b=c5K4LTJnGD1DGPg0wwr11HGIM/9492ms21RHTQQFMFtggQBpOS3hNPnUKRWXgQ5x7G
         Qg8o3Di3SOKeMrjTnBUAh/qNmRFe3ZL+TFH51l8iP5864zzOQKLeQRoFEnpfjv8/4YHZ
         FLGA7+QO0uZOenh5sKUjLWe78h+jTcnjv/as7oJ36XnRtXHC5b0X3yxU1yG7N8Ts3KLa
         0nkNYXntU/1m6nRqK2rp8dZnzbN4NUvf7uZNE/pspb64j4K8sZBr+MzFmiPvjM2jLgts
         hoyLdDIsC6GXdxjm+lzmAeyXzns5dT6HRf3x18fHGuGl9mSQAnDCqCvkUWcEvoxj/o+X
         PlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612039; x=1791216839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLY8cueBZQsQi8RKd3F4kvLNmBHf3Rx9A20BdfszSZs=;
        b=F9vxfo677iUE1hu/QgVA9tEiFwVc5AWMqrZECCSa2ifP/WpBb6IIQS/jAId1zHc7zc
         qS3gvr2/XchRbT+bCUQ6NwERPIJelZBwZ5+3VtNjqabRxXPi5LqMIbAT6pafGzMTmUel
         UhqVbKRdqrZDkAjd8O+UdbX5wbqgJ+aBlszL9yj7GwYEwF3y9p2OhRpBZj28TwbNNYnY
         Bzz8xm0AoZ6XrjSkIxerspzzd1YMxAHuMYQ7fqtP1kxdC+JlUc7h1dsD7x5U/SMyJGdu
         k/zyWyRx3gzYMQxmR1tAgo7IiHhI/LTuu2CCfIv79v3YA0Ykmm4mU3oRjLw5ptYt8dJ0
         axeA==
X-Forwarded-Encrypted: i=1; AKwUvBwfwVbTgET4vTcEc8V4kAi7vdPtlINu28GxPro40ofk1kLxmTzxCTg6LEkxh5NgWuPF+tcPY+FyBIGlDJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYICvAziLoA/y4h+KA8ycXI8laoQAl4BbC8GReXC8Lrg3LvvFOMo
	fKzZcoLLdkC0lh7m3fJEoR6y84zR+4jbQIhwh94Owzn+JZVzJTrAF+zZn9r9xQ8//JuqaIvrLZh
	dPKE/jakq4rgXf9MEqHaytB8FOT4QtH1ogum/DkYGnAUCEyJmLl4E2vEwF9c1r6O5/3MCHIf9o+
	Slpqe8QaEjOxIMjad/7b6tEtbdZTPGmEOZjis8F/bObA==
X-Gm-Gg: AYBFou1kmLpxUDuVNF6r7EFku0qGAr8scxM+0xaDMIpEEDxFaGUC92okScNuWap3BcN
	jXD2z41KPzWWiHtA+BBNzZ5LgjsVYhSUI5IG+XYQkoQ/KPfXUH51ccsW0m+C8oqMpHgRks+G6aN
	LyhOaYOo0drSbWO2SjPsIc/OY/J7nUhs0e9BxwgbvMVIf2bpKB16Ya1NdRsA==
X-Received: by 2002:a17:90b:2807:b0:3a0:c621:74a with SMTP id 98e67ed59e1d1-3a0c62112dfmr7217619a91.35.1790612038786;
        Mon, 28 Sep 2026 09:13:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2807:b0:3a0:c621:74a with SMTP id
 98e67ed59e1d1-3a0c62112dfmr7217589a91.35.1790612038206; Mon, 28 Sep 2026
 09:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915155724.2468892-1-lgs201920130244@gmail.com>
In-Reply-To: <20260915155724.2468892-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:45 +0200
X-Gm-Features: AclHuK8NijbscYmEbRRTTVsCxytg6cYy0JdOJL7tcaZsXJf3cMG4wS2s8SQ8LSk
Message-ID: <CAPx+jO9duanFSkuQJ9ZrhWAAPzG2zhaYUtXaXhTVyOKDVKrS8Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: cavium: destroy slot platform devices on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Robert Richter <rric@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Pan Chuang <panchuang@vivo.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        David Daney <david.daney@cavium.com>,
        "Steven J. Hill" <Steven.Hill@cavium.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OhRp_YecjO3J4ivq_kLBTx9-0s2CASQT
X-Proofpoint-ORIG-GUID: OhRp_YecjO3J4ivq_kLBTx9-0s2CASQT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX6AR4X9Sbbc1W
 ATiu6h7+WR705ZaGRfqLRg+W/17haSk34D6DrOaJjct2t5n8uItN1PGtKt2WWJBIlRt8Dw5wNiQ
 iAunLMoBPAhlBooMPUJLqTuc/SiGkJ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXx7m6xOcBGegD
 vKYUzkA3mC5tGgvKxjIjqdTPMVrJE+JK7UTGf0pcGkkgymG4i5QMGUU3wRqqRhc80exhFb3n4UC
 scLvZaaMLrCYmu3CGfJDTUnn53dMj9E4E5h0QhPL+6qXDBevhdBUXW2LGWs1hUCTke0JD6V+3mU
 jzojzlE8QLHaglxTvjRWQwpqkzFuQ25mOQxlnMOUlb2/7EYFlSsUVWaXdw4j/YgH7n6ntf8nuvD
 RsFQqYEu5RXZxinI5bMJ3aXx2LSX3u1euPYH4fWXCmkH8syyUaoLLUGcb6YcrXjkPNWMx1mfoeL
 yBoCBbZxe/LgBAyczahaN+LJg3/KBUYQ20PPD1TOBJ0CEvCwnne4rH+h8WAcFPDL4QbmW7X39OA
 fxlTsmXjYKDbhopvU1wIjcfcAxTSCC+YkBu+BRVibL+bvKOH0s2M2zzNNI6TgCyUwmmzf8wnG9n
 /TKv4XAAVemnQaOh6qQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba9247 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=2raNofmJN35FeuP7pWwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064

On Tue, Sep 15, 2026 at 5:57=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> octeon_mmc_probe() creates host->slot_pdev[i] with
> of_platform_device_create(), while octeon_mmc_remove() does not destroy
> the child platform devices.
>
> The probe failure path removes each MMC slot and destroys its associated
> platform device, but the normal remove path only removes the MMC slot.
> As a result, the child platform devices remain registered after the
> Octeon MMC controller is removed.
>
> Destroy each slot platform device during removal after cleaning up the
> corresponding MMC slot, matching the probe failure cleanup path.
>
> This issue was found by manual code inspection.
>
> Fixes: 01d95843335c ("mmc: cavium: Add MMC support for Octeon SOCs.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe



> ---
>  drivers/mmc/host/cavium-octeon.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-o=
cteon.c
> index 1bfc1a4f9fe9..671dd1a36a74 100644
> --- a/drivers/mmc/host/cavium-octeon.c
> +++ b/drivers/mmc/host/cavium-octeon.c
> @@ -295,9 +295,12 @@ static void octeon_mmc_remove(struct platform_device=
 *pdev)
>         u64 dma_cfg;
>         int i;
>
> -       for (i =3D 0; i < CAVIUM_MAX_MMC; i++)
> +       for (i =3D 0; i < CAVIUM_MAX_MMC; i++) {
>                 if (host->slot[i])
>                         cvm_mmc_of_slot_remove(host->slot[i]);
> +               if (host->slot_pdev[i])
> +                       of_platform_device_destroy(&host->slot_pdev[i]->d=
ev, NULL);
> +       }
>
>         dma_cfg =3D readq(host->dma_base + MIO_EMM_DMA_CFG(host));
>         dma_cfg &=3D ~MIO_EMM_DMA_CFG_EN;
> --
> 2.43.0
>

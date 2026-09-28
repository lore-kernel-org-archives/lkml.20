Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961474EB861
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612043; cv=pass; b=cxR1exq7ily6xPKlSzrm6JxDkfWuTN781jzvAWXtAZ9e9GvGf0siDIxBPtR97hJ86Pdahj8RAPXcPN+3FpnfHEj3SqEdP64W+FiOZ4DpCgQ8mHRggw0Hr1D5wtoSw78qPS0OqJHtYK/RkVmBuusbAaOrmqeBFZnsQbXSzuHUBvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612043; c=relaxed/simple;
	bh=O2sFKAuF5fVE5ExBFOL5OtEIQbF/L5JdHgY1Jitui3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIQOstVuOxP8sLFWXtuBySurKWRo05fU31kxYps1ef5QdtTI8+h1KljpGiNsZTyy9Tuh3W5QlZqI6E3meMbWqeNFsIrBV8+jrystQnqAslqZauEorqo/WZ7NLEC69SNqHfZhi7iojd6TvCbRwM4H9f5nm/woM5TJzrpq9ZAjdOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o19Zj+Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyXfxTar; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o19Zj+Wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyXfxTar"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdq4N1908415
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnfYONFNsW41daTLG7twN5DndyUQVqOidHbzZNq5TCU=; b=o19Zj+WboEj2hdUE
	d11OpV//dI27/CZdeE5WhWtVeBRlIPaP9AklCVrSatIyXPIbdgAMOHpGme1MV9ck
	QfemR7xpxU8mZMQgyESMyP61U4wjoinL/kqV/Bwn6iyDE8Mg2nbTaUynK2hpMfJq
	tF9CrhTxa8HpV8I8Gr53sQZbcjuLGm0BF4aLcEA9Yl+GdKClq8nU8bk2lA0+pwL1
	O2YGvlypV1p1pBJRVeN5LnW1M74nXlEQsXEfnYcr04xDYR5H5mS4tf1RGieN0OZH
	j/EU2XUyEJ+987dGZ6S/sbKYRN7lf5AIgA7S4jW9wXn95GbzkeONt/dePyr8LQWd
	h+v0Cg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxjcg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so3860422a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612033; cv=none;
        d=google.com; s=arc-20260327;
        b=SXrCuYqxew3tUz9rIZ0VWWH5TuCujNS9gk0SUgD/iKfOxnIPTfWj3WXI8aCji1H4g3
         16YhHpVAZfxwg1jql4AMQ0nitVrJAZXF0tNo6Vu9BZwZVrs3xfOmVyFt51Txa+4tu5Xd
         g9XHszLb1xUw6LxYA6AE0n/kBkdxnNlSt+4giWQSpqR2o4EvVlNwPKDTVM8+jGpLDrws
         ajSghzZDmgC96yZK0yGSR8oixjKPFdTcRU8JVnQaj+cBn2pqCo2aWscUsIcpi6wqHufq
         hB8Y/SObMqsAX03GbxrbxcrQwoVDgNUH506CxCFAQWJ8SofpwXZeeSJvJDrrB/mrwtCn
         d9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jnfYONFNsW41daTLG7twN5DndyUQVqOidHbzZNq5TCU=;
        fh=r8Z0IiCXCsb6SethMNnlh8kCe3b7A8pNejxaDYOa/qg=;
        b=cI7g/lm1i0cCfXaUu0/1dBGTJilkI8a4Fj+y94uvod8FgSNfyF4bAkJAok6M40b7SA
         Tfrr51F0gUQq5kOKccmaI6mWmWI7cR+RvUJnXJ5l1SIvoNrvzP/PuGT2kmf1iO0JSsKQ
         0pr9G2ROHLXVNsJ3YX65NlTACb95AHvrnjzkc6urpWyhctASi1I0H60lC0LuZoHDLAjf
         X2Uq7+yMUpWJXP69axkPIlJSYdOB1xUU2Tp3+0ef/d5dJU3HRk1Lukwhx0fZY3ibyglp
         XczYdiUNQYvaoko0XXOHKc3qprwTk/34ogIfVt4YZi2wmTnlm+QwKRa/bphccm940FFk
         CSPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612033; x=1791216833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jnfYONFNsW41daTLG7twN5DndyUQVqOidHbzZNq5TCU=;
        b=XyXfxTar+O6Ev4D2uWFEfqgfHKRMu40bvMNJOODprTY9b6kiF2JCXODKI8lr1ydDSa
         IN+8H7hbCNyEZD71ZQYlk+gWkfN/qHqX8ONatYo8yvSBPMIR85UDDW+XCtGAK2WYeQYD
         O1G++0Y2XtC//na9t+IcMzcS6svA8eUDV0a2nexCKl2hSSnw+H6SsF6c+61WEafbHSLK
         MhdbqKrrF1N8xS0U5Sfjg9BCY+jV0knha58A5kyIpj52TuIQwSppwFNRW2xkXvJE7mvn
         Yhw0X0FdvF5BeVDWpmXm3PxlziuwQQSnMP+ztU5ZxwW3vyOMA9M4riwwG295uJuCrbSr
         Fceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612033; x=1791216833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnfYONFNsW41daTLG7twN5DndyUQVqOidHbzZNq5TCU=;
        b=e+OAY5BtDtfEvFa+YpQQCiq+josKJgF+oY1Tzn241ytyzY7fLL3vdhLFZ5mlh6aNie
         ZqCif2sRVlBt0jW8Iq64OlI8YUOCbhrYJdJfb+pI01oIb8RGuEjTqEEVRT2h+psw8CcN
         YtYlpHF/b2Tphw/n1gTdPged4p4L5CffkvEoZoP7SHcxFzHQX26EZVAJVurjjXjQhGUa
         lju4lT7VMn797BodtWzEPyYZNhFXvS9Eq9z0jl/IKXI/KqrVe+h+6hyJdMUuhtd/4lce
         z9urhXxiMM7L/0VJ3OgsoxYM42CQOzWpAQhJifFV1LuK+l0S1oGtYDQ5w1Gf+WYnNllS
         RM8g==
X-Forwarded-Encrypted: i=1; AKwUvBxq/PjbDZIp2slg0JzkqddBfn5klV4LaZA9fMtA3cdZUqBKZzT+2ljRemnNNGccNR9fh182hS48OMMf5U0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi3oNT1wLIoXUkK3WYUKMVrO4IT2e2Eiwm3Q01XRBHRh2Z7n0f
	jLfGQakdvHawRBmEeNZzgy8Vt9Z/zi0Sb6oEUMoC/eZ/G1UWYDzblArpGtOrhGa2puvNrQWmxAg
	3qlInCn0YyE6RglU1zQVUjBC8Z9o25F4D+qeh1CY2RY+OhVNknakyQQqHISy+ahaJ1a/2mwkOBO
	43Hz3d4FFKoXnbxUjaIq/TkATPypo4Jwy/8Gv2XGbINw==
X-Gm-Gg: AYBFou1OxLOTwQB/c7UXAS0w2aBS+5uAg0f9ExIm4PK5OMfCGacZIFe6d96t4acnm2w
	xTi4Qme8+qNbl/HOis9HzLmCl/0hmCTn/r/DhPLWA83oR0YOcLBiqAEX/YsTBTqik7XYaA3kWQM
	xlCnCo6GsqWT8JygoDo75LYvt0/g6NPqTwx7/EW2tW/dNKXUBnNm+/ukGRSQ==
X-Received: by 2002:a17:90b:3901:b0:3a0:80d1:28c7 with SMTP id 98e67ed59e1d1-3a098d508f7mr11230398a91.62.1790612032590;
        Mon, 28 Sep 2026 09:13:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3901:b0:3a0:80d1:28c7 with SMTP id
 98e67ed59e1d1-3a098d508f7mr11230361a91.62.1790612031984; Mon, 28 Sep 2026
 09:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915161310.2477406-1-lgs201920130244@gmail.com>
In-Reply-To: <20260915161310.2477406-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:40 +0200
X-Gm-Features: AclHuK_-RQJmDvLec1TfEk7xn7z5cIpkgIWKnhqPUSU3rlslCjBnluxRdv8jcNw
Message-ID: <CAPx+jO9GY+35DSuRB1jTa7C4SQuAaoZTtJirFfykrDM-7bAmeA@mail.gmail.com>
Subject: Re: [PATCH] mmc: cavium: destroy slot platform devices on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Robert Richter <rric@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jan Glauber <jan.glauber@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _AAWEwYR26I1zMY_VbsshRCZoTCEl_UX
X-Proofpoint-ORIG-GUID: _AAWEwYR26I1zMY_VbsshRCZoTCEl_UX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXy4qnTF1nvTC+
 w/H1kSzUHgc+DNG3n8a5fEOxbXN6ySGLqG4fI95DQDQqVIGiWyBxhtLVNipZDdTnO+m53kFwFlA
 e2JoF6X0woL4BRVZzKNzempAc9FX0rc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX87OecDRP55lo
 ttHxssx2j7lhQx8gf8UW/f9fST4vKYy9x8puQkLy8tFbSP41qm8d/Lcvdh6KKrEXih6qhAdcnmK
 L1PUIt2G/Z77Uy8b8i+NwTMdezadNeZbIeAwkNQ9F1USZUMcMABOzEJrEMmgKw+ihkU6bdCCxZp
 bGLEFLZu5PmRglO2WU0fBKlDpM2DhQvD2yibjd9gKCClBDVUJXQIgvEBlSQ//dUeiN6/qtrAvgB
 yu9xjHWgfP8rhkBSs7WTPPf/tiNRogunluj1zgU+vQQySkKuyRBnxumrUSLHQ0rZG9F5dGtXFEn
 +sBXoTENrbbCaPgF9DYg92rFKLFsyWx6HHZEXaoKs3Ul9ooV0IUCElkroFSBHwdu91Rapj54yer
 pfi8MKDufCdOjs7QEZVCAoa+5EGlD4eJi3qkjy/tt+BhKTYGv8Rk3fUP57x8/KtAyPkj72iJVmG
 NzNDDPURaUbii1DixEQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba9241 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=OJTvEzr-pr90GyvokQgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064

On Tue, Sep 15, 2026 at 6:29=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> thunder_mmc_probe() creates host->slot_pdev[i] with
> of_platform_device_create(), while thunder_mmc_remove() does not destroy
> the child platform devices.
>
> The probe failure path removes each MMC slot and destroys its associated
> platform device, but the normal remove path only removes the MMC slot.
> As a result, the child platform devices remain registered after the
> ThunderX MMC controller is removed.
>
> Destroy each slot platform device during removal after cleaning up the
> corresponding MMC slot, matching the probe failure cleanup path. Keep an
> extra device reference around of_platform_device_destroy() as done in
> the existing error path.
>
> This issue was found by manual code inspection.
>
> Fixes: 166bac38c3c56 ("mmc: cavium: Add MMC PCI driver for ThunderX SOCs"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes, though by dropping the redundant calls to
get|put_device(), thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cavium-thunderx.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium=
-thunderx.c
> index 84ff6d82ae3c..c80907aaf51b 100644
> --- a/drivers/mmc/host/cavium-thunderx.c
> +++ b/drivers/mmc/host/cavium-thunderx.c
> @@ -173,9 +173,15 @@ static void thunder_mmc_remove(struct pci_dev *pdev)
>         u64 dma_cfg;
>         int i;
>
> -       for (i =3D 0; i < CAVIUM_MAX_MMC; i++)
> +       for (i =3D 0; i < CAVIUM_MAX_MMC; i++) {
>                 if (host->slot[i])
>                         cvm_mmc_of_slot_remove(host->slot[i]);
> +               if (host->slot_pdev[i]) {
> +                       get_device(&host->slot_pdev[i]->dev);
> +                       of_platform_device_destroy(&host->slot_pdev[i]->d=
ev, NULL);
> +                       put_device(&host->slot_pdev[i]->dev);
> +               }
> +       }
>
>         dma_cfg =3D readq(host->dma_base + MIO_EMM_DMA_CFG(host));
>         dma_cfg &=3D ~MIO_EMM_DMA_CFG_EN;
> --
> 2.43.0
>

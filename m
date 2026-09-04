Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218744A3FD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514913; cv=pass; b=rmZGquBsAnu6iIdsMcr09aq+5wnZgapNdYMATwsQwelPVM43xELDU5U0xUPfG8CHpRWGPsWvZ69/OZcJG5MTZpmf1MBDkunyVgVKwMPXp78K5mZ09gXYkmi6GAr9CZwYch16DqNC2wo37V0Z933ECT0OhugnbFemBvG6X8auLhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514913; c=relaxed/simple;
	bh=OwvhlOjXczwQM8RF6iBwIfWZpHB3GYOgRcW1D4QzHwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaKfKcK7/o408nJxbehk0+mLFqwCt42UEIGLp1s0apSBFQgR0pnr071ZbJPIR/s6fli1ThqV5FfH/kueA5WyIIW0SZIxjSSqvC6elNDIYXOmDLEKvtT5BLqiE6dannKccep/l3eBRn9EmRJi+9LLlAc6C7CTuhGhrZ6uWN3wPVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cwgdt3ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdgKwmKJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cwgdt3ls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdgKwmKJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847nceq3455026
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToSiV1+7MY1z7Ikbo8sLpHqhAbQ0/fiRGaaoDkNbxbs=; b=Cwgdt3lsRogaaeNz
	iaJkGKKDHJiLBE+Wju7ec6VThgHosPQuqjtKuikylPsv237qJp+G5Bt97WKWJSsU
	XKPKtW0EfKpWdVM4Sr1Tbjw3HdS5CHP1VCia2B4jqN1tGmQDtZpNxrcf359vakDt
	H+E1tTbFJeMY/iSgp1QC2USZ3DfcO8I2snx4mIvcgDHVIxKpBjSWh+dFWg9raD6W
	+nm5fTCSRimnjzXCEIMV1pQSwNQVt8DAUmVl2YxgO7RE43JG625yF1Wl1pkm/KXm
	UhVUU/fHaGyuH0xd0nkSLZe3PmDeVHTYWbv4QLliXaC7EZsE98Ipvk/nCe1Hl0WK
	wWyG9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfhc9t2jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2611256b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514908; cv=none;
        d=google.com; s=arc-20260327;
        b=GHy1EIWzJVdEgFALazcDYYld4+gUsmNsUscjoLJQx8fODDgc2B+CtEvRhb5egMrSYH
         xKj3X8Tlxfp6sihEmBh/xLoW98uPVuOfXDk7nyHlLc/9kNgZQAwtukZAOIP4QGtax1EW
         QN6x/rOcJi/5gdHBX2d+W7Nt5ipb6nX7hBCYLVc8M3GZ43wWl+foT0zFXzWrH2QFxnMQ
         2ti933I9Io23UcnPgm/3mTWSV6w6wHNJvkZQ4N+0XP2GVohn0lPo3T3KGU3ZZGTIUYvG
         gPgPy8RjOhApf3QUeTN9QbMKOQ66xfgxZyMk7TmiK5PB/H6Zl8m8zvZbt6JwqZKZ1XK0
         ccfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ToSiV1+7MY1z7Ikbo8sLpHqhAbQ0/fiRGaaoDkNbxbs=;
        fh=cbMHrk+14bazc9jcUoWS9uMowuWh8QJDLBtMhwEAriQ=;
        b=cUYVVOK6JLLgJjvnN08/TAnGt8l/l3Sqc/argLYpNoSXRCe35FCOZv6neYEKCgVhLo
         HLHLA28uAuyh6+ODXn1/8Q+AcK6rTOjaVeMU9fbRseD6wBnfjN608OcfaEXTVeZ/4joe
         jIsqeHn8ZMwQkUoKii/WIITiAHrNFifnowt3tXz7cOM4DHjsSHOqlVPH3TSoh/rrpg+V
         nGRqKGhkJq7lT6sYGXEwaRPmGxPMlJvqDC8DD6wTa5oW8d31DPqD7BEsuBrukxEPqJth
         P1XXodkkohpvo/STvzvFMnnibiSl8EpB7G/GkP6ppQanCZIz7FP1lidGiKZs78k3eXw1
         AxZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514908; x=1789119708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ToSiV1+7MY1z7Ikbo8sLpHqhAbQ0/fiRGaaoDkNbxbs=;
        b=XdgKwmKJMB8b2KLKvJe5w61F45uLBGHQJW6IB6FhRWN8uVOLPl/4d982Cm3liUp5MU
         Wu5PPBJ25/OLkxvyhhqVgeBIcYq7BfK2C9Xd30RrForSHJv3v65sATkIcnLhLYY0jkrE
         B9ShQ/CsYdhdBEe6zZCwwmKbYTuKkB/zNcsblcg6UvutlzFdhYneRhfdcHFCUy7+yi6c
         PuTyyDTUI4tO0SW3KCHZ38b7j+7iXw6+244hFzUrGDJ1EebQsPAebcKIRkIkuupx5FQE
         bbnBXHIdKkOU1pmbdcVH4vK8JEbz6Q2zJPnTMk7LSuJGgIX47hyKM/f43Ds/8lOLTgVO
         PwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514908; x=1789119708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToSiV1+7MY1z7Ikbo8sLpHqhAbQ0/fiRGaaoDkNbxbs=;
        b=Ualch61YICgZ7EI05Rvj8C3NfmXKy+XgAXIZw/bnz3yEjbDckH7OiLNPKx1Ox1J3lU
         K6d+0+MjUW5HxIHU/tqLNWnUBvuhspUCMuFF3YFWbfjveDaVCeYEjEISOkmLbIGix8mn
         fHbeuGP/jWUszwZzWBSvftwirwm6SnmKOMJzCYzg2BZ+oCe0D1XaXJGEHqPqGDMG9hU4
         faXifvh69CIQod+w1mVL+WOFt99c8Rjn32JbwuG+2JaTB1Xs3ByKsmxvtiQbsH5JnP5h
         bzRCTUjupylLPgdxl/p29EiyBljzAD5LkipvzEOZhDng0EQxTO22cddlS1Td93BoeoIr
         lm6Q==
X-Forwarded-Encrypted: i=1; AKwUvByO2fw0ixQy6PGHQNi3nmxMekAinJX6fZaBD1v+YlDvFmmjug9yIaMWKbPuvpLDwEPlUdVFu1qx7dPyRjA=@vger.kernel.org
X-Gm-Message-State: AFuF++nENJNsSBodWR1nDTixk/S/RK+P5ZLCb5FDzkBmXwdlNErOn42l
	DC9JCrjb1ujbEVW8A5yV7SjciQsai5unlhR8/akyT64K3U2b0B3GM7J3L/9Zxl0rfgYNlBHNAaB
	BNkfpJ/4HHfjv9KA3DOzBu0NXmY7jtV5dimkWrN4Kpx+YxJtiMjzwUHLKW2+LsOY9rtB+2T9EYf
	pyICVnKKBhhM0oVqJxmNz5Fr3l4skmmpHSxxhym5SXOg==
X-Gm-Gg: AYBFou3Mc2mEx6Ut1Yy1EpbouZqVxz94QT6sTbUdKbWDehfaLKNSM+nNdAWj/rDcvGG
	+TGTp6GyTAooM318Z0BFPbWWyUPWlMEkD1fRwIm8aKdo9gDJPCpSeer7080PgpOI8Tq2X/QzV6j
	WfLBuj2HQVhsJfJFXr5h7uXR95DuFwhSd8fs4KISTCZHdPS6J8Q7oXqPgkpg==
X-Received: by 2002:a05:6a21:3292:b0:3d3:aed2:6f20 with SMTP id adf61e73a8af0-3da216016b2mr11449359637.20.1788514907993;
        Fri, 04 Sep 2026 02:41:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:3292:b0:3d3:aed2:6f20 with SMTP id
 adf61e73a8af0-3da216016b2mr11449326637.20.1788514907606; Fri, 04 Sep 2026
 02:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807032654.4744-1-fanwu01@zju.edu.cn>
In-Reply-To: <20260807032654.4744-1-fanwu01@zju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:36 +0200
X-Gm-Features: AcwNN1XHSJTzWjsBXzcbHP-mMf0ZbkIiNc8q1-QyzFYKHrlJIK9-0ga-DRScoJs
Message-ID: <CAPx+jO-y_QmwAefsqKe9rTebyxcXPV=KidDKiFOXgsykksja-A@mail.gmail.com>
Subject: Re: [PATCH] mmc: mxcmmc: cancel data work and watchdog on remove
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=afdRWxot c=1 sm=1 tr=0 ts=6a9a925d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=_goTqDE6Cbb-XUK3vmYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX7iv/vBAinhSy
 eLSYEAMp5adCtXKoCBD1pfinxyKoQYN/kKA8uXof9Hg7jcpl4+HHpxlG4OIC1zbQTJmRBxGXm9J
 dIeHEJ8pUMvLeq8YqhQYOEDeehGFHYBvyCbu7qxeOgVJSDz+Rb6C9kA9MlwTf+cgLy4OIF0ECrE
 taz62JvN0IX0fAYoy9ZXjcbh7fc/y2kn1hLu7iLXpzcC89blSpY/W2rAhX8O9U538Ojz8EPJWJp
 kBkSFb8m8Sb3wqM95VH/Pmn7CM7dqNYibH9MLv5NZqQcVLi1zkk0E+fMX5ukUMX+xJWk3O5NVsp
 P9vwdEW7GJKZhRjtu8uUUbAJCfPBBhoR8uMypT/IyYRCkRO53BwkUQMKwb1iGMDP4DmOzubdmMg
 Sr1BPMp/+oZLkEKJFlfTSzHECtQt0KMgJHcCXGxpLwMBOm5ZE/1t6ar76v81fJ7u0dLQkPp7O/c
 H7g6Yjs4aYpF8uQOVZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX7d6nzt1XMTS1
 TLigZGHnCyWJOUpc/yFri0F2x3+GYu4Iu9v+0M0P4nqkcKcTFhCSC1E4U2PeXEvy6eulDZCE0LJ
 utofIBRGI0+ea3rV5/el7JqQExJqnw0=
X-Proofpoint-ORIG-GUID: GQTeo-N127qrxqpb91C2pTCRu_-PbzML
X-Proofpoint-GUID: GQTeo-N127qrxqpb91C2pTCRu_-PbzML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088

On Fri, Aug 7, 2026 at 5:26=E2=80=AFAM Fan Wu <fanwu01@zju.edu.cn> wrote:
>
> mxcmci_remove() frees the host through the devm tail, but neither it nor
> mmc_remove_host() drains the driver's own asynchronous state.
> host->watchdog, a 10 s timer armed on the DMA path in mxcmci_setup_data()=
,
> is deleted only by the DMA- and IRQ-complete paths, which the remove path
> does not explicitly drain; it can therefore fire after the host is freed
> and dereference it in mxcmci_watchdog().  host->datawork, armed from the
> IRQ handler on the PIO path, is not cancelled by the remove path either.
>
> Free the devm-registered IRQ, then cancel datawork and delete the watchdo=
g
> in mxcmci_remove(), before dma_release_channel().  Freeing the IRQ first
> keeps a trailing handler from re-arming datawork between the cancel and
> the host free.  Both callbacks are non-self-rearming.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: f6ad0a481342 ("mmc: mxcmmc: fix bug that may block a data transfer=
 forever")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mxcmmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index c405cfb8b269..097498a3f8ff 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -1173,6 +1173,10 @@ static void mxcmci_remove(struct platform_device *=
pdev)
>
>         mmc_remove_host(mmc);
>
> +       devm_free_irq(&pdev->dev, platform_get_irq(pdev, 0), host);
> +       cancel_work_sync(&host->datawork);
> +       timer_delete_sync(&host->watchdog);
> +
>         if (host->pdata && host->pdata->exit)
>                 host->pdata->exit(&pdev->dev, mmc);
>
> --
> 2.34.1

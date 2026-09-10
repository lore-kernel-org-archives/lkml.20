Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F754B4891
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056355; cv=pass; b=pQoP+HZYd0XsVMpANhR5zWhPO3Xtr5+OCdL5J0mTgJgLS0ToBkHr0tQxYsFJvTZiOTKiZvcDTdVgJofl56BRRKtLDdQbDyGB5G5lSOT7IiL+FnP6I/6BWf7kNLdz/KQNiivPP9y++UBzXAoP4f5qJavr4TV4dzjMbP+XjIm27Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056355; c=relaxed/simple;
	bh=Q4uhx4UzUQra1vjR/trzB6RCmVA5xxZuwzkYyHRjWlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqNjliH0WcaWV2puP208OIeFaFUdszW5zWZsepSGatd8PrL6qLtXYwBNxISte6vPsMzFXulcQEFxk/medowTGFR87NptC3WDPpqAERj7u0QyLHpZO5qIMVH28Z+nw9E7lZEuj9nXFXddNeGifidiBj+ldesdlj1DXQcIcxF6UBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzZeJjsh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VoGzRjnD; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzZeJjsh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VoGzRjnD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4KCh1494228
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJUaJsREfJ4f8VkOUx2mPECCsS/3Z5pmGh8xL/RsWKw=; b=nzZeJjshZKPCnAEh
	nYHKYLcgjkVW46dvdsGX9u3bcTgB7RupQO0UbcSUxguHOkRF/KOhUDv3TxcvPCRp
	7Kn1KoGb5jLzuOakFwiMgxo35ttj4F/eEoqtSiYC3ayF3rD6ZU8j5PUF0cVV3SU1
	D3fdp/9r/S8nHax/fU1pcbWmkbEnHlvBptog2N5Fv9NYFKlPW27H7xx6ISMO7u9p
	xPgVaYGRSjWBlqGYoCstUi8Rre8WsolZ+AZHn7u7znsgDjCXSpZ7V6yZ2A31X8o9
	/DRKrK5bqCSBThw/ZilgmD0H43/VuVH7ApwXfURX8SwS3MQI7Uzsx1A0TGJrkXbp
	tOF/YQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9rue9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8623e5d4279so9178456b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056351; cv=none;
        d=google.com; s=arc-20260327;
        b=bS/+SuwN2lrhUahMjdRIwvsWD1j79OkBiH9ofhcikAcSrN7iTrXiyMI1bdklVJndSa
         cz5bd6tnTjFvW7EpZ/zYL0UIa+qKkHa/7kQg/qjlH2ZMb5z0Bvez3B7wzaovsQMqkWCg
         I1JE4N/lvtsYfSHRX+OC8BgEw4uaJ8jhwMUTAQuF20HQzLjfxO9nvAynnGCUI0iSSWAd
         zV4J3qduGFY9LYnOwdFantKLiihMfzLRQHUJwPwh8vat7s24YPv1dZXXUkNEy1fydI8V
         xiHodKs1L2cIwwQq9taHNsrEKulIOVyl/8zCIRrvDq7u1zimjSovRu3dqXln/SIrtNPK
         9U7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJUaJsREfJ4f8VkOUx2mPECCsS/3Z5pmGh8xL/RsWKw=;
        fh=ZN6ux2wD9cMOUSFVb0M2fXuNIXL1svH+DTqDoetM5Eo=;
        b=E7tXJBpuuCNwQOB0PDEomWHRqCbCJ6e45jgCBktI9/iHoGPhxfhV0asz4hdccurJiU
         z77jUGatJ5JQLtWd9plbfmHyHziiHl0bYCcPSlK4adrv3F1WtGeMDKKoWe3fk1mqIYLy
         +wefqDgodhPQ16STovIUazUMiCxL6btuqG6l+o40mHNsKx4GCHqj/TrthAys1r3QXN5p
         Pxd+1Uhb267AHWSVV75+8896Onfi1vpjoY/5CQRDQ3hhFtrzLEKa3Fbl5bvPzV828wML
         qJ2iInVajNQmwODdfJbyNzNaBiPYz7egwoJxwKTIn9guWa+0ggV/9IYBBwiSF1Ih7HPQ
         nfqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056351; x=1789661151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJUaJsREfJ4f8VkOUx2mPECCsS/3Z5pmGh8xL/RsWKw=;
        b=VoGzRjnDuL89O88gpdSFxeZ6/mPehhrDIhjSme7vkDk1tN6K4xxt/cCJfeUS+C4T5I
         1adZbcW8zRdHzDj8lrlmsEi2sHlUpTQXEWhlofwNQvMEqtZjR+GKsD3NaqvrxzRjJAnR
         P3ZPBXZyvbEOvrJU2jdEe6CGeVNu7FVbrdkLUojkHnzNHa7Kub9IiqyNu9howfivISpg
         WAiEOIlJU2eH/5lrIWgTT/r0xkmEdlIek67kUo5VenhB0pvJjTvzW2/wgXatlC+o4eka
         8MVwy+kCySXO4qy52M0I+4XrbyqWB7vv62SIU5qEZ2aRM5xjy/eJGsZTgR+qefsAg/Fv
         D6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056351; x=1789661151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJUaJsREfJ4f8VkOUx2mPECCsS/3Z5pmGh8xL/RsWKw=;
        b=OdBqRkYBhX0Iw6pSrgFPqXsPly4aRvxeb8tXy15ZzCSmtP/dGv6frCf67Xqdg45Pzk
         5HHGiDPBTuFFgJ9NScxRnACUx37ml7GtWGLvGFtCbUj4owtCckJ2r/ASd+BS0MV0s+Ur
         owrGmcCvSbLS3kwD+fRYlwzQwG9PBei+qILoTqY95osop11XvYqKbFgBqiOsf0Ne8FH0
         kHCxSk3IRqesoPet3V55ME3fSkpoLP4sIn6PG0OgiJkG4pgzzYa2FmTe2GnxiuG+Mf6D
         QPOjYy6jX90YW3zjSgUsoBMn+olkbShjb/buL+dHs4cZD8xVAM7MrwYFI2bJXWqRM7Kf
         F+fw==
X-Forwarded-Encrypted: i=1; AKwUvBxyybxXxinCb6N/m7RtrKkXMHy8bruMJEIJDHqgwd8bU3p7TEFyHHsAARZvVp8n9kKQURME9scG2TqeEIg=@vger.kernel.org
X-Gm-Message-State: AFuF++nCAxAUOSvvTN4WedUbiwpmKw/F78xefPutlrlKJ4CgeHlvoQnu
	v28CLsmQTbnV3qQnP92oexwmEMxSo9mAfb75E9nXicNMOg8Jk1qUvrPrksber4+rgdLSbDH4ADh
	xRR8WllGHUk0AQA41wEFpHoGqO30+k8InyK2Grhi0jWrUKhMG/im+lxqvi4i05bsu74aWnfThub
	gsv2L2TPBZ8cgEj1iAfmQpzaXgPHd3nYr4tjFLsNVWG1iBOduOdQ==
X-Gm-Gg: AYBFou06/yNljcz6NftMVfqI7OhRslW6OJCcINXZcHrQ9cw21yJw66qmjChEfUuIv94
	Mj8JXHRRO1I/GtzfF6xBYD2DLUlJSM8zcEBEAXsSTbcOQZr1wJPxdkL+eJ2hh5hno7ier1fwvqO
	ZyvxERMdC/EEYmFr/9Pzt5VGPClarzIZx1VVh95vVGcXlg1X/ZYNuvqa7Ajw==
X-Received: by 2002:a05:6a00:6d43:b0:869:201b:7386 with SMTP id d2e1a72fcca58-869201b7831mr9247513b3a.1.1789056350336;
        Thu, 10 Sep 2026 09:05:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d43:b0:869:201b:7386 with SMTP id
 d2e1a72fcca58-869201b7831mr9247402b3a.1.1789056349581; Thu, 10 Sep 2026
 09:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_CAA125B50CDEC8BA29F4B982356549608D07@qq.com>
In-Reply-To: <tencent_CAA125B50CDEC8BA29F4B982356549608D07@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:38 +0200
X-Gm-Features: AcwNN1WvimKFb8VJFOX40v762E_cTADJwrFab3f6eIRNPA32Bu6Jw3cM_hL4OQM
Message-ID: <CAPx+jO8XTB40rAwzbtAfP9D-GvGhjnSWEcBpzjXjjNhZA0SKrw@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Fix OF node reference leak on card add failure
To: Zhu Ling <zhuling0805@qq.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX8V4zWbr1PqV6
 TAVSK9gH3Ezo0phYXaE3UZsrJBSS/UEikFB5OJDlUhWjqoPB4MSMCh9HjgkM6n34PBxCwRgQwaW
 GP6u6BuWT3VYYhtYX8eL0MkGWpDJbAXBd9oOwJnvQ1AHtDuIkJjSr9pIoLmoTnEFctVrb+a0bnb
 Ml+qbEfwotYwWLDdh+ioJBl2gMMXC6UNtmCVLuamFe0bVtLZrUyFV2wfYHNOCsaQl32UuryBCED
 Jn4MH+lJuHY69v0PSPsmnqtLc5OAaVpIP2D0LUjrWBrcFiPcCA3FCaMtvxpTTr5Sr6R5X9arF3g
 wL+2zFezu8WOV+SuLxPfAth01f2I41DXexuA0AB/hgJwvXTfF7Y4rJpf9QhtheuXYT60/Y5ZcLn
 SYehysxxRUod+YGUF94z4Y2CUHT8hfE7kKuaMqK4io8zU95/D+BAhVYKBzl/u1pZwJ8p06YEaIR
 sjiG23o7UwbXO7S+h4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX6czD1YurK16t
 7W3rDFxJRyCfUx1XFHIvp9PUvdb8VuQ00rwsAnNaPtq4cvPDYhLh2RVTaAAWrtASehdrkod/TNO
 W5ffXYM8dQNjqdPaItKk/og5edoCmoY=
X-Proofpoint-GUID: 9Fi-lTJxzvcBSFYTjPi4xYMdVuB3C9R8
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa2d55f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=dZbOZ2KzAAAA:8 a=VwQbUJbxAAAA:8
 a=bVVfCyBLFoj7s5xtQnoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9Fi-lTJxzvcBSFYTjPi4xYMdVuB3C9R8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100195

On Fri, Sep 4, 2026 at 11:08=E2=80=AFAM Zhu Ling <zhuling0805@qq.com> wrote=
:
>
> mmc_of_find_child_device() returns a device node with its reference count
> incremented. mmc_add_card() stores the reference before calling
> device_add(), while the card is marked present only after device_add()
> succeeds.
>
> If device_add() fails, the callers release the card through
> mmc_remove_card(). However, mmc_remove_card() only drops the OF node
> reference for a present card, leaking the reference on this error path.
>
> Move of_node_put() outside the present-card conditional so the reference
> is released for both registered cards and card-add failures.
>
> Fixes: 25185f3f31c9 ("mmc: Add SDIO function devicetree subnode parsing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhu Ling <zhuling0805@qq.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
> index be5cf338bdeb..92ad39c0cabc 100644
> --- a/drivers/mmc/core/bus.c
> +++ b/drivers/mmc/core/bus.c
> @@ -417,8 +417,8 @@ void mmc_remove_card(struct mmc_card *card)
>                                 mmc_hostname(card->host), card->rca);
>                 }
>                 device_del(&card->dev);
> -               of_node_put(card->dev.of_node);
>         }
> +       of_node_put(card->dev.of_node);
>
>         if (host->cqe_enabled) {
>                 host->cqe_ops->cqe_disable(host);
>

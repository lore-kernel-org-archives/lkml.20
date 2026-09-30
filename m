Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2F4D9566
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784245; cv=pass; b=A3NNM5rPBikzugI6oE7OzVhoZK4d/rlQVetP2o2RZZSxWoq2Ou3ZFaz9Yb5a3y+SdFcEBlUrO7Cf/OzmlPP0an1dGj/I2hhqgtW9lOtVF3MohdEndBKKoa3cGqN6xmL8D7YdAR/lMEhxH/OUy/lUnYNJzt/5kb2vlgIfa5U9ijs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784245; c=relaxed/simple;
	bh=a78RA6ybrZR7NF+BrKfZI8Vx0IW4EqLT0fNuQBS/hBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsNGeBxefSMJATGQN4a4bbqr1A52mH2NnfiILDm8oYJLua4SnV4UOwQIafSXCvZvTibWG4IzfOa7YV6lsqsFWM3QUdPnoEfLrX4brfficIDHflYzkgs2qkFsXHDwNinuKqARexQMRTTTU7NPK9DDkRylTURow6v6Hv0r4kgmt3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KI4nWIb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVCB+teK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KI4nWIb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVCB+teK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE02Sv3520179
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WymiD3yNl3cueL07rdFtMot6ihd5LSAKTeqfcHzjy88=; b=KI4nWIb+n0QkwONB
	mH6ZU67NzPdxltT3TRZG3miGXXFexpcYjRqJDxYqwr65dT335tvRv3VuxuhER2Qs
	Lfw06Ukzd/cIu7JzqEXLh0aksFhjH01jgl+HjNVFVoicjz90Ype9EdxWjbEkFkrW
	ErIQ3Yp7Owb6GFEu7tHE6VGyiCrABXkObaZ9z9YR3TBEw7Qz2aM7XNOA/fTPHPQ0
	m8sVxsPdTCL9UJFVWx1bPsKiHpmyoOPFmaFAbi3x278tPPDjJfA8RlyWWHBuapPw
	uFek7ph0imXB6SBK+a+weZ07BOJpIUfnw2jlKHtxCLG1rARmtsg+FRojkjex2/Ai
	SVbRfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27j969-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:03:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso2674774a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784236; cv=none;
        d=google.com; s=arc-20260327;
        b=JBpxdyJj66w/AfFACdAu+1WKYevdkK9pfR9W+51/TljKeABop6UtFFSiVI4tfXezBE
         r7cWVLtfAsGSuA+j2w2ZtzBmT0E4j3hMbIcW3dv9peOG/+hvrE/Pyui14lnFUqEIxEr4
         pjXtyrT6zs9bx3Uch1TyIPPcnvaKyJw/ID326LOxZk3uauRUsuYqRc1M3j6KB9E/hgG6
         2ySuHIXjFQbOs/ODugIoJfT4+GIQUfKl1PETX3c+rsHT2tVjjeLII6/Z2dStYTbiF+xo
         vu7nzMEzLBIlD5Xs11WIdjYcLdGRegWGoIVA1cVT6IGVzvg4UHfe+4zzLIU8hwl/PBD2
         3LOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WymiD3yNl3cueL07rdFtMot6ihd5LSAKTeqfcHzjy88=;
        fh=9BjxtKd5f4SEJMOE3nENiy+xUz8Z1cesHGpjcdQDiR8=;
        b=al6jQtakhHdh7eEsdckbNOjlP7i01fpTh+T9Dxs57Ul5YjTVGGphxi4DER+GUA5Sdn
         Mw/mXO+cJOTYRotcV7tGQhTmgamewfCyaLESL4KWNJINmTf7QGo5D3PKVYEIff07ORuo
         PWpMio71afifwL9rTXJsBL7zYHY3866XhQpebaYzu6GdDZLuPM2Px4qdht3yRK7sA3Rt
         pMeDhacROPyJm9mkDO+5lQ/75/+s6n3gucgboYIwwVpieS75OudMTg12BqD6bz20e+Lz
         GD1BvPgDY3PGQFPiioVWxLXLZ2ajJ7ivWbfCfEmYszkLzac8AoadSXfRIQQ0MEWPriwv
         cYyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784236; x=1791389036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WymiD3yNl3cueL07rdFtMot6ihd5LSAKTeqfcHzjy88=;
        b=AVCB+teK8vKyoduOvLOcWyhiyaoYVgnBtTRtCSTu8XtSn9agwdN6zf1t5uO28NEuuf
         xWCd2XwCqrupZ7HAdNyk8qts+O/pNXZa+n0CjdU3iUwN4OuHaYhT9KpCNCn3JplYbgP1
         VXdJ1RatrN9jR7cs9jPtjjpq9dzIpPAuIpUtgxChZMDCAWlYXsruFe/GmOVoo4jJgu+h
         0s4pJ3XhBy0HnVJguJwzpalpu0Be6Rj5WwYYyBzR1G6pf/p92pMYZgUC4BULVHbRzbD3
         8fQCrHUKPrFntHykxFUub3urbejZB/0E4PNRRyheWoAl2D/gbNmGIMB81FaxBOQllyGD
         hsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784236; x=1791389036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WymiD3yNl3cueL07rdFtMot6ihd5LSAKTeqfcHzjy88=;
        b=BUn3tyqvCV6kBIWB65kfvzGOnT4CdyfVdq7m1xcom1sJECISol6jes4DgFq94I5mTh
         Vwo1NxAQcedp2gRruAqCTpAs2jAITRbeuhDndd+eY9gCjGCRb/XlX4uFFqyQargYukNY
         Sa1b1lPaCkNcEKM5if5YmBvAbANTnO8yHeSVexIG6CGjTHLTPd0NlLp0Klzs39RW2wQs
         MpYAxMN3DXXped15KMsxd6sofNLxFHmANghyyyXjvWSyRXz9iiUzAPnMokPK1utM8Ubx
         W65Lwr4RCJhplLM0wbm9rtbIj8K7ype53q9Ujn8ozZo2ahuLZgsKnBr+IIeuDw21MYIA
         UTfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvEV1QNEiqu8fUlsaoXVpFRHCVq92ma5AN6zYBwwYQ+Qa9jcjIHlgXFJ/21IxILB3IgIxPyCipFu14aUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzDGU/1LXNrsu6SjH10yfkWQ8JIjtwUlRx4sWfJo1JgMlbJ65r
	NbGeZd76MCj8IBBOmcxL+fXJeBTGHQTucL/tEQRig+3obvmi1Nc04+n/ndEo42HgE72Dg0Gla9i
	PMYihu7pTHcbBYg4nTni36OHqhe4Bq6jujGtdkuDTyB7YIdPwUH8PB3bZ+Q6PyzmEYj32SAeRBf
	c4UCZ77nx7YJcy2iNzUNT39uji4QieJIPZCueumpyt0Q==
X-Gm-Gg: AYBFou2WN/BC7WOmgDTsJAYBnlrDl+AMExdX+heUMJEheRN+Zogd/FGMw68sRqk5AFA
	l2bk59vNvTaarH3BTUhlpiZkxx3RmF4Z0b2dAn7QKZpdZxykK2ijPYsoTyYGhKAikrbYGOwKZe8
	twHcDxVluPijMmZk6hbySa709BlafvVoWe/chOiY5mWmvT5jYDIEE9AYIJdg==
X-Received: by 2002:a17:90b:53cc:b0:3a0:bdcc:51b0 with SMTP id 98e67ed59e1d1-3a4f2e564b7mr39749a91.30.1790784235697;
        Wed, 30 Sep 2026 09:03:55 -0700 (PDT)
X-Received: by 2002:a17:90b:53cc:b0:3a0:bdcc:51b0 with SMTP id
 98e67ed59e1d1-3a4f2e564b7mr39739a91.30.1790784235113; Wed, 30 Sep 2026
 09:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPx+jO-FBNsZFvfep-2SpqDFm3kYA=RpcF0CZx-kj0XH2juijQ@mail.gmail.com>
 <20260930140748.15946-1-ngocthang2710.1999@gmail.com>
In-Reply-To: <20260930140748.15946-1-ngocthang2710.1999@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:03:43 +0200
X-Gm-Features: AclHuK-xZ7oay99Z8_yM7yOVWyf9lzmmI1AR6rFnO5Wqyz1vQ1Giwkkfzm_yK4k
Message-ID: <CAPx+jO_dW-yutoTwxVj1BKJPF4Ap1rwHtSgRYRCu_R6rwFtJmQ@mail.gmail.com>
Subject: Re: [PATCH] memstick: rtsx_usb_ms: complete requests after eject
 instead of dropping them
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, Raj Ojha <rajojha047@gmail.com>,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfXxmUjSbL0Fn8r
 WitnRUma/4x0nWfTw2bCsO2UtwGf90HMGKtcWmvxbcGu3Us83iNlrI+zKejqe7TFLMEqz26bZCf
 IrYKpF8H515NoIiyP3PppInO5RlaNxs=
X-Proofpoint-GUID: POolthtsJzz6hZaAHwfPuPugLHCA5xjz
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd32ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=g_HObJ3jkDPmJsE5j2AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX9zVcVDfO1WNf
 x22a54qqtfP2UW3sMmgh0CZlgTS2nZfdjY5dmG7ACp085pRfORcQDwlb4Ngh7ZBgRpUSM0D+JiQ
 pC+r0BD1KxnC6K7Bxj8+hJK86RIiJn3O9g7G35CU2gFw9sRsThuIRQOM9ErR9cdMH9BrSwnhEcy
 4xzwggrNamZnqdBn21hOTlyctFpV2kqceeitp+FhvU66gZELFhOVp60TEBQD51PRLGcjV3KEU/e
 0CxToL2R13Z5huPNFykmSRfY36oC+CzG9cAPAhlxapRsis1KwTxc1kgh6pna9O5gv0t10PfBuXt
 eblFsNAutTOAIz6Vm6qqTNwhGZfIpehBTxYDgtTchMuZBSg9Su8LqnxZ9C5iPqlr/50mC9hixdv
 wdSE4WlhDNwiesrBMrvx2OcxEQXC/IJ+cAfDC8ptYk+sF2U33ZjC3qwktMENEztZ4PUde+yluvv
 cpBvu6H6eg1Fu2ZeKQQ==
X-Proofpoint-ORIG-GUID: POolthtsJzz6hZaAHwfPuPugLHCA5xjz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300063

On Wed, Sep 30, 2026 at 4:07=E2=80=AFPM Nguyen Ngoc Thang
<ngocthang2710.1999@gmail.com> wrote:
>
> memstick_check() can pass its host->removing check just before
> rtsx_usb_ms_drv_remove() sets eject/removing. Its next request is then
> silently dropped: rtsx_usb_ms_request() skips schedule_work() once eject
> is set, and drv_remove's cancel_work_sync() can also cancel a queued
> handle_req before it picks the request up. Nobody completes
> card->mrq_complete.
>
> Once memstick core waits for requests without a timeout ("memstick: core:
> wait for request completion before freeing card"), this hangs removal:
> memstick_check() never returns and memstick_remove_host() blocks in
> flush_workqueue():
>
>   INFO: task kworker/u10:3:65 blocked for more than 20 seconds.
>   Workqueue: kmemstick memstick_check
>    __wait_for_common
>    memstick_check
>
>   INFO: task kworker/1:1:33 blocked for more than 20 seconds.
>   Workqueue: usb_hub_wq hub_event
>    __flush_workqueue
>    memstick_remove_host
>    rtsx_usb_ms_drv_remove
>
> Never drop a request. rtsx_usb_ms_request() always schedules handle_req,
> and handle_req fails requests with -ENOMEDIUM once eject is set, without
> touching the device. drv_remove flushes handle_req instead of cancelling
> it, and cancels it only after memstick_remove_host(), when no new
> request can arrive, so it cannot run on a freed host.
>
> The host_mutex drain in drv_remove is removed: handle_req always leaves
> host->req NULL when it finishes, so the drain never had anything to do,
> and it would now race with handle_req.
>
> Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260924204142.607-1-rajojha047@gmail.c=
om/
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> This applies on top of Raj's patch:
> https://lore.kernel.org/all/20260924204142.607-1-rajojha047@gmail.com/
>
> Tested in QEMU with dummy_hcd + raw-gadget emulating an RTS5129, with a
> debug msleep() after the host->removing check in memstick_check() and
> the device unplugged during it: with Raj's patch alone removal hangs as
> above; with this patch on top it completes, and the original UAF
> reproducer stays clean.
>
>  drivers/memstick/host/rtsx_usb_ms.c | 31 ++++++++++-------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/=
rtsx_usb_ms.c
> index beadc389f15f..d5b3a96fc609 100644
> --- a/drivers/memstick/host/rtsx_usb_ms.c
> +++ b/drivers/memstick/host/rtsx_usb_ms.c
> @@ -27,7 +27,6 @@ struct rtsx_usb_ms {
>         struct memstick_host    *msh;
>         struct memstick_request *req;
>
> -       struct mutex            host_mutex;
>         struct work_struct      handle_req;
>         struct delayed_work     poll_card;
>
> @@ -514,6 +513,13 @@ static void rtsx_usb_ms_handle_req(struct work_struc=
t *work)
>         struct memstick_host *msh =3D host->msh;
>         int rc;
>
> +       /* Fail requests after eject so their waiters are released. */
> +       if (host->eject) {
> +               while (!memstick_next_req(msh, &host->req))
> +                       host->req->error =3D -ENOMEDIUM;
> +               return;
> +       }
> +
>         if (!host->req) {
>                 pm_runtime_get_sync(ms_dev(host));
>                 do {
> @@ -547,8 +553,7 @@ static void rtsx_usb_ms_request(struct memstick_host =
*msh)
>
>         dev_dbg(ms_dev(host), "--> %s\n", __func__);
>
> -       if (!host->eject)
> -               schedule_work(&host->handle_req);
> +       schedule_work(&host->handle_req);
>  }
>
>  static int rtsx_usb_ms_set_param(struct memstick_host *msh,
> @@ -781,7 +786,6 @@ static int rtsx_usb_ms_drv_probe(struct platform_devi=
ce *pdev)
>         host->power_mode =3D MEMSTICK_POWER_OFF;
>         platform_set_drvdata(pdev, host);
>
> -       mutex_init(&host->host_mutex);
>         INIT_WORK(&host->handle_req, rtsx_usb_ms_handle_req);
>
>         INIT_DELAYED_WORK(&host->poll_card, rtsx_usb_ms_poll_card);
> @@ -812,27 +816,12 @@ static void rtsx_usb_ms_drv_remove(struct platform_=
device *pdev)
>  {
>         struct rtsx_usb_ms *host =3D platform_get_drvdata(pdev);
>         struct memstick_host *msh =3D host->msh;
> -       int err;
>
>         host->eject =3D true;
>         msh->removing =3D true;
> -       cancel_work_sync(&host->handle_req);
> +       flush_work(&host->handle_req);
>         cancel_delayed_work_sync(&host->poll_card);
>
> -       mutex_lock(&host->host_mutex);
> -       if (host->req) {
> -               dev_dbg(ms_dev(host),
> -                       "%s: Controller removed during transfer\n",
> -                       dev_name(&msh->dev));
> -               host->req->error =3D -ENOMEDIUM;
> -               do {
> -                       err =3D memstick_next_req(msh, &host->req);
> -                       if (!err)
> -                               host->req->error =3D -ENOMEDIUM;
> -               } while (!err);
> -       }
> -       mutex_unlock(&host->host_mutex);
> -
>         /* Balance possible unbalanced usage count
>          * e.g. unconditional module removal
>          */
> @@ -841,6 +830,8 @@ static void rtsx_usb_ms_drv_remove(struct platform_de=
vice *pdev)
>
>         pm_runtime_disable(ms_dev(host));
>         memstick_remove_host(msh);
> +       /* No card, no new requests; wait for the last failed one to fini=
sh. */
> +       cancel_work_sync(&host->handle_req);
>         dev_dbg(ms_dev(host),
>                 ": Realtek USB Memstick controller has been removed\n");
>         memstick_free_host(msh);
> --
> 2.43.0
>

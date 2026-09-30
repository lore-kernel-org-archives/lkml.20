Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7E74DE725
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784083; cv=pass; b=nnQbtlGVvAJqpFBC3bx/Y1hwPmJUaDKlveKRgBMhwI17Ih7L3SOTZZG/yhVyiUoHtvrauq8oI8Cz+LO5ShVARDjP9LCk5muWWghVg2u/6tFxpNtVObR7zS3pWpaB3TNOFG1WovZJINgQmWXfvXms5hUbSRymlwEn3dDoC7LCJFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784083; c=relaxed/simple;
	bh=C9Jpcl4hk2nflrSgR/CERYh3R1ZRq3nmrUq5WwdvYXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgZyKagK/IHeBsRs9utEPVH9ilwxFwqvvOa1hJyyk0CpBS/DSF6PsBIi/F+j2jogNC7Yl0e1GwSyczJv7sehbWhIyX3HLXUMD8wWVQKLJH4T9pb03nvYvt7CGSmlU+AMzcIj0vWH7OLFgsJD5aaRYs0J6p1pBr4XHYLWf3HSajQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUqEiD4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aX9D8cVR; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUqEiD4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aX9D8cVR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxvOc3668597
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/+/jDwGHy2o/OP2F0MWdjczwuGzPVCHwR05xkgVhWE=; b=VUqEiD4dfcVZsbem
	5GZX8RCHmJyFb3qjkdcQwNLzqNju6aF0K9VSnDL+U1q3wnemt8BVqCFApxTj3oFG
	08J35SR8OMmF0t+xG1GMOtsS7wHQzsdk3J+h+cBwGcAK1dRe3OaBsozt85g3yro+
	bprJG/uWAAGUIpdIICKxzunOfuZ5pKiDiQAYJ9dAsNfX0KQ+46EaczysJTn1fJt6
	HDp6fq1Nyh9SfPoVPM7fZ6CvThCNBDFpgNCbUw07XVU4KUZOK0SrzBQI6Fn+vpgD
	DHeYBE5RlwJZUxUVAGFxz1ZheUO/Ld0dB+6MBpjV4j2V4zfw91lzqD3nUN1mw+hm
	9NLyUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2uqqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:01:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1841752a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784074; cv=none;
        d=google.com; s=arc-20260327;
        b=aOk3fsKwR64/uww5rFfWCvQbIoFsWQsHY6xi5AFBCVU/l+I+SMDao/hudJ1TWy2zIQ
         CIIMW3OsOtjEY8c8QeEnuGL2T97pHddBjsMEGZ1ImohEMdtkIqsCpyAa/uZS630UliMa
         4t0zu0XrJgaNUnVWVs3lBgL8C803yS7XzLXOWslzQQ/gEno9U3axtkR9MZMMMStgrfGC
         IR2ALKiyt8fXOhPy5VCJIYxSgXrDE27k5EH9sVhehiD8p5m355nlKhNFiaYgLUlIQNoN
         FqNOPbFdG4x6r5ICprNY5sJ5Nfl7iT35FKQ4COaytsW88ffVwFDDuxC9GI1N2wWzmAHu
         t4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/+/jDwGHy2o/OP2F0MWdjczwuGzPVCHwR05xkgVhWE=;
        fh=6WJ9Ct0kWD5t+CT8D5ICwxOiGYChRahyDkm1rTe0Nqk=;
        b=DT268YgSOEWQrRzQtixgxFQK/0PaLLlVs9ThDSdRcibEjxamFOI2mDjv9kwmTuqcLJ
         A/YPtujUAy0UQp3zGUi0Dya0DZYIGbJMbugbhMHEmRfSbjnXjn2tbSq17sCIipeZ/P4G
         2TfEh58v9KYeLYTqTdudFTUmgTm5G+EtbdR4CU4DL0nWSwHxifF935fNTgvKCuaG/C03
         Hd/3Ejf/t0H9pCKgcO1OgbXW2l8frv8wrkOOziztvi76j97WM2glb9hHdiEG227554To
         dsK0Sgkt8QWdLaUORaDCEXB0YlSQYAW0V27INRK7/WE42j4CtrmPS5O6gtoVjZMtCac4
         jqZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784074; x=1791388874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/+/jDwGHy2o/OP2F0MWdjczwuGzPVCHwR05xkgVhWE=;
        b=aX9D8cVRczpi+8aKMJtkS+J5rOzHQzybOk0HKs+g70BAKxQXcHqIid/1XnxRewPifK
         8E+gEj0CFeQuDgoyrqExHOmHJZ+tLXvOBdT7rf8cqslda9gQ/Lp5kphMXnIcGTr/CR9n
         9tD5pLis95K1+Xa9ezIx31NaATqPz02do54lFopaZcRtHoXQE0mqNQB++N5LLRSe62tJ
         K0Xd2y7JojEv4Rr/sHKxcm8HUAyIw3sMfMGmYOfU/UHl0RlV4FH9OoiWt6sjl193qW5N
         sQkK5QQvzHRQJCuDP/OmDE9zm7jOMgFuumXDh3MyIgTDkAxHCDpZRGsH2IWAIARgF7rw
         h2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784074; x=1791388874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/+/jDwGHy2o/OP2F0MWdjczwuGzPVCHwR05xkgVhWE=;
        b=Uikp8n1HM3+NCMbzDFOszr33RCprqhGn6oUEx9Vh/PBGg2uBgoY3KDjXbkGbYE7/PD
         L5xUMTu4ms3kWLJktWqKQwjz2A12EyBhUL9SzC4gJs3liOi7LFOGA6PM8oKs1WPbzKmA
         njtQNIeyfzkLWk9cHX8OW5TWO58vixQRBp3X9YrGrHH80VFIEKEwKugCWcIeCsTl540m
         vblVTEGBxB1x4go6Db52nsHgyqk93BvwOEOMcZwpsG7VtCCDy1gIJW/i8wC11JoW4zGr
         Cel9qP5hbqIO13f895gYHdm/WmRdeEo2Q7mhQ3UwEF3a7C19imOekWSDKSE6mDO6/piY
         qXqw==
X-Forwarded-Encrypted: i=1; AKwUvByImfzfJNQdtIfmE8zZXAkNYhr5hflERLs6ZC7lptnykUkc0Ind8gj05zi53ZXb+Ji5xorr9jyeCPXpZKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwrIJu1iXQmcbCcW7IEf9ZUMU3gn5oAAWO0GMgJS6awyaYrFNA
	Dc5vZG1FEQvZApOqPE6mmhNAHGf9LyzB3ZHIy86MLNzQqskrAV3o8I27e3piN8FPLK0p6phDDFC
	ywF8Jxs39DaP/+DlUHMPXUMbbHQSM0A8BUvYFTD21dVvfgFsAI9I1NSwELAC0K1L3myFde2ro4Y
	t9LyAIRdaLbAq3TjI1isNBy3JV8jmIMk0B+agehRAh064pARwkiA==
X-Gm-Gg: AYBFou0pXHc9lHYVIXO1+v+hoNdDYUKG6ny+Z8L6v3yg2DAYT62Oc2cdmuXmAARimwn
	b+jjiiSzQQ+f0150siJ8llXArTED1Zb92Sr+mVSIoQnwv4lcyUjqID2ENySqJ/G2mFgM2L9FfS+
	tbJ0f0RYjrfGm3hh65fbkm2IJFjrY0vLJaXvi3A2zpnjTQxXI+TO+xFebYSQ==
X-Received: by 2002:a17:90a:d2d0:b0:39e:3d38:7ef1 with SMTP id 98e67ed59e1d1-3a4f2c2248cmr54949a91.10.1790784074146;
        Wed, 30 Sep 2026 09:01:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:39e:3d38:7ef1 with SMTP id
 98e67ed59e1d1-3a4f2c2248cmr54925a91.10.1790784073616; Wed, 30 Sep 2026
 09:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124522.2141124-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260929124522.2141124-1-runyu.xiao@seu.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:01:02 +0200
X-Gm-Features: AclHuK-_MwI6oqPNb_CFHKP8OEa78Xrn6y9JHyCctq4WiB7Q3lgUKRsQJK161C4
Message-ID: <CAPx+jO8fr+Jkb9u8bx6a7cv0=oD0jUGqZpAamw4j+LVFnqSw-g@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap: synchronize clock timer before disabling fclk
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Ulf Hansson <ulfh@kernel.org>,
        linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zg3h16IDydtyyc4il6yom9zWInh357UI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX7hZ+BZQ05Tks
 FnQdKi1TV4+l8wN6b+SJNMGR7QoGJAr7W3QeDnkmy7pV+kdmTbr4FjEqBDGPZKaVrWAk9E/4KRg
 wr1fBP8etlwcAYMWzIsDrlQJg3W8V0K94NY37hnvv9wjqyo84pz6SkS+/cQnfI7QyECKW7oaFfK
 6GPBj3byhjypAoLOOJF9vyPmEAOcyuLZiKIC13HdtXIhauXfursiPS6mgiLtTesE41dRpfuHFE7
 nZ/WW87+mnbpg3ukvVcZL41ADDlAfihKM2sTHZoLcxvHIrKSbS2DlLdNTxBUPCdeRIsXG89bckQ
 WpDQtVqkLb+R1mFKrFgxXQKzUnwDhoG8KBa74A0nmtIFszBz5ZzW4Z4eOLXMeoHvebeIKz3Bo8F
 3jPbWH1Vjc6JZOOZRr7sqZhFIGywa/BL6sMm/OclixTDmCybBzqQidwkRNGanRlZUyJ0bLJx2Nl
 XfYvtYkiLn9o5bplt9g==
X-Proofpoint-GUID: zg3h16IDydtyyc4il6yom9zWInh357UI
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abd324b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=ywtp7fW4YtRplKC3Ii8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX1murLJ5XuOQI
 lgsIAkaxbxmqoUymlKmFCFM8hTz8Gdk3GmLwdqiC9YdyUzerQlDw4LozEZxjV94w+oD2UoQtCDd
 e5tkqXi/EYJ11PuPExEY8SdSKIKlMg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300063

On Tue, Sep 29, 2026 at 2:45=E2=80=AFPM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:
>
> mmc_omap_select_slot() removes clk_timer with timer_delete() before
> switching slots and changing the functional clock state.  timer_delete()
> only removes a pending timer and does not wait for a callback that is
> already running.
>
> If mmc_omap_clk_timer() is already running, it can therefore call
> mmc_omap_fclk_enable() while the request or slot-switch path changes the
> same clock state.  During host removal, the same window can overlap the
> final clock shutdown.
>
> Use timer_delete_sync() so the callback has completed before slot switchi=
ng
> or changing the functional clock state.  Keep the timer restartable for
> normal request handling.
>
> Fixes: 0807a9b5739a ("MMC: OMAP: Lazy clock shutdown")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  drivers/mmc/host/omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 527b89a5e..02d288e4e 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -214,7 +214,7 @@ static void mmc_omap_select_slot(struct mmc_omap_slot=
 *slot, int claimed)
>         host->mmc =3D slot->mmc;
>         spin_unlock_irqrestore(&host->slot_lock, flags);
>  no_claim:
> -       timer_delete(&host->clk_timer);
> +       timer_delete_sync(&host->clk_timer);

At a first glance this looks fine, but I am slightly worried that this
could deadlock. Have you verified that?

>         if (host->current_slot !=3D slot || !claimed)
>                 mmc_omap_fclk_offdelay(host->current_slot);
>
> @@ -273,7 +273,7 @@ static void mmc_omap_release_slot(struct mmc_omap_slo=
t *slot, int clk_enabled)
>                 /* Keeps clock running for at least 8 cycles on valid fre=
q */
>                 mod_timer(&host->clk_timer, jiffies  + HZ/10);
>         else {
> -               timer_delete(&host->clk_timer);
> +               timer_delete_sync(&host->clk_timer);

Ditto.

>                 mmc_omap_fclk_offdelay(slot);
>                 mmc_omap_fclk_enable(host, 0);
>         }
> --
> 2.34.1

Kind regards
Uffe

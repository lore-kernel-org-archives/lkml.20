Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD435C1B1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410409; cv=pass; b=eznjqbu7XE5sujPwtmVzilJGJ4PP7gAv6r/JFSBPsHym0hJzCQw0qPVdJl730PUzWwthdlxLO0dqnHL4vOxSg31n0RwbBXnuKTbq28NqI36X0Ocj7GqLEuI0RhnIS74K/qepF0FnyuhuSxt0PFeLTpYWdHL0yy8Oo3jHniAq+NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410409; c=relaxed/simple;
	bh=a/+0QquMjDxXq7vYM/x236+ERibUdJVR8Keoyp+eUC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg+gBfBC9PTI+UOMlu8bRcz0G2tdmMxsX9gggSdf2LRn29LwZbh+GM0TnCQlpkEkJ4tItrfNQ30plhNotp5aWXoeGXY++3JOtZV95eja1wBXVKfoVoik66PfUix/wVvKIzdUtpYklUTAqreB8zdOJto2XqCq8uMYTHkMg2+mK38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5e1WbvP; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5e1WbvP"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab4354db11so4376481fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792410407; cv=none;
        d=google.com; s=arc-20260327;
        b=In7WbEOpyG8qohNkp2qvU4dYKUpamreFkPk2dGLTqTFrTJawP77odzuT3MDSrUwEng
         35IVd4v3bTxLQscSaGO1WewscA/YYQ0EqlIiP6HhFOkwPksGdcD+zFNY3GqPcezshf6M
         rTKahI8JWyY56dqieV0+wQkg1oIYH2umHgVLrz5mKYpC1MGSCeo35KMvKSco2YfU8Omu
         wSRxDYkHdcVSlLM9IiRAnkAiSy56ZnZZKriWTA2ciKfoQkxUROF7NTf+TV0WgRrzsl9S
         AJtW2dRfbaZMvTp5J7Wyl29U9K3MjykZ0fp1py1oMCX/vwH0ya1oHPoAFOJmSbO7NegU
         xmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/pXYNCJ0xeK4V1BUXfqQjJ36OKtMGptQa0NVIglrao=;
        fh=nENgflIqLY9hS2hCn8jLsuy2eLGq2R6ioCYZ7OqcxWc=;
        b=Vc9vQTHNLbfjJ0Pc0PoYfwmFrLwSlSNlPRhziTMJbBUD2BBrFOCAMgNTSG3VZAl1lE
         Kcqzya/Pxmzrb/MgW59Qtob1FG5ZKhI42zINl4GQJZvCS+ftw87JssuELYIuc1HbEGqG
         vBxsFpIC9HxVsTaBLBmLBH/gS/0AKnjtbEZUBMUG9zRXwTZVGKmxSqv2IH3OnQKk9BDv
         /zLTLwwoOi8Arf4rEy1c8IbH041hW1xfK5ALBBpthLMrhh4LdxFEv6RTsvMaACC7lp72
         3iua4ClUxmQn5T7sY6WjAuy2sTSn3S3C9hyBhKpVuKUd2Bh/YEtD/51NZJZ77K3dbWzu
         fMPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792410407; x=1793015207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/pXYNCJ0xeK4V1BUXfqQjJ36OKtMGptQa0NVIglrao=;
        b=G5e1WbvPsHpGtX91aVlREUCcyMc0bkuwr8UHCyvMKvh9lcCMvlp6Hj4ZLdiOJObyp4
         SqS0w2Pn0kJiXTukhP95scS7HKi76FzuflP2KQdESmcz9ulQpJDDQMvhKTGelcqDQjIY
         kDvdHsMCZ9Lsx7TdWqI0DlhC7dP8KvXNqCMaFsa7i8+gPNP4eyJZKrSvOStOFvAL/Voe
         dXdfbVMzH+z0vGIg55+E5ApnTvO2Ljz2sFLrGSea58hXVak9tyhjZc02+vGDQj9i6Sr7
         7KPCKSwX/derVTNt/YYMRLo2mbhK3M9sL3FHTfEbeo6f+kXq9tpVq9DnnEkMOBtfXWvM
         38+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410407; x=1793015207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/pXYNCJ0xeK4V1BUXfqQjJ36OKtMGptQa0NVIglrao=;
        b=pVwO9QUR7nC9MwpgdXQ+IwYwcMZ8cZ/VrO2GplACUgkoNYOEzzS0WWxytTeMkYNHEH
         nd07CMwPdQmhm4M1YWkUxKDgznHLHJ+gUDwprSXCsOAEkYyTGUvhI83lwL+N03DppUz2
         Jx5KKEQEY3X/0T97B3JbPjQE7lrmLt4kKktuAieZIPhaAwdcDZw7MyUXMuBY0aZ91KJT
         B5YKn5P5YDDivSxOtAJZtRzBlY6pVVLH54k4uQG1HCS18nw8zw2Q0cwz0XGwCOQAGrv0
         1qLD/EBDpPxQFiQHYbKzkRlzULhhHVaAEz5mU2F/4wSdtpUF1TEZcU0GrN2hN83f+TEL
         7Z9g==
X-Forwarded-Encrypted: i=1; AKwUvBzK6kBD2aMLMJIh01RHDGYbeWSgDvpI8NQ4Bq8GUfzZqko3dMzZAUih/vzfT0t6QTJTqYWj1sRTJhSdApA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaKNnMO6V2wv/FQTk5Ze2EmyoLQKle0vKmuclaQSbsK9/joo71
	gHk41pUkwUwYUmegggiYfSUtm8whJFvdCZXpnK+PgfdcxL5VtZAXtmwG5tQRAQt8qEEKo6Gii5m
	VJMd7jXls1oGCtjeeChyCJOdZ7pC/gJ7IADqg
X-Gm-Gg: AYBFou2Dta/wYoV7awUbUGHEUaseNr+UaHA7w0G1bsyOwx9Nyk0fckZaP1P6d23Dfsf
	Yl71YtrlUq5ExGTbo1u+KYMIgmmA171tFajUUUgOQMvUrON+/oL9KJG+TCPFpLSnc1VQ1A1LbGZ
	4nZL6TGWqfIczMbhsPV9oqh57+ktpzrgWoeKnbhd88QBbwI/TAG1UfYVK9QYkHNVEZrTe3x9i9s
	1pfdZc7WdOGpnBa/UlemKMJMSgZlos6ZStyjJTbYVCEvOXWzVbrRDwrjRJ1sdbO9HWhrB+s2Z7B
	QgsqLyelh7mTuHG7z1B2s1/nShXYlnoLe3JNEbQc8hE5Zn1NtQ9b76DXkgSF06L1+/Cb
X-Received: by 2002:a2e:bc0a:0:b0:3ab:27e4:5b7a with SMTP id
 38308e7fff4ca-3ab29175d9bmr18692051fa.4.1792410406406; Mon, 19 Oct 2026
 04:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com> <2026101326-pectin-decent-7407@gregkh>
In-Reply-To: <2026101326-pectin-decent-7407@gregkh>
From: Timofey Zakharcuk <timofey.zakharchuk.research@gmail.com>
Date: Mon, 19 Oct 2026 14:46:35 +0300
X-Gm-Features: AclHuK8tRVzyhyE8NcFjY3zyrVz7jUzZz9jdtp-eYqnxWzWFr3nJLlNdjVo1t4o
Message-ID: <CAOm0KL_gbV=PY9DzjcsgqUOUjRK=vc--3q0c6LD_uDfbD0AFNQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: sm750fb: fix resource leaks on probe error
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Greg,
it was found by manual code inspection by noticing the asymmetry
between the resources
allocated pci probe (and freed in pci remove ) versus the cleanup
performed in the release_fb error path:

it was verified with checkpatch.pl
i don't have access to the physical sm750 hardware to test on real silicon.

thanks,
Tymofiy
(resending this because i accidentally sended it with html)

On Tue, Oct 13, 2026 at 4:39=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Oct 03, 2026 at 08:50:55PM +0300, Tymofiy Zakharchuk wrote:
> > If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
> > the framebuffer structures are released. The write-combining MTRR,
> > the MMIO and VRAM mappings, and PCI region 1 remain allocated.
> >
> > Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
> > release_fb error exit path to prevent leaking resources.
> >
> > Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.co=
m>
> > ---
> > v2:
> >  - Fix From and Signed-off-by email mismatch.
> >
> >  drivers/staging/sm750fb/sm750.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 8b93bfeb2..456b3da86 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev=
,
> >
> >  release_fb:
> >       sm750fb_framebuffer_release(sm750_dev);
> > +     arch_phys_wc_del(sm750_dev->mtrr.vram);
> > +     iounmap(sm750_dev->vmem);
> > +     iounmap(sm750_dev->mmio);
> > +     pci_release_region(pdev, 1);
> >       return err;
> >  }
> >
> > --
> > 2.53.0.windows.1
> >
> >
>
> How was this found and tested?
>
> thanks,
>
> greg k-h

Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4424676D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744196; cv=pass; b=G05HogBopj4kbaC2ZjPBoTCzSBJJsYlHeDMybb85DscO2vEhpKh6vyTBEjaswEPfi2+yR25K8VxKS0hvNfikpLryLOOcnWjGE1MOYHT+JBKh5rCjFHkimzAgnSc1/uwPTE0ZUoD9T7CRIUkxxJd41LBxH9QRm3cW15smeqgNg9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744196; c=relaxed/simple;
	bh=aijIq6MG49th3NxWEi1RYjXRzGo8e6tnPdyVZG7VoU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KN/57g3HiGbivaU53T5NreYV5MH5W52sUN56BiOxniCkW6njkhf4/Dz8xyIbaNdfU5MrTR7z+uBgK0WHuA+03Ka4awb5yCUWFxFzbX6ZvaXC4NESrOptG4Oxt+eHVdmoXYOGDfA2yf+FhS5zFLELDkSTO6FIaYcNhyUXDmtT1FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsPfNluM; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsPfNluM"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-675bcac8ceeso729014d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790744193; cv=none;
        d=google.com; s=arc-20260327;
        b=GNGOxr2C5yeern1DsRKjjOVv7Qf1i/6k85RHRKyhVLJ34SLLfwFKSxI0c8TzH8AueE
         OqYputKpOoefsrprGhxdO/v4eXiWrNl+TGtHAmOSXNB60xzu7k+VPtd92MlQlQ5NRF/r
         GBi76brDxZcwJDIs/q78eoPyw5EDKZzgdENuOHp2Sbo0hoXuDig7rFc5SwHzY8BxsKZQ
         nlGGHbMYFgw3UZFFQME5yf4P6hhrGY6cHbHbIDKIVdKJpTaCNZ+Os9Cuhm8iagj+6oHO
         IE5W10yhoTZ7cYRk6fiK+aRYaIAlXoUNGhahWPBBvVH2vvgt7bN5kdNmmkSeNOPFRdq1
         sKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YazpLo8uOEsrRzgBDuZEHvPTChLlaZapwZA6DqRFIGE=;
        fh=aBCjy/VM06h1uEydOqyEEbJ3pqdx/rPianqAAE2n8LI=;
        b=dBhokjVzDiRYzx1Nm/4DP7iwpOGZmA6It4NEa5nbQnzrqwlkLm5nrGuNXepISu9ixJ
         oXtN7lz10sGz/bp+UjhvaatG3KLmf4V69wLdIzBPowtzrBo+K84tZbwsMxwK6/O2e9A9
         eevJR7DK5Rk55oJWg4e0ksP3igzmGkxWuwTNMZ1EVJdP2w0WN04YoJUjhR0RXXQ+FhLn
         U+33cf8yP9GX83qdNtfWSxCg0LD6adxoLL8ECVSO2JKi+oAlq6uBFZn/Hc1IvUaMv4zK
         GT6h0iE6pyUMnqCB6JSdOzyJqoLCw16DcgMqM1xRWHWQIXN7KP1hjZqHLBsO30zR3K3a
         D7lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744193; x=1791348993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YazpLo8uOEsrRzgBDuZEHvPTChLlaZapwZA6DqRFIGE=;
        b=BsPfNluMyV7VnbDx8bcRuJLa4SEFo0DgwXPjaEIuDdc0oWXf3kKnzF62jQE6biHBCH
         ATxkbkB8adjFF3aqLYM3jJd7zMMyOCn/2gbDlAw9qpHgcbPKC0yCOtT/xh0fyZpKCLyB
         hE7Jtmswmb0ySZxaORv2IoJb3Eax9+geI2nCpQrPxIzSdNLcdJFmRlgx2q+PtQxkDgbu
         RdqY8j7SKp4Bgnvf0I1rLEHWHb1rxZbTOF8+Vk1ynsN6OQVzQCiSrL5jIYF0F5Dbk+iR
         0cRkU66G08rWsPN5ECNwGrsR27YzbhwD+5HWxCOG7azhtfU15ApGqMOvTXE+cNPz/GIB
         JWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744193; x=1791348993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YazpLo8uOEsrRzgBDuZEHvPTChLlaZapwZA6DqRFIGE=;
        b=EqkWbsurLWBNhC64FiVMqYqfVTiC1zfOJJjazGat/VsqB521kJuN+uaiiilaoKKCJA
         KvwZmBUGWXGQHxctJFm/DJP4llO/gsvTMn6Mx17UJaLBhuNAvoi/841Ga6t4dTAkZ+Bw
         WSjS23zGIvcYGj8buERH1AwGSws7/oD/klLMFCCCNYglySduhhxBkguQ8SGmFpw99lYE
         AppLeS3cDztnYmKenGEEjJM8R3bA+XHUnjSXvYHCsXfoa6mDSwixnJIxSFPtab6hGkH1
         EWkVSTz7HkBy4UZ03DszHWpGQsd/6RN3IWpqy2B2dR1Q82QfmydLdk9GUZQtZ4NLNHZf
         uRKA==
X-Forwarded-Encrypted: i=1; AKwUvByf/3l6/yx89og+C+5JVZ+uvDWOD4oD+8u7+yfYAEPU2A0Tfqi/AITIaGFTYoD0gu9f2BSLUTxF5ppLpDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRkGGNLGi6drmbQGOvabAmqNGYfeL+xDlIQcrzMh7xqQJsibw/
	0+WKTpnepUAkUeg3EtKWWkh6Xf2XlI1ZSmUTi5VfsNJ9G8uPidpmt5+nHmevzj1wsR7QlkvOGdM
	J6Wun387PUQB2/NvOyUTGsMPdOjIYmBQ=
X-Gm-Gg: AYBFou0bqcY550gpacXPVUH1buz+5RoysNXaRqnmNHV0UoEThUpHhQFBhRxbiFIx/IK
	CnFPR6yJ+Ke7oTC5xmq1uQhHgd+KB/p5Ut7/aletFh4SPaj3y6NFRGASss2OEY3SHSht2KiRY9f
	/3fESI51E8EArvmNT6yAC2ghIHtxwJ0U4Ta98Ktoabi5XI5QeMsvpZmESxsCbvaHFdRRJmk1DK2
	N0OVdq5FlNdIWHs2mf3FU/Eyzupfj+tVpZAZN3I01hFmXC9FtNDdtH5/Ad6Uwb7qoRi3H9XXtRJ
	6oT8SkB29OCQHBh4/fAe2K2K2T/nyRx9QYOIAfGJXIMy727rx7XVrSfwilAgTNCfnlo=
X-Received: by 2002:a05:690e:4197:b0:675:39f6:9bca with SMTP id
 956f58d0204a3-676834a58f0mr102811d50.58.1790744193227; Tue, 29 Sep 2026
 21:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com>
 <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com> <CANUHTR_yAgnZN05PBLae3DSk3xo0haLRRgHyKxswSYDE2tHgFQ@mail.gmail.com>
In-Reply-To: <CANUHTR_yAgnZN05PBLae3DSk3xo0haLRRgHyKxswSYDE2tHgFQ@mail.gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 30 Sep 2026 10:26:20 +0530
X-Gm-Features: AclHuK_5dLBTDCM2a4gpvqnnswpJIWECN6q0YsymVQT1CjxevikTIfBgbHvWtBg
Message-ID: <CAKfKVtFkZ-T==D2-3OJeWUsRAzCE7_YP9kW1dDA0d3kjVWfBFg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:45=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> Hi Shubhrajyoti,
>
> Thanks for pointing that out.
>
> On Wed, 23 Sept 2026 at 23:03, Shubhrajyoti Datta
> <shubhrajyoti.datta@gmail.com> wrote:
> >
> > On Sun, Sep 20, 2026 at 11:25=E2=80=AFAM Guangshuo Li <lgs201920130244@=
gmail.com> wrote:
> > >
> > > init_one_mc() allocates dev with kzalloc() and registers it with
> > > device_register(). If device_register() fails, the device has already
> > > been initialized and holds its initial device reference.
> > >
> > > The current error path eventually frees dev directly with kfree().
> > > This bypasses the device release path and can leak driver-core
> > > resources associated with the initialized device. The existing
> > > versal_edac_release() callback is responsible for freeing dev once th=
e
> > > device reference reaches zero.
> > >
> > > Call put_device() when device_register() fails so the initialized
> > > device reference is dropped and versal_edac_release() performs the
> > > proper cleanup. Return after freeing mci to avoid falling through to
> > > the direct kfree() path, which remains necessary for failures that
> > > occur before device_register() is called.
> > >
> > > The issue was identified by a static analysis tool I developed and
> > > confirmed by manual review.
> > >
> > > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR c=
ontroller")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > ---
> > >  drivers/edac/versalnet_edac.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_e=
dac.c
> > > index 3a06b41c1d84..db3bf5a1345b 100644
> > > --- a/drivers/edac/versalnet_edac.c
> > > +++ b/drivers/edac/versalnet_edac.c
> > > @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, str=
uct platform_device *pdev, int i
> > >         dev->release =3D versal_edac_release;
> > >
> > >         rc =3D device_register(dev);
> > > -       if (rc)
> > > +       if (rc) {
> > > +               put_device(dev);
> > >                 goto err_mc_free;
> > > +       }
> >
> > There was a comment earlier from sashiko
> >  failure path calls put_device() with dev->init_name still pointing at =
a stack
> > buffer before device_add() copies it. That's unsafe in
> > principle (dev_name() would follow init_name)
> > >
> > >         mci->pdev =3D dev;
> > >         mc_init(mci, dev);
> > > @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, stru=
ct platform_device *pdev, int i
> > >         device_unregister(mci->pdev);
> > >  err_mc_free:
> > >         edac_mc_free(mci);
> > > +       return rc;
> > >  err_dev_free:
> > >         kfree(dev);
> > > -
> > >         return rc;
> > >  }
> > >
> > > --
> > > 2.43.0
> > >
> > >
>
> Would splitting device_register() into device_initialize(), dev_set_name(=
),
> and device_add() be a reasonable way to handle this? For example:
>
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.=
c
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -64,7 +64,6 @@
>  #define XDDR5_BUS_WIDTH_64 0
>  #define XDDR5_BUS_WIDTH_32 1
>  #define XDDR5_BUS_WIDTH_16 2
> -#define MC_NAME_LEN 32
>
>  static int init_one_mc(struct mc_priv *priv, struct platform_device
> *pdev, int i)
>  {
> @@ -730,7 +729,6 @@ static int init_one_mc(struct mc_priv *priv,
> struct platform_device *pdev, int i)
>   u32 num_chans, rank, dwidth, config;
>   struct edac_mc_layer layers[2];
>   struct mem_ctl_info *mci;
> - char name[MC_NAME_LEN];
>   struct device *dev;
>   enum dev_type dt;
>   int rc;
> @@ -773,13 +771,17 @@ static int init_one_mc(struct mc_priv *priv,
> struct platform_device *pdev, int i)
>   goto err_dev_free;
>   }
>
> - sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> -
> - dev->init_name =3D name;
> + device_initialize(dev);
>   dev->release =3D versal_edac_release;
>
> - rc =3D device_register(dev);
> + rc =3D dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
> + if (rc)
> + goto err_mc_free;
> +
> + rc =3D device_add(dev);
>   if (rc)
>   goto err_mc_free;
>
> @@ -800,10 +802,13 @@ static int init_one_mc(struct mc_priv *priv,
> struct platform_device *pdev, int i)
>
>  err_unreg:
>   device_unregister(mci->pdev);
> + edac_mc_free(mci);
> + return rc;
>  err_mc_free:
>   edac_mc_free(mci);
> + put_device(dev);
> + return rc;
>  err_dev_free:
>   kfree(dev);
>
>   return rc;
>  }
>
> This avoids keeping dev->init_name pointing at stack storage and uses
> put_device() only after the device has been initialized. Would this look
> reasonable to you? If this looks good to you, I=E2=80=99ll send v2 with t=
his approach.

This is already addressed in the ongoing patch series:

https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd=
.com/

Please have a look and let me know if you have any concerns.
>
> Thanks,
> Guangshuo

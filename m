Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F83515ED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257979; cv=pass; b=dgz1LAIWQo9XDjwR3M8sJRRtpOcjqwvKrnoNscUvx8qYh01CIDgJD/ESH5sPmxeqR5IyfgPnM6/ebDrNZR2+Ark3WhPl1Abw4lKueuNKEH8aCJc9hnuAQTxAKOOg10J+jBt2vs/cuaQXPnWbBAIf0uzrTtTAE9fPMlnTnFyk+2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257979; c=relaxed/simple;
	bh=QoUAEYmTjcom/GYw9KMesKKHysm5dGsVufGYG8k4VHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7uD7ygHlLbPul7KspqaQKpFZ+ct0SgLMTFUufC/dlQi5mNX2HLDW19qyLcoJ7YQWbEC6BVW8VzhOZrEkws2gtTb/CLiPUFDrj0+8k2pVowLI+/vy4dQ2yZ/fP8akxOeRJpsNzk254xf7BI/R5Rf3qXE60ZJtThhK8LG1oHHLcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okzYmvPA; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okzYmvPA"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb93aee5eso2173916d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257977; cv=none;
        d=google.com; s=arc-20260327;
        b=YL9grr37SLxEc7IV84vn6ZcQn93C04zaPxDgnYcmQnhadQ01AHCbPgTCe0JKgNMiC/
         /XfPuDruEV61ycvXeXV0LNz0hOVHaSYweAYsMjhrA08+n/SM5TVLPdypvc4BvcaqM8pL
         P90ubK91/6XUaInALXUgTo2pXzwRlkfhdp0sGXgvHH8QeeuTPMBVXyYNqowK89ENBinj
         NBDyczikxPaLPWMoAtgHN2NYu4yToXJ5fFGm7MkXI7KVKbkDat0AsPMp8psQjz5SUE+r
         UWxeR5QdcWT3qvdpdy9N2CXD7hfr/Lhcq55KeNFMqkWg2XrAm6TWBL9ysIZ4LxgM4Fez
         HPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nWToiZ/0mvm/+JbzSK7npOR4gXzr5F7+OnypdaZRifc=;
        fh=VddJ9xdbUSgjfdrsXbgJH5ESU0z5nYHmh7Yx8gQNJDM=;
        b=Vwt+Ucfua2DZRHdf2vMaePi+g4UI3cyOc7u1hup5ie2xYRGFGHyK29x2+gymWvZwrD
         lZrBe3kCl8KmLKFOJB3kMiVDcpy4Ji3OfWOamfW0c7EJuJDCveb7TbLnmsmYTxPYiByb
         HHt+Qq3HGvrpD6j07VHxouAT8vpXxaJ8UIB6bJIZxlt75e0c3mMto9CYdwtXfKJkGWni
         4fjwRJ/kS7d76S8HMQYTBDtwe9HnBRiK5Y8xGbJ1o4w9zLseEpFFo3wK7i546cp+cezJ
         idDh+eQoH230qAWyRFkVLNLCi3V+x5w0yuaRNmArqpRAa9JidLIP+baOFb0lMskgqozH
         z02Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257977; x=1790862777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWToiZ/0mvm/+JbzSK7npOR4gXzr5F7+OnypdaZRifc=;
        b=okzYmvPAdFwte5RiXCjZPKI3wRK7XZ1K/axg1eTutifrX6fBR3oMBUqDvU8Die3E2C
         uc/dZv9pYWcz4Qcw1kDs1koxSQHhU5YCCMailImMaciVKjn1vGYh1ebbEcuFfrUfwEt+
         GLDwsOnMQWugbQqOk5B/o6wcRNflh4xaSlC86VzLycBdUEcixERGE4NW0+u4zODoebsg
         s/wAsoDSzLXvbbI/B48tsKZAnXFuhu4QLu1ubcAImBHL2XaS+ElbcyGPLaHsoTj8sENh
         bRjrF+ymlIIhACBSUBAUoaX7OHqy7ud03MGTrOQkJpy/g+lAqMT1+7VpgV3j0i+gDwZI
         dbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257977; x=1790862777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWToiZ/0mvm/+JbzSK7npOR4gXzr5F7+OnypdaZRifc=;
        b=ztZ6hR2TkXY7Ncw9EHjtl3LT+cSPcSKO08zldSSsfrAQiUkTpXDsDUxDdwsYBvY3d3
         f9WJOnKcPGyj8qWScw86pEfEtHgPD6QLUhYxA4fx+REE8fKTCEhBzztrbqPEJ+BTsY3L
         hya9hthAlbSQnAo9BlBuwfINd/jwfLI/GLBh4mPCnyfZxAzNVizauPEU48kbzacqmiME
         FdaRDvsAtjrCxUd102BhWa0JGzeI+B+yHSlBKWXIPc0BeiE87JMEUoiuB66yfqmHVm1A
         HR1yJMM398bXHHxblsY78WUE2d9XXrn2Run0erLzdoMC4/Q2+W/OIHJx18/LYEMttMaE
         j4iw==
X-Forwarded-Encrypted: i=1; AKwUvBzCILNJVxhqmY4K63lWO/CN8zvxTECFYLmM6Dae43cqdrOpDAPLbUwX29F12Qf8TsMbxvAQOg1BAO0URM0=@vger.kernel.org
X-Gm-Message-State: AFuF++mkm7zIEMIddyxQl4+iqtjwnawQpZa+0PiX6ptLxGHZ9u+u5gey
	pjUJzRJgd4CRUD7JDF3L/TXXq6b2XX6BWGkaNj2F2mr6cKXNgTfzjuVe/Gjz4Shy/1mBmnmcTM1
	+ExNLx7eLvX3KlTfxH3RXfN+wo/XWIa0=
X-Gm-Gg: AYBFou2h0cXmOhjeUtQ8fd6bWn1Lma0I691d+zCUaBn2/h9MoVs6AQ/sNOHm+LzGaic
	DoNQoQBG1lOy+HgX+k6Cg+FgjvRZMxipOvhJHpPdcr0AUx4y/hAuxO2fF1PLnUI5d34bLjso06Y
	lUDGz2xfmFPP0oASNcCbGyYvM3MN0LyrQOiTCbQca+dz8rcBayhM/46Twq715S1Hn1qN1ztIGQU
	N5X0+nGF2Zq74hljbqg2c/n57gFIQHlbA/xMUkE6PJUE2CXue2Z+XyXUbDEOlGKJJSNA8/zjn7a
	heBf3lck4OWF8LX/2tifVrwjf/XeajOF38uXB4/Oio0/CQETv2qZ+NYbvHZ1f/p82HgV
X-Received: by 2002:a05:690e:1186:b0:672:9f72:7c04 with SMTP id
 956f58d0204a3-672ed4db57cmr1036006d50.102.1790257977028; Thu, 24 Sep 2026
 06:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921081542.210151-1-lgs201920130244@gmail.com> <c03262f2-419d-45c8-9b29-f3bfe6680744@kernel.org>
In-Reply-To: <c03262f2-419d-45c8-9b29-f3bfe6680744@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 21:52:47 +0800
X-Gm-Features: AclHuK_HbB37PieMjxtn1FtalUB9H4Cp6DfldwgllWBkEcccv9StBhgni5Up5C4
Message-ID: <CANUHTR8xJ9DGMyadCuhGo1Hw30+VSn0Ko4O3uyR=ofC4OfW2+g@mail.gmail.com>
Subject: Re: [PATCH] media: rtl28xxu: fix SDR platform device leak
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

On Wed, 23 Sept 2026 at 16:49, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> On 21/09/2026 10:15, Guangshuo Li wrote:
> > rtl2832u_tuner_attach() registers an rtl2832_sdr platform device, but
> > if registration succeeds without a bound driver, it breaks out without
> > unregistering the device.
> >
> > dev->platform_device_sdr is assigned only after a driver is bound, so
> > rtl28xxu_tuner_detach() cannot unregister the unbound device later.
> > This leaves the registered platform device and its associated resources
> > allocated.
> >
> > Split the registration failure and driver binding checks. Unregister
> > the successfully registered platform device when no driver is bound
> > before leaving the switch.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: a2f7f220df5e ("[media] rtl28xxu: switch SDR module to platform driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > index 487c6ab784ab..3603d0cf638b 100644
> > --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > @@ -1391,8 +1391,12 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
> >                                                    "rtl2832_sdr",
> >                                                    PLATFORM_DEVID_AUTO,
> >                                                    &pdata, sizeof(pdata));
> > -             if (IS_ERR(pdev) || pdev->dev.driver == NULL)
> > +             if (IS_ERR(pdev))
> >                       break;
> > +             if (!pdev->dev.driver) {
> > +                     platform_device_unregister(pdev);
> > +                     break;
> > +             }
>
> Looking at other drivers, I think this is incomplete.
>
> drivers/media/usb/dvb-usb-v2/zd1301.c, line 142, does it correct. Note the
> try_module_get() call that is missing in rtl28xxu.c.
>
> Regards,
>
>         Hans
>
> >               dev->platform_device_sdr = pdev;
> >               break;
> >       default:
>

Thanks for pointing that out. I'll follow the zd1301.c pattern, add the
missing try_module_get()/module_put() pair, and include it in v2.

Thanks,
Guangshuo

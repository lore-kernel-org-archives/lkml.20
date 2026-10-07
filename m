Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BBA4963B6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372482; cv=pass; b=HEGrcnLIhjcrX9GA0/mJzNuAcPARB8IN4/f1ZbLUPMT2GFtfaE7rQoHECjVM3APzVV8RnGLpYsfUsSON2P8GixnoG3O3IqfCSYHdDBiDVZH1YBVA9rd3c8allD/92XpDtBSClfnmJTin3R5lQcpARxMIapjXEaaJXWhTw9+XxQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372482; c=relaxed/simple;
	bh=FpzJ35zvhmqOa2+RwZnppUz698uzzC9G/FlxDAwKxyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJjdDTLyLi0i5kbCopYU1//BPp6X6KeGrOJWrF7thSGwBaenEw+Uke1y2BnRjJvJZIQSx3xia/t7TxJBc9Ydbmo6d7kthpSPWmPmlEo0Vf9nN0OfM0Mdb/Bl9iUERgzOaNcuDG245bKiP0tUzvObgcgXjVc3ntIXZr69nWyY2SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekAsJW71; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekAsJW71"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-888cbacf70eso25527177b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372465; cv=none;
        d=google.com; s=arc-20260327;
        b=Uih+cPlOwrOF74kfFrb/XBo6kJNyQhLQoXE+tZ5AZuzS1THvdbmC5rq4bBol8ulGWQ
         ItelUFvpWCO/1eOa2eWIewynpv+RMKFDBO10qgTOiUOAsziw/tY1zTQiPdSEHTEpD7h5
         RKERIyCGKvpYvL+XLtKD3CDDRN7lpto1d9eZ1eqhmS6ourIaWbbGcOFMDtX2iby1nA0K
         zhyRNZ8DlarwczsaVm9e5qV/p3Xm9oqpbvIH+pUx8bhG+8tLolC9Pr/dci58/moMidXb
         6j80uuHX4wDAEsgpWaqF9kYmnyA3Z8zQYgT3oN4RlI3IXrJehqV1WJohE/Kgh07Nge28
         pXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        fh=HWUJXUX8WgUvlW5HZf0onRbwtrgBVQPK3L9ZDdRb6kI=;
        b=PpLDzZbk5ICz/C67DMVyzWMYz5Ts6w3yoEO6LT9JAvOIXy4Gd0SXbLtQv7EmeYfTEN
         33wS6Gwo0lZbNuvrIUWVl8ISirvUTPcYkIgPtsiWVsKoUeC5d2l0/22TaXjEnRmpBwH0
         kHLEirKfOOsV4aqwpJMAXP/JXni/QxSDhJsontWlvq5myEsMBEI0I55hZ3DNlkGh17VH
         JuHy5YyIP4SROr4ZQm7fWjfoSLSqiTuaSUPUcOJ06THgD7v+Dm7JpmoKTcpxe7JLolVj
         oo04gyBmVKmNq4vXAkTuqI//Ka6nkxcvdQk8PDHkt0A91x1HFE1lTznRRH9U/wIxdFPt
         5FEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372465; x=1791977265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=ekAsJW71M9T9SI/egh4sshHwR7cszL3UPcuQljDyCjPu7KzXjwEDvTaRBqszr9jTbp
         o16EnFaWwL7HV3TI2cvXq7So3tpp9Vblj+zpY5YaunZJfBSjceaGGNndi6DY/10ernu6
         Cf0dY6kF02KBthwTwnnx2Cxldp+xxDfh/XYHptxyic7YhVr0tJyT1chQXp02h8jCwZEA
         j7g+h5Gu/jKROvgVOOqWTNcmakOKkgi9JkFpsY3vvlVfmNklHhnI5LApP4O6CsxEgxCK
         wk3Fpx9r2fZhJdCW3ZTZfPt9YpU4hlZ6lRJTswEUl0l79xfQdsIYIOxHiK/+3z4o3mn2
         CSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372465; x=1791977265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=ozITYJgnwEjA4BAUcneaFY299uFRyRvM8ynO9pAl0mn4q6CHT/oWlIgie8fukIUtVh
         ZcvMJORkFjyGtHbALF5Y7Fzx35LC6WImljnEsD0FFs+jAsmIwAIIqUyFL39KAdi0oTAF
         ykJyX2KCSDFncpYT/DByPtla+obl5IvYeH2C4SaISebLglBDhp0eLyubey5/3vyTAK1W
         LTd1MgK4SQd9rHyteBd4vSSDMq8s7JmAhaqI4Zp4dQwYvXSJqeMRbWhhvNHQ3Eq2BVim
         GGJi+tWdZ5OZXW5mo0qjYQJZ2BRdFo6Cf/3zDUgZEj3QCQ+uqXreC1AN/ODF6Ft4u6vT
         fzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp0Y+CEsA2opybflPsnZZH+8wCtpBEnXIl0IVZz/8tiLmYWWnGfVTYKda1bt9+or1piPmPLSlnGd5qkoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmMTDrz2imiKMcWV/exKCnri2NUrRIIdmgKzQRf5TlGVDzfaBu
	C9k56Ib8TLswH2rBJFORojBnOJxYbk8WREdg9bX3Xg3bWOf2hsc7hNO47AmHjXgJj92bWFMB87Y
	Ul5ACgKsX+rGECCRgYhl0YjolmEdbFIk=
X-Gm-Gg: AYBFou2/e0IOLR5Zj2DVP2oe9+88X8WIq0mdQcOg0SQVqs2odnwpRqdqgzj3k0soyk5
	Y2yddikb8hbRXBw4b6jS++x39GUqd5tCWDq1Ip1akyi4PxLZBaUYERjRmHh80U89Sn8XPNfHbs0
	kl2H0oy7T3d3riPQFbo2ghu4nyJkKSZ5qhZhr0TdKK4xDLbzQRLrHv74k85un8NtpzOHzQYu5uP
	2ntxQXPDh+l5eYkCT2x7j7CsYx08DnQnYa09yXYOFIMjrKCXdMh5B1K0xjx71t7osCVWWQokPh1
	zS/8KZYSoIXuERArnvVtY7qxy5Y0hs4D/uadVnnojPbphj2xM9FnaccGdY6uxjO/0L8=
X-Received: by 2002:a05:690e:1182:b0:675:6d8c:f445 with SMTP id
 956f58d0204a3-6790a0b3142mr964922d50.10.1791372465276; Wed, 07 Oct 2026
 04:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808112043.2781244-1-lgs201920130244@gmail.com> <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
In-Reply-To: <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 7 Oct 2026 19:27:34 +0800
X-Gm-Features: AclHuK9xkPJNTgSq7-x7dqK0gz-t6G-LeWcqzQTZVQ2BJAwWf9PL48vGNZtximY
Message-ID: <CANUHTR_w4cOAOoYDCDS8bwzPEuYgWp1KjZztgLx-4P1kkhwjiA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on
 probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for the review.

On Thu, 1 Oct 2026 at 04:35, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Sat, Aug 08, 2026 at 07:20:43PM +0800, Guangshuo Li wrote:
> > hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
> > path does not call the matching pm_runtime_dont_use_autosuspend()
> > before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
>
> Your descripption doesn't match your patch. You change change pm_runtime_enable()
> to devm_pm_runtime_enable()
>
> Frank
>
> >
> > Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> > index 4805ce390ffa..470c88f36d25 100644
> > --- a/drivers/dma/qcom/hidma_mgmt.c
> > +++ b/drivers/dma/qcom/hidma_mgmt.c
> > @@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_set_active(&pdev->dev);
> > -     pm_runtime_enable(&pdev->dev);
> > +
> > +     rc = devm_pm_runtime_enable(&pdev->dev);
> > +     if (rc)
> > +             return rc;
> > +
> >       pm_runtime_get_sync(&pdev->dev);
> >
> >       virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > @@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       return 0;
> >  out:
> >       pm_runtime_put_sync_suspend(&pdev->dev);
> > -     pm_runtime_disable(&pdev->dev);
> >       return rc;
> >  }
> >
> > --
> > 2.43.0
> >

You are right, the description of the patch does not match the actual
change. This was my mistake.

The patch tried to address the missing autosuspend cleanup, but
instead of adding the explicit pm_runtime_dont_use_autosuspend() call
in the error path, it switched to devm_pm_runtime_enable(). This made
the implementation and the commit message inconsistent.

I will prepare and send a v2 patch with the fix matching the description.

Thanks again for catching this.

Best regards,
Guangshuo

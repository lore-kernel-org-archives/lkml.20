Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53B43AF66E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989382; cv=pass; b=X7l5Au59jyOVn4A5pvBT1RNaW+q1152emD7ytfRDF9xv9uhY/CYOS2om2yO0Ss+7RHgNj33IMbCKVxsmIe7QNvpEMLmYliam2pVnc4xg8VIupeaeSDQ3AqGEpw2DXaGzdXUCcAPXYnUNO76xcTy1/h0LK7XHq6dlDPOWzvR3hOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989382; c=relaxed/simple;
	bh=UY27w1Rfg6xCtMs7QTO53sEOpBKzcS6nCTvac4TS40A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTRtbIA9WEcDwFF6f3sOZk1yi/eM1AQtfOV0xE7IuCoOFVl9HSKd6PJSrXFgmuLedAuesWSiaWpFC0Bi7V/ioi+IeodzS533abFSnVo3BcY/Jj9npdz4yNRxVnwAMe8M4qSpRyw/LjEgoevrmJ92vWpE8e6Xz64Zkk7jV38czfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSdI+FYs; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSdI+FYs"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c16so19858487b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989379; cv=none;
        d=google.com; s=arc-20260327;
        b=pCe9JBUQR3Cb55SfH8r9KtdswaJ5sU6LEVk9n3LWu4BGu+j3F+1VEswODG5FwrTV/g
         9OZP67EVD11ZfLQEj4U/F3EqhV+Tar29AI86gieXq4WpQEe9Ev+pLEeU9Q7IKYchf4gE
         0DSWfEGndjHUdjBcHeAKJR+r8EyA3j+H+ErSzkjfmihNwrntYOfcdkMQKEbdY3fQpWO3
         LfXQ6Z5e69ZyKJN+ixnjvcmUkJYm99+ai/L0F8Kc9Vl92Sv9h8tAS7Oc6axNqJJwhvbM
         dQSjqC6ZsLd8lqCNSZ98TknpW+s05wjpHYhRg+wANDXZTI1AOwx8DALCASZC6XQzfsd6
         97zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOZGG9rQS4x6RO0sAzFbkNSMIY91sIYWznb6POPYtaM=;
        fh=nqRJhsR4BtAAEgHcmUfhSvOvA2GgfOsXxebTskeW0qk=;
        b=BAdltXsZt3del51+q4kFY/n/A7HNl1Gz31HEzhH2aOZq6K44SlqZTfgg+8uZiBqZYu
         DMs9F/zSllO4pcNDOB0wwWcICqKmn9OBr5eBRp7VwKjtOneltXp8KAJfhrnownYPiYiQ
         nVyDxeQPeWBW9j9x/LH9cf4+ZcELxRTdQ+WwYDiUXIawkUUGv3MUUFdSleNN87H6VexP
         zT9/PBZpM1fjSX09s+6Kn+40GPGeutozNf90s17sZMH/TqcczqQhBCloZSZPswc81Ypi
         palcn5TQgrMgzmY3bJ3H6kMUYze5MIDP3EdtcgWng1u1310iGGOWgFVmZifZnPy4drqd
         G1ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989379; x=1790594179; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOZGG9rQS4x6RO0sAzFbkNSMIY91sIYWznb6POPYtaM=;
        b=hSdI+FYsDeu6UasZMF5RDReUq7JWGuq3otRkujWb6JLFMDEjm8ireuFceohum0h0uJ
         VQEjyp9lPc0C81/aeF/w+QVzbZiF3esQpfF1rDs/7Z+cAfqITqj0iJbqtcV9xlZw3xRj
         N8aDF20fNmOBCQEO7/8B2rbelnKNWBx/hwHNR8Id6QDIz7vsqXQOUN/u5jw9vkYIJ6fs
         1zOZhXYMmJM4thxlNzFMLlyOla9g9lqrihXX9jg/7HQ1bwdIbOefrCR6KjgbwsnIQpXm
         6UzK7I4XVnfaw6mfZ/Q8iILOu2rpjSsnXBu62BaH8jmkKpo3g1JZ/tHUM4bRyRmWhAHz
         a/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989379; x=1790594179;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOZGG9rQS4x6RO0sAzFbkNSMIY91sIYWznb6POPYtaM=;
        b=OeMqC/ly6/pHWleB+9aBRDJxkBEKHZbtAT3aZ6AXLUnxx4oZS7jZW+4kDiI3gpdky9
         MrOc1Wf5/hB/u8Ri2rL79iNTko6nKRWseESlUotPooD1+0nP+K7KlTU/37eSKsPguh6P
         HTURxg9r3myxq1LhVYyuzH6bJglWRbBTn7dKswG05wFjbT3PNshSqbMcXyK6AUVQ2gTz
         7vJbZMQ77OybiXqVeoeKj+3cA6jyX/5xJ5AXr/qZIlqTweueynBwzgxwvpCTZ4PkSmBD
         iepBJITPNEXskmCbJe9mqyWchaJGNXiBAMKdSM8RkxDabNgxX5goOoWFXHcrdYmfnQwg
         5oBA==
X-Forwarded-Encrypted: i=1; AKwUvBzgR72vf2oDbZR9bPh1ukpiuOeteRxWZ8wySh9/G18EqzwRlI+b9XA+Ec0UQsLljP3+ztUcFW+H/4nL8SU=@vger.kernel.org
X-Gm-Message-State: AFuF++muPvHVErTB9ADdgxwOj7bc0aBWRWE6PYcghMA4hBvDXh3ysZmC
	Tfl2Lh3aQY5vci7ouRpnDwctHU8c/Diyo1ralUwGeEbtdhvq1MN2ajD2g/WYxjV6FGsZGsLAKQl
	MbqEfuSwHK5smm7/iVwM5BQJJRfn0PvU=
X-Gm-Gg: AYBFou25vAjoYyEkYzwFBgwaP7i5dQ53zVihdvXJ3r+es9dFLV3x25v/0dntAUhcCc3
	ValrszXe0cHdLA3sGbnOFxxCrWRyL0BL22XPxPmD8R4bqtLUos6NcXfZSLovChX40aPgZWYLLGv
	EOVxmyUTnseMW37OIMPjztBRruQhb5Y6MPgJedkCRjFs8x3cwyyln8q25tmMJCQh0zN8gwCVQob
	+Q6XE1xY2/+D41F1tojMKIcybxl1AaI9Q1O0pHxDMg+HDS0cgzeYUmf62Ej0QTHm/Jk1WXbyvND
	bjHciEvBwjf2hGPju7YfTABF5sI5ez2lw3tnsmeDCZeHQst23jeZnD9zUQ==
X-Received: by 2002:a05:690e:418b:b0:671:4ed:6b63 with SMTP id
 956f58d0204a3-6717fdf34d0mr2345152d50.71.1789989379554; Mon, 21 Sep 2026
 04:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913045001.1126563-1-lgs201920130244@gmail.com> <aqgO5PfShs5FG--f@SMW015318>
In-Reply-To: <aqgO5PfShs5FG--f@SMW015318>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 19:16:07 +0800
X-Gm-Features: AcwNN1U2EQbqeVHXltNz7b04PkxaH8i1uZCpkC4vS2xVRRfVK0ht_Ajux6vb24U
Message-ID: <CANUHTR-2haN5Z6ajc8ELGF57JvTHOCcFG_ZzXRdR7XwgC3PKog@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl-dpaa2-qdma: fix ppriv memory leaks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>, 
	Peng Ma <peng.ma@nxp.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for the review.

On Mon, 14 Sept 2026 at 23:12, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Sun, Sep 13, 2026 at 12:50:01PM +0800, Guangshuo Li wrote:
> > dpaa2_qdma_setup() allocates priv->ppriv separately from priv, but the
> > allocation is not released on all teardown paths.
> >
> > If dpdmai_get_rx_queue() or dpdmai_get_tx_queue() fails after
> > priv->ppriv has been allocated, dpaa2_qdma_setup() returns through the
> > error path without freeing it.
> >
> > The normal remove path has the same issue. dpaa2_qdma_remove() frees
> > priv without first releasing priv->ppriv, losing the only reference to
> > the separately allocated array.
> >
> > Free priv->ppriv on setup failures that occur after its allocation and
> > during normal driver removal before freeing priv.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 7fdf9b05c73b ("dmaengine: fsl-dpaa2-qdma: Add NXP dpaa2 qDMA controller driver for Layerscape SoCs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> qdma_setup() is called by probe() only use devm_ allocate function
>
> Frank
>
> >  drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> > index bf771251264d..0f0fe0291a06 100644
> > --- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> > +++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> > @@ -365,7 +365,7 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
> >                                         i, 0, &priv->rx_queue_attr[i]);
> >               if (err) {
> >                       dev_err(dev, "dpdmai_get_rx_queue() failed\n");
> > -                     goto exit;
> > +                     goto err_free_ppriv;
> >               }
> >               ppriv->rsp_fqid = priv->rx_queue_attr[i].fqid;
> >
> > @@ -373,7 +373,7 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
> >                                         i, 0, &priv->tx_queue_attr[i]);
> >               if (err) {
> >                       dev_err(dev, "dpdmai_get_tx_queue() failed\n");
> > -                     goto exit;
> > +                     goto err_free_ppriv;
> >               }
> >               ppriv->req_fqid = priv->tx_queue_attr[i].fqid;
> >               ppriv->prio = DPAA2_QDMA_DEFAULT_PRIORITY;
> > @@ -382,6 +382,9 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
> >       }
> >
> >       return 0;
> > +
> > +err_free_ppriv:
> > +     kfree(priv->ppriv);
> >  exit:
> >       dpdmai_close(priv->mc_io, 0, ls_dev->mc_handle);
> >       return err;
> > @@ -787,6 +790,7 @@ static void dpaa2_qdma_remove(struct fsl_mc_device *ls_dev)
> >       dpaa2_dpdmai_free_channels(dpaa2_qdma);
> >
> >       dma_async_device_unregister(&dpaa2_qdma->dma_dev);
> > +     kfree(priv->ppriv);
> >       kfree(priv);
> >       kfree(dpaa2_qdma);
> >  }
> > --
> > 2.43.0
> >

Agreed. I'll switch priv->ppriv to devm_kcalloc() and send a v2.

Thanks,
Guangshuo

Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95CC40B6E0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065786; cv=pass; b=d7G/X+1DnRkz6w1GVpMIwzmMVMeujwoMzJXfryEyJlfvpxHSLgVv6QqWmrmOnY8uk2UPK25AJ5TM50Vq6fjpdrux8mIQ0MLznCoZD0QY3Tt3ZfvXvB1kYl9QsakNuJISc1jeRpFzVV72AIPsDIZvbcF4YagCxHbHYOdRpz89rho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065786; c=relaxed/simple;
	bh=Q4t+g3vnDy2gIUVRjJal60TyzupspjgjVhkD7spJfro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDsmmtIUCYrktoQ8YfCarbYNvFnvKX2riSzHAa9+7OkbAvK+6buzqUZh/npx6b/Ui5wqMSL9ozt/Hey8hF59m2+1vCyqzSVmn4a2tvZLWHnysMGzgmKsZuz55FQW9ToJaQeDnJgPWQIhCGMeeO5qTVsG2uPZJNTqMfti9l0QD6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqTXdCWn; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqTXdCWn"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac8d1dso27694417b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065784; cv=none;
        d=google.com; s=arc-20260327;
        b=CeeCgnbMr2PeIvV0cRnMvjTG1Bv+lpI4Wed7Z3/Ol3ZEgudITHtFknPDin6WybCTdQ
         T6hntM5mvlRYL/Y+PBzcb5JFocgEKjFztSGcDRdD9wz+WuYDcDe8l9suPUUwFkgR3Wqt
         YZrzPuKMcUJk5oo0pOdxdT4QHS4TiKDYkGH+oB2dCzMi2r48EeY9RAXj3JsxMjtVHu42
         q0oFOuv1P8OIfWiT8T5qEFMyNDyooHFjX1ELVrb6KG512EX3Avaq3wYk6V/v2AQK1N1H
         T94XaVIKdtlgC6QYzNgeQWZa0WczMs9oF+TyFwUxEnFLl3OI5SOofwGYRI3Q54oIZrUQ
         mg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        fh=9n+2/zK3fd4CCyBBzjSwysPwiOFUOhx4hkciL7HXWGY=;
        b=Ag9Lpp/t97XnYUpYw/0TrNWdyqOlMtXJSjKsacDz/BRQFzbrs+XLLVRvBj3YdcskZc
         YkI7toanMvMvx6rwVcnjksPrJmpz/aS2uO5TksEloCYtaC1fBgYleDJyS8e3L6oeklpy
         sOqaK+rkAHUNy2UG6dE/smIDVFadaoRkqkL3L1v4OfsCnP9hlIETcwJHofXjPOd/5SQM
         AhiXybGrhssxIeyL10IMPHxucnzshLDMD9xaUR/Dbllvnsb3gR8ZBtboRnGPhJTzzP0U
         +TyOUQDxEOJaJw74DxP+KWzl45kZq6hci6Dh8SGoMuqrt3Ng5MqCuTvcIHE/z/AHVxni
         NLnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065784; x=1790670584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        b=WqTXdCWnPNIBF6gwYr0lCUuodtb2dP9g1xg8FZf3cDHcewVejddMJzcRof+P4stUe2
         saUPNFn2vmGghp8LGSpRs/oNHJQZLGILmFRBU9Mmta8deOqO/tTnycynUisR7in2zAQo
         SivNA69tD/quH6B/On9rejx4AFwCfuzl1Nw5bZCm4vKfKZ+J+dzaQ6go6tYQnsFsVcjQ
         ljMElG071W8Q3f75QkIeh3nHLcjXWCulFTXZwvhUwCIIRPM/AeT9IQpGx6Pm3+Gc0jv1
         yXzopX+yfLXo6yPIGG7PcG3ti7Xo37qABUvfmyJfwFrEJwAXSs7gsFpYRpJLReKxW2z+
         M07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065784; x=1790670584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        b=RNiTcZmwaFil9Oko+SyzTJc0sEP6qXRuVyHNaV3MxSBVLFWq1hy7etCTvZVzLcwjRK
         PKfwrkq6KoaTTTuB2gX/teh3tDX3zpcqkxKx3aa926VUocewzxeVf17eZE7BLIdsFREY
         /snIX/6giB+Jcc2iUNXEH85Ui87TbvBBMwLlaPLHhiO0s0DzZMhJf7RDYZX8rgtwjpDS
         SkfoviYqEcNWyOpDwxYRW6mkLE+cZDGsQJML+dbpVcYlzFTXl5Sd/4n7gjVQzi0UnfZS
         faPz/KNTATEBB6dksh+it3TVMI2k3iae0OHGh/FMq6bGyjnrBTDWThxjZPX6MZeFLRA2
         u5qA==
X-Forwarded-Encrypted: i=1; AKwUvByPmnnqtnKKt0mP1ZPOa5uvsa7g8ZpnZAjMeHCua7Lp81IVmb5jSLWZZbENwsCgbuVQdIMEt/jcit69m0M=@vger.kernel.org
X-Gm-Message-State: AFuF++mUXSFbI3/n5jKabpw4A2wVQZZJmLyBM3ZEbfJdc+temi6IaFI5
	pSALx0xyKbzbrj+NNR9mdGLsfK6eaoWAJsIlxgt1LRRuf6nyKESnr/aIobnmifkvtJta2iyPUYp
	Ab9FBzW/ophSn8XufCL6IRMkVZ4BDaLc=
X-Gm-Gg: AYBFou07hqekXmLiOfmaolr9NxTq4aLAY8rZ+Xxt2V8ZBg7qI37GJzzKYNRYg+YMFL/
	V9Kosl0NGHTCKc2QkSpUc7f89pZ50BhdzRs3AF3fm2p9wqA01eU6FrJokiV23xByj5mSTkKONrO
	lhyVTFk+SDBbf9OvScRpwtmpwckUIFojDKGGllsm4ipyD7t7sRb9QOUy7UwirxTfwQ0BPj5xYaM
	BtPXsJ8lQY32li2/UhlLRPHqSDfiwBsJ9pgQm7z0GP2ieYzaNYHrKH0OYu3oremMMPPBdtBBxqE
	GYpiOQBEi9DB5pUyaRNjbjhbfjQgllBywXuY0poQ7hLMDGM3CwHgnVEWJA==
X-Received: by 2002:a05:690e:12c7:b0:671:45a4:b282 with SMTP id
 956f58d0204a3-672c5517fddmr641742d50.99.1790065783701; Tue, 22 Sep 2026
 01:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110909.370945-1-lgs201920130244@gmail.com> <20260922074137.GG2348773@google.com>
In-Reply-To: <20260922074137.GG2348773@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:29:30 +0800
X-Gm-Features: AcwNN1Vv9ooUXHTfX-8aKzoQsfCH4263yxneaXbrNlAHKNAqe0WY7gylNd9nMJc
Message-ID: <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, 
	Ludovic Barre <ludovic.barre@stericsson.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Julien Delacou <julien.delacou@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

Thanks.

On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 21 Sep 2026, Guangshuo Li wrote:
>
> > ab8500_probe() registers MFD child devices before completing the
> > remaining device initialization.
> >
> > On AB8540, the main MFD device batch may be registered successfully
> > before registration of the cut-specific batch fails. In that case,
> > the probe returns without removing the child devices registered by
> > the earlier mfd_add_devices() call.
> >
> > The same issue occurs when sysfs group creation fails after the MFD
> > children have been registered. Since the probe returns an error, there
> > is no later teardown path to unregister those devices.
> >
> > Call mfd_remove_devices() on these error paths so that MFD child
> > devices successfully registered earlier in the probe are properly
> > unregistered and released.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/ab8500-core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > index f0bc0b5a6f4a..e675223b6023 100644
> > --- a/drivers/mfd/ab8500-core.c
> > +++ b/drivers/mfd/ab8500-core.c
> > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> >                               ARRAY_SIZE(ab8500_devs), NULL,
> >                               0, ab8500->domain);
> > -     if (ret)
> > +     if (ret) {
> > +             mfd_remove_devices(ab8500->dev);
>
> What about switching to devm_*() a.k.a. managed resources?
>
> >               return ret;
> > +     }
> >
> >       /* Add battery management devices */
> >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> >               ret = sysfs_create_group(&ab8500->dev->kobj,
> >                                        &ab8505_attr_group);
> >
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > +             mfd_remove_devices(ab8500->dev);
> > +     }
> >
> >       return ret;
> >  }
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

Do you mean converting the MFD registrations in ab8500_probe() to
devm_mfd_add_devices(), so the children are cleaned up automatically on
probe failure, e.g.:

-       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
+       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
                              ARRAY_SIZE(ab8540_devs), NULL,
                              0, ab8500->domain);

        ...

-       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
+       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
                              ARRAY_SIZE(ab8500_bm_devs), NULL,
                              0, ab8500->domain);

and likewise for the other MFD batches?

If so, I'll rework the patch that way for v2.

Thanks,
Guangshuo

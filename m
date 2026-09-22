Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687463B19BA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045837; cv=pass; b=tRDGFov1CjG6SbEzKOT0aXHqWTP+iWqZbBbIj5DX7zrj0PNuPwpRZqp2sS6KiZCweciY620c7giAX+yubhWcOXuHmWaX4FVQ30dyzW5kjmPLAuPklhmjTgrS3MtLyAEDFKV90JHhN6R5m6MsDYJaYgvTfstEnNvXkmjQcUDY27k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045837; c=relaxed/simple;
	bh=rSSvhgyRa46p7j/SsA/mJy0NbA+KId9sWY2tpVWSynA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEyP9T741avBXYE8VBvJEbg0Ya6f2FxtMPVyh4ubM/Q5qJdZ2eyXYDGIDI4CE7hlmzD2tl4miK7ZcaW0KkpUHsEditmRVY6Glg+ijVjLr4CXWqbkIV8kbx8yt4k91qLYdYOyL+CGy63B642QwNBq6f5Nyzn6hPjC9/08DBnXEZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpAjbrQL; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpAjbrQL"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66d1447e2b1so277130d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045834; cv=none;
        d=google.com; s=arc-20260327;
        b=bHl5oFAWft2YjIMFbPOJhoyuC/VYpMlgg5o6jA4ZgilVSuXlJDVNf7JmTAX4U8IOKx
         6J139jQ/TeFbszkBfJtiIw+oo5U9j5LuQ9PlqY40BhNRYroX4F40wRgLFZgwEAtXLbAq
         xycfrjMCkwVijBXwhhJjiPWSNq2m/nBLgMntR89dmZc3gjiKxgegsfGLzvLCR6F7IQ0/
         2NmJbKCmXxffBrC4NHi31GNbHdru0uFMvWlF+gE5Ohc+mJkC/CpU0aRRvcmHB1tiI+d4
         8NnB9HWTrL/yUQT3yQa21tZmdy+RhSduXz6xauMuDhWj1V3v0JLF7D5kDK49EO63gjSo
         CbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X2tpzVt+gcVZYhPBgxtL8VLYLcTyyDtnxIRx52+6gIs=;
        fh=luPYiz8hIKSlp/fBQxh95WKqxg8ln7nKb54aGnksXrQ=;
        b=g/6fJOSBZh5bixtmy0EUZIRbR0pHTOOsRMcuoeXW6NQdkHh8d98QJLIFWmhDdsK33H
         XZBsTKCuf0rIMvPUS+YR21PS33l8WhWtvwwW1Nf6BFqXftNV5jT2k0H+VM5VHVgp0JKW
         tt2+K3HTqWREycz0I10Z3rKifJFQVG7TmlynhDZFM0d4hJEck94TDnM8TmR5z2h2eE9d
         1aY/CemCuKdfLJtl79QgOud+P8VCTtdv8UBW87RVK/k6mXezLvo8QKifUtDhBfNA22WE
         wr6kygDZM2WwEfnxlzngUkQh+7S7fmi/Drix2bBWbOX6SFA/IXL5exX22zCt/AiNoDne
         w44w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045834; x=1790650634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2tpzVt+gcVZYhPBgxtL8VLYLcTyyDtnxIRx52+6gIs=;
        b=GpAjbrQLYsRDi9CMshdY8i5LW0w7hYHUuKyEPaP20EppSr9LTcktfvZoQTPcCfY7Ei
         HZyH36RGX3VQS44/ejZd6/yJaWwJj0j4OcaPwc2zMlHJxZl8O8UVwLwLDhTIU6ycMtuH
         EQtYhl/WqjbRnH5wA+EwRfX6j/YmGrHPRb5SyXWPO2JeaAHk1iCHwamhQb4YE9L5XUI9
         iXpFC5jQrbpoR4zXktyv2REmco9XrhmkHRCqNbIOQcCLRc3PLBglojl0BSkK1Oygmr2Y
         Nb6G2WDrfINysnINCDChp0so5s9WskdrJkhysZ5vRQfCX9eUN+OW1N1vSCH0tRfXd8Lr
         iblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045834; x=1790650634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X2tpzVt+gcVZYhPBgxtL8VLYLcTyyDtnxIRx52+6gIs=;
        b=LYJu6AfvJLVL/chDi+cNyhFQbHW+2hlzkDiP2csdVqQkv+4A1CJNZngCsKG99j/qwP
         TFBr5HmpLdxGJVgemwPmu1Cb85vPFTWTWssb2kTLL+mlpc3KtuUY0kU3IqjXUvZ2QcBp
         nhnpLij2REPZBux8+o8CoeLnHSzP87z7211qQJujZ9BgK4Lo2mGH2VVw+ECynMIMOjTm
         CHmiWbGD6p4Nb5uHs7zy7e6khZUlJ/jlFa3thAtItpNQRvHCiZbkhKFCYT+7KzlH/ghM
         1mtCk74K9QO/SBOeIgyRBvYbu+JBvA/dmYGxmvpGCMt0DgRrjxd0lUsyMzTA0ifo25Hp
         SZSA==
X-Forwarded-Encrypted: i=1; AKwUvByydwJeccVbj56x9yOX63eTEilQzST6uqZBdGqvaC0Dd3XSP7hVRJlxFF2QrTaL6VuO+cvv+vKgCQQecrE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQi2PTTqyw5CBvjxx4XMTZ73Ihfj7KG4l9aatXWL180j1J2tIw
	+jpiXj2HYSMvZi+DL1ny+K3nuMPChRuBmWguXrDZh+fyqfcAEyoVYxgl4fhe8kCOw/5PT9oX2vh
	CFMe+8GkRuNlrKMIMhFQ1sZyKJEfX8Vs=
X-Gm-Gg: AYBFou12dlv7Y3+znJ0aGgaPPEUt9Wmu3czbchMGxzywkfLLpfmNvPzuLcy74eF+n1W
	k8PjSAHO6b3XB8afTsj6070O2pij8W2ukXQcp4nJPxxo+wqdUr3aAsM7sDNdshqPvkEfbDQ/+9q
	7U5eNFpfYrMsDxEShrFpMeqvSEgeL8aNv8xZOCFtDV37hsPVGu7guZg0zxqatZAlKgufsRKsDlS
	LOXPJska6qlfuquzEkn9o5GZlWAuBPd60m2QxZQ5PfP+WqNPkwrYS9dY7bhNOAudjJmYdeWdDVF
	ptc0a7Bfx8xbXUPiT7e9W5HzgQP/M3n7Wo0wZo397J8vAmHcWNwrGjJzCLQKjCJ+vdWl
X-Received: by 2002:a53:ac86:0:b0:66f:c1bc:4068 with SMTP id
 956f58d0204a3-672c2be0931mr690482d50.48.1790045834182; Mon, 21 Sep 2026
 19:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com> <arFJIWgBN0HXl7WQ@quoll>
In-Reply-To: <arFJIWgBN0HXl7WQ@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:57:00 +0800
X-Gm-Features: AcwNN1UbNyIyaIfw0nu4iX2Mqyv044MNcCqL0yukCBjNBRqHXUMBStARMmaPZTw
Message-ID: <CANUHTR8btEz8LVtyepZQscY6JMuMP=TqXsm62UWErTPGrdNOCg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: krzk@kernel.org
Cc: Tony Luck <tony.luck@intel.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:11, <krzk@kernel.org> wrote:
>
>
> On Sun, 20 Sep 2026 13:55:19 +0800, Guangshuo Li wrote:
> > init_one_mc() allocates dev with kzalloc() and registers it with
> > device_register(). If device_register() fails, the device has already
> > been initialized and holds its initial device reference.
> >
> > The current error path eventually frees dev directly with kfree().
> > This bypasses the device release path and can leak driver-core
> > resources associated with the initialized device. The existing
> > versal_edac_release() callback is responsible for freeing dev once the
> > device reference reaches zero.
> >
> > Call put_device() when device_register() fails so the initialized
> > device reference is dropped and versal_edac_release() performs the
> > proper cleanup. Return after freeing mci to avoid falling through to
> > the direct kfree() path, which remains necessary for failures that
> > occur before device_register() is called.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/edac/versalnet_edac.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo

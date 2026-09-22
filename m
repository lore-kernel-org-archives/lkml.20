Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFD8522682
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063998; cv=pass; b=C3r7DF+BCAQZNDq5MjBw5ujfNPcynVB+J0ROYf9EwPUaXlkYq56qFsqK1uBaLIxL8HAD4TjPdVCZw9XWmm0hoGM/mY2xX0MLIu6JvyFLFyfQQlzICmRrcjQ1PERP6fxukFqUyYqUaVrLCuGst2alzCKHfFUUanlXuFQh8ZyXrgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063998; c=relaxed/simple;
	bh=LV/LVjKM3hxN9GZjkxURfw1FVzLRvHD743trx/7Cv6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2L5aXyZRh6eLntoZo8WXx+d+UbCrPhUO2N2UAqOrjvOIi2SHCYzc+0uD16wrMopGK/fguusL977RHyFZ4tlwHGA8kNrkePQuXdNq7TNVOlG5CEl3wGC6d4/uFanML31bRZLUhKEDX4ge4IkP29VhhGPrFktuzpbKxiicHGvcUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZkY8H6j; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZkY8H6j"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-66f7a9afe43so3168366d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790063987; cv=none;
        d=google.com; s=arc-20260327;
        b=RtkWtC9zJrkhT504HSE1MpPUdAHZ2NY9hvlgwkPvVvdV2aJKIHj4SHH99B7QBqMIYE
         M68g+Y/z0tluZJdErzf0rzCi/ihUAbJBnr+vrkusytOj7veZhrnOAoxEWKD/PQLKkJbQ
         NqW6WfdvzKryEp0glwCxAYj/zfNjHTMzG337O6efNG85akq/VNpKc2afZ72+Sk+qlTzG
         DnBs4oRiu71eVqVRUN072y9h5AJ2Voy1XnfMdelO80wSZWzyfDtTrlO6n6JwZz3DGUvi
         dGDV7Yz+KZRi0PrRxkwURT7CblWS9s3mgQffbh8+fkif3lbOpd2Gu+9XEcRWbyuU5MUl
         ZmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dP1zCMCErPeK9F1TnlfMVGvOu9U8paGR+gGJEZKdb/E=;
        fh=daxjj6P/LqJnDnwJA10WDYBoISxXOx2/nG9gqL3gCiI=;
        b=UAOHtLLclc5xk7t8aBDXCqSlAClcGaN4noKne3C1zhaM0yzmSEkpN5xDDR8a+/yWqP
         w8weySZUxJ3NbbMQ5qdxy0g9NtZUC2HjwpcbMbDjqqe1t/c5Oy4LvPQ18lBV66NEB0N+
         5hDc1ZX4VK5zsIf4g4VKuMHWYg3a7Vcx//hBBHy9xg+hpUSjkoaly/QvA98LDKY778Se
         m4mv0OyIim1C/8STAFMTk42RANNFBXWBhvjY+NFRJlJrDDfLJnuWcnKgTo5WZm1jP9Ce
         fx1n0dxigaWxkdC4//OmM94DIJYlT2M84ShbXMPjS6Q5RDhVZyA1nDF/2nvKz1Dt4L38
         R3BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063987; x=1790668787; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP1zCMCErPeK9F1TnlfMVGvOu9U8paGR+gGJEZKdb/E=;
        b=SZkY8H6jCSOKxUld1lPUqCarseFPTbpgFZFptxqmOhXs4o+ZGI27H01tFdDrPYNCnn
         6j8WrNge4AFgRFH+TdEz4ms1+d+x/OHrXTjGPtQSDVT24CwGkjqBaTJEgfR090QWtjkJ
         CFc618ixfQ/nqOU/5tcXncV3lZqe2e7qgVAceYybwGj7kkrJzR54F+mQyUTcdDUIxlUx
         Dg73EUcmssPrraZm/MXWqmvxnGKuXNMKmOFH55fuciNuIpwc1ftd/gldPokebCViJjBZ
         zYzam0eiXw8sIa1mQ4jKEJnLJafKd4vUiy6xd/D+0grobkMbTo/ycsGzeIS2vJzluAMf
         pX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063987; x=1790668787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dP1zCMCErPeK9F1TnlfMVGvOu9U8paGR+gGJEZKdb/E=;
        b=cMe5Z8lP8SQfet+TQoAi+rZv6PMByycZmuwNUL71CstIvCwwMQ4txl+QbnxbXs4xDO
         na4j/pTO1m59ysEE9TGFpW3sItyMb7FiPkol/ekqq4tAm9j9Z5AO8dIpWgXh2YDuqpuB
         tNZWLxMX9lxP4ks5CYD6NOkBPq318NaFIfW83fik3losN5rr0/v0wrfC4g4VUYY05VB/
         K9iFWEQ9CQEXt5rH8Od7KBZy2S7SLExH71hDnQxDuD2oNFX7Obcljl1HPioQ+myHZaji
         IPE5Idw6K3IEgHSJSXWx7E66vqulbbGVWGdV2pW7j/nOBgFdlsPPOhsG0q62OG+znkR2
         We9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7JaDiWLXQOIBGE541qR+WfG2nY282UCkHK0muJGPNy2MdfmHdJR592Bu+MZK6QWRnMe99lL8FD6OVoIA=@vger.kernel.org
X-Gm-Message-State: AFuF++l1/l6WoJagI0ZiiCw9OqxAth+35NWH2Zz6xsxDtZJDiO0zBOUi
	tRkZ03QNACEy/e8vTvrhdipdYWjTY3+HxdSB+goy8ljpzd7Iq8Weq0j6BuhlvUn6xpQ7VVyjUCV
	AMo7pBT0fV/jVrDW6wS7RnPL6vF3h0nU=
X-Gm-Gg: AYBFou2hYsRq4eqmoOfvNo+/vP8YxLMT6RcMkhKULQNfIy3rLmJ3sGC31ZCZiUrDHV/
	xbQxpwRPX/f+dRwStsLUcr5zq2gHBSh3HgRsSIT7KefSDVaiWMZKnjEteT3MrNVeBtOevKcUHf2
	+5wemJqbd7qy/M3Ze6QKjryPhoYiV46j46yzicI9EO70d8vIujoNbPbZWEP4y/2j5StdQYWAX+j
	Ie4Mg7v+2HcD0T049AJNXOh5BPaC1NNtuXxWOJadbE9yP0vl3TE55fd0sqbdadUlPPb5DcuOZk0
	PsdSglxng4h1aj5WaG4qeSav7ubGFe/+Jm03EGLwAXZ01NfgoTSG2/pcmQ==
X-Received: by 2002:a05:690e:4105:b0:66f:c2c7:3a4f with SMTP id
 956f58d0204a3-6717fca0d13mr4306035d50.19.1790063987418; Tue, 22 Sep 2026
 00:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921104058.353748-1-lgs201920130244@gmail.com> <20260921110512.GS106095@black.igk.intel.com>
In-Reply-To: <20260921110512.GS106095@black.igk.intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:59:32 +0800
X-Gm-Features: AcwNN1XxyQQU5x2vBD_1jw2pjdvTRbzVQZFCGqidJ6ftnuC_3eRhT9BLr4HUSn0
Message-ID: <CANUHTR9gA-mKn8Y496Pty4_Fhu3BSSyhXWrmiod1WvuVdQjkag@mail.gmail.com>
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mika,

Thanks for the suggestion.

On Mon, 21 Sept 2026 at 19:05, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 21, 2026 at 06:40:58PM +0800, Guangshuo Li wrote:
> > intel_lpss_probe() may register an iDMA MFD child before registering
> > the main controller cell. If the iDMA child is registered successfully
> > but the subsequent mfd_add_devices() call for the main cell fails, the
> > probe error path returns without removing the already registered iDMA
> > device.
> >
> > Since the normal remove callback is not called after a failed probe,
> > the iDMA platform device remains registered and is never released.
> >
> > Call mfd_remove_devices() on the probe error path to remove any MFD
> > children that were successfully registered before the main cell
> > registration failed.
>
> I think this could use devm_mfd_add_devices() instead.
>
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS devices")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/intel-lpss.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> > index 63d6694f7145..657b1e3fb896 100644
> > --- a/drivers/mfd/intel-lpss.c
> > +++ b/drivers/mfd/intel-lpss.c
> > @@ -455,6 +455,7 @@ int intel_lpss_probe(struct device *dev,
> >       return 0;
> >
> >  err_remove_ltr:
> > +     mfd_remove_devices(dev);
> >       intel_lpss_debugfs_remove(lpss);
> >       intel_lpss_ltr_hide(lpss);
> >       intel_lpss_unregister_clock(lpss);
> > --
> > 2.43.0

Do you mean converting both MFD registrations to devm_mfd_add_devices()
and dropping the explicit mfd_remove_devices() from the remove path, like
this?

        if (intel_lpss_has_idma(lpss)) {
-               ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,
-                                     1, info->mem, info->irq, NULL);
+               ret = devm_mfd_add_devices(dev, lpss->devid,
+                                          &intel_lpss_idma64_cell, 1,
+                                          info->mem, info->irq, NULL);
                if (ret)
                        dev_warn(dev, "Failed to add %s, fallback to PIO\n",
                                 LPSS_IDMA64_DRIVER_NAME);
        }

-       ret = mfd_add_devices(dev, lpss->devid, lpss->cell,
-                             1, info->mem, info->irq, NULL);
+       ret = devm_mfd_add_devices(dev, lpss->devid, lpss->cell,
+                                  1, info->mem, info->irq, NULL);
        if (ret)
                goto err_remove_ltr;

...

 void intel_lpss_remove(struct device *dev)
 {
        struct intel_lpss *lpss = dev_get_drvdata(dev);

-       mfd_remove_devices(dev);
        intel_lpss_debugfs_remove(lpss);
        intel_lpss_ltr_hide(lpss);
        intel_lpss_unregister_clock(lpss);
        ida_free(&intel_lpss_devid_ida, lpss->devid);
 }

Would this be the preferred change?

Thanks,
Guangshuo

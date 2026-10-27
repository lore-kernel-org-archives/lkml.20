Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118890;
	b=oIWB0NwW6t2dfTUS4PlynSRR+gE2SVr1ttxrzkdth4bmOqvuG0o3newwU2OaGrmNc7P5
	 a2iIxoGTg1GlC0uj9/TqEK62GFXx9UuKW9VTOsFwNIzu5lLDL0qpWCJ7un0U+h3OBMeH2
	 B3hUYPVcphuZDmMD6a9BCoAVTNP3DpS6sCx1ihjO16GFHG1ryL2Bx1ki+C3l5gjU1jGGl
	 lw1rhCveaY1jKAyLfTNM2Zp62CjzWtt+Pm2NZew/ipLezdFtHh6jU9jnZ7LZtV6dN5tmS
	 +k6On/mHJ1bhm8Gx2g3AF0QHXRUlNkSdXJYRHXzXcxB61rsJWI6QXHEv9Aze7WdS49A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
	b=Nl8bnHhNzcZ9Koy4Iy3cv6ECYkHPoRRge5iwfhSHPNJeLxcvpST/xNe4bSnSZ7IAIwTq
	 YOkiYCrU9sMc/E79PKwDmknlPNLwKBYVEzqwF/RlIDPd1FYISqnc5DqOqTAFbFtPLasVR
	 K9bUlCvaGmJnbQ5V5wT/klPF65JzAU1GCJpVb2txbI+nmNdrL0NcCeHXMEDfczbXckuqf
	 kX1ViprHBzOTziDtjUzlW8+DXu4rcnQwHVx1LMP/NqcX3zGIA6XHK+GI5OmDfi2VferCt
	 ewJS9U0cQe/wtNnLwhH4lDFjukpVM/tW0V4JTmwNIJUgVh/tzBhxLzwlFrzHwDHxqsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGWSWKEN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E3606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5E3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGWSWKEN
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b5fe87so35837d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118888; cv=none;
        d=google.com; s=arc-20260327;
        b=mrdHxtGcxZDNfFtopRQwof8cNZ+xKUgciMTiC84SdaBQEe1SNyUp6xQqIBiXMAVSA1
         D9+VlN4nskwOBtXtBbd7ogtpGozrCGEBoymPfv0jc82hLlyJdR8M8YmuwfxNLdrq6GTE
         a7Lb71G+HoKi06zkXXfY/KYcOcsOnc41PcI1ePeQLsBeuATxz3ivK8TsmBHZzyb1jcmc
         kUPkh6X3p1Q84QFymSK57CqDVZDV9d7Ptx7JX8ZPnPzOQI1aTiaZCsl3QNiuqgojDM+9
         GAg8Cmsixg3fg8P4dWDqcx4jsXlO7obZYjo5BexCSkcQVUvRkSRuaqiT9H/gf0+gHTOx
         1KAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
        fh=9iflGQVa4/HJ5z2N2pmVxkuRUhmleBVp4Kl78iVOfhQ=;
        b=SX14tig8j8ByKrVrp94x+zrmq21tsxjbv6ronbgK2nIPsH1USP/Nv8JbuEkYKOJI/K
         asBH2oV4TWm1qZ09HDGgWEyVL073Dm1m3iR3k8Q5IcLpztSlFvSoWe/YViT16Cez7IW9
         7dkocH1Ybuq3Q8GBHy1n+t2x1h0khz96qnKAqALh0VaGQbhURW+o5MaNRJb1xbxs1461
         s2ue1TFonbSeUs/7yCjYjANUwjlSOdHiPY14C+gyXz9E8nLzJYp3WFTbYAVu8IJj3+N0
         lkHtNsPax31eCU2nk4NnBQyvg7lv0cEVVL0PJP55BE0sJwuQ67KmWZZJJ55+pUezA+Pa
         kGNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118888; x=1793723688; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
        b=CGWSWKENimpMCXj8PDWsi2VeR3x+WvLY96EsRCDrD1xbCGl67GkJJeb1A1OCZQ2ue+
         68PE7NUVO+oWpwFm0S15j6LMfcS3zXFzRMQqaqHka2ZLMTNlbaTFgZD1TVZ4K4YlMgQo
         vjBE6CEKxxtFeUSWPvC7IthVqLvsdorqZpNovx3sfR82GG05UUJNcf6emNxFQioKKe5J
         aQZjYUSiXClFvjcVtiI6ti9ztMDxpMN2mDYWmoc+2ne9CPGptT8vMlqy3mUPWtE8OTde
         VWf6En89Wdfftxm1CdFpbnlgNPk1QSTMWXcAB3Cs69AVfOOQqaiI0AYEcLeb3hc12mEB
         iSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118888; x=1793723688;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
        b=b/aQdXmZob/XjJHEzkJWl+GN5vF7SpV2BoRefai6c1tXG3jE96Kte3wM8asJbsAxhv
         Xp9R7iMFeENaykOniCzkMyor9hr3Yq6NtH90TdEAaM2tWPS2dOoOl0FwAhqfBzV3CITw
         nwwIFwqffCT7VBbOvv0cOy4nVjOS+u09i+eEnpt+9Ctbumo/dq1/X5H4+6MGpQNPf1Eg
         7ZmPwZTMVB78Otw89UWpcSBE1XJSpNisSI78hlXl12gDTPHKrC17PdLFbcDaELqz1EYa
         uHFLqcTBSaLPexNvqZNYIxfdkTDXgQA+FR6hBSkiDxPlr4ZiAz3Ba3gpHoXFbWZjeJIY
         P+hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO3F9UhHuedc8/4WXxxHt5S1xNXWbOLla34V+2+E32x6MP6k0SxuWaeP55NkchXg53rcmBqlMViYKOePk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlHtZzcweOEna21xr9tryr2BnzlBajle6qz15wsSI4ngfrpHT1
	Mt3DRchWPaHK+LFKr9RVUBOKSJX1518PFxwv/fHpvL6BGSWY6Hl3r6rh2DKup2T9SlB0BW3iT/K
	kWRiEBNROeR/m7pg8RYNfn6PTbp3j/+0=
X-Gm-Gg: AYBFou1DMtNbOSDFrIv4ntfM24tYBPs57wcuw8HF8wXPXqN7koVDQ8pSEYvzWyZBmhK
	JWmV4b4ZesqEXaUxKZhPn3gnuy1twnMhJ79oLVtVlot3deggdV4ZlwX7l4m2H0lxqey0+Qphmtc
	gE44vf9NL7W2FwrnFifHquh6+4PWMEfy4TKgc4sk2W/xKMB2AzGaDdtmxgJPYUyiqqzv2mv1fJT
	XwpPmgLOgcxz+Bmb3UODicNXgL2AlinEyUumvCXIpppxuAY0j73xBEo/SUQ8kOSOfmMo1s5I2bu
	teKzJUqhPBxp8cynSsReDnrEqTKGO7wSypr/JCEzSrXh3cENdzE7zhycdZxq6T6Lxsm7JlB86J/
	cl2whLMdnvec3alchsfNf9FlN08MDzG1DMVsN
X-Received: by 2002:a53:d707:0:b0:677:cb43:4b3a with SMTP id
 956f58d0204a3-67a7bd688afmr23659d50.156.1793118888025; Tue, 27 Oct 2026
 09:34:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027024609.117371-1-lgs201920130244@gmail.com> <20261027162457.GJ2195460@google.com>
In-Reply-To: <20261027162457.GJ2195460@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:34:37 +0800
X-Gm-Features: AclHuK9F4Xh0ot3RGPhOyFM6lJKMyY_HosbzQTq8lFgxlR4gfFrqEYjNzCwXBj8
Message-ID: <CANUHTR-3nyHpBgEBA0wyPwMejK0WM-4yveENGZwV8wvkJbBwCg@mail.gmail.com>
Subject: Re: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
To: Lee Jones <lee@kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

Thank you for your suggestion.

On Wed, 28 Oct 2026 at 00:25, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 27 Oct 2026, Guangshuo Li wrote:
>
> > hi655x_pmic_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. regmap_del_irq_chip() disposes the
> > child IRQ mappings and removes their IRQ descriptors.
> >
> > The hi65xx-powerkey child registers interrupt handlers using
> > devm_request_any_context_irq(). During child device removal, the
> > device-managed cleanup calls free_irq(), but the corresponding IRQ
> > descriptors are no longer available. As a result, the allocated
> > struct irqaction objects referenced by irq_desc->action are not
> > freed, causing a memory leak.
> >
> > Remove the MFD child devices first, allowing their device-managed
> > IRQ handlers to be released while the IRQ mappings are still valid.
> > Then remove the regmap IRQ chip and its IRQ domain.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: eb10245fb37e ("mfd: hi655x-pmic: Add powerkey device to hi655x PMIC driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/hi655x-pmic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
> > index 5cb392892c19..3a7ccc9d30b7 100644
> > --- a/drivers/mfd/hi655x-pmic.c
> > +++ b/drivers/mfd/hi655x-pmic.c
> > @@ -147,8 +147,8 @@ static void hi655x_pmic_remove(struct platform_device *pdev)
> >  {
> >       struct hi655x_pmic *pmic = platform_get_drvdata(pdev);
> >
> > -     regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
> >       mfd_remove_devices(&pdev->dev);
> > +     regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
>
> What about devm_regmap_add_irq_chip() and devm_mfd_*()?
>
> >  }
> >
> >  static const struct of_device_id hi655x_pmic_match[] = {
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

I agree that using devm_regmap_add_irq_chip() and
devm_mfd_add_devices() would be a cleaner and more appropriate
approach, as it would allow the resource cleanup order to be managed
automatically.

I'll look into this approach and update the patch accordingly.

Thanks again for your guidance.

Best regards,
Guangshuo Li

Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C73C8700
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275679; cv=pass; b=K/b6WXyhAqj5pFURd4oUtzRdaEvNoSnGngD4Da9Wfflq8ZtBDU4dUtaQXRowqHdkjfEvb/Di8AggDduT/FgopgAqURthAs7BJAvO9Yex6U52RHeLegoPYx4UlKf21v0e2DqgFTdcoTN8HE0mXQFYijK08+tFwIfxalU+Ig0w0XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275679; c=relaxed/simple;
	bh=6+AbN3VPC2djC0pu1cQPeGGoEZd9n8NzM0GZjbHz47o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTKIR03v6b/wrScDTuYUma070x0BazQrwkttmAUYUTgbSKgQOqeGepbDohGiHh+qau23XPocBugs6Md6q/Q0bBEUZ2jvfpju0bwqIWxxWoxNCahpIVURdE+WmQSE+2GevwVhdqxvkRsTdRuxdGsuvm9F4gbXoNw5C/4oDWj6Aeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6we7MMj; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6we7MMj"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67718201466so297712d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275677; cv=none;
        d=google.com; s=arc-20260327;
        b=s0u3dlkB0Fj2wTqXQ0po0tXKPWuPhmZbDH7KDUQ/bDxwWmwm7gGgP0Fp/v3toz8Ru+
         L0icGHaGHm79uVooGJmsoIdY62wYDDXIrycFe8ZRG+f36KPZ+DEv/FB3WDlyHThsbKQ/
         WtKa9Q+3otuNjb6ZVoCBxg5W6jtdAMpejJPdB8nj9DayUwpgWS3YNRNKMlJ4AdlnpMPk
         goXXB1KiLDEvuVkH6fo7K0qT56I/CHhQilRK7ed7aWUxbh5jhb1Frl3AlY+Bdhe83TR1
         aj7gr+u0L9oKoDPrz9tPyy4+3X/CPfxZrfw79gzJUIlHyoT2qq2Gnsh8Puvb2Bkk4vsc
         Syaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I7c5sfwP6lrMix9foJyNvCb4liHbxtX5TCdV95ozbDY=;
        fh=h202IBPVyoduXlrvm+2D7UL9d8YwHGUoInNAJT2R4zQ=;
        b=D6WNWrBLCp0qulpfINDAYJUR9/KaLx3rvpqTwC1rG2QKvwKuFKW8kwIcA4oqGwlVZx
         5BcMmBvk0ElTo2MdrOP3EQPALA+t8p3VrmW1S1iibLMmEiXU3alxDltc5R8GQtYfuVWZ
         84rj9xufzERHhSrxQtY/iF/ZHBHSHXYXanNa4XlfZnuY1aQgkxEqP+xC74eSE1VvNKim
         VZYA8vjpO25DoMjCb9b5qiVeWNaOyY7RDsUwJgMKP127kG2qOfBxCIzSkEFeqEnqU4oN
         CF+oTCk25OB2x22YmAXh0xHGK0lfNsiMEIpT9BjRc5DdSwM1mEBtM9wSNwJqTlIo7LEn
         uLtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275677; x=1791880477; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7c5sfwP6lrMix9foJyNvCb4liHbxtX5TCdV95ozbDY=;
        b=J6we7MMj5JHG/NDh/MvoG3vgWkOmZEgk1f5enm42w3yeiV5afz8bfo5mXtG9NWV8BO
         nXSMWWZVqSTUfgsuG+8j7JmzT8KQJU7oTnhpw7RHhGUMNvTNbxnhw4Ej5/vc17S2Kh6/
         MplycSEYS+g+yExrGjMxCdmq0n83p6P+00a9RfjLNDtI2Tx6xajZikulGVtf6pe7ZgT2
         LTLpjKJFpfX31pr+qb+71f+E8L9H19NIyfaUyCpRhlq0vn2+B7ZYU1O/hok9Hz7xt42E
         TIbMm6+4aE/LURT1VdBpZ8+ymtc8pBLEb4e1UKZSOYqL9uiu9M8KjLmmWVmoniJu2W1N
         uxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275677; x=1791880477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I7c5sfwP6lrMix9foJyNvCb4liHbxtX5TCdV95ozbDY=;
        b=N7RIoCd42yzA3TYrCzwQEYiPnn10HNp5lyeoL7v0dckJWUPZtG/iSoiA6BtpuS1T2s
         sTl6RNdnYAF/obtY2ZhHLc7WgVhzL5xy44dFjv2OjPn4NwxMYjPmQdLHAFHIEENtbffn
         7s2khL/tUhyWIlzOQqLgupG37XqgQuprgJ3mBucBj5FvVFpHAGyDkC3XbnKGj7Lyg4pG
         hM8f5yME+Wp+DmXm+MfxDRFzsNwmGG+LSyC4cPHFaC6wn7kTKp1mciJXIUZK0feSy/Dq
         xhYYlcgEB/NfUrwIPRveVlvN7XNGrGobGNCuqBwRXvunwJQH92v4Mc/N2v2yABDcJ3K+
         6RIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVKMxvm974yNuqB+gCNFvinNPmycy9QvXIJ33Fv2Z7owZjv1eyn5eL3Viyf2JmA67ZNYIUXIpboEw1YEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNqi5X8cAM3tNcJlknnxoN73eiqJ9JxCJkO3lka8QVhlIcdIZz
	gYw9Ee21pW8Hu8ffeWWbakEuRIh11xMKPjObASXTGswA52/4EkAvs9ofX5rvTCdAEnGTKBqnqTm
	N1lpnuXxXu+K/YN5M9n6BRV/sL4PM5EA=
X-Gm-Gg: AYBFou3+2DCfuHNXt7eZNu6XGDgq4HFsS15SrslRiwZd+JJ6/SXqbAgZX4b7iM0Mjxh
	l8p48TH989SFhBAcIL3soY0zAIYIy0RMIgXwcLDe+iYWUrCsKOQFUq2zmgPQ8UrOONVO8VbkGTG
	kZWHCXJAFV0to/yZmWho7tpBT3XqPor0ErkVxQgqlKLAfKIpF8odKx72CvKDLdf7Nt6Ddilcs/G
	2G6B2faRz0WDglo2+8GGUX9/k/+ywaBOq4gwM/KOWZti8Z/4yToHwDxsoArRFxpTQfx68tuK5L2
	6RVKEqRLvmQCy41TUfXtV++RkKJf3uGV3bBxDfzZyr19tV24+pw3hJmv
X-Received: by 2002:a05:690e:4090:b0:66d:1131:b81d with SMTP id
 956f58d0204a3-678fcdb41f0mr360405d50.29.1791275676777; Tue, 06 Oct 2026
 01:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-0-291eadfde23b@imgtec.com>
 <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-1-291eadfde23b@imgtec.com>
 <CAKbEznsnKevHokY-ip6g7+TG+NQLJcKxaYEbqsKa47dM26s6QA@mail.gmail.com> <e392fbc385bf5db80287c1a82892648cbd57978b.camel@imgtec.com>
In-Reply-To: <e392fbc385bf5db80287c1a82892648cbd57978b.camel@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 6 Oct 2026 17:34:25 +0900
X-Gm-Features: AclHuK_f0DG7bI4umeIoFlnWV1m25NTWgedKPXlkb7bnDLSz6GBT4yhKqIaa5r8
Message-ID: <CAKbEznsMihNKYUDPYCMLB9RK8tQ+yvK356Uat6Fezo+Ge6JXcw@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH 1/2] drm/imagination: Switch to
 kernel-style MMU defines and access
To: Alexandru Dadu <Alexandru.Dadu@imgtec.com>
Cc: Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexandru,

> > >
> > >  /**
> > > @@ -442,18 +424,18 @@ pvr_page_table_l2_entry_raw_is_valid(struct
> > > pvr_page_table_l2_entry_raw entry)
> > >   *                        associated with @entry.
> > >   *
> > >   * When calling this function, @child_table_dma_addr must be a
> > > valid DMA
> > > - * address and a multiple of
> > > %ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSIZE.
> > > + * address and a multiple of %ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGN.
> > >   */
> >
> > nit: ALIGN is now a shift, so "a multiple of" in this comment no
> > longer fits.
>
> Hi Gyeyoung,
>
> Thank you for the review!
> Regarding the nit remark, ALIGNSIZE was also a shift before changing it
> to ALIGN.
>

I think ALIGNSIZE was the size rather than the shift:

  -#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSHIFT (12U)
  -#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSIZE (4096U)
  +#define ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGN 12

so the comment now reads as "a multiple of 12" (Only a nit though).

-- 
Thanks,
Gyeyoung

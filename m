Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA830C164
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853188; cv=pass; b=dFLS8bagkf4SJbNPV5+pUsIEertiJgeFYzau6kf/7mCjnvYHGu1mtEegaqxjv04B6766TlGaSZz7piYYYKQUStqW6OA7lOk2B0ZStVD0H3Sad0i1EdqfdVkB/npChIz1oPTmcxUXVjl6i0jcdiRxo+ASD2H+PmffB5V5OQFVEBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853188; c=relaxed/simple;
	bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJX/3jMgF519+Aza5TK3Ekc8rhuAzyrOzjxB4n24mUrNunVcPyQh4FYSX5D6HaUg1MbpySRA7I1+BMo9KFeNtrGXYZ9w0bgvKv5N8E9vaecB7Iq6QclyQDAQSGk+Z9FtrKEjxdxBHIFnk0uOv46xBu4Hz0eSzIe4rLa4Ga05DwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXeEmSz5; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXeEmSz5"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadeafso128427485a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789853186; cv=none;
        d=google.com; s=arc-20260327;
        b=sYBy3Pr0KefqpjKDE01D99FNEZnqmsycDd7YNp3KBNafZ5BZTfhR44l7V0y01hhP7V
         LgnlA8aKh11jUe9GNJPAIQkW7/92E+aTDao0tpR2XTVAitddoPBMSNuEePr8OWAYPdnv
         rs5mw5b0N8VjkQFPLdLD1Rmh41GN4IwjtFT3ztCzlgMgggBj0D8UE8/VwOy0ToGiKzif
         cR1CnzSocJKmLF0UI5ZzQ8n5gvmbzWP0wZNZK1DhB5RxyTlcmnA0XU+SgijCmi6o9Jd5
         TSO6p7onqAIywTSXyXPc0FYhR9xgIxipZWUNtNkexp8GVT1kTNpuOdBsjZaXkclQ9lj5
         NgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
        fh=t/BOQ4vNNxtBznXhP0O40MLMjIIjsr/fqxez+exh0ik=;
        b=kJr9oEt8xCGslzAnwGtVKTPIqIZ+yP7cXsMbdpVaYnjoRv7ZilLNNSeW0cfYCI5AiN
         2HAfNn4d0FBzYc4uXHa5YWuk/3aKfPNYHL1l5HMScn3OJHIj7b4PIEUl7J+vYrHwztxP
         cmvY6wai2gsQ6ZhNM07AMClnf2xthlBXRQMbPnIdtkPDwl2N8rhI35hSteN3+rTOEn4j
         7Sx3DHQopqIW16gbmwmG98I/9CxL1wr8MwJun9VjdRPUdiSalFJdGc+IUZ3nAoOVZYOb
         RN8wKgIBKB5MMaXB8Q0wap88iM5nVU0y9Rfv8KxRiDrqhLlGfT6isfdN0dF6UyDc3wE8
         SiLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853186; x=1790457986; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
        b=bXeEmSz5HxXwLfaedgvnv7MhxO/VY3MNqpIzYfd7oISCSrLMZMBeVZ4eBPbEI0KPEQ
         NJ/lUSHOWdt1CkVull13i/SgtQbTvXcuJSuokjPI0nB9dG3BL+nim32/uhsYhhy75mcK
         tDXDkYTzMmLvcHSzOSHJMsbPpPJCkYpUZNNKGTh+dI/PVEuuc04ELlMvUdRDJsH0x5Ey
         JctJje3USDlbNi9LMb090GjeQlAPl3mGH/HFxq86eGvgDTTjujqa5aUGRAMlkrjZ0X20
         xc95JJXpte4Ii/pf9DVPMTW+fcxqoWlzkvMMnK2pzf4kgsGFSjzVuDpvDLs0B++mQ7AS
         8KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853186; x=1790457986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W82cP2eM7LOKZLRzXX4bEVLA8ivt1Vz2Z6PZnWSs15Q=;
        b=eWm6/LR4TDqRcUinjeqi6LLJdtrZiTYR7slrdsPTZJOl4qA7p/uKv1wTVr7OwZ4WIh
         ODkl8B825WsBeTjr1tUavi1/PbZisYwDD1EG7jscpp4FBH9wRMca7NjVjL6C4WI1+4mc
         HY2S2q07GpZ1U18ur/Txhcjz8emec+YyJwMVp0VW+3PKfFyfSrtj1Iwz3yvwSRyopzlA
         n0Pqjo9/JCYBNzY2Krm//gdDoHTTZutZWQOxx2g++VlqGnPVfQr+X+sKFI6l2FGp7qbM
         EidgtO91tOfbEmcuZXS1GZHkwIhEQrNuzsfkQmQERSKZm22dI6F6tJbDN50Sxwhj/DgT
         vYkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIAmeIuocXuSjO12BxUf6TgjJ+ivN1IUX63ixQPWH6XpkG/UCKOzzxApXMNZ2f0GDzvT1UznItivroukw=@vger.kernel.org
X-Gm-Message-State: AFuF++kkNUwhyhutQgNUCYVmZnxuiPF4s71zD3KRw/8EwpUSVvyDbSkb
	Znyy2C84b2qpYx9CR1tfkmGRutdd1zeKYjndsI0VNNusNzJwUFREUwhXyyWgyjHPRLP1PgnUaTx
	5yu7DMu3ZZPL7EibthwlvFHjFHDiKppo=
X-Gm-Gg: AYBFou2Z8Uwot+ncFXyF0UFr7TV7k+h0Eq1m8tu8jsTtg93O3mdO9AsnZca8pefe4xh
	6LQQNCFCc9qVw74NlG8psISY4RqGjGhGnpJwe3l4PjDchgEKxIxuwrNLKassLzxWXPEusiynVLN
	YP+1HDSQEe2Btb6BiYlGubOOxYgMqJrXeaRaI1uTe5TOM/VEUQ/TpZISkYYo9vXZJk5d512a4ka
	eNG3C1x1JZ2hWUXVhI+vcuJlGhFePga086wa8QxhC1mfVVU/3JNCocVbBU1Qis8qcUsdwZG6AwW
	rakixMrpi1g5NfKSfpxnsV2uSm7e9BGg/ydXDryXKFoNfbZQ2QXC9n6RunFVIXJQ3APergFtlME
	8LpJgBZzz9X22AKDL1rxbdTLUzorT/yt4QRWG2nr5XnVYN4OXiRY=
X-Received: by 2002:a05:620a:1d03:b0:939:6df7:73f0 with SMTP id
 af79cd13be357-93bf5761513mr301041185a.50.1789853185944; Sat, 19 Sep 2026
 14:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
 <20260909-mmrebase-v1-15-8dd5d4225d2e@nvidia.com> <CAPM=9tweFRWWjCrkBKvR03BaRVs=N+-qw2ju0g-dgMj+S7Q=ZA@mail.gmail.com>
 <DLJDV72PBGVA.1M0RZ780ZPJR0@nvidia.com> <165ab493-9de9-43bb-a53b-3fa82f8013cf@nvidia.com>
In-Reply-To: <165ab493-9de9-43bb-a53b-3fa82f8013cf@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 20 Sep 2026 07:26:13 +1000
X-Gm-Features: AcwNN1UIoSlXyTA_I5dOxTH1mKYz8_NXz8Pq7spnjuOWiDNpvrhOSQYr0h3NdB0
Message-ID: <CAPM=9tzFaYp6=3nJ3yxEhjaHzUOnyQT0eV884eKR7ma2sHp73w@mail.gmail.com>
Subject: Re: [PATCH 15/16] gpu: nova-core: mm: Add BAR1 user interface
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 06:13, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 9/19/26 8:03 AM, Alexandre Courbot wrote:
> > On Fri Sep 18, 2026 at 12:38 PM JST, Dave Airlie wrote:
> >> On Wed, 9 Sept 2026 at 14:25, Eliot Courtney <ecourtney@nvidia.com> wrote:
> >>>
> >>> From: Joel Fernandes <joelagnelf@nvidia.com>
> >>>
> >>> Add the BAR1 user interface for CPU access to GPU virtual memory through
> >>> the BAR1 aperture.
> >>>
> >>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >>> [ecourtney: map BAR1 in NovaCore, borrow it in Gpu and BarUser, no Devres]
> >>> [ecourtney: update for the VramAddress raw API and gsp_resources chipset]
> >>> [ecourtney: drop the owned GpuMm, pass it mutably through map and release]
> >>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >>> ---
> >>
> >> BAR 1 and 2 need to be optionally detected and used. At least on SPARK
> >> there is only BAR0.
> >>
> >> I've been playing with John's branch on spark and had to rework this
> >> code to make BAR 1 optional.
> >
> > Thanks Dave - indeed we also hit an issue on a device where the FB
> > console was enabled (?), which preventing BAR1 from being used.
> >
>
> That's different: another device driver was using the GPU. People
> should Kconfig their system to avoid having two device drivers
> trying to claim the same hardware.

At some point nova-core needs to call the remove_conflicting interface
to make sure we kick off the overlapping drivers properly.

>
> Once Nova get a bit further along, it will be a non-issue too,
> because Nova can drive either an fbdev, or whatever the modern
> alternative to that is.
>
>
> > I know Eliot has a bunch of follow-ups in the pipe, Eliot can we make
> > sure to dynamically detect and enable BAR1?

Also I'm asking for this now as it it might be easier to make that
sort of design decision earlier, rather than trying to revisit it
later.

Dave.

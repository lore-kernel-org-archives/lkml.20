Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816144A3F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424839; cv=none; b=DsNY2Ye+s+HLRDYkhxAc0td7TfxzFwfStG5NRs5Kd4EbRjlQaSFBuTzYfCFko42jEfvpowS9rUx7Ybg6EU0D2Uf1PR5spv05mUxRcI6e2tUR3P8cSyF+cocJFrmiMnMQ0o3GsW/nGhK/ij6BNMWBakQ6a3DQd7r5sdzcYUvKNfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424839; c=relaxed/simple;
	bh=DTYHCLNC20I3NT3Q6EauukS8X36P4w2ZaBG+yVpyd6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ky7GgPoIE1GzTa7WZdfWfOivxo3ABlkDs4IfY9s1zIbfMeAQdAJBMipkCJ3SHg6Mi/bCrdr5QIK2/Wb0jaumOWPiC1JyKHslhm0X4ruWR0FkjqlSa6tRJDQCrke3as1v8URflZZwhVWf3NA2/lp9SdplzKCHEHig4A3gI5uISSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km/AVnQp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km/AVnQp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso22115175e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424836; x=1789029636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z2kd8yy098YwLOhAkPABv3/vm8TT/oYlA03PQA2FRSg=;
        b=Km/AVnQpob5weZI+CSD8nsN8XCzqYUKP/IOGOoEXXRj6HqO+MOQK6bC+NcYVr0Ut87
         1YYpdhRgQc1Q6X7Xe737LsYydC3GPnCp+bQc8ksc2EgzohaGGCl6P87lz9qKik+jZcHA
         sLQrfrDUTPQ8Fr3KZr5kjlYRscPVeI7m5a9ivHZmSmVyovjzvPBHwn6/kdYBOFZrjS19
         rxtOEL1rNejTr5t9iJW6MjfElzpx+rVHmBg+Q52N7tA1op2eBMcYbWxuJJ0lYYQF8sgf
         vq3xCyguf9NrwdZuRmSGYQ5OL4tX/FCrGwLSR8I97Yl1w6C/lHes8VMMq+QXlK0gqgue
         2GPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424836; x=1789029636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2kd8yy098YwLOhAkPABv3/vm8TT/oYlA03PQA2FRSg=;
        b=MvjFNmnM4cef6I7Q4zIJpw+k8NH0pUgskH3c+VvxHtm2gss44lcUyQ48aUCmMKm8zJ
         RoXhNjsg8wUpPaEt/nVkoQwWkiq//X08fj2dpale2EqLUu1/U3fC4gJya3pzCcCiTvcq
         jehdoX5hou1OzI34+YSKju+NCjWsYMvd7RVyMnay7q+tCBulPXz8F1PW4AJgiU2FCKUi
         VdGjIaB23cW+KVeeJvxWlP3iLpjnJImzcJqi5AmhYuSstFtGN4rj1Vbe111+6dgAVneT
         ex6ojoDLo15nRGsh3Cg6ewypZR4FyLhZzHBdmOwu6EIAy7Z5WJMUl3sq6yL2oYItRtaN
         m9iw==
X-Forwarded-Encrypted: i=1; AKwUvBwtkAuUxCPkPhGvIrfTZlT5Dvg5biQenHOkvf5QoB+dFNMM+AuA5IYNrUx5J00Ozv1YhqLbgSIY6yE2aQg=@vger.kernel.org
X-Gm-Message-State: AFuF++lKA+pyHOU48sbebcraZOD7Y/1zh20B9dHyrtYcBvvbqcAfViQM
	XcIiroejzW2XAQoERIiYb/QxTCX+DjIN2LHQkOYQ9FTLhTKOjAA9UZ6X
X-Gm-Gg: AYBFou1Ap/cmzjdboA9mInXAgKwRg3Ic1UuuB598T4ZTGg0z7ns1ley2LzqiUJ9WpdP
	xjPkjxJyJGp02xR9o2C70n4eCjb/dhi5wNhpo+m1LuBGHJmA1RHKtMoF6e+224+cX30LNbnm9Y0
	8062pYtmzHq+OZQCV29BQQFuzHFvY6aNZjIdJhU/tqefhA3BK5RX1OXDpMiu0RGlKbIBJie1avt
	X0o6vMNfbL2ptoay2THgRKs7nGrARBzzeDKVCOShj0Qm4ldL+GbpXKtPRrrQeAoSYlktEeLMjAe
	7tqmqQ41De9EsdzaE9z3H6gl1D6kGo7KWqLxvcj9nMGTGXE3E+2Y7cO8vTrmB6KFx6/M8YbX8IB
	ytv44KhnABdb/a327tIgcElItxnyKMXcMqaT9R75uC+B2sNzoXrgicl5S38ymdjBw/5EPKZzgWq
	qXgMaJC6iwTAYVGWgAPL0WiK6zCTtNmjgkACjOp6Gx9zqs0LcUt0NbPznisCrKOXMEgVGpyWdZB
	Fgdzb0/Jsl2oi5Qg21pNzSusUHgjB5PJLUv
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr226059755e9.9.1788424835605;
        Thu, 03 Sep 2026 01:40:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm99477295e9.1.2026.09.03.01.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:40:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:40:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, Michael Matz
 <matz@suse.de>, Richard Biener <rguenther@suse.de>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260903094034.489b64bb@pumpkin>
In-Reply-To: <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
	<20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
	<57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
	<05896397667d66a2969259298bcebb7f@igalia.com>
	<20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 17:01:32 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Wed, Sep 02, 2026 at 10:48:14AM -0300, Mauricio Faria de Oliveira wrote:
> > Boris, I guess this may be added as clarification in the commit message.
> > Would you prefer another version with it?  
> 
> Yeah, I'd actually prefer it in the code itself so that we can find it easier.
> This file is as good as any.
> 
> Something like this:
> 
> /*
>  * Summarized explanation that "cc" clobbers don't have a meaning
>  *
>  */
>  
> and leave the "cc" clobber there but commented out:
> 
>  /* "cc" ... */
> 
> so that we can grep for it easier later.

Why would you need to?
Apart from a scan to just remove them all...

David

> 
> Thanks!
> 


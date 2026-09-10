Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056E4A6899
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051853; cv=pass; b=qvClgEtunuT8m/anYhuVU4BBtvY+vYDOWf5L25MFJo3q5jAotTDa015SgJXSCGF2ZRI7oRbGdu6r2XCxSMANYS3HursE9baFOcT6HRw5jmciFQqmvJGERzxpuUZlUSm7VYh6xMIxzI2+JZNnUCgAGf91UOeUuWYz+lCD8nd5ZxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051853; c=relaxed/simple;
	bh=7fo5EGqeU1K9oWeUdrFJ6Uc8xV6Lo6ckrOaUTXHreas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCF9ZSEdCr0urtS6zk9i/uqCT3dZMt3YVTNbC9uWdZUGlqTa6IskKK/9R5tidls9qvS3Bbm26Hj1ApFjj93A/lzWDJy1fMmahUBXgGCNNPorgDflPlfvmYdnI4YB5OVxAQzuguYYF+vVSXdvwITRNqHu8ruLEDux2f4MYN7+Q7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ey0VwwYy; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ey0VwwYy"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso248881cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051850; cv=none;
        d=google.com; s=arc-20260327;
        b=FTFnJIWFA9NoLgnHxNbBTM7eKMq4BNPxauGZPZHByZBWggKxkg3QxgSwEJsqlMXH/9
         njzwrd9JBIj5Lwq3CjyybouoGxiXfh5UdBb8BzKkfIz/VBllV1lBK894K5C4vLS+vZE7
         ePbg+8Ha4k3lX/7x1q+Ysx4Qv0XbZDa/WOv4+lwqxq79rrgko7cm/GZgCGuCUAhTyj9W
         TIiMh2aPdqiRbZGWquSFiXBo+kSD9U40ab1aypzx7C2AoMA8Up5Z2m8Z5I5/VrMFSbhg
         8IlLsLsFU3nr8QcSA93d96uiOjGxhYYFTRiCkihAK5ScXv20qZHxddrytXK+1Bcy+5u0
         vgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7fo5EGqeU1K9oWeUdrFJ6Uc8xV6Lo6ckrOaUTXHreas=;
        fh=JOwuYjTSdvLsKeO3fyuRfjftFoebHIIy0NMa5zX7COA=;
        b=DnTPtCq+49ZJIrfmM+vkan+Qm7WkgB4tdPD1cCdRIo9Nc+gvCPzYDpJKEG4DHzEAKr
         8Jwp32SiJ/6nxtH+cBwj1rUtHw0LIA2+2md9vmZ0NV82QATx5GxG4ktJiFVI8f6u9Fo2
         v3T6t65gEPA7VNeJ2JWvj2fBFZXxW77H/KPSZMY+k54B1ldhnXL+ZrVthF0UwesVGRyH
         BeW3/hBEtaICmlDcbLwYx/7yO/TVWTocVYr/Ohh00zQD//aVQp0DRjMv212M0JidmmY2
         UN0Vr0k1Y8Vd2/dOTKDeI0SV1ZxgZysyNIbw4y0tHaLGhgXC5mEeZfMehj89qyaVukYh
         GHfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789051850; x=1789656650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7fo5EGqeU1K9oWeUdrFJ6Uc8xV6Lo6ckrOaUTXHreas=;
        b=ey0VwwYymM2EynrUmO0sHPdxZMaO+YPTseATb8MQWKnGge9sEB0SbdSofIxUiosEud
         8h78Ef6KqVgGYFpMNnMLGOhuyHKfApmV8xjrHYcqvcTwlUod8hBEdZETOXTd4GOaONoY
         a6pih5WsOWCFoTkvebSkuTQfexggiPaHWWP5vZN+r0RzB8hUu2BDSB5U+co+3fbxCu4S
         mxOvxdRZVXD7YJZ7ml5dA0j0Oq+eOrgNuomFY1Pd1uCchF1aSsWJEwhTO5MLWI4w45zT
         jyHStFhxcLpjajnQIdaYf33C5oJ5HfVgM96hZKc/SUAeVO2JR79sYj3IqIx8QNuVMs6f
         cMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051850; x=1789656650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fo5EGqeU1K9oWeUdrFJ6Uc8xV6Lo6ckrOaUTXHreas=;
        b=liapB9U8koWFSM546igPDGWILLixzGh62CXuFfUKU+qb2rypEz8cIf/za+mYAL7164
         UIrHXakNOi5A6fgt5N6Ie7Lf00OtdbC2QgyKWnUiQZ/1/w7zT1bK0QYjliClc49qhzOO
         QPBFD9tv5T/niH36DQayaVK1DW/gxZgWXQw/4c9xNYncYvBXAr6y4PvLxCSNo7YqNmMT
         IPiZ90W4LXbnhuGghk2aqIpv9bq2c38hLlHmaZ1u0MibWUNXPsrCmnPo31ZrIuhgXcOq
         s4IGjUVWFN18Te/M6Kd4sATiT68d1xHFXp+LKZwDyqy3a1JykFVXc1EczC09FIzvOY+b
         1nFg==
X-Forwarded-Encrypted: i=1; AKwUvBzDONGMwxybetuX1eCxSr5JLX8jGb65Lh5TudX5BHtSeyij564JPHAafHORVg+klQmllNBf9ylWrDyIUcw=@vger.kernel.org
X-Gm-Message-State: AFuF++n85/Tq5rHdnQF7ohY2CPv8XjfZ0A0pqRDqUm11ZaF3i3pjS2aZ
	fdEP+fqo72vOoJyl81Ko1bJs8Am/Vy+TOCK5UrSUvWdnffP3cMk4g5yCrtCb/apxxV11uijhqB0
	6wtkYxaXQhFQzmDGb70C3uRO5zb+mLdicdtwaH+2n
X-Gm-Gg: AYBFou3Av0Gk7mAZK3xKghhRBt9yX1TH/Rv+hFuAQ2qydj7dj4/OeCOOilX6bIdtglu
	6pF2F+djFRs5m58gzhrkVE7Vyy0GbBr6EgeWZ/jU9mStNhpGBPOB8tAwNiN+1at2EEP5GMLxJ7+
	A0gQN1XyTLKbK3Dbl6Rjg+aOD8G8JJ9NbbBDYN34AS9A22iRA7nj/ZeYxHM3Yqa8PqnGwtV5RgH
	/vbs0boX4N+/3JY2pKrzhYa1hbbSWaPTKej2cqaWZlJw34e2TpkpEHsxZQSzwdSpJNY0MSM+0ky
	j0h9Ta8aGlhbVgRhn3wJqcn9aalRp//CFw8ZqFBJkohEy3BI9wqUwohHN+NH+DqjlHHl7s020TH
	InLk5W+HsB5UVXV7dNkJI
X-Received: by 2002:ac8:7c4a:0:b0:52d:9d62:6163 with SMTP id
 d75a77b69052e-530b62adafbmr17198241cf.9.1789051849244; Thu, 10 Sep 2026
 07:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831203056.838265-1-surenb@google.com> <20260831203056.838265-2-surenb@google.com>
 <a4d74575-65d5-46cf-bd2d-dcabf2543811@kernel.org>
In-Reply-To: <a4d74575-65d5-46cf-bd2d-dcabf2543811@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 07:50:38 -0700
X-Gm-Features: AcwNN1X_jRm0tBBbAYUSIvnyhEAYCX6eOrOg0SRx_RaTXlhhkG6R2zUlwcvhFQ4
Message-ID: <CAJuCfpEFmf0V0OuAkEPSpzYA-WScAjmNg2b6CJg7Z3WH9h6Qdg@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] mm: Make per-VMA locks available universally
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, dave.hansen@linux.intel.com, 
	Liam.Howlett@oracle.com, ljs@kernel.org, willy@infradead.org, 
	shakeel.butt@linux.dev, vbabka@kernel.org, jannh@google.com, 
	aliceryhl@google.com, arve@android.com, cmllamas@google.com, 
	christian@brauner.io, tkjos@android.com, dsahern@kernel.org, 
	davem@davemloft.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:09=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/31/26 22:30, Suren Baghdasaryan wrote:
> > From: Dave Hansen <dave.hansen@linux.intel.com>
> >
> > The per-VMA locks have been around for several years. They've had some
> > bugs worked out of them and have seen quite wide use. However, they
> > are still only available when architectures explicitly enable them.
> > Remove the conditional compilation around the per-VMA locks, making
> > them available on all architectures and configs.
> >
> > The approach up to now seemed to be to add ARCH_SUPPORTS_PER_VMA_LOCK
> > when the architecture started using per-VMA locks in the fault
> > handler. But, contrary to the naming, the Kconfig option does not
> > really indicate whether the architecture supports per-VMA locks or
> > not. It is more of a marker for whether the architecture is likely to
> > benefit from per-VMA locks.
> >
> > To me, the most important thing side-effect of universal availability
> > is letting per-VMA locks be used in SMP=3Dn configs. This lets us use
> > per-VMA locking in all x86 code without fallbacks.
> >
> > Overall, this just generally makes the kernel simpler. Just look at
> > the diffstat. It also opens the door to users that want to use the
> > per-VMA locks in common code. Doing *that* brings additional
> > simplifications.
> >
> > The downside of this is adding some fields to vm_area_struct and
> > mm_struct. There are likely ways to optimize this, especially for
> > things like SMP=3Dn configs. For now, do the simplest thing: use the
> > same implementation everywhere.
> >
> > =3D=3D Considerations for NOMMU config =3D=3D
>
> Echoing what I commented on v6 after v7 was already sent (not realizing t=
here
> was a v7 after my inbox got flooded)
>
> Maybe the NOMMU "support" could have been had in a separate prep patch (w=
here a
> lot of the description below could have been moved), making the patch its=
elf
> just mostly a removal of code.

Yeah, that would make reviewing indeed easier. I guess current
structure is the result of me adding NOMMU pieces to the pre-existing
patchset. I don't think it's worth refactoring but I can do that if
you insist.

>
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

>
> --
> Cheers,
>
> David

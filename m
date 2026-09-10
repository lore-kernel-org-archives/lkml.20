Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5ED4E66B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067194; cv=pass; b=CARaJ+3Qu+Zoc0QTTVA7e1YpvantZLtkHJy7Ft2SD6iahgiyJcOxMPoqyVN2y2LTCY0QsuBK4zg9AKVMsXANq4MCeGfgG2q2sQmhrziIKGJUObcbo4ICEEjFxN6gBrVetXbqI8gWEXqQi/uXfQ0aCPhsj7cZt+dXMqo7pCmPkYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067194; c=relaxed/simple;
	bh=p7RzuJYGdHnY3mqs80U7yu9Qn6ww9UEb3p+WQH1n6P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDrPBpHQWtZa84LsYFhjsTcuivPKjRQe4daAOsvHyQKZNQxdxQJIvbi+ZORAXsYm7U4wNMBLv03YRbOId8NaqJvqooNsB3SbMerDqZppq1Z0gp8YvauVnciVLvt0Q20Vq6pLhYBWYY3IJxb+3IhWWq4Vws2EaFVWFFX61nMLgD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBzoWmZf; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBzoWmZf"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66f8053e7afso51933d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789067192; cv=none;
        d=google.com; s=arc-20260327;
        b=qFDyx2U8vhknyP7RjhwRGLRAT0vu+MDlgixwhaaH/sgZthjAZoQWqzMxQHeM/GaOZq
         dGu2b/LR62RVMP3gKe3fs/+NllBfi1N/0GWouKhFNUFxiJOTA8DJo79sAi8HjPeMOhKh
         gE0NFjpYcH4lHotsbusvpubK0aMLM4EEL7/PkUO2QMSQoUJCoA9psbBIB6W80JkxPwfO
         0n433znVR8ExTCYHsUWdp1TsE6CunP0NCHnHWRMQz2CdMSnxcznZWTN+2Cng7Ad08b/y
         GFOO3ci5CZ6xOhCQYKqqHYCLuMpwYKR8T8QMyyQD2QbjbE8VTdwkRGCL41V+wk3ttf4n
         yZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hhbPkWTyvpq7C4VmKx5074Xp8YIC7XsOu3FWGtgnxq8=;
        fh=7C3qB4H+qJEEz0qXi79u4oisSsotyE6hN4lnUoNAqjI=;
        b=hjkOz7wywbwftRbxU/Bi4QeOYn3MDlqxZ37aBj/4IuxUwXgqweuntLyKsqBK4SJ7kV
         lZUktIrYaCmiH6UK5b2FZcOm6q/ZkrMP6bBZJUGqx9IrMzQJZgzhOG8Diod89lHMsZ6F
         4Y0aD4Q4OUXTOwZxZVRdkvemS4QVfDkEpL1qILR2Y9ORXiWjTL4mxrh3ll7Ipdvt1v1h
         ui/b059DLjZMx7x4RvOdmyYhVNbXvOJehmOLf3oP4+wgJ6yW5ma5XywxzJYExWbLQwmj
         Vn+IyK8QKDN8FLQFBPmEIYnWFjXNBAFv8v2yc4YVBhxEp5Xh8/8JYTtROb9jSHqm4AWF
         PTEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789067192; x=1789671992; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhbPkWTyvpq7C4VmKx5074Xp8YIC7XsOu3FWGtgnxq8=;
        b=OBzoWmZfG2xnKQ21vOgPbtSoKlvFZ8OwbP2af6uEP2pvsss+12ziYFwAyd61V7mMYi
         QpWqC6GP5qIjAXeO7/IBaVMfrITbNwmYsikESWH3Y+G/Z+dGmUQ9zrSSNLpt/H0KVTcD
         Wv/VASUIeXTq9qBta10tUzN/pYvAH1cqERw1ex0ZjNP3UltNKm6l589ZVUfbWOy4qNsI
         jIIs5l3hjUAxKRgowy/lYG485+B4s4XcfkL019BXl/tmix7EtJgB7oeKxZ4/WjYV2k8Q
         DJlXqYwgxfL92UagMNjZ48RFxo2YRomv+s9i6bZEb49Ad4CkcEgMkW+Inad2ftFsXrlH
         kW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067192; x=1789671992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hhbPkWTyvpq7C4VmKx5074Xp8YIC7XsOu3FWGtgnxq8=;
        b=mdCl4Sh8Mpa4qz2cdQzrrfrTHFoU2wsQO51QAk0UtAzXzz3/D7RPREqblxM1D6/kA/
         Gbh2qrnWpUOoKWPqYbj57nVL5Mr3tfYRCSfTlUfDmguuEqheFTObC6skbp2KrLoV+O7Y
         JKNYc9wGZJCj4miuUUyPDROkN+PGh7nyUJ6dF0JJaL7CBFO0iZnKX6bxGy8HRAYQNozN
         WY8xix54Tb6Sil8lp8YJEUO/IR6Lpa75oVakBduNwEND3wO9oqpyoK/bku3+W4p0EMbc
         9C1m2F8BH9rmVrfyQAQiqZpzLXg87ZO7277q9EueAIHQkcFhuNBrmBP7Zyi62b+uPrwL
         A6tA==
X-Forwarded-Encrypted: i=1; AKwUvBytUdcx0OkcVDaOcO659150OPy1dgPilLPEDuTmdiAIXTEgGn035ykt5uQvOUZwZegQgxh+XJBpcgGbWvs=@vger.kernel.org
X-Gm-Message-State: AFuF++k3dWDEWfT1DqXPOkgFjilPHS8baW3ZMZjbIExXTeBx4QqY7jEO
	5Tgai2ZHvBdrQ4JB6oVvhoXC+MPj5fJzBcn/OhKFLDlQ72YT+mSfwQn2jarRf5ASbIkDMH7Jsjz
	2C1oZsPJv9UeW2QCEOxJyynqcbpZPYc+LOSx8PNCG
X-Gm-Gg: AYBFou1GU624c94aSvtdIjsaGnZpGqwYImdGyud9m0GNtsDgF1x6TWjxymp0a3a+zlf
	INoVacm+WM9oE8AH96Qf+t8A5t2IfiqsMq/JXQ+qNijI2ZhveMKfJkmORwrIrqGXn07xmVQSLJ0
	bkepe4nMC61XSdYlzktVOEsfT9BVn+SoMzSe3t0wLIkZB6SRSCMxnPgeJnEFIx2PmJvfK4dCaBH
	huPYqE419H9c/GXWVaOnEyZ5BZD+X9lCyg7ZkOwNhWCh4dAdoeg/ZLeGfErcmUcGLMPc3zP4sO8
	TkzB+YdWMd88UHk2GqXOI7oDWKuwqr6Uu+ajI3Q2PjfakCO0uV5B7yvHDFo1mCYgdkwxUfSKTUn
	PlebzuEKGQQ==
X-Received: by 2002:a05:690c:3347:b0:874:894:9a52 with SMTP id
 00721157ae682-884b5d8d588mr3519787b3.40.1789067191005; Thu, 10 Sep 2026
 12:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
 <aqLbHvD5lqQP8PRd@google.com> <CANpmjNOZPFQ9FcaA6+GH9PZ8DRyEMYW3+FKBO9B3d2CY+2C-5w@mail.gmail.com>
 <aqLuZ9gGzK07R_Ei@google.com>
In-Reply-To: <aqLuZ9gGzK07R_Ei@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 21:05:52 +0200
X-Gm-Features: AcwNN1V0oYbeLDh86sT0uPw3XpZ9Y8gnfB3S8ZdXuCAMO68mt6oSE3z_9GgR0M4
Message-ID: <CANpmjNMn-i3ZgQgRC8JhhDt5-RFTXCsBrf47MzfXjKG8H1c2sA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 19:52, Sean Christopherson <seanjc@google.com> wrote:
> On Thu, Sep 10, 2026, Marco Elver wrote:
> > On Thu, 10 Sept 2026 at 18:30, Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Thu, Sep 10, 2026, Marco Elver wrote:
> > > > kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> > > > kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> > > > that memslots cannot be concurrently modified.
> > >
> > > Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
> > > ensure that readers see a stable view of the VM's overall memory, not simply that
> > > kvm->memslots can't be written.
> >
> > Functionally, this is irrelevant for readers. But under lockdep it
> > isn't for writers: srcu_dereference_check() (with lockdep) asserts
> > that the srcu reader-lock is held, or the condition 'c' holds, which
> > here is holding any of the writer locks.
>
> No, the rules for writing kvm->memslots is that *both* are held.

Right. But the condition 'c' is only the srcu-less fallback for reads,
which is "any".

> > > > Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> > > > held.
> > >
> > > Why?
> >
> > Holding any of the writer locks guarantees no concurrent modification;
> > therefore, if any writer lock is held, it's not required that the srcu
> > reader-lock is held. There are few places where only either slots_lock
> > or slots_arch_lock is held, which is sufficient for reading.
>
> Yes, but with caveats.  And more importantly, pure readers really shouldn't be
> taking slots_arch_lock, because either it's overkill and will generate unnecessary
> lock content, or the alleged reader is doing more than just reading.

Pure readers never should, and not what this patch suggested. But
writers (or those about to become writers if they only hold one lock)
can read w/o the srcu reader-lock held.

> Holding just slots_arch_lock *could* be fine, depending on the usage, but those
> details matter, which is why I asked "why".  I want to know exactly why we should
> relax the locking rules.
>
> Ah, poking around the code, I suspect that the motivation is
> kvm_enable_external_write_tracking()?  Which grabs __kvm_memslots() but only
> holds slots_arch_lock, i.e. would get a lockdep splat if someone with KVMGT ran
> with lockdep enabled.

Right.

> That thing isn't a pure reader.  It only reads the actual kvm->memslots pointer,
> but it writes to each of the slots metadata.
>
> So, allowing __kvm_memslots() to be called with just slot_arch_lock is ok in
> this situation, and if my guess is right, necessary to fix a false positive.  But
> I'm on the fence as to whether or not we generally want to allow that, versus
> taking kvm->srcu in kvm_enable_external_write_tracking() even though strictly
> speaking it's unnecessary.

Clarification here would be good. In building up the locking
annotations, this was one inconsistency I found vs. what
srcu_dereference_check() said, so the conclusion was that the fallback
condition 'c' was outdated (or there was a bug).

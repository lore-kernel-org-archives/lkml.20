Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1045452AA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060819; cv=pass; b=WKVmZjtO/uNWuCP1ilIkvDuH/gKYnY25qZZ+8BgkSMP7GWPr4nCpkQBNHK/Zff9VviINNPiP6+L/8nqprc9nqUL/R9Yad7vmCQBP5F9pkWzhT/mSX29w1QUoo9YnpNhhgfVag7uypi5ptRjI/Or2/IJCx/00bnuQ4a9ySxr8oW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060819; c=relaxed/simple;
	bh=/v015ZI2cSC/eglT0djeEARyRLz+9lux+yuLnGVDWVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbvEAuW8CV8S/N/d9pjdR7IJnN5OgSvRP4cxJxvl+FPbdZudbYQHZTzYY9kwWbNEOm/WzX1EBQfqXB7Qev+V7DbLzQOnfcHvsmNPW7kGZdUfG3ETM/LNInRsL+RtCZGsCExveR3d06PVcXLvLH77ht0Dxj5kZeJ2dahw9Fdi9cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=um5h4Sh6; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="um5h4Sh6"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-939adff838bso349509485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789060801; cv=none;
        d=google.com; s=arc-20260327;
        b=R8V55AMF7QNXRyNAZPWrHqYpq4UOQ7VTmtxeNhGy9trfvbQSVIz/pY0BBMehLfN4li
         Kax11yp5gkDpOxmtKUbNNeImX28f9QWE+6GleHeidk1ozn0DxZk/hVwBHqS2p9V2FnOk
         Jl6AXrwV7dmFBwZ1KIYJp0hUChhpx3Vl3jo7kVTKdt7DijcJPQ4nYgmC5tqwRVghHsox
         km+cdVm/ma+36KksZ1nue2P/3WZKyLwceW/Y1w7ywpwBjJtR1sGXVfbvsD2/8xufO7r/
         vtfswGnMSiZPJvJh6oBbe00gyc1pGJx4b40G/DWs76xGMti/BxB/b2iGVgxstAXMBtwg
         I6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=waC8vF2dtDUS7XnDxfIfPJDfjo2BuEf9qI8Li791zgk=;
        fh=nzJdMQ8QUpAhCWBkkoRiqLuYKz4XOB+gJrg6Nd4MWrI=;
        b=mx/rXWpWVXOr266ySeQHgeHWDyEOK93QGSQ1r3NekTY9HC0jxeMsiJ0daS94632nA9
         ZHjZ10vyfMjrWihCz1Acj+CRaiR/R3Oif0VgnrXqEnZGZiUgb7K/tfOy10AnEvmVa/Hb
         RvAATSXgZEC9bMxVma+eSZu7Y9DeT9vADgjvgdZ0C6WGcE1bdQgUBFI0wfRVnY7wDC/A
         66y/yCzhj5Cm9eacCgjjjuFpWo++NCL+WPQ9cCkFozffxOHiXzWSw1hJxXGAQNbp48QK
         pAevUy0MAKD7hg2kDkwiDDoCQjguiqt/wlInQZl6pZoglXXAOZrqzO+HAymbx6k3efZ+
         tPVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789060801; x=1789665601; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waC8vF2dtDUS7XnDxfIfPJDfjo2BuEf9qI8Li791zgk=;
        b=um5h4Sh6DKHcukdnBv0YbZ8+mBotxXVCwrEHB1SRB5LzrPINznwq2jTF10giKZ36Ue
         Q/WsX3ycMVDykik3w9U6Bp7Hc6lGFZWsVVaq8Zib7CYia6PIU/MhQSKPMSDzhlWssJ3G
         dEipx1cq4mv4BjXj0ME//dAvy+/grDBPMPbmc9MdAJHmZ/tQPRJNI/wXT9v1rOy21OTf
         +reXIeC88vmSeo5BwNql5r5CONatG/h4DKkKstAiheNsV1OT1SFPW/iCC8PKjfgt/Hy5
         aOyLvRUrdgY00Uu84Kv44VvIp5v40og8ehTy2ZO/P+SlM4YFpZp5H6a5w5/fxCAhV/ra
         MBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060801; x=1789665601;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=waC8vF2dtDUS7XnDxfIfPJDfjo2BuEf9qI8Li791zgk=;
        b=ftN+rTza1mOKQCxz8bMqx3zrgaSoAowhYXZ1GOXWHa3rONn7DhRgluo6xAJGmTsHzH
         X516Ej7dgxJupHFQXw3Yz2Dn3rx8mJDQayjX3HuQoKwhQTCyKQCmqatWnf6vhlIQricH
         WOpQ/779jVO1mQ6LoYqDaDTatULFEZaKGQB2YG0/GoNUiWH7FRhlZ7dgWh+DIluYbjss
         YpbCQOfBleWOtmdnUHEdeqatXFOh39YiRY4FogVissQjdjKDkaTAXaEAyQyZkApgOhD+
         EjCcZu+YrcHxZTSfWbLOUeBRi0m8HRNA04vLoFKoYrKZEk1Ygsp10hREMwvGzmftgHAE
         tR3A==
X-Forwarded-Encrypted: i=1; AKwUvBzDHfLe+cRruDfdmoIBVmHANRQ7nYzBBZfMchyH91gY4iR7GPp2jKtx9CygDLEds3pKquXR7OGGccktcAs=@vger.kernel.org
X-Gm-Message-State: AFuF++m9KQ4qDWnCSoap7z9rB1CjpHPg0kFookvI79GDEkVRicK0gD6g
	Cc99oO4O94/0FwzPOnRPTbyH1xvCESItM2PUeujJ6gcEfiHYSdTH6IhPAbL+HqUWTKY/UfN/5Z3
	6td0SOBxMUlh/KMglvzj3DrAP+xorq9yDqBD/SO4A+Ha57Dl258NCB1af
X-Gm-Gg: AYBFou1HBNYhXOIc3fN8Y38G9KK/aYbJm4hS4fUZk8WI2CYDZEXd0VZQjurI0D/Anvt
	p0/GOrX+gpFczGdFsyt96TSBBcuzZGQa1lgj/yupp2Qwc4RizA4gbmR2tdXNux6zcDkbCxk7VgH
	R7O0xl9N//WO3AIG9fVVDtTURkvfWK9sBp7y16HbU4VtQchN0gd9GhYSNrJeck6H0tb6na+h15z
	mO/5vm+3+CBFcBFGaEWfSY+ZqWAJgUMBEkZ/m2L0r8PZL3x7T86gFl2whR3kNtJ/Z1h3bPAHxmE
	cYNGuxeY8raVFBgCkDvWlSdAV8N0N+idY8syeLnODTF7eoknpdNiaHJRhH+eJ4KaNcUBaCjouR5
	Znix5OgZMnA==
X-Received: by 2002:a05:6820:3404:10b0:6b1:4a71:775a with SMTP id
 006d021491bc7-6c0bae083dcmr10697eaf.19.1789060331694; Thu, 10 Sep 2026
 10:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-3-elver@google.com>
 <aqLbHvD5lqQP8PRd@google.com>
In-Reply-To: <aqLbHvD5lqQP8PRd@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 19:11:34 +0200
X-Gm-Features: AcwNN1X74FFLXo3tfvC8iadNXegd-2_Lr_knvP8WkNgyIr-_V-yJ7lG2ubIqDNU
Message-ID: <CANpmjNOZPFQ9FcaA6+GH9PZ8DRyEMYW3+FKBO9B3d2CY+2C-5w@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 18:30, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Sep 10, 2026, Marco Elver wrote:
> > kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
> > kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
> > that memslots cannot be concurrently modified.
>
> Sure, but that's irrelevant.  The goal of the srcu_dereference_check() is to
> ensure that readers see a stable view of the VM's overall memory, not simply that
> kvm->memslots can't be written.

Functionally, this is irrelevant for readers. But under lockdep it
isn't for writers: srcu_dereference_check() (with lockdep) asserts
that the srcu reader-lock is held, or the condition 'c' holds, which
here is holding any of the writer locks.

> > Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
> > held.
>
> Why?

Holding any of the writer locks guarantees no concurrent modification;
therefore, if any writer lock is held, it's not required that the srcu
reader-lock is held. There are few places where only either slots_lock
or slots_arch_lock is held, which is sufficient for reading.

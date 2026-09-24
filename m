Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4863812F0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259199; cv=none; b=rdmwV4F1P5xxFzgkJ8KIirKtEY96OjIhtTEuzora4E2NJ+2KcprpPHYImszdSZjZWkZdS5CdTMp5h2bbOBy3lusjaHBDPGz778/QFqRDgm/ZhnB40RnRjb72tG4kwyYM7My/gu8tkidP9olw+KqTXm5QivxJwSSU4K4sVMed+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259199; c=relaxed/simple;
	bh=SYo4jCZXOC1sdPoUWfjX57LqLt5CJFZ4L92+VvuTLX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pgvI4HcXj7ZaAo+wxGpT6grVC0soBP83bn6nYGffiKs0wCkbsEP+HwcfH/ZDvveJVpmvf7pqKer6JEhhcWttJcp+z2MRQ4XX1ztkE++iIqO8GhG3D3SKztNajwA/KwMLJjxS7wX20IIJB97Odf6/gVBROt/fZ7zBMF/j/E7PlpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lETa/Y5H; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lETa/Y5H"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so20861665ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790259197; x=1790863997; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXYyi9gz0ZpsLB2diBEdXlpJNNlCkIiClSl3fFTv2IQ=;
        b=lETa/Y5HXsVnXSqwQly7g+QGtAduzhHVNcbaV7DXNJDGffbah2qjkxcO6XzPe3v+Wn
         CayOFDYTewJzYmZb2ZHQj638IhjiEriUS5QjE08kM+apnB7fpd9oqSzkdO/gLIQG8KLM
         zd3cW4osk+0KPwY2mFR/EZmoEjQ2DVfeerB6NU0Qv2L9QrGH9SKGl9wk1azLmK8gV7qn
         7NQ7lGHOhz95Y2CjwPBd2ftmkT1NNJDSiWPg7nd2QenbAjUpzOZdMkfW6M0Hyi6qoMoc
         uDttbbdbuS9S/NQsXcKPWYNqoXKkIy3/6Z/JMa22fj1wySgMHfJvcWU2WJOsU91zrLSH
         U9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259197; x=1790863997;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXYyi9gz0ZpsLB2diBEdXlpJNNlCkIiClSl3fFTv2IQ=;
        b=qx+AjWl6AklI490/YK+ZrL3fi5ZH3SR4id9F4yjm57/HfUhZGb/BFfWQo7S9H/3hkr
         Ay3kWj63IfPyxLD2b7mx7s7+Sar2vTzz2+33YAmKosZcUSk791QySzxS64htIhbrcEO4
         30wSW+Nq/fgRn/H61kS1SyMyIPeNNE8ZGCz8wAvljWj+6vs4SFuczmeeuBmEKn1/y8Hb
         T2VJoMWB2bwM9dsRTP4W6NCk2mLZcTgghtDE37x5VS+osZ5rg+eTyHsSJPc9l/GYJ6Tt
         nNY8wEfGBRWMclvVZOvK3WHiGFn3oMc9h/cDRfPc146ome4eA4QAtwQc3MgeisVV2eza
         8p+w==
X-Forwarded-Encrypted: i=1; AKwUvBxYj7+hobP6pj9RCgHGF7hSgmf5+ltT69R90CtUCmBDIzoFUU+PNmZrv26IIYyYhAvRACqH7jeeZUQ1JBw=@vger.kernel.org
X-Gm-Message-State: AFuF++nSKbAYWjyjMuySMX4/+wlIb4Kl72gjRR1gFCvb0pRgzJMZqiip
	vQnBzP1YyO1QX912IG20d5T6BlGC10RnYWDBNnTDhppXDRdwHOYYv7URBqPqrXsa6l/KBa487Wf
	+mFX1Ew==
X-Received: from plar5.prod.google.com ([2002:a17:902:c7c5:b0:2df:55e9:4fe9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f791:b0:2dd:c100:942d
 with SMTP id d9443c01a7336-2df7e4431e1mr22247165ad.43.1790259196991; Thu, 24
 Sep 2026 07:13:16 -0700 (PDT)
Date: Thu, 24 Sep 2026 07:13:16 -0700
In-Reply-To: <50ccc54c-6cbb-4ae2-a84a-4dcbc958f91c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923163315.1580860-1-seanjc@google.com> <50ccc54c-6cbb-4ae2-a84a-4dcbc958f91c@intel.com>
Message-ID: <arUv_KydBD2kWkIo@google.com>
Subject: Re: [PATCH] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO
 on unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 24, 2026, Xiaoyao Li wrote:
> On 9/24/2026 12:33 AM, Sean Christopherson wrote:
> > Synthesize a triple fault, i.e. exit to userspace with KVM_EXIT_SHUTDOWN,
> > instead of returning -EIO from KVM_RUN if KVM encounters an EPT Violation
> > due to a guest access to a pending page.  Returning -EIO implies KVM is
> > buggy, and most VMMs will respond by completely terminating the VM, versus
> > rebooting the VM in response to KVM_EXIT_SHUTDOWN.  I.e. give the VMM the
> > option of trying to keep the VM (from the end user's perspective) alive.
> 
> But reboot isn't good, neither.
> 
> I still think a new specific exit reason[1] would be better, as I suggested before.
>
> [1] https://lore.kernel.org/kvm/1b0ea352-c645-461b-9e19-5202791f8e2d@intel.com

Doh, I completely forgot about that patch.  *sigh*

I actually thought KVM_EXIT_MEMORY_FAULT this time around, but I was worried that
it would confuse a VMM.  And practically speaking, the VMM can't do anything other
than print some diagnostic details and try to reboot the VM, because the guest has
very deliberately opted out of #VEs.

An alternative to KVM_EXIT_SHUTDOWN would be

  vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
  vcpu->run->system_event.type = KVM_SYSTEM_EVENT_TDX_FATAL;
  vcpu->run->system_event.ndata = 1;
  vcpu->run->system_event.data[0] = gpa;

So that the VMM could log the guilty GPA.  Though I'm not sure I like overloading
an explicit guest event.

As for KVM_EXIT_GUEST_ERROR, I don't see the point.  As above, the VMM can't do
anything other than reboot the VM.  I doubt Linux-as-a-guest will ever support an
interface that allows recovering from this situation, because again, the entire
point is treat unaccepted accesses as fatal conditions.

All in all, I think my vote is still for SHUTDOWN.

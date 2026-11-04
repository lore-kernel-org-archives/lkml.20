Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822338;
	b=DN5MTXZE+B7dsPCslQTRrCOuSJi6UYHc6bLMX9DRvRilQHnLjj1rvWPlE0iIxVIKM7UT
	 gXeg7uDwh43M1mu2ACziom6Z307U1/lid+PkbsxrCxXEQFuuVE3yuNi0VxpNDqq5+0R3s
	 WEVJ+GFMZQvZV/7FK0TW+Y9jCXvZwdGLWlK5m0b9ybS+ufh4AeloWFre8ZtjUXPdSPwmC
	 XUx5kNdCbU3ubauEJBl7D6+QThf0e/DojsnuZeCgA+lFmkrn0G+mh2DTCwxdUK8qLjbVM
	 5TexSuVQ7ZHJM5VWgARxRch+m8PWWhOif53vPInpH0DzfwBKw/B5gJR/eaAngrpsbhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EHk5yeUEIXC7UFrXwF/Qx/XTGMvkxGfWmAK/i22vALA=;
	b=QrIRm4nKmGQDrEMhQ7GgxCqvBAOlmlH9Rts887d+yuP0KZGlJvlNkl5zaeRQU1b9V98x
	 ceO04rJ71HbzcAaFyGrXwg1v7nTlB8HfpgZGUzYyqH9lF83oSXyRJE8ck71kAgYPsYbBN
	 Vy+cK5eDZZ1tPU2ALn3DKOUZdT1ruUCUkB4o0CR1Gz2aNy76ixE24kR8qhoIAPCFo2zTf
	 BZOcz8aQGYKzd48w39LysJUClrYaVlBuWhpcYs4FfA8+FaVJokl7C9Jrz/4wMm/jiDd4x
	 nSs8TAs+oJfVSU23mntNAvJp6LSyo3TQZFAGLz1LsTyclOmOj6cOvEwiRaS6m34mJRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P388IfTt;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B8606D4E2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299B8606D4E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P388IfTt
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed276af91dso359085ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793822337; x=1794427137; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHk5yeUEIXC7UFrXwF/Qx/XTGMvkxGfWmAK/i22vALA=;
        b=P388IfTtlWm2shzuTrtWSPHnZifKhxpoiP7raetv2aDxaF7+9d6u7xEpTB5u7KEe/F
         fwFKjk7docwBVEMjxr63/85Asdm4EBZ1VNn+3e/Oxl6BityVcLbHDYuJXqf+xbklfuIA
         /VLyXTs/lMSSTCo4q8jig8etOM8OmGRhe8mAaJgz75CN+wL5XmM8BtQkdMdnqFY1QLhB
         cIDJpOxlpEvFPqynH01/IBQZEAFEDErzC8+jCKj9pfBzaNuynqe1VmjoCihrt2DcqPPa
         XFsM2d7gIaA8H4E3DMcq+1x6RgzSi6t540TuBV5bzvn0fJoOEk+3gCbGdt/v6ezH2LTn
         7wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822337; x=1794427137;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHk5yeUEIXC7UFrXwF/Qx/XTGMvkxGfWmAK/i22vALA=;
        b=NygCcMe5j4VxzwpUdiW7tADb68bEozIhPob9SaxyGtdMLucsw5b0Ud0FRZHnJHUp/j
         WthPHdhqycsIYNpFV01i9/hyyl0yYjmKPebzZoeH3auYxmyGBkXw8LejcDvUlqpgFJZ3
         Ud5pTxe1dChE0hRRuOe2sCMjP1bg7SMKypeo5aT+rUVqd/NIQevUu1UWcNkK9ZRDAcN7
         51lBxobWmTH4YtP/+sonyp5AqTdl6o8FyEmPLYdAqo53/Byoj6HKf+AKGgiflM+gRy5y
         u/RKCRWqP0gPRjNxOzFOTskwFcZSbJG/PKjsIek22nE1nhQgFUQsSnSlITaWi4eWRonW
         xmlg==
X-Forwarded-Encrypted: i=1; AKwUvByiREDkt2kbDJ8Rr67pbknxf8o1hUt4WegsxUBMZW9BMwfk81OVzMUmv65+CHlKUwr9jQGGUpcXqzgqXS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uEwPEG9bhMolJpE2KA46uOkpjBinqWOp9zZ9/Ho5OVhHoBuzZ
	pYrtFS+J9/T0CGmpH6ObQF6MED7Y9lpEqBQzXpvAiFJDzxs5qwUPWsHVnqsIL1bPHYZvX0xAaTo
	n5HW2vg==
X-Received: from pjwt8.prod.google.com ([2002:a17:90a:d148:b0:3ac:c43b:e307])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d803:b0:3b0:9a0d:b825
 with SMTP id 98e67ed59e1d1-3b09a0db95fmr1809747a91.45.1793822337303; Wed, 04
 Nov 2026 11:58:57 -0800 (PST)
Date: Wed, 4 Nov 2026 11:58:56 -0800
In-Reply-To: <atge--CosCmrOcx6@192.168.1.215>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <atge--CosCmrOcx6@192.168.1.215>
Message-ID: <auuOgNrHhlXSKDRV@google.com>
Subject: Re: [PATCH] KVM: x86: Emulate SYSENTER in 64-bit mode for
 Intel-compatible vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Hao Zhang <hao_zhang_kdev@163.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 21, 2026, Hao Zhang wrote:
> From: Hao Zhang <zhanghao1@kylinos.cn>
> 
> Intel allows SYSENTER in both IA-32e submodes, whereas AMD raises #UD
> in either submode.  On AMD hosts, KVM intercepts #UD and emulates
> SYSENTER to support Intel-compatible vCPUs.
> 
> However, em_sysenter() unconditionally rejects execution from 64-bit
> mode.  As a result, a valid SYSENTER in an Intel-compatible guest can
> fail emulation instead of entering the guest's kernel.  For a
> non-nested guest at CPL0, this results in a
> KVM_INTERNAL_ERROR_EMULATION exit to userspace even when
> KVM_CAP_EXIT_ON_EMULATION_FAILURE is not enabled.
> 
> Remove the unconditional rejection.  

Why?  I'm not inclined to expand the emulator's capabilities for something like
this without a *really* good reason to do so.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678062;
	b=YN0uIgvBnhQrT+VykgyEqOSHrEVCJJRyUm+d+AfdxEOEnSJIrNBpFv+vmQthRpyuQZ3f
	 YOXrZV9CFkMcpHjzXVg0gnoL4a/LO106aYjdWLTSTsNx+oYytNmXrJikHVZRFUDCHX3TM
	 Ba/okb7/zsBTG83f9Pe3z7Xq2C93BsAsCg2++vcvFLrkPNL/yahxk37jWfXOJUW9VDQTx
	 A1PLzQDW8BJ3w6Urh/+4WWiiY0Sadldq72wk8NcibWWxoozI1064IHH3C2IKixX59u0Pi
	 qBw+SdewcxBBzBN911ouhZTpoMYXywfaHK/ybxcsLkr58uQDrUgPvOzCZ+kKuWoOvdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=L2bk+XyfwlmCA3CKyWFm6QRPY6WWogRK1aqIm5Z8PyA=;
	b=HA07+FHju81rcGVojDiuCAMeg5T4W3jtyiMIpL7fAnDd/baffglA0bWVxSiNYmnQ5hTq
	 oNjSh9RQqKJqY54fc2ZK/Xz85O+SiAjqRZbG5aNR0+P6oF5YDoxLOCD+YPwVddBR19cRZ
	 05hyrWDfLe59RwkYvSzV8LGHPR6lOSumD/UXLXTcURqIkfbAsFJdjTHDSMxnn/fQKMIgx
	 0rM6V0l2NBmxE30JdeSoZenqWWtorsk1LmttQzkjrseQg/scR00VknCqMJQMCtGpqTN0p
	 wx/15sleshwGLKCYl81wyFSVH1+/+av0lq+okR8XxRZ5QqQXWV7vSqkTAtRVsrTYxew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=m80Y3cHY;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E506606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E506606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=m80Y3cHY
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so1317599a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792678061; x=1793282861; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2bk+XyfwlmCA3CKyWFm6QRPY6WWogRK1aqIm5Z8PyA=;
        b=m80Y3cHYCV3Bl/jTqvzKFvEaQVG5/sszQP0gu6TSx8jOrHqhGFb/85jUuqb7+WkGni
         X88+TZnJjA89hYTXPYASN0SktYfaLfxyXXew15uGcxKMD2H3Rk49ZelJjXBG0UORucvf
         A+BYE50f7nqLeV3MHu4GHqxZb21M9zbQ9Ufn3sD+i7Kr6VPTvEJ1v0sbw7mskzgmS3jo
         jzYT/vrdrT9mUgue+Nh9TRBHT8Bek4aGOdZS36kymHWF7YhSiSOM32yk/wGYZkr01Ycm
         4LRQQOcHQ6wojgiRXwnF1sjtNdVWb9Dd6tWM4iaOYsmIauRDJAfciBGo7ocxGp12XYkh
         Bspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678061; x=1793282861;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2bk+XyfwlmCA3CKyWFm6QRPY6WWogRK1aqIm5Z8PyA=;
        b=IuTyvJBoxWgssW4xemIZYAXzPi3xSOuc1Iw1vN13ezab2fXojbEizH7m44+/5ObI1F
         vILy2nT5pYWovge+elIjtnXJvcfKQoIXka1xvoT0+KZcHNNAu2R4PQ2ZMvyUIDD27tM6
         A0Wnhbd9iiyUqbdbQKRjaVTOavcHl6fddMWNYabXNfZQkbq5xinrVUQVm+Cd6OxCkA4l
         HaiOmLGoFDFyGOp1uX2oyfnt/e7PKO9cfqbYCRy5IEoTrtVOvbaPPnS4VYHK//tCxkaZ
         aBHUCiQ96TBLzkbRfnzjeXQUXcOi9jgZukPEEOm7dKhXNxCPeGMBVMHVrFUI7wKAD63a
         94Og==
X-Forwarded-Encrypted: i=1; AKwUvByGV9NVaTxDgyaq3zY3okFU/CD1BezuU39uPmr12aBuG1r32+d9lPr0WAGk22FgZmx09fytnQNTP7smTho=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK/FSPmamDzMi/85NAi0xLjJEciET7nIUjKrzedS59E1NwQlOH
	ggBLYQ953wRqtziLnGZ8X7sp02WiIcmOreTUhmP10ZXlEhNHIrkoc4y63z5BWlPagMJpt1Nfa6G
	sWzZMyA==
X-Received: from pjgp5.prod.google.com ([2002:a17:90a:4285:b0:3ab:fd4b:afa8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a48:b0:3ac:8b67:185b
 with SMTP id 98e67ed59e1d1-3ada6c8dfb6mr1430284a91.26.1792678061114; Thu, 22
 Oct 2026 07:07:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 07:07:40 -0700
In-Reply-To: <20261018115229.315110-1-pablo45154@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261018115229.315110-1-pablo45154@gmail.com>
Message-ID: <atoYrLz3gQK8WTk9@google.com>
Subject: Re: [PATCH] KVM: x86: Initialize the PIO bounce buffer on PIT
 control-port reads
From: Sean Christopherson <seanjc@google.com>
To: Pablo Azuaje <pablo45154@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marcelo Tosatti <mtosatti@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Oct 18, 2026, Pablo Azuaje wrote:
> pit_ioport_read() bails out for reads of the control word register
> (port 0x43) without writing to the PIO bounce buffer.  The read is
> nevertheless reported as successful, so the guest receives whatever the
> buffer happens to hold -- typically its own bytes from a previous OUT
> or IN on the same port -- as the readback value.
> 
> Real hardware returns undefined data for reads of the control word
> register, so keep KVM's behavior well-defined and predictable: zero the
> bounce buffer before returning.  The read is still reported as
> successful, and returning the guest's own prior IO bytes as a
> pseudo-readback is observable state with no architectural meaning;
> zeroing is the least-surprise choice.  

Hmm, IMO, returning all ones is more appropriate and would be less surprising as
it's more obviously an error, e.g. mimics bus aborts.  Unless someone objects,
I'll fixup to that when applying.

> This is also hardening rather than a security fix: the leaked bytes belong to
> the guest itself, never to the host.
> 
> Fixes: ee73f656a604 ("KVM: PIT: control word is write-only")
> Signed-off-by: Pablo Azuaje <pablo45154@gmail.com>
> ---
>  arch/x86/kvm/i8254.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
> index 1982b0077ddd..a4c23962f161 100644
> --- a/arch/x86/kvm/i8254.c
> +++ b/arch/x86/kvm/i8254.c
> @@ -522,8 +522,16 @@ static int pit_ioport_read(struct kvm_vcpu *vcpu,
>  		return -EOPNOTSUPP;
>  
>  	addr &= KVM_PIT_CHANNEL_MASK;
> -	if (addr == 3)
> +	if (addr == 3) {
> +		/*
> +		 * The control word register is write-only.  Zero the PIO
> +		 * bounce buffer instead of leaving it untouched, which
> +		 * would feed the guest whatever it last wrote (via OUT or a
> +		 * previous IN) as the readback value.
> +		 */

I'll shorten this to:

		/*
		 * Control words are write-only, arbitrarily return all ones,
		 * e.g. to match bus abort semantics.
		 */

Because this code really should stand on its own (which is the whole point of
hardening this code) and not describe the emulator's rather obscure and subtle
io_read cache behavior.

> +		memset(data, 0, len);
>  		return 0;
> +	}
>  
>  	s = &pit_state->channels[addr];
>  
> -- 
> 2.53.0
> 
> 

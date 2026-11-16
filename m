Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868724;
	b=hxaLve8PdJCE+pJ35fjGQH+8j8QUbsB/EiPX1S32aL5/fvJRZTjZT9I5NbZGs/gqHs8L
	 dzkUKJc4r1nr9XMO71IY8zoDYqkjn3A7aKkSVU5Pwcimel9Rgv+Okvlsii+GuMsF1/H/9
	 RSuFgKKR0BUmAfsR76J1Qsp1N0dApUaxwcq9ldcGxs+5sJlqy+yVa5g/zfSVC9kpLOI3u
	 GuJDkO+as9A540RmNzoT/XxdkwtUWRL0w4L5/AULxbgAeOZjQLUd4FSE35ddgRfz8KDo+
	 41Fr4i9K+y2wxmw8M0MjNMzhEmIKvdGgIbjeajLNuzp8ORwdzZjRKrC4KlOtjLa17/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PXYG1uTYbw/0oX/X9RQZfRtyTf87d2Ai8vb7xAgZiNc=;
	b=ytnLDzTcBdYXH5pazrj5DTvBWoOrRWib1dLRe0W0kIbvawO1MIs/whJ4pdL309YL8TmI
	 vduzQYhMf7XNsTAG1JwMehLBe9Gsb61t7ohaEZk2emdRov5MAoMfobVag8g+oqD+DZuDx
	 ujKvypF5l7YHOfI7sorqVbOaAlWijarIBrXKIUCwnaNnLLFlQMt8HM6I1ebAwTi9jnfE0
	 1tfNhP0i1T9lxpkC/Laxrakw0eOqHIV7JX52k8lRdfb8abNLszLu7lFfNLgT5t63+f8Q0
	 Vx0XBKrj6llhsEwVIaFlsx0I1xHysgptTujMILZwCwlI3vHzlHAAuq6wA1TWpnvusaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eCfaxdJr;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC0606A884
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CC0606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eCfaxdJr
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so56714905ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794868723; x=1795473523; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXYG1uTYbw/0oX/X9RQZfRtyTf87d2Ai8vb7xAgZiNc=;
        b=eCfaxdJrSL3xkCohe4ifwJza4FxjckUsuO0Nn3RiUUgWtAMchQUYCZXdh32mPKZ1gu
         mgHmtuXBpRUpDCNhTE2upAHYZ/Xg/4QI86bb0L6LmeedZXf60WGbkwTzcKCvEx36XdhE
         DGq2C6kTXMpmz1L+B+fnvwbSMGJZotTyTDiZKSdL/cbLM/WXxXBIuoT690nskkdXUvmA
         RGlvhRImIp+1kWU++3Rcl/4jS4RFsK0fOvmroQitps/2viLOKCPXBSMGKwvbqL7VVJkq
         duQNVoBetO2bSXmLcidC//uTRFnEXvVXH7U4WMwcvM0BJXIg73NBdS/wn2JM2Kpxh5Rl
         WLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868723; x=1795473523;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXYG1uTYbw/0oX/X9RQZfRtyTf87d2Ai8vb7xAgZiNc=;
        b=O8xseCZPm7fV7GqsRyej58DU9TcCR2cBfIcokrPlZ196evhRrLd4dfgrmFhX6ZqF6v
         KC7nI43lT9yqhTpYL/8PIW3GaTLp2rECKnVOZWsGVvMo0dvVr/tAYzQ5NZyIfek7Itnr
         BlcPGMreK/XZcP9JAWKb6LI+zsWxUehdht/RqduOaPgvHrUsgtO5K+sTuSIoNucrP8IO
         SK6tCAws5j9jrIN2yzwR9qV0n44QIqGX24IDirm0O0rE0gsgHYrweKZVuyngybZFOF5J
         uMo/vsn6ezSZ0jGFkDtjnDCZ1scyqDn3rGiNDhJ+mmxCac7j56vfX7fwa6QHL2TtU/Hw
         9WhA==
X-Forwarded-Encrypted: i=1; AL+hErHyfRwUT6y4DvhUfQgSg9hiGTNS0dnHOOnJHH4c4x3UuYJ73cuU6MO+XEFnI5G2Kblx2cS44Wu+gOVkSdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z81KpZcATlz4xnz/0eCmlCnvnvngsMmp9Gt8rNjV9T3IMYtRpFy
	N1P9EbtxijnYapY+LwxIXGK29LlFmJCQXwKEHiRCZ/UPaUERBU1nqxasAGVJAWCdQRpS+LomAgf
	XqIxf3A==
X-Received: from plbnb14.prod.google.com ([2002:a17:903:15ce:b0:2e9:5442:b91a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef0c:b0:2e9:6972:54d2
 with SMTP id d9443c01a7336-2ee0de12039mr120569555ad.12.1794868722936; Mon, 16
 Nov 2026 14:38:42 -0800 (PST)
Date: Mon, 16 Nov 2026 14:38:42 -0800
In-Reply-To: <20261116223033.3866283-1-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116223033.3866283-1-ma.mandourr@gmail.com>
Message-ID: <avuF8vW3g_o1t5DM@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3 0/3] KVM: nVMX: Don't clobber VM-Entry instruction
 length on soft INTn exits
From: Sean Christopherson <seanjc@google.com>
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 16, 2026, Mahmoud Abumandour wrote:
> KVM writes the length of a soft INTn that L2 was vectoring at the time of a
> nested VM-Exit into vmcs12's VM-Entry instruction length instead of the VM-Exit
> instruction length.
> 
> Patch 1 is there because Sashiko pointed out that prepare_vmcs12() overwrites
> the VM-exit instruction length that vmcs12_save_pending_event() saves for soft
> events.
> 
> v3:
>  - Rebased onto kvm-x86/next.

v2 still applies cleanly, there's no need to rebase.  I realize it's been several
weeks since you posted v2, but the reality is that everyone and their mother is
using AI to send patches right now, and so anything that isn't affecting real world
use cases is very low priority.  Sorry.

TL;DR: please be patient.

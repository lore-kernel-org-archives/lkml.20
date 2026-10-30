Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386247;
	b=1SR9muBDXRb5dVnn2boUuWfcxK0F0vTqvURYQGJHwnZFyJ2qtitQARDZbKR1IyktyDVj
	 UImvCj9QZKd1iD6PrWYWuI/SIoQENCupUpnZkAOGxkODY0Ww8OhqZtzfM2fhQCGU+HfH4
	 AWScViiCvVSeqbRsl8SwQsEwRmwyljY6uMWD+VZ/Y8j10SPJl68iuDDU0t0snXEr70Gmg
	 7OBBhhScmHXBKvNHP+Xik1O2RCoLyVkt2VFHJE++QMBQwiXDoxnrvySU58I7NF+Epcmex
	 y/XxcMuPLJxeUOJGiuOxt+FRYLhjZTrDjapOYCVOgf3bs0MHPBwbvZ0pjOxPd5uWG4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=35Nd/v4AiZNRM04W1nUZxXcF7X5HwhWNtrnudrsF4gE=;
	b=iq1dkCB4hxZ8Ihs+zOduKuZM62ERKvBySN4L1H9kFIjYJIFCwCdK04foMpoIcu+1Zuiy
	 ay79P9cFd8MIW/JpOv5daG3gHxVa15OOEa16rHOfF4pa/mww52xPguhsdU25ArqJXms6S
	 eSv24TAVkwfabjaRHPSM6lq3VWPZuexSWmyx7pjFwuscVK0rmyeIsw5+E1wBuWW50wKCx
	 /X9L4ENEKnYuvhM9SFeFanfuZbPAIP3kQS3je/i2dIwyjZupIYDxlhJsItM2z4+dK59Bv
	 g4jEOdmtPRPJgMy072bDq3FnYvF8bLNKFIt/OOcTeVwWQcUzqPQPYLUrA3UBrBWH78g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i809iUWR;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1956C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i809iUWR
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso1302178a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793386246; x=1793991046; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35Nd/v4AiZNRM04W1nUZxXcF7X5HwhWNtrnudrsF4gE=;
        b=i809iUWR5+5KDqhWfhVE9dHX1JnTYhGiAxMAr9AMPXZy1cnNvI8H9Rya6or/Lgj5ms
         WA7fK5TkK6/wavgmBrhVIw29knodchEhXotj6nrzUqcCT7c7A0nQShj01GU28WvQfVMV
         SbuusefLcf+t2WlEgtvZ6a297o7Wmq0HGBnACj9iayPi8orct7IrtqaGkjjIgHCVXxDs
         cdkUMRkuP45qsPB1pbzI9iLXBULqi7RSpmoSgzgTOGAxynJGkTngSoErCgpRxQ1pBK2x
         bqqSTCan78vjREP3COyRjkcav0doaYAJeQ/o5nsqoQTLX3HTTqmp4W064m9xC1n7ObEY
         xkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386246; x=1793991046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35Nd/v4AiZNRM04W1nUZxXcF7X5HwhWNtrnudrsF4gE=;
        b=b26BVoGHZ0T8pGB9c7v1Lx+oEXfykfb5hngkYdIwdsdH8bxSy2mmUqfUN2k1bB7k9p
         ffZssEtrwc9xQkD8dAvX/rmNTgGzaYA6mj3bmHWaJdkSzreIVlNkpYA/CitIMrZeNmEC
         yYHz4oEiJ65en0CSwz2G3HeQcceFaPBOy4K2lQqH/V+9hiEwRej7zvgnxRXwps875MwL
         jEE06dgrFKXnKIJWebDmhAx80z1qrYIKOxWNgHiXCbzXC1c+vIXPRqdaX1onAimgPIy6
         4kmX/O+AakIwZrvO688m50dCxI7LEnh+vVsyh7hruFYTCE6QsSD0T/jTZ329xdgY7IV0
         l0dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTgSLklR82+ci++GBR6sEIi7gGiiqE93TgmNVQvC5D/qwoQHkN+JlwzU0FV0oU7BNuffIk1s+u3WhjL8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaGbk1AdUUXmTptzPakFOr7L81W7mYZ5b09walOQ2uno8rN2vi
	H8ntWTqfJUExxVeXozL0cLznDlBuotTteMXaWIJ6WbJ+eOOmXvjWnOnQ5Dsok6jnUTYmT2xffbs
	gv2BqXw==
X-Received: from pjyt8.prod.google.com ([2002:a17:90a:e508:b0:3ae:7abe:56ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5250:b0:3ab:d45c:59da
 with SMTP id 98e67ed59e1d1-3ae897936f9mr2730232a91.40.1793386246143; Fri, 30
 Oct 2026 11:50:46 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:50:45 -0700
In-Reply-To: <20261030032937.2813-1-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030032937.2813-1-ma.mandourr@gmail.com>
Message-ID: <auTnBZMSHWKL4j4b@google.com>
Subject: Re: [PATCH v2 0/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits
 owned by L1
From: Sean Christopherson <seanjc@google.com>
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, Mahmoud Abumandour wrote:
> When L2's LMSW exits to L0 but not to L1, KVM emulates it with
> kvm_lmsw(), which ignores vmcs12's CR0 guest/host mask, so L2 can change
> CR0 bits that L1 owns.
> 
> v2:
>  - Patch 2: order the CR0 store before FNOP and check L2's whole CR0.

I'll send a v3, I already spent an absurd amount of time figuring all of this
out.  I really hate x86 sometimes.

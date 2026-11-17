Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883270;
	b=OsEG7ywKy8EH8fg23Y9jjF4FjzsEsPJDKFKUbNyFe3RTAG01igqbG8K7Yu/4J/hRaIDe
	 gHBbMGEchm7i/4g4VY5o9ad8EpcG+ibEp+GXx3jTN/98SoteF1RQErvmZm9Q6f96dM4nF
	 CK9wypMgAQUubiy3JapURvr8JOcYEhm9TpgAevJa2Yq5G4upsn8YaBEWZfQjfE/D5zGdH
	 OoAAkV55KGu+p7RIKnjPROgxzhbrZtswjTWEuSAogqHMcDDshXhVZ/aNICeTVcpO8W8oO
	 v0aW9MJIggElmuKGFbHLZLTBmQNx0GCB5S1NGlXzDeQrXujPaPJcUMQ+hTB8aFChTeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
	b=oALxOP8V41qV3UvnnXpZitLrqITN3Q8UX9RZL4K9+Fz3iO6tc4YlQhnxnstHxOqb2Y3c
	 Fw8ko24TMvqvxl3FRcdjjn7/ZhjQtOre0Oi3B8Vf0w8FC7dA7QpgoN4EHq1xTNLGzlpUn
	 iQ6W910YY9v277lOM4+NYiENUPOdbUgx7ystMBbPv4RgTddTi6ZPHOhIbMAsnZsPNT1IN
	 uZVfk6Y+k/RMH6VdjsVihthoWcTi/M3dITVaPbMVRc0u19AtaBwVr6x3K4B4R0tQ4DUpB
	 gnkGvhKefOwvaTcXaFnCZwJgmk2F/tscTY7dP2UHXo4lU/NaOe7HOth1JwneLTBZDFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bK+mM2hz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B23606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B23606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bK+mM2hz
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d2f5f1e26so23486191cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:41:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883268; cv=none;
        d=google.com; s=arc-20260327;
        b=Vee7ot12O3j6QsIiZCslZC1uexxnRNC58q+KG8iWV5su3HlaPQLnJjJGOSMHrllZ2u
         H4htjeY5DXkWPFG+SDvD2d3TtORXAu/4rxkysN/Ix34YfGFLzXB6Px0IUVN/LQPURdYF
         yGfV3v7kIVX3AkY5yHNy/oWxCwOAvBsRIYN7Ac0blc3glOdSDfvWxsaIPq4OqWRRalWW
         dzM156ppbqnr/1oTQRUwakUxR+s7PtSf3vj0Ve4Z5Ax0OUCJcnzeVWst6Ubc5iMdur+I
         2ehNyggPBPdFkPq9LA1QYE0s4ANaTT4wqV3zx8zieSqq/YwOTEV0I9+6N36YgcsVoTpH
         hkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
        fh=4klg+72Ywpa6SpNOoGmERkPvr/bDU9ei/5TK2iTzfa0=;
        b=Y+SXqWWXEURL3pUiD9+RJWekU6MK1aNRAcfiTqcPFuxi1jj33slxcJExLu2wTqlCJZ
         U/9Ku+gnWO5G9+wj4tFLzUwIgAdw89kOpXnQxwU0ejgkOwhR6uPqDGFXA6mKsW+XvrNu
         VDuVd8qPhO1jzteJIFeuNYPtkDAcvNEyKiXLXkntIzBr95ezcZ/GR7n5n0koDCLmqu5/
         qUsE98c0R3Fk3VP6s8VWHOCc/+pmAuL1pyVaPDhwf8BDs+EldkHWaRrep2Nvu01K70HK
         Gct04kYMS7Q4+XjPGV2iMVj2e4iVugWInRVcV0wjrZgJ5qOKvloGYsxuzN09EnSzfmYy
         eyTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794883268; x=1795488068; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
        b=bK+mM2hzhL6PojsFAyjZ+/eGWqpn/8XMwiX1TU71mf3U5ZH0W5J3evhcxVHf3RrJoN
         gZl7Zzml0rB2J/0XAjMI3L+03DZWIF1bE7PPrVD16H8Tz5ItO4OlAOtzCaIxBKJ1fBas
         Djdb5G2PP/+dk7IlJTKvJCvgsFUxQd8yvB38p0mA3g8yKOwrZnXxR5xtI0R8PytvuJvu
         FJI92kaoiAemxXiJncgByNZ7rKfOLZQqM4XWr0HjzZISX+aE9BUVJvDEyi23Kh9iizs3
         Q24rbJEjpzmBIhoG8q1XzZs8c1ZvqRUJclGmSBnQO65jBwwIwAmvFz0XneOFFYfN+e06
         sgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883268; x=1795488068;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvQs1sv0nGP1vZDuQ/BDK5aYspXa/hu3w+cobCl25Dg=;
        b=BB6Lc4ZASQgEYMfcX2u9exllQQsXs9vZjtl8brpgHzeP3ZwelXM2DSvupAbEbwwEF3
         Y3sIlTxmiyjLaQayIUJsWowGSTSKL3Pj6echNf9zOQMfeNpb1m2UYTfiYBfrc39dL5ZF
         u9KDqcCNKIBL1wVdxpaHvzTmn/baAPDdegI/6hcJlPEbt07WF8qgXgbwqekYaQtsZa+n
         SEuXtU4yS9wk6ksSW4sWmo6caK0jEboOJSBwxUN94YhiCc0y/BI76jUD8gztHFtjB+Ga
         ZhLz6VJu6yeYge7jabDtYX6aVDykRtdzUZMlrr5pBMZeAjOz2NLOTK2t+HRQPAkldnjL
         Cpqg==
X-Forwarded-Encrypted: i=1; AL+hErEx5Q2x/gcVLOWOz9f+sO04z4vOZRzHVuK2WDFdOBiQ1TOmhiGpaIXvkgeUDMEX4ALyuRA8sArpyy12uyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OpOiouJL8DVmv5xcgVZYBukvEkwsEQ2mM1vJX26d7Ye9DuyFm
	m5qxix5lf1wSbUr1G4Ltuu0v0INsbC4poUOsOWq5iydCGyAMEFGZi3DaxJq+Z+RbuRZDSWpG7nf
	/LPEig1LvMnkRt6Qi3kVRjJcOHuQV3KReINZhNnNg
X-Gm-Gg: AYBFou3zxtpXvzliDKvwoJ7PP7VwDjvVxI6Cpcc1pPgARAtYccVnMwd9kWQJh9stb0v
	c62z28A169BjwQejeUNSE729ZPds+yHC529Af+NZTWDv2orL4qmvYBDMSE2I6RpZaaOwvXFWvZ8
	37w0KSVXBcBfUgviOyjKYjFuYUwAy4NAH9/Xk76vfet+AGQIGsx5Y4IQ8SHdYrtKihsQYswCVyo
	loFjHk8tRJXMg9jO6yciRSjeD9MgNv/fTmJP2chjfcAsL8REFF1gfJwwrC8hHQwBRTXydWbNwNb
	Uq55sNG1FGyJsjslMoLvp4wRpOerOYHjzw33l1kudSK9GNTsnCgxEqY7DMhYAqkhSY66SMuUEv+
	jsKidh8HLGG3E5ApuqkE0gNpbDvBEgUQaA2YRS2oQhGInJGRBa8dwrBDBoQduyjjzPVZN//puhT
	lwRrkd1WiRUFE=
X-Received: by 2002:a05:622a:258e:b0:536:64fd:7b5c with SMTP id
 d75a77b69052e-55ac857d00dmr229653051cf.58.1794883267864; Mon, 16 Nov 2026
 18:41:07 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 18:41:06 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261117011513.39419-2-seanjc@google.com>
References: <20261117011513.39419-1-seanjc@google.com> <20261117011513.39419-2-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 18:41:06 -0800
X-Gm-Features: Aa3M54pz4hKgLgbckwPhwESAbXAcBthYlRHInnCY8jzXIe6R4fuYU-9UgF1wqkE
Message-ID: <CAEvNRgGH3NABq6gioOQ3d1mLKi4dz8srjOy9LYvUSaqXVzJsAw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] KVM: Disallow prefetching PFNs (for SPTEs) via
 VMAs for gmem-only memslots
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Disallow prefetching SPTEs via fast GUP, i.e. by VMA lookup, for gmem-only
> memslots as the whole point of gmem-only memslots is that KVM MMUs should
> get PFNs *only* via the direct guest_memfd interface.  More importantly,
> this will allow skipping/ignoring/eliding mmu_notifier invalidations for
> gmem-only memslots, since it will be impossible for KVM MMUs to have any
> mappings based on the to-be-invalidated VMA (as is intended).
>
> Fixes: 576d035e2aef ("KVM: guest_memfd: Track guest_memfd mmap support in memslot")
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-213282@kernel.org
> Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Closes: https://lore.kernel.org/all/avdAIMDfgL_wy1rx@gremlin
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cf4cb586f140..9938b753948c 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3172,6 +3172,9 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
>  	unsigned long addr;
>  	gfn_t entry = 0;
>
> +	if (kvm_memslot_is_gmem_only(slot))
> +		return -EINVAL;
> +
>  	addr = gfn_to_hva_many(slot, gfn, &entry);
>  	if (kvm_is_error_hva(addr))
>  		return -1;
> --
> 2.56.1.703.gf848ed807c-goog

FWIW, I also looked into kvm_read_guest*() after being pointed there by
AI. Those take a HVA, but don't take any kind of long term pin or have
any reliance on MMU notifiers, so those don't need extra guards.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

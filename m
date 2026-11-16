Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823097;
	b=arbJNETt+bUr6WNQoHxcWNwUd6pS4h3yN4aS+6kW0gGPSowvRgUnystXKTuSNgNoNuF9
	 rWF7oufhObEWBU7EYX2gIaBd3856ezCb6znOiNhAaynDiajKej1EIP0bKiOYxnvNXQ/aP
	 CHLDHZVY7LnzLrE2aHRp3r3IN+BD5C4UIWSAiAUcuSP6bDdmxPN6JcVKPyuOGhZN7aP79
	 5D0K9ZfKZBvvk1JawA3W6OE7Ox8lKzyhjaghgJG9yrVOtRBHEghH9XhsO0bOZ3Jp5qWBb
	 BBZok9pq4bqEkbxBiFiZf0g9/rfKXFH6XBl2VfcGT/nQ2txu7okN470uBlJbKvMrhOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823097;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q0MVmf4IpYCilnXIvfcMMwMLhYICnhyuqiHiEkoOO1o=;
	b=RphgDZcwgBBhTzXfLbV0JbZcEue8uhQFdCpgZv5h/vVyUzaELD18sNOVny+3tV6zZ1Y0
	 c0ZTARb23/uPZChB5DYmOl8LH1okKTXOiSrZJ41yJxdbHBYtUzKPT+yrBCRGV4uzbkLsJ
	 dWmomd2HCOhnwg6hn0ACILmP0w2xh9NUXKYLG2EIogh1GCNAUiCpdcI4jSyTs1n1oDDsc
	 JlIY4W4mtrJ4mTuBKO+pgZPvDZ6+vXYRbsF3CzekG+Xiyd+FZ7HpQJzRHdHLJjJTtI6vV
	 KObKn5eBd+GLAaENPHk7/qqcP26DXi6Zbo6H2E/+XsYSjwQ5R0GHnZjCnC9GBySr5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fZYirC41;
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2617E606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2617E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fZYirC41
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mvr8JUoj4s8hurTRT0oqyf6HkIMals3cteGiU9PnGfg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794823095; v=1; x=1795427895;
 b=fZYirC41uywyw8DHcZTn7hvVidB0LYkLntEQScMOrzv95cA4GWvuaZoNrBOIPUChdn3TCo2M
 Sxh1T4+kWT0NAhA/UOuR61jq3ZZG90JKlQmCkrQg4VTnCtoDatVKNkx0+Ykyjb0j/Po/+njv6nP
 0E/Gze2ysCNtkXHpHUtuneqE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bcaf19a453b2e5f8;
	Mon, 16 Nov 2026 09:58:15 +0000
X-Mizu-Trace-ID: bcaf19a453b2e5f8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so7999e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzQnBlJ8LFe9dAaBlXDdKLqcv7XIdXS15Mq8qhSRXFOdDMxyOjo0xXr5Kk2uKVZ3vFB0EoIPSTJxarlZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F5kgkk/lfJEJW6IYzRHCembuT3m+JxFdGvNF+1cn2nk/lRJv2
	QI/jl8sg4Nt83cIEDi6Wx1omZ/iS0ymcvj83w0pDLsI9ErOjheFRhp5SAhKFVN3Zwd5qhGViSyV
	110AhBCZIsslAerpkaLRXoKmcq+/4p9FiL6NbOED5
X-Received: by 2002:ac2:4e05:0:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c17d90d3b4mr171778e87.3.1794823093196; Mon, 16 Nov 2026
 01:58:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
 <20261111085448.1130701-8-fuad.tabba@linux.dev> <b5927ae8-edef-4042-bf64-da873eff0117@infradead.org>
In-Reply-To: <b5927ae8-edef-4042-bf64-da873eff0117@infradead.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 09:57:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx=SMYSs6Qwmd0BrhbeftsBFs_hzg0T6qE2ZTSYbxW1cw@mail.gmail.com>
X-Gm-Features: AclHuK_nHTjmC_GW6HrL1qkYjVqq18uEdOE3VTq_9PAn58E74FUTCJeR_dnGLlo
Message-ID: <CA+EHjTx=SMYSs6Qwmd0BrhbeftsBFs_hzg0T6qE2ZTSYbxW1cw@mail.gmail.com>
Subject: Re: [PATCH 7/7] KVM: Fix typos in comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 17:05, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/11/26 12:54 AM, Fuad Tabba wrote:
> > @@ -2526,7 +2526,7 @@ static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
> >
> >  /*
> >   * If more than one page is being (un)accounted, @virt must be the address of
> > - * the first page of a block of pages what were allocated together (i.e
> > + * the first page of a block of pages that were allocated together (i.e
>
>                                                                        i.e.
> >   * accounted together).

Will fix that in v2.

>
> Anyway, these changes look good.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.

Thanks for the reviews and acks.

Cheers,
/fuad

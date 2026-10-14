Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351C54488E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990467; cv=pass; b=BH0N4VrevzoSZPflQzerUmzGvwdbXH/klEK0jKrv1bMpna04kz1eKZcVthe//lZ9vu7IXjPUmvOmGeL8l0ln0rYM7yCtbvAarEfxf5uWsmfPs9J4pONXacVPFNKseA5KF+UDhEEy/qQzGqnkO9jCSqj1E+ZOaL9b3MOND86fsV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990467; c=relaxed/simple;
	bh=5bNzJeuDWgzOabLsmNCJ0zffQhzs+dofJPQ9U1sBXvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrhQ6hM0vtpeWoyXQB30gQ2uT2DbgFZDjG03vk9ZEKp5htoYCfX8WKp7DwcYjZHb8bhFXL+HkY6cjpdY5GITsxv+HOa+uy2ZcbSfLU6CZqlFHLQWng31M0KaOBHMvgVJhMxeJhkHOZMNuz2dDcWQs3On0E5fjcuXPU6C2uureJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1WKl78u; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O1WKl78u"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so43729a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791990461; cv=none;
        d=google.com; s=arc-20260327;
        b=U21BDFBARVf9DKwO9Fn8JW4q+xCv9LrfrOyB6BJ8G+Ypyl/elM3L/3UBG7N9FvMYug
         SWkdVlGji2gLQTun0njnW/ky9j12YTBHCVYRqoxYyZAqBQ6qKHXrq1L2prpLOkyS+tCp
         JXAqdaCtdaVtzSCEPyIne2jT/ndAq1HXbPe99jXoh12HZCX9d8Edjeq+Q+uZGbd1si3c
         5Qxv6lBNZQWAO4q2YF9Ne5D7N5iWjRkMyF1rZdS2FAvfv8Uex8IJHYV8qoPeSd3aksqD
         ypE0idwnwQ9FT8DqPWpo0bqwoDlypmvRa/cjPmkWkLqOhok5bIkQpPidzjEtCCDm0hjx
         CG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5bNzJeuDWgzOabLsmNCJ0zffQhzs+dofJPQ9U1sBXvg=;
        fh=qKwJCSvoR/h4iMOLJiS6QoG6jutrUmYpCpBVbE/H6ww=;
        b=FIp87gvvjjq5Fi3el8jTyMxsB7iUjlkJX6dhGkRHIquPWSv00apYGcIWKxALrovK8H
         HROLQdvg1jI1v6Yow6QXziEn+5yZxxGyLmsDtgFyvnnp9JS0bvzduIzQcZKXLoJdY+h8
         kgdKnCsNpZtD7k3nfLvqGxep9kmxwsmqJoq0YX+eGbOMHtLYSUu7kk0g+pbRLcxl0BR7
         jR8gCGciwo0eeW9Q/Ts4zibRrD72wEUg4hkYkFH3W6YgaIhjr17ZIum8Swmi6aGZKkCv
         uA95uPio/zxQ/EeOjaOq2LE5W0J6g1E9t1Dztp1D7UhJZTeeVbypZP1Kpm5sYbHsgxwj
         /zQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791990461; x=1792595261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bNzJeuDWgzOabLsmNCJ0zffQhzs+dofJPQ9U1sBXvg=;
        b=O1WKl78u4l0pg/uAvepPUynw1yanWeiT48sDPOZQkw8pWVSLOCK5PCClh4VtNRlmM3
         FPdAj7sdUuM3AviK9kKLZDBFl4auB/YddbjbkklwS3EYALLUVmAe2SEmpUl6R+b72EvR
         ANzf4soCQsHZZ+5JI5Hllv6mAQcjOAVUVgPL4HZC9nAPmrjJrOIxGKnpY2Vfs6mWjijn
         bqo7pp1SfajmBSPDsuBWNglhWUsBeU7iDT9wxWbRIXj/Bm0XvesSbrxoyRvANBFDNRu+
         lMMFWrUiSiIHCnNRvLrWg4nWxh0cz5MpN6otmtlge5xLdU/s9pvdtkpBs7vt1rZorzMa
         0ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990461; x=1792595261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bNzJeuDWgzOabLsmNCJ0zffQhzs+dofJPQ9U1sBXvg=;
        b=KLBZ6103Z9045A1GjdvRay197b0bEpT5CkhepyLPuSK60X3l+wx/UmPs6/5BGGdUH/
         v9ios5+95aWWH+4UTGY5i/mb26QvplICeBzY2z2qplXlsa4xAyRJjTnJ1nRsGVErb4VQ
         0FqqqPpbO3kGHHSzHgK5yQA55L8xwekglctdKFMgyqNQxzXY7zOP4D/Q3SBqcDwb30Rf
         61MSrdaNz4hq9iHIx0wiMWqCZ8SIc5isqlYSnOtSfvLQnhfi637oBFEUtqSKG9ThnrTS
         9v7rW/53DVh1Z/7bxH1s5A2dSNTzk6veGeS0x4nH2iV6V9xzxbPLSieKOteXjoaqdWTO
         3EuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ76ZnKB/x/y/tUId9MADCx6E1vRVKK0jKoFceTMJqkBmjtx52fVeykUTQm+FIH7ixLnE+YJ3cMJzOOE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnOYMYpRrIJFJBexNFFsnO99AkNRMZu8qgPLSGNX5wZaWnI4Bi
	BoKoBfLJS/8a2SP7hPd3x3RR0Quz+N/ri2WaNzM7bKKL+9CCnRFK7Vw3vdGhL4oyk82xti9bKac
	CMeKBbDF+GgAI/82XulRqO27UIwpWgV6dIap522eS
X-Gm-Gg: AYBFou1C+x0M/8oOTL8GTUurERzjwQRTBPpkvRLcK3JBvkP8nYpyrwXTreXTyoxUCN2
	XZ5MHajiuiAx0/tREnKXO1PysoKSQHCfaD8casS1KaJXbAHDgE8YSaiE2opke4vChbD3sG9UrnQ
	lBAZ5ftYcfAYVZUqL3b+kKx2da1j8JSFp3NPO4VslJ5lvYNP8uAhCG24X7pgp3vO16cuMFjLA34
	BiiFxcF88WnJ/sn0+h3hYd+M57Rx4etDIwOXhotxN7vCUIFUvRnXPq6ZGIQDp7bhY2ekAQX1cZp
	c43edhENbqGcWGzcS5HrxWDxK/r9256YVmadsJrkHw/XmtUT7m39c+w=
X-Received: by 2002:aa7:c74f:0:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b20ab1840amr40855a12.16.1791990460751; Wed, 14 Oct 2026
 08:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-3-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-3-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 08:07:28 -0700
X-Gm-Features: AclHuK8NO6iuYgw8VyNnfWDxbKtdNmhMVsNN1b0pfwT8hRS29kl-cyJUsaZsV2E
Message-ID: <CALMp9eSgc-aWT7j9Hqd0a-tBy9Su7dVSx36pC9T3nLa4Mt9q5g@mail.gmail.com>
Subject: Re: [PATCH v3 02/27] KVM: SVM: Document number of ASIDs CPUID setting
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> KVM arbitrarily advertises 8 ASIDs in KVM_GET_SUPPORTED_CPUID for
> historical reasons. Advertising a small number of ASIDs to L1 is
> currently harmless, as KVM (L0) uses the same ASID for both L1 and L2,
> and flushes that ASID on nested transitions.
>
> However, following changes will add proper ASID emulation and a separate
> ASID for L2, minimizing the TLB flushes on nested transitions. At that
> point, a full TLB flush from a KVM guest (L1) would flush both L1 and L2
> ASIDs, so should be avoided as much as possible by advertising more
> ASIDs to L1.
>
> Increasing the value advertised by KVM is tricky, because a VMM copying
> the number of ASIDs from KVM_GET_SUPPORTED_CPUID may perceive a new VM
> with a higher number of ASIDs as incompatible with older KVM (which is
> not true).
>
> Avoid changing the value advertised by KVM, but document that it is
> essentially meaningless and does not represent a limit or a hint. Also,
> more-or-less encourage userspace to advertise a higher value to avoid
> potential unnecessary TLB flushes from an L1 hypervisor.
>
> Suggested-by: Jim Mattson <jmattson@google.com>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>

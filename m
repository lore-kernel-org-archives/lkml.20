Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515960;
	b=p5xrXzZAufZ9PF50/6jdvAQTYPRxcPkdAfzRN9PKmpE+SplVSPSyjivCbNkdV5dfNb3o
	 eWGWHv3A4T6SLqZRl8VvJa2fX4865cuwiTcaS5tOXqz+ObekZSXb3/9nSLVYNbs8kYVs/
	 DmTEztmXfhiy2RzeCjOz6r48Ahd0PIZfOIPRbRwSpf78JfnjBDaHBdBUbWPkxAsBiegEB
	 GpdzQkemHqML+7qgfugdCHv2HDuwei0HYaBpM/H7GMLSt2d3R1dXy63+RQvDv6mZeqoMD
	 zz5TlRBW5YAO0rk212tchN43sL5Mjj9baPSMP8cVHhYwLfWEnqqKD8Wg676LR6MvCKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
	b=TJw5lDrg7radKzxul4Jv+kQAnOZNjI3w1UpSlUUP6iBZl85r99L95+ntKxDiXCEVagt+
	 FgRXh6xWDj5a8Tqk1fT2h/AvwhAPOjJM9764nFC32Eyh8N4oUFpZGmSvnype7oBmu5REX
	 nfmdbee4h/gOpnSnX4sLNeo75ANNfG9DD3kPdoTlmGiVojRZRybXbR9Gt5rK/7LLmN9wv
	 gc4qxVbo30ZHfKEWa+8faPCekRGyZvyMEcRVDS+6C12TjeH6FpxU8eC2AkaKKq8MHVaUV
	 RDh+cmqB9iQjGdtYK19Ff9MTHt9ZAH4WR4Ie+tM61UYHKsd7oeWW0Jbjbx4d3ZGoJ4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EjiCtsY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38CF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EjiCtsY/
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0e1b91607so3881337b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515959; cv=none;
        d=google.com; s=arc-20260327;
        b=kQzB9X94DFfmDqsAR6rGN3sh8nOOXp0byc31mJVxSFKBZJbqhYcGMrjmcm+Tzkg/EU
         3+Adq2DafTsDijJ1c8TBld4Y46sYk0E6mjamBac8oaDTIZ5h+m8xtozKgZnjF0YxUB0x
         elP0uXdDTywEKm/vOaygm7ermKPgKzonUMpcsZ7F5luorH0p9UXvzPgja7FMwsCo0KWM
         hf7ZgPDucXMMZmPporBfNRFcSb8Ijfel2OZlH1bo/MCE4bOK0K77S6Qwaan6Ok11eXeY
         +YccEvJs0Aw7R711r721t09tnYAg9zyk6fGrbTItEHN93VP2Ef4ndid/YmtN36TDWEJ8
         JQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        fh=IM4Q+lRmSRnHjS4jmU79zwm5YjUTTZzi6YdETwNBo/M=;
        b=T6DlHm4pvCisSdQ0/oXf5k06LZusIdMr1h0xJVF7DdeTMO5PeA5eozWuAJOPx0xj58
         uaeOePDn78uDgaPC2nfcD6gTfneupxwEuspMoSrSp5FKE4JEKrKwRp9YEYHpU3K92rar
         Jf7mMNg+ir8kxU8tSX+Fi3vPrUasvcOHMr0ZPrOnrooHtrTKbw+ZMhQHCmCmf/RVBJNS
         8A4huOuKnxHBfEyHSIEAPAqHPqTLX6+Mjv4+hR4KR6RrJI3d7tbLkLFYKFoE8t4Sx/+S
         Z9EbnkBlceAsXGcN+q7iyFbo3xeemjL8UhKt5QnyJipQcd6wCZPeYYZtsKCjCXBW4sU1
         r8Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515959; x=1793120759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=EjiCtsY/ZOF90gjCs/BDy14TUFvLnpqFVe7zF4DpPHBfTP6HnmeZFgtdMcb9BvlJTp
         4pxSbR5yKKYpyLVtBdpCBsvyBRD54nXnijUfOskpIyUAV1j2g35x18xFYvNJmyTIYgZt
         0iuxf+Px6JyXIGwyCSNSM6+QMU9PoDZyA990d3LGTuvOicsVF4XRBN0VpNObEKNthGjJ
         axPCwU/9cS7gMDkq+phYi5LAcbFA9Pi9h/h2LkktmB6IW4qqlRmTx/BLgILC5JIcw7dF
         bhbJlMjF2Utkn9qL1MppP7RH2+AGU3g8+qlJjopyhCLl6gosrso1m+nEzVxM4AKoFKV1
         xu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515959; x=1793120759;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=p80ueOchdC8fhBhLhKK8zB8vKEJ2OihZnc93IwhYG+loDkAppvG8xG4tEBAmW9dIzJ
         JP46q2RGRik/5Xaw9X79NE10/gmaVCcViyRNBaUpeyysQgVRflPFO16Q+Jy+7JkyhjQv
         21oVYlwdS1XcfI7gRDbIM3uXpZzxTLgaA7eofO+5iAFkQmzDxQ/PkhLeIzclIituPEbG
         2xBU+Zzsb/50fCUKcNiRr7AW3eEyy7j/O4jve7AaoyDQNr6P1DkxgjkYDdWt9yKY5G/1
         DniPDZbz3l83b1O9SMSIzrXSB5EhECZIpAQQITjpelQSOkbVLK+fVrCq6a+2mahiENbO
         STtg==
X-Forwarded-Encrypted: i=1; AKwUvBy25TKcJHKrHmtHhmN6vIw7JrT+Zc8FL6MmR2hheu5AknG8lFWr2hLJxkSLAnfD/9jTHyKHGk3PSzEdRYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaM5A0q2IyMUxF+oyzKazsQDgDyHl0Xl/Dmvmcc2NOAcMzdLNM
	Lfksz+ShkBZfltnJpM9fScVB4C4RUa9x6N9qDIJwUrZZhRSYK6b0z7W6fwAv2yj5IUwIDmrsUUx
	rQMvJqrSGsp5E5R6ebMD6JfvQdjsG4QKCB0V2m4c=
X-Gm-Gg: AYBFou0pCw1BwAUMp6ZP2524VExavkUNaxAXetHZtU2Wc/QMyq3dKWzm/w/KB/CaQ6W
	hlcTyS7f69nUfaIlzjq/FsPVjOaDpS810XvvCAeRWEndy/86nvxJQlKvUUPvKiIxfH5GjA1c9W3
	9cxyQ4yguLkvYNO0iXoMH4BEl+N4Br7MjWqzxu0ugFOUqN4LfRABANA16GbBQinX5iVm0g9SgYE
	daTDeJVFw4TF8hq/u1Qr5lKFIrf/6LKXRXm2X84P60MSwOdvnJ8/fzSVGdQVClBT9zmewuRxsla
	9otmRGmkYIcxaZniZ4ZgE1jjQbFJSuZ2XpWHTl3THwZjUMO9Me5v0A==
X-Received: by 2002:a05:690c:6087:b0:8b0:da84:d1c1 with SMTP id
 00721157ae682-8b0f1f1a89fmr64960787b3.0.1792515958898; Tue, 20 Oct 2026
 10:05:58 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:58 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:57 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 13:05:57 -0400
X-Gm-Features: AclHuK_DtrU2XCq8YwSMY07NqOt7wGt-hW6PGZPkgwrcRUr2dimhQIUPQ6PwL98
Message-ID: <CAPAsAGz89aKUHzm6U9PQZfkGq-GnWsm8AYHeo5+4u34LHk4uZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan/test: cover load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
> does the word loads of the dcache name compare and of path name
> hashing.
>
> None of the KASAN test cases reads memory through it, so nothing
> noticed that KASAN did not check these loads at all.
>
> Add a case that reads a freed object through load_unaligned_zeropad()
> and expects a report. Skip it with hardware tag-based KASAN, since
> arm64 turns tag checking off for this load:
>
>   kasan_load_unaligned_zeropad, x86_64, generic KASAN
>   without "word-at-a-time: check the first byte in
>   load_unaligned_zeropad()"                                 FAILED
>   with it                                                   PASSED
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

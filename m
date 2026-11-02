Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793619891;
	b=bP3V+MxK4n5HccozAiAXuFPkHW3VGCzGJ3YdFRb5t6e0rglekzuUD7llXeSCsVqMJor7
	 NSTYhNFFgmFuTXbQeuJvmR4mztUN3nO6JYXMeU02M8AF5jW25wqfKJgQain55KwCLmokV
	 q6S37aLQItO4j2HLv57+q0cj6LtBjSSZG0tq0pox7wFEnbkfpqOghGntSdmwZP9ZgP+k8
	 EXaAq/HpFADVM//YSD2fJv0znMnMK2hDIl/PC5HxSXPOLvfrwTIgM/fHbUwthSq3cphpf
	 EIbdylrfO3dKqV2f9+0cyaoKRd5uiqtObvgVv+QqUxe37mAXXS/ks2c5DonFftbhGKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
	b=GvLwjXoKxbL3agAnQVwZ2U55HvbP+nX/qkAivmIBsqvcAg5K4jlQ1gEsLU/W9SmgIfZi
	 VFNRUqYpH7WBsz520TzdyA+IR854V339HsWhGyOI1INmJrv6gGmfVyoTaN9KrRY8Le78I
	 fKYe4OVS+OUH4j+X7WopgOeY3/HUH9sJ/+mM9bDB0LkLaTD9UOJFgcfrPf9wFMbc7YZQd
	 6uwxmqDmt6WymtI+/tbr1ScJWQnSdvOsbaQoTZXoILHwfUxgCGJOERxx5qVh6b1Wsxxyw
	 7x3jr4YDHzKAyMDr6Mg1DCM9GomA/jnxrOtqz7/QWig2k3S7lSDhCUrXkj4BtoGUuBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAz0NaP1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1101606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1101606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAz0NaP1
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3732413a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793619889; cv=none;
        d=google.com; s=arc-20260327;
        b=CsSuvUpJQ9I6e1iqdZhFFY/2cYP0bfD9AU/VY8eiX3bTHeSpMD9K3HkEEtP15Rm0nt
         L1UPoth3Yxn3IKXQy2CgFcwiAodwK5XW000awH6tv2hEQm2fUcFUN+KqD5Bj3/3uXT9/
         vNuBwYy5s9Ff/LjTu8GskfvEsK82xDUwvHEYytZsuuyYsshY/eYBlKrq1FDvl+rTuc8r
         bLNOPDUZfLouSPcCqXfJj/fxQwr4+e70ngwHykceHXh8q14w1S8Udesick0lF/1eOeqo
         gmVCLGnONJ9Qwsb19YH4spjYZGWqA3gAUXvTojGQudsTgGNv7M+r7trJe0H1UVhOSVv0
         HRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        fh=Zz0AbD2VKgEDGSQHuX4zxiPpAgKJQxgRCVNCax6JlZQ=;
        b=M82IH6rIlQA+b2EHrHRGfeF4Ou9t/nKUn9aGz7fRzqg+KwoKpRhPIjgDzHzctJsNcR
         CiRDxb7NQ8l6uydxQBbo11kx8e5JdBLAopdpFWqkxxWg0RKsAokmXhxgMIGPztlggdvc
         ajJkXU4aGP7lopOeb5AagCun8uK+A6FLbc/hQ37jl3Z+4lgRnQ4UpUYdMLFFc+3q0u0f
         q2BR9hBe1N+fUZ995BlDDUARWj10u/5pj5sZNIXVgM0J49IqwUms1blA2FKjeFXZRS8c
         cocI16zD5rXoyrhnj5efXaXzgBmb2WcfQtivDJgZUCJkNzz3K/YmThMbLdr0Q/y3tfxc
         Idiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619889; x=1794224689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        b=ZAz0NaP18BX0ezun9oHz1murpqQrqgi9yo4eVAGEKkk3vMCeq9Cy6q5CSOtDLtu2IJ
         fDzUrgJ2soNSFlQ0OTe9SwMFlf8JFoxlhLHs+CYO3eh/Xtii/WG4BYyOJXIMh2+pCAGh
         5Ke5dUfMCBUsxPpTY+wRJhk+gf0KOAqwN2Bc4+M0r9nCGOC2wQm1ojrN8iX3J+gt2W+h
         vUn1CMEEUq+qYU/DPduQne9UFk3Ja2vBTJ3bdoBt2KOtesn/TEvD8DIo1VZGjx92k/2o
         DCGyXov6w2ruhQ3UxvBsUvYFjTbQWJW8OubzqNFF3eWwgpvzqBjPn7BKxlmZBdaK0qSN
         bqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619889; x=1794224689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        b=O5mxD4bTwXXqnZSde+gjANkYmPoBcOEt/T7MLSInNA+DI0W367QL/HO5Ck5EwPH2iV
         wtLweZRzmMJPxem/uCPtPaKoW5iBoMZW6oMsYP85wM0kK6k7zlNnzNqidA3KREUatBaF
         BW+fPr6gBD8+92DtbnXMWgS24nb5SG0Q/EMQNQUfZ+TvAWvEGDUULrJf6oSTjDQoOvvP
         s4c9ABaWqZJtrk9r1EBoyfixSbgA+KrGiCZeoBNd8Bu+d+973vGixVVqFGK+xjQu6ugR
         khLLtonb4wIG4A8p9rJNwVbx3tVMPQvEhKpzVhOX2tHPB6S1HACvN4NVDRk+qwenuM1g
         7giA==
X-Forwarded-Encrypted: i=1; AKwUvBwYFRjqY0ZRlFx2wK9eCIwGelbS6OcRnJKU5/av4288HcP80r3HDPRTz9W43gOSKHaInsPc8wNZC08Rjjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EgdMMuAFj4jqtrr7sdzlNy3eyCe+MOu58Fvs9kFg1B3s7D892
	cFIxMXazf26yNB4LRxWQEcPzdTZZlHZHnmAm0cWuUVnfh0aVZBmFRBz+Jxg8igzGS3IQIVPmeNm
	IUmHBelGzufkbxMe92pbqNsCwPR/C2sI=
X-Gm-Gg: AYBFou2Vqc8yiPziEuZWGL6H2tx9GdrsgKDri2kBj3rySbmZaMzFDNMwiBDqbmMALbf
	slVwAjN3PS4F5iiJp4On41va0+VU7aEknq9cYi+71YKhypkM4sKTgqJy+Rx4w1OYpTslNq0ztaz
	Fa4ENjpkofSxzt9qZ7Ox1iRuUkKSSSYpVEtfWX0kXLj/+RPBkVWOH9lcIdQrktnzNrIIcIVjofz
	4QS9bQZTO/Ic7p5rnb4mXfhnl9U9OjZWhN/wy8XOF+fhyaZboijyLdhs4sAFOUaXFDRx3nuAYFM
	lBeOzef+a+IOUBIy3w5mCz9K6iUVvtYSf8sCAKTtiglXMpg5YeoviKdKIOIdsVAeXQ/9PC1U6m5
	odTYR3hQOaxb+H6sH8gWrgFBnjpOCB+yI5et4C7o2RCFT3tnX/E+xC8Irf6gAbFecnRLjOKE=
X-Received: by 2002:aa7:c1cc:0:b0:6b3:f840:59b5 with SMTP id
 4fb4d7f45d1cf-6b4d4c71d29mr4850911a12.27.1793619889068; Mon, 02 Nov 2026
 03:44:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
In-Reply-To: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Mon, 2 Nov 2026 13:44:37 +0200
X-Gm-Features: AclHuK9z8jjLcwsnJfsDSIZ0apXZZySDKKpQ7s2Xoes3fbuqIuVEpNRNi2DB1ZE
Message-ID: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: Demian Shulhan <demyansh@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com> =
wrote:
>
> I would prefer to keep only the scalar version of the fused copy+csum.
> It reads the data once instead of twice, and on real Armv9 hardware it
> cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> depending on the core (+6-8% throughput). It uses only general-purpose
> registers, so there is no FPSIMD state to save and it is safe in any
> context.
>
> If you are OK with the scalar path, I can send v2 with NEON dropped,
> the scalar path only, and the KUnit fix for the x86 zero-length case
> Jakub reported.
>
The scalar path seems like generic C code and not restricted to arm64,
curious how that performs against existing (e.g. x86) assembly
optimized implementation.
saeed

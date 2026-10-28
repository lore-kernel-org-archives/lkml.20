Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793211145;
	b=UsfBPYBJdxxlX/ID4XU8qrlkJ5QzuQEmv3PMJZY41Kkd8RyIKT4jmqUgGjDCqfr+s2Zv
	 VrszizxgKj1Bl5jsVuJhIi5uWYqTAC5p9H6Eyx3Oy5jF6Jvf1RidQbXDmDkgzIFkVkWwq
	 Xsce/Ouxn1lWcUNXKoCymuDm+mBFxFq4cnxgO5IX18mUbQm3CVAtCcVHice5Ucz3lpzqS
	 D+1vnbfT5qYW3RJHAKKjplkUelH8sHc+VpTdFq2HZepu2KfNaZGaNfwA5mr68KHnfDtMq
	 zf7tNg41Q+f1IaLpjTCK6ZdUqFe3YJQ9bviuD+QZKF+iFaFtVIrvG4kdFiepXNEs7hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
	b=xiNehXwXI+j9+uvA06eMVC/5kZT31kT7CJaJgrewPQlDLYMcoi1nLzLFayXy5Zhfa5Ji
	 AjO/j/I9wekgSBco1FsQsSwhmiFo4c9lyCc4NPQ/tdG2ECqbyGCTa+BAppclOWzCvX+TF
	 YsCfaZkgTkw7hEzzQdLWxXumejRHTuAF4dStAufw850+594lDyBpTstwYOi1OI5cWBVe6
	 Jgprj3ICZ3q5jBZ0BckG6n08ObimEWEtd2dI+NuO1TwhUKJlPNr7fFJhvudz2heXKblVD
	 rQIIeScXllSrIgDHu7VYbBK++SOZMGrvwhrA8myftxIYTdKSjPLvTHhaRjI2cngusrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSf6WKa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E67606A972
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E67606A972
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSf6WKa
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67a70230712so187164d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211144; cv=none;
        d=google.com; s=arc-20260327;
        b=TIs7nEDS+xECJGYJ6N/g87xPoGfNu5+rOTXU/H8Z77w84I1oSSxJto5Mat5V46PD7Y
         QaWkxhcyThpqDVFLl+DGVOshphMYtaQWsSgxgjbfwNziaddMxs8sbDSAOxqkjYxgGkID
         abEXP+ZG7Akl8qZAnHfZ7bKJNFv9NQyntWeWvHWwyq3NxYfoFkRT+NMaka97Q4YtSp13
         OMIX+sNhEELNBM41GSfCwfrtS1LNk87CITWrH5VOIK4r9khzXHU6EIqknIq048h+w0Yv
         Fbt2DKLoacWb1dzCgCkXbn5DHUU77IHfkWDtWau1M9oafQhYwJYUrTX9zjDby3aiL9VZ
         NVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        fh=9/JNEmF3iQn3bknYJaFfJzxsHFYzAbU2QNYEnU89+H4=;
        b=N8CpHqtqBcz5CD8JCSC25FbFLeKFUSVlX3ixUNrTT/P8RjYFBgfFpfqb2JXgATZSST
         0dWzX9LU34CUTcpOVwsQoCYoS0kjxEVm+2dfXK+vE0FhYuM2SDIrH0uvtDU4iVXuAUWk
         cT/31QzNqqqedcWEd3kwunhVe1NM4D+fLt7K+oTqdUcYuwTzRjVbk4clgMurtUnX6ch5
         MktvyO/m3W+b9Ah8YBDm5VwYybfM0s2wj1kEDCctIjdQ8+D64TmjW5KxgCRRCWlHb8JZ
         M2EePxdvt9wCDfyzDh+IGZzzv+yby5zer8j4HzTiJ7A9RtyjlQcPTmMpu55By1xqBUN/
         URPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211144; x=1793815944; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=ALSf6WKanFx5JvmwlsLgV8fFdqXM6xTDgPgW9yrrFjM6/vBGqYK5MP8vdjEFd6Sd98
         NBVXpxDxP5phBJEQbTM6ZF819Et3/utRfYgAYvVe1/7CPYGeKwjbZCJN2+eWDd+DPgOJ
         /JYgpa/2NylgB+nTergZPvZ1EvWvqMF606I1SYcSYUg7ByrEMXm1mMsFZ652rdG5agyO
         B7s01u4kNZ/56+zsY+mpL/w7IdzRejnSTJl0usSaFROTaNzSYew6f1rFzZzNTYa/jteU
         Duz/k0QuEMkQ11mraTPIuGOS/qrwrzXXpBwPJitSAC/lEqMeD/uihh/wLI3vDBA6yzMf
         CDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211144; x=1793815944;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=rRMEyPC888NlQCINtYXUFiB2U6hijWPc0eLhl7WOP6Eaex+PAwNRp7344BozU76/YM
         QzER1Nb77A2R1Z9aDFgDt5dFLZT5slXJIVRR4hoIFxb7AIUQSduxSVZD/mFawXQEXWrx
         ZIN4IYCKYrcHPtr24q4K/8b6CNvFOqGIw8iL1gBk/8tRl2oumAr1mNT7JNoqdcoJMcE2
         +do3vTo2+rOuQaCIvx9Nmr7IRf3wVCBvFvd5gwZp8i2DgIv7wV48WOBkGRUvH4SYDe32
         enc0bSuVcrgMh5SXAOwEl8Rd6os3IeIny/CYSwDdbAMVbZ4iFBvusmGilGr72d0sqQvT
         4FXw==
X-Forwarded-Encrypted: i=1; AKwUvBxn8FpYUxitRKHxl/fUXBpOqmenykglZTwk+8ucfuCkReWUxSmzfoelH+L0CGLZ5BTjtrGfAG2+wAIbQpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgQwQjTkY7wGKjJS1tv2x5iLzBzRKVQDEczLyQ4sLWvvEdPDuB
	Ng7zvlQLCp1U4FwKR9GHaUkiHvbk5e/rQIgIKZSEhIgOjJ/QzGxqg2NMl+GvgnNxLVnKH4sBdip
	A9an9UPLHH6txMD+F9+sUv9WSmnvq4FQ=
X-Gm-Gg: AYBFou0J9gvZTeuElQCqvg5pHBlCH7ToU/c/10T7NaKTOTEMlpSMx2m5cHjvw0lMfT9
	1Of/EWcFhd1PET1pMlgC3OyxC5lb5yu+X80XzUaBsL9gWkuk7tr+0dpFUGo86stGiAZOyKWIpYV
	O57SnM+VydrzTD12NGnUYvThdH+k2vfMUYj08nS5/v8ayWmKGS89PBqAm01TUflUG+VH6KmeI3e
	2xvy1Gp8I+u9Smj1Lc2SXiSevSeDfusON8+XHt7TWATbQrCD6u+aZL6Dhbu68zrLZ73FlFzZ0mG
	qHfIq4UxA/aWrHISHD+/zxODtWbKynzP6a3SjW6xhy1ecnDNHd4BYF3SzVCSEymDPPo7uxAklAl
	8VEzAyQkH2ByekcRW1Nrt907dQ+BMl/s5u7U=
X-Received: by 2002:a05:690e:a4e:b0:675:6f06:5642 with SMTP id
 956f58d0204a3-67a7b9945d2mr4650525d50.1.1793211144098; Wed, 28 Oct 2026
 11:12:24 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
 <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 11:12:22 -0700
X-Gm-Features: AclHuK-o5YV67AfwlA9WNsjqOxV_ScugEYWYzUg986KltKOOqPQjM_oQFfVaIog
Message-ID: <CAPAsAGyEUL1fj2-1=NGBDDO-z47cOHmcFDFexY9T_1_1LCMQJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
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
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> load_unaligned_zeropad() reads a word that may run into an unmapped
> page and recovers through an exception fixup. It does the word loads of
> sized_strscpy() and of the name compare in dentry_string_cmp(), path
> components in hash_name() and hashlen_string(), and the trailing bytes
> in x86's csum_partial().
>
> It is inline assembly on every architecture that implements it, so
> KASAN and KCSAN never see these loads, while read_word_at_a_time() at
> least checks the first byte of each word. A use-after-free or
> out-of-bounds read of a name handed to path lookup goes unreported, and
> so does strscpy() reading from a bad source, which the kasan_strings
> KUnit case expects to be reported. On x86_64 with generic KASAN:
>
>   KASAN and string KUnit suites      failures
>                                   before    after
>   CONFIG_FORTIFY_SOURCE=n              1        0
>   CONFIG_FORTIFY_SOURCE=y              1        0
>
> Check the first byte with instrument_read() at the start of
> load_unaligned_zeropad() on every architecture, as read_word_at_a_time()
> does. All callers only load a word whose first byte belongs to the
> string or buffer they read, so the check does not flag their intended
> reads past the end. Add a no-op instrument_read() for the powerpc
> selftest that builds the header in user space.
>
> Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Reviewed-by: Marco Elver <elver@google.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

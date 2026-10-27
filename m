Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793114956;
	b=2wPMh3V7OH7ZF0nau5nWKFu2D15jvucd5d/6H1+dmZ4KUsFFUe02TYc1RQ4UCZ2jbm4j
	 ZQDbuthV+k7r2wfqFrbModbR7s3+UZeFQphxyRr9sQOP9b0WdTDldokjq11rb+hLMwvfd
	 sRCBE3ALV7NiE/yg8lgYHDO27/Fd3nvcCsjvViWNIQPXi9T5vznIiNHnzDWqlIc1LWCte
	 mhJbLm+VLoCCBUEs3NJ3wnfGpQ+c1eErJbXQS/mLH8KtDAHe7eDOP1yeYZrnljgrw/J4Y
	 macYZGs7L/x+1evYLmGipz6e94ol65RhMRSWx6SZYBb8FnmMNAVGbOl3G30JDtbQugg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xJt4LjKArwtRuvCkWNIZGH/nFt3n6SXQbtx/sgxPjFg=;
	b=m0Y9CG8+6TPIHyq0MaC3MyElzsCC/WrjeOv9Fh5ASvErMLO6dmrG/XMkV6A3OnaM/tw9
	 EOWqrwwb146/Ot+14h4fTiFarqVQq18T8Zi9Yz5ii5LqIrCzA8d6WHrzYNJ8FtPelEpyx
	 gG8Ee4bH2yWrjyVHlCjT0LPZTlwmhdlkTJYE4Sp7JdDVBYpPeyccBQPlV/FeN8iaxWxRa
	 7bkKN+IZ5l2jzLvFGjS186acqv9T9j+Qg5HcYVdnr4p2cN1cf5BJ+ZCL3/2ooRnS3YlGk
	 ZWVyqivHhsa4iKjYxUh+6DqC20WCFbdzZ3GwkCDS5ajI+fy29xlcMP64aWFIxqHli6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zt5ngmJU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A5606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36A5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zt5ngmJU
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so7310063c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114955; cv=none;
        d=google.com; s=arc-20260327;
        b=CFeldTWJG4EcF25Xfwu6S9N19Ha3UlgL6pmKjOrvsa9mTw6FR7gMDW3fY42St/nNfb
         uLlKSG4F0LWA+y1kBKcNXcIF3Q9nwVQjcnnKo+zdIwSPjSwNeLErSJ1QDxPudCVJiQ3C
         keGmszxDm6rFszCZGPiFgZJ15ASpLwMu15sRbXpxhgY3hpHSxg3DuJ803GiaOdoKJdqo
         HjWvn+qRFmOZUsgVkjntPK2mhn0ZKTJTmikC/vMktZgIk/RVRirpZx6UfLu4BKzbr+Lk
         PDut+KE8tMCMn2aFFVTR/aAcnSn90aknK2KfWp/A0s8UUS/4DQio7lKDtE62BHfXFa2X
         Atng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJt4LjKArwtRuvCkWNIZGH/nFt3n6SXQbtx/sgxPjFg=;
        fh=r65CUacl/c2s2tmGxowie2+RGxxHx2U7pVasi4p+T1U=;
        b=CYWcssTqRjvcysaVrizII0TiEHzOpkrc9x1QboLieRqbhzG+upiBgbJaBOVI3yZ4vs
         fy/rqQFaaMXiWu/TIVnYxSg7Q7tbqOZSwPTYIy1s3IhTaRnnWAWxpGvkrZbmGJg0T15+
         Ea/oXBwo8YcqZb42zKGEs9iTJXYZzhPYtd7CLM3b97PM+/QY9oN1k7kJN9vN0Qu3Po81
         XnQo5iUlnbaGVGVdni4jc26wBbQjOcCHqfI6seC1FJDyaPQA+Viz2SiZ47YCzUc+vDax
         l3KymlNzlOSbM8Tp62sV4CU757Q3HkQfreDXtGWq8YvEaYWxkDMsvmfE1kqSVrOmqdYI
         J5GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793114955; x=1793719755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJt4LjKArwtRuvCkWNIZGH/nFt3n6SXQbtx/sgxPjFg=;
        b=Zt5ngmJUi2v8FQ7o4+xebLlhSRFBzH7xb4vVuFJbpaoJaORqZwhOUEv4xfsklnDvBq
         FHSnP6/iUZ6bCttUlbCX8OVWwGKm6nm36JS1uheNp7aDaY32SnrhqeAMaK1pdJaxCojM
         58MpFlyDY2umkIbt/yMRufYNfVrkBdbhP3m/U6t5lKwYyZ2vW938LLThankpuMY1rPQ1
         1ApilrM+tjCyzWCGrmwgTXqewIoMClFrvZCihmnLkeQqCxg248kipU5+qn2Upcv5gPpe
         hhycSMSDxf00LmYZ3kjEm4NANWN5VKa7zd/mdmtdrZrGwZoCwS4RoXUGjJWhqC4Tiuip
         z3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114955; x=1793719755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJt4LjKArwtRuvCkWNIZGH/nFt3n6SXQbtx/sgxPjFg=;
        b=pAbFUwQ099EG+eBIwclIPS1hMZSTDpdOzJ3G5QALfZBEKLguvgXufpU0dbd5lrOFFE
         UBr3D6t83c1rTw3VEurqVFk86MN0rQe44ZSSsMS++fbq9fjUaTu9om5PzbNFF2TkhYbT
         SMJNCrl5A6dFWMkt1x/mW0y89uHbC/ksce8WuAHBdhuh9meUbwiImgvauFuvxkVV+v+w
         Xd/VxolmuOyaTzALJGgKbXSpC5/fGKKGQv/8fybn14KYjzcuMQgh6SHBE9HioVbZoJ/h
         X5Ze1xFCkDheFggE8vvZ7wtJV7y9VOqQ6aCq1Z+k62nJ93wmVhYYWzm3OagFXsjwXqcP
         z89Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0+x9pOLYJgJUYRoGivyQzBYgcy6qjAMcZn7iTY5hnyPz3D2ab0+FaXJksGgNdKvzixc40/dzDfgxDBgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgaTua4dfwNwdKbduSi8cSHtPbV8LypFHG5i+pva2zB5T14g1o
	RWRYpT/FTkbJrpysKYXrDvQdCs4oRf8iBkWKEnZ12Dy9iL/4cf/jLpcsKtqk1bylqvTTyXEV0kc
	UJyONwfAcnUb64q5BuLy5TyF/W2HoTtkviPzZTH+Z
X-Gm-Gg: AYBFou3AI8yzRQVX6sP1EL924yN1+UJkUczDcH3tBXFY4h96uYH9s4YMGlI1Bux8VH3
	wo1e8ZsZJschmdxDfwDrN8PH9vqPklJO8jfP99yXs94xM/YYrkrz2xCP8la57aKnzjJHtU3aGFk
	QPFvPGN0OaHqg0IZFAH1vAzOR7xFNKLYPefOCAcGmJc66MCQ1AWU+KCrZ5OXur9aciwbt84GWWN
	6vWTn+4A87B7NlRrH8cThzyGSdUOwaPoezj5lo75Y0AHDpD8tI2u2QImVMeV8GI+0iYftMy0SIP
	HwPNMZdoH7OYu9He1vsw6YjsnOsppZYRLKknu6v6KAmWqwXijuwjY1W49ZjWH02ArZR/VCh1Joy
	s8p0bh/64c580OZXIYoKmgx7Af7HUz+9MObjIPSEYR8l/6wHlBHUmsVTonJcG1gB/pj70xhwOVN
	gc/rdq+mBgHWzbZA==
X-Received: by 2002:a05:701b:4243:20b0:143:2967:c0b1 with SMTP id
 a92af1059eb24-19935437c06mr15136976c88.25.1793114953884; Tue, 27 Oct 2026
 08:29:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com> <20261006-kmsan-serie-v1-1-07fa860ef3de@gmail.com>
In-Reply-To: <20261006-kmsan-serie-v1-1-07fa860ef3de@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 27 Oct 2026 16:28:36 +0100
X-Gm-Features: AclHuK-SjASIN06q-cVJ4rtaP1Zxz_RqE2zGb415zKpFdQylbzdytEGAgfazCmo
Message-ID: <CAG_fn=X=edvfVtq35i7baEKems+ahRb87LY66xLwGLvW9BLZdg@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/kmsan: Fix CPU entry area metadata lookup
To: vrilutza@gmail.com, Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Borislav Petkov <bp@suse.de>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 8:10=E2=80=AFPM Viorel Cernateanu via B4 Relay
<devnull+vrilutza.gmail.com@kernel.org> wrote:
>
> From: Viorel Cernateanu <vrilutza@gmail.com>
>
> arch_kmsan_get_meta_or_null() works out which CPU owns an address in the
> CPU entry area as (addr - CPU_ENTRY_AREA_BASE) / CPU_ENTRY_AREA_SIZE.
> That is wrong in two ways:
>
>  - With KASLR, init_cea_offsets() puts each CPU's area in a random slot,
>    so the result is a slot number, usually far above NR_CPUS, and
>    get_cpu_entry_area() reads past the end of __per_cpu_offset[].

Thanks for noticing this!
I find the O(n) lookup per each memory access to the cpu_entry_area
excessive. Could we disable the randomization in
arch/x86/mm/cpu_entry_area.c

        if (!kaslr_enabled() || IS_ENABLED(CONFIG_KMSAN)) {
                for_each_possible_cpu(i)
                        per_cpu(_cea_offset, i) =3D i;
                return;
        }

(there's a similar precedent for KASAN in arch/x86/include/asm/setup.h alre=
ady)

Peter, what do you think?

>
>  - The per-CPU areas start one page higher, at CPU_ENTRY_AREA_PER_CPU.
>    Even without KASLR, the last page of each area is attributed to the
>    next CPU, so KMSAN loses that page, and for the last CPU the lookup
>    uses a CPU that does not exist.

I guess this part still needs fixing after we disable the randomization.

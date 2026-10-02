Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D4E3911CD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974749; cv=pass; b=WidJbqHKJp6Yi4JObnypyVDYiAAxjjxo2i1zs4zm0TFRx/c/ZHwRIrr0wZ6Ia+diUIeqPmC/yj1R6sPtB01wgyaSLBiCV9OTMD9Sc67NEHSB6+UG2NbirTA6j4BanFVh6MaPgGvQfOwSnI12WbBa7ZNEUbEx6fDOvue31lHDUuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974749; c=relaxed/simple;
	bh=d4zdnmEn5Tm+oEX/jZM8tuqzZh7o94u1nWOKMJtTrOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSibZyxCxAvRe01JF0mWg2xYUbB9x39kbc6YPp4zG43mXdHEQB/yrskYhVJTZnvzkhSmAzk44G8t4LAkbJmWMEMcALykTgCl3PmUcckynFxP8vqE84LLeNpkflEumsbeJxtUJOMARgOhlrOMr1wOTlpDu97+/KZR97gRPgDVE0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ex3deoJy; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ex3deoJy"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c5d196b0bso1713eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790974747; cv=none;
        d=google.com; s=arc-20260327;
        b=q6tbYJxXv7fVkss5T/94vxvACGW4d6DIM+AgL5BO6YbCOUEuyIfCqDQUWtrH5gMgNW
         aS1FaVubRuSVr60bD/idC4uA+0tqlLVl3lS5zvzX2K1xheX8Vx18jtRf3ShCoJu4ZjSh
         1KM4HEjODW6u50vYCvtDcBMGlS2WH5Sm21GarCzV7FK5p6LcuvCGLRneNQYj+lQJ20ku
         3FZ4a/T/a9gAWeVmr0LcL18W54HzcAUlN2EiG6YzVJfMz2CvpeqwTJ2cbcmd6QYzTufl
         EXIIVrXl6E6TkeQcnjn8QhdUacJyCT21+rc4MitYjaBAi0hfFkuLzfnXCAt1qy4iwM+i
         bOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzHVDpXK5KLxpfOZ22bo8Tz/Bpd7WZiqFmkifAIRfvI=;
        fh=IE4+7pyYcLEiOTip/GUPRK5vsHYMXKUAlxhEORhtQbA=;
        b=rhUef72PZe68KmjrKb+tiLeNgLjrEKk+OQSzRvEPuIaMLGDuSWswdOAcm5Gm2m96Mm
         lYPGiqRPjhBzqJQ66zYkjOhzNefPLC3PA/C6ic9PZbPGckrgCyaTSJEWJne6i97fMdg9
         o8Xy9+07SXRuOYI+c0XFRCTDm5vFh36dZPnDxWmdux88ZdjA54FJlfE2u5MHAtIQsxzW
         upybhKQeSFmm9su+45PHXCW+WRVwn16CAdGMf8VICEmiZySvHN9YqHpdig+55Jn72eP7
         Ge80QLpW5LEua01YlLFINBczDTLPguFOuiOmxA1FYb0LLx3wFTCPqy0S0M205hJ3GjQh
         fujg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790974747; x=1791579547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzHVDpXK5KLxpfOZ22bo8Tz/Bpd7WZiqFmkifAIRfvI=;
        b=Ex3deoJyZ7/qPIqZpKAUYvjZ5wu5lTkgigguZq5Yp/doAfy3ZraKwBt94L1Hl3eTfS
         JGSkNk504EFy5qR/sBSQzWRqra/KcBO6IlcWgWVLPvVifGy5FL6vwauxCiUe0LRPO9Xq
         O8JnPuWp1CazTF0RZiLljAh9XfZ+x8I3W7LueeiCncAdY1/jMDKCrtOqCV/GY7sF9gS/
         VQqANzBlUPaEi+kZULq709/OJdRwHQPePo6g3oshSeIM56oWspvaocu1PLRrktDLcCnd
         swZvJxDJhPkvABdv1idZwG1fP1IxjlVtV3HSgKTpttcqYg/gSojjS9LT9i/0eS6jJ6hr
         /xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974747; x=1791579547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzHVDpXK5KLxpfOZ22bo8Tz/Bpd7WZiqFmkifAIRfvI=;
        b=JLut/5SsTEqXG3R/hPGRm+peZt3J3FSgCH04/47c0g1DAKY2U8xdvopMFu3LzY9/Kq
         zZnIBPA1kRBDcuiPch7QHGtUWfcB+QcmFHFWk4VXrX+HRrM9/zi1RI/sqNkWYyF4Oizf
         VOx2NYMMhGhiGL+zT8v7w0xHngGUuUHV20uJ5zjwc8D4B7/NWpr5MCpvgdbBXJ3SOlYp
         QaFcwtlZTlHDIeukP6C+cyD3j4N8MNb5bn7XRJo8q2p36krZ90E8/j7xQlQ+MLFitb5L
         zsQmt84i85ufZttvc65ZedUvjte9FUnKmIDEwlyzmzQYKWwFJlqm0EL50UODJsvGpKUK
         x3Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxmwDQuNZ2L7/iDcsYw7Ut9gDhzUGPe+8b0qkdm0pgueOqj8cf9A2Ftb+GPlBhqSK8iwkQ2JOdUG2avfqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/6fnOakIbdupTd7+9yTnf+1edNGnkC5SgZd8MKkW5AdD+mT7j
	VHSnpKyPyoTT09EZvo90/aW1W8wPQvon7sg10MyMcOqcxtVdUkp0GfP2PEe/jyQrYGrg9UkvtA+
	0yR7/1WbZw26EgH5InORaREN+aZ4o+VU=
X-Gm-Gg: AYBFou2Kc16uA1qYAS5CmISTx2Ntu19xoCe7pdJIW8CbQsFc5ycjeuhHZovm/I/Cqh+
	+zpMM4v+D9jXPbd4a4U/cYHIPGwCB7oRQLSsI/9y/OOqZplTTOvC1G+oN+le7o4BuAeQHNNtSOY
	EnP0Q9eUcq27KoTj74+ePixsMbz7hbDDOCTTkMUGBoNjAs2ayQPfBLRCf5gYHQrTEvSa7LfYfTR
	hMeoz2359tzeY8PWemtQVwCXwgfl8qNdW1JxaqPQIP/ekOfbBN2gMhpfZtL9mgPTyvyC+B3PAkR
	ZlnZnDTnHMl1chfxRZMUIzc0bNHgoEbBk1Qg8916lilsPZz3jIWjQM+7Yv2eXTDs0H8ALOECa0f
	1T8ibhmyxfFOK+AFEeASNKg6c6OG9kR/anZsTw87UuwHQP7aL+hXZRqZ3SuNlDqKLB9nplZ1mW/
	XuFNMe4nFUWNPEhCDkBcDtKczEg95EyglUBxjQJZQx1W3FQ8XviFo=
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr6999038eec.1.1790974747077; Fri, 02 Oct 2026
 13:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-3-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-3-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 22:58:53 +0200
X-Gm-Features: AclHuK8s0H8deXBzdQyOJ58OT7ccmt_U5WfDrJaJxOcsbsZlXNomLs2P-gq80PM
Message-ID: <CANiq72m2h=g5AWQQqfUKkgFfj1vCMEDbVJ25UE4a=zu-MUs=Qg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rust: add pr_*_ratelimit! macros for printing
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> +    pub const unsafe fn new_static(name: &'static CStr, interval: i32, b=
urst: i32) -> Self {
> +        Self {
> +            inner: Opaque::new(bindings::ratelimit_state {
> +                lock: kernel::sync::lock::spinlock::raw_spin_lock_unlock=
ed(name),
> +                interval,
> +                burst,
> +                ..pin_init::zeroed()
> +            }),
> +        }
> +    }

Sashiko is right here -- missing `// INVARIANT`.

> +        // We don't set `RATELIMIT_MSG_ON_RELEASE`, so the function name=
 parameter is not used.

This seems inverted as well.

I hope that helps!

Cheers,
Miguel

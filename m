Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342682;
	b=b7sONbVTiwbYjDp3II7RSmsSsasKGqbaiLLqcjvZTZ5j+G8OtPbYzg6NFdIWY+8ariXC
	 AL3vpCFgHVedcRTuAHJk7ey9EqcKyGeKfQf0Jz45OISUDfagkSDHyMyGXtT6cKPsFirqw
	 1XFB/zCVyIIK7pP6SmZk440RKGVgXrBzJ0YkKidOX4OTBgiF9GOXsyd948/T5vyW9FDeb
	 3P2R4je0/U4s8PaIOd2dpvQ+ybk2cYgkLc8RefFRnTJski1dinx+T3utkfcRyO+3dOcwh
	 OtkzqeJLlcfudQ5e+VkLEHl/bC9Om4bf3w2nmhPJrnx8NuBdxbgKZf4KIgTGS/2Mpdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
	b=2oTXJYmgOexuMsfn3cXLKaP35RFV3XtZtQRJJnG18WJ6wyi1z1ZdkUd/2x/lXknN9BvH
	 6bbPwZkWyBhmSDc3OvdWMNeJiRPTsRH9bDczRlJHxbjA8NNxyaLrfhXCKhfPZejFRPMQA
	 kD4fxtiOuXK7Hnr4eInORETtiq/N4wqkPyb9le5Ws84/P/yNlnFpsYioVeAZs/CzI31pO
	 YwxeZjoBKcI/N0B+/RWdqGVmrpaxZgi30m+dEa0FLpeq81NccifnqSW41i5YnjZZB2hnS
	 /nzG3FI5O6GpkZyxEwyDIYozInxh2H0HS6N1J8bipedrxMaP7upHIvUm1UJC+moGMfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2tE9abR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB368606C8E2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB368606C8E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2tE9abR
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdd77a90f51so184052a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342681; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6+CbhJOhmJiGWuGHcTGfnjKhG+4GFDEy2FD2anrUib/CPhdSsmo0W2hR7ZWj0M4r1
         Bd6p/yplG3uYAW59J5hM/uHHDOAg842cfZzVodASp5nqqNUfxWtsHwgMVPl15Wk5bQtv
         LavmYrPwa1jfMUcwwb1gny5MGgFuwNG1/Qjdg5IVR/vbW2HWFv5daYqErW2YNXCxaBZ+
         Son92jDXIGda8+gYPnSTvAnj9in+x99ns9uSsKCC8JMv+YGLpoiOEX0BjdqzmtKF3NBJ
         +0nm+jqk86newq2M2X0Wd/SCvbiiRRuE9lu9IMZJOO8EE6SS5VZHMW9sZaaHJ+qpWDki
         eGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        fh=GuKb+xqeIVxQwX9/fom82DBJRh3KX9Lf7HUSSsDR8SQ=;
        b=phyGSSGY8TrDqi4k+Mum1kg1TJKeJnIkCD4MbRbwoxlcX7DuZ9wMbiJuBNzTl1pFGB
         rhSGfbAiXxDumrbmmMTdq9NWuXWkVd4ieegc7LaBkiYlA256iwIi4eFXouyGIcZYllGs
         uEfj60X1OF1dUYjA21uuJAWbjDmg3dpEEhHJBiVpn7baX9Ac+ORt0ygKXE2zIgkVnS5o
         +dQe7xi7ObhzuSF7MWBl9s0CDMEbetg3GU7XZnpBP/ogUKVwQN91IqaZVKOUXwQGbBdI
         CLEEglfNveZgg4ym0TDN27v4VAl2fJpBhvZKW1vW7r88R7AAVNCvuck5TtBx+mTp0ig+
         jF3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342681; x=1794947481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=k2tE9abRBySKHePpNw1+hoNwrpCgT9c1iMM92CBR/SFMFu9jyXbH2iCcyH+EmTQTiC
         yBLJMfHXGvpr8xfRPVxQgfnzsDthjwfax2/Tnn6lH65+pgpZ0HNuhexFozmuzYNDgx1y
         +ICdy5xZl5sBC6bwvrkn36HKWD07+HHxiPTqxB/C1Omj/my+bOWwBptkbM1GsQUlAwPd
         k5iKPtFQZWvnr7YHFJcpDSPfMwZhKuL+MTgC+TsDNhb2aGfrhumIhozOSJlps1NyLDFl
         5aulmNUtJ6KcGlw54fstXxrfYoWNLogwNTb77YvSuFf2tr3hJNYtNL4UfLVJ9xRwvNJ4
         xX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342681; x=1794947481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=dFmaZUzdnsmYv8xHJTfZObUSJ9K/4eUhOZJKIPr8e7yc6ubmSGiG3u811SfyfC1Ji0
         4+nyOX5YiwNQ5R0CPSHDawCBDkM2JwequKGQzxIly1s2lFdu8/Do1Zxvr2AANDjVBGOK
         8iwTd71VyQGTHXgvENdx73kjLIsDdmmJhqC1S+uFirkj3Pf0lCLpaYx0KJDWDmnmGdAs
         GTNEPu75YjMY7qOqqQbU17C8pDRDqedH141TT2Hujf0g5wnR5nPMxI5PZyXEJ02EMXBE
         B+6ajnvzhLhgPDtfo6/w9VWwf2zTssMPKAYT2lesyDLJhVbfNaWayYyQfNvZeShazMIf
         +OQQ==
X-Forwarded-Encrypted: i=1; AL+hErG5Fx4ckEc3ELrermDStZhYexx2zDD85VFaNdavoBjaS0D6uhEXgmy4s2LFpMiFYQopwH759HZ7zCRECUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+CutqzFuSiV3dlXCyToppLrWMSAhpvOkAN3dqb7Np23G2rIj1
	iOnsSQBY6BgfDvechg5W02mv01WqEQmC8yX0gepNsaKkC5fKXVu0gFzUJsilPt0snoxCf+OgcGV
	Ulp0VZJyQixE2ThxAOuOkfXaeWM264TQ=
X-Gm-Gg: AYBFou0opkfA2429y6aVc8ABKY4rLyYj8lvoFea9ld1KB/kTCcipVV42OBReZXFB79i
	J3cFYrE0NhVfEpPVRJsS5THKwoICVEDrHEOqgm4HD0PnJZjsMBbS0m8Sy7MrJaDdYlqp4RcaegX
	nyMaA97ZxcpgI4Y09B+isTx3S9mds9cx8Khbvr34iSN44Q1QQmAO4cSPqcUSHWt8dAsPYp4B7sG
	RL5PSHRVkM1eFcCmL9QqwxyGhPn8wjW5+i2395GF3Iz3gxGhad9JRhdoJkSJkngemIoOUFKoMPx
	XnwN5N4zAG6o3kYw31DvrIAjgjIexQwlGz/MOjkY/FR0CUCMAVwoxN6vHWJCOs1j7MTpudtHG12
	aXRfOTDC1ohSC61MDfGkXCi7MI6VIPS6PeqixM90IWnzinRyn/dGZn7WY+VPevl9m+SJ80qo8OL
	XrDgeeG4dD2dvqwiFsnEtO1vJk5mdfhf1yeAcyDvR+HqIrW/71fLDvBuFGN853aabvESxxaxTSk
	TievzZlxAIHab3YyhOJQKnVk5VJ/yYCVaJ5lhipFWcN0Inq3Z/TLHjgfQ==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id
 98e67ed59e1d1-3b182f3642cmr189775a91.6.1794342681275; Tue, 10 Nov 2026
 12:31:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 21:31:08 +0100
X-Gm-Features: AclHuK_uckGpnRQludUiuJa2Hr3E-2Svi5DrMdfVjm-Nu4czLx7g97kWJ04gZ0I
Message-ID: <CANiq72npfiOC2ZCan-zAe-h79kba_5jtWFAeAoigCs_hnO8gJA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:

Any comments on this?

If it helps, then I am happy to take it via one of the Rust trees with
an Acked-by from x86.

Thanks!

Cheers,
Miguel

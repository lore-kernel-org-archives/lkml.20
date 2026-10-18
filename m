Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579B23DE44C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365147; cv=none; b=jv3+XPE/Qkt+1nsWsr0FaYVwudKadcL3VcaUDYpflAs7Pmwmp2+d8oTZ3tJBMmjULjyrYxl6geZEn7rSyCgsQIzCm2G/ijCP2UcC2X4gnhhMMdY4OQ8i9VNNNPQytyJlnR0rDngfEMMrEqNbIXy2dIYI0KSFJ+pQbYYMPRvqEWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365147; c=relaxed/simple;
	bh=FmRZBhpqLPyc1UGxxy4qJoUHxNedPgUqXqvk3ujJM1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAnJJx+Ykh3n/bbriqPZlFYCxzzC6YSydxd6pm1mtPOM3D1typPiX3Cn1mHhBpfZPlXLhvsS72XAaoI8kqvgw8h1SM4Os/Cvlvm0zbiyAHfu1QTMV0MHGcBfCjtAnpnbLiJZyAPGO4VbPxXKhk0yAvetxQLFe1Kxcbcgr9ickSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ULInmk5k; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ULInmk5k"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso2370334a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792365143; x=1792969943; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppuPp4Of6QB0MqdJw5vbPQTFdSm51NtQw86VD0/q+5E=;
        b=ULInmk5krdrdVnz1hL9loM4bYhVW1ZU8F24+6ODujTZVcHPe4C4kTNd0LjiYGRrVz7
         b58lzsVriKgtk5oKzBAIUcpiMU2fG0/BPYK7CxTZdjATLSZhGV7V8dL8hmNXsSj0yf/2
         h0nG8H77/NQj5t+c7moqUZhqbW9RohqX9Guyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365143; x=1792969943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ppuPp4Of6QB0MqdJw5vbPQTFdSm51NtQw86VD0/q+5E=;
        b=CzPiHqh/blTD0pzZzLoUsoDufy6aT0D3M0XYUn4JrTbslwAyg2/e3M6TAPivU4K/KN
         jdlveoojoa15333Hy6LcJ47aICdk8CC5qx9fcd+7L+g/H6l1vqlJK7EhQgM76cSfT6Dt
         1pK5qSJh1zvUxKvZRORqkc4zwFQmTtjLTSJgmIKItz8USy7QmNsajPmLL7xVx669B82/
         QkIthPxxc6wi9ZhBl6WNLkszbY4aexyrCK57IRR7dH/bVgAqbWudCE5bUCe0xVJsqoR7
         os/uLI7PMMoghdYuuZJKq5AwHDa0YEHR3v7PUv8UxEcgNuVGYvD8Om26vKmFj8dPwUBG
         /CFw==
X-Forwarded-Encrypted: i=1; AKwUvBzu+MekuJT0p6+67H1i5IJlKJ7IypdcwlcGeLHvW2kUXP6ajr4L24WQg1q52VCo6O8qBspdyOoJ+82BOBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMBb24lhxPhh7n7jBf4JVq8Nh0jge3bkrj6i6wY4Npfm6gZJam
	qlhQNcyc5q/hjoOwKUIJp/cCLU97A9ef+l5c10iJZ63WZAV960JNY+lm9w/G7gnO6fY2PWKU3xz
	6uqnrr3I=
X-Gm-Gg: AYBFou18GzLbNPaunR7DUzYhSMUKTZL+RLzxdvvANdEUb3mojaIjrayxPAEzomvMFjb
	CqNtIRya84iuZRfKCxQwfOEOGMcgpwdHPmayeJp8ZQbYEPjBDdM5jqH5cJyen/DzRcBH2Fv3Lzl
	e8gHXTQH3f2yKYmcHMFFc4WXlYegFlfR+9eVpdGwyS6jrWpAIRKU+XNUdlTvBT1SlypM5/YjWzt
	WbqbYhrZ40gMnputWP6vVSxkXSR57vBaxk2/AKZxE/ZGF5xhXIvl87/oqRw5FUdMIK6XNzyLwfd
	h/5GnBFJxP1sjKgitCSlqio1ivfLJGycg1da6KBBdqeu2wUu4je0O3BWhKbDmTqbuohlmRZ/g60
	9RXHXE3GSmMRdXWPXDyRZfmOTPJwfwKxNDJxDMs1J86Dz7BmvlQP7SUv9SLOFqHLjjX5h9anh08
	P75LsidYoarlAsTtUDdO1mt7dBuXJoR0Jn+gUSQTTg4rT3gmp9dSnBZ/q9WKSc1V80qAXn0eImI
	0xDs8ZqR7TWR4h4EGf8vYymRVNqTT5uivKgxRynqiKvKvU=
X-Received: by 2002:a17:906:c10b:b0:c41:8e01:bc5a with SMTP id a640c23a62f3a-c419b13c86bmr429087266b.3.1792365143478;
        Sun, 18 Oct 2026 16:12:23 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm300145766b.5.2026.10.18.16.12.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 16:12:23 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso150109066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:12:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuqvLpLAHEWFMH+SAuwcp2BfPG2dQ6N8euC6TtXXL881NptLOp9NVNzOr2O7y0lOTIfZ88xC70MTLrHnY=@vger.kernel.org
X-Received: by 2002:a17:907:9494:b0:c3f:7270:1093 with SMTP id
 a640c23a62f3a-c419f706c4cmr443663566b.26.1792365142168; Sun, 18 Oct 2026
 16:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com> <20261018152358-mutt-send-email-mst@kernel.org>
 <20261018204838.4080b238@pumpkin> <20261018175347-mutt-send-email-mst@kernel.org>
 <CAHk-=wjneFJ7XmZ6ux-LsHq4apDgANcKfERztmAG9sGVY_TxAg@mail.gmail.com>
In-Reply-To: <CAHk-=wjneFJ7XmZ6ux-LsHq4apDgANcKfERztmAG9sGVY_TxAg@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sun, 18 Oct 2026 13:12:05 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjZiwN8=PGEVm19QO2SiO29aA1E459+5mVQ0nmNoqOpjA@mail.gmail.com>
X-Gm-Features: AclHuK8ibgIQ7ZzCJT6T1XNCTCPJUVy2j1kAdMYMCDJTCT4gsOXcLC7aX43RNik
Message-ID: <CAHk-=wjZiwN8=PGEVm19QO2SiO29aA1E459+5mVQ0nmNoqOpjA@mail.gmail.com>
Subject: Re: [BUG] vhost/vringh: __get_user without access_ok leaks kernel
 memory via vDPA passthrough
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Laight <david.laight.linux@gmail.com>, Haoran Wang <haoranwangsec@gmail.com>, 
	jasowangio@gmail.com, KVM list <kvm@vger.kernel.org>, virtualization@lists.linux.dev, 
	Netdev <netdev@vger.kernel.org>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Security Officers <security@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 12:06, Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> That's a separate bug, and you really shouldn't use __get_user to work around it just because it doesn't check.
>
> You should use pagefault_disable() around the access. And if there is still a sleep_on() complaint, that should be fixed.

Ok, no longer driving around and checked: using pagefault_disable()
around the get_user() should indeed fix the warning, because
get_user() uses 'might_fault()', which doesn't complain if
pagefault_disabled() is set.

Admittedly the actual fault handler uses a different check: it uses
faulthandler_disabled(), which also checks for "in_atomic()", which is
why that __get_user() case just silently happened to work (badly).

But that check is historical - but actively wrong - the added
in_atomic() check in faulthandler_disabled() also checks for disabled
preemption, which is one of those "it's not reliable" things (because
the preemption count depends on whether preemption is enabled at
all!).

So no. There are exactly _zero_ valid reasons to use __get_user() and
friends. We really need to just get rid of that broken garbage. All it
does now is open up potential security holes and allow people to avoid
warnings for actively buggy code.

               Linus

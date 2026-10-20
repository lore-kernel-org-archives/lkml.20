Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514367;
	b=JNYhUfk33hFCZwo+81FlChoC0vXaKKnmkSMk5a+AIFU1Rj5ugHCEPpJTLfeqtlX36b0P
	 +PLzdpDXPFFylLqSJPwfsan8+Z4DOp87qEoQiZMPyM9glPDs+Gb4QBt1QXgjo/dIX2WKv
	 /EAdV8m3O/RPziedw7vzr8xShqtgDpOps8OSGzJJiWZ2FENCKcyvK1K68SgHxTyzqm26h
	 hCNv1htEEsQhHM9sJU5rlqmTR3m0KHbD5nleY84rooSW9aGpE9wOfbcY+oMskdegjtqSb
	 hnj7GGNfQfS1mvJQ0Ie1rDVP0e8zXx3ulJjlxJE2tD2mVHxlYFiCgLezlGj/wFb/img==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
	b=BDStnxHUHTz2Fdv+aqAqCbQiP0oIVrmWJ4hH7x9bWtJ/LqsC+In6EsiXsc/2EvTw7YFc
	 GTz7Mc8LuUZd0SaK1TH3r3NcZB1wRmYrEPdqLGsBvjfn0Tn8MJODRNgohqfLrX3iEgDuz
	 KBgBGJ+bklkCCneb6gbYd4G72lZOp7OFqrpxAUwBgQVvjefKFaGDqyEPt/pywe4SEeeK1
	 tcNz13B7IpTYff9+aB7VKJmw2PjkMBmTVALAlEZZY9SnBWECRsTKDYN/+sZXq5FAsKWah
	 XrNpeGjFnZprch6ZCuo4pwbv5lCFpho4n2gOlaCIqtPVUBvYgMbmbSgwIkwKBVDxTLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enkbmR5N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51681606D500
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51681606D500
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enkbmR5N
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3584f70a5aaso466420eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514366; cv=none;
        d=google.com; s=arc-20260327;
        b=gUOkuWVV/27RId6149wY+QXXTYhVUAPttoVcT19ZA+esjeOCVOeRChgt+3wLVzjUNU
         xYdhJ2qZraMbt1zmJqKRWqpVr4Q6Nn6b81A9vwOEihA2XUiH26H8KHq2kJmNT0HFMVU/
         swYOpniTlfARI0tzTEXWG4Ccm72qiMHYZ2IT/5pbY8Qnxc8eQQVfwhIIpjkUbRmzmCcz
         TCjAWnUgwc8i9Sz1VgWLt5eWVBZ/X6FJfXXfPNCTLXUrAc5olZMHnTKd0pJg9LiDnnHB
         9kYo/7TwE+AmAHrXQAM6n+NLcxGP6KzSIjExTLT+E6wPEABjZnicqm+2SRnkqion1Guw
         dq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        fh=o9u2EGfDrZtk2DvEIu08/kGQWozXivIkjkbBzyKtuak=;
        b=BND7t9RjjCLq3gysXVfgmnig2fiC0ZfZBN8dz0TvgPY0+m+MhxA3If4uJmyYCF/cmj
         KGk4VTeM2KeJnkOfI+UMS7EtijAjjG+16WlBgTjZco+y55TfiFYlrXDboKo7FmyyDNCs
         QcHdNhCabYL2AQqGit//pLaSUT24ymCjZGnJmavJ9ls+VZxfMC5JSZ3QydlrR305Y/Gm
         jMiKHfpsQ1fHQDOAhwirisuY5OzhFhQlS34i1rOzWoBbdWeYgqWC7GFdDBBFZy81wZ9X
         b0tg//Sf075C+0/pEnbWMyPTb9ljxdAkAvnTMCbj7BxcjV5B6OqqVjMEET9LpUqma0js
         7HPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514366; x=1793119166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        b=enkbmR5NTVbQ3UrlQC171YQTmcaAcweChXaMlD/dH3Kb0NdENuVXXvN6HdylZ9SxOc
         YZDdTFSVaIlTSe+WbxvtGwjaue5Oso8RDImcyW75nMxyHJv4wJLaVJYMckH1jXWy7M4V
         jjVwjSnIkX7ngKBx12o/x0jHhkNsYjaMeEqeYPTlLs2s7qN0vYhvrJk62IysjOGbMHXk
         BKM0oi7e3qstE3umQzjkF5wcADd87bZr9CfbK5CVLXuY0F6yh6vIT1l1N8rExH/j8BuO
         OrzSzEVnZbIAFyjMi9EAa+l25RIvlyXNJ7A3AT9Fn38GUnYn3ohZjgFIHOUUSKMmjmwS
         d0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514366; x=1793119166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        b=gkEu8RzaSLDfu2IzRXZxA6RQKj05cS6Im8H3qUP7Fr8pNs9xKfTWjHxvqWOYtdQH0a
         HL2NVbqMJRdxXuFk0c8pI0yxH9zG0XWK0ZPcXZfjZ5GrdRGTy7Fw40SVen06ZLpNFm2g
         /nWpDLjl8bkQHQHeCSNcS0hEOseOWmtDKIUhzMStN4TxZhJxHe2Ei3SKVCBPcXiLbquL
         QtGSDeOfkk1hFn/rY6NsCDuOPJ/SmaB/m+e3EpUsUJPnBm1IYKbkj4zTECviToKUDh/3
         HQ0qSxa3nh41BGKvqphs84uVepTKvUUAIQg0I39/vkASvYp9qaWE2j1HU9IfM5C8Za/g
         DR1w==
X-Forwarded-Encrypted: i=1; AKwUvBxfl3MSBLUz34weRKs0df+eMgstDIdTrq3p615Lofd00i5qLxLGUz1Q64YgfwUslaHzFr4RONAgn78ygto=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTvkwyiduontzIlv1YO+u6jVFF/iYn5/6qlzmSI29qw/Jku9Vt
	zH/bmK1S0C1tmnTxNCX3HVpciqMHtpvTBga1m19mnYs1r+GBAajGYCwYb1oR9ivkmLasLFqfxic
	9YmCO+IlugJHYA5LxshmNzncjvTDFeM0=
X-Gm-Gg: AYBFou1NE2OjPxgFaYg0xpba+jXNaNUlzmW84aXDyMsvO1Rwp8vSd/Zun8uUXDklgv+
	4EvYnpShh0biva7uvfmAWQT8EhZgoWtNNiBm98iquIry+gCPQDvc8zqapb/HEh/21G4t3idwniZ
	9Yn3MAPLq3unreeU5HJ97Lwf+cGU45KtlJi4K7xP3v/HPk5aolCDMwHrmin7F6bS4P42Yabbmks
	hRFEoqVrA5/06uQJ07H0eSmHmP3FEUOLQ9MUAseP4s6ymr7mLNLTg4TE1h+lkTSoKKroJVBrUfR
	pXp9ckB065L4h+TDWf9ZISZeVJpbQZ3Zv1qjJt8sGPgxp1Z8DGEkJjqNqcZ0Q34rSAgVPcPzTX3
	oE82w7gP/r5KZGEwVsyyREwB1feHH1CkgVQgoLlrKJ53Mc8HJZ0HMsRhV3Gp1p0M+zCgyqd42Qx
	8q3ZEV5IvpkG156C1Mdfjcn6hfTY0xODa0AQd7h8w08jBrI7XURVnnwrJwnsZkUJuuGlCw11Spr
	Lxd52IX4TOmsR/R64NyF0luwnMp7PblsGif
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3619b30919emr24534750eec.0.1792514366275; Tue, 20 Oct 2026
 09:39:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-rust_leds-v27-0-2c296d8a8e5b@posteo.de>
 <20261016-rust_leds-v27-4-2c296d8a8e5b@posteo.de> <20261019143818.GC2663669@google.com>
 <236149b4c90323f412d6385c034a78908013e2d7.camel@posteo.de>
 <20261019160407.GG2663669@google.com> <14fd9a916dd0792a74ca01ae073e714f95a9c780.camel@posteo.de>
In-Reply-To: <14fd9a916dd0792a74ca01ae073e714f95a9c780.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 18:39:13 +0200
X-Gm-Features: AclHuK8raElhkbPr-7bZyBZSZrGqtKLbWS10csaRXDChmKEDOAjNZ5GlvVMRpWY
Message-ID: <CANiq72mRvmHOM3wHseReRXUCgpWh2Qzbhto5LqG+eOQ_pUGLGA@mail.gmail.com>
Subject: Re: [PATCH v27 4/4] MAINTAINERS: rust: leds: Add rust abstraction entry
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Ira Weiny <iweiny@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:23=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> drivers/ includes rust drivers. (e.g. drivers/pwm/pwm_th1520.rs)
> rust/ is only for the rust abstractions (the layer between the C api
> and the rust drivers).

Yeah, and we will be moving soon even abstractions out of `rust/` too.

i.e. there is no difference between C and Rust in that regard;
subsystems already own their Rust code (unless they explicitly decided
not to).

Cheers,
Miguel

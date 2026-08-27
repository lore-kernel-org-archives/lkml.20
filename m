Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A183812C7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871653; cv=pass; b=b0T4jv2Rjwz7nugE0XUhdA5z9yKcnrDu4A+lNjywcxdd+bFxtql0/SeF95aeWjfb44RJd2oz9/PXzeekIC9I3/BSiPUgBCoOKoOkErgVZ0UDSLLkoxwsCY4aq6vEE1V4xNVm8ikLxi5FnVflDgpWmSAv/dssioi0Py5HNU+hzkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871653; c=relaxed/simple;
	bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikcAOvtS452fUi1Iyl9r0vT0K7Bp8w4nYULTCMcLut7lOYbwaSyXGIW1LPTGcGSb6hYE3FmAWVApRz9BBrQg2a9MCoVmD49/2JITqpkYY8YYdfZBRjKuoBkp0i5tznu3G6hS7epPcyp54WL859o1MfRzcnTNa7OdAUZVYdq+tOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9+covru; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9+covru"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5862bc921so908785ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787871650; cv=none;
        d=google.com; s=arc-20260327;
        b=s5DWRmdc5gEiYnyILTBJ2S0Mmjq7ZNlhd79+IFK2NnXWaVaYE253GcHBGXZ/MY7bC8
         nHvhN6XL/hBHma4nxGh1wwitlA0L4st0S1zlz7wG/xAdJB/Ajec3AOj3k5MmPzOpkM9e
         HjtjaADQ6EjocJB4TTi4zZx1H/5InH1YqYT9gQMSPlLoySb2bFi5hEtEIL/cgyWUDDoQ
         REWjGG41TsSSO0SeG5gwp4KqMXDArPjeN9CL6HBfD31fi8ao2uQhw4QyvUxRFb0izDe+
         9/E9/0AXei0PN7LM3cEymEX2JgL+PpdgN2i7W9Z42iQm5+9vkpybvMIt9w7nHGZpNaHP
         wdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
        fh=96TuQZBxuui4Lg4J+ifword0TcvfNuGA6RF1WWFvopo=;
        b=mRQbKvnpHnnB4JxFC/Ve8pO1W68158zNiSz+u6W58nXo9gPn0mpf4uuC8n0MchvtXL
         cl2ZvIVL2n5JK3sGb9aZEGEnzgOgvBu3E1XJStHz74s1vb0SMvyBi/5e9HXslDF9Iann
         L0owENLdCwA2NaUMO/WNY9nhy3iaesg+M3VX8GJjCkZ0YxzIBG3Z7tEEGZ9wCDJZJrme
         Yt4H4CP93NPVPHslquwRtAFEzegS5d4nQyZcrWefOYhYtJQ+84l92KLZ4S/EzBOSt8L3
         48dVm0ePL4Y3Dd0KeHBXHUwLStvkViBDbMReEzWRiWqUgJ8Wcf+1x05kl1fIGvgc8bFl
         7aNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787871650; x=1788476450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
        b=p9+covru2Hp5BxxPX+gS4B4kj8l3iQMWtHIkbuwbH++g0b4ZFXpIwAUUa06uTwE4Qe
         Ie/QHJVFJmxZNI+YrdT6rxNByYEAqaFDnzMtvmtLvIumADy9Uja0h1eCjX6/8APpCb/F
         v+pb/A/Kh//celSSa/C8KiuFfGDDWvoCJYzbMIiabWsZHjuO49l0uydKOyuJ8JDeFqSE
         SISdkJV/TWoRYIUVtm0Mz7LSC/TTuZETu/PceOtahPw5m+rQCDuO/8qrF925bpxEYOvs
         W3ZqyBT82TUFs5+Cnv55Nt2v3gtqfBcf5hG63gG8kAr0nfVYDDA2euCgXHBfQJSCWibK
         WjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787871650; x=1788476450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
        b=dJSww/W5v8XRe1ow8kp2bgGPvKbJum2wWRcDDo1iy1oru5Eu21VXM67h4gRSadE9fY
         Wp4gXLnEGUN7mc55CxtComGZwAcD8lff1xD3GmKFu+UZrDXla+0pXpGXi9xfH2PCro82
         0WyOln1hAULga74/aHiw9VTocBJt4/vDX1Yhny9wPl6w02TncBNw01A3U/G+/m+hiC7e
         s/jsrErjpxNSloie7Zdt53J/4mP+c6/NQeZKONrVL521Ly64z1V9yRnfCRZVYBsjq3ef
         hYCkRD22UHol4dgir7XQ6Cn8dycP8cRLT+rJOeE9NOEnhCH2EFoREYPz54ttBiUV+ysD
         jssw==
X-Forwarded-Encrypted: i=1; AHgh+RpfTRBNoCuFVoNcCVtSYnZLzj01LXapo5MnxvWZCzy4TPyVvImDWrNgHufyWDB/uVLcB4bya11xJ1dA7V4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSNq/IFftXjRxrAfssJ9FX1Z3lxWvX7Q5e7CVJZJ4XVn/OuEOI
	6MYnKuxnUv9Bv5R1OiNyfkiwKq1MCa3IRBCweKiPzeY3MQzMbr6uyd1nHPDveS5iTuiF6V4lCrf
	LGzfrg86biGG5dse/7ahYdXyG4eBKml4=
X-Gm-Gg: AR+sD10p4kY1SWBa8Ylv9Q2DZ5YRk4UBZZiDcdFILv3vEb/PwMchFxDbO8e96n5F0cC
	W1zzm2gSkai13L9cWQvwquVqnQNaehEYuxU++gcsOSvzm7xGUBDTGPsq085bfFYg/IVMZtTGHJS
	cb+1Zu5XcfKZ/nBGfIY1cjrEE2VSSw+SDvNIWh1ThCT1CQuNRJaeXtswq4EHTgzkUUE8jNw+Vbv
	iePLOqcpcTAJtvAKU8gR5hmtygusbQnAD+j9fYX8QDnOZoFcBpHNNBRSTHN1DPG3hZSFZpv+OrE
	nSnAIGmXYBel/1VvAWwjak7r+hHDZR0s+jF9PvJm2v6+gG0XRAFwmvJhWkXeLaqDkwi/CBT1ThX
	jEJ+140dRpVmVyDCf2uhlNzZM5dk7VGoUCGR7jgOFj9isLnT7CY+R4PO+CPpp
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr21203935ad.0.1787871649744; Thu, 27 Aug 2026
 16:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
 <20260827030352.GB2327@sol> <CANiq72k3COcjo1s1MXdh=K7qRcOMMSq7-3_JCMtNKN3J0zQmjg@mail.gmail.com>
 <20260827182907.GA2137493@google.com>
In-Reply-To: <20260827182907.GA2137493@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 01:00:35 +0200
X-Gm-Features: AcwNN1XMEcBfhQK81kPdbiieX1lImw4sydc4Mu3cJx6g3SD17OlDU5gWr95b-jw
Message-ID: <CANiq72n5swSHaTsDi3TYdneyCiePHF-gEAHuFk3ZWj4v0meR+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Mike Lothian <mike@fireburn.co.uk>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 8:29=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> Yes, it doesn't explain why they need to be inconsistent though.

It is simply because it is the end state that we want, i.e. both
Kconfig and source code to be in the usual folder (so less things to
move later), plus one normally wants the Kconfig options to show in
the right place in the menus.

> And if the code is "conceptually part of the subsystem", why is the
> MAINTAINERS entry for "CRYPTO LIBRARY" not being updated to include it?

I don't know, but it should be, indeed. That is what we have been
asking subsystems to do since the beginning (modulo exceptional
cases). Some take direct ownership, some request to have a maintainer
dedicated to that in the entry, some add a new sub-subsystem, etc.

I hope that clarifies.

Cheers,
Miguel

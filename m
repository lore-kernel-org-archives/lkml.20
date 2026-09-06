Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4173DAAA1
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788652906; cv=pass; b=BpAwiHNN00Wxda515DYsSpwbYnftWdxKQtw3tu1Wck+X8go0XyKZMtRvpOlM2n/vmTxaBskihFRIzpnMhU/vBG8aaYUH+i51qSmNyNVWfG2LFtVasUS89jpn4PvtWQ4TbfbkPpiqjSzeHzmjwXoVp8LS5jqmzgqcvd5qFDGSpq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788652906; c=relaxed/simple;
	bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy9xjIdvfu/BHv76brWMVnz4Y+cUOE7fkMSBJyA3VauTngRydVuXNkJ9iuq6l2llGd5KQ+oYwiZ0wP/M5jM8/jtzv5A3nvfDIoFGXeWwwVopw2jzawpmBM8+v7eJFUWaR6UFEzfaazlmjTG0co6Iovc9ZRbG5hzk+jyoWQnY2eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkjq4JTJ; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkjq4JTJ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so161342a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788652905; cv=none;
        d=google.com; s=arc-20260327;
        b=svK2zMXY3BtUkELH1gum0QO2dDdHtsAjAQGdpmnGdtqurpd8IYRCAy9o6iq45GF/Fm
         8QqpyudZ6c8CIbkxjFYmtlGVgT6Fa36LQhEU/1MD+5IFftPTax6NRDtVCJlr9tuXL5rJ
         ozdKbhm9HqE415ert84Kk4s0PYTxd3zn72SShPAjt0y1YjOalFiDkzWrRglu3ZqQS7H1
         21ttiWKhW664Q+xJvTweC3TSd6sPATTUaffbpEAZbk1GPaj5/puWf74rrg2lNlYHMewO
         jV3aSlH9dyxBUmnT9zIMUOnHLplVD2ELcXPfFxPrK7vZrSRxMP4+Oqytnh93GeJicaLQ
         qMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        fh=sjaDnFDzXBXCCoHCsf45hQIJiNC4j9bR8tuynOM9FN4=;
        b=HVdCCRkL0CWyt+lt25GSznjluicp/tW+RcTu4xCslrLTaAwKOO0M5A13OJheMTK774
         U2ltdRqj+8cBzumASB42OucSuE20FeaAyUe97d7YprjCNKcnf9k3JO89lbert0q8eGVS
         l7VPHSptnWpdebQwNnAkGrkC8b7jfJn6XRdLU2AMtxdr6b+Sk2S5Va/D83xzveZxY1/h
         C8c8zMFd2rAWal0RQDXUif8hAMtB2CBj4FNXGqQnO5jzB69jqMPzJAETTX7qX/iJIBqc
         7GvlM8zcT6rVPdVw0WJlHoAfAUn6CKeTssqT655zHPAvq/uHEC6igXRjZaXHk9PetWm3
         Lo6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788652905; x=1789257705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=hkjq4JTJzJAOAZAsXUoq5q+t3Y0YHoBxoIkYTvPIK4lT4hr96nQWwblIpzv0o2AdkI
         UfP0xYVN7AESqSiUjijmLOl1vUz6qJfTnFo3IUj1elwte8e75o5/vQ8w1lC2rqiP2elc
         KzVP5UGFJmzlUTsqjunpYjYo4SnSLRy6YrEQge2Xrual2AK4++RiEBjyfkg723JNkkwk
         HRDN/BI4x0B/kx+4Rl7g4yWcdwJfHsvVTR9a7UhPh6X1oVTI/LzA3VM12OkjJ+PbuQ4p
         dZYNio2e1+we7ED7pXAcON1Ce7A9rLqxGPWqzYJGtqtf0VdTIaNNLw3yhqXgHsc0IAf7
         40Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788652905; x=1789257705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=fFUDlMeU+aTYXhBIgXlm3rBjrP6wZS4xKusFnoq/1hZTjBBnBmjDcLWVK1SYoDVtwv
         i1cEyQ4K+QrVGfkkVtvmS3IRemxE4UfiCc9XGr2cqUmMw//St6SgxpIEr58Kf60PvGl2
         7r6LvLfU4AJPIwCLzTDnQgprKFOd24GjEW/u/kxg4qrTbnmn7Rm/otOoXHCnDyvs+DhD
         QMLyRrgUfqb0wyBJZIh9QpRRatvQqbYUj+D7OXI42xknFcu6vc9jK2MQAiu7S8xBHc4v
         hOHyYOa8JecnTAaCMQUpaITbXZV6raXOS9rL0Dm3o4I2CVe97yb2IGuOEg4tzNoDjj7w
         WqQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYQqSG4MqgFVVFhMnUaJLlCFC8QXR0+baNinZ2ffLFygvKvqloj+YifKIH6Cp/SXExkHvody/JJB7/8qE=@vger.kernel.org
X-Gm-Message-State: AFuF++nFFNOBnlOOiqlLr4rsl6aR929qN18UAsl9xQeD0weoPCR2ER4h
	R1Y+l+GlM9dv9zoUyip3GqWdPW9npvnIM3ex3y4UsGhzC9121oMf0jsj8fN2zDZh81Ver37QVjp
	pvw+PmGjg9hiEyyjmhPHLlf/wyu2bBdI=
X-Gm-Gg: AYBFou3IyCTgrVZTGexldQf8II3ClPmHGbGkSeEKowZJjWsm8gfGBA03dXqO3r1kqsp
	3qutOkTgVItxTXd/FLmN+Z3ObPs5sRS+An+9TV7YwvtDT2B0iVgCi6coFLsqr0srjIM1loa47P4
	oWg0kNHe+SBwBMEgLtKr5+mmJfbER3gB1XTcu4R0oVBHBaDP/FV27oV5mebXHo4onmQLgJpzSTO
	Q419nG2Um5hwuWq7a8Cnf+J3aTS8xKGgfxKfl/xyNMBLjhI4V8ijjeHeVk1OlJ++MyIvOrg+6mF
	abB43UBRFmtIPr4ybH2kzXE7RrOOcmKs9UtMP9RFOOCb44NA5WA70bIn9njqNH4MCxjfoWFkIWm
	OAY3Uea9V9vHXuoclDE0fTQpCj9jq/0lMD/nnRfwNQz4UJtcFPz6wpP1Qy8Nv
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr7786501a91.6.1788652904655; Sat, 05 Sep 2026
 17:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260901-typed_register-v4-3-5552b1d59525@garyguo.net> <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
 <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
In-Reply-To: <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 02:01:31 +0200
X-Gm-Features: AcwNN1XKuKFBV9qEAm_z4sB5Fo2qHcAE7av8dqRfbpy9oR-6X3rQ---1a2fINJY
Message-ID: <CANiq72n2B=7TXtmtQXEC-VZQNZ6NQTkPsxnnNCiWWYb=U4TyZQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:32=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure why we'd want a self link.

It is to follow the guideline about using intra-doc links on things
that can be, which prevents mistakes and improves consistency, and in
this case, for huge traits, it may help readers of the trait
implementations section a bit.

Cheers,
Miguel

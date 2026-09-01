Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0923D4112
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275750; cv=pass; b=X/bE9E8LEr99obxwUq6H1h10R8UaRXdRhW+t6RJHIFuQeex/rJTsZaTu++KDWVy3xEjsA2ITOHi39pIvIhIkWZbKm08sdNT1/t5pfSoR50ncIwDx8HA36Cv98UQhESzBLINm8nvkwnQUoKFbnYI+BbLy0OTXWFoQq0usaBhaNwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275750; c=relaxed/simple;
	bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIKgUw7kHYIirfDqdkUjVC2naSZDUU4gZnvCmG8pcZK8HLpLQaQZ4hl2X3rBncPhZfvvucTmdYybUXyDjwokdt58cjRO763UPsN+dogP2KdUo3eEaBynwfkHJ0gfpaEV1NytfzrAO5cHTmPUfUGV3GUDIyMhEWZELqEfvHMUsSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeqLRLqL; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeqLRLqL"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1be707282so73587eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788275748; cv=none;
        d=google.com; s=arc-20260327;
        b=qeJBPdO+6oEX3G9NA4VKX5co4GqTIRxyLbUMhQ7JOiaW+uoizUVnSovPLs6u6b9wrX
         QLwBhBJSIsHrXMOwn/9X02pMzH1oNgc4ywNfmpLllWo53wkIlG9f3zTPbGkvY+bZAJLM
         SGT0j9zTUv8YUfflgCj7paSvyIxAFXl/7Uprv7cigzu7clM6meDVpUZwkBiHecOWxdSE
         Qc8FuhtSlLbfHhSK7l5TNFaZPeqH2IK6MZZIaWzDRFS4qsma3lx2auMxJa7yKBIxFq4F
         9jT0UQ1nGGPqETtnyycszt0LsEivHdYFgXR6F490865iZWVfvPsOT0+dKPwS0teRSY+1
         oq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
        fh=DfpozoFW5M0wdiyE8frEa2s1WI62q4HgNwD+JQZtO9c=;
        b=sAB+QYY71gnbDbAA7MFCDyEGSzHLFEJIoHCsczceCJCe8HNoF+QSeThkGlgheRzHXl
         4QbRnypW63jATgGHqQxV5QaWOBVgtsqkqrXromZsTvvOdY64Xap4du2C9ftRjE1hU5ef
         sHKqjxk8dUTgSYD/2mU1LSY3X6cDHesVU/uemaXXD6kTlGurOjlQ8P3zSsYtmPDFXX3c
         J41aAEMjmKRLq9Zu/uXeeQKWhpKeg80+0AmZGoudL72DBzjGZ0Q6wyfG8UTP/mn/oKG3
         gUklh7aaSXYg0GFMGsPuytqP69jU0Rdh+ChvufuIQjLrrwiT6igFRexNn7eC/5cgqR31
         7ErQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275748; x=1788880548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
        b=OeqLRLqL2m3aPFmIV9yysbgK7q7jLF9Dqw0Jb7OaIBbJJBchM4MZDZxBJvPGUbrk7c
         q65IXzrLjSLH7Atrgmv/RN1Hnd/DYK2/YJZvsqMOjASbmm/ItoIW9aga2XvdxWBwaBzP
         P/64FitcWRmxCcOzIuwb/7ZsnjkSlW3pD+aTY+Qaz38rrdJjjXyJxUscRYT/aFxaZsXJ
         cT4SA12pxTbAlZwhkj1r1SX3cOEOqe4R1gVHLYKAHErkaYwaKOUpvDJko3A6XIPX59l6
         0hU1+wxQeVRmNMwWdFjSJeYMHY3IK83jjaLmqt+nzXxOGKpxRmMN8BsktAGO8GchmPDE
         VcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275748; x=1788880548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuYPxegkskPf+GiccQRsxv+rP/qZ+uaMTftGIae5Hzs=;
        b=ikjqi0uOorqdnwpXNwX37Jdeg8R810Cv1xxb47dilLPXA/6NtU787yAigjC/0TQmzX
         sq0UEI7nvVogMHUFeqXDImTK9KvCj2sBS8BFgqbp4kkXobSVkFyVMLo26bDKmOgJSXxQ
         O87/IzaYkcmFfgNzUQ0A3gRqbCSwWtep1yKsnyyk+QggyJtmdSXOWegfaP1As3vsmfrU
         CSzivBfMzyy61ik+i/OPDf330E68aRKRk4uvuQDStfwX2LnDikrDMMx0DTFiAhORh02s
         mYz3D1oYpCV4uxiRFAxr7yG9FICaRsnHT6vzCK8apoHy0DMKACA+v2oeu1TBsRC+vXCL
         Twgg==
X-Forwarded-Encrypted: i=1; AHgh+RpQfuy4Eu1K5DqLq/G4fZrbl4qk1iwsfIn9Plwq84hpXI3GRDsWy5DMYY/FmPRE+NGB2Mx4VWOoaxp0bTA=@vger.kernel.org
X-Gm-Message-State: AFuF++me2cDyJUdQkeMC7soU5Nc1c3YSkYY6yBdPvpKhIAOQNy8VXqou
	DXHiFRcNvWbgpSYln+FjQDKqTQHhqm8/RP5WR/lY6BIe0Xb1d2To4ghv55PM33ynxkosLMp+Hd3
	VYA9F2H7lrDAkkQreruz2ZYYpnPAg+10=
X-Gm-Gg: AR+sD11E0DBR/qMS5/yrg7bGbT2Rgdw1rMq7JlltdFwueW2YGua1IiZr1ypfhdM4pIM
	F6QOSMysCUDQ5Q/f9Pk9CTKXD/4rg4iFRx7tSBBRge8jWr0pPS9MYLJrMbAPkby+pyC8nHoalG0
	xReur2y/8xKjWE5/q91kcXIfFoco6kJaRtBKVNOto/bNSeoTgepOS7Rss2OAODPsZkFNQKNinw4
	hsnHtOUUC7SnnvFnkBrmNOGII9aYGTxIVfkyXgz8qvyPrQh2tNBwcnmhHDHJwft5TsySRsPx3Sx
	/hVVdl9qIMuo/NlN2Ix5sYbdYL6tMXiqsgU+w2PjcdKOtyoqxNd6I+omvlR0IexTJX7GMxqDwLG
	95U147/uX2XPV01lCMi+cG9Wqjxc1JCbVw+mfIk5mBUJPWVKmLC79Ix+65R/g
X-Received: by 2002:a05:6820:a094:b0:6a3:d9c7:376e with SMTP id
 006d021491bc7-6b1c625227bmr13192942eaf.0.1788275747912; Tue, 01 Sep 2026
 08:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828133543.2259029-1-georgeandrout13@gmail.com>
 <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com> <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
 <CAESH5ocNhHk-vNSH+kODfxuUpo26AO_uPao-8qR3bk=Kw-c3sw@mail.gmail.com>
In-Reply-To: <CAESH5ocNhHk-vNSH+kODfxuUpo26AO_uPao-8qR3bk=Kw-c3sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 17:15:34 +0200
X-Gm-Features: AcwNN1UvpZ78AwCbPQhdzJX1I6Ers-qx8RXoCcu5SYg32Ous5g6lZNPBbVoK9SY
Message-ID: <CANiq72mgZg-QBy4gwzHmD4gJm4wScktfpdDtyZt3Zijk83h2CA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: George Androutsopoulos <georgeandrout13@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:09=E2=80=AFPM George Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> These are public `kernel` crate functions intended for driver authors,
> and nothing in their documentation indicated they could panic.

I tend to agree, especially since we have treated even documentation
typos (and especially so if they are public items, i.e. rendered in
the actual docs) as fixes before (not typos on mere comments, of
course).

But it is also reasonable to say they aren't, since they don't affect
the end user (directly, at least).

Either way, it sounds OK :) Bitmap will decide when they pick it up
(unless they want me to take it -- I will be sending a rust-fixes PR
anyway, so I could).

Thanks!

Cheers,
Miguel

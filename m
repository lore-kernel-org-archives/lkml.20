Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763F1F4634
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659597; cv=pass; b=uQR7Xx656BCnQwTW4RRW6/gzgYtfbko4fXFceGVXeKcV7bbzacvVmx1FeaDFmCY0th2f+RtDoSzCYfjILdtQRya5Sr1KdmlZok+zEoFtrOeqAjjBSjwpBj24m3+2ghT554BnajTF//hLgY5VgO8Z7pastCeSGSiqk7DjK7KmeP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659597; c=relaxed/simple;
	bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlozNz3gQ2m5PN8M2uCKYIWahbDAeBBUyXwuNYS2zrIvgfTejsXHpNwOODBsjlZFP1ijEXPwMUzov6NVGpHrVkkoz7kbkPmZQehHz4qek7VHdYx0mE4sJf2eAwAQu9ZsCAmD5GyHMOMnF9RKiz7FvKGlv/Drcvyet6gMdCYgWto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBX6pOw5; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBX6pOw5"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b1a806664so201935a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788659595; cv=none;
        d=google.com; s=arc-20260327;
        b=AP+U7WAge0Q+eyejqK8CAqhzj6p8PuSNrLAD/+m7hr2y85WPcr8v46urhmi+2CNBM/
         35/fxP75/KShhTQ8l5r+WS0nxLO4JjcuqDv3P+yZioXLHgtfwgNOtj4ROXfdbc8XMYnH
         xd0K5AxhRVEQhtxcqk4NyqtW3XqmZZrNxYzg8KyH9vibHwaj2ET8NjWws/c18QYTCJqu
         5tfOZKuE+pgt+XaMB1DlQCsEoIdGPkqWQaHJvT9nuV+5mxn7fzSPEmh0oBA0sHfhMRgm
         XIaTqbY5G/D4CL5WvD6RWtro0VFAW0ip7QGrXTybJI99oH2dVSwGubqEWA809twftFaa
         +Qgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
        fh=Scf4H9NUGuLGa6+tngt0D6lYdlS/iUtfVM3I81BodjA=;
        b=ma8hCcisNShfhJYmwrQSrmKwAuBGPTb4XpQ0hE7//1DP0teLR+ODyNBIQ0iXACnrpj
         8fh4tgPamZljiIH6I4NsgdfihNM69FfU1hDqnk4AJQKWO7ZGKqEHki7bxySGmPmKWrmC
         sojLv27nUFBVN3bI3GjcmebvqxtIv9MXpyjG67Tl3XKgqr9TdRCEjUlyvaUwZQOELEsA
         Db7VyIDcUyz/12bs6RVc4eEpJ59pxYj4Q6yb3k+qTLmN39Cc+0SQbPF7+mJAeyxLMtQR
         91zDqr67TR1OIU2J1mEbnJ62iEapcUa0N41uLpkT+DHTT+qopFAcOEMOPO4OIxAdHGu3
         4S/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788659595; x=1789264395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
        b=XBX6pOw5nJcXyUo/ic4MJPrZMZgP/AkgdLY0GBolvVUXBQNFrhcaRBhOJjUAl88EGQ
         RjWCaiuQXazsq0c8Wc9QIenVnOgk8ub/8LgvJoE0hVCxdR/wx2J3P0fjjGmLg/E+TObR
         jcXPLesBuMbhu4l0+5kXAuUpu4w3mdT1nEfK3r9n+9cjJ8p8SCA2ScUJ/Acf8Ac5MR4d
         4RTT9iyaGRO1XijFVxQRhh2kThVzMsBfmWc64eEZpFnNDtv/6sNGg6xnt8kO7W9llLc3
         uIxto6wIFa2SuNB80oZHWsJcUSNuDmGh24+tg7YBfAK9yJ369sveccVDyunEpJtE5J/A
         aaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788659595; x=1789264395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
        b=JEYAulfaky5ErO6wh9X2+lDOkkFItKpZkxHMqDdu1iPYkvTvpHyouUkv+MmIXViVUH
         vNxRQlH0KpODNympyTSkcuDtM/GuP5mDTOVqtOikdXYhNuC1dmQUBfeDv5lseGtLB9Gh
         fKeahSSCsr9OoMNZE8NIFhsHZ06Z+bofhFIwg7Cit33ZbfWczCDkffP+PcsdCDGzVYOR
         Z/5BKX4TksgrCcPh9puiYFY//Ix+KgWcpk8r6zEZvGoX0Q8mUtMsPxUGwu7vfoHwgLcN
         965a3Nx9Ame6iYZQVwNw1INgFgw6+xVk9EnDz0rbDOwmAxRizJLQvbiKLGeL8l78+KlG
         J97Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTyjWekuZU28/g/kZoT8IEKagfFyoXGpXghEg+rQ4HrOCeAvPQCwV4HtyUVahW03dCqttcQwQzvJ2MYdk=@vger.kernel.org
X-Gm-Message-State: AFuF++keMKgmPMQAUaZlnxc4Rvit9Qw0bhtFAUMY0UC3+j5fBLDXwD93
	Y85+ZQVbZL/iexlMfVTiGeMuUV9xLGeUESx7w3rw2P5eT6TXHnOPe32iufSoxh6uJKTxbxT2b8w
	XafnzEMY6XDkAjVSPcFSD5xTPQpQot1IDCotb
X-Gm-Gg: AYBFou1sbVGVDbsjhJBVq4tPtn0OZ6VHIKlrnoGfDcj1pjj8MddHobVH7oFRUPqzvx0
	SgQsx9fRV8NshamG8gRrZNazDstVCRcYSNBmtRMrzF119Y5FjJC9hDNuwRVI1iRWSQZKKjXPQav
	u4c493IUSc3V7Y6Lvrs0igJKhykANU3W53cOWkgOdBY/nozwjvT6V6rTSS7fY8vFCPYD7Mt3yhs
	3wDGHwbF3so5L6UaIw28AkLBBw+N7CgPGFch4vMLo9TLawB9dQRgAFPYNs/mfBtUxFSmgCCSzwU
	R86z1yfDbxANbQLmYa+iyJmDd0U4vdoR8Ce68Fkpek3GToVkEqqeTgvHEdiU5bM6HDbCMs1Ii6y
	RT6JyjrUELhbiPVPGvSPwXNyr6oE4DRTRiC71qWVJfj74vlUOSs4WbCRqmNXxdw==
X-Received: by 2002:a17:90b:574e:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-39b3d5dd778mr7610897a91.2.1788659595145; Sat, 05 Sep 2026
 18:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-feature-rust-num-seal-integer-v2-1-f1311ffbe6e7@younes.io>
In-Reply-To: <20260905-feature-rust-num-seal-integer-v2-1-f1311ffbe6e7@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 03:53:02 +0200
X-Gm-Features: AcwNN1WEW51nBsJ3su_t8_hcLXLC7IQBuC52TmPA-qkeVxaLPbqIIJjxPe3cDsU
Message-ID: <CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FCkWB3Ayyg-qWw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: num: seal Integer
To: git@younes.io
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 5:17=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> Bounded relies on Integer implementations to describe primitive integer
> semantics correctly. In particular, it uses Integer::BITS and Signedness
> to justify unchecked operations.
>
> Integer is currently safe and externally implementable, so an
> implementation can violate those assumptions and make safe Bounded
> operations reach undefined behavior.
>
> For example, an Integer implementation for a u8 wrapper can report
> BITS =3D 16. Safe code can then cast a Bounded<u16, 9> containing 256
> to that wrapper. Its TryFrom<u16> implementation returns Err, and
> Bounded::cast() calls unwrap_unchecked() on it, causing undefined
> behavior.
>
> Seal Integer so only the primitive implementations provided by the
> kernel crate can satisfy it.
>
> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mOfR33s4y+Ueivd5NrC=
5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Younes Akhouayri <git@younes.io>

Applied to `rust-fixes` -- thanks everyone!

It would be nice to explain somewhere in the code why the trait is
sealed, especially if we rely on it for safety, but that can be
improved later.

Cheers,
Miguel

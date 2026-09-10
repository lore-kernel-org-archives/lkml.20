Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA5D4A64F2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056885; cv=pass; b=Qp1A7Qlu0NqnIkdxSaSS+RzZfLLrUefupEw+bbxfLjo2DL7U670eQLx4aH9NI9c6ed0Ho87MeHJjUyOzf8vWgieN7LepCuUMu7NKqykGeB3FndIPQoHnEnLFId/JJombPC88bsIvw2uCEp5nG1AER1CX8qa83luc4WGQvjL0Quo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056885; c=relaxed/simple;
	bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJBj+uGh2ksrfacKld1jUclqceci+Vozkz1HCAYFt8BlKL2k0KZGCtBsKpqLqcO6XAHobLI5EsmNynAYbHPjtx8yxhTSE9tuWGFfy8tM7LbBl7SDgBxvTQsZvH+wMQ1I5vZdxjR3Vgu4Naj7qH4mn3Yxtr+C+g9wcNff6M/2GuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3gozuAj; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3gozuAj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db479a55b6so5312325ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056883; cv=none;
        d=google.com; s=arc-20260327;
        b=NTSBRz8H9GpOHVw2C4+13AlfSU5UIfg2zjDibxWWIk8+sIG0aL3Uw+YyllB9Zhx57e
         yosWyou0jErnik4b+vRvGITXWUNaOudCXXPP/EuZIczmuR8BIV7jP+Nh4ir1eQ26lWMi
         ErQn9xpHW46w8HtVy6VVwNSTLc5EQXyAM2OpGNOH7xUhfAIbuajcHXUC3eTjaBafU+lN
         Em2BMDg/Po1wntxW8YBhrneSgguCMVPze4mh6n4lco6BnU32K2Wy/GhXFXOcZCjp+pHe
         v6Z5OU+/ZMxhQ1H050ydUKcrsYMHueq/1Djw8WXxv/OuDPLifbFc8oRv8tsmflXsG/jg
         2T9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
        fh=AvR/ss7cP0gRVXj7haK5IPJqO1gQTMcgy5QSD8zLyrs=;
        b=LDBRfTzN8I1HOST6nJC47U58bBytddqcxfEdHA+KdkkdBN4eFT4WheU2uvDgPUGfq0
         b+10aPt+JrSKp7ij151rahtXwj9vPjqZYFEQM7z/YX6yxDM/zXKxT2elmk2v0a/lsIVA
         0DV30qy9BNl4G3buTvdJz6VVV+Xazs82cyiHkAEaeT+rX7YGlt2tBkQXuuZgTFTotWeO
         mgVYCmqaFGxN2ZuFeL0N++nY+bAIUfwQZDFhm8LKs051uy+GXIWNAB42iGgxebEGV7Wa
         bD5TbQaPI+LymQmIloiFOePcYKP6T1I5pvxfKFeOtbbvTnStK4/uJ9De9C1aNnndiygm
         mU1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056883; x=1789661683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
        b=F3gozuAjfDDbMeZ/dLSy2CXjr+RjB/+c95R3VRdJY9j2ECNnpTLl8Ln0/Lsa3i+JEX
         o20WRjxX1ZltoNB1JmAgHuVAuaIjPxEo8VOgWNy+leeH0FUSFgibVbT8AJcrIvgJmDXH
         qmLqVy58lsjL2JVFPjtlCMeURg8mL7ZasrPHhYHjYSl5xLCBAAvVQbUhcOEvxE4tRyUM
         lNA2SXaxmN8czo1K9iLlb76i49BLzFUi96zKi9dyF5/u4ziPQ6ZcJAU9Aqf1JAzkUZaN
         h1BcG2aQKgJAXkHLkhpDLlDglKIkTVEA3TraZg/u+YYW3RWb5kHwwLnYTb42JnRZx528
         TIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056883; x=1789661683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
        b=grABsFJyDXMzPlFHhDGEzHWt3tdHqOgsvceYrnmmoLS8Oc2i2rc4rxtQaYGq5Mhpfx
         fxMDY+hgpISCTexkTyO+dntUl5MWz41iMcwMtEy1/s+zUP5FJ8S38pYNiIHIwx9DhlN0
         r/YqJlxXJbSwqwmXUnPVpzbKYOMQjcLPzSCYgUAwUnTx6rr60prxx6uNlgIGIToGqFdt
         oOiciejP3oCe3dj1v0v4yJT46ohcmfs8TiNuY4BDx6V+RTGISWu/DkvnDMKHObQ+vkhh
         rdjOvPsP5UrZXM31ZGnAe9MmYARR/1eT2KMDM7SSMMtrjXhL6sQgiIyXO4fGTX+bcFBJ
         oq2g==
X-Forwarded-Encrypted: i=1; AKwUvByaASKAndZfWlLmk/xbM/aCSGNsJ1xYnlvI7qqBUItQ427P81EfKHSW6vG/GmAGLuP5WyHxQMcfiHa5srQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kGB2F1yZVc5RKYZPd5WVVbK1NXXz8zxLrDuU8EiFkHNGzdYcJL
	KjrcGvNHv61xGQkLkmcP/qcdWLTtX3kCwjLUpiISsxbniuKPfV759z0tfiSN9NUEreIhzbRb71N
	EzOq+Rzj8P77ZVBy9hcKXOBYuezCmhrU=
X-Gm-Gg: AYBFou2jR758G1k9hfRZIFjA7rtxn1hbQM1lyXlMJTxmgEVNFAiJAWjJG1Ra4OwBR8O
	xwIAg4b8jlOnuFriCf7OH43lhMzKLRfCbPM9NqWRBd0YSGYkTK1sSSCJy+6Qnrj5FV5t1mwZShz
	awR9uLiXDnaRX6wxuZkjXb4BNIThPqSYwNLJiqUrg0cFCnnNrTjlG5GQQPCoDZ0XzumVgcVDt1p
	a9U41og7vL8esCRdpssxZg1mP/eNaTmBZHUPuGB7+FZvJoO6d3I7pnKHEAXff4ql3oJmoFmF0xO
	1GQRmvYOBhJv6BYyF1uF9QHvJZzA6M97A61jg6s44J9eaPT7sPsiDitO6rvJw5ZWxDiCdpMCTY5
	X7Y2yqyLT5tm1/F3GSapuk1lb4ujnlT/r+pqfVrfeMBg2jsuSKYG5A4Iago5/lszUquEbljpDG5
	aUw9W8njHcICb+v/IdLv0QDpzxg0ETMtVOLREA7aNJjgVIKgi2P8w=
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr37403886a91.6.1789056883468; Thu, 10 Sep 2026
 09:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
 <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
 <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com> <CAHC9VhRjjJpv95AgF6cnOdh4g3gC4zViRoiHVehMLx-Fv9b1vw@mail.gmail.com>
In-Reply-To: <CAHC9VhRjjJpv95AgF6cnOdh4g3gC4zViRoiHVehMLx-Fv9b1vw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Sep 2026 18:13:00 +0200
X-Gm-Features: AcwNN1VxW1A9qw4fmjGeQ9XUhu8Og04GW9DSoVdDsQNP46Gy5I2b0ZJEDU2k5-s
Message-ID: <CANiq72mY_Sjg=WnfEEhSx9XZiqwDgqZqSqHa9Tsc4-qR-X8UEQ@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Paul Moore <paul@paul-moore.com>
Cc: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 4:20=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> I'm not sure we have a "usually" yet with the Rust LSM glue code, but
> I'm happy to take this patch :)
>
> Since you've already reviewed it, can I add your Reviewed-by tag?

Sure!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

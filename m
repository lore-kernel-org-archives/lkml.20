Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65863E16B9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341499; cv=pass; b=H6za0jZKrzgd5mLy6qyB/01JjpH6zi59fS6nnrTuAWiJkB6bGqylAXEd/KvsOya2pEYKNKNxtMaqmdvGbFqTpLmyZs/dYYEQVs4hlW1JKRpt9GsoFHszOCecAeqdPOAgBxS6GbIh3DnNfuR7/NDc60tsFhBCpU5TkWXZAauY1Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341499; c=relaxed/simple;
	bh=0UpPY2txaMJkrBSnDz/4PPngnBkfOnuBUPOCszgwXXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYXdAJvOxCzrOYLMsWcS5aSf1Nkv/oXjG07WT1pE0hrsOQmyXxKphalwcChc+d6qBfTK4W1P2+2b2NwLPvDima+hKF+liQEHUGpntGMBTv1UdrL9yMAC8zCy1oE9ZNp8NT1KvpRtVRP7gOkfuEyiNzkiwZUsbeq5Xp2hbl1PDlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkaaHsLt; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkaaHsLt"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c10faf6easo137708eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792341493; cv=none;
        d=google.com; s=arc-20260327;
        b=Eu86DSywJDslcadFZLf43QOjF7bO5WPtWYrsi/MKIx9uE+gXjO1FKa8j2Kvzbi4Il8
         vLpOI/9p5+ScYlrr1fZsZF8ymRMFCysNZx8VYbiF2q9I6INXRydKkHMljx7Q2iDPKGLO
         0Hr0rAJujs5u+VxsbmF4IXqwOorlLIYPMQHoVQkYrTPtmPT+TLH/Wtvn4Hac24leH0Gy
         bqZYndeKS34anCXjaaFDJQuB81cvuzlr3OJOKVjTP2GpzaFZBQqlBsfAgMBvWfzk2rZp
         vldxuTrKfR1iHLcQvzrbV4E0qDm3/MryhZiU8EkKPxqwv8g8mHjgGpYy3ZaOhaSn+tud
         oAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dl0vrGfBJKdVsQEvxtbhW2bHMSJ+Rhsx6tTEIjZJwj4=;
        fh=BvxYKlBA2buei00sqnNwTDcs3P9WQezGrCOnf1gXeeo=;
        b=dHTOtdM5O7QYO/OJfqpl1OqVjRwbXUoKAwDwAo2dsP+aiAcu0qRnUvrfmW3VOwKeTK
         oS8/UGoY1XYpjyiCZmviEDZmMhk1OXmQmV0PFpzN1vrnU3JrgsCQVkKaVWBCPGinPZYj
         4NgXn2M8EYFW4xjvEsoiM9T3V6GTqEOn9suwjAC+7ZhMRBGpacQkgN6ux3tIqeCpK1T3
         EmgZq2djUaRsjP8H/hdA40TdsLl87xdqvfgTF3QHfxkIp/sY5YI9UeCiL9q/ZzFBeR4z
         t3EWGMV8kdQdxXT7YP+GjWsOtHc7EiWM7whgG4yGsVDKrGTXRg12nVlBs8Wnu8TA8pst
         d5xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341493; x=1792946293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dl0vrGfBJKdVsQEvxtbhW2bHMSJ+Rhsx6tTEIjZJwj4=;
        b=GkaaHsLtsMvjARfgDj/s9oskEptk6m23b1ZEOu+30+7863UiWdeZ0oixojp69NWmJz
         XQmaJS4nmU9JrpeeckD+uILWTtHf0jYzvk2hXb65TjhQk72ZbE0Ly6zymCc29OfwYi+O
         OzgfKXt58uQvJG/+R2Tbayaxopj2Qq65Th2mjxXxBnFpJ/jBAUiJAZ4aOHDRtrYvvehe
         GMMuHw/yCi31FdeFOQgYSW8NXCdYZVURIIy0H2C/OT5XjEmhaFFFglJl6unkjKwVqO/G
         QN8KWlMfYwcxSdv8gciEwyaLoQnQdY9DZTyXQ2DOmz19qNMUyOxGgudm5BjNccDzCdVo
         QhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341493; x=1792946293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dl0vrGfBJKdVsQEvxtbhW2bHMSJ+Rhsx6tTEIjZJwj4=;
        b=dH62wdUEXsJp47pjSi2XrnPj9dgJcrJNOgY7vZT0EGX+mzgTIu6XvjhmgiCPwYGKPQ
         9DEvz+yLaurJ82A0mG1lvc2eCfWAoypexhVyA9Ho+EH5dYKxj3osN0zvvDpn8ZrlPqMr
         dzM6ugNn/AyvuF+iiScw+CxtvWc+ZymNsA9ezlGgTiNKKj2iysPS6FgRGQsSAzeL83O3
         y3b4dhsA5EgT5ErRgYguhN9qQD8sRbgp5PqEbe3p9CS4auRMyCThIE6kmz3invBP5Ywp
         wSz8BHUrYcx5vRKqBcJBTUaA4X429bosaFML0UvXiyhyO9OmE5LXcTdpUOWloQgwE43f
         +d6w==
X-Forwarded-Encrypted: i=1; AKwUvBw6b9fLtXTptbMQa/AilLZZ5sNjNl6Lcca2UTnlb9hi5NAUz62f96VnUyHCNjkkvIbSJZZDyF5aAOmguBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLES925xYoz5IYLo2SvkKzjpRg6xrYKHotMt2zOZ44aEKyMn/TB
	gP2WPfPRqp5eb0lOI8+k7GopvEd0IfTv/SLNRsYLGqBVC+sXMcsV1fYDANeoVWiG9Sm50mnvO3B
	PlAkQwCge4yV49gA8goOa7udCZFmpU6g=
X-Gm-Gg: AYBFou1EEGZci61jlsHFeS20xbQ5CoicH7/2+TVZRE3Y7gNH4zdELAZ264l3A7m6ANA
	/J7628O86xd448DJ4rxoMgZx0QhC7m2exIHVtxRqYs/6Eb1XSHgdL/Wu+QNUa79k2RrpEfE1hKo
	dxaktTdT5h8rP/JuemysxUDojhTR88F257+nmFO7KhLA/aIwUjrIf/PytxoikulZTXTiEdyc/SO
	vNP04EBBGtjkNPx5KIYcJk3NVh0hppz77nczJ2JRyAx57h+tDLq6TdNGpqaFiMzwyQhWJyLhTz0
	SE7k/7Go5xEP6LdlwBj59x7ZEthyL70V84/QeHsan8LGHfoGXjHtzH5J2iYDuy6vkYSRDHvisDb
	fX0d/L+klJIWEaCUbuXyBqimk34FlO7+d9PT5egUPG9Tru9WW79GYZmEbVrkutLopaNCwJX8hJ3
	WNyaGgMZjbjkuNZkJJP10XAFtMvh2H+dJSXBjd9VjHdfMKBbS8H6Vi
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3619b30919emr12488146eec.0.1792341493523; Sun, 18 Oct 2026
 09:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_0MTEPHARiUqc0@sirena.co.uk> <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
In-Reply-To: <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 18:37:58 +0200
X-Gm-Features: AclHuK9-cF_lYeu55ygeKwCSKpAu7DsZfmVWxzzJwXnFU9wvkc2Y5qIzKIwufsk
Message-ID: <CANiq72nALxFQ9xDe7xU26e9ae+25-=v3wmapz_SqA7UuqPvRkg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-rust tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 8:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ideally we would do:
>
>     use crate::prelude::*;
>
>     // TODO: `Alignment` should be moved here as well, Rust moved it
> upstream in 1.96.
>     pub use crate::ptr::Alignment;
>
> since one is a re-export and has the `TODO` message, but apart from
> that, it looks good, thanks!

This is needed to pass `rustfmt` too; so I have noted it in my PR to
Linus -- I thought we were enforcing it in -next?

Thanks!

Cheers,
Miguel

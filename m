Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F146AA95
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932036; cv=pass; b=l8o5kaAUHHlzeEuvXZCpWgoG83qYsjKnBapkQ4bI0efa5nK7kZXw5mkp+KPSRwVypylY8/B09rHBGfag6aBK4Mq24n8/St7nG3jhTRHDBf9YqZGDB64b+3c3v7NUIGKZb9y7ahAWy++SGfhv6bZVizGiiuQkXh3Ldov/cWai6zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932036; c=relaxed/simple;
	bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHgZ51ClEznOrXNYkkeiJFF2h/T8/eGliVt9WTNprOM/m2rlZ6umoNa4Wms6v8/1rDpVMNtZ/XQqs995UsF7zfsKrGOXmJf/p0OTeR98Ydr5NRIoAo7H7jOFb4L5BE57JcDr8bWuLxfAccoOkPy3om8T+B4nK8LS//Bua2r2WjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKkQ07Qu; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKkQ07Qu"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c28125492so304854eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932034; cv=none;
        d=google.com; s=arc-20260327;
        b=bnUgPTioH4RlTWgpcor4COF4LIrt73hu3QriSbgeQT9VolrMIjYR9Oldbh0aSj3Yit
         4xqDgbbmX8ciM3OcrR1JS+KGWymb69a1j1gBGWeqIW83XLsrPdquBB+vv0SW8cfcykSV
         /dgu6Ifo20J1xx/7DxWKFP3bNX2NhBPWynvxzLPIow/pjGllRQfezpoDGpxAmI1gaJfx
         qt1o+g0D6jxdbPxQuXyQ+QK/g0Hox5RWt6E57fDLixXAZFAfT40QvxGExgNYnS01c1Td
         QFT2skLBd04hmFwD0n7XQevkCaZ0hk/lvM06Ym/1KlXQ7hcgmqYAJHNjd/FcuPf9oPEd
         6asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
        fh=eg96ywFBsFbbzSKbOzPRwUySA5CJBVZSBPWYXRaWong=;
        b=IMmhJtUOGW5cuh/BQ7aJaz7uroKXrCV4d1sssC6aYZshEEXoi5l4OUddwJAUNE1G/F
         aXjq4niP9Q+ZCC1JYwUIdfT6GxdqgyQoWxz9659exIeOLo05lOaxJZ+FZvVrKGgDoE/6
         F5KYXaCziA+ta47r/YtfS46NjWkUIbPfrnrQC58PpY1udqxizZe3ErROffvHHGUUf4RO
         sxkSnh4aTCik+RHGlkK24WHiwdgPIwh/CCbGtX6nxgAYHnjCizRJpALwWgNFefavKQWN
         L2D6U/RMMtlnQTZ9iKx7+YpuGPXvK1dNOCcxQdU05DUXNLmpBx+DitYOIv/lRUNK3G0a
         C4LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932034; x=1791536834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
        b=kKkQ07QutNr4y+SGRojLktAZvrjADk+7kx6zTKs0tf/h5XCNj2gSM5TaUYjpEGKaaz
         Iyo/G/s5MULaAgk3c/WYUkiZM0oaDGpAQWuUwu6Mjt6ZG2jler1kM2MydTs9ZWoG95KA
         +2y8yil1tIOdK5O53fBTgTkqgPSxTqACnmj0TkjrxLuyXO+Gi2ltXt0EZlb0EbelVUw/
         4vLq7k2VpYsEaaf++mN88gmiFI901a6mae9o07cp55VS4fGqNK4W9RnxWyyU2EgSLBlS
         vFCgUseLHRKtJQIHigSQRy3t18Nvc3qqspDu4wsbRVF7rhcxG/u1XdqZ9MFR2q9E6W0/
         dJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932034; x=1791536834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
        b=izFw5+ldYGPvSZdIHpSyMIga+ufqvhhNDIL04/+EoB3KW5UL7eksFbFf2fncoHu93l
         nDoA5UZgQHNAH0cfXTE342o0Uq0Hr5giwY0ENtwgWymVAciRCT0kWB6jSCjBqz7a5aCk
         nstjb/8/aJWty/PDcF0LOhlwFexVkg7Va4qwdkCeHK2+fktLOyxtm/v+bmd0pV4SJ0VI
         zmtqbaEgjDxK8j77SqioD0DMFKfx4dVc+9QryRII2PKTyFXkRVIBzcsZ+XWWk9DIP4qB
         OBgFBCFvJnaoj4GdchgZCeL57VwyqoxmTHkkFm80mt+JssobnpXPQuIpD68nG66iWwHs
         7xUg==
X-Forwarded-Encrypted: i=1; AKwUvByRqABEtFWSABfPAQ9QB0gwp68inHelNZYbO68IqOP81FWwXkq6NBU8kBj4AP7BvirIbNPPm8SFDr4vbig=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHYfD9Njr9hvtOWpMWhG0CEhjD3bDyv4Xol2Ok1+JNAFdREeEC
	zWm1t5+lmf3myJqmyQCm9OypTf+tJ3x3RgVzSoWMTt3+gNEgkrO393jICMKnSVi99AJRyQSWD0Z
	grETKcMlDBNgm6SLhOf5pSPrXUCA7p7Q=
X-Gm-Gg: AYBFou2UJwXiLa8Q57iqvabvnpUOd9u269yrkCVkEN/n8Ma+eF3zkMT4cZWcV3SoIUf
	EuiaBsu4jmHua8UurqIp5/BIIqiBIaZDwy7FIRY+0ky1r1hc+V9x/ZxCxJJS1VfgPtkuRpz6caQ
	i1Jf0f0cY4rG3dn+v4EKT0ThkLjyAC/m7tLNevYq8GP15dFZPUa6K1ddmQyeCq6fZ9tMuzz0Gnn
	D2snQTn6kRr7rPXZrQaTItyqorDzGJA3zzgM2I9B9iMmC/9vyoaHlLLjmmTLgQGgjaprsqUDluS
	5ZuYtoXzQquDlN2/HUgvdYz+gQvryJdZgwaj96uHz15wPCuNX7+NYeBcQFHKUYbkJ4oRk5IGdyf
	cwuvtiI/LwYUGD4czmXeBYucjAtlnmqtHK2OAjRMXxpKKBtpFaLsqQup/tFateSo1bBySjCyY4c
	oveMLpwuauiPtsr37tMDRTiNqvyASrPCPbB68q1Z6Tg9YUJRD9U08=
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr3926108eec.1.1790932033786; Fri, 02 Oct 2026
 02:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set> <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com> <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 11:07:00 +0200
X-Gm-Features: AclHuK-RObMvbRFt28R6tCI9hkGgaSU-cAI22KyuJJxz2MS6peiMo9quk4wXYGg
Message-ID: <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Burak Emir <burak.emir@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 10:33=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I don't think we need to split the helper C files by the headers they
> are defined in. We can include multiple headers in a C file that
> logically lumps things together. If you are worried about finding things
> becoming difficult because they are not in the file one expect, I do not
> share the concern. I usually just grep in the directory through my
> editor.

Of course, it doesn't need to be a strict split. But, where possible,
I think it is better to match the C side for the helpers, because they
are thin wrappers that need to be updated and maintained at the same
time as the C side.

In any case, I mentioned it especially because `cpumask.h` already
exists and because it avoids an extra `#include` as I mentioned.

> I don't think we need that kind of granularity at the moment. If things
> become messy, we can just refactor.

Just in case: `cpumask.rs` already exists, i.e. we are not adding new
granularity (or what do you mean by "at the moment" otherwise?)

Cheers,
Miguel

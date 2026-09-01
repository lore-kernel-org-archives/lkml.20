Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D841834D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275356; cv=pass; b=StHohXTGX3WvJJ9xwMi5KjDGySlog6mBoIIF6sKV65In4i+YAN/tNdrzg5Jt5U+yTerkbc2umqswBJmwijiRDdGlk3hg4eXYWE+R5yj1o/LFe3gxMUc9ZtNqvjCWGXRsshtYa3ikRaA70THOwx7sHUMNLiRU6XcsdWRzG8ahmEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275356; c=relaxed/simple;
	bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPXjCrKpROc8vrI+6S1yukIMlYBtQykNilISQZgQVSe4a/tE5DU3nKLQG1Z2GDJbZ60ur4qAqnteu49JuRFSJRDBH8vFbackxMm3rFRmXv1ZRiL+I6eo+FxRa7yBVhMWbXOWTb7+bl01f+qAOsnFfCPhbt1rr0pgy1nOapuUYGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7k52jFc; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7k52jFc"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46ac530ba95so1589057fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788275354; cv=none;
        d=google.com; s=arc-20260327;
        b=XU51SQFkw5FFOySjUuq6StvffqKgmrbT49cLk0L1XKgUJnkIWFMBnz7juVjpzwKvhh
         IuT4c8Wv4+q3nTx0lTvBzsptz2mGhptW9BjKQ2QyAqCKpVCQu+RkEduDhfIUn4Q2cL90
         R7bSG2Tm6FNwN4bryFFpmU+mcHlyQOO95V0UHC9FLwGmHYe5YB/3jB7YzHHyk4+9jyBd
         5/8m/eROEAbUt+7iUWNL+dRMJuUSVJMCc/JEhDo7QUPVhxXNCs4QtMtDnPckyrPQtrcb
         J+iAMGjUfC0o497tJw678FfclTb4xwT/tzJEu5TkMWHYUgFBpLS1AFVsUewUjeXRtn66
         iPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
        fh=ZQPS81KGSOffIGmKvooPDP+ed/CS941rotdn0F0KX98=;
        b=s65pJdg4tGOdPFsb1IMwkzZWeoX3gPYR7CcIuQxLTObUj/in5XA4oLY5B3mOjTTynN
         S38H+iKX/rvqiIvVGQdc5SOZoIUCVnPjZXB2K8vMUzftmdjifNfWAToOrzRlOEqLwkft
         zbWqCMu0vLJXCYQFV+VKBWR/OrYO3ezIg1pNc5MkG7I7FN08h7hxAK/Ntwj6mwddNvwN
         +VwadH5//mbbYTl8TTv/q49BIqkiSpR7nedCWfHoMOClAFeaLnub4gU3amUzecLD6m0b
         vbH+i4RCeq4Obk/98guvTanhh8u7/5APk82OokHfUoIBostOPKaxdAb/R0+QiHg6gJWu
         iBSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275354; x=1788880154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
        b=E7k52jFcXuybJamK9AMtxlx9DV/aPCHG0tD3QuAoGyOr1mwvcd6mvp9MCvFb4hgbv4
         NE+FZvupa9VWS73DWcs+QoUPPT3f/MfUHHfFvrPQAvuoCWnNpYv+M/5wD0lv8o+yFwtM
         By/KZyv4EvBnMYk/gGTcaghzXVKoN1+hyLH72CYbnr1ecLT7RiZDI5imXlgTuSvpEUK6
         JIxBGNykkZ1xoPHQKeL9B+mJ1HcwXmfQBSuQbbdWBtiwLHQD0H/62/UiZCT5hUnOkR65
         t3xUjiXgsmYVdHboK7B2bhUsrdEUa7lExzG9pjmtU5fZkLAc3yIJ8S+OABapDyI5R7uI
         40Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275354; x=1788880154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
        b=JOc0rWqQQwvnl3e4UeqY+apP6jxjA0V6MvTfsfRkivDMoJP3WsoHXDqB2yJG332iQe
         z8jPcL5RX8ppz+Lf2Y9fRib6TYANK+91YCTqosOxrXzGs4uN+vBs83svqfMvKNE2QPdc
         0VfP89FcdJma5ZYn+SNuhY0tOnfLC+f3GdN4rDzT4IqITIm+QhmFNkeGWaTwdujnZWB8
         W06oYQt9g8nk/kJumiXwcJu5z9ZyLj2uea+Lv4IRh9heGn2QZ1PoNdi2Q0x/d4QanvV2
         IxZFuuRVM07LA8dGlxr/Oyq+IvKM0IQqigua+B/TlTazLv/dc8wJs78rp2zZdLAJwZ4F
         3TMA==
X-Forwarded-Encrypted: i=1; AHgh+RoO3sfFOR/eOjkxXTYM9lXIpDKVU+hfU37wtBsnC/HaOU6OtTDsVKK3fLk9was+D2FB+8MEJ/sBN6BWkLA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcXnDqAzC7ydUvoEHdG6wI5os+9Grdgs5cpHfpA44dHXzwLkCi
	uDGP4oq6PlFdbsHZPk1du4E42S1EHIspLDtHd3zx/RcEwVk4FkVNcBxVjBovpYWOSkZg0659uBb
	Uq2hawkeX9JVJ4ZD8iKu0dDOJfCckHQU=
X-Gm-Gg: AR+sD12UjA/eXJh6/rko5DxYH73URzjEXbioMBD2S2AdAFqyJb2eM0Xk4UYOTHWkncr
	mVXfxgZYiJ5yQzUnUdGQ7DihjkMnNEYl0F9oGCZDUmyeUef5/PAJ/bjuLdneSatBSFC37tjtFOu
	M5jvS8vWPA6mU9riDa4ubDsz1BL5lmBy98OXEQFidTtdhE8Qnek9GKbRLhEcBwqj6wjYTzJcpVV
	BTYnvoLe6ST6QfX5LB+PG2Hw8pQXas8OCTnVsdk1ZqrRSTMmXOb8yD1rqoKYxkt7VZu8ZqjFkFV
	mGx/LS1dlUgbiyi+AWFPudLiZo8cQSewrdrX+A6lC7vGzr5IRF86ybIcRQhRDBR+i19WAJvi7oI
	xvcw=
X-Received: by 2002:a05:6870:c44:b0:466:d80c:8b75 with SMTP id
 586e51a60fabf-46af571d645mr9719754fac.14.1788275353705; Tue, 01 Sep 2026
 08:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828133543.2259029-1-georgeandrout13@gmail.com>
 <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com> <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
In-Reply-To: <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
From: George Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 1 Sep 2026 11:09:02 -0400
X-Gm-Features: AcwNN1XS4up07Fc3-W_8FN4ZC1H-wwj8itghp6SyGxm2ldsv6CBH-6FjbsX5prk
Message-ID: <CAESH5ocNhHk-vNSH+kODfxuUpo26AO_uPao-8qR3bk=Kw-c3sw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:48=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> Maybe -- it depends on whether we consider this kind of documentation
> hole a bug or not. But if we do, then we want a Fixes: too.

I lean towards treating that as a bug and sending a v3 with `Closes:`
and `Fixes:`.

These are public `kernel` crate functions intended for driver authors,
and nothing in their documentation indicated they could panic. Finding
that out required reading the body and following it into
`bitmap_assert!`. For `next_bit()` and `next_zero_bit()` the docs went
further and stated that `None` is returned for exactly the input that
panics when `CONFIG_RUST_BITMAP_HARDENED` is enabled.

The same question applies to the `id_pool` patch ("rust: id_pool:
document panics in `find_unused_id` and `release_id`"), where the
docs were silent rather than contradictory.

Thanks,
Georgios

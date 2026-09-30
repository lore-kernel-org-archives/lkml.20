Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED41E7C2E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759541; cv=pass; b=SUHiP7AY/iNBsAUmNGDBnJa1PDd4Q9JwRWr1epzooB/8/ra0sHX7Ag7MXESNhaN4Ec+8BfFRWarhHw2f1HA4gjGUsOwaH+D76/xGWZZAy/J5th7vkt6V47WZKwCMSe71TR/nbqoDlHHs53GtHKfHD2WOJMu08/g9q+rQTiuZsoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759541; c=relaxed/simple;
	bh=7p8DMwyq2mZD7oBNmsoZbD5KB/43vQVkjyvaz1CCGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCvYQ4LQomQBM8Y37jqD80Oip1yT07qpjbWjqdHMTE13IlqmgV0esikcBo4MoeTtVlCtRqQyy6A8lMx+hnY3oFRcAJjt9mNJtzm9pcxw/5O1zvfOUL63VJxMqAKCdMuqEhcDjl6pGaIJJtW0YzDo9A1pJ0x0zLC2rrFJOSK9gfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okARf0Or; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okARf0Or"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14c96a4b7c7so109012c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759538; cv=none;
        d=google.com; s=arc-20260327;
        b=So0517puoxpj1eqj97YpIuywujT+2CqtMbBq1NqG0AG/K9i9VLBwN/ueatLKljFmM7
         NXz1OXwJn9oppIZP7e0rqeZuduxs8MQruskGbNjlQuRzMJHVGIEyPGFIc/YZe6wgtcod
         ZMRiflht5Stl6DGBJnwxgqffhCbHkpsr7sv3O2yvuAapgqgo/M0edtR5iBxd5MLEUqnZ
         qTgp2VQWGKUedPSThz2gkQ1abB/04MqzqUIj6Zg7zWkfWPuHA4SqFMMirzGP85iDIVW5
         UvrRefaOyvtTJkyugB24AaRRvMrcXudLd/f6WegTuW+34ubAejjxaA1Fh1/3d4/Mp77u
         XirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        fh=WosGgx+1Opd6CtVMo9vpvnYBpzAYaSPh1CBSyfSfPa8=;
        b=kIFZ4s4/cqd6IitLZWd7i/RLIUWHprB7LWT2D7GfVpQlz/OqzVIXYKjrjxrxeNBYKG
         wsKHtaujWEjCLbVHeTNos2Pq5C5id8BD/2FxPSar4yGxp94J8vkEhbAsAQRxtLWGZYL8
         1/bzb44eaE5TNkU7jxCkfIwQ2EI/N+pAfvfR7vl4n/BGf06crV252ts0Fy1E8dAik2sY
         pzCWiMLxW9ikjmT/7aYP8j5Ckqd/JUwNzcUkvV/zExtWScLPvS2bf//rbGivvWUrLMDi
         4uYDLOhhSrvvm6vqurHE45F2n5vmoF2tHBJTXoxIl5vtP1dnELIixhuIEHz/GCLQuI1c
         Kt0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759538; x=1791364338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        b=okARf0Orz6/j/CfHCSQbV6hQ5p8EKQ7XflY/INaAQ3TccGu/6nrLHLZ+iAQt9M/X6f
         /JMbiqbqznPtQlwyzeDf8vCTTFYpU1TZiE8Xn7cOOPQMmDXXnoNyIaHDqzCAx+m54q3z
         8ykAiXIsJvQsYPO2lR/YtaFgJ2rbeQmOiHgvMxaZnckYwc7pXkJCCJ3SnuvLLwLapzmF
         12Gbc0yrEZrYyMNrEuS2r9NHwfbKtZLcSNhvBNFZEbapVqHu6MFpW6jBmsDzj9N+rOec
         8dVUcAAcjm80D7sxQUIWZYGDw5bfkltZ5gEZMEkyYsNr0l1JJ6lbRcEYvzooJyfL3H1l
         nrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759538; x=1791364338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        b=daaxY7WP+1R7U7ClzF9OQdHaaY33PUmStynwxHzY/r0vnUmWZ/pMlTy67Sl7VT8a9E
         PRr1ll4yWpT/QPO8yPe0smzel7bTFQqW/nn1aD1uNONd1MuA7uA4n2GoYQB5TUh0j8qo
         p36uFP053FbYaTtYKkxEXtnJNCLiBwMzh+b4hp6su+EJEHbD1HXZauJ+KNLKrOFPmO64
         vSbzlVLODOjdH76UyaG+XC+YRpU7IzLfup+y/gENvhA+34PkKG805S+lltfhF3ZGPnlL
         cH7qVTU8swSr7Qs8jJROjziY7y9FXf1dTfaJ5QougKTAKVRO+/ch1kb2M/WIiXlGL64g
         vhaw==
X-Forwarded-Encrypted: i=1; AKwUvByWEyIWDDl3pbEHlDrNSgRHJlerr8wxXGSaufiuVJSbcelCXJV9tksBynJn7Xf/ypz4CGNohpyYDzQM/Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+ni3n2VtVRBqiiBOiFcGYeIrdSKQ/g8TMFn4S1f8lV1W0AJlu
	LIAoqSCrJXZ+cFhjx5ODVYkbyaD7IkmySbKRxbp8yMZ7kGjUiwdCbYKcHiNBz9SS/yr8oFc3psY
	IafSLqL7fVZphXk1M0Vtod29PxD1MOno=
X-Gm-Gg: AYBFou3O4UXtY8gaWt6EJRZJZkHAudd6LMnlsYwJFt4CMIosFE+vKlo5y0ILTPw/qH+
	2B8FI92XHYuKomOfp5WgWHE7qho55XXo3mLdrjvgIlZECpA2LEwIV4thmBehHZzl4eYNX8+nqgF
	H4SIl7JpQu6zA78VtG1NfQ506s5FS1ky2DuNLatdwA5bpy7gRQmCSC6k72q42mDfeRX73IbIJQj
	Ck+QhDSqt92p/UtNMaE9T0w8TngvO7glawAeDUpaP7YRIiYJnuucVyUXPjY5gBB1m+lxgBe64PT
	fFfnx0lb3XJpTsS6dtRCyTAGOmkNZIUWnfW1qH+e2x7t1VcDON8rw9AVNyCrHCG9qOKa7KaWZNj
	7JHdZBCqVYr6TL7b1015aTzkxXvr/geTVtdZ3iIm/wKuNH71oDdjr5TxbyNTVVTU4wk0VkMotmy
	/x3acZvcJjophtaxq73QBG85y4XaiXnE0bsK9gcQyba/f2u5S5aG4=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2001616eec.1.1790759538076; Wed, 30 Sep 2026
 02:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-4-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-4-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 11:12:05 +0200
X-Gm-Features: AclHuK9QlKMhXKITkkBnbYFPptADooLzR8_3Lk9f3AVt-2WcqKF5YbgcQH-UReU
Message-ID: <CANiq72nuhGkeDFwyWG91xJTAV_uio5PM_PoYvXLCWF7ebKBLeQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] rust: sizes: implement SizeConstants for Alignment
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, constructing an alignment is quite verbose [1]:
>
>     Alignment::new::<8>()
>
> It's unfortunate because it disincentivizes using it at interface
> boundaries. Implement `SizeConstants` for `Alignment` so we can write
> e.g. `Alignment::SZ_8` instead.

I don't find the former disincentivizing -- it is how I would expect
to have to write such a call in general. We do have the other size
constants already, and `SZ_` is well-known, so the short form is fine
too here, but I just wanted to mention that I don't think we should be
scared of seeing colons and angle brackets. :)

If this ends up going through bitmap or DRM or similar this cycle:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can pick this one up this cycle.

Thanks!

Cheers,
Miguel

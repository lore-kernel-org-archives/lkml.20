Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060154;
	b=ui7yYdzDRSkG/szbUIEPnw1Bnp3msgYGyJ4dNmLeI0NFIeBd+TEUoA9VrY9g6/Ilg1E5
	 hSjbSx45daub+fGRmkaK8kmEuf2//g9cL1YH17HhvE0Gu8U8nb5qxvKVZPaTNB7jvJRzc
	 g3BU92hIUKFyEsViZukpKUON1JKelMZcm+xlu3BqOaPe6/NB63ka3Ii0R75o7bPJuWnAK
	 lbG5ddKt0Vup3W48LxT98PTK0/PPD1I6WQyzB7Fx4w6dlz6vl0H7hj64mXWbm8u5Zy1ys
	 7joZBD4sC4Zxp4qBuav1hKnLlbkrFdIk/V4hl26PhlZOTDSxH312GCfC6m1Cm/4ejTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
	b=GmEYrWoiLxzyatr2KMhL3he7V4X1f2BGVzXu9mvKTR2t8N2drmI5yOqSs7TUF4h12Noy
	 Vx5SWiOUdFwouwS5gmxmgl/a+SxXCkxeXZYJylO14YyPhJ9LQ66sc5gU0+B81nmaj4W9+
	 raFQBEm30x2JHQuMqlqOBeg8PLqHe8P0bIFjfumuQbzgWVh+UaoYpNp7QjaX8AGRLx9fJ
	 Ai4abQR0awBL6BuO7QbM+nnIXkkuJxdKXSrkZ749pEQIaRG6Sql2ot+0wvsjKDB37J23S
	 qJdubAy/B/MZhhl+aYU98XGcMzNnhk3rxSsmzAFsL2A6Zqd4k1S7VvHQ4pItGn34jIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuTtztKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3D606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuTtztKH
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so2140100eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:02:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060154; cv=none;
        d=google.com; s=arc-20260327;
        b=URTJ/UVznm6XTDIWaIvWllECtpAUlxKipfKtETpkCr1z+/MuBvmLZNl2Rt/iIhd0/d
         S6C8RjineBPvPKXxJvVNBpkYYI0l51xuTkXx9XybmhSlDowzSyE4FNREjdZJqLEn6yyz
         PdcvqFHROU6rxuSs8QRRgfdguHCOinXliINRBB/HLdL1NjeRbE7teeG+w2jPTFsQzFa8
         0YGqBIRmET/qjh08/enBXC0ThliXjRzeidHT8SJP5akaiQHsxJVp7KQwekOWaHXaIZel
         iQuItoa5YAuKMidpn6a7Q5z/57UDTcDWpKOWcR9kY9IpVnKOAUe8UPHRukqtRK+KKKC1
         hKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        fh=iZwDXsKxd6BxW/jSHwr6qny4mTrp9XOeYIVXzYnVpb0=;
        b=IojFYjOE0kl7F+JxGTp9caoreWriV9/p9dkmGMtw5NO+D70Q+L2BQMO/6I9QCQ6Vys
         fhuEG6HUhcYr50z/yXTczofgyvmdzTMlMlnDYDGgCsj7IrwGQ2TlicJGRRPc6uYDIvT2
         bLw7bhCB1sJf7EbQzV2A35NwKS9O/kh+HdlC+5edpfylfJMvyYry/IpAznEa7f+g33Ae
         2GGP4AxYNFSF+L/7OAG/Ts9Rasx5Nz9pjbkPu3othZGm4pCXoYcYZue9GU8668yRYagc
         sntslrP/4PVrgUsABbX8lq1N8wf9M/s6Pv10Ds3C07Y9BfMb9T6NuITk6Y9M2MazLlhE
         9WYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060154; x=1794664954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        b=iuTtztKHWklRGb6GjtWz/Nwh/19u3b9jdD8Oz8xzdb/SgEjID8UUUg1jBON2L9L1RS
         qx7IV4O+t08Mk9AD5Uy6j8GKpdrFEZH7/7V86+fYs/HfHKpF1OhLJF8MlBk0hpmcXFJQ
         W/elMbFqQ5sFy/R3V7/IxGEVg/XVPA+Z5I9mKJaqrEkF97VgSbwvBXtuC52Ok+X4sOgf
         Sx7ckorRqiLifqg+LrHOP54vNiCwsbIF7svnZ0wO0GDZzee5r+l9xZENRev8ISuov3LS
         jfNTNQEfJ5boPYK9s5IibZ3+8WRQrkvzWhPMY1ehwhCR7JoTrmGzm++L37uYWX/BBG3Y
         TWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060154; x=1794664954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        b=luuEfM65ZWPcTucQRZcnUeJvutKSPqaLfecK0jSBre8PCcSpV/FeXMlBpuKFtjYGz2
         0el1Eg77MQgeAebMdVYjC+mRoSm+215h519LiGE3Xu2oeWpWrE6R05jaw80df43+jPJ1
         gbAfhoyf1ORHYXru6itvQnpNg8kvPiopDIm+wo5eUMAMvFbnh3KzfNQt++mdev8CqfgJ
         Xp62Eeow8qx3iGwa8o+Mjdwbq//sO9sGggkBxc4DxkgVn5b30rjJlBNn66ZWjgzByNXB
         XaO+NnRClCfAEAx6yQIdb84JGecoyuIIGGCdP0r2imnVxd5lba246AMwL7f5jsux8gUO
         qNbQ==
X-Forwarded-Encrypted: i=1; AL+hErHwQauda8iFQt7mN8zAu7v0doanIiSCjuPFfpT9H6OGoewAEgwYb1k4I8d52otFT2yNsAN4P9fiD5jaVV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/19F77qqm+z5vlhashYg1L1ImfyBgLWRISOIB0KoMu/jLXl8C3
	dS0NCNywGHOu58E6ydZwnPS1LhwYggxJ8C+LYZ6Aw6aeeatzh1iYkqntB40h4/pWxrZmuPzesBo
	GrNBxEpw8zhqeEHtNahjIXVkfCs4vZeQ=
X-Gm-Gg: AYBFou3c9YqkzMTvYb6PKuXEuFLTiBhqKJm7Zlh/9III14K0gqRBZVWGCCPCVgRvbrD
	fF4E4iq5b07xxMWtg5/m78xk+S82jzc0Zwy0Gsa0k7/4BEGFxtOyK7nraVhkeZFtFhrYreXc7e/
	GAHERhTj/waUqy7I1GXEyJ3YlKjgqV2+4oB55c9vx4p69EkIYzRKsAe6QUWgMIGM/xSYquC4Hu8
	UFc9AncSPa5lkkW9FGu9HD0RMpbCvpiUvEdhvSFAXyJm41JMsNnnQsWC/slvG9X10YsaAekSPMU
	wAv8S6jwIYh5s5jG6iBdIu7Qt5EyLEabcQEO1+JNMq4NLe/zXusKxAGdPRrozih6giDYMbM6wwy
	Xe7bo4cfa6lw4AFv56Vt6/UxyPIPM92mIQPJypaFT0bmJCe3E200y9bPo0KcWIx9AJHKojy9sOH
	oZ2CF8xtOijNFL4YByFP0l7epk1ftWndyOnQ4xoj5g1cRmSxm6BxLr5akiDLLN6dtGGcSaiJM=
X-Received: by 2002:a05:693c:68c3:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36f754414a0mr8478739eec.9.1794060148890; Sat, 07 Nov 2026
 06:02:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
 <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
In-Reply-To: <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sat, 7 Nov 2026 15:02:12 +0100
X-Gm-Features: AclHuK-j_BUOtjpwGmqXWoxYJLK8ze9j6ufmkDg9fB821Uo8UGX-BRotwpA_pnA
Message-ID: <CABwQupO1Tp2EM=iNq24_9_krZ+6vhvXxQ2TxJ7LUC30oSXJ66g@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Current code in IdPool::with_capacity rounds the capacity up to
> > BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> > smaller than this and still uses an inline representation. Remove this
> > behaviour.
> >
> > This allows specifying a real capacity of 0, which was not previously
> > possible. This breaks `grow_request` in this case, so change it to grow
> > to at least `BitmapVec::MAX_INLINE_LEN`, mirroring the capacity floor i=
n
> > `shrink_request`.
> >
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> > ---
> >  rust/kernel/id_pool.rs | 38 ++++++++++++++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 6 deletions(-)
>
> Alice, Burak, Yury: I would like to get this series out of its current
> limbo. AFAICT, Alice and Burak are ok with the current design [1][2],
> and Yury's request to change stop using a zero-sized pool in the example
> has been fulfilled by this patch [3].
>
> This series would need to go through drm-rust-next as we have
> dependencies on it for the 4.5 cycle. May I ask for an ack on this patch
> to push it through drm-rust-next?

Reviewed-by: Burak Emir <burak.emir@gmail.com>

For me, yes, it is good.

In particular, the thing that Sashiko finds the panic of using 0 size
with find_unused_id and CONFIG_RUST_BITMAP_HARDENED=3Dy was explicitly
discussed before and is intended behavior.

cheers,
Burak

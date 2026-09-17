Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCD4AD4BC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637596; cv=none; b=YWD0vJwUqMDMWhQ8/SE1wsvpoJg+ddnMS1PWzcsRapPh4XO/tAGe5SaFgjvcEKLw8GAnw2ptxnv7EVJQrQnGwk9ib5ntfNmBZ6/XlA25LdIZAUK3IlS1Ps4f6fe07ZYn5ccmmkvw5Po4UZ3uV1z8nvAoff5y90gaPDhSS4asEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637596; c=relaxed/simple;
	bh=3XVhvX9FaSzMPLV1sM5AoC9g2JGZvqkXTdE0PlcL4z4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sfH0jdkB1cV5demVHA9TF7Ud3k71LArg/j1HbxhKKkR/jTkUmXQCp5bOBG5FK3olgvTvRSAZBq5e7bGJghgQ/WPqp4PR14VU4K78eqXpWbwkSDcfzKOs8I5zRPaB+JuTina5KODCIGMzuM4Fl73tOxXNUl5ONKOhSZEcVioCVZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGGXzoSX; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGGXzoSX"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6422198fso4138705e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789637579; x=1790242379; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLg+WWoCYgCGUuXdz7tNXtS+CEP4a258vdZIA6xLWNg=;
        b=lGGXzoSXKH956DfJfYojBwngDmyfsAWeIjw9eDgLPuna31En2aIho92UypPv7am1VR
         /USN+ShizLse5PNckQZFarPLialVznoEsDQrHu+2N1yHx3TLjCxb8Fvqsjvvh6NwRtAx
         COe6GXAR8xkxfaEV2dNnAEJ1cI1DsXhHdM45rkjrsogrGJHYrLTA7GbU7y8lBY/Zl2tn
         f1X8rkzedCG5cm2dsBwVlFFPRLQTt43tRTHsFiOKEnH/AuJHGlYFrSMkIn+5vqnCeGWC
         F6T8Ytk84w5vDdr69jvEhkhTFVaSEbUonbOWlkGXm2vRZFDwKU1VrtPtJLpPnLNMqmmF
         4dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637579; x=1790242379;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLg+WWoCYgCGUuXdz7tNXtS+CEP4a258vdZIA6xLWNg=;
        b=u0euUZt3fivvRkl1xlRPNo7BgBu+9izZecIkKbHTOceZrdr9DhsIUBZB9+i8lk264S
         GP8x3embLd8ksmlTlDDyWYmfcixsjT8q2F/Hic0myqa1tX87PZtP8QTmpsJtTLdb1Tol
         LXVbyweyhHjAcCegwxKpg5hr+NMvc0zYkHj9mLHP8Nn3tb/z3nN7fuoVrfYZJxfEtR84
         OIv7ezJ9dfDh0xUfOzNeSi8yfDWEIks5e6n9i+0nunrhj+CrV+px5KqmGB81v8+1CxD7
         +/sgwGwDwvpLNTH8yiNu9ybC8GGKLa2nrkcwQyRK77kWpstL2trv8DDlDlfizy3yI8Xt
         /kXw==
X-Forwarded-Encrypted: i=1; AKwUvBzY9COIybseuksC9cT7ErFP5fO5916Hgt47gZEi/balFFcfAIDyDPBVdXRCqtCv5DKBGzuVtRlRle4BMgg=@vger.kernel.org
X-Gm-Message-State: AFuF++nxkTCfnqZOMdKPNg7/NRS2Dyu+e94AHBqIpBY02qlFzOxPSmfR
	SvrFXvJzru/iVYQZsQ2wEWmquxcBHNA4EzYZ7KBbrK9SzxY9i9Xc2yQxsPJzg4Maa4vSn5ggZsl
	aXxalq5kEstWwPp9oMQ==
X-Received: from wmwb12-n2.prod.google.com ([2002:a05:600d:444c:20b0:49e:eb51:f8fb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:1b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49f1d516a12mr138409325e9.8.1789637579365;
 Thu, 17 Sep 2026 02:32:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:32:58 +0000
In-Reply-To: <20260915144231.31932-1-sagartaunk@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260915144231.31932-1-sagartaunk@proton.me>
Message-ID: <aquzyg0T67vu43T3@google.com>
Subject: Re: [PATCH v3] rust: net: netlink: Migrate to zerocopy's IntoBytes
From: Alice Ryhl <aliceryhl@google.com>
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 15, 2026 at 02:42:44PM +0000, Sagar Taunk wrote:
> Replace the kernel's own `transmute::FromBytes` and `AsBytes` traits
> with their zerocopy equivalents. Specifically, this updates
> `GenlMsg::put` to rely on `IntoBytes` for converting attributes into
> byte slices.
> 
> Also, add `Immutable` trait bound on `GenlMsg::put` as zerocopy
> splits the `no interior mutability` guarantee that `AsBytes` bundled
> together.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1241
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks, this change is ok with me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Can you send this to the net folks? Please update your patch title to 
[PATCH net-next vX] according to the guidelines outlined in:

Documentation/process/maintainer-netdev.rst

Alice

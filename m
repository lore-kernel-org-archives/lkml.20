Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581C4B0C88
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637760; cv=none; b=YHi1iOzrb8BsY3H3+0rFa7B1ezxmwpJ6svuuWHcOjpfFWlTC5RZY6aTadNTygJ5y6WAPMc/E6XezAVDJrwH+h5lX1TU3Ya/sJlAdmoGpVdeSrSM8Rwnzcc9ztjdGfCBAIfohzp/BtPkYYahbtxAwMWp0L7E6ZHlF15mDVj0YupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637760; c=relaxed/simple;
	bh=Oz8G4IOR6Gmqkd7yD6cQD3SSfjx7S8ayJRM3R9p6+sQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XCq8UyK+ovak6wp0lO23ojTj8HRHWuR5hBv5W0tAfOb6OxxEswZzxNieqyyxKGmJ6Jmd5QAF9f+Jv3UiPuHCt9AWrv0lQZ7L6Zzrl1XcUmmpOx6M7gNXAZ79utdI9Y5BtErYTbdFBGM0ZXPecTA4q5lIkHRl67HVL2a6EGOvw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oxhzcLRD; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oxhzcLRD"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29bc25836fso87641566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789637745; x=1790242545; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsyxKzqLMpsUXo8Lic/w3Wn8v7CPcrVQjEJhvbshmVE=;
        b=oxhzcLRDRuX/gBo8vy0TKlSVL5ziY2v+kKlqu6Lb/KuleKdEBO8I3J+wv6nkrJbiXQ
         vbPNjpLX6bQLTKGZWCcQjw+9UEF6Xceakc1L5R//WszwchnJB+34Kfq2zKLRpFpilLRS
         XW3gYnxLFUCAIukeJNtZ4ZwgTu/nLrv6P3G3hl5IwEShcVD/890hy3mqAr7C6yjA0GYR
         dCPh4LJvm5+AfZoxU/A2h9IahBGWAYbu7NMBY4q5FWV8jKAoYQqx7BzjkHjY1k++s3BR
         2vhkWj9NyFIdj5Rzwr+mfEFi3b/fKWbehFFLktr0aqRSp7teY4QhtgT9zYwzhclfGIy4
         MIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637745; x=1790242545;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsyxKzqLMpsUXo8Lic/w3Wn8v7CPcrVQjEJhvbshmVE=;
        b=Hcy1iQun/Ycys/knZlRiwqwQyhS1VoxvMYSknnh4trKIfTRAgdA3NKZup/inFs8EJg
         +g1PmTGshflv/V/sRp3sTa+3QvQFVLGcKEHdGUnyfi2MK/4aHkRTZu6GryA3XnD/ZpfT
         Xo16thFCPR8UAj7Yi7QMlARYPxRYGdYkDKowG1RjYfIYxA3jyMlNGDrhVmB9SFfj1JMT
         +XeJjfjiT66fNnRfP+R/FfEFeItOWne6QgOWXsCQY3A+6CwLRKEZUeGQzPEmc610oP8/
         P7Y8bpm/vAaxP7HDcaBCumeR5OGGtgpH6VQZrGXb2FnSu8R9GWHl/zO3WKENE6LzvymT
         g5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwHU7Kaj0hzTi5dAT31Jakeg1flobveuQ/na6Ato5hSdhqwpSXBr/TftkyRXOdESnu5FkHtpxvYwMxC3dA=@vger.kernel.org
X-Gm-Message-State: AFuF++nzPiR+S9BCABMQKGVHaxAuZZaM01lAuQf92pfbI8YqybixtRlq
	E++p00wXFfuJ9FVGLBCoFL1B6z2gXki7UhnrZWKcEOPPSWyeq0FfKU/9NeG1zSHPB1WogN6zAI7
	X8pXetZUmXICgVQ2MfA==
X-Received: from ejoy22.prod.google.com ([2002:a17:906:4496:b0:c29:c42c:f427])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9343:b0:c29:5712:a420 with SMTP id a640c23a62f3a-c29e51dc1e5mr387979866b.5.1789637744642;
 Thu, 17 Sep 2026 02:35:44 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:35:43 +0000
In-Reply-To: <20260915164000.124340-1-sagartaunk@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260915164000.124340-1-sagartaunk@proton.me>
Message-ID: <aqu0bzgMAUQe_LZ6@google.com>
Subject: Re: [PATCH v2] rust: net: netlink: validate attribute length before
 casting to `c_int`
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

On Tue, Sep 15, 2026 at 04:40:10PM +0000, Sagar Taunk wrote:
> `put()` trusted an unchecked `as` cast from `usize` to `c_int`.
> When the length exceeds `i32::MAX` that cast wraps around to a
> negative value.
> 
> This ultimately resulted in a kernel panic when the reinterpreted
> value via `__nla_reserve()` and `skb_put()` became enormous.
> 
> Validate payload and header both fit together in a `u16`, rejecting
> any payload that wouldn't leave room for `NLA_HDRLEN`.
> 
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>

This should include a Fixes: tag if it leads to a kernel panic.

Can you also update the subject to [PATCH net vX] according to the
guidelines in: Documentation/process/maintainer-netdev.rst

The patch itself LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

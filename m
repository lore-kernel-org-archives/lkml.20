Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562084;
	b=g1sUZ6QW7q3BYVoB5fbVDN5e1WzAmWaTk2eLR9RayY8H12rZZPFuMjcZASsiPehn4vo8
	 RDkFm6fTHLiA6ksE6i6xAoYGUjkJ1Ab0hS/ese78BNj15dZwJWH7IqSW+uKPPH16QqL7a
	 mwAiaCvlyLz1ZHgzHXGJLc2iVs2uj6P2x+K1vcvJpEoj/1c9PSs59mnwPT5mmPXLeQKNQ
	 8kNT9CLsRYrv2NJqVDRrUXFQWccCmpONXsnDScDgcbJ+JmDic2hMvETC/N08p47dNu5tb
	 V5T4BbopVMSoTDicFzd7x/0piun/Xb+uMpEVviUZzBWYGZt37wVto1xIkT9XjyU/jRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=oPtFhbSnZ7731aXLuIJiHjV7KNwM+FeYkV7XoCnepXM=;
	b=lpApQ9HjQlDC7VHtnabkrRF3q4LADnFxX8vJutu6AAComAHtwx3Pv4fZFHc8MW7LnAJE
	 3N34TK/os394iI7SvBIFdTL7BiU0aKY6twplRKkAIuOEqR0jTkyfsnbhM6iEWDXtph7uq
	 8d7MyWPez7RCA6xJr+IeRnhm0ZRfJjl1ug7OJL6/ji0O0LP7pODeJzrM3sFbTkJQuArsj
	 dE5/+DcH427te7R8oVUdWpC9gTLFJ63qgdC35uAVtS/0IjHm7Vfxh5c9GCjkSxu35zHcl
	 yIpYe7gdOQdiQsp3ttoGT+AMVmw1nJNQo88PQXlRECR/fQGIwQ1kg6KpqXY0HXES6PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SgTCXbJH;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19F0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SgTCXbJH
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c44903d6927so27309466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792562082; x=1793166882; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPtFhbSnZ7731aXLuIJiHjV7KNwM+FeYkV7XoCnepXM=;
        b=SgTCXbJHpiyojRYx5mexvXL0tpmSW0v7NrZOFIPXTTkuE7LkAoguv4T6oERP9suhuQ
         gO/51tZF+zEQNLtgWWy+UVgvnzbxaQG5+ibB8fNkra7Mm0msme9fbmXdhHRdbAfn0ABV
         86Vey0bGa8cRyTUmFQMXlcXFFsc0BpBf6ObNlrr0n8Q/7JWbmwW8nu1QGcU1aHZTXTLX
         Ln/M174AHqZ4a3k5z6uuLupB2Ik4xGnUirytzb1w0gCe0dUFtD55Mg7Ku42HeePelC26
         UFYtpKI5P9N1gPbEIBQyF5Lm11VtbsXSScecHJvjnKdJhBFdJ2F1OxGd58IH4qyhCmFq
         +7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562082; x=1793166882;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPtFhbSnZ7731aXLuIJiHjV7KNwM+FeYkV7XoCnepXM=;
        b=B/78rNcyajLnLARD7Rnv+PGPj9di8q/wls2Uqp/IuhfWPvgE/ye+TZzlYqVALTNPNZ
         ahWyR5czRSty28DOgu0Rn4jjeZM+tBCeelwfMIpLPNaefcXkq891RyNiCQKPDeMVVSGv
         pULzDrdJcBUGD91i/rbRcpdh4wPjJm0zDQumZGTDbmEM7iwYe5RUytD7VeE8HxgNXpho
         3fIddxIIeoci8C6/C/QQfyHhg2xIKkK9eN0vKmHkWWkWeot6gtIWa/H1h+YTPD+ocpPD
         kFAyYy9AMTig8jutPU9fyWBj45EJHKE3Cfh3nT0fmZkYdfYFhlVBlQ7h68rQpfm/a10o
         0uug==
X-Forwarded-Encrypted: i=1; AKwUvBx7wKMpfgkxsP4BdrU8s+vXkgwTwMi4CsfjgMKAXy1nnMHQxBBaK+A/RKx+B2QtQBhOeiNcvumYkGqFfNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZAb7UfoGUU1j8pqEVGqw0TAVX69UTzhoJ3gxVL3yw5tIfgq9n
	dH9IedgTSKPUjbFTLRqHZhkXJML+fRwrL0Dp8DinRbX9DyC+NTxsnTx6diI92WLyLmMMF4ids+R
	3c4pBiC9VYOGVrqyPIQ==
X-Received: from ejec2.prod.google.com ([2002:a17:906:1702:b0:c3b:9071:bf1e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c499:b0:c41:f29:72b1 with SMTP id a640c23a62f3a-c4679b52fb4mr81117566b.47.1792562082098;
 Tue, 20 Oct 2026 22:54:42 -0700 (PDT)
Date: Wed, 21 Oct 2026 05:54:40 +0000
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com> <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
Message-ID: <athToIRyTjSB_jVg@google.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 20, 2026 at 04:47:48PM -0700, Deborah Brouwer wrote:
> Make the zerocopy and zerocopy_derive crates available to use when
> building the bindings and uapi crates and their tests. Also make the
> zerocopy and zerocopy_derive crates available to rust-analyzer when it
> runs on the bindings and uapi crates.
> 
> This will be used by the Tyr driver that needs the traits IntoBytes and
> Immutable to safely copy the struct byte-for-byte to userspace.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Miguel, is this something we can take through drm-rust-next? Or perhaps
you want to take both through rust-next? Let me know what you prefer.

Alice

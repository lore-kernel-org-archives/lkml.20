Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B67C37E5DF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205515; cv=pass; b=UwrWV8ETkEU/7j+RvKLcWO+Npm/sI7Yjr7ttiKKheMq9XRp21IB4OoDzBoJ5IyL3YQOPNcoUFlBBE7qD1d1VH112bDrT007/IyykhWwKCDNNmsbZQy6yUkVNBlzUIoNlGzSNyZ9VRbGWgZmwI7fVOn5A4Qtm1sFai8TW+DsWLNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205515; c=relaxed/simple;
	bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtPktJ8gqMLT0v+9F9s5yixcNWm8+a5H2FG2u2GHzGI+336aXe1LnCjOszkIoffiF4XH1KXX9qGM7a+AsGeUkL6PS8cb+0qUaqNBvaFlr2Sz+dfREOE0UE7Frbqkbc0fD9bGQXUIGSTggM3pV90Mf1dwXgNWMcVBAdfKUV0UnHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ0fnmqw; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ0fnmqw"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-855c3981b0eso436737b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788205513; cv=none;
        d=google.com; s=arc-20260327;
        b=mtiKDdzjXLBENvaXTsYePFsKKxcRLQJ5o76nrBlDGVjDhcEFFd2M+9ZavKc7POcS2j
         9bJaJifTEr1Z9ivnNycAzWs1Xcyyv9gUykLsW9fYuVAt6NL2C1t/UQGPaidJQwtphAdR
         3NtIBl/7n31NLcUmkB8qfK7h6PiY52K27mp8iVVRAH9P50g/N0nA35UrikL8bienVi4y
         DPC+Q1Bl98Y9yFpodhl4we0ZqrgyM6Ldibdq/rslgbsfzcyR7aHel5cXyc5bNqOgEwjT
         dDq+CLyuE2eQ5qh0i/BWQAyS6p9d8snUNSkmHpUQU9qhQxk4MDhaSaKEDnxxwYFC5M/T
         SdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        fh=9ZxSslQPVVHwdcitdvYFrHJF0txrxqETIzQFdug7kMI=;
        b=iMxylZWBRWNkxuBVupRrVE3IvkQlE1j799OlkWm7E5miMSPuxLVuxx+XRQGf+gceJi
         1ymPlsEgeMLvb8jFKX7Dg7eiuQ8RQwAoem3hxbBELeQtzl4iYlBLEsKwLXJC/Im0qejK
         0cJVKcpZROK6SIhRzzQXdp5pG2n6nDWjXVUsUMvOXUvinySQvSIfGOlZFpSZfLfCe5Bg
         luSftEx5B0UqLBy0ia1qb4ppVO/zoLOJ9Gmac+iQss7J4Pa+E50m1ap3yn2PnF8xfBX3
         iTMKKqMyL1QDF5HXOprv4Y/ilY5+msA/+Aa7dJOxmxpAfRjlyOb/BIKkhO1qm7FM/APA
         aLZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788205513; x=1788810313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        b=WQ0fnmqwEqXROfU23E1u3Q93KxAXTiyi/cr0TeJg7/mXcGK6G6HMN/hsUdx/MNiz0L
         BuB5RkqagR5+t2PQpsmiWGMRwCiS/i2oLJ1J/avHFhoHHuhWP1L5dVsNp1SPsqL7/i42
         a8oVmZcRK0oQVCFPlmSs8nb8ch1VkpMIqcxUq+sMKvpVG0wYn2P/Rz4YPDesPKYVUc33
         vxDaemah7xH856d6jVVZQtE+PZZxa/OofIiR/SgmShjzIov0HVLqw7Setlohzg6UAFXh
         WZ1PUyaXpPhC0Qktv0xif4c/uw6pYNaE0uCdhyNkx1zaJ9CSVsdRwlmQuH5npUjOL9Yg
         4YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205513; x=1788810313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jrv9P/AlPMD6Sdxe3mYFdYybT0kcFDapqBsc6G6VY0=;
        b=OAp/mGwAAJSGn5pWd8TIaaPzGDj4JkVzGcdjJGmyv+xjM8I/U3vm7yLeLiyZOUoDG6
         RvUaofObvfoCMhRvcUjKz5sOM/Ga2lDRtkh49GySeYnh4WoMB5jAtc+3jGE0OCKq1lKM
         +zh0YO6g0nqYeea+U7LqUUh4RcCD1SeThu4NU8zxxO5csGDaSr4HeMaHF/gyqDcE62WQ
         eYnGfjk82QJW5ZOpX8M1Stw9s20tKaXFOLQNhda8tRKZzQasF1TUNavg93RmfNYNm41p
         yC228WQ7A+lzIM8huQX/eR90pHJjJeEqgyBguehRRiiXu0Dg6x5iIrlLYVYZMi3Ir11M
         d+ag==
X-Forwarded-Encrypted: i=1; AKwUvBxy0gwfWP3vCHu2KaGLiXzwcWIeM4ZjOY+SArpcRJfdRqlGdgbXdIRstW/BdniV7vwrxzkDUdpuK7+oCfU=@vger.kernel.org
X-Gm-Message-State: AFuF++mi108VzUNe61v5u/DZ5+8HWMNwmzm/aExu9TTyPmRbPSmpe+nC
	Gw0BxokeC55zb8tsWHKmgrXqqEecJsFyg5WierLktHoYww1I9nKojQOZtDMxtx5PikSp1SU6/Cg
	M2FxE5CHRjIoSUcBAAtsSQWTPg5vbQMg=
X-Gm-Gg: AYBFou241t4N61h+owt5dOiejke11DViP12e2NRXfH6NILXNRy5tRCqTgbMrIr3Xk7v
	xhSqA9E6ZDvl7vvOScMcIDlSooZCgjbTJWC8LMi4ZQsySm0AQAOmlxB2Et8yyr2saivvv5Omkm/
	gk4gv+fSGqNEBeWudzNJOrNHiQXTPL5K5+pRiRGcbAymBtgKmn3lVOMSHXtEK7eoGXDd3+FZAFX
	CEwPMbGX8NV9GOmOC0GO+XwZG5w+A+qW2uV7yTt5Mxd34JFEXTiW9keTOkUcIgTH/7fqZRuDuQo
	JHSCFsZQSDzxiGXxgNVy1kVOEygURX8VX9fFAzL35X1AUpOEZqZCUjNSm/vHnbHlrkWSpt4ulgE
	ZZr4D6BOjJP12BCYk/pLoT28cluwHZT8STHWl+458r+T+/KDukoYLcjIrbXej
X-Received: by 2002:a17:90b:17cd:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-398bab29b39mr13817320a91.2.1788205513452; Mon, 31 Aug 2026
 12:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122444.475-1-nils.lehnen@proton.me>
In-Reply-To: <20260828122444.475-1-nils.lehnen@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 21:45:00 +0200
X-Gm-Features: AcwNN1UrGd_bZLkMVyH1G38N0kEIKnS8OgGaNrIu6lFxBJ9qf_B_KFzk1Mhm8lI
Message-ID: <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
Subject: Re: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Moritz Zielke <moritz.zielke@gmail.com>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:25=E2=80=AFPM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> Resend of Benno's patch from the Zeroable series [1], as the issue [2]
> asks; same shape as the security.rs resend Miguel confirmed today [3].
> Rebased onto rust-next: one context conflict from the
> `as_bytes_with_nul` -> `to_bytes_with_nul` rename, resolved keeping the
> current name; the change itself is Benno's, unmodified. An incremental
> defconfig build with CONFIG_RUST=3Dy passes, so `pin_init::zeroed()` is
> fine in the `const fn` context.

Looks fine, thanks!

Rob, Saravana: it would be nice to get this done, please let me know
if you prefer me to pick it up. Thanks!

Cheers,
Miguel

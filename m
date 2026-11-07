Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066179;
	b=nEUsuSjIct5V8njGuaJhoryAVBjEBfvwVSQ6z/34NfyVnUvTw+TO1NLKLbRz9kpcBj4E
	 n9GOTrdt+efutNwHwJgwK1flWTVjU+UeyHRtufvPjgR2S37rEPWSWj85k0H/D0muREhbP
	 P4Cbd9jZr+yameQEtDr302jKsS1xJa0viZHzMTpaTixtW/wYVYYBr11OWfnZ/aciNWusJ
	 EidqRtPopPkIWCTOtPawIxD+esHQpe1jsv+oT9YO0fn7LvHmPflAUaGQekkKej/L9aCNx
	 1pTAnka0Q9Lr6naMFPbFiWFZqmmTnxSnSUl6QBISTJ/gsfDUB8qa1gcUFQ7SVMCPtpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
	b=la3JLEFAgF8tbxTAr86RjFejBGXOsxDpzgBhx7B4Gm3mN1nh+mUPyDsgwwPAhXGJ8jcP
	 tkO8bA/ObddKYGzZTDk7aqi/2e/KCFdybF+WU9YArhtqOJaapgxM6li26df3v/WtVseVW
	 GYO3TQsNw81NxwqKoIvDeRaR7lkiYNBzgbYFxJtd57g0MYKrcfbnQmOVAQVA2RGnXL5y5
	 bbc6nVtgWJajt+QMHYFV8oLslQ2lHbTvgmTa0UX79qSMIS0HkMQ9aK3nzRjIHFeW0mueV
	 d/mc09Kt6m3H39O2G9L+EEVVwyV56wImwzyNe/sme7Z+FoMxqoBr2JstQmwEESY6oPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BUpFD+lj;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D9F606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BUpFD+lj
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso8739555e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066177; x=1794670977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
        b=BUpFD+ljJGVUR1eVtHIhKVAlDMZsoOZMH0wW/8CiwjbMxd3O/wYh7k4GHfUbdBbo1n
         wdyC9mp8VUUaBA/2hNLQTNrqK8qFd7p1xFZjXcaMwaK7wn8zH/YUKKqDNXug0PIEDnft
         IHUVHvCYvHHy2wX73zSNE3k7oXNjqO3xM/V643VUa2MNoaW/fvgntNaIBKRzm1WBVvJI
         0EBvhAkgOEuh2e9ikURqDaCsdn+X2FK5uSzHDn6ab8TKdVWDuh4gWWBRMqW37zsc9lCS
         hILwR41DTzGy7RHRWdGYfx+IsJhhlBhj/zYOK6moGS+o9jF+lie60n1wR1hKj9PZEZjX
         SSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066177; x=1794670977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
        b=0irmXFb/uVJk/vleWUUQj4p7uLFRijI5CEvXduxGxgGxZ9Nsqn+Sk9DRR+pPqDKXcw
         MRnl4sNMU9oKe5NBB7eUPYSV+V5EiHVa45YrNnkygqNy72UoSjapamSh2NCl0+IYDBHN
         wZW54eH7DVrB+tQceMDDMdcCLTkxNcx/LR63Fi9LstyQjtxoV45nY9JJj9puvvP1j/EU
         CPj1dj9X9N4rP9pokLBdiTKCMhFAtkZ6ONlUkJkm/Kop7d+V8Boba78PpSSD3uNmpCT1
         4Hn8MT8DOPqYQEBj/uZU+CrlV682ncJh+TbZwI1uP1gT5SGBgqjl16XzcsWxXlpP/SkK
         0Gbg==
X-Forwarded-Encrypted: i=1; AKwUvByAsTghDioW2Pl/6YOwzWqK2faEOXIYdVgU7az5tcPkEYc+oVpV0QDwn1pysEyX6Ue6H76ssHXGG94vW2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FfVvA39+EyE8RJzZ3JgsEcusJu2dJmWgiKs8oeb122+JW8XOq
	E17x18ythPnAtAgKsmBimzxX3B4M+Bu8//U40RljXIW7EPFmsGwLeSfJC5iTGxKnZ/xLePmOsbf
	lALm72k3mBpXpp45tfw==
X-Received: from wmri27-n1.prod.google.com ([2002:a05:600c:8a1b:10b0:4a3:5dec:ff72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0e:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4b6df7d4a32mr98531565e9.26.1794066177054;
 Sat, 07 Nov 2026 07:42:57 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:55 +0000
In-Reply-To: <DMOZR1THYXEZ.138HB6J6HIMFK@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-1-67de9180b4ed@nvidia.com>
 <DMOZR1THYXEZ.138HB6J6HIMFK@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154255.3547388-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 1/3] rust: use Alignment size constants
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 07, 2026 at 09:52:13PM +0900, Alexandre Courbot wrote:
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Use `SizeConstants` for Alignment that are implemented now.
> >
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Danilo, Alice: could we get an ack for the buddy and io parts, in order
> to push this series through drm-rust-next?

I'll defer to Danilo on the splitting up question. The change itself
LGTM and I'm fine with merging code related to this through
drm-rust-next.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

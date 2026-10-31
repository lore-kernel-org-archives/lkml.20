Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793474028;
	b=fngdgNvYy3cTl4d/2PnTV/q2oJZtG3yte0bxczawa+GaC7U/b0qqUERRpYcdwjR70bTE
	 +XeCC13E7nOHIEAZR8VDrUV3a/jznnRbwSpc6MHgH6y1I/Z4K0LlrY6hRYDJozC4TEVjl
	 KzWkEfb1t5Ey3Yp8uQhd74znZImTRVfr+2D4Oau2nXVHFnZwKSx8NGGtSmQLgHOvynBHV
	 KXc2wvkzIk6n0iKtXgVg+rhhFIhZMb4OXCd2I0wMigtfM0/nbW7p97GKOb1fSLoiby7Ir
	 W2BdqKQJ8JELpqxYH6sAN5JK6B9gbFTaFV7RrlV/VoOMW/PNdM+ZXzVJIjJxbFpbBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793474028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nJBv0GgW2v5Ry5/NUsW0hqijVCknn5LFKWAu/3Zahsw=;
	b=weypVc1xtbU0EYqGy19KdgjGj8UGGAxM8/lCJdpMTFGDI9/7MCcPvrQqe93Yb0nA8MDT
	 tPA1sOxKKELorwB9eRntyHRd8Ry37Ee/8ngFYNha8Jn8SH7kFJBE6AG70JfmNfOpqXznW
	 +zEe24Ea0UIwABGkxuKoozISpepZpHR/fucUvXDRD7keyHjbcOI2QdyJYbNs7c+fycuHO
	 xAI5G9aDR7OBjaVCvVXwDQ3kpplm0Pd93hdFCo+VxsGplHFh9Rxl83E0oG8tzT1xSsK2N
	 WCTcqTPfYLPFO6uMBpG4jHl22Z+u7YD4RqBUSQPDS/jsilNlEWq9IMtuQwC2F5dUtoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V0uWqi8B;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40778606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40778606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V0uWqi8B
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so16439285e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793474026; x=1794078826; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJBv0GgW2v5Ry5/NUsW0hqijVCknn5LFKWAu/3Zahsw=;
        b=V0uWqi8B7GwgqIHzrE1bRswy9+KlfjTqf31ihGHlqT0zNVj8T16xGnm6OEIffSkW7j
         yyZP6dlXtLjJks1TX63RQNSRdIAKhNoELH34vnEkjeHApzAEZjbxDPu87CEdi+2AF+9l
         1Iz19fD7H3/7zQ215YAZAsIJ2MyDbLD3SnOKFszATJoHhuKiR7ydA6LPx3abH5DzHQdw
         EaaEQM7puBPZgpydvqnV0scM8XlRQWp9whAl4pGyBxl/JQJS7TQoPNMRJS61C3XXu5Ga
         HnltfeuFgKZJhGfnPvKOXN5cVHz97iJibdtruLRQEy76vXaRlj0CBUyvDTaVR8IUiWrW
         hVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793474026; x=1794078826;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBv0GgW2v5Ry5/NUsW0hqijVCknn5LFKWAu/3Zahsw=;
        b=kR2WmvxoHeutPTJ//XgF0E068bR2UWxnf/bwFC7ttElpw8BXK+jD4EZMeTFXtWrLdB
         iBsiJatDDruel2XR5JW06t9UjI/4e6Bs6ejtXtJJ0dieztpLEOToe8dw86hzDsn8/qki
         tlYaq0T5cTmYq7MPTJBwvCsY3k6ZhovJXkkpubYrj7+fXlIiuqLNUwttpjmAcnSF/NMw
         yK3JIXG3wrOuY/5l3bpOWp6i8aXPfpnvgqvJy/OpCWDPJpyn8gSAWnQP3jCmtn6V3WAu
         4BJq9TLsrySyLyuYpoNWcOKLT48v71k7fyVIF5ME7mDb43n3I+whbxUTidoWN76c7Zkz
         /32w==
X-Forwarded-Encrypted: i=1; AKwUvBwaoi6J/r+GzaHy6q1HCco4aMPCD693TegMddrkc0RMWoNrQuFv8Bp/b+UiW9FHwEmhm1EFKnN+z1CEkck=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/Od/VXG4fkl7FAM4U5byfCnDTVnMDxsUsP9lkM12D8EJlnbdm
	HTMB6U96u5zQzpZUkv8YU9Qi5nm8+DBNqnZpp9DfBiDN0jyqFAsZRZmiN9inLywDdpang4oh6gw
	LrhLYsaFdkLTAq6cjUw==
X-Received: from wmxa5-n2.prod.google.com ([2002:a05:600d:6445:20b0:4a2:18:cfee])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr134595615e9.15.1793474025531;
 Sat, 31 Oct 2026 12:13:45 -0700 (PDT)
Date: Sat, 31 Oct 2026 19:13:44 +0000
In-Reply-To: <20261022160725.2215244-2-phasta@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022160725.2215244-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261031191344.2913779-1-aliceryhl@google.com>
Subject: Re: [PATCH v4] rust: sync: Accept errors for Lock payload data
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2026 at 06:07:26PM +0200, Philipp Stanner wrote:
> The `Lock` baseclass currently does not allow for fallible user-data.
> This can cause conflicts when used with other primitives, for example
> when a lock shall be pin-initialized with payload data that is fallible.
> 
> Add support for the lock base class so that it works with
> try_pin_init!(). Adjust spinlock and mutex accordingly.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Boqun, are you ok with merging this through drm-rust-next for JobQueue, once
we get Gary's reviewed-by?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

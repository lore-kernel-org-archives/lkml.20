Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925010;
	b=uC9aD27tKzqhMNzdbT5hRiy1ogDFmk0uzDVMR78RQqxDvNb1GK20H7c/7wTmlkWi1h0p
	 dBgnXj9w4yCaulMx+ZQhTEPuGMNtBXxZBcubrWSFHinwsSNsukQMrjFabsoZ9wvSLxe0X
	 YcREJ2ved59DasZu9FWZmR2wvJcUhZcQYLfrzMD2/tcMxn3gcuHor61HGdYFz9GErfIAn
	 Q0ib6SIOazRtK7d3qdUjBDxOZlofPMXfaozDPJH5NLaunels0sAi2p8OkvUzBBNLNOizG
	 ByphjMiv6EQWCuc2NYIr231kuqUD2bFyVV9beYFmplBVNyRm9p1tHC+d1dgK8TMTOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nMzWFwI+mak9azVtEmWBpgG0qWEbzbvHkoZAECXYtcM=;
	b=KyqLduoOWFR/zLH5Xk5Kf7mhAK2q1U6YUQ+pMVenP6yENEXfnrjNIwuTIZQjaxrxgZ8d
	 r9y/zJrDjGed5FEvQkcK6Poear3s1xfoiNEQMA6ZriesUFJWLM3HrruVziw3rXhZ/rB7o
	 WnXaLYPCzoU+xgn58JmLPOaTna8ZwHtqWREO8COOnO2tPMwmScN2M88jzyvJd8qBCJGys
	 kd8iUyaF3H5lvLFbLOkoVHR4hN6RiZbVCgeFkMCTDGvBExxtVhl1zFdXJaWirkiHFuwn6
	 AdGQiGr0Gez1gfJB4cWzMGTP8PQwfkTArZkQSqZUipNJ/+L/ABphtnDzT6PQ2Mm29Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hLqTISRn;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71136606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71136606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hLqTISRn
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso25847945e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925009; x=1795529809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMzWFwI+mak9azVtEmWBpgG0qWEbzbvHkoZAECXYtcM=;
        b=hLqTISRniY9yydJfP3sMzv9cKRy+pP1oJ86DI8bpQlkHnwqz71bHUa5wiz5rRHMeRH
         My4jDcmSvEGM1Kr/gRkutW6QgNpsIOK8TKajxEZHRfhxqDbglNHVBUMp7a8okF7jbWWY
         X+XqMq9NLFXM3aM4dUX9JllbHANeNKtN800teJk4u09Lyeq/YUmC1t3i/dNFPd+xOlBe
         XZ5X+fNfOczVLoq5QiNLR+/s5V1X+vVwyr6YOiARNhInnAEb0j8GX2AH1uTPtrS7IC/+
         Lw9Qvxd5steHBHpnKWQ/k6NQtCQmlqxYpEr3SZ70b+A/NCzKnIY8tNwHeE+mfEKGlW5k
         AZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925009; x=1795529809;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMzWFwI+mak9azVtEmWBpgG0qWEbzbvHkoZAECXYtcM=;
        b=ycqQbTrUSSfQkDDedI9Jc3eowHUMSgKjktRvju8LkH68js4bLxv7Iie68VEgWkwoFv
         DdvNutakLXaAFpILa9bw7BjYbl5/nZ1dRREVf5Bz4pSwbK1C58GRhpBotpbGP8dS/hF7
         59ipXYFoJUXVpKWmFIa6S0zzynzzK6XOIkuW0a8D95JzNG7//LtoumDNfTXZ0tL/KPyi
         FcHqNe57KWzy62WLGKywBqfZgARv30CCazqXRM0dPTMj187pebbQ35QNnBFgN4hR6Hjo
         pNnEP0qcHuxsfci/pJA7y1f04SQEBKbIwWmiw3WxIr8JWlO+i/dR8ZPaQBxnn9ecdgOz
         dlJA==
X-Forwarded-Encrypted: i=1; AL+hErGY/rXkF8nH2qgGWGARiQrQtpv727YhR+QZGeAzMj8L7R9bXKyUc5IVLU23flQsS5CXmlZyWPJgj1GKtE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iqomXAKEFxHj3uRz65OoAv6ZW7HRnYc7kNQGi4L19d/yv7OjH
	mj3kZX2G/nil5tOg4NYPjKY9y71TdlJM7wui7GEOgQm3GeFqm86qWzUo2YgeXO3XTUCw3SbKg+c
	FvZtWaTipt0S5p2Y5Gg==
X-Received: from wmbjw8.prod.google.com ([2002:a05:600c:5748:b0:4bb:5e69:8177])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d91:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb68718fa0mr190371815e9.23.1794925008479;
 Tue, 17 Nov 2026 06:16:48 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:46 +0000
In-Reply-To: <20261117001507.1611984-2-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141646.2991752-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 1/5] rust: task: add safe schedule_timeout() wrapper
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 01:14:42AM +0100, Danilo Krummrich wrote:
> Add a safe wrapper around schedule_timeout() that takes and returns
> Delta<Jiffy>, treating negative durations as zero.
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

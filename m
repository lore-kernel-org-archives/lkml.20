Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483321;
	b=RaApkmmzF3J8jnOe8InhzqhmRXI0JcaC8Z9Y38z9moxfI8pblN4YRlQOgIy9lw9EvycW
	 Ca/yZmywI4+I3lv7Hq8tWdQg2C8MQwfC/CqTAsjfg2JQDaXVOoOH8DlQDlK1DOPsJzkHT
	 zDOWLH6g70Mfoe/1OJzU6XI3GGMMF7LYXOu8lRmLHCnEfwOr41rgWSKwZqIMOhgbKUtlQ
	 Qg3Ch4EFlFlzG9BlTT8KHSqYB4L9KPknHltxDce8ZdkiAdDAvpzHko1QMJW/5pd7Pv04B
	 ViA3Auw9ewHZvHItZaXqRoLX6HFmK/VnsgD7ScZOAhN0Uu4sWPb5qGuZbjgs2Dhfsog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=a5szgawaqFYahDoR6WgawlMOYcIGKmjMs7XIVNwb/WA=;
	b=ZqIYgLljdrQuw8AGmEhskgs0yMmDmqrhQKd8fe03sEQWxFuoSA6CfjS5fdtzMlJOSvrJ
	 vO4BQJTMxty8Zdonmr0dUe0hZ/x14BT2Y5VICr9NAIBLaPhcuVpcW2YUCdgt4WTGM8LWZ
	 O4+GxVLvCdPlYAoKSUEoRr2uQF4ZHxx+Nuf71albPKPtwJw24SoWV3ZZZrwyjCEiDkpYX
	 ssnpr99AuLBRnho0iv9Pyq63FNu1V/7zsOfxsqW5SpjHmXMzrVqPazmHPN5FGG43zL2uz
	 8vonOgsG99rOAyf+1Ncp2YlGIVTC8YFMWmKh42BieGrPECk3Ti56N9e8zs1Pt6Q/img==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bTSzKRuQ;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FD8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bTSzKRuQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1e3efca9aso22731595e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483319; x=1793088119; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5szgawaqFYahDoR6WgawlMOYcIGKmjMs7XIVNwb/WA=;
        b=bTSzKRuQMaj/nUNDQiFNgbMW7VY0cz1uEsSS9LODUy0rJpJ1NcOHZpuiEdx+Pv7xXw
         JrElKjWS5h1Lp2Uz3pS/CT+/pMYXJRqTXssYsJ7wjI7R7X+qG5ciwO4xiqCQUSzcglif
         ydTELKHh+OttyFrwibpJMAdhiLwYxHPYxrOaDQgWDiZIN6J5xE/hMbtGsHcVHfYey0kv
         ZRep3ZCoqCKoD/5J7rRIsh1Xy66FLIzjyemzZWLRrsQi/OnYXLY5je/W00I2AzK5MvhY
         l5DRfcCp5zVSKq3pYqc8MEvHQKEgrjnPSD/02FuqoUXaB862DgHjp78dvjw5ER/PTxC6
         4Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483319; x=1793088119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5szgawaqFYahDoR6WgawlMOYcIGKmjMs7XIVNwb/WA=;
        b=UubeCmXKZzzPggH0DAsSOHOPKPFgsaSJvuv1UiEhn4zSwbE8ELDittyYusYXmSXWl+
         YKGmRygO+DC+zFpWIpAbHcHo+fR03NqkVoEtr6NLia+AZSXrNG7GqY3Abej2V3+rI0Yz
         4ge5ICb6i3S7jjsFBoFs/WkLM8EOnhJWfWMpaewRVif3qsqZx1hihWYQFrISm33a2wjb
         rAB3DzgQfXB3JkOGvJHQW1XHO/Fb+XPgY+p7KhRkz0ZG4LmCEFPRRkNMyNpQXPY/TQdw
         0GhUGXGLY8xzqotbqmmjA8QOPCTAQDxedTq1/xAByA2B5NhmJpOyiP9XBeZFYsRK9jG1
         2nAw==
X-Forwarded-Encrypted: i=1; AKwUvBz0aaw11/xJdxx4YZEIjg6k1oImiipbNt2eu+syqvy/qlJH+RbfDQ2k6tQBI+Fry508JJga7iafeER/Kc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKswfpzGZm+RzcbxqPGjyx3SoTxOaySCYnoirQQiI9Xz0P/faPx
	TFplDrXelfZzzEwLm/5vuWoWps/f/MrETOiQJm8fUEKDc0DZyoa4ubSpiJxtF9BNNVVfJpMhWrs
	yp6s05vWpOmO1emdlmw==
X-Received: from wmcu7.prod.google.com ([2002:a7b:c047:0:b0:4a1:f37f:7f0b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:638e:b0:4a1:e6ad:baa3 with SMTP id 5b1f17b1804b1-4a1e6adbbe4mr113338955e9.15.1792483319125;
 Tue, 20 Oct 2026 01:01:59 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:01:46 +0000
In-Reply-To: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020080147.1743459-1-aliceryhl@google.com>
Subject: Re: [PATCH 0/7] rust: io: add read-only and write-only views and registers
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?utf-8?q?Krzysztof_Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2026 at 04:19:40PM -0300, Daniel Almeida wrote:
> This series adds read-only and write-only I/O views, and the #[ro]
> and #[wo] attributes to register!. An access in the wrong direction
> then does not compile.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I heard a suggestion that it'd be better to drop the Io from these trait
names so they are just Readable and Writable, because not all
implementations do IO (i.e. if it's SysMem it's arguably not IO). Not
super important to me, though.

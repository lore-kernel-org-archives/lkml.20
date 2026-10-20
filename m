Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520291;
	b=AJYp4iA2s/GP3mX6pbR6xbQQW+fHmh3WCfThL99wAU9RkgIqGdKbiyg4Sp8hcl26yTN9
	 ryLD3UzwoER2D1juBDbKxMDsZu4jb3b01QQP6Cw3mlF95LnUoh5nRgU9YdBoJh46Sal0x
	 /ZGygqnSWh9uQS57ahaZ4+T0NHUgaDCYEAfTwDjmz4ObhudAJ7jrIJqhmkvonpNTpQJ6a
	 KUYX8cqBgr3KMYS4QzLI9f7te3DTVKBx1mQGywr5whyOa85JXJ8r9pkJQCaacO/apy8rD
	 hXLgW9ttkJwXTJG+xa26II+oY5v8uEYIXkl/O5HPx/NikYtI8MDErxVehMZBajECTjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
	b=m3JEQD+UIJHZ/GgQrKXL914h7Z8M0pQw+7V/z2QHAc2TNF+MN10EmxYDKylvtZmYCELF
	 2yyEC+4WgV2jM5qZZ//W1smFXGv3qU3hhbYRUAEmryvuklaVTYGcCgcOmiCiQ6AWeSH4i
	 lQIp4D/oto4G41Y05qWNjBt+WHrCvIUADSv5UOH95+ogvt+KB6RT+ff/L94NigFvzFsWl
	 8BVOYg7cg2oXsanJbVKtGTdIo0nh8T4dFgbWeI0KAkC7KHWoQBBFWXG7phOjlf1woKCP9
	 F7NcJzA23AwVTy2A8tNDPBlVmaoA0jJ/NfJk4XNyYgeq4oZ5esFgupqax9c9SuQY0gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sS0rEHMQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72287606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72287606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sS0rEHMQ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bb5afa736so426639eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520290; cv=none;
        d=google.com; s=arc-20260327;
        b=d57vwyAoFsBGEsBkATKnzqxiRED9kZ/ipoTiUMUJx6iDfn1NlX2t1X0eJF/2SqP7dz
         V2ZKMoNa2NzZqD3njlyZaM5DKZxhApRJHm3hDHlhQxf+xInAfvFZ8xgmgj5lAuGVkQwJ
         Bv/T5vn2zTUtJ6R9LexwFlymZUei+uLNzYzUEjKBVjS/6Asrjg2Cy69GAhw4Am6OMbDW
         9m/I/zLAnBm5e9uskVP8WXRnjYHFpFl7A1OKygca7CRbQL4z6Y437fbuQi9Z/w2FmRi3
         EGRNALyJGtZ9S+r+lg3AVs/I+vxTZJf/mtDni+Rz0XArvTX5My2+UpyguCnsEvLaHDfS
         wF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        fh=Z4UUriMznPrRhVsX88JVxwlNETUqoVeL7yfnABLGN2U=;
        b=LwQJLiUT8K2w3x+W23vhzl23wZbc1gh5ZvnD/pL9Ssofjg4W76ytSYfv8cx9gE8NN9
         KCZ55hqnKk5RzYkbbiOFXHs1Yd9taxw1j0XBhhpD4BmSsL/1yIaj3ZKMoFcyrYey5oET
         NNiMd0eZbtuEonkRuCPINAQaBAT5n3A2W3v3rK0f4UrYlcOuqhd+rtaveNCGHvIAnlfO
         BtgSANhScvJX6bfqs8pynKzCqFSj414RLszwMXCW54NX+skl9EfEa2V50w69z8a/IlGd
         pQX5NWb1ayrG4DLjfpgx/IHFcbfo8tWU5KG9wZqJBMzEMmZpc5qDgVYYJdpoPH4DLgFi
         ldWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520290; x=1793125090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        b=sS0rEHMQueJQYyftG6RUDVM6qKSJEAc2p7nHAsYfeuZRO/4RAk2YGU0Nemc2ZEWGqk
         rdfxdujW1ntn/hMOBgwbrPy6mQlkhq1c9KekbTB6D+YDJS7I24/vu1LUbndc8QdfNHLZ
         pFu96Mqwiu5Ed9yFVcp6mUEnKfvcoT+XcDvNGI7EgGDYoEh9cy7Yuon+SPf7OLt1lXis
         6lKU/5AJ5phIdQVOpdOssLd70IRaCSVm3T4ylaTSSl17+HtJ9FnpyktqXluTvdKBcX2K
         HVsxFZlzRd1JUI33zwDXSWf6Xp74k/J+YSHJUqrmHqAd77JDresFViPQebmwhrPjo8yU
         j77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520290; x=1793125090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        b=L8G+VNHeEwh9eRxOTvAWbquLbWcjood2Ow4+LebRZVjPS76bwisFN/dcWVXBSE0yea
         7OkjKYPI/KjMDg36ehIN7NABIgaf01whDrqZeNJSHZpZazx4vVEk2JXVGu8XtoZKcpyM
         jGuTSdRy7xs9rFsLtmjZB+NMxgXJ3oYGScSXJqLsL3zc5NXUz+ko5rKD/nW0SE4cSe9y
         e3aOyvAm9dlUSRkcnwQWXCmoH6q4S8YAMq5msoUsEqbhFO84/Ek1QyMWrhVcex6frtDh
         9EpzPWa6V1pZY26Z5eMu1mAEiaWmtO7JH0zYKWxbD9zaEXa7/hsk1mJJ/KgpkI8KMm4/
         pqBg==
X-Forwarded-Encrypted: i=1; AKwUvBzQRbokB6V/esPYzJAI/V6SXUbNERuDU99o8GVeb4jIgOxJCRXcodfN0WIhF+DE3CmeSi+C9m8ri6SjYLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMt9ByJPnURhm/QoEhQqf00/PoO6x5dyDpl3kGgo5u4ZcLHfWG
	ESLzoe9EMPi3Xu/rKl80pOYEErYbj71UKkTp+SJs7NkRVC+nqkWPt7skjaYsR6geQ2wp3opPAIK
	Kvgp8moan4VqLu8+cBbYAIeoDYLhvlHU=
X-Gm-Gg: AYBFou3/SWctidNI2j1sJrQmktRUR8o2o1IEEwgbM6HSO+b6SCNNUp6TfNuB5idTot8
	i/WP/JeoSybnu30bNo1rJpiKg1L4B2wLa9DZ8d6TUXSwpzUMmVSvnIITk7J3xiZeRBaUXXAHkAf
	yKPZcL/2dwNw9nwa04eipgL977SwaBIOwmTgCAfu0lxULucvKIZkhxHjcRpbycmRVINpOpEfByy
	KsJCyfjou/c/zfmOMu8AebuGR6YUTeUutrD5HhnPDNY4N8uyDYVmUtrWpBBBbCRPzYUGJlnm2zm
	YqLUBQi2FUoCwzCDtqS74O9KeNhNWO+ewGJ8uO7eP3dUXUNmlunInv1o633uOeBcq8IrutSroNu
	yjSOqnjcXyWI4474yrCCAktkiCNsO/5vaQ+kVoiFdEddovPRuQknkQOjiR3GauwpNzldZHZA7HP
	O6qRk0kKWq8up6gv4a2ZJ4uX3RC2DH8V7aXb8rL/CsxYX+otg5GLJ8deeaR8FFcqgZrz+JkzYhG
	VAB3/HI7TLiAkKUEe7N+2pTt8I1VDAPWlmXOIkhaAX9yByUfWTkIRCkew==
X-Received: by 2002:a05:693c:2a18:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-3674d349c2amr90750eec.1.1792520290085; Tue, 20 Oct 2026
 11:18:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 20:17:57 +0200
X-Gm-Features: AclHuK8Pt7FrY_kqpDoLQTxwm1rIv4S-Fph5tTJSHjNrWvcTVOiO4UpxaONIOSc
Message-ID: <CANiq72=-rg_nYHCn_DPczQ0tNZN-27TVyvoC_QvYbMZkAgAQOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
To: Sami Tolvanen <samitolvanen@google.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
>
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
>
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Andreas: with your Acked-by I can take this into `rust-fixes`.

Cheers,
Miguel

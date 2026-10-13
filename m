Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE251991F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897305; cv=none; b=sqpVTczruNnomVRJMV+3VR46GTMJAzF/6TPJaWtcIAcgHYquliXVeBAud5MFvqsCJxOLsBru95XZV3/J6GzxL6BLAAdNVgez9MexKm5zinaiiAUU54fT7cAdbro77dxXi6aUwUvr0bSvfVTFtiEslAsSvGv8S+49VIYw5SmFPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897305; c=relaxed/simple;
	bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Sn1JujMzQlGQU1LJIL6ChHmVw0uRBRXRab+wAtboODVqAwDNb/tbyuy8b25Q/b6JYTA3BE7CL3WWvq+uFtBLlCm9JKvied7aalw0k4sAIbtD5TxNL3xEhtifj+3+rXg5aV6DWId5bB9juQYKjBXusDFOLHIbmHRiDhHfxvtC758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPLqu/+7; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPLqu/+7"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c6e6822b11so798902137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897303; x=1792502103; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
        b=FPLqu/+7aQFRel3lANPVYVO8kML/ngLiwPn/7YgcNBBVGWfN298UHU1b/Oz1DWzT0/
         OssUVyJsBAgnl6xFP6SGQ31aazTAJiU4EuF8rjROKQh2NrwdeBty3W0XExr8oCNC07z+
         9Ez3XZo4XhUI1AQ74I8AR3miNGg1FpoIurXb+lnpZHZG3ruzdE7Rsb3G2yJXlHet3muG
         BPFDXozCFfhK7iYd9dKaUs+6SolmOcQZRBejUnPfa1S71wa5qv7NF0/Hm7gZgxDfwOKB
         7T/4/xNfGJtfLS7h4w67GG5FaOjBg5TveoN9BJI9w6BuDCD2LhGgo7kY+XENS1DS9sS/
         3Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897303; x=1792502103;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
        b=PPdP6HfzxiLNpIErbx0edQk4bNvP81E/IO2o/jERhyleSMLlKA+MNqAoelFmfi1/eU
         V82bTYxbSqtyhbaKtOHufRtsWZaNp5OJWmqaIVqjP1EKoKbxKX0lpebQeFw/QTNRmSkb
         qUuP8PcvPg9XRYcA4PGkGY6qoKwopFafPtiprc7t5aX1rMLxmfkp7M/xgnX1OM+mkutI
         m89pZVwGxoy4YmqelKbNFOfhqffPXTmhv7tA46iO4kOYq2R/tNfFab+lBinaPi/9152A
         vWf4OlfzMNiQ+7nuChu8/7ZwjlLpeD+0+bmynRsqMS06XwDGD8IEqU9kqihDET694K1E
         8KcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEQBAKYvxzuki29eUO/AA0PUCkBJP8d6W42qsVtxFLLynbmLl40urRhh6PSZMlW2c5Z+SNSGNv1CFPpUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIJrL3Sdve7T6RF5NNWgwmTg8sISBEHTeJM6VOsfkzaDRRtmLV
	oJMuUwILYfg2oWD66yGmYPkYzQYVIU8btyb5hS7o8cRJALQpvzSEuhE=
X-Gm-Gg: AYBFou1QzU7Ln3KHOLC7JWZADo0FWqZp1sost9u8/R/myYet8pIv0hGFrnw3rxBUVz3
	fj73UN95vKLJoQfYTT1jkJB4nuDskTjKweg+bTCmzuK8rrAx/9F9UvL6HaWbzGOjz3bjeIz7mah
	WY5tO/g/tElrrQ3o810tbvcdCzGeS50V+Jk0vuSXxYrGqOW1RuHW843KVFsYR3B9d4oVCjBPxJ+
	B0KsislPuaWwGSZe+QludbWVkbUmeA4Z8EyaGSQw3tQVhcpi5km4GLHMYOdloKASCJpiPwIbbMV
	r6A7ldMr6WpXebOxkheK6zu9qligAQUGHA90wTGSLqnLIkq8UIQhufA/OJP1ss/E23EY8RqORAq
	jkAMsaZswllnwEgn6o/YtxTpeGLYCRfz7Hh/jt+cpso+glLGPwFXqQ4QRuQpADj5bqtlB1jvKfe
	uiCdHfk/2dCJORLbxHmPBJcITn6dJKFIktvw9+nrtMmND5t+4czAXA4CpMgoPVet4+Ch5Qbm3dM
	bFUJy3qrikutLiPUbFdSpy6SJZ+DUJrRg==
X-Received: by 2002:a05:6102:441f:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7cb37a04f94mr2579211137.33.1791897302771;
        Tue, 13 Oct 2026 06:15:02 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3539092esm8734108137.3.2026.10.13.06.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:14:55 -0300
Message-Id: <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
Subject: Re: [PATCH v2] i2c: rust: avoid locking when performing
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Igor Korotin" <igor.korotin@linux.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Jori Koolstra" <jkoolstra@xs4all.nl>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 "Sashiko" <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260904134600.340991-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260904134600.340991-1-nico.antinori.7@gmail.com>

Hello,

On Fri Sep 4, 2026 at 10:44 AM -03, Nicol=C3=A1s Antinori wrote:
> The current implementation of `<I2cAdapter as
> AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
> to increment module and device counters. This function acquires a lock,
> looks for the adapter in the IDR table, and, if found, increments the
> named counters before returning the adapter.
>
> In the Rust API, the `I2cAdapter::get` method returns an
> `ARef<I2cAdapter>` upon success. Incrementing this reference count in an
> atomic context (for example, via `ARef::clone`, which relies on
> `AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to
> the mutex locking inside `i2c_get_adapter`.
>
> Since cloning an `ARef` implies we already hold a valid reference to the
> adapter, the IDR table lookup and its associated lock are unnecessary.
>
> The fix consists of bypassing `i2c_get_adapter` and instead calling
> `__i2c_adapter_get` directly to increment the counters.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antino=
ri.7@gmail.com
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Following up on this patch. Please let me know if you have any feedback
or if any changes are needed!

Regards,
Nicol=C3=A1s=20

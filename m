Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180935;
	b=2hCreQg2ozUToaTgAkzVGXqfIMgMu0oARZ+BvuBQfPwVuHxXlfXCj37uTDYDEfli8Vwr
	 GsGJI5wNxyLoZqYJs/w3m/5t8Rjq30VJ8c8gRjxhWdk0lGv5bBJH5xMk67QPvzZlmvakU
	 nVPUJuEqKHtcXDMF1Xr+NaZjPsvcrG8+wsAc54k1sCeUPbE9uu0J+DE7kZACIUtgI/Vc5
	 MaJjxKnXmTOE3M3kiluLfCsnwI03trLCANcc4QLmXpd6q45T3BxdglF577vA5kbOMAH5q
	 FKZscLAAZ/WtRfszEwMM1MwFygi1zvQfYKB8GxArQJWqWbAciHGZraQX7BiG20sRQHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
	b=xLmQoCD4JE/w+4KhO8oqpPl9C1jdSWbshw/FU+5EgodHlBTmDiBE8s+fZWz8O66Vrby1
	 GXYndAeYDvH3tH6j9Od/eqwQ94C9bCQWxliQccmHxZ1uTn0BBRujv0HND0IYkA+u/zqBN
	 Klnv/znv2rg1byDMxKV+s1ww2h8mGxiMa8CPY8JANR7khLto7k8pmJaGKq6hnXPgTZnFJ
	 Xol6w8CFiJm0aoO5S1Lah1n/XkfaGRChMKb4Ilm+Oiw+wd0BsPZ6bfnGVQNTxmAkDZ5hd
	 8ZNWmqBQfEQ7OdItLcQWTi6ol6kHoqplp39Kra+ekJvod6Y8VA6vBFUqnmXx1cJQS5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vui6KWrO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FDC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vui6KWrO
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1368025a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180933; cv=none;
        d=google.com; s=arc-20260327;
        b=hE7kuJePxlE40aCJE4cvR7wF8zu0tYUVGpeQ4o0JZ43YFDISwfoIRhCYCtzTvP+nMd
         anS5AUrAe5SG0yHqAcEpSdRJJFtAq5o69aofRlgo+6tRTLQAea+3op4drK2aQxaCGN3M
         LmRJVKE5irwJ5Nl6R//R4Rjara3L5BVdmLnDmRdStR1C8D2WxKofdig/HYG0qRv8gHqa
         qgKrMyN0sSNnOilrtBTuC0hcfhDqyeSpuapcQ2JNBq667AxMGY7pgfjRQUWiPOltyqb0
         GSzwnjQhjAxn1xMxfq5nX01DFWhL8H4CRAuV8AOHR0ddGFg6nEVsdbJ0IjgkKhW1MjsO
         QWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        fh=CLL+mo6BOupS6wnOt5aCk/MHaeqvoRV5IHcIlSXnLC4=;
        b=cMkfztXVCjUsutBY4N3D4piUX0QeO1ujF4ZfdN0xnsCVXMEOjbEX3xp1TxD31NM95P
         BxRPYVWBAyzlQyZbfkvwMnfBdttD29JXfzRaseBApYLT1TQ76g65dBAQXyETFMcQoFx5
         q8QB87HdaeIVxTVnoRa46GlQ3PcRfSsVwdjerVrwBGY37E5gNcRHgk0nPDhACHjpxLr2
         1yq1gBw0bh5zuNsaLr/EKw1vFYHrC8XkrXydXBywVfj5TPTjKCGG6Ze9jA//jvdznOX1
         DHzmOKLtAVOBikLHzaLce41v7/+CYxfm+HI17pxxQAhqZBI618OYBfNJP/+TpmN+HG8t
         FGRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180933; x=1793785733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=Vui6KWrO4M0VRNK72Uu/n41uCoswnoTt+s/4QwFSHl7/x7Wwr/LrY3N3cJToCeeoXM
         gjMWLp2yO7pfatfowW3ZvCHPPtkx/53S/09OAgySOYQqlj1GHNRXmPOsjzGdOwkPRw08
         1/E93mARaaQYA60m0E0r3++wEApoTDg4hisWLVZFMzjrGhx6r5bLTJP/d/9noXhRolUh
         YG+kLrJQW9QXS0gd34x62/dM+7wa+NmCevHYC/qS7YEKyxS+fAE1T4fKnUnN/erff9tG
         OvbCtkvj0vDFGT0GdrFXaN8Mc+wQG9Gu3QDE89h3/4MLK25Lx6K4CEO1axqBDwDqaSmX
         AW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180933; x=1793785733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=KOY5uRhJAoFQk/8bxfzCcsm5PPUO+n2OqF7jIFJ8+z0LxM7ix8TaFVSqsTW0YGkmeD
         1NfsQNVjTrRdi6mLrd36N3ijIWmhS1BTGdYAsv+lIHEygcTEW6YieTeCya3fx1WMmeyy
         JICLEbC9BPCM5dwX3pvnyfmzuxm/FmhG8mwvx+znx61aqeW3IjXq3oQmOm5UlIkHKTBS
         ouj9YBADJ4x7UBhePtk0DP0gHtAtVN075IoMJYeGeAEaLPKJMpWkLqb3jd0rQqO4jc0S
         Ua0b0/W9K6OiWgLnmYEr+csjGSsVXjQQYN/OShVpRL9zyzXEea+jxSUmmlxqFSnNaLWF
         H0HA==
X-Forwarded-Encrypted: i=1; AKwUvBwWwlaP37YefKH9bA45uglFhyHRHZny3bGxxaCROaXaKnIL8Yn2UolHmoIgWQG2iACe61vFtSM4y3RiEDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI//qunZNVyzWd3kb5O7oNOWouQ7D45sdbOhUkGvyi3A+HQQwAh
	ZKhXYcT6UKoDdYOBNG9HhgsER6cG4xzVLx4ZxJdGA7NQJmUquPfSFi3HULBMlC5/hOtceJPUfl7
	zpc8nu/EIBAvagW+fMGMElHUzOpBjq+0=
X-Gm-Gg: AYBFou3M5NCMQNlWOqtH9zPsSQBNG2IOo2T4M+olOGdwX6gYL7xzF92BlOMZUuIYw2N
	NKUoqte8CGbGOwSpIERuOr6zen816oxFH5FiJjugQJpJdnLHOf0LAL1ZmWMY4if1FvL0wqViypG
	ilqHDDhe8MGMhX5t9j/MPh2PqoTv6REq8fpkHj3ZGmD4rgNG1cUGE0MTu+Yw/6gbvdwGdsWUPzF
	W5nQupPYGyzMTEIQb04hycro5Lvc2//E6wEXzeV1+e6c1N5aoFzBOipie6FU1rG59OgqzJRpXIv
	xJR6g36qz/PXJUjlnLKKD5+/hZIR6FN5aEIFnWyvRrXGttHsx0UGlGYajP9jpn7Gd9bNB5ukx0D
	44IG1PZ20zojHs01X09C0bufsQDI5nQIyK3ZLBWkrNxMtcg9I71NdTF7Ulrv75DZqBgOZXnQ1WC
	yIjvhZzBt6BHAK41Yq55o/p5UZCuUOUZLxFNmjR9BwRJmbLk1AWOS/QAzFZZp3NqRtlAma7IH3G
	/jgGj4wHiYn3AXE4K5SELOQ1w==
X-Received: by 2002:a17:907:a893:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c49bdf394e6mr156034066b.17.1793180933042; Wed, 28 Oct 2026
 02:48:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
In-Reply-To: <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:48:16 +0200
X-Gm-Features: AclHuK9bqVSr5ebQZT2ja4gGk1wmv0GUJ0T7y7aJfJNVsg1OI_1bv2lVUKDS3Hk
Message-ID: <CAHp75VfJ-L5ELAttN+Fz_Co2E1KHumwLZAEMXFMhRubzgVLqug@mail.gmail.com>
Subject: Re: [PATCH 02/10] string: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

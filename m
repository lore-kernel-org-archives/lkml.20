Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316129;
	b=lnH6S3PLtEE/JjFfOWShnnAFp/LjlhtxezbgZuyqmyGMPG4Bn+et+WPazERI+ShNJSp1
	 0xi1RSrwnipgcyA2K8EUSU794AW9vhs2nBzHdu5/scoSKCLpXmhqocIHWBnuLGPcQjhOH
	 m40WnMyWUT7JldTCUzarLCixQ3rGw4Y3udV7NmqgpEQ6JipLtxk7UeABQaGEIh6XdvXsp
	 SNLAgm31Cx/1VzkQJKkDYG0b4f3kOnYQaI9eYBZW5TLYDjMQ9Gcsiu0qqW4uCbhuFQcQ4
	 P/jpw69t7UEDZNm03VhIasvfXqR3A47DNjvdZYyk+y+GtRXxjoR9iyCkjMx1huZxf8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
	b=QWF/ps3y3mBf+hmtOQHoovvKsNuy5jfSFdgceUUj5I3QM4czK8c3WlDajTbpoyFZFUuA
	 vB+5KEXoQy/ira1vYLLabtSBYAwa+mS5dC/wju/TSe7h6M9w2j/5VwIUJgH81UF2rjNJg
	 1xCmjAzKq0cUea2Rebk2Ojwx9lrvKG+uwzocprVCIscjDheb+BSkFTIsHCFHAM2tdRzrR
	 jFGIot6wMPGhMNbd/kS8BW+1k7k6xuFohpA+ITXYKUFtnrSVYTglKRn9COiWmt9NcNvSo
	 ok5/xr1vUR2UOdSH7GSjHToSDlHBcswT3t7xQIX8EB9seIpACFi4RiWEuZK43kK5DUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVrT8KBO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C6606A749
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79C6606A749
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVrT8KBO
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e90071735so332106eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794316128; cv=none;
        d=google.com; s=arc-20260327;
        b=SOpszzuncClpPNNV4XTGYNF0MvjE+v/nZdn2XNycCovvnc9oMdMBl0HuHN+bfz71yA
         bwckVM+OuVrbw6BDA87mFcAuTnyeJ/9Yhn83IAqSlSoj6E1mazsjnfcXI+7CwOkhpbKH
         pd36Viog75R1PGKy/adUb4pZWY+ksFwSz6r5donWamRBKMHiSs6wQtEMASDH3qljhh0N
         ftMY0kd01IaXPV1EYRyoOrl4YqbfVLYKlgkKgdB7P8ZTIOFA3FaZyKkKeNLO9GiHhdZL
         EyQ/Ka5+bWkXqK8ODo4AduAwODhBe6dJI+ED+2Lgn8McxbT3gRZBM1ddNDVhDQMIslc3
         BF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
        fh=DHljwFALkA0SGnIEs1oKX7w+6YuwNUhrtMd+jQL0BfI=;
        b=f8StkGepeO9JhRfDTWYHpdW3e6uXSk4nbSoCBMNX6GFSkOF2UrSzs0x/a0mtdiqThW
         LgXxipjkDThjF4E4hwiP72gFiHDHQNARlBuDWGwRx03F60qT9I+52DyrRragJGgF6h8c
         NZkDPaBULtINLqsfIgL+NqTPn9EN8tvyfz+SBpQVddaMNNfsz7G5/jkPuU+Q00PPXRav
         ZMbgilNIEEhpRd2Tc83kjOMzam6O0EEKAE4Z7hyyNzmzStC9aQQb+rNcNmRo3onBdfiY
         edFNJN8IJYgZdJ4uhBBLGWCThOokczU5JjagdfnOlVySmL0NhP/1koyNywRwBBO0dLZH
         tv8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316128; x=1794920928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
        b=mVrT8KBOFQHiA7z4fuQ6WmH3JBtWXX0xakj+PEnmgXuvburxdf7+xNvhCVNwZCYPKm
         yl+8VzZG73JbyIkcsj0wJdc3kiBnfzZgpncHr3EJbCwvuupX+HGbpiG54UkrvaR0Lxh7
         0kKFypU/SmpBmn2C6nnoLsG7/8U3JAFF4XZgTzWzTpQZGq/GihDd1Y1YD22s9PMYkRmN
         ZOhG+2Xtx3lNnpsOOVK/X+5WCk21xSGd1ms1sIk22eQ5QIzMCwEH0756mDhvkuYIaVgA
         9CA8MJzzILlmPdFwcujOxaL2EbwwHO/F9vyi+kGK1V3iUHrtDiVzU+dlqUDxe709/HZW
         i9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316128; x=1794920928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
        b=eoivHjOj+LMBvCD/XaYzx7MvBPmO/q2ekYkmHkoFl3qBzaez2dMu22YpnD24Ls7WSV
         67Tr4lYfgXD9R5HpvOpd3JokeE752f1rNxL9fJ8wZfROqjDyDGfkgVwvVMAWk0rm2bH8
         tHJ7UaIixbFZsHcvWKt+QDp2tkbft2+bpdtABjj4wrBrLbXlX4arw3ty8SAWV+xRd/vO
         89Jn4/6OXlRgIYR8XptH3N4Ffhw4Azyckcn8tdkgEjVsze4wT/SlVfbKgTzxq7euy3Ps
         wnTnIjEt7r9bVTrwYC0wUbVwm/tlQk9BEB0v7QG7Qmh9bUxKCxqFdmI1r9fXNstFUQww
         uOEw==
X-Forwarded-Encrypted: i=1; AL+hErFGXG+vmLueHS7KxXhEB/4HNsFQfQaNBZjYJMaBqGSm36FPzPwkmI9hc9QV2lTi+qWlFd6sSmEJi6XVh84=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OKiz7xu6sBVoiYF9to0uMCqfTcoC4AFD0aVqpAMFhzp4JOPku
	g1LMcx6y8TI/jUbmX3NVSApUxbKHTVNdGyPd9b0Z0OT66PvpG+PSTS2CGc7ohdjDHFvpQU7TF5k
	UeSTTWQwBSsB8yQQloeKWFIr4SbSW3fw=
X-Gm-Gg: AYBFou2ZwF0YlL1XXdtu+OD4xJfjhSCLzojZOVQ5aZPDqm4zArsQtkklDKVDCvPD6dM
	Z+24zsneTgeFSjylkuMHuqf9N2jDrvMpEU4lczV/muTgXOJDoG1f2P8C9ACkUdfIFMV2WMIVTI5
	jo/9aWOkJg+CiYgNvP8Jdca8Xjf5smRu8sjN4V3dEiS8PEGV0tyQmdREuze2KOs/AFzhib9QRf4
	Ec6y0kdrakDx5e6LFLCyFOmFYq7D/hDxJHzwyWtvLObDHf2PH0zh089O/NVqqY3Q/tDmPCLE/uZ
	hiemUJi+wvwwyehl5O1XlqT6TkckGo+AyCD0+AgC89jDBAOvLiDcasH844hyeiFUTKNsDkJMSUu
	gMXN3O7KDnptL91Ly+To1vve0lqeyLIG3jhcjGZmAMOMUBRWpGhJezykc99keib54jkEMm69ebg
	EX5iGrEvsDiwpqBSgkjuHmvPkydkN5F8ZsahTuW/ENvVSQhU02mnZefihyqql7OZxHT/cYJFIji
	MPWLWnYJzebrIIjhJlZNZKq6zkOkXWWP2iuOe4IwZqbymfdV9Me98rd
X-Received: by 2002:a05:7300:fb94:b0:375:f846:5b3f with SMTP id
 5a478bee46e88-375f8465fb3mr1784796eec.0.1794316127719; Tue, 10 Nov 2026
 05:08:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-ringbuffer-v3-1-b5d74efa8dc6@kernel.org>
In-Reply-To: <20261105-ringbuffer-v3-1-b5d74efa8dc6@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 14:08:34 +0100
X-Gm-Features: AclHuK8StyFCt2vkuC3IByfxwDTE13qSe3P14U_9mHZMBq8D7aACpxOFRqzfsdM
Message-ID: <CANiq72kXZVxqwf9m24qGBXEyZi=dM9Zr9D0XiZGCYaEuYvDVyA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: add a ring buffer implementation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +//! A fixed-capacity FIFO ring buffer.
> +//!
> +//! This module provides [`RingBuffer`], a circular buffer implementatio=
n that
> +//! supports efficient push and pop operations at opposite ends of the b=
uffer.

Please add at least an example here :) Maybe reusing part of the tests.

i.e. this is simple enough that we can use it as a simple showcase of
how to write a module with docs, examples, and tests.

(And ideally on each method that may fail showing their `Ok`/`Some`
and `Err`/`None` paths.)

> +/// # Invariants

Sashiko seems right: this is missing `// INVARIANT:`.

> +    /// Returns `true` if the buffer is full.

[`true`]

> +    /// Returns `None` if the buffer is empty. Values are returned in FI=
FO

[`None`]

Cheers,
Miguel

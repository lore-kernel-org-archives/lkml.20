Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506094;
	b=fsaoMl4KAKFTCNDH9Qkxw0DL0LXi5Zt0nrcug/55nXDc+FgRQ0u8j198/6ScvX+4Sg4X
	 8rDVCOQhRCiOKqZqzt0AeaYWq1AySvKlCUQxQlko8dCFCkEMB7tvJjfyh6MEn0jYTy7WY
	 GitIznKWBBK2eT1TakxZWoAeTY8kL8gmkVBnUUoO/24fw4peL8AdT8KCoDjA622vf9J96
	 n03UplmXohHfcB0tT8w5/kLA8PNHTeMSPLqzSPbB5E5PkHKJ0OcK1XySKmXmJTtJlqIvd
	 dSYPJD5mizXFuYP8+gk+6d4lQcS9NRWM0Cgv8NEREZvJLgH+HehYpo9vNACk+TQOYsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nLM7EJdjaO037/pI6q4xA/LTKNh0utgwqJExJ58n90k=;
	b=cj/gq1fNvWB/ZPuVb7Hm8hS96ll9OL9deyOqu4SaNhZZhy5unwJes4TSnb7Qbs9p+4xn
	 6VwG7NpxsFdDIc+jfFzF8Ddjs3YI6fgcH9i9ObqwtJDiRwbKt05QzTB+Cf47jY7WLSgHB
	 Hdg3mRB34zHLHjjUp+J0t/EKWqgYvfR11jWzuy+psB9tPC2MHJhRURuCCdA+C/JKcULQr
	 vAOIkNpQgLDGM9j+vPGfT2+DCxOaEgel91LGM88ZQdzGhAvJ8HwlbklOSv6innxMDBNKU
	 uOYxlnq7vVxgXmcoaxkxBlQbIJ5q3tkw7df6esauK9ZPvuHHKtH3+KL9qCcZXBqXosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AZ8UYX+B;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C8606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AZ8UYX+B
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso175961fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794506091; x=1795110891; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLM7EJdjaO037/pI6q4xA/LTKNh0utgwqJExJ58n90k=;
        b=AZ8UYX+BJwa+R9pmN44bF5ax/kzTyasztIxh4+Er7FEXpRlX03/tDgwqF4UHWvXRSg
         VRyu1oyRcAEXCHcBNJwheqh7t3e5yh88VhnoEeFlPZrfEduzMDYvfLVB1xz2mYY3KahG
         g29oYYmlZLJvvh54GKJUjD0xwypctk66AQzkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506091; x=1795110891;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nLM7EJdjaO037/pI6q4xA/LTKNh0utgwqJExJ58n90k=;
        b=mwFRA3JPumr6aiuKp06o4aWuahER8tMAzIJ/WTxnIGqeLLGn/k7AVo9hO9cfVTxyKo
         lunrDiXIHN87WKOX38Ligoy1zOh4obqwd7uG3uX1SFvGdX8uKEZqFbGoTvErgEnMDgWy
         1z69m/3Hiine4pj26Cq1Wogup+VdAThefOlN5TtO4KKJVj2S5KKDYfVJ0w5XCQpVzAY5
         LuQFAhw4hdTMiBelFJQnk4upayiai3VJ9JL27t3DPqWK/I5AoeFcPcDS7xM39nCSWVlt
         xSZRv2d0I2KKES3JeWNM2KKL23FZt7JzKgNCRSYUyU8tOVApS2HKiIGUG56MFA1GjbRm
         5uSw==
X-Forwarded-Encrypted: i=1; AL+hErGptOEWHnbaqi8GfKWst5jmsZBtq2rpddolFEPmjvkJpXqOJjbyj4Jo0igV+SaGV2SMjLY51xPaUXQCwWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dCa3G8/efiTYcEvjoULt24sHqX7wo0gg1aC3HvbB7+64o+s8F
	he2DMWQ4i9aiEcO/02HC4Q/OuZH9ywtArQuHBSBacpB35bUNcvlixByq0ZJaK7BlHNKcnnVfLxx
	QKil4+7sRaw==
X-Gm-Gg: AYBFou3/bYOet+ZxvZxUIDKVND03fcJtNGIKXRLqNc2yu1+l9HW/0W92By1lrU0vSJR
	wFM0FZAIaIy0jXFHpwNjJTRFa6AKhZHYueO9IEJsV1EEZwzXgD2tUIBBbjkMbZrG3YMF6mzXAno
	+0hiEqkh19W5E1iQI4UzxgZe51MK+qiu9SEj79Y4zxeMY+e1sqhRM2hmEk489miJedeN8dncVMh
	3uHdIcCfMIL6OEfkZoRymos2WsRyYrjb8ESfsyMMqXGyh+2IeybqjV1LUhEyr7imsaeslaYPPxC
	TS869NOQUINU76Bm6Z1Er9zkhundOv1vA2Gm5OO/DuAW9eJ9eTnGPD2Pb7yiKvyu/MxuCvBHZXQ
	mtDKE6fUCqxhX6RPEL1qKIeeCjin37z1DC70QLruRtWOYjdKDGVG+pWM6glYe0fn88MZPvMwhvZ
	DdAB7JOb3N4CLac/q8g7sLaEF81z3NTmAHG9rzNZw7rFe3xXhzXfjY6/UCuUtbGgh/ApEMoBXF6
	ZCPcwuu+/zvMkl1kW15LKDN2Y7lSlukt0FRlwmylKnjoyOe3xqpKC3tQGTyG6DimqvuRUr2dtKz
	WiUJYccbRGJUUAq0X9gCruQGI14d5cMH6kscZBtZUHvm9NcuTthW3QpKYefPKYIy4sXnk5H/QZ8
	7Ag==
X-Received: by 2002:a2e:bea4:0:b0:3ac:dc69:e62a with SMTP id 38308e7fff4ca-3ae2b42eeb8mr1272111fa.2.1794506090906;
        Thu, 12 Nov 2026 09:54:50 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae914sm693181fa.26.2026.11.12.09.54.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:54:50 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso64456e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:54:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE5PzjjXRS1nMeo4/Mo0lLsIxb2Mxpl/AZVK4DMIXHOcnYT/qymLjRAH0mVXRnh0RSv/XuTx7HztxTRs08=@vger.kernel.org
X-Received: by 2002:a17:907:d86:b0:c50:62ff:efe2 with SMTP id
 a640c23a62f3a-c5066b2da47mr541451166b.21.1794505688483; Thu, 12 Nov 2026
 09:48:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914223212.i.829-kees@kernel.org> <20260914223219.901347-2-kees@kernel.org>
 <20261112004039.GA523044@killaraus.ideasonboard.com> <avWNCC3_Ff0knO6J@devuan>
 <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com> <avX3Y08tF8Z0C4LH@devuan>
In-Reply-To: <avX3Y08tF8Z0C4LH@devuan>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 12 Nov 2026 09:47:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi1U9ry+MmK2_z7E=0KPpNG9zF212t-YmB8gc-qsUvp0A@mail.gmail.com>
X-Gm-Features: AclHuK8TqtfSnV8lmNLmK3LZjOEY1Z81GA-4LECZ876wsZ5FbRi5al1rfBz408g
Message-ID: <CAHk-=wi1U9ry+MmK2_z7E=0KPpNG9zF212t-YmB8gc-qsUvp0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 09:33, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I don't agree that the code is worse.  It's _different_, just like Rust
> forces one to write different code

different *is* worse. We do not want to have random strange syntax
that differs from all normal rules for some little unimportant detail
when I already outlined something that has standard C syntax and is
superior from a technical angle.

Code needs to be legible, and that means that it should follow a
pattern that people are used to, not have random single-byte markers.

The goal is to be readable to *HUMANS*. And no, removing the (more
common) function to allocate just a single object in favor of using a
"1" is not human-friendly. And adding a pointless "," to make a
compiler think it's not a missing argument is not human-friendly.

And honestly, I don't think Rust is a great example of human-friendly either.

              Linus

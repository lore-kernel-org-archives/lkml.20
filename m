Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503554;
	b=u5568yW7d5/sqpkoUYA0UCu61Q+OhOILgMzuHZv5sZD835vD+O70PuAokRmCJfqvidDJ
	 IKXSIJ2wDmBzkiAyJiSuw1viDNw5gDFeSFu7KbCQf7/Ye6IeQBdyy9rM0PqZbh/VQ6wJO
	 LX9o8tPU3Sp2k4sxOPpjS+GZaYwigBlMtNCFVf6IZdxzD8zz2cMoJyP6wnk2LtkAa0bxR
	 qxBOM2OAfnpwhUu4DHhwAPBmng/gUHQW+b1JekxwCLq+S/e02BnuiNAsB7fQM0AAX8KUE
	 lQsjGiYfkfR9kpxUt46HuaHxjaFedLGFCgz/r3jXSnWgtFKZVd7mtJAipn6LcGQj3/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=F6YTYLTty4ZhMoj9B/ri1dVEfYoUCO5Spihz/O49FOQ=;
	b=0gIsjzFWnarrbG6aJ2w0QDoCwr+EPCFjO5NtDl2b0I3NrZc0lfvvZ15AoQWKeUYoy53X
	 rdgIkD5wq/OEjoVOb6Jchm90UE/kOm1nmFB+BdkIg3fWx3+aOpkOPG7C4voqSZsYD5SgH
	 v339T9cCaoCWqqZNmJsuHuhok++4dsTEWlGILwrTh0WyxUS4X7tt3Qk9KprryOZd3RI4/
	 ijMDT07hdMA2Tmf0PlaG7Rp0ndex6VpzLEkgvhHxO6ATDwzuRon5aTGBqnhG+FHI1/edj
	 00Dp7QYxi4WYxnyAjRZFOc74WVsbmI4c98g4LxsWKE/K+MsZM2EvoFNM/sRGgz3EpTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Io0dBwXH;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46176606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46176606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Io0dBwXH
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso90343a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794503553; x=1795108353; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6YTYLTty4ZhMoj9B/ri1dVEfYoUCO5Spihz/O49FOQ=;
        b=Io0dBwXHEqxfSfx9fW0p6XQzryDyTPTT7SnUUjOkbk9DNZ6N3mKOvrHXwsBLH0SndL
         8zgLxzCDhnjutEBMQ+Ml2bkh5jCC+MBXtleRYX3PiRqFP3snoolVx0YYZSAj7k1GYHE6
         dt7dQZAlwPDocQuM5gzXHftt1Pwt6kHu/s2fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503553; x=1795108353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6YTYLTty4ZhMoj9B/ri1dVEfYoUCO5Spihz/O49FOQ=;
        b=dYkfthDWT1zEd6e1bQSjiszWdhVLAcjhvSnrZKM4nvnYNYCz8Z2j9GyFckNa4iYS2B
         +uRyScMlxkUnLfOrb+UlYDvAHR9qQEn+jzJeuxrtjuIV+bzZihoqBih4n3c54BsrUGVO
         tE74AWElVYVOzLffEA85thPxAGYCj6ylZ+x8UcdN2g1bkgu+aGwRPSkUP6FFBVOMidvO
         LkKS22Qhj/55tREQt2kcPSESy4tD9nski7xfWaysYKm7fQ8BfWqJZ4beiagjX9sRhY5B
         fSE3IgWmkn7VKGa5f9jkdwz+jBDa3rtvA7Jxm2iVW7gEIEtMFPOgGwTkM93PvtiZ4FXq
         sMgg==
X-Forwarded-Encrypted: i=1; AL+hErEr3NmvbEzZBc0Kf1rabkKfGle/aVAfj7qLw1Uxx3YDHGrfAyCXrn/zlPD4+yaUfF6g0PG2QZP8YV6CIuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0lg+u56FT+VtKHEcb4B5GU1GZA2W7sxOMVglLGXI476gE1uth
	zzYDiM5N06gk+qliVBUH2cc6O9Tihq12Y0b1Jz9E90No/0aNBR/C8LYBqeIV2xo+xk3cxTCboUz
	UPHK/wDzrgQ==
X-Gm-Gg: AYBFou1T6KvRKzbEPxg/AAatc1BoaJ90XTQJaCHsMaNg6XIRrO/lorEj7VjWrh22COr
	JRhlULEk+a60ku2k4dA+gQW0qRkwNvHXWVOKDmMsVv0NGgwvo/K5esnn2bi/j688a+lFopQ1/ru
	XVpOyEyV64vkv9qK0f1HxPZCCbKpGBcTZU1KysPwF9uxah638IKyxDjDh5GNYtmtBq3Z0tIm+w5
	KZ1SKNRBeVtDRSx+k5fTX72PHMhfxJCC1GBT7Fy/kfi/meGR6f8Q2x88+0mb1O+E9T/eQa7t62U
	yWVo8dUf67q7OIgU9zaiZ+fDU6X18bYQ9ru0ErV0bEKLKvRGkCWDW5mGYrFYnZS8CpuVSJZnkX7
	1ztdDSklrEsjffP4wNJxEe7jSsUGSCvTE0kPYiuty5pTeYIRzIAUAkUjQ7TYGxB6Vucpg7NI5e0
	FC5jx+RNjPZe7B+ijyhkiAeZopFEm672kAzmIOk9DZBI+m8/j6t+3D4dgsXWU/At1eopo7rrVrA
	aiJsdpmaxh62sMRM57JDdypeorlUABkrIHEfRMFAiheaaHreQteQskR0HTld7VoSNJgDgOt6LX1
	IL7C27hwRnJJDi0MKP/Q7PykTspriBm1yNsMCtKkqevjqdDWtTYUYyx++zUS8xXguNiBYmiaC1w
	BgFY=
X-Received: by 2002:a05:6402:750:b0:6b6:edfb:5885 with SMTP id 4fb4d7f45d1cf-6b7c089100cmr193740a12.1.1794503552541;
        Thu, 12 Nov 2026 09:12:32 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823743sm3870788a12.5.2026.11.12.09.12.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:12:31 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4395d31228so622397766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:12:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFonUnNJG9sojPnXjdemwbtACP28JFgmABHkrnEF39yjTFuk4LjsrRdyjGLSZ1cKtHcclKmJ+ToO9jhRO0=@vger.kernel.org
X-Received: by 2002:a17:907:dab:b0:c35:babe:ab44 with SMTP id
 a640c23a62f3a-c50665538e0mr626078766b.0.1794503550222; Thu, 12 Nov 2026
 09:12:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-2-kas@kernel.org>
 <avNuQqLf9CG9dSsE@casper.infradead.org> <20261111-heimreisen-ungeziefer-empfunden-a892571f2c07@brauner>
 <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner> <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
 <20261111-stumpf-montag-miterleben-c4e2feac8090@brauner> <CAHk-=wjGXBnme-N+HvbzHH40ftb7Suc=kZVT5cuintQWyMHJ7Q@mail.gmail.com>
 <e94bdf7c-eae6-4f64-bf93-0aeedca1a22e@app.fastmail.com> <32ad880e-5946-4703-9c6f-43ff59da39af@kernel.org>
 <3eb60948-8fc9-4682-87c2-c113e54e7d4e@app.fastmail.com> <4d6a3d68-3fc7-446e-9f59-f61d7475e22e@kernel.org>
 <bf186643-780c-40e0-bde6-f2af90404a18@app.fastmail.com> <b90d4bcb-b865-4a41-8496-78d751c03dfb@app.fastmail.com>
In-Reply-To: <b90d4bcb-b865-4a41-8496-78d751c03dfb@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Nov 2026 09:12:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whTG_hWYC=a2+uu_+SeN4E1ra0n=ytGqyk83Yr7tDuEJA@mail.gmail.com>
X-Gm-Features: AclHuK8_5teM8idFuSWqym8O4N3OQPYF_Y6jfMJ_yh9uCx25qjwD1XBnjE0OwRA
Message-ID: <CAHk-=whTG_hWYC=a2+uu_+SeN4E1ra0n=ytGqyk83Yr7tDuEJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
To: Arnd Bergmann <arnd@arndb.de>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, 
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, Bernd Schubert <bschubert@ddn.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, Netdev <netdev@vger.kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Malin Jonsson <malin.jonsson@est.tech>, Richard Weinberger <richard@nod.at>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nishanth Menon <nm@ti.com>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 03:35, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Posted with a somewhat shorter Cc list at
> https://lore.kernel.org/linux-arm-kernel/20261112112528.1116405-1-arnd@kernel.org/T/#t

Lovely.

I'd love to expand on this kind of early removal: anybody want to get
brownie points by just removing the remaining users of the legacy
'kmap()' interface entirely?

I don't think we actually have that many of them. Almost all users
have already been converted to 'kmap_local_page()' and friends.

If we got rid of the legacy kmap() case, I think that would get rid of
the whole "pkmap_page_table[]" mess and the PKMAP_BASE / PKMAP_END /
PKMAP_ADDR games and only use the FIXMAP area.

                   Linus

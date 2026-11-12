Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504217;
	b=ZqK6bj/v5/LY8Du4vdDsKNcdv1cOO7MujPWxaYOZSksIflVl+zYOy0ZKP+YInsJbXTPF
	 xLfcB5xs7Ln4WEDHU8rcLqvRGaqTz6UHfxBLsF+/p7pApXzAO+ze0LbSE1Xx7EtADt5dS
	 8ON+6Zc0N+PRksXtwfS0kpP17EXmZIZNprtcm0s2QXhQwSYvVLOhVL3hyZteBVkjBcy5E
	 6wKhPTxtKeX76dg4K26pRTMl3Xfliq4Rr059yzd41lP8qNoO0cKgLkI0vgFLoSldNNfj5
	 /KlupGXLJ3sAUyRX80ir828Z38oEicDv9KY9xaX6ctlTO9ji3bfMBKjyWwvS4G/aFzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CPqL/jXjgacEff5dEPASqy6/Bbk+NnoKXgfKHY7JVag=;
	b=5FeklrbTLhSJ1JMhTgER8Olkc+DOtSbJMY7UePerZw1NLCIziYr7Q6wxP1Z6KozSRoPV
	 w6nuVQwiz6t33mvEy3pDvxJlrrfKiULJCLc9z0pDN772ckGAsGOU7/lsxkgh4VcEDbn3M
	 rm9LtI45VyAC5WYgCWmPOyhJGDE+2/cPx3RBHDbOFd3kPs6B4mTx8k5/TGF1MpBvHQBS1
	 5DuFA5/1irQf0259nHjZXHGCIgh1Dq/418InL0QVSOupFsaz7lut5Ejxq5HNOgz82GrAr
	 WAkR6p4FrPl/za47eSRqzwzg9HBp+2RK6JOf/V9D+eQpkXbDOLifAs4HaZRjJ1XRXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="EF/x7gOB";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BE606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8BE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=EF/x7gOB
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so723594466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794504216; x=1795109016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPqL/jXjgacEff5dEPASqy6/Bbk+NnoKXgfKHY7JVag=;
        b=EF/x7gOBEIGhqkGdxKEYf35ZdWOhDxfn109eWZfPteP/otxZot73Q+EUGGQw6zUwaU
         NeOzVUiBehGY1wNoIvGQThgAeZkcKbRlOplYUlLGGR30SMmuTqQ2QHKsFN/pBCKq1b+I
         TgZISNF+syi0ksuOLqjp1UefpgYpsZ1qJtzbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504216; x=1795109016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPqL/jXjgacEff5dEPASqy6/Bbk+NnoKXgfKHY7JVag=;
        b=u9t1zT85OVPMdC9+78p1j400+0YXk02DgNBxTWEUCMN9tPcd5Mgvl4A5a4z2hyn60F
         T2D78p3AJtqrwHMVMIGR+x5E1hvbwECipbJu+iaxyWNDU/fT6LsLmSfs4QwthcktrfdD
         AZoNZMOHCaE6bD3eieDo8IEDzJGRGwGECqF9hPIDRamZAkqQKjv68KX8UQM3U44d1N0+
         GXY66dpZsZT/ce64tAu77tXplFFISaQ/rLlil+ls5saAugxZ8zqkDSaUu14bOBITbgL0
         Ef5nnnr8yItxrz+OdYXXl7HATxoQuT0zEl7SPCBD4n2JaSGS/USnksF7pTLnW1ddNMly
         yTEw==
X-Forwarded-Encrypted: i=1; AL+hErFSN9YRy4QnFJIG1vTA3PmcXpBwLN6s7bO8/8RwByTksq/cLdhQhgefQdsg0LVdpCtHcTzSNVJ4WgutWdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ffOsGnXaN1LYAsK5uW2COq1qc0S8MBCC5PQn29irPnBdcn1Zr
	1Ta1kViSD0aDnC2iDmlnF3iOf8toINlvB0+lezytCxPFphi2Js/S2AlYcVJL+FmgBQLNv2T1nNk
	pWgBQBT2M/A==
X-Gm-Gg: AYBFou1leJ7o8ZG6NieIyzXgKBPg56bSEsNOSK3B2yNQPHPEzooH5NNwGWbPbBVugxh
	yguAkkBg/aZOM7Rx/YWDi1AXGHNERQpzLkiKpA15ZKQpVXQYDVc0MeE3L49NZzFSkoaVmdMiKHC
	fL5DEjTSFDN0Q+E0WwgpJJgGSFba8+4V0gPvgq6xYPmfcKWT4ShByAQQ4Sg4jvksDatKTcvkLHw
	yWasNvVlhnou+8b1ACLapyT8wyapBQff1OMChbfnqZyhrdOnXoTfkNWVgrzjka7wrQAn3oBkpmT
	RbF3kFdd2b0fNRQtYnsaOtw1ZNdAeYLNMu5pTv1mwO/ADcVB40qqoyLlT8f/VU9UpRj39m29RCa
	ndQC/aWD4YFw/JoXQUGrp0BnT5HFkhlJOj40kxtUMF1yFqx907L1VNuJ1Ttv5HotYwHpu1EjiMq
	8vqljimVLnd0+1mfGx9PZgwRgo4V+5mWvAiW3kU4ry3BTAfJNNlqZzUlVvEE98BAGTyy9h4Eh8e
	WmpC2O0ko9J7OfXaxG2LC1Z2ROtJgvg8X6AhfTs7i+/87gry4VbohwcVCQT/T1FUlVAlzJOa+AO
	bXmnjaUvM21dtg8AHxOm/Vl/5Mh1TXHoggPoq9/2YwkxwD9mBomGvznNCBDVaSiQOGVzlETnMtx
	JSg==
X-Received: by 2002:a17:907:2d27:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c5066d3bd65mr636599966b.36.1794504215494;
        Thu, 12 Nov 2026 09:23:35 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b911desm360566b.81.2026.11.12.09.23.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:23:34 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so624383766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:23:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGhD7AktzxOZ3hEs2rwX/r9mnJq4MqnmoNEXHXIufputGjnMVbY82UnoJ2wvQmDfBnDre/2da+HQFVkGyI=@vger.kernel.org
X-Received: by 2002:a17:907:2d9e:b0:c50:4b7a:de71 with SMTP id
 a640c23a62f3a-c5066c973bfmr611766466b.28.1794504214466; Thu, 12 Nov 2026
 09:23:34 -0800 (PST)
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
 <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com> <202611120905.DF88D9849@keescook>
In-Reply-To: <202611120905.DF88D9849@keescook>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 12 Nov 2026 09:23:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
X-Gm-Features: AclHuK_HNQpT4tCfX_FLYbv7PC35fGzeh8ZhM2vC9ghehMzLoLgyRTCdJiNaTCw
Message-ID: <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
To: Kees Cook <kees@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, justinstitt@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 09:09, Kees Cook <kees@kernel.org> wrote:
>
> One thing Justin was poking at was adding a "strict" mode to typedef

Honestly, the sparse setup is superior. It does that 'strict' thing
(except it calls it 'nocast') _and_ it has 'bitwise' that is a nocast
that also disallows non-bit type checks (which is *very* useful for
things like "this is a big-endian value: you can only do bitwise
checks against other big-endian values).

So the compiler addition may be worth it, but  even the "poking at" is
weaker than what sparse already does.

And the 'struct' model is honestly superior to both when it works -
but can add extra overhead (but can also end up being nicer than both:
instead of casting with special "I really mean it" casts, you can
derefence the struct and get its value that way)

              Linus

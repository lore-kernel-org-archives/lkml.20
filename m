Received: from mail-wr2-f13.google.com (mail-wr2-f13.google.com [74.125.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FB469849
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151081; cv=pass; b=gtfU7NlFFvJzp3Usknz2C3uer9rRW/tHbIiQDKAOeFH1yOCpUUsTHRAl7PnP0SvX2ikCjxnZqx6EkcAUM+/b79OfhaNT3qkPm301eJZYKmRTtLIWSPiGGchokK3JWs3Lu1ZsDnMhI65C2x6jwUwVtjzmV/syPpiYV2OUG/FVwq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151081; c=relaxed/simple;
	bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCeTFlIlOJmNUBzcHadNv2yTXQNysJWgDEMawK1tclGhlvtBJTrM7j9E3v5H8HYDJJkP+g5b9DKIZJ0jC7KG8TMrhHOYKW8qUfW8puu5DhT697z+duk7iuQMiZd4slENZwPHyWjDTYncWzHNOSMt4QWq7wNvyzBtRSKmc0Rr9T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ItdHb0Xc; arc=pass smtp.client-ip=74.125.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItdHb0Xc"
Received: by mail-wr2-f13.google.com with SMTP id ffacd0b85a97d-4843378fb37so362294f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790151076; cv=none;
        d=google.com; s=arc-20260327;
        b=hDfkPDmc3ds2+r1DpWxC99Qv7l+XIpkfN5F/wjHMZAqdXDK7kH+Qyp+OpvQYtyuU3e
         SmO5OPXd81AaH+xu+dydtKzlYo7ZVRe4zXqx8HHtMVYjfeRI5G9arumPm/THG69QuIDK
         xTbDEFj8hO8pEvz4j/KuGgTZwHx0m27FoFw8R9bWHL20+FYg+3bT+fV6vszjSPWY8+9m
         DOneUPEyADXwMa4ynKh0YWyLpdZsXKXup0vdsMjZBvVMS2vYdCcsiUGrG3yXMOpYdhSD
         uQk+JE/Xau8DDlVRAOgD7TtbUIyKeN5hikXJtyZWMWWYwyxQBlts5vJJlfKASSWRGFMQ
         lKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
        fh=3WIHkRWkfNxfrX3JJX3zrFrFIYNDjSDHCML3QBJAQcs=;
        b=UB3MRFtB/nxXABI20Tlmg1eNVXbgIhy5tUntAKT4KmL2lS/pXfBK0WFXqirkEeDYnv
         0oDvBAdLhzjHoCWgn3wJEkP3kVJiPN6STjrBw7/RkGWqM8Fd5Q7QJj0ONcJq+XaP4Odj
         TGM0QYCVYACb5NwHVUsFm184VPmfNAb/DOc2s5xSKi5Gjl/Zzwe5lVmXHFCmsRstnCnL
         v+Ku9gN9++ENH2wsoucIyCJ78PIbSF5yvC07+/gz51390mjrd75cj8FgMxS1H275v0Ip
         ZSsP5r40dK04QpDe5+B3qvcqi7QHjC+QWKQP6hDfPeicRzvTxwQkMANZKi7e3gHaJpC3
         8RrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790151076; x=1790755876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
        b=ItdHb0XcqO2Qr1plJfJWO3NGEIeakKM6rK5oysThcQjtWkHUicpyGSiOXOcIc2lhPT
         KgNGD5gfwDnPeRgSM+Omm4oDEJssatIdeRCXfkAD7zYxy6oqVyc9w43LNeEi7EpOyrsN
         2fYjTwmJFwlYpT4lRpQ2+2xn2BMlERft0qwaCGgJ4k/0luEzBiIY9s+/W+6n2mx6bnGP
         LRC3I8I2Rl3K5ewC4S7FX6/+aSIPlRZVD4+h2jemByaSE3vTP+0yrdDPt1PM6ZzqmJC8
         VwZcSX3t8W9dOJTsymApDUjHfVws4jxu7wGUbYI7DdhxJZkkMdoZWf9loAfVMqOjARSf
         uSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151076; x=1790755876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
        b=Fr7FsbDG4CKLNWSdBdOhUHLj/5QgEhzwZHYsKAahicVUVqHKYYR9hA/Dt4TcrrWNuJ
         QZdRnc+qOksaqzE0Gp40/mDyhN68veyMjLgYBq+G+4IaWLZ+naI3R9Ify2Bkxl/IVNb2
         MdBqR1EXjK9AF+km/ClRYct0SpeEXRvT2j+LFPdLIxMA5eePkRpkVvPe11NK8LyXtwe9
         s/nmHAqeka+G0jLdpEbj3wnmqewmrIdXMPaejsgfjPbGmqRKYCAFXOVX67gHen3ISd6q
         lQAwSlnJaiR0p3lehFtE9ugoMpzmH7S+Xeyj1KxbI+USyLHntRsgLD55OxZmmH8km2qn
         W+OA==
X-Forwarded-Encrypted: i=1; AKwUvBwYuPg/IGpFsT1GwUqIN5ouE3T0Yp5bo+jeRnYp1DMXS9eQlSCVuHCOJliPiPDpR5af/2GQDBw92IUbuGI=@vger.kernel.org
X-Gm-Message-State: AFuF++lRoSpHgp53bcMneJCvuW23zfoYkZmzl67D1ZU6t9F6tXdrszKn
	fiUW7PzeCcAqLBWPnyKly2pvadxu5I8xXb/M3m4IJCFQkIcnltCMBKxax2Nn4o3QBL3yDEloWrx
	lVnusaKxa20ng5wbAuBKlHsLBbRSfC76Bjw9Mk38o
X-Gm-Gg: AYBFou1Zz8aaGiBO5A8fy8+v3rdzZV/b54yyTc8CqbnXxiTJe9mu1Yu10u1KT8p9oSb
	cyJg2JS27UySGF16m4WXfW/6fR7ZQqaH1JKbF2lUfOTW2gyVdN6Ss39WL38luRFcqNp1VfG2KGS
	y57uCFFOwc9owDs1bBSjGIUN++7tzaa9eqgnBbyIqOlCLuGSJrDRNvd7gtiRv4caEY9WI3uEWhY
	Y+0UoKnvu7QkuU69hjoDdgUR6e2lpF2qNN/bZROWyxaCTgSvEb8df+vTT1SOmQLEROwzE9fkXSR
	b/2gQr8n07dOl8XnE4mwAOiypVJX4m3ZWvoRQxXOY5ERC2Z8qzi2kAaFA5sxF67+QUtpzOKzKop
	b/vCm8mbqFrfCb9kuX72P
X-Received: by 2002:a05:6000:2681:b0:486:f767:8be0 with SMTP id
 ffacd0b85a97d-48867086ab7mr2788619f8f.12.1790151075171; Wed, 23 Sep 2026
 01:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-b4-doorbell-v1-1-f3ca2f501600@collabora.com>
In-Reply-To: <20260910-b4-doorbell-v1-1-f3ca2f501600@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 10:11:03 +0200
X-Gm-Features: AclHuK-cN3Y_6juBtWNq28GEXbcnGNxIQ1BXWgEb1aIXGrQ22BX1Va4FD9IYMnQ
Message-ID: <CAH5fLgi6iQcTNOyZdpdB=d-AzniTPg5Z7uCgW2y3DQBQ8XxUxA@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: reduce size of doorbell array
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	gary@garyguo.net, boris.brezillon@collabora.com, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:02=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently the number of doorbells is set to 64 which is an architectural
> maximum for the Mali GPU major v10 supported by Tyr. Since each doorbell
> needs a 64 KiB page, the doorbell array alone would need 4 MiB of registe=
r
> memory. Since the doorbell array starts at offset 0x80000, its exclusive
> end would be 0x480000, but the rk3588 device that Tyr is compatible with
> only provides a 2 MiB iomem region in total.
>
> Reduce the number of doorbells so that they fit into the rk3588 iomem
> region. This is consistent with Panthor=E2=80=99s doorbell id assignment.
> Doorbell 0 is the global doorbell. Panthor assigns the remaining doorbell=
s
> to the active command stream group (CSG) slots. The number of slots is
> capped at 16 (MAX_CSG_PRIO + 1). Therefore Panthor uses a maximum of 17
> doorbells. The 17 doorbell pages span 0x110000 bytes. Since the doorbell
> array starts at offset 0x80000 its exclusive end is 0x190000 and so fits
> within the 2 MiB register region.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next. Thanks!

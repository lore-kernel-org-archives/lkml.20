Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897810;
	b=ImObo/6Q3zR4OzTTUoZhs7MP39lr8cmgIqZwubimTRyFQq1syw47onRRXFFvlXce9Ca9
	 jjBpiXxEHPwtkiPtA2LFeb+uEpM51lLj/979U4rmTAOXtnb4avuDqZ97stAcR5GZly9Oz
	 txPXYfgKyvpCnXBlgIjvzkJK2HEtz+VwdT49MIVMYo2NNlaQ/gsveVU/cDD+aAy+NJss3
	 C0Z/U+g9VhHnC31Oec4PWVN1Gte1KKOJULHJRflHQ3VD02uQJQ4Uqq/a1Kve5wsNxGZ8q
	 IRD7m39H5sumFGRqwrIcuVboSx05PvExpJBPt6lg7kwMje1r3SbgUCunbLgQILXrfnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897810;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dElCrkpNpn3idD/utf+3yWjM7tzCk4S+t97MHfG6DCk=;
	b=1Km2bu30K1CmVJt+7h1I82Dk9S1WM26I0s5Wpg87b+jsO3y4Al1QFtNrl6VA1i3jJVO6
	 RJPQWsYqrdgi3lSrCsyBtyHNruy7ByMOghD6V3NhgmgJHMCQ8LQDcC0X1NRpmCzTxZK7Y
	 6McBaAjzFlVd8RdadhoFB+pX9V+Abu2Vica72D8Bq86vU+28iDPQ/xY+1qRmz8ADMw7lc
	 qvRxt6Xvl0KjXd0Qi/tLiYjBai7Lf6gHsGHDyK2HegguoHBoPZzlzAxEbjfWq5XQada6d
	 8lKCESsCTYEUVPy7mKER21BVjMDwS6OcUzdG6HSkz3Z8MtZ7hBEMcx4aMp1GgNaMeeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffoYcMjI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D0606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffoYcMjI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CF41F00A18
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793897809;
	bh=dElCrkpNpn3idD/utf+3yWjM7tzCk4S+t97MHfG6DCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ffoYcMjIz8nFhQ3D68Am23XMjbjcmXRcfCVzrzp9tfsMQl1LG8P3K1E23uU5ocP9H
	 O+jo1ShDI5yS1S53e9Pb0L+njmpe3Ryq1uDtHiZXAOeY0tNAvKYgXEX4HhMeP9dNG2
	 0Z+MPWhfPUzGwkHiUNacn1xPXoq1xeAF0Pg8OdxVnWSG6fwiouhMs0r9dC0259rbCc
	 MWnUMuQ6xrGTrN+YvLZya5H9jp4nkEQ0MhUPwgWw9Wo9smYHf83TU7a95kqLeqaRcs
	 EhZq5pigq+yENSewsLdvM8N4L8DTNps3I1oLPSiTRnJ9laHA4Z97/XgSJRRQtDYmVK
	 NMRfvqOSm2aFQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c423b145922so309493566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:56:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxzVut4dMsQqSoDgtAAlZbeqRCbTFSp7XTx+cphXxnBt+nxjZ+XnDhKKgOK/P8DMklMHBhh9lylRR0tnfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WaD3MaRMsVtolDIKDP4XhIe2qL8NHZTUA8tQbmKLQxCvtR7Tt
	xh3ARBJpDuluTFoACPAMKA4f+XeM2/F7LuF6gIIK6AFGGGJgnHUwpKtVvTKkGdOdJRJEjI4DP2J
	lYSYCT9CIqE/yhGICvSWeqxhDb40DAFM=
X-Received: by 2002:a17:907:1611:b0:c4d:28ba:f221 with SMTP id
 a640c23a62f3a-c4d34c9fe33mr14539466b.42.1793897808473; Thu, 05 Nov 2026
 08:56:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com> <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
In-Reply-To: <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 5 Nov 2026 08:56:35 -0800
X-Gmail-Original-Message-ID: <CAO9r8zPZg9OEA4wMBV=DHb-ok4L7V7LiSiCGaqSFh9FNqtQuWg@mail.gmail.com>
X-Gm-Features: AclHuK-u8ElA5_v51jIjDMgeHMQfaqUeU1gcTtrT823lK1r7ODS0ZMi-drUW4gk
Message-ID: <CAO9r8zPZg9OEA4wMBV=DHb-ok4L7V7LiSiCGaqSFh9FNqtQuWg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Chris Wiseman <chriswiseman@google.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:53=E2=80=AFAM Chris Wiseman <chriswiseman@google.c=
om> wrote:
>
> On Thu, Nov 5, 2026 at 7:40 AM Yosry Ahmed <yosry@kernel.org> wrote:
> >
> > Never mind the compaction argument, this is just to move zsmalloc
> > pages around, it doesn't help with internal fragmentation. -ENOCOFFEE.
> >
> > I still think we should check if the zsmalloc shrinker actually helps
> > zswap or not tho!
>
> I ran a quick test with zswap turned on to check.
>
> Yosry is right - as long as new pages are swapping out, zswap naturally
> refills the freed slots on its own.  Both runs ended up at the exact
> same 95 MB pool size, and turning the zsmalloc shrinker off cut page
> fault latency by 26% because reclaim isn't fighting itself for the same
> locks.
>
> The only time the shrinker actually saved memory in zswap (~20.8 MB) was
> when I blocked new swap-outs completely after punching holes, since
> zswap doesn't have a manual sysfs compact knob like zram.
>
> ARM64 QEMU (Linux 7.3.0+, 4 vCPUs, zswap lz4):
>                              Shrinker ON    Shrinker OFF
> Active swap-out pool size:      95.9 MB         95.1 MB
> Active swap-out p50 fault:     3,262 us        2,414 us  (-26%)
> Idle pool (swap-out blocked):   44.2 MB         65.1 MB  (+20.8 MB)
>
> Maybe we go with Nhat's idea (CONFIG_ZSMALLOC_SHRINKER defaulting to
> ZSWAP_DEFAULT_ON) for now, and if zswap adds a proactive compact knob
> later we can just kill the shrinker?

Unless we lose something by dropping the shrinker that we can only get
back through proactive compaction, I would argue that adding the
proactive compaction knob (in zswap or zsmalloc) is orthogonal. If we
can establish that zsmalloc compaction during reclaim (via the
shrinker) is useless/harmful, that should be enough to drop it. Adding
a way to invoke proactive compaction should be a separate feature
judged based on its merits.

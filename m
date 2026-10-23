Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719633;
	b=eRsP5aRe9fvqovumP19bFjehB4odF9fnhxOFpCgcw0JvK3aVRmRomGFv4qFTztMIiL0+
	 fotVy2NaatrqbzrEHEbOsgYwnMN6sBDWT77A98w4VnHbDktZbTIOkILdCU8I54ElrobYF
	 /cVK57z1wnODfdHStzqlzP9Oocmk4pvzsayeOUR+PjrclAof/qP2lM6OgLaAfGoqwD+WX
	 yF0XTEzli6H4+0/VrwmtaWvL9B8rDW+gSBrpweoKUCDBFvRZIFtEgVZb28+ZCRP/rqAX1
	 eezamd18m6dFFLDPhFw+FpbHK18Ahaehsp0v3MGvgexqeo72QCwrSK84ExQFbBnPVeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+9YYjmGgAaJ7EMORGFSbBsWkUkc9dzDPtiE0Gn+pjLE=;
	b=uPgECIQTVsgilI4Qv4PcNLQfDo7C2GcO2MFGxDfEm+9pVz+/AuvorYnj+iGg9JO+WsdU
	 fNBfWS8gPiUQEuK6+xtuRq6zP9MrSHa1EiJpOlPfEGVmh8exOZOsZCsAJK+51v1T41qoL
	 3P2srDC8ylunBhZ+Q6bAYOgm96ORKPgvMI+Q7idGCP2acbq6bOuUdSKVJxV8YO3yvxGOs
	 T3Pii0X0cZsmBcJuAxHrW8CIjekP7eaRAiLgvBEvagQui4NcWqPE0wW9yIDSzy7qrQ7nG
	 Gzm9TQ+lVQ9wkMJIt41Hv1S2l7tk65Oa379XqObRkh3oV/5hrmQgWRbmiy+yxuDsMNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYnnZOAg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AF606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYnnZOAg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03D21F031E5
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792719632;
	bh=+9YYjmGgAaJ7EMORGFSbBsWkUkc9dzDPtiE0Gn+pjLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QYnnZOAgyGqsBpIehYM5tf5nI7sJXhgOSiMb4zOmPoimgBqdJzzyvoI8LkSGeYWD8
	 vt5QxL5ma+/Iw2De45qyIfTpGzhc1HLSQNvREza/WpAo3cZ09ICf1yzlTsgDcHaAcK
	 6pIPgoLldSD8u0Tc1EkUe/h4iiNNozkthNk6VxY6k0EN4r5Oo0veMB3MS3tgYxtYRl
	 firW5GymKP+FSgDfomA12c/G6yIYlpUSqQJVqNHwR5tb/4TqL53r96XM3nIS89Xqdl
	 EV8QSuweFHeWvd/XDP2LcRpcvGcDXlvpXeoP7aRPDMpkXsBwNDQ1L+BgxZQiSEHsc8
	 gfPtfC6GOfUqA==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93c5b7f5bfaso152045485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:40:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSKgqDEKiQaGvGV6Pk7t6oZJPWEgEGUPItLCco4M40iYdD0QtQl2KB/RD2DZ0t99sr2xa1O5VKI1H82Bg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWpHPFMEx6QSeUewye0Cog1iaAVPVd83BholK2vFD4kZpt978E
	h0C3zvNGpAltD0LhFhZzvfKUi+DiYmdDvJPJBWtvIWTDzi1UGlx8v5z51iPYgm4j/mp0kfbyBVV
	Xd742yri53ZkqU68W2EKsFn475BkwWuo=
X-Received: by 2002:a05:620a:6007:b0:93e:60b7:eb1c with SMTP id
 af79cd13be357-93f6f78e722mr201796985a.8.1792719631974; Thu, 22 Oct 2026
 18:40:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0cbd219d-f69d-4f72-aec5-43e1f2d978de@linux.alibaba.com>
 <20261022102726.56682-1-baohua@kernel.org> <fc302ca3-6bf6-4bde-b3e8-8d2e93a4e4ac@linux.alibaba.com>
 <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com> <4e647816-0b8b-4a75-8777-8580a574d752@linux.alibaba.com>
In-Reply-To: <4e647816-0b8b-4a75-8777-8580a574d752@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 23 Oct 2026 09:40:20 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xVR53NcKuN3bA6v+O=37PeQ2Vnj-8WHo6ScYH96N4seA@mail.gmail.com>
X-Gm-Features: AclHuK_amfUjgaamNRqs111mMiTPJ2p4pxakjawSZik98l7IETdv3hokn4kCA-k
Message-ID: <CAGsJ_4xVR53NcKuN3bA6v+O=37PeQ2Vnj-8WHo6ScYH96N4seA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache in MGLRU
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baoquan.he@linux.dev, 
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, liuxiang.277@bytedance.com, 
	ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 9:36=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 10/23/26 5:19 AM, Barry Song wrote:
> > On Thu, Oct 22, 2026 at 7:26=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> > [...]
> >
> >>>>                    }
> >>>>
> >>>>                    if (should_run_aging(lruvec, max_seq, sc, swappin=
ess)) {
> >>>> -                       if (try_to_inc_max_seq(lruvec, max_seq,
> >>>> swappiness, false))
> >>>
> >>> This is quite tricky. If we pass swappiness=3D0, anon aging will be
> >>> skipped. Do we want that for GFP_NOIO cases? I mean, these are not
> >>> real cases where anon aging should be disabled.
> >>
> >> No, we have real use cases where 'vm_swappiness' is set to 0, which
> >> means the workload never reclaims anon folios. So in this case we don'=
t
> >> need to age anon folios.
> >
> > My concern is that setting swappiness to 0 for GFP_NOIO also skips
> > anon aging, making it behave the same as a real swappiness=3D0.
>
> It will not. We will force anon aging for GFP_NOIO case.

This is fine. but what I am saying is that the walk.swappiness and anon vma=
s
are all skipped :-)

>
> > However, GFP_NOIO is only a temporary state, and subsequent
> > allocations may not use GFP_NOIO.
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792466541;
	b=eNGcqUTtf+pKlKzfiuy3tyq76WQRHlAU08tlJKQrQrrB67Ys4fZmKq54BSg7yn3h3bqJ
	 oANQFFHvVFyfzkDvj0Ja2e83wGRFxxkntXQAU38K7BmzaRdbKQrEgyX3N7TUBenGUfL3W
	 Wd82G7ecB9BEsVBFHs0QO3FfjEPOzYH9mYacpypUqf2v5HrEEeZqkADV4qXYXY1PRA0Ja
	 ZJkdWcyjVcIzV3jnTSqRp8PBuKfwuRj5PUCDMo7ttstnOwlBcd6aLaedADYNYGsFn2XmL
	 fO5WsxedFyM5OJxROWikPqcQzQ9YHNjy6XB+dHnM4OIQnzR3AEDB0DMmqxSN/GDUhAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cY1kNjH6CTClFeYN/iyrgrNNHN+n4ge9oNe8/oefZ7k=;
	b=ZcDYyI0n+N0+kxuslRp7W6znhv2CF+ReEyC931gumzpE4oRFubONPlxYvu4ASWmwUdUW
	 yEoSZEMLmP5YLz8WX/9Z6jHP+fFGodGxC+MH6v01aROWAb5VXmR4AABTWR8GY7gy2Bs1T
	 QgsaQBRgVhg63YnNura93PAoc9BbtUWFOt0ZjhDFvt/kM2KMHTowMy3QfDxn1x+tfqycI
	 +cSFQLfJrcEtSvlaXruPxlDe3qbu+PkME9TpR0ef8wXj23xReSseI3hxHphUHrQXDAm7P
	 Y/z+oAoA8Pt2tuuJw1BC2jyg9x8agEn78rZFAUBQhmVHLd9bimpuvQGateyS+lWlivA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yva2Ow7e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.70
Received: from mail-lr2-f6.google.com (mail-lr2-f6.google.com [74.125.230.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4ABF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yva2Ow7e
Received: by mail-lr2-f6.google.com with SMTP id 38308e7fff4ca-3ab1be9340aso16420451fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792466539; cv=none;
        d=google.com; s=arc-20260327;
        b=jpJ5mmyI9iQG7/f03+hbtWr2S0IerrUNqNumi0ee2EvKmLkQ73HXgcyEmxsEQNFS7n
         40qqLEoC6ANVWlDT/3toKW9VbhOR7XwfRj00slNp3e49iTnQnRWJfEiEj0spLBU+DvjR
         NPU2BCrPs61rmQndWuA/4qse2VS9k03RWvTxBHJq8RbUYwZK53L9k/zubxKEefUi7MlU
         r35JDKW1Bq7S5tAS1rD2QVWfv1IZ5NNpv07555/XxeWawCjOllZ4GkR32RtWWrX+sWBp
         E0Z3E5yNkOyWQLmnA4mV6OD5g2uydY/WxqFvKFJSuyeOCckx/JR7yBeywv0pg13cVyQ4
         p5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cY1kNjH6CTClFeYN/iyrgrNNHN+n4ge9oNe8/oefZ7k=;
        fh=Gx8zbRPJOMLYbSQZFIQlTcns4+bPHGLI5PEdOyR0dxc=;
        b=XtLhTbWsyfqamcqXmrjB64rRn95xXZYnAD5SW+3RAtTK/ykg2I8FDfi8XSK/ptKseO
         G6c0rD17aFlk8LxO4AWGU8SFqavUaUS4M+vA+eUB6viajeE+xCBOBwvXPkgfJbhvJfTd
         BZu5Q7V6HLMZ47ZhiOlLLfINwQZh8maM8kAR1wBbhnG1hkktjYKz0pHDtu2sR0Mt41Ae
         aqBiv3erWdlpOQZ9TJonRjbHNw15hGK+zf4wNs6uwiREJEOexh2wnLKQdfjnwHtDUi+C
         poDouDkXXh+rZTBtnfUOXHQ9ZMHopC/i5dqcUC7YrL45ila5nvI5R18+rOCVORYM1wVJ
         V+zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792466539; x=1793071339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cY1kNjH6CTClFeYN/iyrgrNNHN+n4ge9oNe8/oefZ7k=;
        b=Yva2Ow7eFb656UdLLGtRa+Q5PuufY3c2RKDcuH/JRnU4swzd8grEJLpk+D3swhFDWc
         6rszv6Mb5CEeudQY3pUkskXCda0kQZ3IhKNpIzZbQihzE97wCaS4X4zs4uWEhcUmaDwM
         pU8DowKPRrQmKoTifjrS+84ZGjvYS/Gcx6dimh2pG/p0BWbd7V3qdcz5iv5dUuKwqsde
         8+s1/75NYdSwgWS4tARMxzwWItnSkNV/y745wwCrlZgqBRuy6ECGpMupx4vIp9tEVJE/
         oyj3eP6NTUt8z+RuPmz3RF2CC+0xHr7LuJ+o4mBWLO9drmIEC6cSh3V6VWw5TfPkwkbU
         KdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792466539; x=1793071339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cY1kNjH6CTClFeYN/iyrgrNNHN+n4ge9oNe8/oefZ7k=;
        b=LYDFlkxglA7irChV7QDI4oxD8P59rnj9h3bxz0yvfe+QmAdGysunkiejGruMDmuMX/
         2sV64ujNiK/KPYAxXyO313wYuVgWYGqEcBIsx8JEMxxPqo1y29kTDnzOElTgcpDhOpBs
         zctcY3CaCy/Y2K3U6YcybWDrrLLAZGs2VFwtv3c9hPr+IqE+EFplXE/r0Mqyk1Uk7b41
         xvbf57eQt3nKSKw/q+jomirTlzcKwOQpz+5kmnv/RujCPjdpco6Ea6sjbwZlu9MOKSg9
         xyL8ih2CeHlUYUCy9GgTcNuJb8OMw/4K8zmcbdQbvKlCf/l6X4L1fYBaF50BJaHFrDvk
         kQRg==
X-Forwarded-Encrypted: i=1; AKwUvBySt1AULU7hXCATThw9K2gj90H7V7vv2eqQtlG5Eomq3AWGIE6+1WnVvPMNiNJeq8ZljnaFysjutGTzx8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNzwNCVM9syIbckykeDtUZl8U53py7fMeKy8p3QF22VYowwrzW
	Ds9NEeJVKmZQqIg4zZgrqk6RM3lLEY7VwRbVxQ8/dYa7dL45ipU5GDI3pMEbHpYez1d04NFlaEm
	9bFEwSOA3M3rwFM/4Yz1tEhxLPYBFrwk=
X-Gm-Gg: AYBFou20VSsVPV+e3ufSN8toQ6rECkjbboemnZFRWci79QOxOMRm31yxpwRSTIcXkfz
	oy81dDPs2RIFXplmMsn698KLoTxzTs+i+wN+VyVBYATzj1dtb0wv8izjCgRqSJGLyykDRaQJyki
	3xkeZXon7Xd4vn8WiSM/SwAVetfLhdCK/qpWVWPUsopg4lqXKJc7ITuZ9EgmukgdcVWkRIp06I8
	sbZOv5NdoE9gHhES6RFMPmb1mqPF9xKeIzSX8WK/HslZYGiF9PJhv57gVnC/ZnlDRi9KBBDe5Rg
	vtbqMC7Hc8SzFcG7gBDln3/ADJ4gJu7Nvzlb+GMJyFA+m1JlgEwmIg1oetNlRVzdN7s=
X-Received: by 2002:a2e:9a11:0:b0:3a9:9a2e:27fd with SMTP id
 38308e7fff4ca-3ab28e5546amr21208551fa.0.1792466538609; Mon, 19 Oct 2026
 20:22:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013023859.3075601-1-bsdhenrymartin@gmail.com> <179194560847.434549.7995246256511325364@kernel.org>
In-Reply-To: <179194560847.434549.7995246256511325364@kernel.org>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Tue, 20 Oct 2026 11:22:05 +0800
X-Gm-Features: AclHuK-wA6sU_5A6DS2WSUmad9ryl8AYp78MFW2aK-N7YXRESF26bZPc5GEv_lk
Message-ID: <CAEnQdOoE8J9KV7R0Gw-1Gg4-dnFKcUq4woX1nKKK9Nm0Ez1Uiw@mail.gmail.com>
Subject: Re: [PATCH net v2] netlink: fix out-of-bounds bitmap access clearing
 stale mc groups
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nicolas.dichtel@6wind.com, 
	kees@kernel.org, i.maximets@ovn.org, leitao@debian.org, jlayton@kernel.org, 
	kexinsun@smail.nju.edu.cn, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, the Medium finding is legitimate.

The 64-bit claim in v2 is wrong: group IDs are allocated in
contiguous ranges first-fit (genl_allocate_reserve_groups()) and
genl_unregister_mc_groups() only clears bits without compacting, so
with ~59 free IDs against ~54 in-tree dynamic groups, an
unload/reload sequence can fragment the free space below the size a
multi-group family needs, grow mc_groups_longs past 1, and open the
same stale-bitmap overflow on 64-bit kernels with in-tree modules
only.  Only the privileged module (un)loading requirement is shared
with the 32-bit path.

v3 rewords the reachability paragraph accordingly (guard unchanged);
Cc: stable stays dropped per the earlier "no reproducer" verdict,
maintainers' call.

pw-bot: cr

Regards,
Henry

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=B8=89 10:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The code guard is correct.
>
> --
>
> netlink: fix out-of-bounds bitmap access clearing stale mc groups
>
> This patch adds a bounds check to netlink_update_socket_mc().  With it,
> __netlink_clear_multicast_users() no longer tests or clears bits past a
> socket's nlk->groups bitmap.  Sockets whose bitmap was sized before the
> multicast group table grew are skipped for groups beyond nlk->ngroups.
>
> > With in-tree families the overflow is only reachable on 32-bit
> > kernels: the ~54 dynamically allocated genl groups fit the initial
> > 64-bit bitmap on 64-bit kernels but exceed the 32-bit one, so the
> > table can grow there, and a later module unload then touches bits
> > past the bitmap of stale sockets.
>
> [Severity: Medium]
> The guard looks correct on every architecture.  Is the claim that only
> 32-bit kernels are affected accurate, though?
>
> genl_allocate_reserve_groups() in net/netlink/genetlink.c does a first-fi=
t
> search for a contiguous range.  It grows the table whenever that range en=
ds
> past the current capacity:
>
> net/netlink/genetlink.c:genl_allocate_reserve_groups() {
>     ...
>                 if (id + n_groups > mc_groups_longs * BITS_PER_LONG) {
>                         unsigned long new_longs =3D mc_groups_longs +
>                                                   BITS_TO_LONGS(n_groups)=
;
>     ...
> }
>
> genl_unregister_mc_groups() frees IDs with clear_bit(), and nothing
> compacts the remaining allocations.  So the number of live groups does no=
t
> limit the highest group ID.
>
> The initial bitmap also starts with five bits reserved:
>
> static unsigned long mc_group_start =3D 0x3 | BIT(GENL_ID_CTRL) |
>                                       BIT(GENL_ID_VFS_DQUOT) |
>                                       BIT(GENL_ID_PMCRAID);
>
> That leaves 59 free IDs on a 64-bit kernel, only about 5 more than the ~5=
4
> in-tree groups.
>
> With most in-tree families loaded, can an unload/reload sequence fragment
> the free space enough to force growth on 64-bit?  For example:
>
>   unload nl80211 (7 groups with CONFIG_NL80211_TESTMODE) and psample
>   load psample, which takes part of nl80211's old range
>   load nl80211, which no longer fits in any free 7-bit gap
>
> At that point id + n_groups > 64, mc_groups_longs becomes 2, and
> __netlink_change_ngroups() raises tbl->groups to 128.  Sockets that
> subscribed earlier still have nlk->ngroups =3D=3D 64 and an 8-byte bitmap=
.
>
> A later unload of nl80211 then reaches:
>
> genl_unregister_mc_groups()
>   __netlink_clear_multicast_users()
>     netlink_update_socket_mc()
>       test_bit(group - 1, nlk->groups)        /* bit 64 */
>       __assign_bit(group - 1, nlk->groups, 0)
>
> Without this patch, that would be an out-of-bounds access on a 64-bit
> kernel with only in-tree modules.
>
> The v2 notes say Cc: stable was dropped because of this reachability
> description.  Could this paragraph be reworded so backporters don't
> conclude that 64-bit kernels are unaffected?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261013023859.3075601-1-bsdhenrymartin%40gmail.com

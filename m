Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981020;
	b=ugh7/q844UrrRnapzl03dczN8OELBsdteZrcmFS4TB1Z3um8DlDax6MTp3OdsREhe1v0
	 sOQAh0067J6CvALfGbBM4lww/VfEsGTOcBvvSqSzLC95KSSFMTRA0phPc1J1H8MEv6xqz
	 UKVvRwhlZFvKHDVS/8lPzLjYiZMhXbDSFigD75541RAoEeoCosXas/k5Ng0OcUnXQL5+3
	 mvLRntVdBNPfMDIytgL0fz6HReLG8jjWQU38MkXsyQSYElXFcy6eiDEXy+sp0JWuU2b+1
	 bczsZtJfxn8nFi/ozal/rQkBGmQ+WpvHVl3onktYXcOLj6HocUGHOqCQtskkVwAVHgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DGR5YjEm685OZ/rx88bvzwn+cjlOF1BBljJDBEoYuYc=;
	b=eorcTHI5jYLgbrddslvusxGAGYwhf9W5/ZJzwDQW/7eceo0mrHcUx49F1Ggcpm/6L7be
	 9r3x1cnNrHvF6WEk0s5cnVV5TS+c4sURx4aGujUfIRCJHsYBhgWPZ4CrxP0Mwbe+EqJgq
	 GPzfterw6BfQgPTvHQ949wkgXsjz9chUiOe7Zwb0xeENMZbeIhbdR5haaX9SKyz/uLFDY
	 zLqTiK3i6HaUlf/DrsewKXplrka4SdwoSIV6+SoPMBsgb7MlIDtawUQOiPoBHQIwllppe
	 vVBxCCbDUjZ0bEIZ3veBd+sXwMXoXqjDDREo1HqMNxZ/yrob10/mEqzeGtzJciQD9ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KLjPWfoH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5B4606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5B4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KLjPWfoH
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso767495e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793981019; cv=none;
        d=google.com; s=arc-20260327;
        b=fAhbnDpa6PVMLcjyUg5ic+HP//nMWVIZxvnXmlVnjBaqOzFOzBFRUOO9CLz3wVETxn
         anBBQw5dGRuHqNJpa/jOV9O0J1iokU33VoNeXw5J8ZepPNLg8BZCoCQJ3ygnrjVKr4Gd
         Odc1oZyyYxiwvVb+fU3iMI5wqMiqFZqz8zjmdRuQN8J5kc3qL/RL7RgheIM5qUIFuw/V
         qQaSOk+pdZoGgdcGjeAcwAwUDeRlhmglemA7kBmEgierccTUXT5AQiNMpdkTckR+FN2B
         ifTjH6jgUfSn4iX+uolhv0cX701gOfRuorEURn6n8hwZ7v5ihN0BxrcpBrw8WSDIRt70
         uNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGR5YjEm685OZ/rx88bvzwn+cjlOF1BBljJDBEoYuYc=;
        fh=tx9yzYkrPNotIWPY16ibBD5QVFcakWKQgjVZzELFxfQ=;
        b=JODxnSz7L96iDS6vDWUBrLa5ju48kvewJFviH3YFdcS7LbYKtAXd60pqIRkUnsW6Uo
         f5ezEL95DnEwGsiDEx4kpBGnj07J3sP1SDyx3Vjov6aX/L8ynP+zxEq4SOk4mW/rR2rw
         aoqiQXdgxykCc8dRW6ThN1fFzc+Rw3GDQ0JrHpPMAoIU1gDL1sbc9kMLI94cP5yBKMO5
         wiS+X6xsPKi8cyltehYecVPcgyV0uL9L3LqsaTKvfHS5cUlhRwe5NzKkUkSuzC5Tx+As
         XLN4ud3uYU4RQXRcaB/BlvdRJbb4Sdv5g7OmgyEy9NtuGIl5oHeFVgQjeK5M/FdGnEI9
         FvUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793981019; x=1794585819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGR5YjEm685OZ/rx88bvzwn+cjlOF1BBljJDBEoYuYc=;
        b=KLjPWfoHPR8YuR6I81A+kxVo1jfpM6dV+oelSWVT8OloAyzX5GoJLDNkIhwvBSJh37
         tZwvJZwZkX4peEenNCipsHAs7ISHxSIA2o+4YTqybeIzo7Kcksal2X00E54sS+dkOajK
         T0PNemq25JOBFTyhPJvbgPx3QJBMCLii1hhBXctBV1ngpHwGfD8lV3zaEZAOz+prJSdZ
         vAz2HTASWcZZm8BVrjZwYeEB8FP6YjMoGQAaxWBVb9zD3/VE3UQBBlhZHH/OzWdToYve
         iNin+4UdnqJIXuPW2pH53hD1gQr0grprOm6u1AmzXIwoHXF/jeE36AiaCMWQPxaISGWK
         3lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981019; x=1794585819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGR5YjEm685OZ/rx88bvzwn+cjlOF1BBljJDBEoYuYc=;
        b=M/OHUG7nsWWHPaLhO/zdY1xaRunEg1fRc337flQpm7CeBOZZ1o3IWmd5WMVU/GJ/lV
         mkqA31UvodFcez9iG1DXYHIKyaAdatsMZYZ8DogyF1p/lnpUMXzg/ZA+3dXO274PtroQ
         1ytCrTBMBJbCT3HXVQaMl8QEBEGGoYBe3pScRT5gofdVBpmOoNWDXNNuu4SiHHA7iQqY
         m4vbNSEnTcAl/w40lJZZt4JGs2W5GQA/B0Gdewsg9Cxibiu4Sb/qd8F31QV3t8hfBHeI
         pY867KlBF+/ym5oVyNFjmZfwqd+sXiXZ/UKRph6EfrNO0ZhdMWVkAAhWOcirJiozkHga
         csiA==
X-Forwarded-Encrypted: i=1; AL+hErFqkIecmdb44tBIPX3V3gFhN/kBMWyGiutC8TGzwckkwW532l99SWpimLj972ekIZPzTBtEIiIP5Ixpzxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wwHGci1cchryAIdvmZUbzXz0pF6W2VUaxFXEq1YNOB5v6vHnT
	ldwuj0GCsRoRAiDUcMbMKfkVP01LxQh7rJ+XhfAH+uEavDW9zPtqbebE7B9lMvIQNBwqkzNy4QJ
	tx/UTi8TVSrR82acNw9LsgICql0kK8xA6ElmIZP6w
X-Gm-Gg: AYBFou1G7VCLeh/KUtYvkzY3uAAsS9dCYXNztUR1yJEfJycNHlyiIbEhflr7gbUi85j
	ShdrcxKKupVSX+iIH9IlrcveSe/SRt0biJXEP9FjUvLlJz+42MXzzXA3345gDuwL/+5pYhoUkQ3
	fSVu8OU4GUmA4uiqEy1pmV6ds0cr9rvhV2q+bOsoaPWOFAP3NyGKZ9FfaGn6sLy/4gcduHcu7XN
	dYaKoYNjOLGbfnCBkKRhLS+w75aiVvOssztj4n5SmDLkQaNboizrvG8mPuNERftX66Hh6vzZK1X
	8s+7LzZYiYLrKstv7tQe33fIw5Fjuiq8zjcJXhaaqHUVuUWxS0tqdc4dazCNr+yFFXMpgg8s3n4
	M3eUjicGNWavWXzmEdVAzJYZ6vHElLbByezywWVZA+WkR6JPgzk78REmmjeotFONGGulowwOec0
	RxZ8wBGN8pNu5mI/4ZV6fq44h4Z4Frh9qpUlHg01bP+C8S5YQuhNfaF7p1Dj1TzIM97X/WgGr1I
	mmrLAwwv0I5XmBs
X-Received: by 2002:a05:6512:318b:b0:5bc:c325:1260 with SMTP id
 2adb3069b0e04-5c003af2fe5mr885526e87.55.1793981018177; Fri, 06 Nov 2026
 08:03:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101094847.664612-1-ahmadag1001@gmail.com>
In-Reply-To: <20261101094847.664612-1-ahmadag1001@gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Fri, 6 Nov 2026 11:02:57 -0500
X-Gm-Features: AclHuK_Ym5wgDgAVOxJuUoiUSTWdscx9Oqcd2h1sVKKBXEnrl9lAZPSG4NlRiU0
Message-ID: <CA+FuTSeFzFC7PODaQMAXHCg4ZKzvjhHXHbLD6MnNB8BxO5Sq4g@mail.gmail.com>
Subject: Re: [PATCH net v4] net/packet: account user-triggered allocations to memcg
To: Ahmad AG <ahmadag1001@gmail.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 4:50=E2=80=AFAM Ahmad AG <ahmadag1001@gmail.com> wro=
te:
>
> A packet socket makes allocations whose size or count its user chooses
> without charging them to the user's memory cgroup: the blocks and block
> array of a PACKET_RX_RING or PACKET_TX_RING ring and the rx_owner_map
> of a TPACKET_V1/V2 RX ring, the PACKET_FANOUT group (about 1 MB with
> max_num_members =3D 65536), and one packet_mclist per
> PACKET_ADD_MEMBERSHIP entry. CAP_NET_RAW in a user namespace is enough
> to pin memory far beyond memory.max this way.
>
> Allocate them with GFP_KERNEL_ACCOUNT, as the AF_XDP rings do since
> commit b0057c68df71 ("xsk: account ring allocations to memcg"), and with
> __GFP_NOWARN where the size comes from user space, so that a ring or
> group that does not fit prints no allocation warning. Fixed-size
> per-socket state is left unaccounted.

That commit was sent without a fixes tag, probably to next.
As this change can cause regressions, it seems correct to send it to net-ne=
xt,
or to net, but without stable. As the patch already suggests with noautosel=
.

> Reproducer, as uid 1000 in a memory cgroup with memory.max 16M, after
> unshare(CLONE_NEWUSER | CLONE_NEWNET): open 64 AF_PACKET sockets, give
> each a TPACKET_V2 RX ring of 8 blocks of 1 MB, mmap the rings and touch
> every block. MemFree drops by 526052 KB while memory.current grows by
> 1280 KB. 256 fanout groups with max_num_members =3D 65536 (265144 KB used=
,
> 512 KB charged) and 100 sockets with 2000 PACKET_MR_PROMISC entries each
> on lo (45220 KB used, 124 KB charged) behave the same. With this change
> all three are stopped by the cgroup's OOM killer. psock_fanout,
> psock_tpacket and psock_snd.sh pass before and after. Found by code
> inspection with the help of an LLM and reproduced on an unmodified
> kernel without error injection; tested in a QEMU guest with KASAN on
> net.

Can drop this iff respinning, or move below three-dash line.

> The ring pages and rx_owner_map were never charged, the rest not since
> commit a9bb7e620efd ("memcg: only account kmem allocations marked as
> __GFP_ACCOUNT"). The Fixes commit let the user size the fanout array.
>
> Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size configurabl=
e up to 64K")
> Cc: <stable+noautosel@kernel.org> # changes memcg charging of existing pa=
cket rings; not stable material
> Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
> ---
> Tool use: an LLM coding assistant (Claude Code) found the missing
> charges by code inspection, drafted the patch, the test program and this
> message, and ran the tests in the QEMU guest; I reviewed every hunk, the
> results and this message before sending.
>
> v4:
>   - trim the commit message
>   - add __GFP_NOWARN to the fanout group allocation
>   - use __vcalloc() for the vmalloc fallback and bitmap_zalloc() for
>     rx_owner_map

Agreed on the response to the bot: some allocations are purposely skipped.

If a respin is needed, worthwhile to capture that choice explicitly in
the commit
message.

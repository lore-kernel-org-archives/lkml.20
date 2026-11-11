Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794387461;
	b=VKvW+Qakc8nRtd7L9j+StiR7MbWKlUahGx4qqd3JRKjExowhiqiEs3nNh4JiNIXj11wM
	 qKUmqD58frhkc9R1Authil/zyWit+ZY/6cbpZVk52irNeEjBCJNEXUKi2+JuGN+n9U8K3
	 A83y3qNTC/wN5sD3n3u5nWDJTAQBnNpCW1241FVM4HktmQLIj9+ZuxH9I/CioVgWT0Hqm
	 B94JUQzkA+2ebwoBFodQMCFXmBZ+2VV6V2ZLTm2xFrkFi04TVkpb8y33Li5q/0KOFX/LK
	 E1uiPzKP9suv8dACfzaFhmTV4u02nIBqVLj9ehEG3NTwhvw+xuxma1VjZpFyclYw57w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3+2GeyeiktPWIYhPCUX0ezs+W4stQcbxkOT2VYFqeLA=;
	b=R6emInKr5xfrQcTjUtOjR0TNLfvpDWNDytpBiVuPYIhJ7Mb63F3PFIdjLHezluvJe+7x
	 UGXXvLYtYunFKDDnY2wQcM8761ArOvVa23/6WUVgPhZ443SjRNdGbQVaEahkXF9WCGDhC
	 GVSa/lWkHLR+UwkU3ZDEhM0tqfIKm/fxt8RayHyNBe5Njo+9lSlHOxlG32RomPOg7s8o9
	 ydD3su0LkR476dWMq5Gk0iVHsOC3xVOmAwujd6btAnQfuAV4o3e0PNY4QqVvhiXnrMSek
	 brrV5Y3smMcQdMCgNgSxV3PMjkYr//hjSITrKvrmD93JBu9/tTXnABBHd7cuAQeh71A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGnWN9hj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EB1606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30EB1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGnWN9hj
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3580447a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794387459; cv=none;
        d=google.com; s=arc-20260327;
        b=WXMMKcMUMr+cnQufj+3dKm0MoFsSxLzZar9NKYy/MdQ1GRByTNOzYz6aV59TRYWFf1
         nKfpgy5JoksUs2LRtYY0t0AOAsB0/YSIqn4rND5t3PyboGtkBISGTelt4d2cOSYH8vMd
         vYz25lgLgeKCDDfhQOTm02Hflq/gylY5lticSyVA3IZA2w5b0S7PJOo6GEaGZfHqb1XH
         QvUeY3VfMX1N0096INIgeCBNKuPHWlX83LohylbXluyhpP2iPUge640gBRG31HeXtskQ
         BiUJi8S+WP27uQOdzPLw0fMjFVHYdadLjTQXR29eR9FO3q7IolBHt9dmDnAeuG4w2g0r
         CpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3+2GeyeiktPWIYhPCUX0ezs+W4stQcbxkOT2VYFqeLA=;
        fh=FnN69KQkj2pdEL4FJeurxQg1K7YuhomkPwEhGCgwGVk=;
        b=m6ViBp1cfSX5do59yn4ZEvQ2dPvfmFDkvkzKGWDk6EXLUPxyaokzz0ui43P0iTmyhQ
         Of5uQ4d4HFoFroX45yRQwiUNc1ZHEBU6wb5CtUSFhEcKuqex/EP35Ij6gxDyypZ3W0zp
         pX/GYKqL2xVd8A1sMTuRZWDGUbmWHZ6EXDVTqsTnx5GzbXX8DGqGCOEsroMJ0YLfKjs+
         948hMWgaHIEHow8w0WNGOhXMUIwBu/Mjl65US0N8Wq0jeP8oaEz4akU6xVnBY7SGhCuD
         xZyf8dqK1JeeJF0inuDk4McC4D+WbCRtC5TnZPJ3hVsAQbPiy2djHR4mIpfc2lEFTtOL
         I5Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387459; x=1794992259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+2GeyeiktPWIYhPCUX0ezs+W4stQcbxkOT2VYFqeLA=;
        b=TGnWN9hjQkXsTTeAcowXaHsysAVtv8Dn2mB7VX/EUjS+uxdheNbIVJlJ9ydCDUh6tp
         TNM23Ari3ib+MIkMQ5kHgD/qIv7yzwE4g+aTz9mMiR1X5RxfF3GwqMzuaKGJHoB+X927
         f1rp0VyfA9JhPEWktc5thMRIXvPyMQYVpHggYrXg+01EtVPXTc7Mddc98QMDFV6SmDRr
         4d0mtyCrC+0V2QmXdl5U6X3d2gYNXCUKPtTGpdt50nSPMB4MZcVtwP+t1Ami5xYQMBFf
         23xdUhbRjKW6eVYSDOLmauod7zPsS7cSug29GV17BVgOXccMeT6uaoW1m4c4VnJFm9EG
         GKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387459; x=1794992259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+2GeyeiktPWIYhPCUX0ezs+W4stQcbxkOT2VYFqeLA=;
        b=p+GUkR1a0Yas8GpfmBNUHKr6m7S7yfEShdzDzuIyq+hG/zkcJoCsG3cRpVIR2bwgFZ
         7AgRU40h0uBVQCSkqGdQ4/VbwTYphJYlkugigLc1rQJ/+VWhxS5U1kt3S2L40GTFejE4
         FdI59L2UbPg/fdeFfWMOMHC4l0oidPZA7ds95uknUZKp1t5kdQNTxpLI9KcdAO9zPaeM
         vrJ8hZqIcyVYdsa8zoUDLQB+8wBfw/qarqVvdXBx4OgVQGXW2+oLhT+lSWCf+5stcjER
         jKg0cGtAP1nyJ2CFLmyQoMs1j3JCkDdu/S806L+OqB+xgAV9OcezM5N5+mKCEiOU6c1G
         XGjw==
X-Forwarded-Encrypted: i=1; AL+hErGWBCzwp71y4xCQ5oRLqvbUuRtoRGXeAf2P5RrKv4+/jgVnBrCzeub6LZeFp+Dypxx/b3gUKDTPoWxXztk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f+3oNJE0L/MUdho3Sq5xVebIByu6pATeYIDqQlXDZ+4qkH8z3
	htl3bDqrxTALSRtyeminpTOLIHvzFrorA+9La7aKDzSruvM2XXaxtGnrzx1reYxO0McTBEVMyXz
	GlDXcADxNMk6GNnZpnwHs2LLscdQT3bA=
X-Gm-Gg: AYBFou2AYRYkHvTIq0xBv8fiXT3ynnuBqzX12iuR2D+1xLaf0V2xfLnLjzVB1Df7AtU
	dIiBoTr7wEjeGVzxPz/xffTTAJJnFKQJ41mTV/AWAFugK6sIbLH6TgsXkTpr/tZXghp/qWWQ5pu
	4t08WPfwZuPEJ0vxib9L0i2sAihjGhzyMnmfwkJYpBcYVo0B8TzBirbh4HWSGK2AHwGpBKd9zBe
	LJUBZmxwAFAzFEw2QU1tCIhb+Np2hMEPYgHJ/8J/Dg9eo6uKEjbe/ddUWOs+SwJCv9rERLZ9YG9
	6Dw4nX1Y80ZPmRG7A59JTNXA+NFMIrCQP7Pm5aiGo828Iv+7v7dxXSFbwn/tXFW90qNnLovVChs
	6Ua5bi9C9hGqu21sRtfkdapRUnMpJ7FInmAKOlEfWj107lX83Y8EvjguDzcQuLjpfoIMfuQ==
X-Received: by 2002:a05:6402:a512:20b0:6b7:dc8:c814 with SMTP id
 4fb4d7f45d1cf-6b7775eba61mr879038a12.27.1794387459367; Wed, 11 Nov 2026
 00:57:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111000913.22943-1-shakeel.butt@linux.dev> <CAGsJ_4zRycX9dcW6P1J2R6f+xyO4+z6_LXz1i+qbNbMEnYm9uA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zRycX9dcW6P1J2R6f+xyO4+z6_LXz1i+qbNbMEnYm9uA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 11 Nov 2026 16:57:02 +0800
X-Gm-Features: AclHuK-Ok8BVFpQUzx9SWnWjlX8eBeANeatd5JCiC55UEIemRs5iAoKwKc61kM0
Message-ID: <CAMgjq7ATR2RDZBg97ihoqDV-G8dEA+8XBy-G2xujVC7ZmMX8QQ@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: splice all generations when reparenting a memcg
To: Barry Song <baohua@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Noah Feldt <noah@feldt.systems>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 8:29=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Wed, Nov 11, 2026 at 8:09=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.=
dev> wrote:
> >
> > Noah reported list_del corruption on single-node hosts running 7.2.11,
> > which already has commit bf4ade7dbd76 ("memcg: keep folio's objcg same
> > as its node"). The bad pointer is an MGLRU list head in a freed
> > mem_cgroup_per_node:
> >
> >   slab mem_cgroup_per_node start ff31bfa36a3c9e00 pointer offset 528 si=
ze 1920
> >   list_del corruption. next->prev should be ffacf881ccc70e08, but was f=
f31bfa36a3ca010. (next=3Dff31bfa36a3ca010)
> >
> > When a memcg goes offline, __lru_gen_reparent_memcg() moves its MGLRU
> > lists to the parent. It moves only the generations (gens) from min_seq
> > to max_seq, and it puts each list at the same index in the parent.
> >
> > A folio's gen in folio->flags can be ahead of the list it is on. In the
> > parent, the same index can stand for an older gen, so the folio's gen
> > can end up older than its list. Once the parent's min_seq passes that
> > gen, sort_folio() puts the folio on the list for max_seq + 1, where it
> > stays until the next aging.
> >
> > If the parent goes offline before that aging, the folio is not moved to
> > the grandparent. It stays on the parent's list after the parent is
> > freed, and the next list_del() on it touches freed memory. This needs
> > two cgroups on one branch to go offline one after the other, such as a
> > container and then its pod.
> >
> > The parent always has MAX_NR_GENS gens at this point, so every index is
> > valid in it. Move all MAX_NR_GENS lists, not only the gens from min_seq
> > to max_seq.
> >
> > A reproducer that drives these steps through the lru_gen debugfs file
> > gets a KASAN use-after-free on the freed mem_cgroup_per_node without
> > this patch, and no report with it.
> >
> > Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios"=
)
> > Reported-by: Noah Feldt <noah@feldt.systems>
> > Closes: https://lore.kernel.org/all/20261110132853.71228-1-noah@feldt.s=
ystems/
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > Cc: <stable@vger.kernel.org>
>
> Thanks very much, Shakeel! I saw Kairui has exactly the same code here:
>
> [PATCH v4 14/17] mm/mglru: reparent folios from all generations
> https://lore.kernel.org/linux-mm/20261016-mglru-fg-v4-14-2106750c0bfa@ten=
cent.com/

Thanks for looking into this!

FG needed that because FG's folio_inc_lru_refs is a generic MGLRU
lockless lazy promotion, it may cause race between aging & lazy
promotion, landing a folio in a stall gen list. This isn't a big
problem, the worst outcome is a hotness inversion, which happens
almost once in a million times.

And right as Shakeel pointed out the problem already exists for
reparenting and lazy promotion, so we can fix it first.

>
> somehow, Shakeel's patch makes us need the change earlier even before
> mglru-fg lands?

Landing this one first is totally fine by me. The code is actually
safer and cleaner, in my opinion, with this patch.

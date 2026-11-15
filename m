Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775942;
	b=VNhp+qyzJwtjuJ2i8dNgF/O2660ltOfXgLhpCGeuVFF1IaR4t9dWmwVd47+tHuCoP4Fi
	 kHXkws9Fo5h+tP2umVQmZEX71m+Td07xfJaI4eeJbw1tJz0lkg31TsG/gosysgCUjXkby
	 d5M/QksbEjs9l/ivnVP9EtvEMmyhNnkbOnf6Ut4XBMaZhKGae5GoYC/JRXvbtDVJL3XJB
	 s3SdPf+Arb6+05pruYescnY6zW/D3QY6f9Of2yzeLKHxrZksuK836wWiAU88JQL0oXFXd
	 boDK6IdA/q8PiC0m6IaggRK/iC2zAOPwGA3oSQBqpg21PRbYc5vCVeH69rn57AoSSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775942;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u/AayYsTiNYt6mqT7iE2EqkKwoSn9pQdkbKI6ZILgR8=;
	b=iHALowhlwUqYxp0wAszgkkXG2GHP4ZigcZQ7qlQFh8RYEJmFYNuayHGCaOYystJ4g2IW
	 FP4M9gVYlJSQQEXAT4alZ9jFRk/G46LEu68szTTa53vDEEHBaXYXBqQruDN4dFVO8wfSM
	 UuiHaJpp3Hq/p5xb1nbsfVW8k564xECVO7W4L4+SiwxWocnbU6PjWaClAxg2+zojgrO3x
	 qEapkQP+8p1YeqsVEhnj4OrEK3HQzq3QVv46ST6K2eCswy9pOvNHdhNpHKRCPnRl9QU4O
	 qLNUcBlGrhlwc9DtMuJu/md9hefdQo5g1zYmysIKzXaf9OJvgnCBwGNif1BaP0PZ/6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BApUzOSF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCEA606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BApUzOSF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD8B1F000C9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794775942;
	bh=u/AayYsTiNYt6mqT7iE2EqkKwoSn9pQdkbKI6ZILgR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BApUzOSFrTeB5M/BZMRwMpckJyeCRdcjwZBO7NzEQqC/50kEG/LDPNIp9vhETuJOp
	 G76eGYelS9dsexMz07LwFVcrUtpS5NLYdf/5ksciheX+nl5XJL9wJZe3lChcWnovuD
	 Q5DSKtBjKgT8vU/rCFJftXTM8inADbP5J0ieCUoVw6XhLGSGHPm8oeJFAM/ymlhn1J
	 akCHeaty4ugqIR9FIqcxQHrRZQAtcdp7A8oSeUqo5VlzskapF7g7qQliDoB4Drqqmt
	 dOaOvWaz5J14Of7/8N702ZitJp14hxNe7vL7Vai8erOm8yQ0yyp8viZQDxnRq98HgA
	 DXKlN+9ZofxLw==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949589c1495so230217185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:52:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEL3aJUxXSvZhT21Tovy608zwG5GwbjJMsJcv549pUOs/6XiIVRslgMOXkChTAwDZm9QAOMni07N+tqrGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e6sR3s/a+G7oA+0aqAPKBd4we5nbHP9zcEps+DvBDgowbxoSf
	5/PXWrlEVmzAxjsZRkR4HNBYDI2onMV60esB3nS0BulxKhN5RU8duQ5grjXAFWFW0mzxTPt217C
	c3EA3ZPXRqCV6OK/7f3PKdOgcgNwoGas=
X-Received: by 2002:a05:620a:4607:b0:93a:2e8:5aff with SMTP id
 af79cd13be357-9494bbdbadfmr1497787885a.21.1794775941628; Sun, 15 Nov 2026
 12:52:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111000913.22943-1-shakeel.butt@linux.dev>
In-Reply-To: <20261111000913.22943-1-shakeel.butt@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 16 Nov 2026 04:52:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yjZAx8x64dbfSbPZ96XEWJKL5v8pHxQMiAu9i_QUnM8A@mail.gmail.com>
X-Gm-Features: AclHuK-EujoA04rdzSgJCrEu29bOyojsuZv1EugGr9GiyaZaSxW-KoiDaQwxUno
Message-ID: <CAGsJ_4yjZAx8x64dbfSbPZ96XEWJKL5v8pHxQMiAu9i_QUnM8A@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: splice all generations when reparenting a memcg
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Noah Feldt <noah@feldt.systems>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 8:09=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Noah reported list_del corruption on single-node hosts running 7.2.11,
> which already has commit bf4ade7dbd76 ("memcg: keep folio's objcg same
> as its node"). The bad pointer is an MGLRU list head in a freed
> mem_cgroup_per_node:
>
>   slab mem_cgroup_per_node start ff31bfa36a3c9e00 pointer offset 528 size=
 1920
>   list_del corruption. next->prev should be ffacf881ccc70e08, but was ff3=
1bfa36a3ca010. (next=3Dff31bfa36a3ca010)
>
> When a memcg goes offline, __lru_gen_reparent_memcg() moves its MGLRU
> lists to the parent. It moves only the generations (gens) from min_seq
> to max_seq, and it puts each list at the same index in the parent.
>
> A folio's gen in folio->flags can be ahead of the list it is on. In the
> parent, the same index can stand for an older gen, so the folio's gen
> can end up older than its list. Once the parent's min_seq passes that
> gen, sort_folio() puts the folio on the list for max_seq + 1, where it
> stays until the next aging.
>
> If the parent goes offline before that aging, the folio is not moved to
> the grandparent. It stays on the parent's list after the parent is
> freed, and the next list_del() on it touches freed memory. This needs
> two cgroups on one branch to go offline one after the other, such as a
> container and then its pod.
>
> The parent always has MAX_NR_GENS gens at this point, so every index is
> valid in it. Move all MAX_NR_GENS lists, not only the gens from min_seq
> to max_seq.
>
> A reproducer that drives these steps through the lru_gen debugfs file
> gets a KASAN use-after-free on the freed mem_cgroup_per_node without
> this patch, and no report with it.
>
> Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
> Reported-by: Noah Feldt <noah@feldt.systems>
> Closes: https://lore.kernel.org/all/20261110132853.71228-1-noah@feldt.sys=
tems/
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: <stable@vger.kernel.org>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

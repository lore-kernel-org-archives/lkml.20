Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794431048;
	b=h0mhwBp1eLld2QcoL0dp7GRKbFnl+a2mtNkXNOAGaj8X4MDGMRfVSAMWoHknggi2aYvy
	 B3IPcCvxhqxfTQIWhAne5+X1s9rkGvxFyq0YEZbg1BSgVKCAo6Rg6QuWgVtVPI4z7G2+9
	 QFDrh+Ns6xB65SykU0En+6sP8a06M0ytexNRiqJK6VCAIgSRz6ywy0PXmaW+WQmHLNgT/
	 2CkDZGlGUlkuqJFbzZytM8zTnubRCgt11DNQ9Uv8ZngPMuPJszL8HOFmCCT1I3q6nqvJA
	 4usaK9mmSacDVi9IFolpdyhfnLbdzjL+bwjUclAy5fIXcIf2UoNMyz659tKm+4NpiGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7jfAi01Q4CRlBo14NA8JUFvh8yBOtjDMjluJPzC/jYk=;
	b=OHzjfCP+1grjzllZrKROqtD/9WwfRaJvU1toQcYqW/gSzPGgfyC4ppFC3Wc87pVJpLA+
	 6zvOs6X9YKB+NmQZl2+TbqlGFNaid7lkz6d5oL7/mj6vyJBTEueL3zWo+O6NTTOy/kTSr
	 OKIoFmWUAWWMrd647twKPCyTDw94bLmF3n2dN1elbvtBWXth/lXgcNXmje8JgtgciXDQ+
	 vsErljLKMg9trarcgkUbzh22c1tjvZF/Mii0o8q4hzeKRJxZg9AhH3DJxsiIZy9LPVxTi
	 2JSqqPwebzJNTOmRiv5czaSvosu5fstwsI16ASewzsCCyiSYLHausx83txkxxnaGNwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQPKIa3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC489606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC489606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQPKIa3p
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-535f598d126so2301cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:04:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794431046; cv=none;
        d=google.com; s=arc-20260327;
        b=YE486jw+wX1ODBsDPaNNyYE3Bxl5pmg8ag57JXXekxkSahM7Xo+mk9iFc2KoHSWo1m
         gzbYkQUi2GWJXa1dNoO6c813ak+cE2FVIZUSqCVWcTEH9dAKkB25uS0vV6xJUWyFcOKh
         0kEoN8VtyBCq/2Sw87LlPBH9OlRRqyJ2I2+mtprzJbQXtJI61k25cRvsCTlo4AYu4vfA
         6YF3obleWpqLnDjksBnDn3xtQ4PL4fhlmz9L4xna4MohzgDHmRTu5i+5vGx6xH7kTvBd
         8EXjw9VwtaawlD/DoH5IST/457sahNz3YxLNBi3zzNP2O02wGePTecECVXZi3S5RHZ6u
         Z4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jfAi01Q4CRlBo14NA8JUFvh8yBOtjDMjluJPzC/jYk=;
        fh=Rmcbw+/+4mOQjVpDm9Ezk1nWgZknTTpYW12UqI4cx6s=;
        b=Zbc94QOyVOFrtuiYkvoEbRB0hQJiQnsX0NSiB/StV1Hq8p9d+ne/nAS6IvDUbbKOpN
         lN4m+/q3a13zTQkPLgVxQVqWuzg1VadPNbYItBK6445S3d4005jxbcVvvn7T5Cbmf7VA
         dWQkngWMh+22Uk2NWSucBHCAfAY8WjCKtSu0+/2BfpuOOc4In/mm4hKjO0QhJflv4v2E
         mc2vLOW/zzHn2YhqiG5OCCO6y4/469PYyUQ+FVwJxY/xQ18nQpxKXOOClvoJATPclfev
         2riEbwtU6qMQvml+F+Q3GevpRjaJUU3kiPGnF72/DzdYQ9Mfyo0R4IXiLdkKvxiRXEmM
         jl0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794431046; x=1795035846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jfAi01Q4CRlBo14NA8JUFvh8yBOtjDMjluJPzC/jYk=;
        b=QQPKIa3pMiQ6gC27nC3FSlX5R2pev//WZ6UGmWl8qqZMcL0sBaf079IKG1g+TlEb1k
         X4/4pERBeBvtqPQYSpialoTR+GnOUfDSlu+NAUw36Fu9d0PerVjKccJPlk/LvA6Uys4Q
         ENAlLjjuj5a5g+wjm7JFjbDU9ZKciHd7jGutPSC9mktg8LbQrznLktrjeDOa35D/5VzB
         tADYcDGQu3FGo0ML7uuQtKlA7S2Iha9ePa+w4xJhEk04zI26zCkn141gBqPWcjHae2+d
         9jxqixGhApVvZAyzvAZaTmOZXu8qpgxFUtjONQ3QHGoT7BGJw/vk8el2sTHv2IecAtb8
         U8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794431046; x=1795035846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jfAi01Q4CRlBo14NA8JUFvh8yBOtjDMjluJPzC/jYk=;
        b=aYzr478f2sROm88GMHuXrRhu42KrUxMf9wykAfyrioKEugkRmwqHz5TYreNF7d5JDt
         3PoG61nWit2s38sRoIOWMwySCPVbOZtamauCrcRHQ2yV/J34h81l0lACj3lHrZWQrof/
         enFOdzVbnobJeBsrIb0HtjQmUBjqCgA+BKMHu1cI0xW3rm3DMLY2N27bKqUmUqeXTxem
         SdBfiOFTCjst+JnJE/g/xLTOLPN5Gr+J+djuoi3BNBNKrTnz3My/WgvrAU5UCnmP/teJ
         bTmUKJTUlgjJBrC1yPwmGip5r6Trk/7UY9MU+A2Orrdn3HhZ89wgdITwKPUGxG2dgHVE
         xIXg==
X-Forwarded-Encrypted: i=1; AL+hErHVBFRyuXqE6NkazdgY0Yf0iCUnD4/QJF7mWe70D9UHCBMMOOZ7rpaoWJhLq7JA4pL+iKuZ/g31cGvrNEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8oJHns1g1cdzF5VLY6ocQrzd92/A1RDcgPbH6+guwwtmqqUj5
	ACoaoJ0A7/BgV3l+2rD9RZrbLIweSn90tNfUCS9HvulD87aW39CPnBbZC2Br75zHsHgfeEuVIfP
	wGBsKLtETr4Hf08lPjlJS1utuiNfb62Ruct1TDCV3dWaeNWyK+yUt9/Y/jR4=
X-Gm-Gg: AYBFou0GSpJYPyLFHKiFh9IZCtmZ7lgFH967aW2goT+4SqrWusUtbh2aM8XSUTE4oCa
	vxNDxj81JF+lsFAdz5MANF7iORds5/nRvjsJboi/UfEHUzOFuc5kjUIKywOcXEa4gljr4J8agA7
	1esXWJykN5VVYdfUKBtoEKueyx3TzaxxrAG0lK7RVkcJK8ZydjH8CcAQ8G3meBD9d+9BTJQaqUW
	E9KpQ9/BPmOYXpuyITzACw3oHkAhwLOU4yROJap8eskUNPhTVtGVsI4M7FvcWkgYHcMFsq3SWPN
	rVB431/CA4Sv8o+rxx5lc4Dmri7qJp9OiLZc8PKtXyrw36dbDk+Zrdf8soqRHPmweAMGhfawU1O
	zdqeM4Er4Ol8T6eR9beVN+gefVaWinUmr5Yorwx+UH7A2ZqYiqtIaN4V6HjZqZ2aAj0EmFTZgnc
	J0ECpC84nke2uLzjyic3AT+PgS
X-Received: by 2002:a05:622a:2612:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-559670434c8mr4152141cf.0.1794431045881; Wed, 11 Nov 2026
 13:04:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-2-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-2-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Nov 2026 21:03:53 +0000
X-Gm-Features: AclHuK9dy2sCAhDvi6AKjzXMWgnJES78GwGzZ1LsZZk9UkuHFg5q24wLvar7eig
Message-ID: <CAJuCfpHjSZhPPpRudAdrDPzz8dGK=Mx62CYCNoO4MC9OhnGd=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] mm/kmsan: undo the shadow mapping when the origin
 mapping fails
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:24=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
> the origin pages. If the second mapping fails, the first one is left
> mapped, and the callers do not roll it back. The next vmap of the
> same metadata range hits the stale PTEs again and fails with a
> WARN_ON() and -EBUSY in vmap_pages_pte_range().
>
> Undo the shadow mapping on that error path, the same way
> kmsan_ioremap_page_range() cleans up after a partial failure.
> __vunmap_range_noflush() only clears the PTEs; nothing has touched
> the shadow mapping, so no TLB flush is needed.
>
> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_page=
s_range_noflush()")
> Cc: stable@vger.kernel.org
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/kmsan/shadow.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 0c88d89bf0d6..2166086d3dc3 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long sta=
rt, unsigned long end,
>                                             o_pages, page_shift);
>         kmsan_leave_runtime();
>         if (mapped) {
> +               /* Undo the shadow mapping set up above. */
> +               kmsan_enter_runtime();
> +               __vunmap_range_noflush(shadow_start, shadow_end);

Sorry, there is a problem here. You introduce "can_resched" check to
avoid calling cond_resched() later in the series (in patch #7), but at
this point __vunmap_range_noflush() can be called with GFP flags which
do not allow blocking. Before recent Ulad's change called "kmsan:
remove hard-coded GFP_KERNEL flags" this function was called only with
GPF_KERNEL but now that's not the case. I think you can move
introduction of can_resched flag into this patch.

> +               kmsan_leave_runtime();
>                 err =3D mapped;
>                 goto ret;
>         }
> --
> 2.25.1
>

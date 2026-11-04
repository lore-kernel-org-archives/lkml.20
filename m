Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829302;
	b=n9jy9tvA8aPMKhkZzFjiXJLQqmoQfs0ym7fg4pKZ5QhOmtkSiLfcxTl8yJLY8pb9phZg
	 REMPvQQhR9hIvrw2hLoJDj8I+cSxlohwnNZ/1EDGtE4p7gyExyQiuwsaghGW/hm0rJ8ox
	 JAimMtUABkwY8PzSDlj9Y2muB/9aoxVMeM48LdYpIYK09s/211CEW33s319CeAO6aKejl
	 RI+Kdfwyu6EaaQwk2eD/HpzT+jI92ADsWUmNzJL/acXj6gHF7ufsXFOGaFCc+d1z6q0Xw
	 tj9V7dREdv81pE8tgTtEz6AU789oLF3AVjxjBFkR7ATO5F0j5DECirpWHay+iR6na8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bWO5ZRtUlD3MouKRps5rUrYVqEwdz1juVsOJUvMD5qg=;
	b=CoDfmU+l/yNwBU4QqcKvXtmC3FTM7CCmOT8aZcEyEkuM4YyqzhHVIN98TmRBi0Qs1XLB
	 JWZ4NlFD007KiLMCzkwz34x2ICs0p6rjQjCbjwoQSkIVdwFWzFidkkyozPrFdLEbb5nx+
	 fVQEiN901Chopr7InUjfieQKpztfrQNXjXBiwqZACsjyhfFzJHZ3LSm1MOr1hP+gLNjm4
	 VMvX8WWnlGDzBPYxBcGh08WwU9uuE2AyoxuLDgOwADpdz8nczWgSl9FQXEY5+Nl/a26TE
	 jiSHj7Whjx7nupU8kK65MHm9Ng5gsBvuh0vagI6pfSFdMm2CPR6TZMZgqvyQ1ZfQx9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+B5o9ik;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9C6086604
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC9C6086604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+B5o9ik
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8778305e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793829300; cv=none;
        d=google.com; s=arc-20260327;
        b=eszF4lrjxKbQ46ZSRGoWqHBQxZFRht0vd8UkSXawbPvYTjNlnOumyTbuV33TiXWSPG
         XCMSIFHg/sAdHVBaUUVVBXe6fZcXjVjQ1Ab7ikvP/+ycm1Gow1jKQBXK80WUBVtYeoNd
         OARQeovZFTyxG2G+kHw4ERg1mqsXDHn1+xOuqcxQ7f3l0nOEsDUDpVPF0ux7PbIlYUPI
         K5ASjvWUQDREIau0xnp69aLaSoNyw0EyyK84pIzafuz7phrRYj1vAXOrnTudCy4XfAbY
         uqDWcKJy5zTDKsz75dd/9e2+J6CqQlxgG4VHex/IxfZEO0KicbRIwsWBGyguTIORk5bQ
         68dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWO5ZRtUlD3MouKRps5rUrYVqEwdz1juVsOJUvMD5qg=;
        fh=rrDMB/gN/Ipf52M+L01ZieMWvd4p8FzyAmfvxCaWneU=;
        b=lI7s9QofB2ueahIlKdrhKjxCyDGJvudKDmkQdM9tUZhZr0Ynav8ZO5YbIBMygwD9t3
         IXiEB34rQVTkfrLBqjSF9BpvvCyRBpaMwyaJMsLHZj7ch68FWBsB1xJ8Bh6xBGZAlTnM
         OJQ46wHN3TGUqOje22dIc4GhPHCikTyq1afjNuViHykEamjRAVWMiMGLjnITV0fdWC5x
         mtsVrXqwPGgdcG9w7EnKeyQBqpV4IK9/ORip9pLDqpwzeGCdAOx4NPfmbzWhicLCPH1I
         qZvyDtFGBr83vvtVihZ+AU+hoQysk6xpD2j0/pAo2ibP8d1CtIu5w1CcBO0Pse1nDEb+
         q5qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829300; x=1794434100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWO5ZRtUlD3MouKRps5rUrYVqEwdz1juVsOJUvMD5qg=;
        b=U+B5o9iky6ivaq1ryaLWBf1S5cnmEyQb7v2UsehVhzYJOx+bm27kooxVCrYyxVCwsT
         n8z5RV7NslPwZCGwF71AO5zd9huqxdBQVzn+x+FUvh5HHF93eGOGM3k9Erk8HWae2NmY
         B1/GXayukdUaLQTEpbc04aAuuxi9Jj4bRV8AuyFqyLjJJYmhPvZIbo1wmPkovKiuHaJx
         RgRNckt+DGoGaWWMciTbDHbNXJ/TJfw+O4Va5453LkGFltFghl/bxDkl3F7sL5mEeRyq
         Rh0GTPgKDARkyIGp4FeCLK8Ez9duR3yOnSIb+YgV2lvfVVxBjqiSmwNl1Md+DWtfpBW4
         fkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829300; x=1794434100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWO5ZRtUlD3MouKRps5rUrYVqEwdz1juVsOJUvMD5qg=;
        b=ybhijZ9cvwaL8WAfqggbJqaQqyCU5QMCvGLnFSXbxnl0C5JU897MEtawb7lDa3a1wE
         G/Qy4GWGGz5vwRXJ/f9+qFNvMAgZSwGt79F0ooS9pozZxjqpMPSGBNVZVGjbRiqUpw9F
         qRK9OhrcV5kl36RPxLgAoTeNoFSxqD+d0z7Yt2ieBdfipr7f39QW8jcjx81EXWhPjrPZ
         Ph7q89QiS84XheikKjxpcRq2tvSaM7K6gwFLbxQ1yewPb6VEwNJ/agvjNn0+IM6xMq8e
         02LafSF5o7lRe12eOogzclFhhVXiw72xuEkZKLd8ZoUvszT/9eZdNnwu5+efFDdgRlxI
         i8zw==
X-Forwarded-Encrypted: i=1; AKwUvByS9RnsWLKZ0nxMYkYxgA9LiRLnp264b4eR9i5Cw3UZ36FmoxVzbheDpngiQwsyQCdQC761pHKOCnKHR6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/36KJnNc3G8srYb132jZVixK9AB8Ybl0VHzhdPb0kpsSMVbQ/o
	sOjXk2EO5V+h5BzBmrC/URBLR5FyF+T3efGKuRBVvz2f9uv4TpE03yXYEztDpaLDeVwq+RCMpxD
	vIocKMWiMZIGXXdgICZu6OBe+AXC9rwE=
X-Gm-Gg: AYBFou25jw2Qv1AFLukSksPc/Fnu0K4/f4Bm8nV3jltiql29UDuGHBAjkeCEr/JUUba
	0cg3ZfrPVDBj34DGiQJQfrH94JsbLMTi2Jz4Lrw8HYh2/ZxaTEZPm1kiMjocLHSGyIhUT9czWnp
	+ZzX4EPA7shQ+s3msPrrF/Cwmn5jAjLoTcUS8NBylP8aWh2uYE5qd53RI73NLWFTxyRuuIsdLYd
	5tWSm/8PXPw8deZUjHK7M/YuLDdDkGBryBOxcg3hllnPLi8RK059Rsw8pXWZSf87Pjq+OYgmDzV
	EK52QgZF2Y0QYjZc8juAcJqBvNkODxzIGgJmjMLi11cEtuCCI8nFA5PMnX9TZXwUhKZp4W2rZsT
	d+XcK0RvrTAOf74A7f3pngiM4fCMR9WwoFx0wPjJEJ72LQMlFGytLhqcPPm+NhKvOXpOSZOyaQb
	nKEYZDgL/9GmK7YXXzYZO658IaOoErveZCpXc3rQcyxfKfnUBfdk7B
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id
 5b1f17b1804b1-4ac17191046mr398211165e9.6.1793829300386; Wed, 04 Nov 2026
 13:55:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1786003779.git.xueyuan.chen@vivo.com> <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com> <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com> <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
In-Reply-To: <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 14:54:49 -0700
X-Gm-Features: AclHuK-pahY2vIB1KG9bF6T0DUY3H16HDwNT-kCctAD9vYuVFu-gHVRP9D3bBro
Message-ID: <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Chris Wiseman <chriswiseman@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 11:46=E2=80=AFAM Chris Wiseman <chriswiseman@google.=
com> wrote:
>
> On Wed, Nov 4, 2026 at 9:57 AM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > Is this precheck basically checking if we can free at least one zspage
> > of the size class before proceeding? Yeah the number looks good -
> > let's add that, in parallel!
>
> Yeah, it just checks if a bucket has enough wasted slots to free at
> least one full page before taking the locks.  Sergey pointed out those

You meant full zspage here right? IIUC we keep the entire chain of
zpages around until the entire zspage is gone?

> two counters aren't atomic together so an unlocked check is just a
> best-effort hint - if you and Sergey are good with that, happy to send a
> patch.

Personally I'm happy with it being a best-effort hint!

We can also recheck after we acquire the lock (but I suspect it's
unlikely we'll get radically different decision?)

Sergey, how do you feel about this?

>
> > Ah ok hmm. Sounds like internal compaction isn't that helpful, i.e
> > zsmalloc already does a pretty decent job at packing objects that
> > there aren't a terrible amount of internal fragmentation in the first
> > place...?
> > Should we do CONFIG_ZSMALLOC_SHRINKER (default to N or to
> > CONFIG_ZSWAP) for now, and remove it in a couple of releases if users
> > in the wild do not complain?
>
> Compaction still helps when we trigger it between bursts (freed ~21 MB
> before the swap storm and ~10 MB after).  It just wastes time running
> mid-swap when new writes are filling those open slots right back up.
> Defaulting CONFIG_ZSMALLOC_SHRINKER to N (or CONFIG_ZSWAP) for a couple
> releases makes sense to me.

SGTM, but I'll let Sergey chime in!

Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C4477991
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547743; cv=pass; b=HLuURy+FSloprVdZjcFLIbwmmqEBNllW3uERU3u9NuhVTUiLZtq1009pJ35tn5nx+RIa4NvQw2H/jW9EMcvHUIQvNvM5xE8AISb8tIrJ6h62ayg3H+jFuQPBjvCt5ZKZ4RYsXC8WOf7OrhzPlfrknrYD3JL8O52O+8D7IHSKkxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547743; c=relaxed/simple;
	bh=1ataSEqg4bOjx2Xcnl0r2hUSM6sYuDK81XZubNGiOUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p10LF3t99bY13ObToHM6nC0xiA1U37nPeqp8IrpCHjwYgAcF6opsAUvqeSpBPSZO0Y7OaeUruEWED52ReO6qzGX9uxWDtg6G5pXtJn3qo/ilvZ2AFfwcgafXYXh54A4+q4B8rgudPtyl3GcyWhLEtgpOsBo0ieIl/rxWgTT5ukM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScFbBHs2; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScFbBHs2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so12399f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547740; cv=none;
        d=google.com; s=arc-20260327;
        b=AhY7dB10e4dul1IrVEkTNDGhybGleELwYQZTLhzt/sao6NBulAP0iEMcZhLHNheMIK
         q27vryB8eKg231ljGF9HadBhgyRNIblUDIvYnMGufBPx9HpQELtKlgooCVUXAA1v16Re
         5dyFWPg3yVzTaqGC0SWIcMw1gSvQuCb55IhizXZmAXK1FdyXnBy02FpkLpMBMInxTImk
         eacKAgGLE1O6z3gZgrdObamGWTm1FvBzFeUVsTRdmwPrmEZd28XCyOS/xkOwTwVzHFHY
         Qg7lSxUIGZxCQy5ROT3XzQo16Of4oxHKE3NiwHUj1fUuUdkAz5t/SuN50UU5YXXVcThq
         L8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DiIs+u5F3s4/IwOJgsmJuG+HupZ2YoIV8nI6XUYYhZk=;
        fh=bVLoVgA87t4z2JP9IT0sbXIZ5TioF3kg2GTzbqDRE/A=;
        b=dm2FCByZ4D/tOo+64GTb6w3kkModS76oZqTQXw90Xb68nQNKVCF5tTnArQ6DSL6Zdn
         JMB4uHMEwDV8sAiiddbpW+xx8o9mwcNsfraQEqZP48etPtqdYT+rQ/xLRZXkTKz8gJPA
         HMf3GIyrZbuXkH/1g8LB6wNVV1YnI+adtJQa8ELizqb6AEpTheRwsWxNAvpXWWWy3LzM
         uOwYtifJZ42NnH6L0/gcljXQp6LYYkYnJaa0+5wP1hZpiSJmcoi5ft37CsOOcHxYANFv
         FlaF1p9z0q75TSW/7Vut2CpWrio4eY8qRhmyZPVwDz4t5236Cy9cbLrtMybPEBf090dI
         GAIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547740; x=1790152540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DiIs+u5F3s4/IwOJgsmJuG+HupZ2YoIV8nI6XUYYhZk=;
        b=ScFbBHs2TPewGjU7jUEEpQ5JBBwSB01USHhU7hXq3hOuqOTKNAsLbFebHfh8ZTtF7U
         cH6rbk2IdGqc7px26iKBzB+IRR7bXpqxPbNEI35lKTbrqp3Ay5OpxtRTMHk9xN9BOYvD
         j8GqSP3cgOgEqBWsHuv7VYu/leIHiqEWThsAAfj6rWFYlRrKN4P5SAqYxOJhthmglfjV
         LIHGH0OcBeLPwcjoPqC9inYwVgdasWoRSIM1+rVqtc5+xvLLtz3fLVYaGVeh9sA18Dtz
         y8UZQxiuPUWfB9KpvbfXazs/GhPsMUuD8WfYFS6GNjC1WxMj0/4uq8XzwNtLG25ZaQ4n
         xuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547740; x=1790152540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiIs+u5F3s4/IwOJgsmJuG+HupZ2YoIV8nI6XUYYhZk=;
        b=d3w5/lM9x28SCnwVBoaxhcOapEiDh26TZ18S+C2B0W5H+4NzeAYPu5Yeydqct9FrQN
         r/DUUjp7F/71Wmf0yr+EN4qHPfm/lb1EVaZepjGSPEWfa2yL93NBQMq4zIeGy7P98/CA
         wnnDFdZC4oBT9720L9D2JgHFec8AgeMNR38iCxFuPzRYsWn4x93/hlEQ+LrWFpZXAAy5
         yR58nu81cpUF7X/azXepb3rhG/GAxAJBcIbwgutn/jc20/sTO7EcHqq7H9okDtJE3maJ
         USsheZPtpt3ozV5tSkcgVLLvJXha/Et5xvx9GKWk1Zt+but8ezQmjt7TFTdt2qFvAa1O
         VdkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq5+xgnOJt2fGHDaWf4TEJnklHqgXveSACrRjPCI1ei4LQtFuEiDuRPSjXqSryrPk2QUQy+OH+BAsDE1s=@vger.kernel.org
X-Gm-Message-State: AFuF++kC/3d4GB73nmQjpJ3vQGOFnAGwPNIg9gEnEKnDYHi2DzcPeqC5
	U1blFTZnzAhDEjpWVd5ZniA94bYOmSWI4rxJVm5Vr+cJTL5WZyCPGUM8d4FE6UiFSO2c+b5FLLJ
	vArEVsPCYtkun3xojE+CXBKbLtmJgofU=
X-Gm-Gg: AYBFou0e/aNsAvvOuClCPOTngS6YGzD09zwgE0TpyFA+42RW22EGWA7pkZE1RnQ8vhA
	yXRXq1knCZouTSpQVDu0hggsL6Rn0/LWY+Wg4kp+dobZRK5CX3eJ+h52tTdMt+6dG/Vb2nBOsIz
	LsQokToQNesqFFQlfOFjOrTADz+89KnpkMJia20FDiDCNCvwSaHZsaDFty0fbFqrqZXpZwQnVpU
	sTFtksKShzvOtAvr4e/NWbZfaQZNaFwOVqZs6heLd4auYPx0vIKqQxVCeMp+YEG3NiGZdvNCJUq
	XM7l6LsM50aUbeNRusxLjMqcvuXM9QfpdO85ZuRdBtRnnB1Pb3Dp/rNC
X-Received: by 2002:a05:6000:1848:b0:487:ab1:d2aa with SMTP id
 ffacd0b85a97d-4870cd9f3dcmr2407692f8f.0.1789547739693; Wed, 16 Sep 2026
 01:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-11-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-11-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 16:35:02 +0800
X-Gm-Features: AcwNN1VGLJPCwy_K-vNDX0HGDG60UyOOcB9dsUueX3WxxPWTskZ_vhb9XQiYzBc
Message-ID: <CAHJ8P3+1J1M4ehLoT-MSuUWcHM-TAr3rwu2z6fjjh9RntM7VGw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 10/12] f2fs: cache: support fault injection
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:57=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch adds fault injection support for metadata cache allocations
> to improve error-path test coverage.
> - it integrates entry allocations with FAULT_KMALLOC
>
> Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  fs/f2fs/cache.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 3e6a198ef3b3..27624b6799a9 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -154,23 +154,27 @@ static struct f2fs_cached_block *f2fs_create_cache(
>                 struct f2fs_cached_block_list *cache,
>                 unsigned long index, bool nofail)
>  {
> +       struct f2fs_sb_info *sbi =3D cache->sbi;
>         struct f2fs_cached_block *entry;
>         unsigned int flags =3D GFP_NOFS;
>
>         if (index =3D=3D ULONG_MAX)
>                 return ERR_PTR(-ERANGE);
>
> -       if (nofail)
> +       if (nofail) {
>                 flags |=3D __GFP_NOFAIL;
> -
> -       entry =3D kzalloc_obj(*entry, flags);
> -       if (!entry)
> -               return ERR_PTR(-ENOMEM);
> -
> -       entry->data =3D kmalloc(cache->sbi->blocksize, flags);
> -       if (!entry->data) {
> -               kfree(entry);
> -               return ERR_PTR(-ENOMEM);
> +               entry =3D kzalloc_obj(*entry, flags);
> +               entry->data =3D kmalloc(sbi->blocksize, flags);
> +       } else {
> +               entry =3D f2fs_kzalloc(sbi, sizeof(*entry), flags);
> +               if (!entry)
> +                       return ERR_PTR(-ENOMEM);
> +
> +               entry->data =3D f2fs_kmalloc(sbi, sbi->blocksize, flags);
> +               if (!entry->data) {
> +                       kfree(entry);
> +                       return ERR_PTR(-ENOMEM);
> +               }
>         }
>
>         entry->index =3D index;
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

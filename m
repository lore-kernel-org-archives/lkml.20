Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799837;
	b=1iSJQBbCt+Q4DPa/5fejHEcyW//Pm+Cdde5WgU2HWD+zBz0XhuaB+gYEI4EmrmhyHBow
	 1X90fZlRFuUz6y/Yp4WFXKz8uVCpOtGwGRebPM0lw6oN969Y5P3xmuJJvqjCDCR8Ydm3c
	 G69Tt3VUNqBlmfuss2vy+uXrBTBKmx4H8hYdeZUvFc8eqEy7hhIRCBjvD6sKUtryzeTy2
	 nJkz24G5Tnhd2daBHpO64chlMdrLgYnFygJn5RRtQfDoV/E/264J1sO/pvpTGk7joeq+0
	 3XzqBkpn6HR6fLBmok7hT/NEcM+NkvNcrMwF7rp3+/WJxdbc4akokVt0Prb/4E9abxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EbvHpp+DKB9Zn3Fe95YeqAT/79gj7Jwj0DQknuaYym4=;
	b=z+ic4AtQHMvRJaCzrZ2lWu0CX6hgHCZXnvgmxQfIgBefDD+ydr6j9p5TQ6z7VFxak93R
	 APh7FEdlB2tqDg8I0zkD4PpQLb1KBsivol9Yupt7IC1Op6C1mKyk9PBN+rhc1869cwO4i
	 YNkrlwz0OenLWOhz/gS/KRgBsVo08uJyOpgSytrrC5trOLnj13nvfWstyGIXVo+7YflnC
	 lix1n3hHaKx57/wmqYyUqKUFxhZQWUCUPllN2WKDcQOqnO+ova2oS89Le0SDQCb/AwjmP
	 nrFu0Myb2X34T0NH4Znfhj8I+6s2MMkJwlfVHKV/2pRRLvTetOQyCAOF3YeQ/S3ZYRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fY1BliL+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD952606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD952606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fY1BliL+
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so253238266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794799835; cv=none;
        d=google.com; s=arc-20260327;
        b=dSm/81xsh2himiZQfQPSn2mMn/ri4KCDsuc1eYCrU9GcbdiSjIbM+DPjeMh2RfBXcR
         oixe5sSQw6ibvXvtXX2ZvVCHSu0MXGO1bEwNMSI2grB5UpwqTNdjy2A2cfBkl3xhjKuu
         ZvaFFHwNFsyvUICzXNENNLz7b8yUFsd2rPqR6Vsc8l5yWptPLo1JAPkvfdw82mkIzmot
         JpL/ltf8cnHbUhC0+rLRJ/HpsnE0R/dqKog4LJzi8CY2OYREZlqF36wLOdgKCXek9UUL
         uRee0h2naCFw4hrlUZRj+cMM7AHcuS8XuC0a9FGui/5ZftQXCyOYBVVgHKpnBcjHEXk2
         kgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EbvHpp+DKB9Zn3Fe95YeqAT/79gj7Jwj0DQknuaYym4=;
        fh=nWkt3Tm24IDMWrQ4CLLNydBm+Aa3XTfHsubXJYV8YSw=;
        b=YvmTmRnlP/QODjVaUyxi2R5oQq9jY0psykxLo4e+I6utavSqNyRkxFlwlyyPajjx92
         1Hl89+z8KiNHhloGkt2HjBP/Bnyl+BzHpU9hlaAzPRcRnFrLHeGnE6u5mwe6p0qMelQJ
         nm41PsZOQrfOXWa9xm7G9C80Irc8VaAFtZFm42hvbA9QD4qkFKfuii7C0LvjTtdYUcYT
         RCvNEJG+AjqEi1Nhc5DVFd1fVgssV/r0QqY7LKsBxIQ2uz72SqXXZ9vfvIHQ5BO1EzIQ
         Uu9ERJTc2q3hl8J0SKEORzmODQwiTEWKfMC3PIjob+ahbv/QJDaLvTFsYXu36hYMHVgE
         2voA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799835; x=1795404635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbvHpp+DKB9Zn3Fe95YeqAT/79gj7Jwj0DQknuaYym4=;
        b=fY1BliL+9zdQv8nZG93UnuIRJP9g3H679zNhHC4NgeKVWInAENp2suO49I3jAkA8L3
         FXTOks3vWrDcjYzIzkNXRce4GaaNqE68ugazs+0cn/ijOr2h4JH1hr9oZ4Syek/qFKNY
         0ME32RZb8j9NExJJdycfEEwEE+/gOYvP3jHr84wnZvmGdg7AMR/HHYBHaS2m7USUTIDN
         TqrtT6tSAC7QOREjfQuQYWAn4kdH3E+NR8y+nCGsgxMEvE+nC4EHrhmzsQH8xZHzUtup
         TB6W9hWqpz0Dp/FT49c64jiCmFBkWOkMDhvh7I83h3U2uHvSXtchqE/ltHGf9YVVEyGj
         /29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799835; x=1795404635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbvHpp+DKB9Zn3Fe95YeqAT/79gj7Jwj0DQknuaYym4=;
        b=xNkdhE8RKOiGbJBLKiKZhoMO2ufx1pTeOhAu+NAOfWjeizBF9lxdLd6mR3cLFOaI74
         HZOll+wpw4ojh22h6xT/X7uSSg+lVYV1kUfe/y/qjVqZawiOW/y/s+ZfgkfY6j1zCfMt
         ju3KN4VjKYOyN9aLiSF562vFbbvHaIsWECRbTHpNNcRveKfmnzwp53lgJt30QXzYXYUy
         MYSIQFuj22V6MyLwmwyG23K3PAR5YKeGBnCc0+pxieRQB6Ao9AqfK4g3K1fA3MkoWX0f
         3jSqllrybFJFDWsSpprCiD2xsbFPA8wPZVvwSftg0YxmHYj/zWzRD3Rslds8uBc/wivR
         HdZg==
X-Forwarded-Encrypted: i=1; AL+hErFC1RKJ4cmEld4v1ouo6E2O8m1PYI3xzRLbunDwZFP4plVN+rOJv6DimEaSQ10K9+Ht2V/oNlg6pwxaqEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s3dXb4eMdIWnf3vwVBEREUfQcsro34ZaWsn++0YyFy6h6sNJJ
	AsUJ79L/CNIuGhBnKA1/HhVx9ZX5k+WSFXVoQHwh57owr0tp5+yyQZsaUxA70uCDc4EV1w3SDJ9
	nx/cBL99cINK3aXDzeJwwXP8ASTcYlzg=
X-Gm-Gg: AYBFou3Xqp6iBekk8MnmhCVV8exkIixGCZNFHI6kXqqgOK/Df2cT9gEaTVPU4eqSzTB
	W+rEtZQ2n2Zmr4WwtI/ars1I9egx9M9Tw/Pfl26VLD347Cm+/BlOH5DLecBmEnuEjENfxSDRgnU
	/d7QiO5Qm9e7VHMEqzgh6j4tWBQ2qb9l+H+NTpob26uTtaOEDleQ28PRPYSiXe+1Fd1wPeVaPyp
	Ezf1o9cNP2iAK+85FzOPb6JhqfhjCgCnVJx/FFoZ/jokd9Ih513uymGF3s8z2PqUiu6vC9khGls
	ihPkjMO8MO9rLfRMV14FSJPGks6oazt7puuFT57gdr54lhRo0pcIFScoo3gx1JzWeF/1DIgOFaE
	cTmXZtx5r6w3g6+S0fRe1099SUeVi44PGj1f5Q/iGRfI8wVXcG0wJCOfYi5O9nlcYEPa5TQ==
X-Received: by 2002:a17:907:ea6:b0:c46:7ec3:fde7 with SMTP id
 a640c23a62f3a-c50963da4damr741558066b.31.1794799835006; Sun, 15 Nov 2026
 19:30:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794666741.git.lianux.mm@gmail.com> <fbb87083afcc51fce533308d723edc55263bdf06.1794666741.git.lianux.mm@gmail.com>
In-Reply-To: <fbb87083afcc51fce533308d723edc55263bdf06.1794666741.git.lianux.mm@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 16 Nov 2026 11:29:58 +0800
X-Gm-Features: AclHuK9SY3SoH2arw4UJU6ntA6zZEp479wBVJLO_t_nMFXkiHdyE_Stm0Vxwk-U
Message-ID: <CAMgjq7BE_i5FxYFrzSfnNsysBQ8UQzcULRo7AD985_1o27-jDg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/18] mm/swap: redistribute queue readers after
 membership changes
To: Lian Wang <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Jihan LIN <linjh22s@gmail.com>, Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:53=E2=80=AFPM Lian Wang <lianux.mm@gmail.com> wr=
ote:
>
> Adding a device to an existing priority ring reuses the per-CPU reader
> storage. A ring that previously contained one device can therefore keep
> every CPU at the old common starting offset after peers are added.
> Deleting devices or rings can likewise leave offsets and quotas that
> describe the previous membership.
>
> Reset the valid per-CPU ring offsets and quotas after peer insertion and
> every nonempty deletion. Run the initialization helper under the topology
> writer, which excludes allocation walks, without allocating new reader
> storage or adding selector hot-path work.
>
> Use cpu-id modulo placement for a fresh best-effort rotation across all
> valid rings. This does not move existing slots or guarantee strict balanc=
e
> for every active CPU subset. Mask and availability transitions do not
> trigger the topology reset.
>
> Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  mm/swapfile.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 0c192844b121..eb2128132455 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -497,6 +497,7 @@ static int swap_queue_add(struct swap_info_struct *si=
,
>         spin_unlock(&swap_queue_update_lock);
>         memalloc_noreclaim_restore(noreclaim_flag);
>         kfree(old_ring);
> +       swap_queue_reset_readers();
>         return 0;
>
>  failed:
> @@ -569,6 +570,8 @@ static void swap_queue_del(struct swap_info_struct *s=
i)
>                         swap_queue_install_readers(NULL, 0);
>         }
>         spin_unlock(&swap_queue_update_lock);
> +       if (swap_queue_len)
> +               swap_queue_reset_readers();
>
>         kfree(old_ring);
>         kfree(old_queue);
>

Makes sense, thanks!

Reviewed-by: Kairui Song <kasong@tencent.com>

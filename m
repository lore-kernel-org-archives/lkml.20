Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD2EED8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733891; cv=pass; b=GubNtINRX3//zJ+AdEIQ5WJ9GNI8rv9PHTX0uB9j4EwhF+UvzQ43OGTXVsHjtNtNdADtVLeAlxkRNezoF/7O26YWp0IJYUcPJj4e1e4vAi7YTm4G/1cy5eZTdolLARVYeghY1WfhIrDO3uyr9fFlrC5Po4pEZ3XvZh/mIZwBFfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733891; c=relaxed/simple;
	bh=IV3UF1ZbgbEHaaPEvCc2BzMnZwlILj8XNq4mL7GXZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/rHDe1TS1V/BvO1rhsKmM/EcHdUlvQD6Wp42kFPwHS730gR1TdrbhRECOJd0hiUkINWmM/CWNSsAq6i16ED5VGmPSuB4WGpqFz2J8bqR05MT6z4LmtkmmpvMYMDcvGR0LMJQdicEzcxuZqDbKViqNGvDVVv/Q7eyX0W3s4Pie0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhlTg/q1; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhlTg/q1"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-169be2dfbacso1785c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733889; cv=none;
        d=google.com; s=arc-20260327;
        b=efsKAbiiKpc8Gs2+8kDQVh4QL9HDEZ7326dree4ypHcco0RoSLHRJCcIwnCiImfBet
         FHcwuna8ZS9ZnIqpwk4BSlqXQLDvc6n5uYRGqQ68K9Ea6MATGSyzNLRHqwPyttUweGrx
         YSjRaFa/hACijP7xjiGtd8b2frP752HaFeUQawqHlr14nG69hzjcJpAEj06aDJ7FeZK6
         Wh3eoTvocK/4ReG8QZkvcNGJ6ne8BEOJXqucXgRdnkR66yGiBuLwrRVj7Vg7csC5YEGE
         zm8QaJ5WXTU2HBciiRRz07CyAwWRGHEzjo2HI+s39GnrcIt+p7xInSaoVwlzoKzJCdk1
         ZSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        fh=nClkKD46o1ojwI5oZg8jZ+Og0lvwr7xrde/Q5bvIyNI=;
        b=f8Ky6v9CfzP1Ueg5Jerri4MiNsAjIb4u1U9RgoRrFC1yR4AAZ2MY07YkkiSkwW1Ysd
         tKcosrAIg0mIug+8L+mltJ0vxE4dmG5e5j5NCeSgb58OcK+/em0w6wlD/CfPud3nXqTR
         y+W5q9LmwN1STzOVDcGmkCUQRpsIIs1tDt+gFudiBysmOz3fV3Le5zuUJn95+t3TyHHi
         3rUJA7Ienx94VvGinDrRUbO5lyY1YsrO+zSP+3jCGSbJt0d9hUOUkzLOe7BzE1rtif3T
         +8f7SgAFVmWbGpWnkzA5mBfVMxzA7U77ziA++H+N7Z233KLm04lMSIbLtbELj2kUpoQT
         WgjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791733889; x=1792338689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        b=EhlTg/q1JI8aymjKR6w5G8AsCiAK462hNBGQEStU9+bv8njp/0Vjl9cY74RmLQ7eIs
         2zPLm+9r7RnXfMSMi9cZJE7V/i01PiJ+UUWl3THnXs9MgeAevQbrTdto7l3smmL+d2pN
         CbmQVWLR3im2KSzIb6YID0GGIa2J3SiN96vHWrr3eH9uIoG6Q7TesSlm4h61HWZ/46ZE
         BZlaECHRHFSGe2jQZ8Ox0au6B24Vjwhx9852w8hHfydnD4P2ndvEdKVOcH7OgpbXDgH0
         HtakzC/K7ZUlVXkdWoeHLG3/83WjWFShF8utZ0lE3w62m4KxkkzZGt8O8WRpLVqyNkPX
         fUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733889; x=1792338689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        b=O1IayaSV253BlzMhxMKG8YQKDW6Hm5otmuSetx3oPmC9knEAQLtErXxpUA/Ub6bwC0
         ly7qffl2ruyVJS+YYBjnX5tl0lXZ6FSZ4PlNqfhBNjW5hPGGVmumypsTXnSUZy84efVe
         DXS62NIPvkiCTiJNPKBMaDtCuu2Uhsyoc4q4laevgkKutLs1S3hH0JQFw4Hpgqy8bXx5
         sRhW9wvljIhlmjW8CxH7ztkp13V64Ivi6lss3pe8RzN8BUSKyf4US33PszqNLuS5c8rf
         NhkZUDUIyIS11EgE/QMxjzXe3w1WKlguYo8OVVjIdLA7f54ooAbpiuCgJk7AO05s/D3R
         N+9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOjybu2XFHBebxJ6fPSv5qc12wB/5M65505eE/tNlTvqp6IoC/XdXEcJl3w4AUago8mVr8UqZ7Ap+lLcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRunuZx1zODNpzwv0VcQolicwIeJ/nE0sTLH0XBZTuKjFqZPCP
	hyWZCvIstoiqyIxtN3cEqw/1I2GknZpygRYIfC1+kZOPL+JNCZWzLwK9mVKRQx2APNue8ehyaiT
	cJjWLGK2YBtlWIiw8a0XjeQ5DEsD5zPhWxKLlzSV0
X-Gm-Gg: AYBFou2kKttXaqinnWtmCh/Z7H2ABF3DUu+fRFXOcpW0aS+1LtczBTNhlqEHdzyItb2
	vbbwrVjQHJDuBVf9jTRkx58TUM4kx2H2q/1dNU2bgUig9TC+SH8vwoEljIAdcMpYcypxpYLuRBA
	PwLQZfJHt8ce4SHMAUNuvEb+7Rq7uzrmw+OqGAWdI0FrTBWud7LqFg0YhLUuIbi2EtfqVZLomAg
	Ga/wEDnrvyOH/Rcauadst6zWRvtayMtqYqUEQtxemMJ7hXZqjHZX0YlTRbLK7Gd8MYUYwPIoNVA
	cGIURaVAjDR1SrVaPcPyNUqo8/7Fge9ekLWC0ybGdDTQu572Wa0JQQ==
X-Received: by 2002:a05:701b:2506:b0:146:85b9:974c with SMTP id
 a92af1059eb24-16e81b7bcb1mr124139c88.18.1791733888132; Sun, 11 Oct 2026
 08:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010025532.839559-2-almasrymina@google.com> <179168989611.434549.16378879758158058625@kernel.org>
In-Reply-To: <179168989611.434549.16378879758158058625@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 08:51:12 -0700
X-Gm-Features: AclHuK930gGDDJHBRZhLwx30RqRng6RPlhHFuLPE0htp8kvWdbnGSu8mFAUgs1o
Message-ID: <CAHS8izNWaWF5-Zo=rqaUzC3joNkwoYnrxawUUVn73BJEaPSGFg@mail.gmail.com>
Subject: Re: [PATCH net v1 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, dw@davidwei.uk, asml.silence@gmail.com, 
	ap420073@gmail.com, sdf@fomichev.me, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@iogearbox.net, 
	razor@blackwall.org, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 8:38=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: a binding that has already been unbound (netlink
>   socket closed) but is still alive because a TCP socket or page pool=E2=
=80=A6
> - [High] The patch unmaps and detaches the dma-buf in
>   mp_dmabuf_devmem_uninstall() as soon as bound_rxqs becomes empty.
> - [Low] The comment on struct net_devmem_dmabuf_binding::lock in
>   net/core/devmem.h still reads '/* Protect dev */'.
> - [Low] The comment on struct net_devmem_dmabuf_binding::ref in
>   net/core/devmem.h still says 'The binding undos itself and unmaps the=
=E2=80=A6

The findings look legitimate.

pw-bot: cr

--=20
Thanks,
Mina

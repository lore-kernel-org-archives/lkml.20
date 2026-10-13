Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9810D535FC1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924758; cv=pass; b=kccqb0QqNBkjvw+OY6j292UUOssglK9gRl06p3AQdq9ivmFyyjdqRg80m4JUU9msvT3/i2CpaPe+7O+QZ48dLOrPWzlBPsO8KyJSCbcP7wI+iQQe5lq5g/6NNA6jkaE4xA4SJDyNd4x85Rms+VJoTJ5Zo5TGW09Af6u47chhitw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924758; c=relaxed/simple;
	bh=/vVh4JekJSXHTPyscsLCDkMqYS00gf29hChLgo3TST4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JiZKZMPT9vQUKkLZApMzAM0v6D345/oKiJPqLaaFZQXD9MiZtNUivt+yQGiIETxlJb7pg6yBXzZaYNTAmMBJ9GdXpBjDJMS9Y0jPVtx5z8kxmoTSsJ5PmAXCOsFyAZS7pFuF/l6DkkYiz10qYtxlgqvp66gZ9rKVViPVaP+TWaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2wOCwT+; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2wOCwT+"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c4818e4165so2919270137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924755; cv=none;
        d=google.com; s=arc-20260327;
        b=hAPa/chCSUSl8CekoKl28MTDLuE1yhbftHakwj2tkGXRR2BQHMvtU7Htq6FASXUFUa
         wUkW5xjSlawsj/1pGh+2WKMgfXvQXnAud5SXoGKSTG9hQxrSDbXvRI/QY3TQbp6maCTR
         yMBEvjk2HBeft7Ug2rcbJCTZKB4Y0O4hJRfO9RwTRtNa+2b/KwKPAEaTA5EwEOoxP50e
         g5pxk7vxcmjqmx/HcBlw06sxuBDVE22TIEiIfLhs3W2ZPbuerntXJxtosA0H+rXDvRc3
         rdWhNKwH8BVLV4luljiII6gQZ9lh1dCuQoFnlHI51HvpccQ8s3UCDZjoEMKpkCCSRQfN
         JOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=;
        fh=/5bKuFk1Q6+Xmeu0deDa2xCPAqNR9yJnH38gE1vVbww=;
        b=eBqk84Mk/+lBsbeqSwnzK3Z7qG56wjR9qZm5mehbZ+lM8lgkBuDxGDfeTOqxRMwAxN
         tY0Q+EJBbKDhEUKQh3LZLSzA7hyz93khi5pBaGQY1Kv32g02IvIcg3CXLuZThOtIiGnv
         bMfmTT/TpHj2dnjAu+js+A8LzIROiRFeXMbzA0Fq7lT50zMqDPLXdaDnGXK6YaBVGUPL
         7rNL8Ym9FRT9lFppm89ZWi6LY3Dyy5ssoZ4Wvag2KCDFhjEu1wINwR2aNYWyQ0vWunq5
         SCrNVTIbyGgGM2IWHw3Krn+FvHD8URoVknggmdJAs2IvPQNJBTOqYjiwrw4P+L3jzmuQ
         Bs4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924755; x=1792529555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=;
        b=q2wOCwT+ztWfw9vBVnTNVbs79q5S5GB/c6SjAvezCMkrFTmEhD9SK7XFDX2jaI49Xr
         93ZMp2DP/vhqHSHcI9RWzDh42pl5FL2C+p3VBNzvC9nTMZ+JhujbAwGANk8vK9uHM0Du
         m7fJyAVlzFJoyfzZAQfQVoZl8i5o6J+tjULOtLqi15hLc1DpjwomKKtzDpmtzfvsyWUz
         yWzmAh0S19qVANRVnf9dEkTHWwC7JeStlMp6juSitFiiNw9UhXwwBp+jOwFoO6n9O0SQ
         8lYz6HV2I5IibYp73NCFh28+L+NAwg99/1BJ2nCJhQxQjP7LK5Y1hEvERZN1Dg+Bzv53
         2Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924755; x=1792529555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkhVrgc9OmPuX9zRiI9eMYevNzdxLtYphs0y5uGuLPs=;
        b=2OCDSh+NHWAxstPA98Px7T+BzrpggfCe0jikx+kyZ1x+6jhQ8Up/NeWWNNEZgeiDqp
         4bCzDNt87KiDLpVVk59rRKsIllUtNmReB9eN8KRUbt6JmwP8VbXxYm/4N46c7ywRPZ0T
         ugKu8UtGNww/XBJAI8kbVU+2Pe7OT7K5RuU4+XFVu6I0MM5wz7p/pz09VwZ1COmGsdRf
         6F67VsNcX9xfqWg5WWwmVBhimlBZgBXs1aYOg2dT+1dUsIPO7RqAvHKNfymtBU73Mtdl
         2ayOu3Poj/oiJGLE4ILXuNqbSl08GBzAuv906E+cK9W+UCeFKJRT8xELW3xI+rt5y/T+
         jslw==
X-Forwarded-Encrypted: i=1; AKwUvBx5D07HKJ4CGuekYNZS1MkLzfy3O10cfWNRAmsjEXHwGqBe5JbM9Oa2ztbYgbOZMkQ3D0gfzD2BtLmOqhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIfZkIP6tCY1ztuA92gbYyXOjFVRK56eHCWoKOtITCS7YpN8Pe
	XacfVo/nIz6jw1drzF7w8jQpR5ImfTSsD03GYJaE9FMgFCSio13+ftxd/19Yvz8cfs8EN3RbLwV
	qzE/xIUJSZAXY8a3s8ZE/GIz7xUlZQvs=
X-Gm-Gg: AYBFou2uxlL17d+P9jPnkKDrulx4zixeOUXH0VHn1vVt3zjY4K8OOkXfz+QzdoGQCfV
	wgvVqlfdwTUmqx10fjlxb3mJPqE8uFM0LAROKP4hrBJ2cEg/0qArPBUNOfjpB16h/IFEk4EFGUa
	b0sBeyjT1L71LZt/Nb1W7CeAb3uy0v5eNB3blYHI02ZZgPkinvEw8ChuqRMJH+8jbra/syM+9uP
	yUlAbiuMoZKMKA3Q0cfvjsBcJJyp5DPUd4YXpR57C3Y5odq4y6i6oTEc2ate6gneaPhf5jpc3X2
	XZQGI/yCV5IjLE3FAzui5bP4tNoC+Nqh2K7XMpqlgGE3aTm/2Ol2Y3Df4p8OctZm9dKCCZIKj1o
	11tOAMrcND8NPvOfRySePUthRP5/lV0Nfsp/iOksh+LmTAVEZSmrebpCDsNz71jYQX8B4bda0Va
	XJH2wnVhB2wG5jSwhi3x2LQ91z6T9Qsa7L7yueOE8ELhWr
X-Received: by 2002:a05:6102:b11:b0:7b5:8fd9:27e9 with SMTP id
 ada2fe7eead31-7cb42386482mr3026014137.2.1791924755421; Tue, 13 Oct 2026
 13:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
 <179192400014.160550.9046457038671470723@kernel.org>
In-Reply-To: <179192400014.160550.9046457038671470723@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 14:52:22 -0600
X-Gm-Features: AclHuK-F24utQ7hdbiPLO7cynxwSmEL20qXjDzlC2RlDwy8M8X2Q-IY3WKxAQbk
Message-ID: <CADvTj4oKGOQ9rgqbqVxxyx=LzzzEwf4xpJas_r9omeU1yS3y_g@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: avoid duplicate XSK TX completions
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:40=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was flagged during Sashiko review of the larger stmmac recovery
series, then confirmed by inspecting the existing TX completion and
teardown paths. The bug exists independently of that series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The duplicate accounting was reproduced in a local KUnit test under
QEMU using the actual driver cleanup functions and AF_XDP completion
queue code. With three completed XSK descriptors, teardown published
another three completions on the unpatched code. With the fix, the
total remained three.

The practical trigger is bringing the interface down after AF_XDP
zero-copy transmission while leaving the socket bound. No allocation
failure or hardware fault is required.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

This change has not been tested on physical stmmac hardware. Validation
used the software regression tests above and ARM64/i386 compile checks.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

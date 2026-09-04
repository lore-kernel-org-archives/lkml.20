Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FB503BD0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542039; cv=pass; b=GApQejxEUw57b4qTNBOLtVE213wZILjpHXDZjIeoNDepsunRkEiKHUr80F9qo0TxF0yXg8mfvuYXXjHXQHhflOmv4Qi1L+PkZ0IkvKIiZZPYg/Rckr+RDopqo3qSmyGXXyYGNOStmPBnbXRXp+mXtUWVqBkmjLFbycBikGJ4yB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542039; c=relaxed/simple;
	bh=gI9dUQ8wiv5lv2x0pFlCP4x8bszPw6o3peECtO1JUEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ln4aOvxkzJ7pJ4ASmY483hvJ2VLvPD5h8lGxoLnnLxoOgAh3Hc4pzexxUo0kJLoZl+ibDuMkhJepaK06Gr6zetNgy4t4l06Z5Hw9PsCmYUvpfe9szgzR/tSWGX0aAiZzG2dKCgX2je7swVDyribdOdpqYb2v/rJ8XcKPq+2emjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmjFENGP; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmjFENGP"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b3671a1b20so865551eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788542036; cv=none;
        d=google.com; s=arc-20260327;
        b=jfnDW/xd8Pm/Lb9uCrSw/HEnl1rOhgcCbWW/BQO3JkR8rRqZDIv2VlpKmoClMAFawB
         inMlY7r7SzqbNzv6+B13O5Y8ZHXB+QHjrQYIfC3cfimChGrB+moqPvqALjpE7O5Y90hK
         kRjc+u7Tygz4tTV/QS84r11pZjtiPE1GoStUq5BCYnOYAMC1kE9PFX4V9D4Y0webkoeF
         wyDy3653s5zw35cqRc4HSt0qD2/XlH8epgQu7dlk5idZ4MV6/bdBrzRQ2P3Rerj/fWJa
         fvwaUYacwTkhtOQirp0qi6RkwqsWvb/zo5c5Yh7vJSWod4HOzFuuh5q9MsFvslsPwHVU
         74qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2gGWC58DN3Hv47prtJd6tW+JLQXqnPK3pzZLxlOZTUk=;
        fh=W41lLk9wF9/39j8Qh4zG1y1U5mnC/H5amly55NJ7xAM=;
        b=q9Aq/GJJJ0KPQEzh1zjYD8lKEcAxKRAhz8fOu6dRqvieTArgiVTfRIoBfCFV5cmOCq
         X3+QV/21EtCNw5muUgn4jNYxT+YxC0Nv1z4hoamBEtCXdS5+qFsE77UvtgMpYHwRsNoY
         0MdVCst7V/mxoii5r017y8oxdjfcxguB13WPvziJzXTD+M52yqajcTvMqrntbce5dDWy
         amcGtM9C1v6DlaSmISiR9kyVPo863YibQlheeyZ0IoeqYmQQpZFgQKi8Aziu7mvedeRi
         9uIQb6Wh11T8wiSeYlAKCg+DZxcfaKKxSF2QbpMDBnADpoAN0AxLuZciyiy1VcvEirO6
         h3Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542036; x=1789146836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gGWC58DN3Hv47prtJd6tW+JLQXqnPK3pzZLxlOZTUk=;
        b=cmjFENGP5SyGxdQBNSitTV8gGxIrh74w5lPUOHaTx9ul8oX2t18of6hDyTWfgI1Wcb
         arNLfeiVNtK73LOcsUUGAwyKlz/JtxtLiWAz1p84miRF9CC9vmSfpZ6Tot0jGYWVIg9G
         /dUdINDRi6nGdz8QDQoWGy71ltABzbJuU1X9o+zZTmM1io2bjRoz8QYMh4nWNYuOd6An
         vT7n8SjWJkNa8Vkn5i1hqpsIwYxpweQLPXrhaWlDIZWNT9gk8GnL5kvEQl2ptEyWjMDC
         UyuCmlm4dbDH5QwOvA71KKyRYHGpYJT8rJUSQFS8BvPtrbOXLSOqArpONZmWvYxS3R3b
         OKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542036; x=1789146836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gGWC58DN3Hv47prtJd6tW+JLQXqnPK3pzZLxlOZTUk=;
        b=UR98sHasvIOQjle2LLx4Bea5Yed8FczN7783VUfaM4/7ia27AnM184l3Jy10rs3aKk
         MSQM81MY8OrAQpj8sIjkgeOJ3iy9U1P1xnpxAJ93q7wCwrSEcrG7jli9yp8a1CuCcfQ6
         puuQB+mx4okXtVqJiA2QKe5G8dhPfWK9USwXZ1NnjSIQnxKczu50E1/urrq+gg0J6pJ7
         Mcr14VD1dsNra8K1g3U5dBmc0zC4GFQec1iZoFzqPaHyb3XTG1LX5Mt6HWCZtUgJkMOh
         wrNyc3xAgw50KzObj2lZ/3wqjO2zx1WNlvfQZIpbvPEQ936MCs1tlo2BHa2mbX3ZD86D
         dlKw==
X-Forwarded-Encrypted: i=1; AKwUvBxPWOjUMmjIMmCHzcjYbT+zo4bpivrlq+DZr8/tiOG9cE3bfRfVP3TYKldSXxm9bZMSEgoQMwdMdmIYzts=@vger.kernel.org
X-Gm-Message-State: AFuF++mg9mQ5qX2wweV2V1pMYvr5TxJEXe8OqOhGw9RRMBP9OAj2Vj5Y
	3fJbSoSzRXPIHRVREqPd4bHMQMdKKHllTytBf0oWicpwetY8V7kf30gqFw7kyHOdTLFwDrqvkAN
	8T0+QF4wfeSOqDwfUeYbgDTBa/jumObw=
X-Gm-Gg: AYBFou27RDMCtGcZnSigHigqTPmbpb+XgMqTUm6LR8l3qDObl+WNXt2appGAgGWVRLc
	DfVwqXQxuAxTnyC5t1BVLZ2IHXJoS0KEL5didc7aTu7sOVaSGlCRSxGwt8BmvStVvH0xWY8lgOk
	0lU6Z6CzfZf00F4HSc7XK1I8Y/bmfAndeYavk3N/YpRpfS4Xb3KBOYH9QCzWJQg8O4o5iTKii/1
	qG3P4WIWWrdenOCN716Zjhd51wWl/L2geawb+Zdf9WS0dJz6uXmfN0hvYQFtUx4rigMLMQ8sSLa
	5pspMRxJLwyPB0ZzzW9pjFA65LrLN0tuVMbOmrJVdnNNcPy7hcUDc2v6JK2KxsSrIlnYXGZSzLb
	cGsn4EUKS9VuaAoA=
X-Received: by 2002:a05:6820:290b:b0:6b1:39b1:80ee with SMTP id
 006d021491bc7-6b6fe796fd6mr6700868eaf.24.1788542036124; Fri, 04 Sep 2026
 10:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904095416.1692962-1-kyle.switch@motor-comm.com> <20260904095416.1692962-3-kyle.switch@motor-comm.com>
In-Reply-To: <20260904095416.1692962-3-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 5 Sep 2026 01:13:16 +0800
X-Gm-Features: AcwNN1V_U66OwBJ7SqL1p4UY054Vk-Dy0fNkexu0AJl1AbJXTOiGV0jcR-p9lFU
Message-ID: <CAAXyoMNLk4ApuaxxznrPReftf0TNaQEBVF0n4gmuryJxLYdvTw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/6] net: dsa: motorcomm: relocate MIB polling
 initialization to dsa_setup()
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:54=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm.=
com> wrote:
>
> Move MIB polling start from probe() to dsa_setup() so that it can
> be conditionally enabled based on the actual switch family support,
> avoiding attempts to enable it on unsupported switch families.
>
> Signed-off-by: Kyle Switch <kyle.switch@motor-comm.com>
> ---
>  drivers/net/dsa/motorcomm/chip.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

I didn't see this patch being used afterwards (and patch 6 seems missing).

I'm not against the patch, but if you don't use it, please post it in
another series.

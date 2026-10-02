Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7624772BA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935534; cv=pass; b=ku2wAUxOv1fgwr0ncIWU1i4pz77gSQ2XSzdRjWQVSNKEBTlGEwx19m9BmqXqRA5b+nbatKAnri7bUef2mPnXWbVO+qJcYdrsV8EuufS+8nF2mZOVCZKw031PDdvhXW76xrkQulK5TW0KBT5bZDXefskXgk0fvpwry03mU3QYPbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935534; c=relaxed/simple;
	bh=KpRkC7nlG1sV7SwjB4i6DmP6K82SrvV9/kz1iBtQzrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLs4LZS9DAwDHOmoBBFjK6NvU1Ey07Qu9Bl26TVAAeBOC1IebVOAw/eU72LroND5LVjbgx0qnomXxnXmMir1fPOlChpP+ZTi0TNZMmwqTwHmJsTSgNElt2212N5XN3j3swBBSTrWXKKkiQy4QVSQjqgNubPSa+EzJQB5c3jqLA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwW9ak6U; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwW9ak6U"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a87e95a73fso5239631fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935530; cv=none;
        d=google.com; s=arc-20260327;
        b=geJd2EjJ4QRUorazG+71XUq38gYRT1AR/auoJnDH9jiRQHfYKtqconnWdwXndJxmuO
         Pv/AcLYankRgTuuIr3oEH4RzYionB467mTMbhZ354dNNCV6rUhuUPLaSxXOnUBafotDW
         dhqhKyRPJSyZ+r9dzjA0cKwlRHDmjq3xDK5VHyD5YdT1QJSZnOi0YqzB0wNltiXsSbNQ
         o7p/CS9+N5opjo+v+vvuU/LYmkJa8VXkVd/7EU2I+57TwL36DemqZ7Zm/95Bz3eotlwc
         R8ZCWYBXrKd0qgRxU/7Dji9Ju2zQY5u4T0aiEqvEsoZXce6ZdEmz34qzRprUCRDBEPJL
         JO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrEmBqIQ5U75wKjWXMmdbPNpi9eyodu4H+Zn5/tv004=;
        fh=FnrPB2mDidmQrKUg4FCuEMzuPZV6AnyslQazz+wxHR4=;
        b=HZvFho7GsTpEP40UJjlfYRun0tiJKnye6MWVN0WYtho6OOXbYVK5+/v8neewPF198W
         t+fasxZJkOEfrclExZIFisGdv+VERRARCxYS+aJ4yOfWtCCm7V3MwTmCdb9FRKMUYLS9
         gu528G3XS4drmmYevHxCOOAjwbGm7RUz0wfkA5R6kXMkNkyOVUOVyaqPI+VljOl6Pxm1
         dZGLRtwvKkbsfY7ouBhq7dfjLYY9Yv/8VyvyGAEm+Voo0Bghh7lkETDeoK+nFXzRy7W6
         9lR0nZD0rfJfl1eONe+20ClUtKnLjQs6saaWy1riqfPOejMlmaYCvzHYnxaAeGWb3BkK
         Hraw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935530; x=1791540330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrEmBqIQ5U75wKjWXMmdbPNpi9eyodu4H+Zn5/tv004=;
        b=NwW9ak6UOQPxpFv/FmQerM5MLjLv+Ncp8wyBfFhNHr7Frmo3D5usdQAcvL/0rroVNY
         k8YRj8mu96jsANBiMFziP+PGFl3rkflsa2oymXeweFfVPAqQRx5ZOzgRo4FOeP433MZb
         2u8noZ13OVp2e1qYqAHlH3EOsvLAw0vGyINgYv9XzZp6b6p8cnAFA5Uqirb4MXUhrGhr
         GaZWoE0JwWsLRbsNKwi9pPN9b47YBDzXIxAhKCOeixsdJ+MgXTFgzAobrZ4MZlnbYlO/
         VsDZg5awe7FQliyPFAyZnpXLZEnmJvKNubOSTzu1ulwni3p9z9gq8GUgBqYXfu1pbv7/
         1XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935530; x=1791540330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrEmBqIQ5U75wKjWXMmdbPNpi9eyodu4H+Zn5/tv004=;
        b=jMKbYkBioLLn1W1bi+3aT4536JuAsOFcIWb/arpim98iEXATeEQzYnlbgKdOXiqSIr
         vJUryxwUiQcMdxn1i5UfPX363r50l+7CaSB3jOLL1r8DbMQSqq2i9XEY4c5ijAWOwZ8I
         OLz6Jp96cteexni+51mszWoUzbWJsE1jbE/3oJ56+736jz+I0mVIPwXftJOsfLFr7n2+
         UBCIu0daVIN7EG8we8HYxm7UKK7pwReeKUvugTbASuO4ShmLjUZBmQbrG2Dx6H5jNeY6
         72JTY3ZFXzEYpIKJQx9Z0uMmoafk/5Qe8ZoLyiB4/suATnGy2wjbgOU6BaHkxUTAggT8
         DrTQ==
X-Forwarded-Encrypted: i=1; AKwUvByil5WftuaiKUVoZa4I9Jgy+QYQfQ5Bfz4Sm6tBNwihykF9pL2aUb5Jzk5fhnBQTPa0NuR3w000RKcA4Xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpa3nS7emBMyVx1JMi7ToUgw1slwiYXcxxpQbyVSQzE3lT6mNp
	+qVCIcs2SIf6rBSI9m7TU/e7OAz1pcaOTu3a9dhi48Q/VbRDKKYDrNM8PjYIBMjnbnGSNNc6p5I
	fGZB48LLq1GEkcXK5ejLMP0EQrpLPl/w=
X-Gm-Gg: AYBFou1LyYvTza3c3Qd6z9kUetFI4RzWFPGugH8Z+JdGYDH8XQTD/XSJHoqg4skmUl2
	Q/FBeuIFlK4+Mhci2CG8w/RQIwUxxY2it/Gd4PYhIrMMyO0gFdwfeu9ce8XGw3goEkED+JVvWsQ
	LOd0l8kyxOUa1SY1UO6hdwyIkeWtjhD0OlNE2GBDVXgzdF7rEqKm6Rj/ymJXMBgKNtpRXB2JfkG
	NYPXSI0t9Fen9ej5vwJFuuORujdDqgLqmZnLX7pC5yBGYji6r7rzN+FUbWuxDlkxZrE2Ahe7xOC
	6K6mb+6pyEtgCl58N4yQo8ZuYK4x/9goS9wqKfbRdNiLDRSAwCXl5kDELgLsbuAgQTOjyRM46ru
	MH+H6W4BMcIo=
X-Received: by 2002:a05:651c:1442:b0:3a3:42cf:c014 with SMTP id
 38308e7fff4ca-3a88765a8afmr6175741fa.7.1790935530006; Fri, 02 Oct 2026
 03:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-2-sigefriedhyy@gmail.com> <179089747717.434549.10025971158678601177@kernel.org>
In-Reply-To: <179089747717.434549.10025971158678601177@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:05:20 +0900
X-Gm-Features: AclHuK835RXya2QRfyWHcfAV1rz2yv5rXyfDJb6TRXTUTekf2P7RB2gM9v6I-4Y
Message-ID: <CA+7S2vK-rJ7oJ89onostQbPeNq8A7rLgsd_=_D2AZ27Bg3Dizg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] The commit "netlink: specs: rt-addr: fix the type of target-
>   netnsid" fixes a bug in one specific earlier commit, but its message=E2=
=80=A6

The Fixes tag was dropped in v4 on purpose, this is a spec fix for
net-next, not stable material.

> - [Low] This problem wasn't introduced by this patch, but after this
>   commit rt-addr.yaml still lists target-netnsid in no operation's=E2=80=
=A6

Pre-existing and unrelated to multicast dumps, can be fixed separately.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672374F93D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774018; cv=none; b=A4ZOjt8QctDPq9UsHFaLGiYRtZ4TJBjcxPZnkbcGzvBxFhv3GSKz+WgaNZWbHzpUzZtn7zDvPdKmOHJYSANMJFAYu2ttMIIrgklcoiLLZw1f56gFt+g71gaairMBkrq9otFMwvMtw3JCl+69ZPJObGH5BIKOGH9qtImqu6nOKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774018; c=relaxed/simple;
	bh=7kWDvkQlzlqFyT1rrxUGMuiNXBtG8Op0/Zp6Ln5s++E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elGmNm6J6SiMagUp2oxdV6eTe8ItErW8PuxXelUNNhCuaS7srh2BRGNwj5LCFYMNQuaUyxaIqGwtZEwWpyuVF8gKI1Fq1rdzqbHiEF1hvXDOdzQ0IDafar4OyxcXllsd0+nxNo8ykUDVP4sJP14t6plxMONxT7Wg6ZfaWDP/eao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeAPbtpO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeAPbtpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821E91F00898
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774008;
	bh=7kWDvkQlzlqFyT1rrxUGMuiNXBtG8Op0/Zp6Ln5s++E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IeAPbtpOm5tAT1zXKDKG4on9LBQKeD4q3UsS5+IqqGIvAnkbDv5yyI+4U3zfxdJQU
	 0gb5jVbXI+X5gDOMDTpTX+FlmDZIBtCtXVKEplCyY3cobLkmZLHWKG5j9OZseK2fVh
	 G7lQ0YL5GYwEHrAp9bJercJrqTsyRwPbzU1SyHjWqEXwUCtX2Ea62zJRPyUo2e4Z2b
	 w5aH6Xk5iD/yGAtEIuB/uvKUxCFahdvoYDP9UZsEV8xqegdFnINutDGdb3fNfnmkFJ
	 Hb/ogV4MqDtmq8EdI9CvtQcRDcOISF5aL92g6lzz4EedME1vz9h+943F040CCSEF5o
	 uDyP4vVk16U2g==
Received: by mail-lr2-f41.google.com with SMTP id 38308e7fff4ca-3a6287d59b2so46120691fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdiq2RHWeuBTk1MjW6iLwkG1uxFd+xGAnLeGTyo4NfMa/UlfVbKvw8abzB/99WTCdhfes2+T1Crs4AXFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa6FxqhmmmMrQ3wBWP9InGc8u0ubGzfuQzW8RMGwl9gAh65dGx
	FnCOdkCB6fgJlhezqT+L/dx++gPCQ80w8oyeTDEGAlx3fZk2EzeKGn0hxGQLp1EAqaPAKEebATd
	cQPVew4jKpm93h9G2M+1D3y4jtiLAA+I=
X-Received: by 2002:a05:651c:222c:b0:3a6:6efb:a0e1 with SMTP id
 38308e7fff4ca-3a77923f922mr4657321fa.21.1790774007290; Wed, 30 Sep 2026
 06:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <55267dce42a63e5210c34e49747f564f5cc0b0cf@linux.dev>
 <CAD++jL=KoKd4gLcyxuTTT904oR=EFeVkqQF-iD6qcc-GwQ39ug@mail.gmail.com> <e4a859da5ab7f40d9de53dfe605d29f510d1f1f2@linux.dev>
In-Reply-To: <e4a859da5ab7f40d9de53dfe605d29f510d1f1f2@linux.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:13:14 +0200
X-Gmail-Original-Message-ID: <CAD++jL=e=Jxn6EDqY-gD82S_N2GXqbmesV3rs88cyrixc8gvHA@mail.gmail.com>
X-Gm-Features: AclHuK_YrTzFv93FNEZyJLXjRgYkfaVNxZ3uXpclSC_GaB61IFeyqC9objegG9E
Message-ID: <CAD++jL=e=Jxn6EDqY-gD82S_N2GXqbmesV3rs88cyrixc8gvHA@mail.gmail.com>
Subject: Re: gpio-hog names
To: Frank Wunderlich <frank.wunderlich@linux.dev>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:26=E2=80=AFAM Frank Wunderlich
<frank.wunderlich@linux.dev> wrote:

> > But if you think that *looks better* then by all means send a patch!
>
> I have not yet looked how to get the previous fallback back, but if this =
is the
> preferred way i can do it.
> Just wanted to point to it and get opinion what's the best way to handle.
>
> From my PoV i would send DTS patch adding the line-name properties as fix=
 (for
> backporting), but i guess this behavour will affect other users/boards to=
o where imho
> a driver/framework patch makes more sense (will not "fix" gpioinfo).
> So better patch both?

I don't know, can only judge from seeing the patches.

Fix it so it looks like you want it and people will review it.

Yours,
Linus Walleij

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE9503BC5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463719; cv=none; b=s1PWFvBcCo6rOMHa4UIaGPzGfEJj3ZQt+KLDHguci7DXC3pZ/ulmgYwkPPtvkz0ADBGFNUzei9VB84YQIUeP43Fc75MZO0fapjiY9GrEdzSN6VWJ3g7Kcig/bD1m032dF/IAdjHKvt5GzCEEo/r4bBCBAfhaKJsULE4pEvrgbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463719; c=relaxed/simple;
	bh=0YdaSLH2NKxSumyvYeiXjJ99RlSdWSZPipl5SjaKkgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTGm8kNgPfUOZLOwTQW6Rp2VaQgXK4hH12fV7OJuIVcS9iRDZnuaRtR+B67EjmzofwVmb+sN4IfjEP37uDDlaBO9j67lQ8/5T5N4nQbXG5WRJH0N+1C8paLv5PzGS/MBaN/aw/BzhObUBJO6Pd4gYQ7cNKvma7CNi3tXV9d+dBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmZcNtIk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmZcNtIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124271F00ACA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788463711;
	bh=0YdaSLH2NKxSumyvYeiXjJ99RlSdWSZPipl5SjaKkgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EmZcNtIkZKrIII9VvO22zxQp2rFgg2hhjCJnnVqElP54konhznTMpJI9f7OKicWzN
	 7thJs6QUJVYv8OK3rH8vN5H4avkgs8XeojArHaFMrjVFMmBb+5XmsJjALG/NQuv34Y
	 CqFdbIS1D8LmnpdFCXQ7xGVlD4YPClH79w65/GMgjKaga0PA/AHCBTvUavhVTc6PKU
	 mA5op9d0oqxiqzfON8gPqfnWlS0AjPcxV6YsPM28bnfxgIKYameMjs9uyQGYGTAFly
	 W56CUavxi0fZBzV3UiC9aNAXM7iqbBFXNfy7y9VP/wQryuoQXGOjfzc+uP5HGHLS6m
	 mFRBCrEV1BTXw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso1523008e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxWiEB2JPQmhuUhrUAxhQyxdfGjYX3HGbHhwM6K1gcUmn8/IUd4txXwrrv4jT6iBgTVLosU4ai8BsoRGw=@vger.kernel.org
X-Gm-Message-State: AFuF++lGJrvZgKGU2+gfSjJbpE+oaKgkqfbymS3u1hgqBf5OUyV9bXih
	iArJuaFfluCRnLEnMX+R4J3SeGaFNIi25ZCVgRt7Vb+FiEZ88cNQ5sRNr3U+JXtxUy35oBkeuNP
	YCLGvjNeCzGOCOkwzjsuoHPThuQzAiyQ=
X-Received: by 2002:a05:6512:108d:b0:5b6:10bc:dc4c with SMTP id
 2adb3069b0e04-5b610bcde18mr935098e87.35.1788463709710; Thu, 03 Sep 2026
 12:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org> <CAFr9PXnAQJ73Lw3SDfFDC+2LFXks_FSTP3CwWK-vViyZ_==H2Q@mail.gmail.com>
In-Reply-To: <CAFr9PXnAQJ73Lw3SDfFDC+2LFXks_FSTP3CwWK-vViyZ_==H2Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 3 Sep 2026 21:28:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmb946i1rueZsG3VqZ4PUbmxOK0N0xfZU1Xvy844cN+Yg@mail.gmail.com>
X-Gm-Features: AcwNN1V-rG7uqj05jAdeC17k_5Db5YioNySIY1h0cx1IgUnALrgtS2zbvENrzj0
Message-ID: <CAD++jLmb946i1rueZsG3VqZ4PUbmxOK0N0xfZU1Xvy844cN+Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Modernize the Faraday FOTG210 driver
To: Daniel Palmer <daniel@thingy.jp>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, Sep 3, 2026 at 1:06=E2=80=AFPM Daniel Palmer <daniel@thingy.jp> wro=
te:

> Thanks for doing this! I didn't have the time to do this all in one go
> so I sent an RFC patch for allowing overrides in the ehci driver as a
> prerequisite a few weeks ago.
> I will rebase my version of this on top of this series and test on my
> hardware when I get some time.

I should have worked on this sooner, the FOTG210 was in
sad shape and you told me exactly what needed to get done.

I have made some modifications in accordance with Alan's
feedback, I will send it out as v3 so you can check.

Yours,
Linus Walleij

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621FC41379F;
	Sun, 27 Sep 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527123; cv=none; b=rOoWzI3t0hu1CTc+xVo+lMK9FrS8rZ9YZ+X2eXI+1qKbbOveReRMuAnF2O/uhjnT29kWbraJB0+n3pPHdvg2M2xB00mArsAcuB//opnfXeJ4Lhmx3iG6jvVOSbzRljy25X+WSML2BqrXMziyXBONKm5GebMTYKgxqSb72OG1Geg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527123; c=relaxed/simple;
	bh=IJfHHMiuyoZKFm+V6ewC7tMlRpd+jb26tx/Of+xsr2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn19oGUoXSl3my4tDeUXvDhN1t7o2BqMmrDrFb3R6XhIjqVjdEz5UE67nYSSV+978rwKHe3qO8qDYWk8KNsL5f/yJCAxjATbd5G+dTKK/BXSpnfeQHAgUhAAaTZfDOzvM3+5/JfC+bfdNGCXeqqVnRZPkOY02LGMiaZh/oqChA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vVJ+zoTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vVJ+zoTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588F01F000FF;
	Sun, 27 Sep 2026 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790527121;
	bh=OZ5f9P+WqmVxDw2Rol7zbW+rThp0cvMFk1DIpBtalso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vVJ+zoTA3+cpb/opmSfaw/7UpXRZp6AYTn+Pthe7VA5C/zLoaNp2Ol689qzgpwCch
	 YZCX5BxPKQEW89TDMCI5Sd7ITd7Tszl8qdJIUTyCTQTd4H2SYR2EVn6XLbLzK80wCr
	 itY9HysZLCSYfI91sEOQQESywvlP0T0m55q+VfJ0=
Date: Sun, 27 Sep 2026 18:38:39 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Kingz Tuffa <ak416_kingz@yahoo.com>
Cc: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: greybus uart patch.
Message-ID: <2026092732-aroma-murmuring-006c@gregkh>
References: <378088904.1527494.1790495800044.ref@mail.yahoo.com>
 <378088904.1527494.1790495800044@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <378088904.1527494.1790495800044@mail.yahoo.com>

On Sun, Sep 27, 2026 at 07:56:40AM +0000, Kingz Tuffa wrote:
>  From: =3D?utf-8?q?Roberts=3D20Bric=3DC4=3DABtis?=3D <ak416_kingz@yahoo.c=
om> Date: Sun, 27 Sep 2026 10:48:38 +0000 Subject: [PATCH] staging: greybus=
: uart: fix alignment to match open parenthesis MIME-Version: 1.0 Content-T=
ype: text/plain; charset=3Dutf-8 Content-Transfer-Encoding: 8bit Clean up t=
he coding style in uart.c by aligning the arguments of wait_for_completion_=
timeout() properly. Signed-off-by: Roberts Bric=C4=ABtis <ak416_kingz@yahoo=
=2Ecom> --- drivers/staging/greybus/uart.c | 2 +- 1 file changed, 1 inserti=
on(+), 1 deletion(-) diff --git a/drivers/staging/greybus/uart.c b/drivers/=
staging/greybus/uart.c index 24b4dab069c3..3d5ff4f65555 100644 --- a/driver=
s/staging/greybus/uart.c +++ b/drivers/staging/greybus/uart.c @@ -318,7 +31=
8,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty) retur=
n 0; ret =3D wait_for_completion_timeout(&gb_tty->credits_complete, - msecs=
_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC)); + msecs_to_jiffies(GB_UART_=
CREDIT_WAIT_TIMEOUT_MSEC)); if (!ret) { dev_err(&gb_tty->gbphy_dev->dev, "t=
ime out waiting for credits\n"); -- 2.55.0=20

Something went really wrong :(

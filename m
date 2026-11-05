Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868277;
	b=Al2ULwBmE5mFv8AZ1MD8mLoDOYwKq3ZOLn0HcpFrWBlGg4xabODhPJSeqtUg9j6kNR44
	 eSGeGUDX+MmdL8jgEhRhhtv8oKqDtn9e71eYTYPosebugGk4ypj9QrIjp+xer7i8Pc85L
	 FZs2RjVf4SAqkrdCQRbIf606D3AntfT74sX/PCj1TgLnL/j0b3n0mdcU3/O14oOLO+klT
	 VQStlch884EMpD21I5VYm42JZQXSCRc+OfMPS5ryqUQkYTB5yTN7FEATD0yws+787601w
	 8j97vHAMBnFZzx32ts8gIiqsX2BBeSnLyqYXKjBoQ1sxyX3S4cjXxRDH/RgY6uJctyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868277;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H47SyQm6XOF9+D0wTu3wJ2QVExzRbX0luU1OhEL59YE=;
	b=S2Z7muvx97wAQR0CCGnCjmf74znppYPQ9pqLMopXVzfc+R03uQvPiJHhjWpMq6eixvQ2
	 G5QndSUaZNvSkSRZPLD/4UPbvdA79A3bRHRGoyjHHZWQVcM7XD0nheLjO8I1Pl1VY+MVW
	 5dY741aTECmc0O8NMyCGqplcA265XBVwk1YEuWhJ2OIfa5x8DwfKPg8Jrzd8nkpMdemGC
	 M4NQHIzAcjI2FO1Er6jk+HIkrcLHuE5rbk6XT61QyAkb7wVBSzhIZksElB108zHFHTyEi
	 ShwErKJfqOooEl6UxFI4FM2c+FJ42A9ZhjxeITwkO0FVJott6vIqT7y29FfrHPcf9sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+q1xpCh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1C606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+q1xpCh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CC21F00A02
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868277;
	bh=H47SyQm6XOF9+D0wTu3wJ2QVExzRbX0luU1OhEL59YE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S+q1xpCh7hTsizY2yWhWEm3POUTJQoVDIHwB3V12Zl9GnCYkeC/mMg+NsI9aleUWP
	 a9EvW6hCuw5e4vxtZAQpdGQC8KcO5QjYpN9qOFNC47rbDAgVRSTzXt2aL5h/JjOmSX
	 ScXmqb2AXpBy9PW8riJtaeq7kFEaIZsAJi9cC54v89CQfwtM1mobNFYSCsdU8+gPwx
	 OdNTuobaRUj28RBs5hify13XGz/c+GnzP9bzZ93wyHLhgVK7TYHNHyrwUB6ndrrFP5
	 NWSQF9o/0nqt/b3fqDzb7RTUo6xHN0L3nB4cApEU0jtqzywsAx0BQY0fNd0AVCJG5+
	 wZXtdkMS1iOJA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so1508735e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwubu4HEgPpCVxunisuFY7CDkonGlr4JkXIJXwDUeKH0Z4GVV8vFk/MpPN70YqP2m93MsBJDoMiT3DeHmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0zs1B2QV9fLfNd3o0q3HZU83R8/xjHdFlh9zk41LpseoOFmaK
	a1a7lSUekRzDV0/YsHpDOAyscLODEstHsvRhcfkY8/iPCra44NtE8N56ZypvAaDo/l/jVZ4WEU0
	vxXbOhluU8etydIK3wftjGk8nUYT/Ys8=
X-Received: by 2002:a05:6512:1111:b0:5be:5209:9f1e with SMTP id
 2adb3069b0e04-5bfd9560832mr6000618e87.19.1793868276115; Thu, 05 Nov 2026
 00:44:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com> <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:44:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
X-Gm-Features: AclHuK_DuZ25j9_4w6ziN20_9JjToRWYCmaLaXk3QmbA1dnJxgT3Zd7fLk7HDIs
Message-ID: <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
Subject: Re: [PATCH 8/8] i2c: nomadik: reduce FIFO flush timeout to avoid long
 interrupt handling
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>, Ben Dooks <ben-linux@fluff.org>, 
	Andrea Gallo <andrea.gallo@stericsson.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:30=E2=80=AFAM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> In flush_i2c_fifo(), the driver sets FTX and FRX flags and waits until
> they are reset (these bits are self-clearing). If after the first read
> one or both of these bits is set, it waits until both are reset. The
> timeout is 10 * I2C transfer timeout. I2C transfer timeout is by default
> 200 milliseconds. 2 seconds are much more than needed: as stated in the
> comment above, the flushing operation takes just several cycles before
> completed.
>
> flush_i2c_fifo() is called from init_hw() that may be called from
> interrupt handler. So, if the I2C controller is stuck and the FIFO does
> not get flushed, the CPU may spend up to 2 seconds in the interrupt
> handler and cause watchdog timeout or other unwanted consequences.
> Moreover, if the interrupt is handled by the same CPU core that updates
> jiffies, the loop may not finish at all.
>
> To avoid too long waiting, reduce the timeout to 100 microseconds and
> use read_poll_timeout_atomic() instead of relying on jiffies.
>
> Fixes: 3f9900f17cdb ("i2c: Add support for Ux500/Nomadik I2C controller")

Is it really "fixing" that? I don't know if I agree that this is an error
in the initial submission in 2010...

>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Surplus newline above? Maintainer can remove it when applying.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699353;
	b=q/8qQjGfJ4cIN7olyTzNArbaak2mVqJ++HxHWPHfGtI/kxGMMDoQU/pmQ8Ha0t/0XvLF
	 bgNAIyElXPR/M7siwteRbR62EaiG/N80sl4QkpHhetaU5UFMyHigfrz1mDqEJFVfebNHV
	 qECOHghRaFucbzyVSN1WbbMI7YWZXvHUOfVJb2W121zC7xEZ/UfKElLieTfG83sEoDPJd
	 6t/qV+TFKY4937/p0khkpjJG7GXQjIA2XplYyhA5qlHGAUDbCvFys6RyhcNAit/INkJiR
	 2mp1ACwwwo2CxCi2KCrwaFvNxL9E156hydsr1ePtIHSQvErn0znFl9/352NRwMHecvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699353;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ylrl98H/oi6kVjKkLEYq2OJJs9fx6JVqgO3GHSLwI00=;
	b=IZluSHEVFctxEE5NYrBnkSdADik6mz8SvcJ31sxEj69+1NF1sh1mn3KjuBsottXJ44ic
	 O3+lhQEeaW/lXJRZnNu4O9x6Rs/a53fREXzHx95Y/fD2OQTCIfclANY0+RrQg8H8MK68a
	 STqqmFoUcwt9MAMH8uERGiBVeUR0jCR8Dw7DlyiS6+EckSdiwSVB8Yv6otwSn19A2E/6i
	 bSTh8dL6vVcrgCzBQdiXL9DkfMeQ6AUVXWB2GTrFaq9DatSosG1Jt/SE8UdQsx3Dw/WRF
	 b/pj20csZ0FLg0LsecDaDhzB5EX6NwlSea9zOkxe1eCoHt5HxMCjQG1KDnTGsClumeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCf5BEiZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23286606A324;
	Tue,  3 Nov 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCf5BEiZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1201F00A16;
	Tue,  3 Nov 2026 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699352;
	bh=ylrl98H/oi6kVjKkLEYq2OJJs9fx6JVqgO3GHSLwI00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TCf5BEiZyZYXarpybkObEUkHSHilYbJPAy8ThT7xO7n3HVFgfQNrNK/z/8YqVVw7a
	 IOe1Ty5l8zq6lS2RefnCeFHLBK3ZvxYkHAoO8+MQJblPcp/5aiaSYVChaShOtQQeSG
	 CSRRIXKcSEMhO3eQNwC3JHBSVQxo2trr6yBq8CK6gyqFJzi4h51wreo+rGIxszECIT
	 0JLP2uuL77Nuoj15vd1+eE7Fs4KsYfgqbAqVLNlVz/irlzi6cgdIjiS9KULchsS9IS
	 t1mX5gVa8lIdmNSFx6uD8B8pqoDAJ3goXuPzIhgiBHxRb6US9bPnf1E/jbjx3oD+Cu
	 EPASwHU5mRxww==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xOB8g-00000006I3f-0e6Y;
	Tue, 03 Nov 2026 10:49:10 +0100
Date: Tue, 3 Nov 2026 10:49:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Alex Elder <elder@ieee.org>, Maritu Hone <marehone12@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumuFpFQWloRxaqO@hovoldconsulting.com>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
 <aumfB5MLWIQuTYY3@stanley.mountain>
 <aumlkgtsSDS1fw4g@hovoldconsulting.com>
 <aumpM9Hlh40t9UZd@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aumpM9Hlh40t9UZd@stanley.mountain>

On Tue, Nov 03, 2026 at 12:28:19PM +0300, Dan Carpenter wrote:
> On Tue, Nov 03, 2026 at 10:12:50AM +0100, Johan Hovold wrote:

> > It's the kfifo_out_peek() in gb_uart_tx_write_work() that may write 2
> > bytes beyond gb_tty->buffer (as its size is currently just
> > gb_tty->buffer_payload_max).
> 
> Ah, right.
> 
> The right way to fix this is to have a commit message that
> says.  "The gb_tty->buffer pointer is supposed to hold a struct with
> a flex array at the end, but gb_uart_probe() only allocates enough
> space for the flex array so it's two bytes too small.
> 
> Part of the reason for this bug is because it uses a void pointer
> instead of a struct pointer.  Clean that up as well to prevent
> future bugs."
> 
> Please send something like this in v2.  (Send exactly this code
> but edit the commit message if you want or leave it as-is).

Looks good, but since kzalloc_flex() was introduced in 7.0 (and this
bugs goes back to 4.9 it may be better to do that conversion in a
follow-up patch to assist the backporters.

Johan

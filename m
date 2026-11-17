Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900291;
	b=4BaDzonYQTZQUgyYTDNtoH/+D5lC+IPeDoZwNZwxjwboUfcbLupqgBj7TK49rjyunyDx
	 ZqnZxF79FEAunTCUbIJTwrXHxubYa3w4ccTuOB39K1bDrAC7lxreF/Srfa8eR3ZPMWEVh
	 FuKCbVjbtDBN5gABy/NZpHUGlI9RLYYaQMovq2k1ZMIj9bOOqbaD/1IW1t27VCcwC/Lb2
	 YA8Oef67ndKrww604nbGC9t+0Vl8sRuNqUNOn45Hh+PGV9d+VdUIUmLVng33P60HYitMZ
	 WNhehHbsQwzBXwLa803d7tY61cjBPfntbKNDJq4D9DHtYMLIEFagC9g0bfunc7OfVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900291;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AVkRUZTgXWNhN4oG9wumuoURSZsv/ta/ThIe9MKkrNI=;
	b=JMwQcR8f2zw40ZxOtsn8zH6Ybat29OqnDZ7rQqJtXG5tXUpM5EfuvkljRTOOnh71OnkP
	 mX7cT8u3r0m+kSpyMlLJMeTWTpl3CSldagS86i0YdtmLYZFV0n6NLkgNTjD7yRwG0gZKy
	 iCzigeBj5HwPYBSCXMlvp+EjO2W12gEfzy0whFOd+f/KBLtD2BJ0bfP50yP8i+io9Hr5k
	 GC0dTf4NGhKnmzHdVQlUY7jeUM8w8h51Lk+FfdS+9N0T3y3aUdhvrvQfeqWv59YLi+/dL
	 eFuB5lM9AtnOd3WV2a1uVKS3pZYHSYSj9OgEWGK4I2eY+hHU6igbqwHT8TiFHvB/3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FqPXdYXX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DA606A31C;
	Tue, 17 Nov 2026 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FqPXdYXX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1A81F000C4;
	Tue, 17 Nov 2026 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794900291;
	bh=AVkRUZTgXWNhN4oG9wumuoURSZsv/ta/ThIe9MKkrNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FqPXdYXXYM3Kr5Ad29imUp6pCqSsZxQYhEceWydyiysciJAMV+4cPIlrH0ryr8Tgi
	 2wglvIdznTecpbJxYwtnQAMviulZiyz1gJBUnV/3bHhfv7PS43hwxOEd6lwUtklYwW
	 0Zj0PxOtdUYdkJaOWVdM4w4Go+Wb6Dd/UShU06/8=
Date: Tue, 17 Nov 2026 08:24:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Johan Hovold <johan@kernel.org>, leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Message-ID: <2026111722-freckled-baking-d277@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
 <20261015025456.3927808-1-huangwei@kylinos.cn>
 <2026111606-penpal-reverse-14b7@gregkh>
 <20261117071250.2843769-1-huangwei@kylinos.cn>
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
In-Reply-To: <20261117071250.2843769-1-huangwei@kylinos.cn>

On Tue, Nov 17, 2026 at 03:12:50PM +0800, Huang Wei wrote:
> Hi Greg,
> 
> Sorry about that - here's the context.

Sorry about what?  You did not quote anything here, as my bot says:

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

thanks,

greg k-h

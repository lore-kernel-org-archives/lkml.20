Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474066;
	b=0x2ZpT+Fp2usnDMIkLYLazQLSjbvGgWqHI3BtiD+LeTgAPsj6OnMJkJYjJlVHTFU9LYq
	 1/fj3H3tJoKe3FIavyB/Ut2dpguOBbbQVABD0HT109E9vFEyEXQvour5Q5xCjxFecDWoe
	 m6msKHBCha0TizI34lWcdSSxTRPc2jKVsGW0AS7aiBUVI+JOlSfWmrkSVgDyNk8vgegHL
	 +zbobfbHvLgK/TIZpOBHZ6LjDMA14GQ9Vngb2J8Y3KylxuQfy+2Bo55mDk1Hs3+G/WKDS
	 Ute9sM+HhSBwILiprdu2NYufunbwfb4vQ7LOEwTfAGpnWrEBlpr6Uf4Tg4saImuEHuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474066;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=meqPxnl6P9uuOtaOHmSMjD4WJKfEEkXK3MoLbOtoy0E=;
	b=Vio/JkiRzGs46sTajIvMsJAcWFHB2auB0Z1HJ2guzCAwCTb6wSiGNMd9LECk9BZBC412
	 WYNOKjw4MA2t6e0BWJIBSt6LuqWzt13fGuHn6bRmOhlEUfhZefgXSJf9b3QWNP8O51uZS
	 ZzJLekLNHwuMpXgf6FG7xpF7XqbRV7GVx6giH5JGH2cc+dlCkEuO8KxfiajY0hX6fV9Et
	 sVPpuzTEGwfNJhk9shX2/LwvcXs/3K+GXHzS6/h4n3qJdpU8ULCh9OoeE4pMEfO+CGDjL
	 0Y+V6WAh0X08cJsw5/KDveUB7YjCJDUgYlGEPHWnOHC7X2eT4iS96VWaCnMzM+UPFcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X3Nr6/or";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 130F8606A31C;
	Thu, 12 Nov 2026 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3Nr6/or
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 262401F00A06;
	Thu, 12 Nov 2026 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474065;
	bh=meqPxnl6P9uuOtaOHmSMjD4WJKfEEkXK3MoLbOtoy0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3Nr6/or8DZnLtx5b0g5HPBH8eqzJ8Jli2dpF+u1Vl+9o+YX4vqb8PnQPt1aEOYN/
	 DbbwoubLtBqABXOzhdoGhPKfds1U7BVo0WzWhaDu0aIwJHpouQgSRZrSDtc2y+W2Zq
	 tDjEVCtJ9EPyIHRmeUZcvqqMg+HM8dqVTmJT92y4YvBKhrXb7U77SUBE0v62eNd0c5
	 Hyk4SZ7xh1QdshuDCvn9BhUxOc4G8Z69HctZyW+9pYkDP5Ae6xkaLqpmrKIxdFntuQ
	 6HNSqBBajcAQ/WWFZkox34aDfKBILe/HIknakHqeANvWSsf2DO4nIx4P0bQDsTmVKz
	 hzdQ5Wat86RMA==
Date: Thu, 12 Nov 2026 10:01:02 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Message-ID: <rscry5clkcrwhqaz4hzwzqyg5ijujntv5vcajjqnq5ghbb7f5v@rkvbszy66g77>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>

On Tue, Nov 03, 2026 at 12:18:04PM +0800, Shawn Guo wrote:
> The series adds a driver/binding for onsemi FUSB15201 which can be found
> on Qualcomm Nord reference design boards as a dual-port USB Type-C
> controller.
> 
> Changes for v5:
> - Hold chip->lock while seeding the initial port state in
>   fusb15201_hw_init(), so a data_role or power_role write arriving
>   while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
> - Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/
>

Hi Greg!

Gentle ping. This has been on the list for a long time, has all the tags
and no sashiko comments. Could you please queue this for v7.5? It's
blocking the DT changes with USB support for Qualcomm Nord.

Thanks,
Bartosz

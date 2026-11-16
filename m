Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821838;
	b=mPsPHrMoCetycjxCOFWMvoAPnygvgr/sP92GE0EOTQJODBAz0b/VovSR5zvcOmKe7drP
	 EKfVt2UyMXstMNLuNS1NE6ukheEoy+MAUk7cvPWdQiR60FIIvjv29npOrTzRj5DejG2dM
	 XXuDavcQz6CZyq+vzgrLN/fddWtrRH9SXch8EPjymxWrbC2rF9z/A3K65S8w2MrdzRsjL
	 hb5n/zfPvv2cfxQ9PNilwjf+bPQ9vvHguXkRpCgvk9J5KxdcO8LBMELkgIO7TZCu7/NpD
	 Upf4/wpBHZTl0T6tsCwgf+xlvJux0ta3YzvRyx5IOnFN5AejWXdzI8juCmTMkasp5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821838;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zX8t/qRfNd1cGkFUnU93sx9LUgE/FSkLF6JLxc8EkZU=;
	b=CYgzVMQAU7hRzdxSQu1o7vWH92VjDhEuKKkr6vgnboGsddAotOTq4p7y8mWOPOmUQmY6
	 WYR6ZNQP2Tpadi9NJ+GuHe1LaHw5N3iFyeJahnSztr4CspIBbK2X8btcMog+L3FsI+OrD
	 EUIv2R7U73fCQnGnMGzjm50Jlo54xtuRYOCM7k9vynBj3kdBAJTmz1BWL2J3jmY5a1qcy
	 341muc7CllL19dFzjMxwS4isqM/jloHvJ1cZ7HwIR7zrLyakFKTtG236HKZnC3Q6qCl58
	 6U1SqKuLygoeQqM7MHO2b94V11VD6ZDKdzFC3GqDe0OCLOAu674jRSisBc/CufrtOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="NF3/dgWj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E4606A31C;
	Mon, 16 Nov 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NF3/dgWj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB29E1F000C9;
	Mon, 16 Nov 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794821838;
	bh=zX8t/qRfNd1cGkFUnU93sx9LUgE/FSkLF6JLxc8EkZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NF3/dgWjjrf/NmaJzgrftlmhb5rZ/C+LeCs1PbguDbL1/zHjIzFUg0cFf72TNdKKn
	 HtnwFDlElRuFuS36ojXJyH6i3JXwV47RJG56qomOvhhbc9AIWBJnzLcj8p+HR3Bclr
	 i9SGYBZso/yi+lvVVEEp2c6PCfuX8d2h3FIMMmgI=
Date: Mon, 16 Nov 2026 10:37:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Johan Hovold <johan@kernel.org>, leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Message-ID: <2026111606-penpal-reverse-14b7@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
 <20261015025456.3927808-1-huangwei@kylinos.cn>
 <20261116024507.2633503-1-huangwei@kylinos.cn>
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
In-Reply-To: <20261116024507.2633503-1-huangwei@kylinos.cn>

On Mon, Nov 16, 2026 at 10:45:07AM +0800, Huang Wei wrote:
> Hi Johan,
> 
> Following up on this thread.

There is no context here :(

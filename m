Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887478;
	b=Cx/ua04NMlI1dOkJy38nCEV9E5ZA9wdNrUqg8WUSUQyMu1gtEh32zCaJlk4065+SnwK4
	 cJWmpdi2mBvrD98PP4APWuj28hV9G1nG6SyufijW1fZtTWQiheSw9SUNh4mMFS3VrU5Xz
	 1ehKY6RIFvMPmgNypq8god62inkcZgMPOuw+spKF1CQ7IlMtV7W5tXP+BJ8q4EbZDp3Eg
	 EhV/MROUuvaBaBDyW4DUqdy/2H88GYMtJo6XaneQEpY9dPjsUN0IdnabxVDqXDrAj1+bk
	 WJXlSZ1Qfb/ID3mm7yq27evliiUCXiQxn2FADDISg+qjELFnLFs3tla4bsIXI1u5+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887478;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U9fage6O38wf4Jyjkv92n9aFsmoIKxBwMZm4Hi3HZRw=;
	b=1hSNwa7bfXZRIiFRw+mCu6FtqHFy1DEI+WyN9XlNZz9aePbG9Ns+YS1XvR79jSLemW6P
	 oJ9exbXY05Dflzq89z0qWNMRESEGNmRYlgc9i1HmwnUSDfAIOyFL+0OW5p8PfKl+lqauY
	 h11PKq43ywxfFmVXuqw94ASALdndyjAR1QFpqM8BaoXQPxO+KWOR21dK3sNRiqnv7mk3x
	 bKlHly/8DPsxekNmdT+8RXPHSksnGkk8w+fl+S8P0ziDsLAR6ZjzZlksuWzn1COctnt8K
	 TB9uUzKKhhLZjXQuLzr9nzrkPXM34Tv8Bmgval0fMr4Xq1LB0meeaiUzP6uMFp6uo2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T841G5S+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id AA490606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T841G5S+
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6B8461F000C1;
	Thu,  5 Nov 2026 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887477;
	bh=U9fage6O38wf4Jyjkv92n9aFsmoIKxBwMZm4Hi3HZRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T841G5S+7Vze1jA9zBedW4UFKkhLeCjdA0s74DVEUYKCHa+++nCKpo1CoyFr7xQwy
	 HpJmtDIfA87iNVunufR5qTctuAgxbGzh7WIAD5jAiIQHHWIGWRYwTnQO6oQULtGiz3
	 ZDzAwCxRaTnA8Hji6gkVfX9ONeApAPJdQUaR+fLqOfPIqsvZpfiFXO6uDH7hIzuAg2
	 8+m5pA0yTKrSiP1IfPksHQFmx+ZbW/TIt9JEs1bZ3Yhvgm9nt2WcPlMVbFQf2CF/dc
	 rHyJ2xFaoeGqrSeS0cYKNNTPLtqgU1loCWVIj3cqd6JP0496Z/05LOU4/eqEWmnTa6
	 XA+8627cC+p3Q==
Date: Thu, 5 Nov 2026 15:04:33 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-kernel@vger.kernel.org, WenTao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] regulator: as3722: use the platform OF node setter
Message-ID: <teaiolq6uirptlibquwwrc3v7rxykdcfbzxorjfs7wyty2zopj@xy6lcgfztmrh>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
 <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
 <20261105100342.34730-1-yigejiang86@gmail.com>
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
In-Reply-To: <20261105100342.34730-1-yigejiang86@gmail.com>

On Thu, Nov 05, 2026 at 06:03:41PM +0800, Yige Jiang wrote:
> as3722_get_regulator_dt_data() gets the regulators child node and
> assigns it only to dev.of_node. Platform device release now puts
> dev.fwnode, leaving the acquired node reference unreleased.
> 
> Use platform_device_set_of_node() to synchronize both fields and
> give the device its own reference. Use __free(device_node) to release
> the local lookup reference when the function returns. This keeps
> the node valid for regulator matching and the platform device
> lifetime, while also replacing the previous device-owned reference
> on a probe retry.
> 
> Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

As mark said: don't send new versions in response to previous threads.

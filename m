Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764856;
	b=KsNwEzCE2+pQvz6Yug3QsumEnHSZCdDiqMfn33gHCQc91bTNmBbU/mzkGgQOa/G++Hoi
	 TLnlFVdrgVN+IV0r2GXjcqJ6abYwyZgmsdPkwLe3lsIyzPMrD6B2fuc+WSscp9TEIirM5
	 sbIwTKWeEAeztL5FcIy9WyWNbF3+FGyzLQ4YHyfcIocRxE0nsNkYUIJU8Ttqjpryl3vc2
	 EEZbSHLT+zn9pkfs45cWlFmAvL54Dj5f7zm1ZD/F0aEnkFj52qobX0voV2MtbUfJrtdik
	 IHboTpPkQtsiqqd4KcmiDqAdEmHXcx0lziF+GK3YzDdp4csq6qnxzQWvnnAYMigPbJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764856;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mxfbM5uXXYDvn4Zj+C0RyPp0z3BfwUkSmef6HRjVrq0=;
	b=AaCYnYSWHZR6Cc4U8yrxKVCYykMz3lM/FFURRFXEXZIlOdr7+NFUWsE5kp9PtBuw8O2Q
	 ZBgjX60WAAAS8fNZinwrjNDN8A7ZixruSQvLjRXH+IlpH8XQU+oh77wXHhsFhc3DbED0D
	 KIiuUnB84wKDCAzmmRyEXbZPw5qywyCllQwlYYPIZRHRZ75upNimAJc784mrgKmiIX34O
	 6ZCX/JGC0+HuO9dgxBYLW2/JJwzrfHJPwa8sg8k61iM0wmfWSqZRAHrdMf2rVplo7J8cD
	 1IK+RSAJb1OAmHtKso7Sbeazc+utCXZrVyVwdKKdoVP6COEDWyoLiDnQhr0JPrKILUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1N+yMW3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55292606A31D;
	Fri, 23 Oct 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1N+yMW3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723531F01825;
	Fri, 23 Oct 2026 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764855;
	bh=mxfbM5uXXYDvn4Zj+C0RyPp0z3BfwUkSmef6HRjVrq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1N+yMW3JxJe2NayiHusP++T+g+2+bTMUekHCtussLn9q6Dc5lmHhX1GcAnLlAv9W
	 BaVuhFZUJ45GEziM52PTXY0yLZA03ZvAnI+OFvMzS8koXkqhGAzwUsPK2LNwuqjh7E
	 SHax9+T3Kal+sOYZjkfoQQswuuz2DNG5/aoU31LAqWoC0rjH5l5k5zVOjgU2yMn6cc
	 7K+K3mMFwQVFMRwGNVaJY4/LUJrL2tYnmC8V0fHyj0ik+EW0tfxM7CQC7tnfG66gAA
	 wvOW9nCM1gSlrCvsiD7bQ3HlFjehtARozEm+Y7clSPJwvIg74ogKOZWfTfoYcjMA93
	 NE9ZzvEPyAutA==
Date: Fri, 23 Oct 2026 10:14:13 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: keys@linux.kernel.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Commits in keyring without trackable emails
Message-ID: <20261023-venomous-bird-of-agility-c6e1c1@meerkat>
References: <26137926-0e7d-4429-99ac-7ca51d4fe8bd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26137926-0e7d-4429-99ac-7ca51d4fe8bd@kernel.org>

On Fri, Oct 23, 2026 at 09:21:05AM +0200, Krzysztof Kozlowski wrote:
> A few recent commits like bbecf3f1a77b ("Add AE1C2FBEA7DB42E1 (Troy
> Mitchell)") have message Id which points nowhere.
> 
> Last three commits:
> 
> https://lore.kernel.org/r/7ia41p9k58ci.fsf@castle.c.googlers.com/
> https://lore.kernel.org/r/010001a153609a07-82ca770b-3c4e-41e2-922a-92aa9475eee8-000000@email.amazonses.com
> 
> https://lore.kernel.org/r/20261015152222.000053c6@gmail.com/
> 
> How were these updates received? Why aren't they on keys@ mailing list?

It was never a requirement that all key updates must be sent via the keys@
mailing list. Some of them are sent as part of kernel.org account request to
the non-public helpdesk address. They are tracked using the Message-Id as
opposed to a Link trailer.

Many key updates land on the keyring list via routine keyserver updates --
they carry no provenance indicators at all.

-K

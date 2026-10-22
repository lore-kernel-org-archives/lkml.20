Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677165;
	b=oqqQUtvxDopPn6LGKblgWObe5K3Cw5sGzu0dWyjTYZFfQIyRV1vAlgJAk9TGA4x3rG8H
	 YwPBmcWes/zTC633k9cagBcpYxYhNRLdfaPTfT0mqy6DdB1wIN9Z+VZOo20/Y7RiB7aZt
	 B74PL68WWNP9FTPJ0PQt8wIVfiuZLuJuvf78hacvkNilk9e2jz98LQzHHsCxv+nRorWUj
	 a9l/jkQdXSdSLZJVLy9X8ZNkgA+dpDCS+wtl41y1pOJr5Tn4e10gr4HEtocXEuIk6G2Fd
	 ukrAX+8BWlepLQP4918gXflBAqBZ3XRdQb+PDjpPWvMGb5et2xjRl5kcNCpRsbjkrZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677165;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4UJXl/niMVZl0CeunjxO5V5+JucB08q7SmqsbPUUWt8=;
	b=Rl02YiUjPEIcyGa7o0+YB8rN4cPbmb/1Lgbntvo5EeQeEtYQp8EBIfjdDqAf7ihDw2uL
	 FlU3cKFR7CAUhR6ISOuslW4gYhCLprsHDvBY5WbS6DWhM8n8FgpegYn7/FN5+zXjFBJKQ
	 AiGTsiQrlQbXOJxKZ4Cv9nX3455od7nafQmiGRG0PtE2FzJtitRinqLeu2s3OZfO+lv7W
	 QwArfpYZ4cKqVUAFfgesJISON26yscFfbsbbvVrwBt9Xl17BQksYEA9suKG3hwfLXfAEV
	 cZhXyuCcTKxCeGf2OEq6uWFReUh0HXKd0HiNO8701oMhd+faxhRjXwx4kEm2BqQuKOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STQ9WQxF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D8606A31A;
	Thu, 22 Oct 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STQ9WQxF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2501F000C1;
	Thu, 22 Oct 2026 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677164;
	bh=4UJXl/niMVZl0CeunjxO5V5+JucB08q7SmqsbPUUWt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=STQ9WQxFxSTQrMiNc6K1oZg5u8cSJCGFgVj3DXnrq9XWS1zUaQ3etft68rCuaoSKJ
	 zn2zKqJ2i4P0HJw23IPxb36JP4uZQxVtqhGxVdTiDw+eO/VO1g1ZsObvruiF4K9rub
	 P268vlJu1/Y5sg7qfW/cBMylvSFoPPE2UzRenrtCbNegRWCEf6Hw+vV/9cgs0r8S20
	 SubedeKvP+LbUoh+GeTqStlqFdWYWSI63tOLFpO4u5oBtQE5ATqJsPgK+xA8U7Hpfa
	 tWaCyxhqYJ4HtKSwJ6MuG5pI8lRlN/DWxIQNbQVs8f3kuNL6h6RXzyDcTWQdL1noqQ
	 c8bqtsunMSr+g==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJtDl-00000000ODl-3Zy5;
	Thu, 22 Oct 2026 15:52:41 +0200
Date: Thu, 22 Oct 2026 15:52:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Alex Elder <elder@ieee.org>, pavankumaryalagada@gmail.com,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, elder@kernel.org,
	gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com,
	dtwlin@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
Message-ID: <atoVKX09VDnak7EZ@hovoldconsulting.com>
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
 <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
 <6b5a87f-3ca-ddc4-1ea8-f3ee7f45d83@inria.fr>
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
In-Reply-To: <6b5a87f-3ca-ddc4-1ea8-f3ee7f45d83@inria.fr>

On Thu, Oct 22, 2026 at 09:45:51AM -0400, Julia Lawall wrote:
> On Thu, 22 Oct 2026, Alex Elder wrote:
> > On 10/22/26 8:35 AM, Julia Lawall wrote:
> > > Does anyone on the greybus list know anything about this person:
> > >
> > > Bryan O'Donoghue <pure.logic@nexus-software.ie>
> > >
> > > The email address is not valid, which is somewhat tiresome...
> >
> > Bryan was on the Greybus kernel team.  Remove that address from
> > the list.  I'll let him know that e-mail is bouncing so he can
> > add himself back.
> 
> Actually, the email comes from the MAINTAINERS file.

Hmm. I haven't seen any such bounces (and I CC:ed that address a couple
of hours ago).

Bryan, is your nexus-software address still valid?

Johan

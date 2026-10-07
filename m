Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC23CB550;
	Wed,  7 Oct 2026 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366163; cv=none; b=UJl4mTK1XSGPJafEFLRCzubqg1QxW3C1yTtvJczP06hVaM9gFhVrCSau5W6bvRXRU8DJw36Fb4o4lVk9xW7JRGSQqZ3aykuVG61tNoWl2KM35+Ml4xFMxXtmc+D0MR8036j4D+z8GCi+11A0swX4VS2qsPMTfFr1dgsRL4qXdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366163; c=relaxed/simple;
	bh=RPvTKzOPpkanvhFAdk04mMPSZkPF1y8YqFDPhe4s7Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUui6+vkYyQB8tBRO4KalwSZBDZYEsX6zdkwCNqDtoMwh2Kj35o9SiN0aElhis19h/c4DLIwGpKu7vTSusDAyyoh65SkB/YxhEPXesUZtuKOFe3fooe5ENzUmC+BjcmC+OYA9B75mAoxnPTb5ZphGeZut0OwMAsBf3ZRclClGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOaAU465; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOaAU465"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577E51F0089B;
	Wed,  7 Oct 2026 09:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366156;
	bh=wIn1L1gfQj7N8u3iWEkYckq5FViJ5Jz175iKiyzC2LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZOaAU465YTrz+nGfYqI38zzy6WSgX/GrmFVWspraWSZ2GrCyaCeWh8Lc1DtihcFo5
	 OirEoS9k3h5G3PCpP+MrXuQUhj1izPNej2TwzhCnXwfJBLh/55KH5vfx9/3/KvqNKL
	 cIncUe4r4OHg7CrtDktQ8BQBzJ/XEaXWDtUMYqW/+L92Isj7f4Y7DeWIgLQuS2dJTW
	 JNatg5QLBCQRcev0cyJFcaQ5UO5AHwpH4TxXEBlLi8T81ix5hwE+ixDgu8MeWI+C2e
	 bGXAZ5X0o5tAtpz8Nb32rtJI9VsO9eKJ1E2ier8P7z8uSTypc1Pi0ZXA6Tkq5wbW/Z
	 rZvpY0UzqUkzg==
Received: from johan by theta with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xEOAL-000000006it-0qbh;
	Wed, 07 Oct 2026 11:42:25 +0200
Date: Wed, 7 Oct 2026 11:42:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Rahul Rao <shreeramrahul94@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: do not use iterator after list
 loop
Message-ID: <asYUAdQs0dwvi2nT@hovoldconsulting.com>
References: <20261007091104.15366-1-shreeramrahul94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007091104.15366-1-shreeramrahul94@gmail.com>

On Wed, Oct 07, 2026 at 02:41:04PM +0530, Rahul Rao wrote:
> Using the list iterator variable outside the loop breaks iterator scope
> semantics and can result in invalid memory access if the loop completes
> without finding a match.

No, it cannot. I rejected another patch like this earlier this week:

	https://lore.kernel.org/all/asNhLGdigxSqU5Op@hovoldconsulting.com/

I assume this was something flagged by coccinelle here too, which you
should have mentioned in your commit message.

I don't know what the warning message looks like but the term
"potential" is key here. You still need to look at the code to determine
whether there is an actual issue or not.

Johan

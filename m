Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797745;
	b=vjs1JnJSQE3FTYMLokoG5DktkNW9/elyNuweDXrKskuLQ8vngIQvS2ed7qh3Qe/ISbr7
	 n8xA0vQJDg0CkBN2kFlweYZ6uXHmxy6uNFa3Lw84Oa2ayR2tBWToCnP14e6CBXqu3UIxU
	 5BHL+ENroek23WgtbciQrCPlaPMba0sDEuv4crMx+AoW5UyVXAuE+2tKCKBJ1F++SgxeA
	 Ncyjz/8YK68kjNvh5DGFUllS5vvWQsT65jw0hLoq7CxxOwtZE4VkHxX4F2bB9vJF2448l
	 slnqdcFvAygeTIxG9GZHAaicsaSiaBFRXdoHlNrODPDbB1MDG9Gw0kiABlij7d5vRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797745;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4yCXEFTBsfLGZkafO6z3LFcrHQmSCDm5BmBDx24VNNY=;
	b=fRLPXgB+vxTgqbhx6KvQSOepXS0S/FAxT5NJbxnS2CJXIRsvgNFqpqQ0RUySNoWCYimh
	 AjXOiRcbUQNFmAxhMn7jcB+LIleLwGcUmk0OZoxCqIbB12rM1sRZK4Yzncn1p2ZxeqkUd
	 q7oauSEIG9xPuF37DRLZrksptmt8k9CSj2uC2XHZWsa4RsB6mTrxnjD2wWvXQ72S2RDSO
	 jX20R2SGGpHXMocyTcFEyJKIRsL8LezRM+aAacOr5AKceyJXuehe92HgisrrM3zrPWDxa
	 NNtfv55HK25n8Cy6UQgzzALwReQ+pegMlclxX/Dp+J4g674PY8nIASWuRHpx3uPw34Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WSrIgyFz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WSrIgyFz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1481F00A16;
	Wed,  4 Nov 2026 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793797745;
	bh=4yCXEFTBsfLGZkafO6z3LFcrHQmSCDm5BmBDx24VNNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WSrIgyFzYDENC+tb3VhMV6DbSHUP0vkZotbm+Saz54vKU1eh4Q2J7oI3ZXpRriXYA
	 OwM4YQ6p9CpC3jufrgmN0Rqp7syANGTJ0ROx/CQnur6B31cAf6dRHAjsxRseACrORN
	 SGuCtGAzUqiPwT6d5Uv41b71dzVgjnbYrhnZDt3c=
Date: Wed, 4 Nov 2026 14:09:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH 0/9] w1: a bunch of llm-found fixes
Message-ID: <2026110451-estrogen-outnumber-cef7@gregkh>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
 <b7f69d8d-3f2a-4258-b19c-8d9d2f0494c8@kernel.org>
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
In-Reply-To: <b7f69d8d-3f2a-4258-b19c-8d9d2f0494c8@kernel.org>

On Fri, Oct 30, 2026 at 02:45:54PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 17:04, Greg Kroah-Hartman wrote:
> > Here's a series of some small llm-found fixes that have been sent to me
> > recently.  Most of them are just minor bugfixes and locking cleanups,
> > but they are good to have from what I can tell.
> > 
> > Submitting them here to get a solid Sashiko run.  If they seem sane, and
> > you want me to take these directly through my char-misc tree I can do
> > that now, or I can gladly wait for you to resend them if you wish to do
> > that instead.
> 
> Thanks, I went through them and they look fine. Please take all these
> directly. I left my Rb-tags.

Wonderful, will grab them now, thanks for the review.

greg k-h

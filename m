Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668488;
	b=pIuqj5G3wbqRVubnqDsxjxDLIkXX1l+cQgt4muWQmv341BjHQ9TK2AieagTsU1iC1/tw
	 yO24PYITw7eJty8j3RcXbksoTr04a2sGZMgJF91oxhz7CIqkRl1FeYBv3mw/VwtKyd8FA
	 yJ37NrsSC0K7i2w1Iv1uDtl5yHil3eOPvxqiStwEQAbbinmOvTGdiwKrQB7QkQxu0nmcS
	 w598DwpN9qcvOTjAcI9nLoS53BqowVMGw128Aq3soXZ0vHJyVyicqD1YzQyeBHg77JGxQ
	 orx1WzJXcHHoIrXtw4ki4pdKoYMUrj9adcjd12cB+MPK+f0FB4lAjCbOoFoRJejFsOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668488;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f52TmhXKW09tvCxy8WBiWvrY1u6Qfmc4NU8BV8wdBzQ=;
	b=eSp7VZbKRlgcbYF9fUGWXhQx+aU0HPu+tRZEdJI0C+FUghneVUvkqoYGjaW3t/NzJNhs
	 bGFyl8bXFyvuIiHWHFZHGy6qSh8Mh2DrtdicbTlQUbLlw0rZarC1ib3xhDxc0yYyNKUrZ
	 e7iE0SjsQP4BC8DBMtAstDNrcWzCTBFWMETEpKW8Sdfao1A/kcX7aTZobjKNVeE+bCmtZ
	 QbqP9p6bXhmvYzmJ+m3fr9BUgZrKOz1Izs9co7XS6cL+dmrjWYJisrwXJLFSaDPaPGNY6
	 U2pOqg86/MP+0M5RUJCQ76TBABgT+6oTsrIayd1cPXKbAXNahD9CICYi/KzcF9UVRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oX7/f53D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B94606A31F;
	Thu, 22 Oct 2026 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oX7/f53D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8C01F000C1;
	Thu, 22 Oct 2026 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792668487;
	bh=f52TmhXKW09tvCxy8WBiWvrY1u6Qfmc4NU8BV8wdBzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oX7/f53DtgngH2ONZPVZnmzBWgB5QsnyCUzGfVCXakeEhXW+7kdifoKRRB9dGWLik
	 fphJgeyxElpR7xKkGPv+rZOVlunSXcG8jK15uWRXUDM/s/HBDLWgHtC9LDCWCu2+KL
	 vGVarcsN7c8XD/unl3WfRaY8x5QlqvutYtpbbiaB0LHOinfe2SR0R3vrSgRD5x6FQG
	 Jqj2icMXEXwKbq5JP5i+7tC+emWwUv01uH/qn6Y3hZkDRWVX9Y3ETrm5WBrSAAgW1a
	 eYjho8a7PsLwd4Yt4dMh1bRZWve7jTXP4scoKhNNrUY8B17g3qfzpry6Jds7nxw92j
	 t31tfrcIoec3Q==
Received: from johan by theta with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xJqxo-0000000097w-1p8u;
	Thu, 22 Oct 2026 13:28:04 +0200
Date: Thu, 22 Oct 2026 13:28:04 +0200
From: Johan Hovold <johan@kernel.org>
To: pavankumaryalagada@gmail.com
Cc: greybus-dev@lists.linaro.org, outreachy@lists.linux.dev,
	pure.logic@nexus-software.ie, elder@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH] staging: greybus: Use fsleep() for delay
Message-ID: <atnzREwGJkuxqQ2_@hovoldconsulting.com>
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
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
In-Reply-To: <20261022110238.38824-1-pavankumaryalagada@gmail.com>

On Thu, Oct 22, 2026 at 04:32:38PM +0530, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> In the loopback function, usleep_range() is used for short delays
> and msleep() for longer delays. This requires choosing the delay
> function based on the requested time and converting microseconds
> to milliseconds when using msleep().

Please include the module in Subject since this is not a subsystem wide
change:

	staging: greybus: loopback: ...
 
> Replace both functions with fsleep(), which selects a suitable
> delay method based on the requested time. This avoids the need
> to choose the delay function and convert the time manually.

It probably doesn't matter here, but I think you should mentioned that
fsleep() will likely make short sleeps longer (25% instead of 100 us
slack).

Johan

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B04E36EA;
	Fri, 18 Sep 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732646; cv=none; b=IxM2HtTFg/g91lK3HJHB6RudmeTdksti/P3kJtvd54lyRJH5DMQzZ4RPBzIgk6t4PsCJFU6Kt+eg0bmMZM0xgcUWcOOuhB3lYuTDOy/zUCZKp818xt3KWNWJcgqy/7wz+sXjgfxsbXuJxDs1siIDWTNznxxWxrwroWe2nlCoCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732646; c=relaxed/simple;
	bh=BC3jibOMfqkG2KMpy/yRO0QFvICYzqv5ZpPZNt1YUks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/2D2qAM+lqfsPHAwesvbyhLUMxRCMsUjpwPyr2HJp2L06FZfH7O5l/pcj7O3Wd/vgqRo7d0cunFmdblHIqWjJ2jpV+Y5Nocvo3DFBwaHvoKJxqGxL6RuL5LyD50q1iYcLG3rRPbrXpXzz+gmrIvKhhnG6IRkrYTwfdoYu5QyZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcCIa5ET; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcCIa5ET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9311F000FF;
	Fri, 18 Sep 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789732645;
	bh=BC3jibOMfqkG2KMpy/yRO0QFvICYzqv5ZpPZNt1YUks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcCIa5ET7cQZOuddIphoWXsVHjrxMZ77tj4CADtbQLVSwkP9iA54kTgCIR0+EAgqU
	 b00Xaxc+GnF8ZMfnztIvlCkXgYlRFECCMneMoZr7mg4Bo1tIG56pksksFl6oFTb7lk
	 dkWg0hJwSgyG6PVd/DCBdqf7+gAy7o2StflL5eD+wsyi1hdUl0URQF14B2dqE2mgdc
	 TM2T5dzNrMBn4hb7ueJEgDzzepaVn97ZpblI3mFQjMWE3W6Hfyr8RW44PftqvGHvIH
	 1dLlNRd34qBW6mTtAaE9dJULDEjN5/ZDTJwxTPiBneBQQLFCQBs15zsw8NaF0JLJwb
	 6kr3IhEaV6Ruw==
Date: Fri, 18 Sep 2026 13:57:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org, 
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260918-strategic-hairy-kelpie-46e807@quoll>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917163157.1380860-4-petko.manolov@konsulko.com>

On Thu, Sep 17, 2026 at 07:31:56PM +0300, Petko Manolov wrote:
> Draeger M48 CPU Module that is built around Altera SoCFPGA.

How can you run a CPU module alone? To my knowledge there is only one
such case, only one exception, and it was explained by the authors. If
this is second, I already asked you to properly explain the hardware in
commit msg.

Your sentence above explains nothing.

Best regards,
Krzysztof


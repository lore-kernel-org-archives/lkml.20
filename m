Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878070;
	b=4blXumgHy6rDHl0nNptL0YUpi/PglIaW/2FsNzPX+BQqWNbWge5tWAMBps10IX3dQEAn
	 ufwkIP7muJDeZ9TwEM3PSfBw3Sk9f+hxeOaSwu8csUOxpveAP8/i8oeo+kd68eGCjwtla
	 M+eUvMYPFRxoHRUJfkVeAaW2jd5p3QHsC+dFj87xHWLLzEiuvY04Nu9PLV5yAa5yuksar
	 Pqvi1O0cSxPihRFoCdYPSfUL87mRIOj4pJm+fF0CagqIh9hWBSDErgl+WxnEtdy90avs9
	 14hpB3PPeukFsi6B6kDgNA2BK+PhVHXu3hDbHZULWXBbpTiOiiC+X3nMCiibvxc4zyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878070;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1PSWLnrlODBcIUuy+o4iDuUbA3x5EaV0n7/q768U0ug=;
	b=pfHy7gs+WV69+79JXIN4TFQRtn01BnQXkNwUKbe0Pfps1FfDLVtJZEFR5jyEiBXC3idt
	 kd24/C8S+yZPPwDsrY7Z7xkaHVHcom3A3tN9w4qYeM1q9x9EpdWullir85X9eL54EpEei
	 7MKUYOI9wZ5NbzT7ImrBAkpYo3Y/NpRTzKhigUcYCJV8Uw9w8pfZylf6sxWWJ0g1L82LZ
	 YSCTU5Uoqj3oNRRZiyaeQsXhDcbVNQ5RKGRKiiU1kXMD4Jxd7k6NJrPG/M1yzqpihNRG+
	 z2klpeNtTVGT5DrE9gqtCJOY5b0GiUlS6iJFy9h4DhkBF5T5bhIftH3zFKLoKwDMMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zUePNzRi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036C606A32D;
	Thu,  5 Nov 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zUePNzRi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9DA1F00919;
	Thu,  5 Nov 2026 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793878069;
	bh=1PSWLnrlODBcIUuy+o4iDuUbA3x5EaV0n7/q768U0ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zUePNzRih/ByPAQaBlvqqMHHDBx8v/1NjVVgqBreCnVcQBvYLgKVXSbBkMqgPn87Z
	 gkc7jgtHQTE+4cEO8AzeN6NA0Sa1IN6PFNNFbQ/pOu44E8V9I80gZ55Vl9BnnDgDUM
	 YWB5Jn51/VZjwP1jRGmhiFsB5zzF9t2Wy617USdA=
Date: Thu, 5 Nov 2026 06:27:48 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	prashantrahul23@gmail.com
Subject: Re: [PATCH] staging: octeon: unwind receive initialization on IRQ
 failure
Message-ID: <2026110532-succulent-chug-b9d5@gregkh>
References: <20261105083628.4043124-1-202300460064@mail.sdu.edu.cn>
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
In-Reply-To: <20261105083628.4043124-1-202300460064@mail.sdu.edu.cn>

On Thu, Nov 05, 2026 at 04:36:28PM +0800, Tian Xuechen wrote:
> cvm_oct_rx_initialize() returns immediately when request_irq() fails.
> The failing receive group has already had its NAPI instance added and
> enabled, and earlier selected groups can still have registered IRQ
> handlers and active NAPI instances.
> 
> When RX initialization fails, cvm_oct_probe() unwinds and returns an
> error. The driver core then releases the managed platform data, even
> though earlier RX IRQ actions still reference NAPI instances embedded
> in that data.
> 
> Disable and delete NAPI for the failing group, then unwind the previously
> initialized groups in reverse order. Mask their POW interrupts, disable
> and delete their NAPI instances, and free their IRQs before returning the
> original error.
> 
> Fixes: ae4350364008 ("staging: octeon: Propagate rx initialization failures")
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> An AI coding assistant helped analyze the RX error path, draft the
> unwind, and edit the changelog.

Please read: https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112133;
	b=bTaEOw6NRpUZa3ob7YXpK86O3LtwNeAu63DESwQ1cRmITIdQFD07GoSnwDKbSRrowhH+
	 aZkqww+8xl75lW7FPkgtKtwLYsutFt+udhLQyvA3T2u32dmQDOFeeSmKa/Z0sFjWb33+Z
	 CDstYh8OXmUG5rmD0gc1DfCeH8iQ6dPmdXy6AlFJCQOSlix67nvzgfl0XmdVOsoD5xUs5
	 9/YFWLbZmg8EFdf9BfPzwf8fF3l3Ebo1hn9vxfDw6TVDPyDLIHPNXGOcMTQoFCnPdFrLO
	 K9lMqE2ibgobP1O8CO5NjAb+iC4BwrrA79n6hN82xUilc/JR7hCcHa7j2Tfv9Ym8kNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112133;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NFouP8hPUT8POi6fStUsnMh2AznhRZgbLqZ70w2y0D4=;
	b=NrxIP3H9z+NIQjYKsMdRF+E8rSj3zMUAvufxpgGlaO1dPq74J9H+qNY7vDbImclrJwdw
	 PfszEZSr+HVm03rshda84cVFvTbwgKaaCiJHO1EwmW0QttvAiiqDjK97depWLN8vwmPaO
	 ixU99U+6EsDG5dV0qBr8AH5Qfrkn98gOmv7THebXNvR2Cs+Yn4jSwnHf97Tl7s5d864DX
	 76v7w3c/bS6QjMXPRcEmy/MQ3Q+Ix2pS1v5lc4s/eQUaYErGiX7hqHXvzrE618i36YpcL
	 X28H5kKAx+eP8MwCDsQU110FAOLgrfz/hYS3w1KiwtMeJqyu0Vz1AIYOlIImbgVFCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qXWwhii3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4B606A338;
	Tue, 27 Oct 2026 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qXWwhii3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39221F031E4;
	Tue, 27 Oct 2026 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112132;
	bh=NFouP8hPUT8POi6fStUsnMh2AznhRZgbLqZ70w2y0D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qXWwhii3/nXzdmldkpbq076PF7Q4ctfx4+zODROoE0h6INMiaYC+ZAbNhT9VZjsbG
	 OOQqE4Mfu1QrI7EFdpxWfAZniuEeLtCE98NG9MjXm1A86N7ccbeIKpfosmXPI1b/WL
	 Pkh4jmkkYJrxiJL6h2uOl9glu1GgLvFU09PaapE4=
Date: Tue, 27 Oct 2026 15:42:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: stream: Undo more if the start fails
Message-ID: <2026102704-cramp-chip-259e@gregkh>
References: <2026102751-nibble-synapse-d406@gregkh>
 <20261027143325.GJ158991@black.igk.intel.com>
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
In-Reply-To: <20261027143325.GJ158991@black.igk.intel.com>

On Tue, Oct 27, 2026 at 03:33:25PM +0100, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Oct 27, 2026 at 03:24:52PM +0100, Greg Kroah-Hartman wrote:
> > From: Josef Bacik <josef@toxicpanda.com>
> > 
> > If the receive buffers cannot be allocated or mapped,
> > tbstream_dev_start() stops and frees the rings, but
> > 
> >  - leaves the DMA paths through the XDomain connection enabled, with the
> >    hop IDs of rings which no longer exist;
> >  - does not release the frame array and the pages which
> >    tbstream_dev_alloc_rx_buffers() had allocated and mapped before it
> >    failed.
> > 
> > Fixes: 6db21d817b43 ("thunderbolt: Add support for USB4STREAM")
> > Cc: stable <stable@kernel.org>
> > Cc: Andreas Noever <andreas.noever@gmail.com>
> > Cc: Mika Westerberg <westeri@kernel.org>
> 
> Do you want to take this directly via USB tree? Then,
> 
> Acked-by: Mika Westerberg (Intel) <westeri@kernel.org>

I can, thanks!

greg k-h

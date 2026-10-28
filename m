Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174676;
	b=y5QurF6KBJJZBZDl+mE0fPlTMsSkk+tsuR2v3z0Jx0etK2BMHOAxODPFNXICQ5y9UXPS
	 CSHbvSy1M7Sj2qKCTg0WPT7Abv3WyJvt1NjW9eKR5Xb5W8eXpjQMYP1EhCYEbc5FFyNpF
	 K1PncJBnmm3G2akgG72yRjfQ9ldX05FSTT/vbhoT4j4IpKATalKuh5y8+8zKyCgnDUVHf
	 1hy4sgUIkvU2X1wna6mdm/VBfRkthVfjaBRAjj4jOSsD+0OwxMeA/ev3V8Si4F9+ziRVu
	 seQdkNsIxywOsDHH1WOwkifoRIA03UxnJawBmDwROyoggq0Oc1jsWa7epxUT7z+luQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174676;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dMVQm1q9hj5px7kva5n+Re31faL4ivcfdXRilvKCNy0=;
	b=fQhu2U3xz24CgGGY71729zR3SR+QTIjsBO1K4OYlsVa7qA15MOSA7U1ths+4nDE5MGbS
	 BlGWJaumvGz3GkzBwPjw0EpkmQcp2I9fbOpD7uZE8nwfK3xYgCz+IaIPVWuNqXar+flFH
	 BnjG7Z8HJuuX1ZRKr6Jxktvba3nCVUAJ0d5nV8p7Ei97B7iAeCeZjqc3UwG/ffF3ETFjl
	 4m+BXEU2hKfHJ/lQqWi3LKTH1qmKqwH39FPPQZ+/GKoH4fr3kEa+2UWpphVa0BS6WIto+
	 G0JwDD3YvBdWtYgztxBoexrFU/kIF8SP1/RFT/DQtps4nwEFZh2r1kPsQxgA8muTVYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lSaftPGg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E45606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lSaftPGg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF291F01825;
	Wed, 28 Oct 2026 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793174675;
	bh=dMVQm1q9hj5px7kva5n+Re31faL4ivcfdXRilvKCNy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lSaftPGg9mCVlEp1rZx1cE0wm91xV4FYGjWuTotVlo2FRnQcWd4kXkBbWPS+DihbS
	 UNX4QYI7AY1j9P6FzC2pjiE6+yMfZr/fiZYxLw27KfN6K+X1kffTpR3aswSCKB+4WQ
	 Sz+wElTmH3iwjzEDGYNe4B8KEhVYqUpp8J+FD5eU=
Date: Wed, 28 Oct 2026 09:04:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Yaxing Guo <guoyaxing@bosc.ac.cn>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uio: uio_pci_generic_sva: reject multiple opens
Message-ID: <2026102846-zoom-upwind-cce7@gregkh>
References: <20261028072725.623111-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261028072725.623111-2-thnkslprpt@gmail.com>

On Wed, Oct 28, 2026 at 09:27:26AM +0200, Avi Weiss wrote:
> uio_pci_sva_open() stores an SVA binding handle in device-wide state.
> A second open from another address space overwrites that handle. Closing
> the two descriptors then unbinds the second handle twice and leaves the
> first binding active.
> 
> Reject another open while a binding is active and clear the handle on
> release. UIO core already serializes the callbacks under info_lock.

That's up to userspace to protect, as it can pass around file
descriptors to other processes just fine, and the kernel can't do
anything about that, so this type of change doesn't make much sense.

In other words, if you open the device multiple times, that's your
problem, you get to keep both pieces :)

thanks,

greg k-h

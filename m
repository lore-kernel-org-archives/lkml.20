Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626424;
	b=Zmdx0Siihw6MEMZLRLO+ikj1XWN6CYKlq6L02KUna2hDvskEchVrNNB3TgUPiHSVF46w
	 5WTiU4xnW1l99P4mN4vHvM0jtLoKKJsPwHW/s2do395wTRlAEeNrFUJuNTCXwJkcPqcdf
	 DNKgPIq7kYnwULn3wFCjsfDKPNh/BvFT0j3sMZyWvfa1Y6u8nnqCZ3qV2xicH3xWgNr1E
	 0YlehspiqTSWmB+ulmEUzN2wce+1vR/tmB8dHud3Rmfhf+RGAeg6gTPagC1j9X8uUcsbA
	 zMpTy6UU20palxM+3IHdIUGQ62A13nmMMnN5KZa2zIuuXnsLDwJG7x+2KV0/mNYanDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626424;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=DB+JdwCkQJDdbmqEBm13F/PLEFpOBew80JeNxQJjjmk=;
	b=g1oe8ULb3zhZBiQhMosgCjohfmAU0uIG6SGtFMmNgerJczVezEEcEinXozU/mEeqZDEX
	 MvztwLp7trx/esflqrjzgckHXHOW1JFDQDU9XKaucim+ij5Rjeijf7QfnEj6/b1/uDS7Z
	 531qTtsBwYmwrjRmlkXLz6wEbo4BVPBf68gcTRcm0EvqAPOibvWkceyezLAp8BD2J6pMU
	 WchJiLLa6JfNn2rL6/iGQvoRaCKHJizkALigK9XUeC7uabQJkhbOYtz5HgpAH+gYyksfy
	 8WkUH7aTDqrVJXjAUZMvY+aSpVpj4XDHBSH6VtnhqGvvWIIxtq2BWcNksb4zKyi/vJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=T9NFJfTi;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0C606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E0C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=T9NFJfTi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DB+JdwCkQJDdbmqEBm13F/PLEFpOBew80JeNxQJjjmk=; b=T9NFJfTin38mo/MebrQC42vNWc
	w+qQ/FAqMgJRcU8t4dt7LDx5xu8nrW0yeFyJnb7Q9CqHwJFsqDmlrOKkkJbf21hR6GukDWwSPEOPl
	EDMpJVpQrRP0V7vepkmrdFlmX+/yRBzXJVugi4GNuCcFNJUqp+GN7eYPEt1/J2rDjd1yNr1o0qHC6
	LBcJa8nEAktcHQrr3x7YdjETVLck/e1tTcGSBxy8VX3Zjsvxqc5foQ2/8hvGU7kkMAjGRhMgwvG/E
	Kz1iuPt4uB+YzkKmVNzazjXa0f5lzTRGY12c5Uc36b2VA5L8/8zcoZz9GP8yDfI9lGeq0Usr2d6Ka
	m+Uu7TJA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNsA4-006BsB-0y;
	Mon, 02 Nov 2026 13:33:20 +0000
Date: Mon, 2 Nov 2026 05:33:15 -0800
From: Breno Leitao <leitao@debian.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, steve.wahl@hpe.com, justin.ernst@hpe.com, 
	kyle.meyer@hpe.com, dimitri.sivanich@hpe.com, russ.anderson@hpe.com, 
	linux-kernel@vger.kernel.org, mhiramat@kernel.org
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <auiQKR6IhdyOCiex@gmail.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
X-Debian-User: leitao

On Wed, Oct 28, 2026 at 01:21:24PM +0100, Peter Zijlstra wrote:
> 
> KGDB does some horrible things, and with everybody having access to
> virtualization these days, there is really no reason to use it over
> Qemu's gdb-server.

kgdb_panic() also adds a different code flow on the crash/kexec path,
which makes things more complex. See a recent discussion about this:

https://lore.kernel.org/all/auiO_x_Am8ZmZcmw@gmail.com/

> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Breno Leitao <leitao@debian.org>

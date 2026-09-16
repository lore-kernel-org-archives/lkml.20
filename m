Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8994BD7B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552330; cv=none; b=d3qJkalnsoIgwgD7uwirY4wW6U2vWsMNA3eRfG+Mofp4uSR8qMMA44JRNPkes7pLbHse6BMLvN1fyfyGiX7YTMJKCGJ2ASHrGmntN4BUNFxby2BpA0sognzZDcDXv9qjo3I/HAZd4GpUF3X+2gpkzYildgeZyfQH3IbgCnoTbtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552330; c=relaxed/simple;
	bh=5N29l2OUuwfT0iURnbyVDL9u1oxxFmDwwTkKzbQA2yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2MWE84m9A2RE7EqFiUshcP8v4KOM6S2y8qz/207yCQ6IzzpZROdEdZOpdEk1tMm+KpmtCYfHATswmwAzhYfm0dtEoPUHZAAkhkmnnQFhg4/cbYUnqnKs2d1FxH7SqoWTeNC9Dh2D2pfLPSIF2kZCUGaV2pp7JCBOlQkDVQPwuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=OKppmqIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OKppmqIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BB31F000FF;
	Wed, 16 Sep 2026 09:52:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=OKppmqIC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789552323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zC/1CFdkrTMQQKEzcImWMaqbtqSZRSTRHyHMpOinqjw=;
	b=OKppmqICf3NNVb6y8mkJDSTb5a4f34YC7umv6AzXGSKxecLMClO0IP8z81InY9cUBUKTvu
	FVAWBJVb4Tncyr4qoUlPmNHHT/MbYpyks5GMzHJiZouoeT6vD/lpfD9Cpsi6dy5nwh6CyI
	9VmNtoQr/hLYx0dy8BvuidoM13A7VWA=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 1f1c0a2e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 16 Sep 2026 09:52:03 +0000 (UTC)
Date: Wed, 16 Sep 2026 11:52:01 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/14] vdso: fix repeated word 'to' in comment
Message-ID: <aqpmwSS8pqMprKY1@zx2c4.com>
References: <20260907065751.22783-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907065751.22783-1-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 12:27:51PM +0530, Hemanth Selam wrote:
> Drop the second 'to', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied. Thank you.

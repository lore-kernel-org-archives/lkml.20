Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D2357A25
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158213; cv=none; b=f7HTd2V1Jy4fOuX/+gADF4e3IZ6svJwoPOhTGGlLD1VsTxeo4/JLTIGx7aWjThBXJ6UgiaCf4G6onaNaqf6gFgB0vDhMEhbVFOjjnTFekiPQKGzooiNMhLJsJPC0DhC7xZ70R7i4C3L5Bg4lXs0mV3u5UiuQ3dBGaYZSou+lRnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158213; c=relaxed/simple;
	bh=LVQ3EkndZMl3oLt477WzSNiQwZwaVatshfPt82Fi5oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVf5S7XJQ8WvLxSqI2wXIuj1nV73x1Dc0wwDoLwA/ibveN6WQYB9qZSMl5Z+gukQUMblCRhWWTEa3BxX19PeRZigB+MFDXTytXzsY3uqRQE/mRvBxu42HH+Ax4ftFarznWg2z8irb1fmfRNlgZIyf3YgFyjAy7nZ/Lo89PbA4RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tyiRUmqm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wX4KwtIr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tyiRUmqm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wX4KwtIr"
Date: Mon, 31 Aug 2026 08:36:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788158210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LVQ3EkndZMl3oLt477WzSNiQwZwaVatshfPt82Fi5oY=;
	b=tyiRUmqmeAtWD1HAuMFX1PcbGrwOSPsaB16yYeHzG5cI3wfUKlwo5DQFpXT0Ej+pgh3oSy
	zDEQwwvY7Q+i/WFvQF1M3kB7dpiprWpAD+LhoKQkNDt6S0Tn3xNnWjPXDRuWtVgnKtyf7T
	Y82du14gAouu1iFBihGi4vGTbJLsJ88mF9mmeF2GWt/IVUsqhqyFbazrnVYMXQyCA1f1tD
	ykFx3nYy8pVi7inVXSZLLBk9+b8Sh/pWijWVDaYwL47d0IJhg+nb4BphbYzVaM6hMJh8xD
	ZgydjzpfoypI07mN8eyXKEi4Oug01Y1N/7BVR7lAWfdx6aMHH0epCpnhHImynQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788158210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LVQ3EkndZMl3oLt477WzSNiQwZwaVatshfPt82Fi5oY=;
	b=wX4KwtIrEu/oUjeduU7je5QjdFTORiRVTaaLd1qRyToB02Zz8qYj50RYsJ8dWLYTgUmPLu
	4GKbDAWJ5dEoANDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Bradley Morgan <brads@mainlining.org>
Cc: john.ogness@linutronix.de, gregkh@linuxfoundation.org,
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
	pmladek@suse.com, rostedt@goodmis.org, senozhatsky@chromium.org,
	tglx@kernel.org, thierry.reding@kernel.org
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
Message-ID: <20260831063648.7j2bEr1S@linutronix.de>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
 <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org>

On 2026-08-29 00:39:15 [+0100], Bradley Morgan wrote:
> Tested-by: Bradley Morgan <brads@mainlining.org> # PKVM, based on Pixel 7 (ARM64)

Does this PKVM even use a nbcon and if so which one?

Sebastian

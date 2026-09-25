Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB43FFAD0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338103; cv=none; b=Y2m7JImixYMsRSFj3jHgplaN7RnoOXpXwaxTaNYi1t/0Oo3CqIHEGbvl1aixdwM45Qac+L1FHy2wuokVohf6Z3yzWEKzDa3XSXWSX9qlRwtQIy8QM+4C3zRBLj9xsLzGYAIZ9PfVTxHopX8U7ZiN+Y358ScVd5zx2hHDAN+JIHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338103; c=relaxed/simple;
	bh=3xiGYcGCpLekFy4MnM5aKwu2XPbPz2F0XU5z6IGqgbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhTIQClmFFEnejksGjr06fekiq9U/D836m0BvtgnpQ/7EEXegiJJMIvlHLvW0R1tt7CfnM6x+LgP2/ZQmVxuRT0uG5rM3akVfWHNoueE5GeWrBh4LDZKzm3b91e4z8o36CKh+LOYLJtM2MuSV3LcPxyioy2ME+Kpu5wj9fVhOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4Z0oQm15; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RGPLXGZY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4Z0oQm15";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RGPLXGZY"
Date: Fri, 25 Sep 2026 14:08:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790338099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xiGYcGCpLekFy4MnM5aKwu2XPbPz2F0XU5z6IGqgbs=;
	b=4Z0oQm15hWy1J2FfLHkTo0OeLoU9nVeSfApdspOyDy2nTFvaWCosLSLAdOnXFVNOU3IJ1p
	k+1IWqXBRK4Fz5aNspLwu4wC6Ie1KVvMuf45FbTSm32DDezbjx6Nooi04zFhvyjSmrEOrR
	NPPy7N0iKdjxOCXdQR4jkJwXFe9QPhYQxM+8WjgOCGIoWwi91RANlEJjePfappG81NZ+0f
	cUj7W0/H/rA15hz3uGcCPBstytLQr/0N+Q22ZHVmE2W3LrtqvUN5XuJ2UVZy35qgo4eaMe
	MEXmHISEZSF0QZe3MBUTDDk9Eypu0G1+ACBwWsUCUkAihZQxMO4ow5lTbajVKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790338099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xiGYcGCpLekFy4MnM5aKwu2XPbPz2F0XU5z6IGqgbs=;
	b=RGPLXGZY9cXjYVGEIfrblGLawfjPD2+j04aGhPQEhJaNH4SqHnEAtFcgGblzJdQHx5doYj
	5xBef0peNppLkgCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Carlos Llamas <cmllamas@google.com>
Cc: linux-kernel@vger.kernel.org,
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Todd Kjos <tkjos@android.com>,
	"Tiffany Y. Yang" <ynaffit@google.com>
Subject: Re: [PATCH] binder: Use %p for pointer formatting
Message-ID: <20260925120818.Fn99twz9@linutronix.de>
References: <20260918103008.IkhCxRgs@linutronix.de>
 <arWhYvDBYgLwaY9w@google.com>
 <20260925075901.OqQNDQhN@linutronix.de>
 <arZihAm72SO3V7ig@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arZihAm72SO3V7ig@google.com>

On 2026-09-25 12:01:08 [+0000], Carlos Llamas wrote:
> Yeah, it's all gone now:
> https://git.kernel.org/gregkh/char-misc/c/fd2bc059ed46

fabulous.

Sebastian

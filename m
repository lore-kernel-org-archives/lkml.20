Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798911;
	b=xpya5gz0pHfb7Tb9Y68pXJvkqniAR46P5FSCqPXif/vdky7SUdViFQ6PpPn1fbqX735M
	 COJ2OH/9CGf8WEi6YQZmcHXjBP5rpQgNwRvCfn7T7TEK3S/WONpdkjjHbS7cOeZnguUyM
	 7xRoqJVi883axy+13RJ159yKFc/X5vOtEaxt1GWg0PwwCXARGLEI32pek+/2ppFV3Rw4R
	 S+WF19C2KoMiJNkQA9JAC74L5QHyh20BOpQdpbxUSk7o76bGv4bq3AAAinHX5yG1HlTSP
	 HmMTHlWB3jpCJjoU+1vueeAl+r3ZxSmJXu4sIKrfZs9B97YBVEEmgj3OufJ387ZPn6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798911;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Y3rkyt2aHJ5U2KpsZtka/5Sy8FBuH+ogmFdf7aweNr4=;
	b=ukves163CUm4YDaxrSF1Mz7IN9ZKska0nuJ54yec2BWA1B0oeLO6nmi3Ki2jicJenYmN
	 ZefDOQu60qbbc1TD3jYM4WJS86bnVFAzOVGn6EI5R3cAbwAkfNAKV/F19u8p78NvTgLDL
	 u4CfR4fYSKfxVgwerDVexqudg4pJ7XxjngveXXxVWcvfT9IEoWoxFYBvqqsYO2QnOYbLS
	 fBD/CP+UJecrnQidcWKDmgCcIPx1I9xF1aJZUnNZ+auO8v4Rk+i8aPMn6Nw2NwrDy4G79
	 U/9fksi+TgfDPEtvAaF/lPeGwYG4K8VM8cImDMu8Owbl6YdLjNSAQd6vkPKNx7nXHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MISJ8PaL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF51606A328;
	Wed,  4 Nov 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MISJ8PaL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B481F0093A;
	Wed,  4 Nov 2026 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793798911;
	bh=Y3rkyt2aHJ5U2KpsZtka/5Sy8FBuH+ogmFdf7aweNr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MISJ8PaLjbOJS4y+aR7Exs5MjVy469zou+oj/f+HMAVtt8n2FPM7YWYqBmunhYoFK
	 HqlERJjo4IWzVQ3RuYpixcoVqJCAs60WAEO97yWJYfe9l+6CQgW2YcPrIpe57j0fnU
	 mD0TTwJ7lf/26hJXkdTpdaDixBQxoxiu0Go/Tm0o=
Date: Wed, 4 Nov 2026 14:28:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: usb: typec: anx7411: unregister partner/altmodes before stopping
 the IRQ work -- use-after-free, double unregister, orphan partner on remove
Message-ID: <2026110404-unflawed-uneaten-2320@gregkh>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <5047c569.1e589.1a1a6a2779a.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5047c569.1e589.1a1a6a2779a.Coremail.xuhx@hust.edu.cn>

On Wed, Nov 04, 2026 at 08:57:07PM +0800, 徐晗翔 wrote:

<snip>

Sorry, but none of this is helpful at all.  Please send patches, not
walls of LLM-generated text that no one is going to read.

greg k-h

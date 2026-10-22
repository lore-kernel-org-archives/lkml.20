Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659928;
	b=lTHlenCtbQt2bUZxT+IOxZTR6/Fb47/fnyUhwvvsm4q4LkEM83/HS9rrp/7d7s5U59MA
	 zmnFCqf24SktwQyCWoDd3aiCITz0gGzJCDCVy+U4XPuaYbzngTCnA/VuD3q9juDyjMSVK
	 ZHNrKDZJdsFj4Cn7hgpn9h/EyeVUTfEBq/HVLh1Bi5r4hOpBiXM4smoo2K5wQhPXfbdIq
	 H6C87xsbZrt0cZ8u7g+W6T9NLbF6/7U2Q/lNYE5WBqYEJjHt87GbjiQNSjk0qRAG+LAQ+
	 lDsZi7UAIqdqH9Tk6vnIWqadKGe24lrVlA2iOjdqlAx+KIJB8PUrHBfQZNNhWIW1tfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659928;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=7tieIQqbNvuegu0wZZNb3p//8hlX+TAHrvUDE9i9+LI=;
	b=EU/GlkypjpuQRXjeH4YXJvjMzFSznuzFbUHvwc0MsKmgIdbaEMOjp0nusyjmb/q+ktLs
	 4IKO/APLpShR0rO2v+Xip2J7fwXxY3YY9yiyh2zIxQ0vNMYZ5yCrcIt6PBSIamAymX5AA
	 LOrdCqoxgkqSzp6QKXbljhyJ0ma2+ZVxC5Rlv4GsOXnBy/s3Oa7F+6uYlbuZKBQOP7f4b
	 khewEnczw7noXRNdaolnPyljjvbeuDRSF7cb7q1aOQ115CAfEyp1vu7e7wtxwO7FjFsOg
	 Y87F8azCsoN+W+u1s6s1NYLlCdwk0P4bBwXn2hpDZl2tLJj7a/i3WyAr8hojScP0RHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=WgBkk+3S;
	arc=none smtp.remote-ip=62.149.156.162
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF99606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=WgBkk+3S
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id JojexKdjaTDqGJojexLVRq; Thu, 22 Oct 2026 11:05:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1792659918; bh=ITyLJiFmqGLT76s2Bk613cz6PO/veHMrX2lD64779I8=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=WgBkk+3S35h8s6kX6gY4hiWk68JSSvUZRHAp3fawbQ2IjSFZ8tgHH+i2V9qohw06U
	 iBByiaBAbgBnHxziPpVewJw0JsJzm6svhn2ozUYagxY6xJrkHmYMH3r7ZjKlagtNSW
	 Jprg0cxpDVr70QcUiCWIeA9yuU7IHFekjzBEun2FweLoD57zSJ7vSX0szNnbj9QM1b
	 xOw0xLjtLY1RrqjjsR2ZRiiJtBoeR846RTN9BdnpqlVrkVY6p+keMqCeMV/aqXxW52
	 ORL7XxaRuSuAyCzbOoCr1mgUdIJKDsMcHR5vX8KeifDBZTbLpHhFMRCorNLjS8VldO
	 gbowirXsW0fqA==
Message-ID: <66dde3d2-edbc-45ef-b6c2-2c35a822733c@enneenne.com>
Date: Thu, 22 Oct 2026 11:05:18 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] timekeeping: Reduce magnitude of ntp_error
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org
References: <20261001202134.33929-1-dwmw2@infradead.org>
 <8431ae22ee7c7a786c93d8c0bbc85366f39291bd.camel@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <8431ae22ee7c7a786c93d8c0bbc85366f39291bd.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF8WuZv4j67Er7B0WJLsXgbN8hZ0vDVSytAAvqC1m6rOWKUM/aXH6F+IdtsHA5vz2gBByNWNIqHN5CbUFCjPNljPUxGmBvNBwvnGsQ1YK/zT46fEU35n
 yasrG1xtdb2DJs0LIRZiIWjjGJe78iaWV3YTqjpcOc37TsHgdkGGsE0s1bah7Tks9LDI8d0ydAgTZIcud283lMp4cfxgsKsUn4DrdUyE+kO/k9q4TfZOwWil
 ExUc61UCmIfrlLwbQqHTvrPywPxTa4eNvMPMGiEEjYgD75FfphITTgopbeWehFYSMPLPtZnMPxbZcuhPROkKWTXhg+JT+AgBVEmvnYYdHnTYSjDZ0pURtDuX
 0rHcGprfVvOGayrqrdBRR/k/pom9gkduTwDYx0qhV5bQSlzaJDM=

On 21/10/26 16:37, David Woodhouse wrote:
> Ping? Patches 1-4 of this should be ready to merge now.
>
> So is number 5 as far as I'm concerned, but I'm happy to entertain
> further discussion if anyone has an opinion they want to share.

Number 5 changes the timestamps PPS_FETCH returns to userspace, so I'd
still like an explicit OK from its users, such as chrony and others,
before it goes in.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

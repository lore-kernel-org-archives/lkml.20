Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025578;
	b=H2KX1ItI7ukzxdimduu2v00/8/wKAqJdmukRNsWrBCfaEmfV1LLgLGl49Y+38b79jhHN
	 nd1jBu9EeY35QGZlCv6K29phkGhUo4ld4IerL/yAqApwQuSlamHO+1dL6dWLFMXZgPNls
	 gETZtQv2ui65w9P0Bt4oGvv0E5pOuFgSEVfEKK3h49QuX0kapp7z7+s1p0Xe3IaWIdYbj
	 eYLpZJoFcHIat9RryLfOec3b0gk8fMNfJXEppT8skgSflqc1JaR+oUjz7skuqHcgNS/IN
	 iiwBH+Ol+/sfWUlJsLP1NkCPrrxL1oZEci1iHNsIOFUeB/FZvHb9yU0upIjWi38KcJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=JfZYuXK6UL6ZlLrytd1AoBuuVUDo0kktcpMINSiZtew=;
	b=4Ff0x8vOjgxLxed3mxr8jd5Kh6m8NjY/V4OWDIwPBCmZHZw7CB/fnWb/CQR09Uf9cukS
	 TWOTcBX12vTXVk9hmSPWQDGnpBonFS3SwoBtfKeO++Xg5ZibajzzMwnaU2Gld+k32HOs6
	 zSglF/O02n0LM8VEmmnQCOLMr0r0Cv+UThGHlS/vfBtSjSxAih2VNp0cV9rLP0FJDibrT
	 B2iHjc53ICrCHQRxbLp+XCy74IcMZrwLNEtTqWZOlA+QCrFtPy8xpKpqYvpB7YwgN20dQ
	 PqWN7CW/zHLo9SB5MfrX/eFuIhgefRJBE95IvT0WT0xJPWBG97nG93nDbnFK883WLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Fbf6RtRK;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCD6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Fbf6RtRK
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1974857a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793025577; x=1793630377; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JfZYuXK6UL6ZlLrytd1AoBuuVUDo0kktcpMINSiZtew=;
        b=Fbf6RtRK7yc7vHavSf8A1PNF12deV+0aD5GUCicKJJVtv1QMcv4Aurlhr3TFhJSKIa
         aMv+pF4ZTutVj0IbTozngeW7L7cmEhxR/1EAE+xWM5sR/E4hCBa81GLlr6iMsMLgw0e1
         vIEYLUciv6btYt5lrl4eDIRTq/TLF1YMiUNKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025577; x=1793630377;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfZYuXK6UL6ZlLrytd1AoBuuVUDo0kktcpMINSiZtew=;
        b=NCeZtaf+dlakkAUwf0JyrFfOkSGNzkn9UjjldVhfR4Lhj8VdG4Q9y5LkXfvayw1Fqz
         LeyCW7Bdcm30v5Q6bHSQgMuYB7QSNcP0tT5mOmZDy/y5z6r9eNl6ufcn1qZ1Hb47R04J
         XpUPV7vAFcBAkp1paD3vg+v6b/6qurl9PjSzhtEncoXLWkOamo9U3f2kyDHGhdGdVRjU
         XpVT4NXdoYQ4Mv8ENetDYDwI92L92q7vCIzma6MMGpmrpP4PKKTFMDVOLx1loqeLLP63
         vTd6ORLqcd1Kl5QRKMSgGmydr6RAIfzzjFnPGFuB5DZLqcCVD40EKYfXGBFc4Kxsgddf
         c62A==
X-Forwarded-Encrypted: i=1; AKwUvBym1F+J7/ScvUVU4gA/1JU2Ufpz+KSoc/H3YeGvZPHEs6PGu6RNnBSu292Ak1uJWMpJaWPiycCav/xBEnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuKJgHhHfikD2SQpRnRc814rR1U/koENrUq7nAuqliAM9ZV61N
	bJ/1q6REynYQoMy+z3xhnNdtGOVDhjbQZgpINJaVNAcH5HuQtChnMAaVWk0y/sOPVD0=
X-Gm-Gg: AYBFou2B+XSk0/teTcY/fWtqV4H2Y+Hx8IJXShh/lJ5JLvA03MkG+u9HW9wlAjOprwk
	7sB9w9LRxV2bCaysU3yCFjIq8yGb/GAf9SJ0S06VkgR95JdmU3Mo4EtiXutzbBGYU+VLW7sTWiQ
	i75IlGg7YUp3kCWJHdjjf4D8gFHFHnbB1x7g3lt2H45dQJKlzYmhMA/tseWiVTGHIkdSNYvrSHG
	2/gDIpDe8IwTnbplMG5CXmrveWGLmb8eZ5SmC37jGH0vwjnTNNky43rFau6X+1jqkyp7JKlyTzy
	PqtPyTqzE55wPd6JKNkK7g9skkp5R386siZOIHKwR1r9UYQZO6JfvXw27JVWNKHsCAMXhrhHqxQ
	ltYfv8SUE0kZocu6JoWQlHKdYN5gYtS2wvRjuFBm70y5Y8F30FJrg0gA6v85dqV9jjewoF2pEtq
	NnEixZGYgWQfWf+AABeuhu5+RC4IanZ0AzkfEv+RWBM1fPhQh93qidyUmjZ0GPkWoIdQ+s0uIPN
	GIaFEc0JnZofx0H8bKNJNWFkoU3VudVHAdKGmwBG2LjYuYroZ1EPT1EEIEZfK9DmjjTaHGfZ6Mu
	pZmjG0nJ/UEH8OzrRA3A4oGT2v93YKen0zK4PjGxIYGq9PXhJGdFUSmAjMYcgL2Q8z8uEcWjQ+T
	2PDsJamjNFAyFkl6hHqytQfY=
X-Received: by 2002:a17:90a:e18c:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3adeafea707mr5604183a91.63.1793025577285;
        Mon, 26 Oct 2026 07:39:37 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm8726950a91.0.2026.10.26.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:39:36 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:39:34 +0800
From: Chris Down <chris@chrisdown.name>
To: Breno Leitao <leitao@debian.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <at9mJoA8ZQfUCFGw@chrisdown.name>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <at84qygscue8crQi@gmail.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Breno,

Breno Leitao writes:
>So the next step would be to add a basic /sys/class/console/, similar to
>[2], and put a `replay` entry in it.

Feel free to incorporate an abridged version of my patch with my From: in your 
series if you like and we can take whichever one lands first.

(That also reminds me, Petr, let me know when it's a good time for a resend. 
I've been holding off since there's still quite a bit of activity on the other 
cleanup patchset)

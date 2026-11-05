Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911778;
	b=dhGTEQoHlK7AUCuHsQNcSDECv/HQePtHYl3AA+MlN8nN4BuMdOZ5J7My+RGsBtWrPSZO
	 jN7nFfdzn+Bs4EwFKCk+k0Jz8kXzYI8j3nXJ6z+5quXXBPDE0657saA7QAv0j7LONeKfi
	 1+zBS9ACDq2cCkhC4FaFdqTCbZqtDiNtmDX69BGKstv4TnfUSnrKED31q+BrsNeN3RW/3
	 cGBHSwJ2UXL8EmGNDL3445NN9Vg7RQC5pG7H40l6LqLD6oT2BpSK4lntwQ2D7lvQf95PT
	 5DHAB9bGv/En9yFeSAC53X0V3fIUVWLfKQSfHOmqTgWfl5Pihelc6cgra5QPMN3A/aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
	b=J/YaU3QhXL4TvsP5ZHN+lQfJvtW//NUaCxdMWspBdYI9WBPedWgcBFmAm84HVlPKIwyd
	 VTfYX4WreaaYGeH+k8+03pKhTNWVS/3qGp9RioxPs7L1DQhxkNzigae6Hjo1wq8j2nPib
	 pEvcmC2NA3lgXp7EYIuo8olhPvhZCwpWduUC3prKQ8fVx1AT7DZrBWJwdb+WUkAyd1aK3
	 kc4MZN9E9StLxzuM6QPgF1+x0/MpG5fcPEAB4SIs97plluAmiTj4gsikd/ndmL51Tir+M
	 X6LmEBgQHha5vgVOFwtVHIWNBAKpYzjjsIJ0NNCPaS2b02S53jacFNdp1nWnFi1ikFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD97D606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD97D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so1965882b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793911777; x=1794516577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=dxBFD7egkald1diEtbXOBXzH+9cQFK2KeCaFgwFJNeVqQ39GNskIoMvqgylgnntMH9
         o6cgkIhz7VeqRWc76fFeuaZBrUrsO0KbXGQDOo8UnmsNxd5DuGBZMTkVsx2LFZXyCFih
         xLmHM8Mx07KTStSbatLB7JBcE69i+TN4sfwyGum4R7QrkX6GMQsP7QDdZp7bkXe4WTSN
         kjH+OioEJh4aowCsawhV76CFmgsNb84NAEAQfXPTtwRjk+/N+4OfpAi+RPh6ypf7I9Ji
         LwRr227XUyaN5rK5df3trhjeaIYVx8XGIDVL5DDAgaeqxIBb9EXYuq3EuqROZW7d5HLq
         L0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911777; x=1794516577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=Jjh0frL4Dk0U4Y2jhIRb24iCfjWaI13smfXy3S2PRB9FbGGEU4s0L+IKSjhiCEiAI5
         7a3bK5Gh5HXcIqxQnDmQDme9dT3gJ0sCMnMSKa0eKx2zS2aQdtbvfRsuu38YscsftHxA
         mY6ozHWvfuyYy2aeVeVb0cSCbIHaJvSm/eGUufr43wyjOX15VGi+9ouPAcYqSiFlzIlL
         PrbjLbXtyMfv/bW9MPXvKV8nDOYd0EbzOY9sT9TJzwGUPw4iNHxxRNErYMufg6AxbaSO
         d9k5JXuaGpdP9Nlzwq6DgoqmTfoU9iX8XOYzva4YUK6SGp9v14yMTV5JeG/yOudIk4Du
         hW0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2jCdO9IIOFqCIkSVAXKIHzA9LRgfVtViF0O2OZKtGFYVLDrSUeX3EJWMB3zEEqX9eTA5s6Odo13se4h0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GuQ4WeI77yCmb6zQ80waRIpKu8l7vRgjUvIGu147KOgrUUY1N
	120YOLr0JTVEzU6d2GvOTU1ZoX8xMvJKWxfT1ZtPZPugUndgYn9wVm2nMOhu024kxWOh3GhaH5W
	MsvQSXQ==
X-Received: from pfbkr9.prod.google.com ([2002:a05:6a00:4b49:b0:8a0:70d8:a2ef])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f95:b0:89e:89f5:18eb
 with SMTP id d2e1a72fcca58-8b37aaa87f1mr220362b3a.15.1793911776710; Thu, 05
 Nov 2026 12:49:36 -0800 (PST)
Date: Thu, 5 Nov 2026 20:49:36 +0000
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com> <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
Message-ID: <auzr1F0HNh1mazaS@google.com>
Subject: Re: [PATCH net-next 1/3] selftests/net: pass socket options to the
 scm_pidfd test flows
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Andrew Halaney <andrew@amutable.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 02 Nov 2026 17:12:34 -0600, Andrew Halaney wrote:
> pidfd_flow() and leader_flow() take booleans that pick between
> SO_PASSPIDFD and SO_PASSPIDFD_THREAD. Make them take a zero-terminated
> list of socket options for the receiver to enable instead, so tests for
> further SO_PASS* options can reuse the same flows rather than copying
> them just to muck with options.
> 
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

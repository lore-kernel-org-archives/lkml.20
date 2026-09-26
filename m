Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B054706B;
	Sat, 26 Sep 2026 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437566; cv=none; b=O/KVct0M6SEz6JS4pITecrLxMFqb4pl29KNDbXkpukSoRwFD1wgY/ArlwWHZDCXnMnClFCr6n7QpIne9F+IS27QhxQMJxr0RnlwyPxvUTv3J2vXvhZ+25v/V7nlT1HbgilcVKWRWQFbmc8SEjGk18tAxKtrsLuWGZlh/OcmvqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437566; c=relaxed/simple;
	bh=VYZ8xq9/kODoUXegQUp31fbpVrxkzhITR0UdYiYdtuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eXmoVW7Wnqe3ZkHkLBq1zsEloWSoTykPyvtHlKHqipMJa2sZFNcRo3I2M0de1gOQRd/WmgckbP8P6+C5BKETtuGaqIdWbCQ83mdOQ8jDh6S1+CoXVg3dKAR7gcKOG9AAYyECWZkQt5PPojSsyVpxnqUkus0hxbhJ+BJTqTekpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bRLsAMM4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bRLsAMM4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 632E1419FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437564; bh=d0e/d+ZsVpIEKqzITxQ/alWcQJ8JNxkp46Yk9Fwuek4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bRLsAMM4KoeELTAFcDHduoNvwPLDHGpIntGJy6BZ/xS4Berr+OKKcxYz3HM6YBWq+
	 KWyLOpT1oLrsFAC7BeVO3JwpES4/VfBz+BRH1sm4MAV6ILKCbPcUby9gZgHcjWAfLC
	 m+qkEzP/vLJ3FGf5t1YwRTtvuPAja2ibYinZP7SVy5T86VAKIw4W/2/UCU22Wuzoov
	 fbY0yQz1hSAqoeXQoDBJMPDqwrn30g/ney5MzKRcI14A4esSYZpTQmsuMpcrhzOKxt
	 GU2ZqLh9NTbVD5SwSuw/mhUMbUPqbKbr/SF31Jq5o3nic7Z/I9NYLs6fle6eOu4QAi
	 jHVKjhhoxgbCQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 632E1419FF;
	Sat, 26 Sep 2026 15:46:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Shuah
 Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/ABI: testing: aspeed-uart-routing: use literal
 block for console commands
In-Reply-To: <20260923024918.840039-1-rdunlap@infradead.org>
References: <20260923024918.840039-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:46:03 -0600
Message-ID: <87se2w2eys.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Use a literal block for console I/O so that the lines aren't merged
> together in the produced output.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

jon

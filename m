Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793682396;
	b=QS0r+AB0QJ2r38nuOlFyMXosxTn4ixuWQGHNJtDLKLjHk7cSKG46lWBPrQ/cS2Varwg3
	 KUJZkArCmuhKZljdzQLCEO+1dkeKVxIG+T4QeYuBCcAwrFwGl5vYkRdATA/ZT19ScEJnQ
	 Ppw7XVky6Sys1n8cTJv2DOAC3S6XopGfefMCPVnyEIhz8vCTSGMDKW1Tz1Pff7jJwxXfg
	 3D0uK8havbHqNtYsRemcPhh2R5gABdK42Wnp1tcRBo8i0ITlu+cccbmYMF8vkS1KmE1v9
	 4jmJq0cCZlgz6Y2xpbD2i7NyVVosxH8l2K6Zvuu3fAgYyNxtHMnZr42mZRHg3QnIHDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793682396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GTsITmuHAIv/+kE0SNUbfba2LqBOd8VdgHoEhQmFbug=;
	b=BJPdr830c7mIYY/RqCrvSb/s0QGNVPSJdtDEvdHhpQDqKxIHFcLABQQuZbQc59KdJyKa
	 CG1Tt6eNkKEnXfLrOHMPajqKjcv/Dcx8h/Qus0GSUaFMptwibt23CAgS1vRM64X5wZyHE
	 I+PVDb9xI2xTEKpwH7IudZnT6qG7iWIQelUFjZlYl49SF6wSP38nxJPFNEhzFVOaGd23L
	 JaMIJwMoocz0upQFGZY+4wIN0ElzOA3GUNn+yiqYpNeLSUa+5LZEocoj+l0W0QGznL/+O
	 GtlzBHw4bfBNrwWG5V0Vvqu2IqDekiXQ8P9RwsyiBVllMCTYwoAd0QSYaaIT63MbByA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JevUa+0r;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787D606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6787D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JevUa+0r
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb155f3229so1183851a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793682396; x=1794287196; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTsITmuHAIv/+kE0SNUbfba2LqBOd8VdgHoEhQmFbug=;
        b=JevUa+0rLo0+2qi+ZpdzYN+Raq34ZNdypKmtdYwDLEuoGeQ/QiGik15xaPvHO3MmgM
         EY12ne4qJaY8Exy3MWxfX3WTHQJhO1W7jlOlluR4sPK2qBW3RZlvxjxN2JMw1GEZXYRi
         1PMrfu2G8L3UDoB54sPaf0cabbWyLMX8BBbMYzeVZr9ktwU2ixVHOS4ZPdaxShtWbzJS
         GqdCFWFAFAFvPmqawEwjQW8pnXwQSsz/fKJM/KTKoFcNukDZSYTk66joKdbKP3yy1lUR
         IfK4M6Pz5Scp6Kco6lfGNCOJ0hFf6TMh8DfyW76yoAqF5H2rmyG7PO2csMl5cBZ1E97f
         SkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793682396; x=1794287196;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTsITmuHAIv/+kE0SNUbfba2LqBOd8VdgHoEhQmFbug=;
        b=pFz/FyqGUCN8p3qSu2hcMBex7m6B4HTFxH9b68VmtxOXJ4gcmOx+CZac15//xWvOY2
         0CR0+0BrkwCM7zV6jnlINbpYGYkQ6mgjcLdbXeX/aKxwXU7EiAeO0XxVq1XIUvUtxEY+
         HRYzqZWSAaCa3Sqi6ScOF62odAOkSsrKuq9SZ+/VhKN6MTvoUd8OY91LbZUDqdjZ/xKE
         2SRnffXh1Numk1EKRKtEsQG4FmbKZ+uYzSs8OVOGyrSVqr25WDt2M1t3iRAhkYzfBQu8
         HZbnSkq0mMMoGoAx0Q/xiMjGn3+VpM1bOm97h2jqoWFI21+DXrO/1UkJAvOsIPdPMljs
         lu+w==
X-Forwarded-Encrypted: i=1; AKwUvBwgdZXq/17s7B3H4aJk88qJWtWNOv0EERSvETTt8e/rgoV6geI8Mozemer2U+Te0YF9TLhfQa/+IJ4RFhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8023JWo8XT6r1F/OAwPrT20OjRwPuUGU676doSRcSesaVi542Z
	ZCwklavEXqwiPaux7CovBGuAXLSHLhQOo+P52fXyeql/td5i+PNYwbjAKdDluMtLfOt/6zZVF/X
	HV9GSNQ==
X-Received: from pjbjo10.prod.google.com ([2002:a17:90b:140a:b0:3ad:647f:c1bc])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b8a:b0:3a7:8350:3f7e
 with SMTP id 98e67ed59e1d1-3ae89771679mr9375963a91.44.1793682395471; Mon, 02
 Nov 2026 21:06:35 -0800 (PST)
Date: Tue, 3 Nov 2026 05:06:34 +0000
In-Reply-To: <20261102035943.9700-1-qingfang.deng@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102035943.9700-1-qingfang.deng@linux.dev>
Message-ID: <aulr0Da_4s4WOp5k@google.com>
Subject: Re: [PATCH net] tcp: initialize send sequence numbers before
 deferring TFO
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Yuchung Cheng <ycheng@google.com>, Wei Wang <weiwan@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 02 Nov 2026 11:59:43 +0800, Qingfang Deng wrote:
> TCP_FASTOPEN_CONNECT can return from connect() before tcp_connect_init()
> when a cached cookie or cookieless Fast Open allows deferring the SYN.
> At this point write_seq contains the initial sequence number, while
> snd_una and snd_nxt have not been initialized to that sequence number.
> 
> Consequently, inet_diag and /proc/net/tcp{,6} report the initial
> sequence number as the send queue length despite no SYN or payload being
> queued.
> 
> Initialize snd_una and snd_nxt to write_seq before marking the
> connection as deferred. Both sequence-based queue lengths then remain
> zero until the first write starts the connection and runs
> tcp_connect_init().
> 
> Fixes: 19f6d3f3c842 ("net/tcp-fastopen: Add new API support")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

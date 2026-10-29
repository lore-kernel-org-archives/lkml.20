Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291033;
	b=OBCiTvL6achdagjH5wgX+1CONbwVONnb4sFLFt67yjJCXpqajDIWFxrbGVAfKU0DPH1b
	 FNJZ6v2OT7Vpl0RgZ7l9JMAKItV61QVqa1TozrzJ4Hm0eQqGy4xjmgTYT5AIR/5z86E7Y
	 EUcWfzlmUvCtkB21Imz1b+dEyrPdshG22GHtZc54lya4MeshuSd2hA/OLYQ0nN2Djf/xp
	 zqjxFO8SoM2sIolI/jke6ULXBFigWgNus9TxFnwYvZLmOswGbk4AQXHe7Y9ZngP8J/2ms
	 gxCGGo1q1+HgdGkrrAd4dHkCPXo0z+2s+UAzJiuwZE+ItPxq8MnA8wuShn94tp+uaww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291033;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=GrjYMuCu97pt9D7XBnSRs/Scq9x71JYjhZL+BdFU+Sk=;
	b=r1cLm4UK01QALj1A2diitb5ZtF/y1tePCNbUmM1ZOPfiG4IPmD+tcojygqq1OwIkc9yH
	 5eWT35VWLU++RsXvYcnvtAJ7H2VV2ORMnZNos+f1AmHLsFeYMHyJEAJmWht2BQ3u8YDGg
	 rnbrxWkG+ooRe05Q0XFpqn6DuFid6SJyh6VFPQvoD7IYa/ISacRx7Y5Bn2xkzUnJIZmTs
	 am0yc/qYeEXeKEm0OYcZ72/0+mxo5XWFMGVJ3Abezw4t0/zGOJWnLjoaIeBLsb+Q1tZR2
	 V8KaxuGW56LmwubbWJEHHXLjQZf0Ge6AZYcnBig1iOt34EelIGl1cTCdPJd0UVpfF8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oLFC1ae5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RV1j4Do2;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B39606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B39606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oLFC1ae5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RV1j4Do2
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793291031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GrjYMuCu97pt9D7XBnSRs/Scq9x71JYjhZL+BdFU+Sk=;
	b=oLFC1ae5NvTqqYiUKNFepYIVHKBzuw1r1bdB1dRmYFB4IXzEKCyDk/VTblfjejOU2t7l5E
	BCP6svGdqWHG0LHzp+PtCGs/3sSMWdf3TmddPJPZOgIzvyI4FdPAWN/IZqWBwcWrmAuaAy
	0XIkMmKKdD8yviTPFqvOr3yH7u20aWgpTC+NrqcU+aAeRW/V7TTkSytx3gB+l+pZVHrna7
	ljEc30r6e9IwOMLmhZ9vXvLE+sd7KiK411lw6VJ80XPGyM+KKBmINeVvdsHCDPlVap2a47
	Y1/g/+VeeT68/Af1MwYeWjFBTh/YdWv8c7/I/pHD/3Oqoa1RAnQuPHDgETrGlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793291031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GrjYMuCu97pt9D7XBnSRs/Scq9x71JYjhZL+BdFU+Sk=;
	b=RV1j4Do2BcJz4ZuYw9jjv+UP0Y98GG9WGbNmrQjhKPC6L6SGZHLp1G8eS+jg/g3QJ7SPqQ
	mMXh60QGfY+3IjAw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Chris
 Down <chris@chrisdown.name>, Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com>, linux-kernel@vger.kernel.org, Petr Mladek
 <pmladek@suse.com>
Subject: Re: [PATCH v5 08/16] printk: Do not quietly ignore adding entry for
 a preferred console when there is no space
In-Reply-To: <20260929120546.328616-9-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-9-pmladek@suse.com>
Date: Thu, 29 Oct 2026 17:29:51 +0106
Message-ID: <87v76kwk4o.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-29, Petr Mladek <pmladek@suse.com> wrote:
> It is hard to imagine that anyone would want to add more than 8 preferred
> consoles. But never say never. And do not ignore new entries quietly.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

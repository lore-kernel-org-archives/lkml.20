Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257597;
	b=a4spMqa2TwucgjXSTTNYSv/n7Fyqk649Ykvljb3w2AhapEnzKMeI2+TDbHxNHDsobf6N
	 UHAlKVupD5NAGWm70lChvFjYHWqpUTmJatQHydtkvlDIVBw9T+Win0VzOPfZxmOfU/hOv
	 PgqBKsLmsW5ELIlcCH3Ju14efBp6hyL+Snr4VthQfmpAPzUmKMY/1OayIdQzPkeq/SexM
	 Weju1jGC9zanrYBJbkqam7ZoLxkFSQ7/bHW5URpHHcA16GNH1dHubZT/H7Iag6nHwlxZY
	 PgHoh2wE7nYKFiHBFfu5teisjmkeSEltVM/bsguyi9ZjpoMLmANzm2IVjCA6LHHzVbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qw6YtKXqN/uxlBtI78vXXqhwkH6c6ngVlUQPVu/LqUE=;
	b=uO8uh4QJK2SY+erUmdkznhI5UNYOV8JnlH6TXcvj1B+vL9ZG5Spl2KfdQF+ty56rNBsL
	 KOMRUDgDSKTdxmc+KC65+WyA3tDsd0uiLdY+3+AZ1zhEqlsRk/RER3oW2oqH7dct1IvnQ
	 W4Xijp/FGcffIvmGZ2yNjuCnANck/7WXrsGfKwA6oxS8PTOT3XIfFuzJw1kd2jLCkxrW0
	 qfTLtPu9YpPW90xCY2JHWamzQAsu3Ua+xce8VgeTNdWbCQFGxnU09xliEidhAIPgtPGYM
	 F1L2OQVQ3wa7qDXDo6e4A2Ohx4pMe9xspKovJ9lPjM6n9tNjWuE61eBytgYy/42CBhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="lbGO/2tV";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA815606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA815606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lbGO/2tV
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1315219a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793257596; x=1793862396; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qw6YtKXqN/uxlBtI78vXXqhwkH6c6ngVlUQPVu/LqUE=;
        b=lbGO/2tVp+6zEq01DdrwbaYi6/VjxBdT9J8E1ER+7P/pgnwAwBFWro0oCvtTUbKA42
         Z1BJM72TbW3HL+KoQPRGmcl3g2H/mvXaLMofWem8WGRBNuoLZ0b/6dXX/Nr9RvOGEc/c
         BTGLUt5UB7DlMN1AK8SqlaDsPlkedLj/8MkIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257596; x=1793862396;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw6YtKXqN/uxlBtI78vXXqhwkH6c6ngVlUQPVu/LqUE=;
        b=KS8oT+IhU9VuLnQg+6vnXcPGoYjhmSHBCPpjhJTVNWVlaC51p7YvEKAvoUKGzB5Xf6
         crvaCDtfT3MbNK0jtoRv53KFzls7JoXcXisF9kQ/2K3ALkT3epLWyO/iIyg41syO/7fn
         Clj6jC+TskHiOaQKkSwXUfYkafd6KkgRe+d7dk6m8hOniimxzP2SROMJjUfmLIj9xvQW
         C/q8kPrQStGQbjFjE0XbR4DBZ/5kbHGXRiGPWhhZV36RLzeo6yJ8+V4I0U5xt6xpy2jr
         AqSiu6QdV+PaZrhuDFmUHyjJVnMcDnr1+YxsQA5aUO1KiQZj8sbimg29Hb2hHRmw/JCN
         OasA==
X-Forwarded-Encrypted: i=1; AKwUvBzgNGHZ8ywccXPFDqdKDjNDfXRul5KbaDRR7tMvHmKOikWhRBI65ygWMYmiaSWntUu5R+Z+VqmaVxAwEiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfziwA9v/6OgAPeatULfeNVUNFW1GERupI+3+lSZN35rzmiU3W
	xqyQS0tnW6Q+Xu7GK5u/6YeP6Yh3o7kW4pB5X2NKSoDSEA2rsBYZQgiIPEDxqSxuzYc=
X-Gm-Gg: AYBFou0SV30+vaoP7/QI+HDYqWSGoptyas0Zhou7dnyoiqRefiK2ozoCz9QV1eB8WoE
	s9+mODbTeimZFM7uPEHzyXyqugfCKMmji3NYZDEGCC1VL3fdVRIfGIgY9BQt0DBpHT8LASQ0JJB
	9rmcagtqdom9lF9j7Vb0JlhKCh8PuO6DgxprLYohzyPNLqX3kRJyJTjQMmf3KJweuX2Tf3aNc5A
	novlP8OWzMbxTWLJMpDE0RRkKeiR6L4aSBW066vO+NBhotu8bv5y1eaF88CWzzbEvJfsGIGokCw
	Qbgw6F1RxKYclpbi8AAabthShFFOY4bSS84Zl6qot/zQxANy63EJxpzMmEimu+5dL8BKBYWDxeV
	XDukFJY5MSrvSQO5/GyoEzMGjQv3kLNBHDpb2DOvCMKKWcGN6jYiUgKNkYr4Z20Iyk+2z292NMk
	JMKYpuW24emBzrW+AjH21m7RHaEmPZrT/sVj91GZt2rsv0aVIO/V4OF+TMtpA6IRhbLTYcMfLi7
	fImnxyxpzPc0iO3zZy2WprXtpxUBUU2vISBHLfCpQTKE0fhoxWjdZkyWwWrsP5eQ4/OnTEQiiJY
	Cd8NRlDKqKMxLnxY9RaviEcjh5kKQD6+b3PiWHsOjvA3S4/BTBmIhHetsj7ggprSq4Xn/MHpLf0
	XF5jlObyusLW/p/D/aEiFdbhQEUfdyKLVv/qav8CFcLAga8VuqhUumBjs1VTCS/zGTIf/mjxFnA
	==
X-Received: by 2002:a17:90b:264d:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr3671027a91.9.1793257596091;
        Thu, 29 Oct 2026 00:06:36 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm3543480a91.1.2026.10.29.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:06:35 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:06:30 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/16] printk: Prefer the console either via name or
 devname exclusively
Message-ID: <auLwdjSVSNe4N2iR@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-6-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120546.328616-6-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>The commit 7640f1a44eba0cc1a4 ("printk:
>Add match_devname_and_update_preferred_console()") added the possibility
>to prefer a console driver via device name. The name of the console driver
>gets assigned when the device gets initialized and it triers whether
>it is eligible for a console.

A few commit message nits: s/triers/tries/, s/a non-sense/nonsense/, and the 
usual form for the reference is:

    commit 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")

With that:

Acked-by: Chris Down <chris@chrisdown.name>

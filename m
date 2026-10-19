Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423117;
	b=cCnEztrsQgQLqMZwBOxq4TlOb0OP+iMfpkb5V2Ud7V3bAsACeLODfHeUCy0iRVIO4KAA
	 CwyzI2iJd++qPYfJBJ/wI/VUEbiKAHBJUEXOs9hJnSv80TNI3JSXAPVPEaFwbdkSLihPC
	 BIZ3J4T55AMkrhbiivLm1PMHi0z51kFtPPr38CDC2ohohOOfLfN5tlrHIZ6Hgrvm1uxoY
	 zmo81ZXytr9lpjQQzRFwC/h+gLw7odnvaSrQpLhwNUeT2DMyZrFWgn0BHqZzDdy58u7aX
	 44oIDQ9MtypEteJPyJQ4GXXy2gOvD8bFIa6z7tsoImXz4PBIsBjT2NYCk0Mu3OcwLoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+RNYQErT3OPaRAWod3tm3AGaFVXT247p5za9HBummeM=;
	b=2kfhSURRWDJ6Vo/V+aMBmVL3VXcZvW1jtQRbFGNbHRjQramv/fAyFWUyXsfATdfCOE9R
	 +fpBhh8Bl/9O194UctwfZe4rhOalzF1FxwSeqjkvoWPnZj8zxZuHBYVrHKsxckl/0Bn2c
	 z57tFBoeJixRY+9yl8HvGdTjSNt5iDNmIuEf2hN6Df5xjkPOBZohfDzoBJ87U9Lxk2+Rz
	 bcrfe+nWM/3mFW8Lb+y1XOHzaTltmcnjLe+HBWNv3sUTozrsRo11metYwk4HbvLUIu+GW
	 Q3BrZ8KrHGPREirD6ima+GcnGSpI80V84C+9D1YPBv0B7l7zfMUUGgf1+3/vSnWUsCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PDvGgCtr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2360A3822
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE2360A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PDvGgCtr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so8563245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792423115; x=1793027915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+RNYQErT3OPaRAWod3tm3AGaFVXT247p5za9HBummeM=;
        b=PDvGgCtrSaHDmscIMSUHcP16YB1+GHY0PxdtgnfPaDw2pknzYF+j4gZGOGPf0inZ17
         awdEOBJTXp8J++l9+ortAf7B0HuJqW/RiJlCNOZvziV658x4NZDGFbobUqsks6lsh6lm
         nL/5LglFlsNnce3lmYQzyK3aE8qJTIUb40bqGKLwJTLZ8DDW4Sh9/eAjPxZbIfT6ra5k
         UdY6buX6lOj/nBCsx8E25zaJI8L8ag2S8tsNdSS8WbOL9Zuza0o5JQd8MMGep4m3Bbmd
         bZzFdgeuXGqKttO49bHBmlUvPjzNdZd5bLErebX4ctbFGdR6ynHn02NQQj3WL3L1zcXb
         qBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423115; x=1793027915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RNYQErT3OPaRAWod3tm3AGaFVXT247p5za9HBummeM=;
        b=Urr8mJ4EkvGb038KGGnJH9+CFzlItNqvm6gumNWAPVNMrSAaOEgSPfWbpphbqRKLqW
         A7d1gN4032Jaua5SIYu26vLBIOQonCE4xzN5LieJskxX/04Az8x9ZesETVLQkQnNTb7M
         8VtXjkYdC8H2Ou1oaIskUZNX9Vs8EgtigA/unLDFdzAe1xQcxh+AwteLpfLvLBA22GT/
         Ga1pf0dEZsqWYz0ZJTpTsrvLwH5UInVH9l1Yt8f+2hwIAK6IeRwUkZVp6DWx8pnDAUfO
         eQQ7JqFE3oJ4/QGJbY89WSwW376gb8s9iE1/thvKeeXxaNcPnFwA1erwUCBL7d2g6Un5
         SwSQ==
X-Gm-Message-State: AFq9FYLI4nRRPew8etC9JTcHMl7WxvGsmYYBTUIf3Bykm18GJdQlqGrm
	c/6zAnqpdkvk1c7Cyc8q+XHHanxnNTrcoezKphs5Z/yIzt2y+HC92D4JXrvW8oLL/rg=
X-Gm-Gg: AYBFou0/Z67oJDi/gGdNOtEmtTefRCN46iYwlGBfDNbaLwrJJbJxuYwDHlCkqp+QMX8
	BBnBsGTZpu9QHlwpluNA1sg7QyAjXfPHWU6JUpH5lPd8x0p6gxzBHtk9odJZcFylszZega+BaFc
	ZcRP/iCS0ygoqLAo3WgGnnBuH8v3+0pFzNEG5NcSrLavZbXczbZ9asx2OFQrsUB5KtYoa5EudAh
	KZKgwESIgJVQu+VY+IDeBnepjUSnuZ2nj3UeTS3P94Jc5+/M/4B3PryrIgwK5oQNU7iNWVRqtsG
	xsgdGDMM5F8/X5ykGA22HHYNUPnl0SUYTd7ckLpNzjTYowQ/KzgGaryDNYkbkWijGa+04jnbVJT
	HJWXf24DseZFmfmvq/XOd2C8CfUYwGTwDRGua4wOYjsXAygBqcS6wG7tPye6t55qc147+5IorEX
	IKJFGzb4gnjmDl9UYsuWD6SIxCZM4yszB6I2ZDrzWK4Pe2U6RZTiwkFmt3WT45vCelylef3rM/
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr172545705e9.14.1792423115112;
        Mon, 19 Oct 2026 08:18:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm237858875e9.5.2026.10.19.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:18:34 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:18:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH v4 1/2] vsprintf: Don't leak pointers for %ps without
 KALLSYMS enabled
Message-ID: <atY0yIjwX1zogzsP@pathway.suse.cz>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-1-ffd3c012d00c@linutronix.de>
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
In-Reply-To: <20261019-vsprintf_kallsym-v4-1-ffd3c012d00c@linutronix.de>

On Mon 2026-10-19 12:21:50, Sebastian Andrzej Siewior wrote:
> The "%ps" format modifier prints the name of the symbol which is more
> valuable in terms of debugging and does not leak the actual pointer.
> 
> Without KALLSYMS it will leak the pointer which is not intended. The
> default policy for pointers is to print a hashed value and not to leak
> the actual pointer.
> 
> Print a hashed pointer for any symbol resolution witout KALLSYMS
> enabled like it is the case for %p.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

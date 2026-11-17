Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913244;
	b=GlkyLjo0RgRBw+P+E9UiydGy4vJiLeWETT0TsjHnUw2C8u5tK+sHrAFAvXAIWyymNJRi
	 yvkrQ0iqcj2IyNVOAkhLxyH+bR2+NZG6srRThezi8HCT2ovL+NJTr+Eva7ffp3GbOz8fl
	 Dvgpbk++Iupq+tRwgxmeazGqe8MkeCiyXRImUN6/5iBUuVZFGmKLMYaqHG7oBGqO9Td+5
	 aX7e8RrRn11o5OoM0vwXExvH0T65x9ar6ASFNAPD516eXRLllzkCSv74sK25z2ZW5jlqz
	 UQdhQbK2on5Aryb7gaLKlUALUZoTISTg78bOlHuyuELyZxHAguxmMdjFPVydUHJrEaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=nDf0c3k4gQ1q2fbwcAejo0l5m753k7bveaKyF8JgDy0=;
	b=g2yxk09B2zZUe7421bg4rrFcCkWuXH0bgEMTrsSHHzSkabQqMoY75ywNHUf+UGF7H6Ac
	 Uh3z04aJ5vjJDADBzko6waLDSIH4lVv+xyEan6z5EwuEbTDCycbDito64XnEXgtlgor7o
	 dvJu3VedgmEB931xNlNVeDBJnnYva4XsLRAvgF5qPRZcULRc/A/i6BfFrgFmF0qpD0GtI
	 FKYbI5uYzif3ncvRilYE65klqttHlLcUzO9ilqZBgflS7Q96Y/4E6iZUc6nhO6e+gLkot
	 +JntXBIvIuv7ZwLnWIqgRlnbW/KzNYba0F1HAFLSEO+Lt2NCH1kdpNAs2F5SXgzjBGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uxo0IEyN;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B26606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uxo0IEyN
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b1bb072438so473981a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913243; x=1795518043; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nDf0c3k4gQ1q2fbwcAejo0l5m753k7bveaKyF8JgDy0=;
        b=Uxo0IEyNHKjLd4a6l7dp7SZYF39WCPT9iZ7ghs78WnryN1MwhNtj+jpxJFAvDsj4iR
         jIs96XoJrSoFt2sw79tnC4gQUQh6geDV7TzeYHZH08HSogJPXesQq9OGW8bP2O6NNPc/
         FJfmJ56agT7NDMWJ00G0Ew1l7ldfzzHM+FqOo0TM86TtQMDCuKxNXDe6QdfywQo3i8O+
         O2F4mnsWXvTFaSaLZfR6jWeflcCqI+a5kA8Zr6oib5Ek2h+bWMccBetF9Cbh+tdfqFIj
         +9jhlG/jl3qj0Fd3w/4EE8QBAk+p+x4LgD5h88nwWB161kpyc907dXWSlmqqfIzGMOZV
         tMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913243; x=1795518043;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDf0c3k4gQ1q2fbwcAejo0l5m753k7bveaKyF8JgDy0=;
        b=MAD4mjZ91skL+iuq7ZHS9aTNYDxZR7UysFQIQvccTw/iyG7hgYtFd14M0I1RomWf+1
         /lo4TLx0eivHQEO4VaNkPmJYtOMoGMkTRozU15x0y1nAFGF88RZE0I0LAKUpvbnYB4wf
         W0JBrhoRR4WKSTHYqHfjUWLrXJwR1gb1DGXJovD85LkSoGW5gkaqlVui/i4XofcfBoKS
         0EFJU8LN25Qi5z0tIs5ICqd8LtpSLKdU2t2NcujluXH35w688DDkLCpiSNEeQA0Pmb3g
         2urDnf9B9Pmp6vQNxEsTO9CM9vqbz9gcFD9474CeaRAFZ918kw3WZAGtfbCbdba7GboP
         e0FQ==
X-Forwarded-Encrypted: i=1; AL+hErHXVAvlitYN3scK5W5p+mq4uQbgibgrBFt8wM3DNFxaP6PXLSc60bm2gavDr5+1v/Z1Tb3Ae/ejUxdHY8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DiH26CHkETADaTnB42EduvUVptbbE9pk6INB9NvaAemGWPKWE
	S8rpb7kSyzd+RvUkMLVIjZ8wD2HmequVkF6xeFuF62nA0Umj+8tdd5kx
X-Gm-Gg: AZFdTZdWc/y9I5azWtOTd9AHxre/P4j0Ty7Pps2L7pkySVRp6+5ogXgGfKWENNK1v+c
	tUSSLXrQgYOAKfAHcskMR8TdPgqAyj9TubhaJTVQyhf45C4/XmD+dc8KOH0i+JhBLdgK0N0VsON
	oGBB7q+0PTCiy0NeRQNqLlDVS8G/PRG0qu+Pq9s/qrrVfKOzeeRRP94DEaNlKRjccitLMg5Xn2N
	1V/wlP6Hx/iaC7nR10DnVYqQW5uFzCTFqnmFirxGDvQswtuGo09l6ECovzvHGrMuTzgODr8MllE
	N3UZwaFESH5xRjQeg91ryV2A+gBQVN+N7Z3PgSlRN57yxkCR0QuGsITJHhfwI1psOtxFO/zluwX
	zwelFIw5m8VvHkILN2zGMNLZH+C7VhVTZjLeFj+S4+0Ai4W0Ismdv4jf5bX0RRYbxSdTvLM48fA
	sSKLtiXt+CZHHAZdZy19RqCYkLSqA3PXg5AinxD0kNO21yNXLEE0dinzQOKUWhGoomupuUTLNYc
	ia289wXmRym9A00TssYAtmhAEKvViaEMlQid3BWtBKNdwttqWvHYa4tn3qTBAK6KE9RX+zJEIOs
	3nUkp47rHDGhdFE8br7bB2+x4Dk+LB00doMDwz8kqTFcfRPzUaMNWbj2SOOjeJ+L/7A=
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr21198226a91.1.1794913242798;
        Tue, 17 Nov 2026 03:00:42 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm3583538a91.5.2026.11.17.03.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 11/11] zsmalloc: populate new zspage outside
 class->lock in zs_store()
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
 Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-mm@kvack.org, Yosry Ahmed <yosry@kernel.org>
In-Reply-To: <20261111064707.2568433-12-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
 <20261111064707.2568433-12-senozhatsky@chromium.org>
Date: Tue, 17 Nov 2026 19:00:33 +0800
Message-Id: <179491323381.964041.11173076535030687661.b4-review@b4>
X-Mailer: b4 0.16.0

On Wed, 11 Nov 2026 15:46:34 +0900, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> A new zspage is not on class fullness lists and is not movable until
> zs_store() calls insert_zspage() and SetZsPageMovable(), so neither
> other zs_store() callers nor compaction and page migration can see it.
> Nobody else has the handle yet either.
> 
> So for a new zspage allocate the object and copy the data before we
> take class->lock, and don't take zspage read lock.  This makes
> class->lock critical section shorter and saves a zspage lock/unlock.
> 
> [...]

Reviewed-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

-- 
Best regards,
Xueyuan


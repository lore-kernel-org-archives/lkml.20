Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702027;
	b=2/AilSeS/WC2BgDdaIW15e+kfw1QGI3FaByMmVWYUd2S5f8JWHnEIBUmYs+NriI36Zb7
	 q6/H/Jeg7+fkIEdNDRYxKsFzpWHYOLjokfCFii9NSfW20hX12AjLbrDV2T6Xg+lMWsGdu
	 Mmjayb0Nh6wEz6pv/B7i8zqIFuS+SEmG4EUP9r3HUdNeQhX3jBQHGMZI/eQZ6jL6EdGia
	 AMw6q8iaN/6R/UGiy3fK8axu3MofO36/XLrEzMlh24krOSrO8VT/RGR8BNadFK3LBy7yD
	 ELagQHYH56n1YndQJ5jd/KpUsJ3nHQRF1M/ERj2wic3dtBaGrs0R6r+oboK3JK7GXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=BN9Z4rjr/QQvEFqoc3xGEEd37Gz2EGsQ1eWVAdfc5T0=;
	b=hW+sOVb4XLHFwUB7IWqyy6utBEvort3hKdAxueVJ4upg804kwbqD6OuMNw9Nz8wxaWzA
	 82TiEDKvSDSuCUCkpl6+OQMniaO3OpC1fi4fs7MTbjVKfl/YZpqjPzdlofH6cmoQ8BK4A
	 L3lswNt7DBh9vTlGtPSgmpGjRSbaMuIcj1Ybr8VHTd4srM/bp8AbO+yumaTrlVGq7n+AJ
	 WdthzQm4t2Vq8sPaEYEyfuXTUYPNE1OvGBbnVUds7BJpaQsGvRPwOPXjlY8Vy03lcXnop
	 n63nNRukY9pRh4Jq04+P7POncAwoS4nslA2rRYUUo1p29CEVZ/LjcociJZJX8AID5hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrLacS34;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88590606C581
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88590606C581
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrLacS34
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e538951d07so36862425ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702027; x=1794306827; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BN9Z4rjr/QQvEFqoc3xGEEd37Gz2EGsQ1eWVAdfc5T0=;
        b=rrLacS341HhtF5kUtAJBJKItMKKpZsvyDPpCwWdtu1i9JM3fdEZ2KlW6nn17mnma+c
         4flBhBGmtPaCNgKM7ifxdJUzY62zVQ+2crV1o9aeYo1kfPZYQ0b6/LaMlxadPbZYdPh9
         PhzrMbA7Og6DVDKLQGutVhxFt1p4aw7vb3i3/6pWZGEJqLARirFJkU74l6gosmlDHnEY
         CizI79GlNsNDKQ+TaJ96b58hU+k6LBQwm1YxlNi9cQwiTWwxGU2F40gqgB3W8RfHShZo
         8Pn4wIroFfDWGOBe98E0mbqQ9WkfteQNPbxW6JEX932Z4soSRwLZCYcFuuNcn07h9hyU
         Jovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702027; x=1794306827;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BN9Z4rjr/QQvEFqoc3xGEEd37Gz2EGsQ1eWVAdfc5T0=;
        b=gF6uMJK8vAc5DnX1kwhtXHnJ7kvAWqJssoutgFYesOi/Gt2Iyp6umNmFBC+RXLM68A
         xYE06rqzkt4YNCwWd777qH0LyFaONhiozREt8+l/LD072p+7fMrSP0VQfnAikUwgQvmV
         EgcaicDmB92wviGSettZTDD+8u99lgZGsIZqTyPR+t6MYWWjfifhZoxm6dwPOLRPPJhu
         09ze/GNEWE2jp2h0VLCxcWYjzMXsWIrmtsKSSzZ0yz2tMnuYVfkbiZ9UtpXqjsUCzR/X
         R/yY2BU7vFRzg17UwluWaLcxpRflal2mmJ8cD83bywlhdbm6/Pg/QFH6tKxnmHli1qfy
         IDPg==
X-Forwarded-Encrypted: i=1; AKwUvBx55JauWPdYPkO00niffwQeKtWhRo66Xec87eNVEzbcixiMaUSj6ucy/SNI9M2JUtuSuKXlEGPGSAUYpTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LUtB0K8sqlXGu8EvgDDbMcNS4f7Sdp2GB/cnjaX/qY6uCJKSL
	EzcpBjkxu/SygDO3FZKaH34HMZWEgVCpc07dokYXxQgXHiHHrocPBfFM
X-Gm-Gg: AYBFou3mJ2R7S5nwUM6M6jC6XeLBDh3f6ONIINPkAO0wZjPG0+YhHqxDma6DQh0rr94
	Vl9OCPa9qbDLBkcYQdHAu0puUzdE0vqS2IZ6LpJp6IR9aoYPdLPl92UnXaAMgES6aQCsSZOlRqy
	l3N6jhALyEzjgF0NJNwOw5LuyNRJeY9c52GSuUtl6U8vHEGMwfUz9sYsx2WiGKXpLUvtNwwRn9D
	BhzeW47ZjFhyAJ8YP1DqMicM3yVRAF93AUUuF9jZH+2rPtMBhy/4Pp3aEwPAosQKWYj29iV8MRm
	X7ujT3OY7BHlBedaosM4Rhhfhpp1BI/dxX6sZ4MYtmP2uPEaI7ijZOOzu2uR90VmGmNOaO0QCQf
	6V7eNzcJ1DGmEmmJF5ryZoBOBD4APTowc3KLqeeNqvqz7ZRO+favbBuNdUAHHiSHr2ytD93OBbm
	crX9zbLseXCy8jRyYZ9cEOIrx1ycZ8e3wUpNJo/gLhJrn8a/ejouVBcWKERTTekAN4/LN6Z4zhv
	jkv5QYxgwiz5diHZSmIl0THC8yIu40Mavj1oDl2nD3SsXZxvzSv5wOBbRZ7fudbPi2OoSE7kmAo
	/JLRV+/9xHuxQXNr0c0tHJU8Z5zukS/u5NK+dAfZkzhZY1+q4oX9l9zb5ElRu0tip6KmimGbKnB
	LZit/DuNw6hmVSsxKfIFGq+APjs4=
X-Received: by 2002:a17:903:3804:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2eb36405304mr129374835ad.5.1793702026750;
        Tue, 03 Nov 2026 02:33:46 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928d821sm38374845ad.56.2026.11.03.02.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:33:46 -0800 (PST)
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
Subject: Re: [PATCH] mm/damon/core: use list_{next,prev}_entry() in
 damon_{next,prev}_region()
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 03 Nov 2026 21:31:41 +1100
Message-Id: <179370190119.71013.18301574509097172702.b4-reply@b4>
To: Enze Li <lienze@kylinos.cn>
Cc: damon@lists.linux.dev, enze.li@gmx.com, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, sj@kernel.org
In-Reply-To: <20261103100714.70742-1-lienze@kylinos.cn>
References: <20261103100714.70742-1-lienze@kylinos.cn>
X-Mailer: b4 0.16.0

Hi Enze,

On Tue, 03 Nov 2026 18:07:14 +0800 Enze Li wrote:

> damon_next_region() and damon_prev_region() manually do container_of()
> type casting to fetch the next and previous region from the linked
> list.  Use the dedicated list.h helpers, list_next_entry() and
> list_prev_entry(), as damon_first_region() and damon_last_region() do.

The change looks correct to me.  list_{next,prev}_entry() expand to the
same container_of() calls, so there is no functional change.

That said, my understanding is that the kernel generally discourages
changes made only for coding style, outside of other work on the same
code.  Documentation/process/4.Coding.rst notes that "pure coding style
fixes are seen as noise by the development community".

SJ, what do you think about this kind of cleanup for DAMON?

Thanks,
Aveline Noir

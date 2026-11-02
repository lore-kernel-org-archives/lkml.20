Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636969;
	b=t+TtNzDNvIrlzNc/umko382e2JgxwHGBNmz3NIzr9AkUswmLMP64fU6eSwkhEtN5PIqr
	 0zEVA84uRhpV6CkPvtM14DDi6s4BG/t/pqhOoaVopJiBfNUAv5RrDWp6E67FQYvMPXvIY
	 CaSjKC9FEtGzruNlkN348t5Kz3h5NYPkh6uaZy+E3jJ4WankZY42SrUfOZlYz9u0ofzSB
	 bj4/CPaNPl8yLaaem0RhZl2v4ihlR7a2WWTv2b5B7DnAa3w/t9HpDJdFIxL/es8pueRSz
	 YNy2dt2jeVAatexY3Es54OdIb0MhigwxfQ/SXYu8C8KuqhW9cXN9dBbsvtjT5LCS9rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636969;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=CZ2VG+rPJ+EDG8u/AOblxQuCYCkiIgxzxGfkk5kFmbQ=;
	b=nHWQqfaYl3mrtdFBUCaWJRH2Fu6qLOFDqNgV32khBas2ds9wmyvkosfdUPRJWxfL6MFj
	 0q6RFDKeT5EoRSrvVPxG2gi+bIAehZw19/m8owwt7ySFJxxjsWy9Tkg+EopVHv9gKXybD
	 6OFCdMK0Aib/FIq0ZSrssbI2nfh21PIDMLO8sV9YKmtdydGwzyWjCMChlssBqQC3/RrzS
	 NrUSbkhL6EyqmrRVFzBix8vd0r8awbSkUSEGnigUpMbSaXXTj5j7UymvxIXnLXuuaiRff
	 ht1D3GAlUt23xtokiJkVzMYl4qLTdMcR1gH61IuWe9LSXQYxNV39g/CIS4DryFQFhDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=snkK6qiC;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB366072290;
	Mon,  2 Nov 2026 16:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB366072290
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=snkK6qiC
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66D5140430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793636968; bh=CZ2VG+rPJ+EDG8u/AOblxQuCYCkiIgxzxGfkk5kFmbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=snkK6qiCoN6GU8GInoJUo1iZg/Bfz14U5TyCaLYXFeC0X+9W1UN199qTHzhnxG0GX
	 HwGzO/5uu+F6y5oRB9Euvjk2nvNWdu7evbNGy1x+ZUm6Jl1Cv9xtdzlHdn8K6ejy/B
	 qvTUnBYFwMKt+E2eTW0awJRFPqU0KCfN7D8OsSs3ldCNxxImFrYyMQf4Z/x09Bm4kT
	 42LAtausKFgbszsQj4Ck3vChBZC8FT9nPtxVPerDcjxZjdi2Aq2phTG/d28cC7vRYf
	 pWViap4NqgsTRVbzT4URqkJsFhB6UrqP2MyJUgma4jJ7vCN/gmmhDbHA+3QoirXbR2
	 gr3CvlHnxrjdg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 66D5140430;
	Mon,  2 Nov 2026 16:29:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Simon Sudarushkin via B4 Relay
 <devnull+simonsudarushkin.gmail.com@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Sudarushkin
 <simonsudarushkin@gmail.com>
Subject: Re: [PATCH] docs: kdoc_output: don't add a man page tail for
 filtered-out symbols
In-Reply-To: <20260929-kdoc-man-filter-v1-1-5f70268885d1@gmail.com>
References: <20260929-kdoc-man-filter-v1-1-5f70268885d1@gmail.com>
Date: Mon, 02 Nov 2026 09:29:27 -0700
Message-ID: <874idzci3c.fsf@trenco.lwn.net>
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

Simon Sudarushkin via B4 Relay
<devnull+simonsudarushkin.gmail.com@kernel.org> writes:

> From: Simon Sudarushkin <simonsudarushkin@gmail.com>
>
> ManFormat.msg() appends the "SEE ALSO" tail after every call to the base
> class msg(), even when the -e, -i, -s or --nosymbol filters dropped the
> symbol and nothing was written for it. With -s, every other symbol in
> the file leaves a stray "SEE ALSO" block behind the requested page. With
> -e on a file that exports nothing, the output is only such blocks, with
> no .TH header at all:
>
>   $ tools/docs/kernel-doc -man -s string_get_size lib/string_helpers.c \
>       | grep -c 'SEE ALSO'
>   13
>   $ tools/docs/kernel-doc -man -e include/rdma/ib_mad.h | grep -c '^\.TH'
>   0
>
> Only add the tail when the base class produced a page, and add unit
> tests for both cases.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org/
> Fixes: 104e0a682e12 ("tools: kernel-doc: add a see also section at man pages")
> Assisted-by: LLM
> Signed-off-by: Simon Sudarushkin <simonsudarushkin@gmail.com>
> ---
> Randy, this takes a different route from your patch in August [1]: the
> out_tail() call stays in ManFormat.msg() and is skipped when the base
> class produced no page, so OutputFormat does not need to know about it.
> DOC blocks that are shown keep their tail, since they get their own .TH.
>
> [1] https://lore.kernel.org/all/20260816054826.3988516-1-rdunlap@infradead.org/
> ---
>  tools/lib/python/kdoc/kdoc_output.py |  5 +++-
>  tools/unittests/test_kdoc_parser.py  | 52 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)

Applied, thanks.

jon

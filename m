Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679852;
	b=QFmuFSQU+xkUnx6/M1hpuoXD+gFmzrUPJV0BPEuoJKp7xQKHuJtOi6Tj3cULcsJETGMI
	 OK5iZ4noshvH0B84fY+RcUnV+ZptHpiPIZdJpu/QQlZ9mCtiB+YS+uMW4ekVb6940tPyq
	 ywAfSTF3rFJy83pQ8Yr65tZJiG2gj/TTuk9arKaXCnAQ5tRR4Sn9rpUYSGPSk4uNHV/k7
	 Mn1FjzUFA6G+DVXbvhx30lCSqt9FLbFzQXURdVBtLvjE7Iqkf6pzAiTHXeAA7Hgj7dQSX
	 aWaBW4VbUkKVS4e4FRWNcXSRZ3+LpcCYKOawKeQgPT5EmserQlLTvueEb1+mM1wvQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679852;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aWKY3kokfbW71iLPHpkV8Vm1rMvD96qVXc0qrtQJh2Y=;
	b=vJSBO7J9q1H7uew7TiLRIfHEnU/g0JIKo9Gz6X79iR+VS8OW2bFg9bHMXa7LhBIYysNc
	 KkAQ9Y/83BUeGQO3TSoFQSJqaAe7GR3080BFALTFRP+98DH3RYkxnEBC5jc5JIS67Y5EK
	 osFjNEePBykOrB2fBpkCtkjKonzuVArsVBgXyI1BI9UsNLW8Y2gu3p+vob32+mz1kXKPv
	 qPVPObM8iUXGClMBnTPN8suAt3QM6oRvQbfHohLRiL1iqkOjbutEIuVLsfZIRm3G3FTTi
	 04ktUoEhef3i5BzPdR17FPSLNGsJXukC57KHM3W4JgSWcw1PN52B7g9RRHoTftF7v9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=Iz3jO+lr;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mPV+y72H;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C0E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=Iz3jO+lr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mPV+y72H
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7F3767A0106
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:24:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 02 Nov 2026 23:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793679851; x=
	1793766251; bh=aWKY3kokfbW71iLPHpkV8Vm1rMvD96qVXc0qrtQJh2Y=; b=I
	z3jO+lr9IfAhkhU17wV/LIl5z9TL7YnzMR31ARTxabZV9+7n5ACXbgWyDbdhlmxm
	8HJGV9UAQbQSygZHNbMPwdBl8M7SJGSOX5QY/z7EtH4sE7d+C2hnj79Vlm3TPrpI
	D4o1xTeoFwMX2X0TSylJxWmoZHO9c91r4ZXnpZtoMAFYvqGd9raXemnIrcAQd1in
	mKaYrjvXxUhWymRpai2FeoGdk6jtw5E6lJw7hEhQnzLpI/RsgT8LLf/T4RTbqE2I
	7F9zDlqZ5VWLULYYrxKOEJFx1YxEX2hmfFFytKmKkL4ch26OC3nx8jdNKE7fZ6iM
	YWiUgjvYIUCs4bjVub/Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793679851; x=1793766251; bh=aWKY3kokfbW71iLPHpkV8Vm1rMvD96qVXc0
	qrtQJh2Y=; b=mPV+y72HNFzwrucGpin1xq900NTJXAmCNKJKqSlo3LDGsFEEwIb
	i4HTq19XV98836/fiXROZAqEaFt9uWBsng9zk0jq4Khaktkhf2FTfHRuq0CXHS12
	Mg53IyExf+zP4SsgSf+wuSeOBj3y+NOqj5XVdY2WHS4q6giIclm1GfAca8n+GpfZ
	asdvN3/xSNcgVX9pkj/ynaXkdTwq8X2Fu8RXBLl0R3ClruqeUuM+AjibXgLdK1Nr
	fbUqRz2qZMEf6b1d9BbG2lihXZAJ55by8ygDiHSkKKX/UD/MArA0ePp9ZFdSzCl7
	3YloRpRJFOwZzihsi6n72EiYoRjDZxylnkA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793679851; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:jxLwKEWEfpFZ6bDX6OdmhfZ6YwyBgYXWAXU/s+66XhYG+/x
	ryboM5FadN/8I5CR13FIpqF9ocYBCwwz8nnPnfaKJtMXBuJYR8H/CUMYNzvi4ffQ
	O80GgnrEljzxUaFtajsyVhuOyQf+PuO39KiXS3+XizkEccynooMQVhGJp6+k1uYQ
	fO1xI40DhlxXHyaFo30WUhWpNBGDjI1huyzQx/flVbiBMKQnpHOcDs7jokFDOjC1
	QWDSQQvC2/lcsYWSe7FTkN3Q/Wd/CPaBFKku70WU74YT3TTM73UOqiAmgpmeEOb1
	SivU9T8UdpDQCUXVq4Dm+mGYUL9A5EzjFKvhKag==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:q/pi43qAsBpXS0hF3Z5/acVlIaVq7uw1+TB3AkfwAn4=:wzwNdnCAeSLihJc4sOAKtXyUe/09BkWcc0T+80VAokA=;
X-ME-Sender: <xms:62Hpav8GLWWK4JYJyTBP2xsJPm2QWy4lWTVGRGtFksy8WqUu2d0U7A>
    <xme:62HpajeYUwaDd1yKYRBXH2u9STlMM1AyBrazLCQ3KYeNX1woG7PVwN65TNf7guYjJ
    JmBwKWPZddJF37Hof2_xEoM1kXb_asBvUQMq15MZeTzATxB9mPRu7QmUA>
X-ME-Received: <xmr:62HpagG1bjtCA8V5yudBUF6rIUcNUNTUWUbvhmZL_Bi3IKkS9j0Uni97HEBNDsq6v1W8R937sYIFlfskzVlmQmBbMAlP>
X-ME-Proxy-Cause: dmFkZTGUfa4OfVmDJqWuhoa1se8RlfYklNrLLENfMqnfe/OnVH0KntFHGigEoc5+2fFCAE
    JiUplTXTDCVJgQgj847qJg3ENkiWOW0v4SY/QDHitUhJqUr82GoUoYBAwQxzFMO7cHG34b
    mfs1ksGneGvjUN8uT0h+Fu2sDE8oAmP88I45mKQ7LtSTdzbmvvQvqubHEbX/rPelOEVa0/
    JcWbKagTvbAHrrUi3BFsEQcb67K4/vYLWPLUTNo6rJTo4ajEmRZolqVPZNwU8RfzbIp4V4
    Bie7LrBFMU0NI4/s3i3/KAtweSAJm8yIwrbr//kwvQKq5OU67AOCgiTu33XMHBsJVB1ktg
    Psd6w3JmZH6a89G7btvH7na40peZ9fhmyxURaxdMrfcKtTwfyd+oB/lMLLn024XDy+zPqT
    r0fyAe8XyfQrj2B50RtQvItJsFy4Ca7XiJEhfcvwZWOU+O2Jl0G7tlN1Oom1WjoGqvdvXu
    gfgUoR6z7XWdFuKr1tGPAntPkbzELCBC/WLf8sxxpNn8ON3qzZ1fmm7iN0VRFm6puj1DUq
    NVUAzXRb+ykZAa5CsFAz2sOMNdEUxuN7aO2t0jcfzr2r7KdA5F5aHxgPNY+YVAVbWnnFA6
    dvkLxa/HL52eqWT+ln2/c/vi/Hgg+fTYVAP57gn3mQyKlM3vbIHveaRtOcWQ
X-ME-Proxy: <xmx:62Hpapd4P4rA1qPuIw9Sxt5fP0v-mtsf4C4cgB6Xtd5rHhiGBzyQnA>
    <xmx:62HpaiEMZW4n9Pd2OuvwNbLbs-EwZJGncqX2prhB5A9gdPlegTFzvQ>
    <xmx:62HpaqWQhvnqMmchd5xNuj-wgTV5An-WjltCS55vH24R73nODzYnGg>
    <xmx:62HpahLiRQCu46946qRx6H8ubXNxGsDGLS_HTCMvn2Mso7siSVchmw>
    <xmx:62HpajqeuANu32ewFhLxJAd1TICgLnMYxFIslFDMIheowa7JaW_u3gDZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:24:09 -0500 (EST)
Date: Tue, 3 Nov 2026 13:24:08 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: Fix out-of-bounds access in CSR iterator
Message-ID: <20261103042408.GB1229640@sakamocchi.jp>
Mail-Followup-To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20261102065334.3087-1-sreekuttan2156239@gmail.com>
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
In-Reply-To: <20261102065334.3087-1-sreekuttan2156239@gmail.com>

Hi,

Thank you for proposing this fix, however I have mixed feelings about
apply it, since the iterator is designed to traverse the cache data of the
actual configuration ROM, which has been generated by the parser.

If the configuration ROM contains any malformed entries, they should
already be detected by the parser. Therefore I don't think robustness of
the iterator is a critical concern in this case.

For the v7.4 kernel, I've merged KUnit tests for the parser
implementation. If you are still interested in discussion about this fix,
please check them at first then try to add tests specific to the iterator
itself.

On Mon, Nov 02, 2026 at 06:53:34AM +0000, Sreeraj S Kurup wrote:
> The fw_csr_iterator_next() function reads ci->p before
> checking if it has reached the end.
> 
> This can cause an out-of-bounds read when the iterator
> has no more entries.
> 
> Check the iterator position before reading the entry.
> Move the pointer forward only after reading a valid entry.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  drivers/firewire/core-device.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
> index a68100d3da0b..36667841ca3c 100644
> --- a/drivers/firewire/core-device.c
> +++ b/drivers/firewire/core-device.c
> @@ -40,10 +40,14 @@ EXPORT_SYMBOL(fw_csr_iterator_init);
>  
>  int fw_csr_iterator_next(struct fw_csr_iterator *ci, int *key, int *value)
>  {
> +	if (ci->p >= ci->end)
> +		return 0;
> +
>  	*key = *ci->p >> 24;
>  	*value = *ci->p & 0xffffff;
>  
> -	return ci->p++ < ci->end;
> +	ci->p++;
> +	return 1;
>  }
>  EXPORT_SYMBOL(fw_csr_iterator_next);
>  
> -- 
> 2.55.0


Thanks

Takashi Sakamoto

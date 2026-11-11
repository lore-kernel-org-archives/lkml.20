Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441600;
	b=dCaGjrYSaOoiXV5UyuzNG3F3C5uJoxk/Kah3sWkNn7f1XAY1RLdNrtfZr6DVffXH1iPo
	 1D7naagh+gwgv3T7TlDyjmHUwAepHp1chnUYA13phNDf3XCAcuaOOzTkVAZhqChdd9Zp8
	 pkWdtta37JBg8ESopZ+OPdlPrk3R65Lsh4780r64TyskPuhspbxdbjYHnGsXbmzz/JRs/
	 VbJk4eUzMBjH+9mv44f1pYfEyuo66pS5zq6pNLWsJm/JL2wGb0GtFjVVI1FZHPgPUEhm3
	 pAC+fUE8xKl1Y4YGe4FtwkbsF932zYT8nWOaGXEQ06LB/xAO1Uuh9Ah1Rys3coH9uSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441600;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=AYfDhVWIJoQ9KSL/7rofW30DBjtcF5Xs6nknyLO78gU=;
	b=uxFU9qDRuJC94MJ6gAIIIq85051sbp7T2OnDDEnt4nBU49CxGtW6vpM4VRV0U21xT5+e
	 JPqbV1XmDTAJqzlS/gvldz6UGW9jOhbQrAia/TdhfU1YsncHpOHClgUgP+jEIdlTuv0u4
	 46WHvuqK58qEU6SIvaWTy0tL7Z6cxGzaEffQmfMs/SC6hls3dLf+tFaggfwN5lK5xwGKq
	 37yvo7MCuMGp4zF/7m42ynmHY/LAXAQ6zrmYsRn3Zgwpq0X30VsQ4V4adzyy4uI7YXqf+
	 KNWND7IBP9Hj6AVog1a7m/XYJ42FAYgYKskFrCRe1YlQifu5W540yyOa2vGvWVfcu1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=AYvUVKYz;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=ZnZXGK06;
	arc=none smtp.remote-ip=92.204.81.232
Received: from sxplsmtpa04-12.prod.sxb1.secureserver.net (sxplsmtpa04-12.prod.sxb1.secureserver.net [92.204.81.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A584B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=AYvUVKYz;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=ZnZXGK06
Received: from ravalox ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id RIE9x7zgFEx5pRIEBxWByf; Wed, 11 Nov 2026 23:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794441586;
	bh=AYfDhVWIJoQ9KSL/7rofW30DBjtcF5Xs6nknyLO78gU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AYvUVKYzjoXnvKLxzYm06BXQBCaaZ7dpxQUXS+o8eHCaZJ7+p6Ui1oRb3ycxGPfpb
	 44h+dALvZBCWw8HHUdKxYqsZ/8NeH9Rfv7CmBzs5oAccNbbjs4cvfWUr4bPxB7H9wp
	 rRFwBPTCbIUGiFPKA9WQE0bugTrLSfpdV758UJOPjyme+71AaoD9ZhgZ5nBNOJDp+T
	 8cwX3lCk/dEj6cn9FYniUWtmM1IA15ll4BeR834DjgFOJct7Kj44sd5ScFMy9potDC
	 hWLb8E6QrwFgFC0HfCkdljEnpiXzOlhQYCQNZ2Wh4Q+xDWSDZAHpoZ3esKI54wCCwD
	 5Ir1jn0UN/X9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794441586;
	bh=AYfDhVWIJoQ9KSL/7rofW30DBjtcF5Xs6nknyLO78gU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZnZXGK066C5rZ5hIehvnzsSonOfyxxOkCjLP4yj0xryoDFsi0s7nQ4XbliCYKm5tC
	 tipQnQC4gKlx9hohZHes6jDnrMOLQ9LSl4FPDXzLFWJcOWYy2rd0HwZuG6lyhuLbOR
	 Z7XcueUB80s3Uy5ASiX3xOqsaWaL/meTBu0q3TFudBaXdZcwC92QiN9zKU3iR+o4Bq
	 PsQ8Y8Lup2EXm4ctb2WO272KmUKS7FLKqZ60zLRhhekvzZ5MCtaOX64RM9cgJhvG5C
	 6v1L9zBcgRkMeFe0jkbXAwXMRLQrEyy5usxamWktLLhXeJ/F6GsJnqK7tyRZ5e4EzU
	 jjpyK+092H6GA==
X-CMAE-Analysis: v=2.4 cv=Pe5qFShd c=1 sm=1 tr=0 ts=6af50171
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=kj9zAlcOel0A:10 a=IJv9LcIfAAAA:8 a=too0B7RXG2IdHs0d6GMA:9 a=CjuIK1q_8ugA:10
 a=cmr4hm9N53k6aw-X_--Q:22
Feedback-ID: 786f214390aa7bc1439cdcbccf6a9629:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Date: Wed, 11 Nov 2026 23:59:40 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Joe Perches <joe@perches.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/18] Squashfs: convert SQUASHFS_FRAGMENT_* to inline
 functions
Message-Id: <20261111235940.c9bdd0f2b5faee753f9496ea@squashfs.org.uk>
In-Reply-To: <32fd1f6ad824796b525ffaa3ebdd8d2610858bf3.camel@perches.com>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
	<20261107052843.725239-4-phillip@squashfs.org.uk>
	<32fd1f6ad824796b525ffaa3ebdd8d2610858bf3.camel@perches.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB6VtjwWNaKOvxHZvLNvNyxB7q4AQXmBy2VQZ38koDqvd9QDo9uHdNZgw6yuxi1OQT0iZ/g5Q6PMHshUBEc6jCBbZllSD0n43yAfoy2UYGCVu4rSVhtQ
 g+zNpXOxti4OV5UUXyJAWB31aG5BIh6fJRW/LAcL/FIXC6iU+apEnQxDFqp/o4iJM43CI2Z/5iaC7ChVlnHz5ql22k+t52OpM7vzq/bJ7R2MfF+PsgoHGZ6H
 3LTkRzUj1ZyVYB5jdihlyA==

On Sat, 07 Nov 2026 02:05:28 -0800
Joe Perches <joe@perches.com> wrote:

> On Sat, 2026-11-07 at 05:28 +0000, Phillip Lougher wrote:
> > Convert old fashioned #define macros into inline functions.  This has
> > the following improvements:
> > 
> > 1. Inline functions are typed, which makes the width and sigedness of
> >    input and outputs explicit, which reduces errors.
> []
> > diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
> []
> > @@ -51,4 +51,31 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
> >  {
> >  	return ((s64)start << 16) | offset;
> >  }
> > +
> > +/* fragment and fragment table defines */
> > +static inline s64 squashfs_fragment_bytes(u32 fragments)
> > +{
> > +	return fragments * sizeof(struct squashfs_fragment_entry);
> 
> Needs a cast to make the multiply work properly no?
> 
> 	return (s64)fragments * sizeof(struct squashfs_fragment_entry);

That is fixed in patch 7 (in the original patch-set). This is because
it was reported by an AI and so it is fixed in a separate patch with
an explanation of exploit and reproducer.

Phillip


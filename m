Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867662;
	b=VdV/16zpuKwmymXdnvtBBhxlLsonHjvGLQcVLGuFRf9Y2/S6Y8sjByAe70ASykLBrTNB
	 8hjHL3r7iw4mtbZhJTfannAPqw+Gju9TcF8mg1vneCF5Q4Srxgz+uRvs4FRxCo1lrdZ0m
	 WSJ/gVHge6Hw9L9haDZyi+Z4FEx1FdK6f2EPjtdMyzdFHhoxscYytRnWM3uo6LaA+Q0KL
	 hQgcPRdR699TJDXE9Mn6ETuFpLalvbO8CeGT+GTpk4mXTVeETFcL+Rf2zJCGZeFcFQNs0
	 riU+8cIMk/P/F5E1AVrAkdRRwfZcokGAif0Lkbu6dNj0CHifNkzWT2nNJJK9mosg2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867662;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cnhqM65tjsKZGGJY/TXRPudsFhxJteMdDEVDYcPFQSc=;
	b=AG4yPq0xsE4WDLPLBzpbMUtACz6CIHwiyZhBdaLzYWUtI5MzFHC+M9KZ1lFsHOiFRk4d
	 IAD3deJSepWhqpHcL9+bc9OdZ6EG7yz01dmBOofZIyb8/yCDzttl+xceDfuQKz2IEsBUn
	 Ibp4gwxbA6hSX/fmgjirlPFJzRgj0si5YdjmxIfHBjptsBPtD4EhRAHLXn5u10No2rSVy
	 nTiY/aqRAnLRS0hmq6Grss4VMHiERgKtVLw4Lrhq2V56Fq/xZvgJNRsP25BmrON3XhbiB
	 BFt0LiUh9dAMNwK0zkJc8rHrbUSpWrrwXt3M+0nH4An9myN+G1OXciukbPLlCWVah3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=noWlk7ff;
	arc=none smtp.remote-ip=95.215.58.207
Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAB606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DAB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=noWlk7ff
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zClrcHGLDzT23aIyNgtsDXJndZr3lkUPgSp0Qa+dhfg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793867656; v=1; x=1794472456;
 b=noWlk7ffB+Dzl6UKHGgE4HtHCybgrJIBH3aDepc5o/Ozko5Kyi39D2aOx2NBqeaaKQ1WMrGQ
 f0UWAftglynJikvNw5HB16mFmy9p3HxfLJa4ugmNmq/mxjdUEmGB+wdWm9e5syYFpWmwxnIGwV+
 Ke3oRw3vJQSaitGmfHEXsBrjrF3BD4Bf8Rco2ZCLLa0jCT+OtB8fBuY5Wx2gKeOsHzUnagZDzIv
 Fhm6EIDgbu4MAmsQwWpf5knSZpD4bYFB1EkT/EG1mqvxHkIA71mki0qjEgKsoJfR4T7XOgS0OPb
 s1VGEzCbXGYAAOxfYs+P8SvMROtIyB/+8JNoJbDYEjFTA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2606b68ee5890bc3;
	Thu, 05 Nov 2026 08:34:12 +0000
X-Mizu-Trace-ID: 2606b68ee5890bc3
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 16:34:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Message-ID: <auw_egkhHADKXL90@wyuan.org>
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring entire rest including the main concept of the
> patch, are not really reviewing "the patch".
> 
> As explained in Submitting Patches document, the "Reviewer's statement
> of oversight" is for patch:
> 
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
> 
> The sentence is complete, meaning it does not allow implicit variations
> "this patch or part of this patch".

Agreed.

> Reviewing pieces of patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> not be applicable.

But in this case, I suspect that your "Acked-by" trailer will still be
interpreted as an ack of the entire patch in future git logs, rather
than a partial ack and/or a partial review.

IMO, it would be better to clearly specify which specific parts I
reviewed, like "Reviewed-by: foo # for part a". But if there were no
such usage, I would actually think it would be better not to give
any type of trailers.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> And let me even bring a better example. Imagine a patch, doing massive
> refactoring of core SPI stuff, 1000 lines of code, complex locking and
> also simultaneously updates drivers to the new API changed in here.
> 
> Reviewing that 1000 lines of code in core SPI with complex locking takes
> someone 30 minutes. He gives Rb tag, gets credit.
> 
> Now another person comes, looks at a SINGLE line in one driver he is
> responsible for and gives Rb tag. For 10 seconds job of looking at one
> changed call in one driver.

Yup, therefore, we better suggest that the latter should not give out
any trailers, or explicitly state which parts I have reviewed.

That said, my understanding of these is not as profound as yours.

Thanks.

> ---
>  Documentation/process/submitting-patches.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index f271d7413f72..d2aa31bdee1e 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -585,6 +585,8 @@ serves to give credit to reviewers and to inform maintainers of the degree of
>  review which has been done on the patch.  Reviewed-by: tags, when supplied by
>  reviewers known to understand the subject area and to perform thorough reviews,
>  will normally increase the likelihood of your patch getting into the kernel.
> +If the reviewer checks only piece of the patch, leaving the rest unreviewed,
> +then more appropriately is Acked-by tag.
>  
>  Both Tested-by and Reviewed-by tags, once received on mailing list from tester
>  or reviewer, should be added by author to the applicable patches when sending
> -- 
> 2.53.0
> 
> 
> 

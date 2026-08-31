Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57E5474F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788135646; cv=none; b=iozFT/Wu1JU+ea5TOeaEmdiEXrTGt4hOz7i/grdIVioRd3i/ppfkTTeof53W3U4LMdzZtIYG3/K0ox2mx8MWvmSlF/FYF8zBuwIo3/mT286qwt/CKZC8t0txX7h4O2dz/qIcjXjh+ev++Dx5TPgCA2ktVU5h7MxVX+yrukL0AXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788135646; c=relaxed/simple;
	bh=0VXg2mxmDIex9VPOqpdqkiG/yXjxhajw9hNmmCIAbzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLDpnVFQcX76uz6mWyr25oKSgtr3LCEak7DMfi/gd7e2T9YFyOF3+fuqIkTJIA6QLMilBnxjdhyn0I8gUj8JiRvZEOcGSpPNWf5Rd91ZwG8kKwvgQY+UOXfZJ2jy8ZF/Q3Hh7yFz6Bhh68ycAKjhT6Falgq4HEGsdi5WmOuAtfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ATskcVHS; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ATskcVHS"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hY8lw5vPpzlfwgF;
	Mon, 31 Aug 2026 00:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788135640; x=1790727641; bh=+Cij7HSzlWQUnHzWKSG1oJc2
	1ZVtO+sjHWJYIgdLgNI=; b=ATskcVHSCokkreArFv+ca+KHRi9P7SBQ1/HEwEWD
	pD5Xh8dSZGaxYwJ9eR74ulzVHdq+qcOVwCuOybid6Y+l1m8nB8qA2zw5vWZGP668
	ot37eO2d85njhlCTXDcKC33ov2V0FX3k3MsS2ucGsmF5IDPrEXLd1uPNF1nKGWVX
	Ht4XMe496wi1noTgG48dszPYDNaLWpwz7oh2j0vCZj9newNFS4jtVxTf6S8AIpie
	Bg1PLRwCLc+wrMTf9uOV5UDmBnquofAJESA4sw+93SqdqpBHXdB4Ji/HWDE6KFo9
	ijiu3PWZol5N2hgbOVwn+HiJ6KhtpvpKHZKceYARSD+blg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id YrgityRTMQTp; Mon, 31 Aug 2026 00:20:40 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hY8lp2381zlfvpM;
	Mon, 31 Aug 2026 00:20:37 +0000 (UTC)
Message-ID: <ce48c6ba-bdc6-4adf-8f38-faa6fe9e6707@acm.org>
Date: Sun, 30 Aug 2026 17:20:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 10:00 AM, Bart Van Assche wrote:
> Using a __bitwise type in a tracing __field() definition triggers four
> sparse warnings in stage 4 of expanding the TRACE_EVENT() macro. These
> warnings are triggered by the is_signed_type() macro implementation.
> Fix this by using _Generic() in the is_signed_type() implementation
> instead of an integer comparison.
> 
> An earlier attempt to fix this issue is available here:
> https://lore.kernel.org/all/20220717151047.19220-1-bvanassche@acm.org/
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
> 
> Changes compared to v1: removed #ifdef __CHECKER__.
> 
>   include/linux/compiler.h | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index cb2f6050bdf7..ba9c7e16802d 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -326,7 +326,14 @@ static inline void *offset_to_ptr(const int *off)
>    * Whether 'type' is a signed type or an unsigned type. Supports scalar types,
>    * bool and also pointer types.
>    */
> -#define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_signed_type(type) _Generic((type)0,	\
> +	signed char: true,			\
> +	signed short: true,			\
> +	signed int: true,			\
> +	signed long: true,			\
> +	signed long long: true,			\
> +	char: ((char)-1 < (char)1),		\
> +	default: false)
>   #define is_unsigned_type(type) (!is_signed_type(type))
(replying to my own email)

Hi Steven,

This patch still applies on Linux kernel v7.3-r1c. Do you agree that
this patch is ready to be queued for the next merge window?

Thanks,

Bart.

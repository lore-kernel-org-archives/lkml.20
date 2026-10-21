Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568605;
	b=HXg4HaFkeKVki39xi0EF/Xc9KyydbREpqBMy6yO4B18lUFghv0eiQzWEbI1nZHZqhzvE
	 TtfngQSaQdttznvrd6mTOBP6FhnFSKlbO9F/uvGuZkpQXRYKAmrunbz8ZtEUHVUsU0adu
	 3l146H2JelXIwW2k2GeEzCrZEMjGne/Lvepqu+ORQXqdZzgi5/3K15gbEyaTBdZnBYzJD
	 YE0nQT8Q6Uy2XQ30Jf+ZtPSmhB4mZLhYJxLOfzUPsAlnMnVclEbTKeTd9DU5WCq/sSiEI
	 lGZHjzW7jBYPHXGmLMTGkdN0hUxHQxsnM44A/8xFTBrZNWLWYZlh5aqrTJrQrj6Jlxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568605;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bqvNx+nSFaoooaGDpoFgXiB2Eh7sDLhcG8Y6WkOQHNE=;
	b=PgsMuFidE4evHRz8tE+82kG06uag7QHf49mOpmuDY08m7VZzBDGaj9Dm0XB85LqzPoGM
	 RA635BmDpdl3xEjfuZFbjfNtaYMzsQSYbXyeHo5qE5nHmK/o3C6DNFjAGnXaY/7vaTTBD
	 YFmnFMeErE9hfyZMZbUU7ujEnog4QlYmjmv/v3bQBrCi7bXu6gQJuaxR+zJPyq3aUX9cH
	 gE5Iu5H69l1Qmy1G8h32Ttu30JoVmPmajc/vFmwytLE1+hQN0uyjvWXOMdzhYpt2AXUNt
	 ogBU9CDiKC1tGKx+pFnXNRxD0dSckZtzPLm55g/Gq6NmpGuN4/kksJWzHih/zw7mQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WFuZyBQu;
	arc=none smtp.remote-ip=95.215.58.119
Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A45606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WFuZyBQu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1tenPNde2ofLPho6d+i0Ie/+UXV53/Rdww8nZpiovVY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792568602; v=1; x=1793173402;
 b=WFuZyBQuxADYHx+rU2yhqPLHRterWXJU0j79yIrNEAtsGpUOF85g1RBApMM1/rucscBbCRPL
 wOAn1tFIo/tgDBpowrOKaItkSGCH1TCkI5tYOFgmjFDEI1cPDCAb2w/IAbEgsNyV3Xzg2eoQZz9
 P/FURSW0ASSldsdaLWX+3GCk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9b75c6eb5203bb55;
	Wed, 21 Oct 2026 07:43:22 +0000
X-Mizu-Trace-ID: 9b75c6eb5203bb55
X-Migadu-Flow: FLOW_OUT
Message-ID: <98855929-df9c-4615-84ea-b90acba8c2ae@linux.dev>
Date: Wed, 21 Oct 2026 15:44:40 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] alloc_tag: Extend allocinfo_filter to support
 tracing queries
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org
References: <cover.1792439751.git.abhishekbapat@google.com>
 <9e49a8f68e4e7d25c5a9a73c1926f68e468ef320.1792439751.git.abhishekbapat@google.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <9e49a8f68e4e7d25c5a9a73c1926f68e468ef320.1792439751.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/10/20 04:00, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on their trace state.
> 
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> Acked-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Hao Ge <hao.ge@linux.dev>

> ---
>  include/uapi/linux/alloc_tag.h | 8 ++++++--
>  mm/alloc_tag.c                 | 8 ++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index dafcba2f7e2c..a96054ac2237 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -38,7 +38,8 @@ struct allocinfo_counter {
>  	__u64 bytes;
>  	__u64 calls;
>  	__u8 accurate;
> -	__u8 pad[7];
> +	__u8 trace_on;
> +	__u8 pad[6];
>  } __attribute__((aligned(8)));
>  
>  struct allocinfo_tag_data {
> @@ -54,7 +55,8 @@ enum {
>  	ALLOCINFO_FILTER_INACCURATE,
>  	ALLOCINFO_FILTER_MIN_SIZE,
>  	ALLOCINFO_FILTER_MAX_SIZE,
> -	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
> +	ALLOCINFO_FILTER_TRACE_ON,
> +	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_TRACE_ON
>  };
>  
>  #define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
> @@ -64,6 +66,7 @@ enum {
>  #define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
>  #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
>  #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
> +#define ALLOCINFO_FILTER_MASK_TRACE_ON		(1 << ALLOCINFO_FILTER_TRACE_ON)
>  
>  #define ALLOCINFO_FILTER_MASKS \
>  	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> @@ -75,6 +78,7 @@ struct allocinfo_filter {
>  	__u64 max_size;
>  	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
>  	__u64 inaccurate;
> +	__u64 tracing;
>  };
>  
>  struct allocinfo_get_at {
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 9ff9dd04d692..0d4d267c065f 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -250,6 +250,7 @@ static void allocinfo_to_params(struct codetag *ct,
>  	data->counter.bytes = counters->bytes;
>  	data->counter.calls = counters->calls;
>  	data->counter.accurate = !alloc_tag_is_inaccurate(ct_to_alloc_tag(ct));
> +	data->counter.trace_on = alloc_tag_is_traced(ct_to_alloc_tag(ct));
>  }
>  
>  /*
> @@ -323,6 +324,13 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
>  			return false;
>  	}
>  
> +	if (filter->mask & ALLOCINFO_FILTER_MASK_TRACE_ON) {
> +		bool tracing = alloc_tag_is_traced(ct_to_alloc_tag(ct));
> +
> +		if (tracing != !!(filter->tracing))

I recall Suren had a small nit on this hunk in the previous version.
I don't see this change here, did I miss something?

> +			return false;
> +	}
> +
>  	return true;
>  }
>  

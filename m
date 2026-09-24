Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6EA42588C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244510; cv=none; b=rXHs7Wb5Hljb4wnZ5CH+f+pBAFnCf7JsJcPhYMLCrPsMtFz2jHvHVjueyd+kPwISHxpjf+0RjwCDswa5A3BGOU3fZA5j+g/d8XHK0aswrukuOH39xGr7EVtFqIEnAVAyqvCrg197cO4olO9PBWUH5RGEwGtbjeYHtjqU8LPFWHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244510; c=relaxed/simple;
	bh=TYkeGPF0hlaxiRuF9a4chMHeSplYcs9ovpi/ZQkxnyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foN5SnlVyzOqWNUw8HB5d8VdBLFER+mzMJJrT86dcWEzw8PUAugTNWsLlGPNr8lRGt8tIdJ4ADfDkd7VOTim1ovqbTPEaiTLfwb8BvTlAlI57+TYuUNWkMxJEH0lb3mg5AkvIm9o/yo5kRSiol4C45UR6gAXV3oas5mM1MtAStA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YrRsfVVG; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YrRsfVVG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TYkeGPF0hlaxiRuF9a4chMHeSplYcs9ovpi/ZQkxnyU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790244495; v=1; x=1790849295;
 b=YrRsfVVG9UkLprddq+B3eWuREyRhFn5QPQItaMt8VbhlguacKhFObCKKbVzl38xO979NZY9d
 tRxM4FSZQmPx3KGj2nIsawvoBH/jWyujwBIHrSYIzOO8Si2Gji02MtmW7mPCWBSS5e8z0q8tYGM
 gNySq48vccIlRkpBBNhmsfEE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b00ef1a5dccb427d;
	Thu, 24 Sep 2026 10:08:05 +0000
X-Mizu-Trace-ID: b00ef1a5dccb427d
X-Migadu-Flow: FLOW_OUT
Message-ID: <50b4b64d-7948-418b-9f3e-9d841fc426a3@linux.dev>
Date: Thu, 24 Sep 2026 12:08:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Remove forgotten header
To: Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260625104903.1713213-2-phasta@kernel.org>
Content-Language: en-US
From: Marco Pagani <marco.pagani@linux.dev>
In-Reply-To: <20260625104903.1713213-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/06/2026 12:49, Philipp Stanner wrote:
> sched_main.c still contains the spsc queue header, which is not needed
> anymore in that file.
> 
> Remove the surplus header import.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Marco Pagani <marco.pagani@linux.dev>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index d2ca01b31ee4..9446b08fff1c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -77,7 +77,6 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_syncobj.h>
>  #include <drm/gpu_scheduler.h>
> -#include <drm/spsc_queue.h>
>  
>  #include "sched_internal.h"
>  


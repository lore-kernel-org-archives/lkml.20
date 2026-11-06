Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973063;
	b=mVv1OT+U8j7kXufV0dBcNKIhwGvB4XQxhSXy/q2u3GfjKfp4sX8VXWBhyH69vI1a5ER7
	 mVtmgByMLCJ/uLXsWwg6PuSBb84+XuIQuF4ENNwDyFa+tYB4FEQucEg74Urb/m/bk+9RR
	 m4wBQaN8UcqdB/lcD2ZYqoOANeteH1UCtolQx8SxlPIHSs6UPVLJ+8NGqGn9HXKYFe1an
	 uNubkWpQZS/d9j29j1X9HWtIYs6UEHmv3koYRIYdszs1UQ2LBafHhV6dYKnEyC9ZLx+R1
	 fxE7MPwOHXgxmHzMYGNy7Q94WZ7bd7Y206rJWvgi/rNgWC2PrsmamaBOzAK4rgT4xPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973063;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fCYv0pUxgmAeB4rdFLxkyhkQaEAR/KeTjA5yN8eBLPw=;
	b=LOpPEJdAioNKIp3XGdp0hgH7PTE5mEAsih9VjLWoPO57Ye3Ls9S2BzarzQ2jOkucD6pd
	 7P/Elt0Pn5jceC7Eh8nJgPrC+8sOq8VfHWFKQeWaVwa/SwMmfLo1UHgNUOrwTiftuJmSN
	 tnJENHE5dvxwhQ2Fzg38DP75/ppk98pXV0KbEFACzJFnFRe9f9GnODPU7k7pnq/ZFNwIT
	 FS8m7bsi7cexuwPZGyaLEGG3qztCkWOeZZUu/R0XulXfcAFCywMFvd5/pTI6Et1kGyAz0
	 bzPl/TKDPXRz/aKTVviV8FgD0ts9fcENH7PCERBHNyKG/qLqoir3dRFcCZZfTSWAYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Eoe6Zhzk;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F9606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Eoe6Zhzk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aSjJokHbfeqfaOpdHS6iuJx1acJZQq2O8WuSPhMF0YI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793973060; v=1; x=1794577860;
 b=Eoe6Zhzk/okkLzMFyfli43iTSTSUyLEXYA6+3lSHl9sVaXoR9GT6gIwd4RWPF4XJwV8hE+4S
 g5wiRHL+hKQGqJpbm4TedNzOTJk3yxR/MHw6OAk1FG9J+/AX6ko85F+1bCYttGvzNf/hl0DkaQy
 fWbpQQEkKDa8njzL7uYnTxKc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 821439f0cfeaeec5;
	Fri, 06 Nov 2026 13:50:59 +0000
X-Mizu-Trace-ID: 821439f0cfeaeec5
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jiri Bohac <jbohac@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kdump: Give crashkernel CMA areas unique names
Date: Fri,  6 Nov 2026 05:50:55 -0800
Message-ID: <20261106135056.790448-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106104309.3669583-1-zaslonko@linux.ibm.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  6 Nov 2026 11:43:09 +0100 Mikhail Zaslonko <zaslonko@linux.ibm.com> wrote:

> reserve_crashkernel_cma() names every CMA area it reserves
> "crashkernel". If the requested size can't be reserved in one piece,
> it falls back to several smaller areas, all with the same name.
> With CONFIG_CMA_SYSFS, cma_sysfs_init() then fails to create the second
> directory:
> 
>   sysfs: cannot create duplicate filename '/kernel/mm/cma/crashkernel'
> 
> and the error path removes the sysfs entries of all CMA areas.
> 
> With CONFIG_CMA_DEBUGFS, debugfs refuses the duplicate directories as
> well:
> 
>   debugfs: 'crashkernel' already exists in 'cma'
> 
> so only the first area shows up in debugfs.
> 
> Keep the name of the first area and add the index to the others:
> crashkernel, crashkernel1, crashkernel2, ...
> 
> Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
> Signed-off-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
> ---
> Found while adding crashkernel CMA support for s390.
> 
>  kernel/crash_reserve.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Thanks for the fix and pointing me to it in [1]!

Acked-by: Usama Arif <usama.arif@linux.dev>

[1] https://lore.kernel.org/all/20261106104309.3669583-1-zaslonko@linux.ibm.com/

> 
> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
> index eee37a11380c..e58318b1e092 100644
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@ -483,10 +483,16 @@ void __init reserve_crashkernel_cma(unsigned long long cma_size)
>  	while (cma_size > reserved_size &&
>  	       crashk_cma_cnt < CRASHKERNEL_CMA_RANGES_MAX) {
>  
> +		char name[CMA_MAX_NAME];
>  		struct cma *res;
>  
> +		/* CMA area names show up in sysfs and debugfs, keep them unique */
> +		if (crashk_cma_cnt)
> +			snprintf(name, sizeof(name), "crashkernel%d", crashk_cma_cnt);
> +		else
> +			strscpy(name, "crashkernel");
>  		if (cma_declare_contiguous(0, request_size, 0, 0, 0, false,
> -				       "crashkernel", &res)) {
> +				       name, &res)) {
>  			/* reservation failed, try half-sized blocks */
>  			if (request_size <= PAGE_SIZE)
>  				break;
> 
> base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
> -- 
> 2.55.0
> 
> 

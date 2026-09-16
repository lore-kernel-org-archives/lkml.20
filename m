Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD47259C80
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539735; cv=none; b=kTTNB0472Gfpq5KL6NU/HicSkQz+TeaVm/9YueKgWxJZYsXPw+Anzixj8B57LCJ60IzOrubVdOrycIWidMqPt2m5c/mkcZvK4AUTK4vRChF29JreAfecOJikgHbHw1215m3Mqm9zZ7o4Izwj7NjI73Thh7Kxim1jxgtYpNzPC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539735; c=relaxed/simple;
	bh=YlPmF24/qdfUtbjliorWHCseDb+NuqTVIkvqtyPqIG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+miVAOmjDgAfNJ6M90HZYgt774wrxiyVEGDoakCCZESjbjNrqMnOPjggwue5b9YVw6ck5GY64yD7ui9LKJQKqjvMqdMrwOD45OLItm3Uw8Bg9i0ysWoyGXkKoVPIXSpsjH4ZFboEoJT7tWodGzgK1CU8mVILv0C9uLmRXbL0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZWTIZf2T; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZWTIZf2T"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YlPmF24/qdfUtbjliorWHCseDb+NuqTVIkvqtyPqIG8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789539729; v=1; x=1790144529;
 b=ZWTIZf2TzlgZE9cyj9nuhjbV/vWcj4Xkc2GeEWp3V2bIvWWvzvJLrhyoLJXkK2Mxs7J05wSF
 s+nU1INAeAEXZghFcLAuol434rT/ensFGJmVIoRUDTXVY5EgPcoFQRdPhI9+za3uL1ofr5hDO76
 Ab00mVnmQatk3/yPRZZxoqww=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 749b150985699eb0;
	Wed, 16 Sep 2026 06:22:09 +0000
X-Mizu-Trace-ID: 749b150985699eb0
X-Migadu-Flow: FLOW_OUT
Message-ID: <4281b7ac-9778-4d5b-bcc5-aea42f4f1120@linux.dev>
Date: Wed, 16 Sep 2026 14:23:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alloc_tag: avoid implicit padding in uapi
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20260915202404.3568029-1-arnd@kernel.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20260915202404.3568029-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/9/16 04:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The impliied padding causes a harmless warning when testing the uapi
> headers with -Wpadded that could in theory indicate incompatibilies or
> data leaks:
> 
> ./usr/include/linux/alloc_tag.h:41:1: error: padding struct size to alignment boundary with 7 bytes [-Werror=padded]
> 
> The code here is fine, but it's better to make the padding explicit
> and avoid the warning here.
> 
> Fixes: 1d581ab2348c ("alloc_tag: add ioctl to /proc/allocinfo")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the fix, with the nit from SJ.
Acked-by: Hao Ge <hao.ge@linux.dev>

Thanks
Best Regards
Hao

> ---
>  include/uapi/linux/alloc_tag.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index e3ad94444864..7d4618bea043 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -38,6 +38,7 @@ struct allocinfo_counter {
>  	__u64 bytes;
>  	__u64 calls;
>  	__u8 accurate;
> +	__u8 pad[7];
>  } __attribute__((aligned(8)));
>  
>  struct allocinfo_tag_data {

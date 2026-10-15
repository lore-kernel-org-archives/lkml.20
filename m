Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3AD3E6DEC;
	Thu, 15 Oct 2026 03:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035698; cv=none; b=eOI6KIzU1SwTp0cv0Px5l8HiCCk32PVvnxwwsiIaZItnjFzR/7DKfUQ0oYr47fp6pViCR45QvRxY8KGf38MgNyISB2ro0fIJmbrGN+4rh39GEhuZkSGska4k9tKjMwzsqpDBAMQ9VrRQpcU8V2JRRgm2sUkDSb3fqJkXXcXaQwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035698; c=relaxed/simple;
	bh=oAgWsVJJBksnjQ+oDhn8BxCM4OSCCRKOOleHG6MFjbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uDni4D2MQP7bB8O0LkRvVZiB3atHv7I9LxLYzXzJExTjj76m1obT0xUpk8fJGFJ80AxBUmjBKzaFh4mtcsV/IlpsHIBA23FW/SKu7RKAhYuDBSNNNLVpAf0sFPIx1joSz2BTajUBkKrePQTNqEvNOFApgtZQNQ08d9vHYAMYvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h5wXzmON; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h5wXzmON"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=jGHt9W1Ym9gc8T/wtzJJrkO08M2WLOG7KogY7IzOxqw=; b=h5wXzmON3nURhIER524CkmV4Cs
	UPYER+n3OBsUjErfRWzZCedvDVnFI+GKYu/zbuc6tsudJM3ztr5XJRbtte/1/47Sf7LMiw7MTZhvE
	EcyOb1f/zaNCeubr5GZwoRBt29uBMvkNbbe/J7wX3fUVFm72X5tky0ZZ7BUq+8sb0OZ1hHY4tGP+f
	qhaZcCk3R7PsYYsDP2wi5a0aK2tMeUUuRKQ6vi9IfYU2zhvfU3MvduX368Zed3STzbjIkaNYr8n0Q
	9CLxRHeuJ+EkOHggEpBSfBzLPS9TTq7/DfpaHW1J+NQzRFeq063hvdnBRxHfc2vTWXFmPJqWWEvj7
	LCJoej3g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCLP-0000000Gkut-0vZY;
	Thu, 15 Oct 2026 03:41:27 +0000
Message-ID: <f469c550-5d02-4648-a8ec-b154f2db3c57@infradead.org>
Date: Wed, 14 Oct 2026 20:41:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct
 members
To: Pasha Tatashin <pasha.tatashin@soleen.com>, rppt@kernel.org,
 tudor.ambarus@linaro.org, mchehab+huawei@kernel.org,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux@weissschuh.net,
 linux-kernel@vger.kernel.org, corbet@lwn.net, aleksandr.loktionov@intel.com,
 kexec@lists.infradead.org, pratyush@kernel.org
References: <20261015020313.946940-1-pasha.tatashin@soleen.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261015020313.946940-1-pasha.tatashin@soleen.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 7:03 PM, Pasha Tatashin wrote:
> KHO ABI structures declare their preservation pointers with
> DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
> and its physical address. kernel-doc does not know the macro and does
> not see the member: it warns that an unnamed member is not described
> and that the description of the member is excess.
> 
> Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
> for DECLARE_KFIFO_PTR().
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  tools/lib/python/kdoc/xforms_lists.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index e3dda2fe8a537..e81d8a7702cbb 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -45,6 +45,7 @@ class CTransforms:
>          (CMatch("DECLARE_HASHTABLE"), r"unsigned long \1[1 << ((\2) - 1)]"),
>          (CMatch("DECLARE_KFIFO"), r"\2 *\1"),
>          (CMatch("DECLARE_KFIFO_PTR"), r"\2 *\1"),
> +        (CMatch("DECLARE_KHOSER_PTR"), r"\2 \1"),
>          (CMatch("(?:__)?DECLARE_FLEX_ARRAY"), r"\1 \2[]"),
>          (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
>          (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
> prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
> prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
> prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
> prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
> prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8

-- 
~Randy

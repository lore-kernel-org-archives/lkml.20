Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B314A99A9;
	Wed,  2 Sep 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370002; cv=none; b=DL81Jzg/kbV54BGjJQza6mO9uyuU1lnuNBj06aO0VxwCT9caqpcQ/OQn5x7qjVDMulMmmPxAkyN7mfu0qtMwsTxqA3Rd2SKWmU+C6/pAxyFW5JFwu/gN9MpfLBLcITbV39sA1HDjbHL3k/CYWhqdMEcDwNqorW0kQDxrmqlLtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370002; c=relaxed/simple;
	bh=DOsN4u9i0LgceBe6eZWGHBQMRexYH6+xlzgYej1JOJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HU+b0c2pZv+zckaVtGMdPBJ9uH7uzRnw/PQH+CT1MBZLexgfBsMqm6rALJaoLe9ytfjrDvXAUTNOkxnIS9suIdvSNxnEq+h7o6OkVQRub1zMKU+qE50siW3zlwJ/VHgNnq/3kObAwZdmV49v/cMWLhDaoL5NfsRcXuYkuEzDJaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cDJ5DEt6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cDJ5DEt6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4ErMCT6oLuGCxeOK6BXBf1qfbH9FJh8mGL3DSmIsfQA=; b=cDJ5DEt6arbQfiU3k7+VkDRfdb
	pCnVqS+LXZC/rJF1CzCqMCfOXI973ZMfqPRCLCwVtcPfbUz89j1TCm+HB3gUBt9QZOiQNITVkm/s7
	iir9RlrY7YttvwqqvPPC5+2yKwDujckXIMtlNKhL12wVqk2Yz1pIMAM+pPE40mvHbqaZWTxImfzoV
	rWknhTh7FTatH/HOWcQXj6lXrYeMn8vWuSl23VewuCORMHIWD0HtRpYwCPNiw/kkcHAwBRhImEblx
	YUlZfcuM4vcmxYLLSZ056LVFGMaVlnzujOdn5Xck1mhdJ//QZBBn90oE54dkXecxtR1e/aNsGK0o/
	EsM+BRFg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ojO-0000000FQxA-0p4s;
	Wed, 02 Sep 2026 17:26:38 +0000
Message-ID: <2e2333a9-dc4b-49e5-a09a-47fa502e0e22@infradead.org>
Date: Wed, 2 Sep 2026 10:26:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: admin-guide: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902152347.708070-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902152347.708070-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 8:23 AM, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17a..ebc281e6d 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -438,7 +438,7 @@ zone[i]'s protection[j] is calculated by following expression::
>      = (total sums of managed_pages from zone[i+1] to zone[j] on the node)
>        / lowmem_reserve_ratio[i];
>    (i = j):
> -     (should not be protected. = 0;
> +     (should not be protected. = 0;)

I would probably drop the ';' character but don't bother with
a v2 just to do that.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

>    (i > j):
>       (not necessary, but looks 0)
>  

-- 
~Randy

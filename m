Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18643FC5AE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591101; cv=none; b=kswYnLNYz50jGM/yc8qkXglJnHIXlbkLMWef6bsTSAofvL4vG+L/v80Bt9oDMpQRjfdnX79PP4kHarVgUWHeP7UC0SIst7cy/fQzCFkG8a4MpU4xxmaSEN9tEX9oJ1cx2g9yPOOB5U/XVKVFYoLx3LWGCqzvO0607M1c9cn2Q0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591101; c=relaxed/simple;
	bh=2qsLTZUYXNCuyy8IDZLxqiAQMXwe8wqDNcAp0qKJ77U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK7UEVTV7AhUY6SsqIco0cRP1ZNRpsg/Qi1gaq0lrq5iWzgjLhvOfKZwMImAUZw2LN1kzr11QBL3QZDZL0nIYEW1IzzUc/RTh/iCMxPtdPpi7wihyMsI0msiVI8WQRSZmYHE6E7L81CR9tksksPdQm99nNPyFTb3jfSd59i/bwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NswKtore; arc=none smtp.client-ip=91.218.175.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NswKtore"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2qsLTZUYXNCuyy8IDZLxqiAQMXwe8wqDNcAp0qKJ77U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790591096; v=1; x=1791195896;
 b=NswKtore9qYVrR9vagccDrfbHyJJ8mLoexTlyQOOyX8nMj4mDLBKDtayUHTK03wcMnHqDgCM
 ZVCDSG5PnHjsONqAkaN6ghYKpdJ2i5doEGIlPAvGqf8fa8E9AEY0WMPLwQiy3WKspmMYcd8PTA2
 CWqwGR1xLv1bCr8zwYC9Yq1w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8692f2c2c9228f5e;
	Mon, 28 Sep 2026 10:24:46 +0000
X-Mizu-Trace-ID: 8692f2c2c9228f5e
X-Migadu-Flow: FLOW_OUT
Message-ID: <9c47dad9-2716-4ae0-b6e2-9e6b5c718859@linux.dev>
Date: Mon, 28 Sep 2026 18:23:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, David Carlier <devnexen@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kexec@lists.infradead.org
References: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
Content-Language: en-US, en-GB
From: Dave Young <ruirui.yang@linux.dev>
In-Reply-To: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 4:48 PM, David Hildenbrand (Arm) wrote:
> The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
> needs similar information (although still relying on
> SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
> 
> Let's just export the value instead, so tools that work on vmcoreinfo
> will not have to guess.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
> SECTION_MARKED_PRESENT and further cleanups" [1]
> 
> This patch can go in independently. It would be preferable if both
> go into the same kernel release ;)
> 
> [1] https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org 
> ---
>  kernel/vmcore_info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
> index 5a417f8a922a..7833a36064a8 100644
> --- a/kernel/vmcore_info.c
> +++ b/kernel/vmcore_info.c
> @@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>  	VMCOREINFO_STRUCT_SIZE(mem_section);
>  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
>  	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
> +	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
>  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
>  #endif
>  	VMCOREINFO_STRUCT_SIZE(page);

Current crash code looks below:
#define SECTION_MARKED_PRESENT          (1UL<<0)
#define SECTION_HAS_MEM_MAP             (1UL<<1)
#define SECTION_IS_ONLINE               (1UL<<2)
#define SECTION_IS_EARLY                (1UL<<3)
#define SECTION_TAINT_ZONE_DEVICE       (1UL<<4)
#define SECTION_MAP_LAST_BIT            (1UL<<5)
#define SECTION_MAP_MASK                (~(SECTION_MAP_LAST_BIT-1))


And it does not match the kernel for below chunk with ifdef
#ifdef CONFIG_ZONE_DEVICE
        SECTION_TAINT_ZONE_DEVICE_BIT,
#endif
#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
        SECTION_IS_VMEMMAP_PREINIT_BIT,
#endif

The last bit could be wrong in crash.  So all numbers should be exported in vmcoreinfo.

Thoughts?


ThanksDave

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933052;
	b=yq5izT2iV+Ojg/cZ/sj7FwDFPjRCzj7gJOddd082WtC//UfMlWoz1tIW8wTavS4I/IZW
	 5wZA7jnSckyhIfRPgMy67Y8hTTlrOeB09pPYc1VBpeknuCRgFaUjGjW9Kn0H0rVzVA+mE
	 8GxM0YawP6jvj2u9Zwu7nqUbdo9uyuxBrjCjP8bzvwUy8RZr+LoNiY3fMk5vTELsYsIg9
	 E4ymQAjXjzzdWraNz+xWwZVrzrjHIhURUf7syogOYe4RnWtOyTPEVGOAcLIsnnTHaBbct
	 7XlJHTQn1XAg8IkGESncsOAuOVXwvS566T17areY4FbulZhU/1dw1/9liQS43Q3cLcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933052;
	h=DMARC-Filter:DKIM-Signature:Content-Type:Subject:Mime-Version:
	 X-Original-From:To:User-Agent:X-Lms-Return-Path:Cc:From:In-Reply-To:
	 References:Date:Message-Id:Content-Transfer-Encoding;
	bh=tgrWvNnafi0hz01idjBDDnVhQC6ycv925GHIdoMUXIU=;
	b=K8oC1DAIP5aDOChWxdSShLrR8S6uiw6pUq+PUCHMXiDzw1AUXb7IrRPHHolXkrW9vqJ1
	 GovDJWjoHjJ2oljC4lXp/PzgSBSOHhmZnm1OUue/MbGX96ff+b+E+KhW+FII4i8loT4fH
	 lMUqmu+YyHdz4LCgZZx1OyN5j6SSHt4zY04Ud3moLVGSYdtXWhVRiZP4wfyY8ajbqcvd3
	 JzFbB2MfrqaNT+hysa5rOdy8170BmsO6dVmR2A4Apyo4We3/IPz+yLXule8UhT5YwNbOK
	 Mybz8oEfYHFZzaMCLlK/dTM3fI1JcAFrxjTEJ3sBuCwcMGENZ/wDAr0FuLF69hkmHmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dKoGpakC;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9F606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D9F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dKoGpakC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793933045; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tgrWvNnafi0hz01idjBDDnVhQC6ycv925GHIdoMUXIU=;
 b=dKoGpakCq+RU2UuXTJysOZT7YmHbb040g0fXp8Wmfj6zU/Z/qjxPR/SWw401MV7u0e3Gqa
 Ni1Pllf43TdKWrUQ4s7RlJO/+Edi3Hc5QWuW2WTVzoX2XFIn5qtIAJ8/b5fZtu2s1dIu7J
 KRm5KaKPjvItNiC6gwLlZjhYlEdQvoHJgC2YO0X7iiZ6LAOHOfaT89gSWOErsL1eGK55E8
 udPQqfbSeZfSTOTO5wW3we2PTS5tyArqlnunk8Knq6Hanhq0q4k9ydL0NYfhUtOKNAqMVL
 drApI/PdEL+L7lEK2lGdUJDB5/WucJwwOxhqROGNDAsRx0g9v+IpT1zlMLUuTw==
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH] mm/ksm: avoid unsafe anon rmap dereference in KSM merge
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: "David Hildenbrand" <david@kernel.org>, "Xu Xin" <xu.xin@linux.dev>, 
	"Chengming Zhou" <chengming.zhou@linux.dev>, 
	"Andrew Morton" <akpm@linux-foundation.org>, 
	"Rik van Riel" <riel@redhat.com>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26aed3ef3+cb0712+vger.kernel.org+zhaogongyi@bytedance.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
In-Reply-To: <179387163181.11797.15205182972949028650.b4-ty@b4>
References: <20261102-ksm-anon-rmap-fix-v1-1-68962acfb59b@kernel.org> <179387163181.11797.15205182972949028650.b4-ty@b4>
Date: Fri, 6 Nov 2026 10:43:45 +0800
Message-Id: <75926835-508f-48d3-a5d9-176cea61546d@bytedance.com>
Content-Transfer-Encoding: 7bit

Hi David and Lorenzo,

On 11/5/26 5:40 PM, David Hildenbrand wrote:
> On Mon, 02 Nov 2026 12:32:25 +0000, Lorenzo Stoakes (ARM) wrote:
>> When KSM examines candidate VMAs in scan_get_next_rmap_item(), it
>> accumulates (mm, address) pairs in ksm_rmap_item objects, assigning them
>> via get_next_rmap_item(), pinning folios via a page walk in
>> ksm_next_page_pmd_entry().
>>
>> Throughout this operation, scan_get_next_rmap_item() holds mmap read lock,
>> which it drops afterwards.
>>
>> [...]
> 
> Applied, thanks!
> 
> tree: mm/core.git
> branch: ksm-7.5.misc
> 
> Applied patches will appear soon in mm-next, followed by linux-next.
> 
> Please report any outstanding bugs that were missed during review, so we
> can either drop the patch series or decide how to fix it up.
> 
> It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
> though the patches have already been applied. If possible, patch trailers
> will be updated.
> 
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. Further, this is not a guarantee that the
> patches will go upstream. If in doubt, please check the listed branch.
> 
> [1/1] mm/ksm: avoid unsafe anon rmap dereference in KSM merge
>        https://git.kernel.org/mm/core/c/d8d12d97
> 

I tested Lorenzo's posted patch on Linux 7.3.0-syz-13001714+
with CONFIG_KSM=y, CONFIG_KASAN=y and CONFIG_SLUB_RCU_DEBUG=y.

An earlier unpatched run of the fixed-pool KSM/mremap reproducer hit a
KASAN slab-use-after-free in page_address_in_vma() after about 342 seconds.
With the patch applied, the workload ran for 12 minutes (1027 KSM full
scans) without KASAN, BUG or panic. The fork/COW smoke test passed.

ksm_functional_tests reported 8 passes, 1 failure and 1 skip. The
"ptrace write failed" failure is a known test-environment issue; dmesg
showed no kernel error.

Tested-by: Zhao Gongyi <zhaogongyi@bytedance.com>

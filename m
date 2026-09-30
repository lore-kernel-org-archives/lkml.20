Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20444F93C1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775530; cv=none; b=mKv5bOMUV6TlV5Mm/oorw080djKQYhrmtu+TtwJXrnCmUSeCVdikJvF9ZTYfToABXSe1LsOGVUQVYFgCzE/VU/W2GrPpmcg2EyXB3USMwtTAz/YDhVmIZhE5haeSX7+nIAUXoXkxND3Ce/7/bdVlK4ypmG9ekxukAgq6HPnuCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775530; c=relaxed/simple;
	bh=lcQuluWqoElHRHUpdffs+zz1mzqDGPOpnACMggFGdo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THALfkXX8yizOYNA5rHoHHOPiDEGqHC7O7AOhc+RwkV/Rd2Ys1xVRxEVkwflAI+Aew0XnObNtDVGwsPBgHfqYVzZ5B+Q8tlsLRo9NX/zSVDb19iAPgzhjecDCf4zdqScXEn2840P2OUZt5cUOdPvBHzZPsy/MKl5aaZhw/o/k9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xEyPHhsk; arc=none smtp.client-ip=95.215.58.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xEyPHhsk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lcQuluWqoElHRHUpdffs+zz1mzqDGPOpnACMggFGdo0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790775518; v=1; x=1791380318;
 b=xEyPHhskqY+zKro0V3No4XYRdbC4c0j8qfiMjyxWmC7/KEcRAjzXGl17mTOIQ4Xk+L0xmwx6
 NCA52a4KCQ6dVj19nYnWKubqmVZ6MyBphh+XDZqinMF2AQy3maHBEMSW7fOIOSGGVEGRM70IHPn
 7lFd30bUgDrVUC8fO9w2Acio=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 441b9db43c699605;
	Wed, 30 Sep 2026 13:38:37 +0000
X-Mizu-Trace-ID: 441b9db43c699605
X-Migadu-Flow: FLOW_OUT
Message-ID: <aa39ec65-a2c2-4396-b20e-4e4e7447df26@linux.dev>
Date: Wed, 30 Sep 2026 21:38:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] mm/sparse-vmemmap: support device DAX in common
 vmemmap path
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>, maddy@linux.ibm.com,
 rppt@kernel.org, akpm@linux-foundation.org, david@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 qi.zheng@linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260929053231.66085-3-songmuchun@bytedance.com>
 <20260930085329.17337-1-lance.yang@linux.dev>
 <62E3517E-517D-4C23-A04A-F5BEB0A84C60@linux.dev>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <62E3517E-517D-4C23-A04A-F5BEB0A84C60@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/30 19:11, Muchun Song wrote:
[...]
> 
> Your proposed fix looks correct to me. I would slightly prefer keeping the
> rollback close to the failure:
> 
>             err = sparse_add_section(nid, pfn, cur_nr_pages, altmap,
>                                      params->pgmap);
>             if (err) {
>                     __remove_pages(start_pfn, pfn - start_pfn, altmap,
>                                    params->pgmap);
>                     break;
>             }
> 

Cool. Will shamelessly steal this approach :D

> If the first section fails, this simply calls __remove_pages() with an
> empty range, which is a harmless no-op.
> 
> Would you mind sending this as a separate bug fix? I will ACK it.

Certainly! Lance

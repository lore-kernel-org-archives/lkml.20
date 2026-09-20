Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5F0330652
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898392; cv=none; b=Tj8F5RGo8VAaUgnhg0+3G5gF1cXAS9By50AiNtmEewUec/zsGFcgqSFVlOG9xEt8iGrmc8r1c/q/SW6X8+R6j07oNkrIaAawQa56nhAoxdtu7b6mnfE5LZTtSu8Kq61g0/IXB4SHTcYwXF054+C+vva+dcRVj1jn62q1Nj1YsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898392; c=relaxed/simple;
	bh=i1HleDRhgKWtFLvlkCLckONA588VkME6KNONTyekZJA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qEQZIq2msJIstzlGgtDOYv8/1+2xArcIxDOnUMswLd6kkC+n6y96O94iCMIMFF9z5HQ8HZ7qgl32PoiT93DJZwd923qCu+rCKcCdFJqLPwyYu4vhsIC8OGFO3+XGCBWT+C4bKkXisb6h54nwjqRJAkxr7bsPHsx5MPuSgho7unQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gKe5u8bc; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gKe5u8bc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i1HleDRhgKWtFLvlkCLckONA588VkME6KNONTyekZJA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789898387; v=1; x=1790503187;
 b=gKe5u8bcA5blqDZ2W/6YxWa/Q1UaPWfwDTqtz6C66wlLepDdwbLquAIHCYjjeTjX2xVPLdOu
 Xlv6SC60cIIqJBx6gDXISFvmpjiu66GL5jOtFPom8Z4sG+oHS5tuPhLH4VKPNDDLNWxrTsZnkzY
 WFIYeQX2ahDN6yKuWjJuY28Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 78e13bd88616e780;
	Sun, 20 Sep 2026 09:59:46 +0000
X-Mizu-Trace-ID: 78e13bd88616e780
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] mm: Add CONFIG_SPARSEMEM_CLASSIC
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260920070406.95354-1-kaitao.cheng@linux.dev>
Date: Sun, 20 Sep 2026 17:59:22 +0800
Cc: Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <85F48B20-68C5-45D7-A8E7-27E601283743@linux.dev>
References: <20260920070406.95354-1-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 20, 2026, at 15:04, Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> 
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> Several MM paths identify classic sparse memory by testing
> CONFIG_SPARSEMEM while also testing that CONFIG_SPARSEMEM_VMEMMAP is
> disabled. Repeating the compound condition obscures the memory model being
> selected and requires the local SECTION_IN_PAGE_FLAGS alias for the same
> state.
> 
> Add CONFIG_SPARSEMEM_CLASSIC as a hidden derived option and use it at the
> conditional sites. Remove SECTION_IN_PAGE_FLAGS and test the new option
> directly.
> 
> The x86 32-bit vDSO build starts with the x86_64 configuration and then
> undefines CONFIG_SPARSEMEM_VMEMMAP to emulate a 32-bit configuration.
> Kconfig-derived symbols are not recomputed by the C preprocessor, so define
> CONFIG_SPARSEMEM_CLASSIC there when CONFIG_SPARSEMEM is enabled. This
> preserves the existing behavior.
> 
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


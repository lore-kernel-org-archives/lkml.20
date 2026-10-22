Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662643;
	b=BH12UV7JOWZEW9VbM7w2hj4V+I7srABpqAuX01x9iMV/KjBbuWrcrazTyazjtgQnQNOg
	 lU9pNlApSuV+vSnvk0w84WpncGxlv13GYLS/sTiEtL3CMeiPheFGUn/OsjZ2eJmWuUWwR
	 lq8EzUjX6uESLB16BBtmFOvGyMHJe1X4WTgoRRTL64PqfxgZpBf/TkzCjSp+nXSvoVxXT
	 Jq1OV41jKcpZPR40XbJCj8YA8RpdG6fwwTLkrck5S24v39Nqn8/VbqjEcphszr8lXdLmb
	 gu8O6WHduycLs5wiMAKRMabLYJOinv54//oq2ldyVLI6Y6OwZouHGhRrxRY1eHsvExw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662643;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=eDzqy1tULeXNTszCzOcf2+iinDrcG5QqO7OF6d65Da0=;
	b=4VbViUt4ESCB2IlN1j/ZmS/fZUVxHAjE0UaBZUcUe+/bW3zpHIk+FvZQ1nYXZnUmv6Wb
	 hSsXwWXdBfKEd9N/awHL2rRAvqiYvAWLaxGHyGsi/610QUFK/N/BrlkNVPUauKDy/+WOw
	 w+lGkRCZfoquYyMkVLLbAHX5OR/3WAg2gwkDXLkFEsFKB7zgNGnRTLTqAndGJnWQlmo3e
	 SiFjPGR+mHLutZovLvoZQaeVQURaxc9WBIOwwcG6ttC4N2Ulda+gqc/xaTLDvwK/RINU6
	 0lCfJLIfLNuD/TrYFm57VcmkO+xCD7+bsd+xEv5B+qWFlucBkrFTG2yoa7Q7RiqbtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bX3pT+J4;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE6760A2610
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE6760A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bX3pT+J4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=annJA6bQ/Ec79yUg6U2mlYFk7SaR9NGFkearD7QU1dE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792662639; v=1; x=1793267439;
 b=bX3pT+J4xDptPEfAvcBGXXCsf2WpNtKBL6TiuLxATCkfvpMHjNz7hDAdNBIhPVKijNTnTfX/
 H/RQPTdOWbdZTbOgCRemBVvmijw9TinqRy2vU49+kXcETQjF6qp3JGm2cNwYGUnbkbwDQ9IA+hm
 Lnh7BcN9r6GonJikfqXKV+0w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2b8a4a208aa5b25d;
	Thu, 22 Oct 2026 09:50:39 +0000
X-Mizu-Trace-ID: 2b8a4a208aa5b25d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/5] mm: hugetlb: add explicit page size to hugetlb_cma
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1fd7ad70d80ed0da82b90ad5d86de90499a49a54.1792651104.git.zhengqi.arch@bytedance.com>
Date: Thu, 22 Oct 2026 17:50:19 +0800
Cc: david@kernel.org,
 osalvador@suse.de,
 akpm@linux-foundation.org,
 azpijr@gmail.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
Content-Transfer-Encoding: 7bit
Message-Id: <02D8D71D-CFE3-4EA4-BD73-F02191C7F92B@linux.dev>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <1fd7ad70d80ed0da82b90ad5d86de90499a49a54.1792651104.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 22, 2026, at 15:31, Qi Zheng <qi.zheng@linux.dev> wrote:
> 
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Accept an optional @<page-size> suffix for hugetlb_cma. Initially accept
> only the architecture's existing CMA page size. Preserve the behavior of
> unsuffixed arguments and the existing hugepagesz/hugepages options.
> 
> Validate the suffix before applying the existing capacity, percentage and
> node-list parser.
> 
> Save the arguments during early parsing and process them at reservation
> time, after architecture-specific page-size information has been
> initialized.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


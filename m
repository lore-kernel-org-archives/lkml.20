Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959596;
	b=45c2R96z207TDNN7/Hr8sI7HuzaYJiNGJZo/xjW8pdqwSGF+gYBatd85CtmOC70WiWvH
	 uC2u6pt2oF0A/diTsJj+P85Ux+Jk1OuX8waPQDaVTIY5D3S3ques3ajzzuOXHNvcF8Awe
	 F1uJjesimdpGd1K6jEsNv++wqfdOrArbnm1cmn7wMCo8fMCZY7CNIpqOyQxa/OFZAUoHW
	 wlXy58zn6j+6Qp4DhWBH1XY+jAe6NF/uDbbCSEwW4YNRuSyjyLq/YMqqycGVeGrNH/5Qb
	 tSlivsyli/cIsRfDAHWvvFCjIjOVK1ABl5pB3B93WT1EW3xVEYiMQdPTyhpCgvFul9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959596;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KFGqHmlZ7kyyucv0XoyuudTtcwfUCAlrm/1qIgBDADc=;
	b=KLHnvDlv5+XFcw55F4DHoWbftCc918pjZJwJODnqYOs03EecZUMoDrzn6L5SKLC98igE
	 Qrd4vfBmGyBXR+GIQXjxCN1LBizdF93ECc73avoHEIAh7Q9QcyGHjWIp0Xg3v3QiIus8I
	 ImgarAABeAZ2edZAvPh6rHHswvbIMzgPRu1G39TU4wo9PGoJ57WdhCjLJvv0+BWzsWqpD
	 +ETarlAN+FKLMdtvOJK8YYSwomfWetlLvKDhL3M70hC2z1CpRhEXrr4ZfcxbIzIvutbD3
	 pWQClWQAZJQGI+8HNkYchCNE56yqfs8yo98bI8vUh5DAgOLdjI0rj2X0OFNDpGAs85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHJxEDOr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343F606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHJxEDOr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56491F008A3;
	Fri,  6 Nov 2026 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793959595;
	bh=KFGqHmlZ7kyyucv0XoyuudTtcwfUCAlrm/1qIgBDADc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FHJxEDOriuMSmbOrU4SpGNiSBKw/9Jb3uq4aMlW72XQdEaI0v+BxNt2FtxfjKcb+/
	 ZPsDBhnXm8lOz6yhMBT2nLrbPdLZRVXBGuIZzUJPXebDCVraSzlADyzTMcotPyQgU/
	 aTxPZwGvLAZK6QwWmv5JLrHB/AjfTEAn5GYGsbmZVCL2U92/3LEd+E1ly0V8uuPb7C
	 h5mkmVQqo+473q5g29BJQy2CuKty2qQOJtZfqNskDjfEPImTI6UIndQCCZ4Gsm+eRu
	 l1bA0vdJwJSinqCKRZ/5/GusscDywb+rHrmooSrY4uamHQMWQyFvOdjFzFuSoTuEG9
	 w9CGcyUhKyoXA==
Date: Fri, 6 Nov 2026 10:06:31 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Rik van Riel <riel@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/ksm: avoid unsafe anon rmap dereference in KSM merge
Message-ID: <au2mm0Y9PdumuzgE@gremlin>
References: <20261102-ksm-anon-rmap-fix-v1-1-68962acfb59b@kernel.org>
 <179387163181.11797.15205182972949028650.b4-ty@b4>
 <75926835-508f-48d3-a5d9-176cea61546d@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75926835-508f-48d3-a5d9-176cea61546d@bytedance.com>

On Fri, Nov 06, 2026 at 10:43:45AM +0800, Zhao Gongyi wrote:
> I tested Lorenzo's posted patch on Linux 7.3.0-syz-13001714+
> with CONFIG_KSM=y, CONFIG_KASAN=y and CONFIG_SLUB_RCU_DEBUG=y.
>
> An earlier unpatched run of the fixed-pool KSM/mremap reproducer hit a
> KASAN slab-use-after-free in page_address_in_vma() after about 342 seconds.
> With the patch applied, the workload ran for 12 minutes (1027 KSM full
> scans) without KASAN, BUG or panic. The fork/COW smoke test passed.
>
> ksm_functional_tests reported 8 passes, 1 failure and 1 skip. The
> "ptrace write failed" failure is a known test-environment issue; dmesg
> showed no kernel error.
>
> Tested-by: Zhao Gongyi <zhaogongyi@bytedance.com>

Thanks!

--
Cheers, Lorenzo

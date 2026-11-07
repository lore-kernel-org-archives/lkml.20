Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078228;
	b=z61Ae8Wkeq0b/RDXgfHzrC6JCIeI7i8kM59uDDH+ZsbfsFz1HFdKrfPcpAGYafUBFDys
	 QjxhBmSlMFE9XsxcTd0EkMB+r6nG2Y1lYQ7/vEEJqe9ISbShVtPywOxPS8dNqv4fZ6XC5
	 oemWczjK1G33XF+cly/88Q55JRnsbbTTYwucKd52ei1UoNndjLHw8XhvzVNAfHxjgI/sk
	 CxsICDi+S5v04yo9IXhtRbZhvfbs0L981jAopbqCC1NzyfLjHtw9Q4gUwSb1KqqpyJrGY
	 +JvOw8fnHqyFUTMlRmBU/8Vdwm7o6LyUP6MLWGX2UQGNAz/U01fSe+A37NXRmGo3gqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078228;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lJ4KtVsB9A6KdQtHyDSWzGDZO8qfDjYVzuQoYWni7kQ=;
	b=c9ytn6iD1wsIUqPbRT2fUPoTg3JRHm/wxMsV9irEaFQ9ROBQTyZOwiOFXMUDi+jYQgDW
	 XspIPr9COGmCt9d6FMQVmwndc+zdoDSSClv+Ii/yRzbpvTjZzCg7cqTCIc9iMeT1fJ/t6
	 0Zjp7Qryv1md3pxWle43/j5mkZgT3ftajED3E70/hU1MkkrLhrGx2eRn92xfwRfez0rmH
	 CHcQNbTI/I56ta59RHGdG65YbkslPdk1vnNYat+ae5MMfGUvzCjRrY5MiDSiq2btMeRWR
	 iy3ziAy+Kd1xJoo1qV/sPjji752PoQW0FYB3VPK9tD0YxhP46NjrgAtDAmx2+8kxlYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzVLX5sT;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB67A606A326;
	Sat,  7 Nov 2026 19:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB67A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzVLX5sT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lJ4KtVsB9A6KdQtHyDSWzGDZO8qfDjYVzuQoYWni7kQ=; b=AzVLX5sTg/oKXhDrPcbBqSQB+g
	pylToL0+lxcj5wyVkopXiCewM0y92K8b/ji7BQmeLOToWBpkxJ2XACI3CA4odGo1r12WT/Qmz7NA2
	16XZWydiFdDAKTG7DP5aQ+ut6JzElgJQWWQUoT2y3P8quZLTC7sM8G6IpBhQIPLwRyN9N/Xeg6ur0
	wLa0o4CyZaAMcgrf3tHEhKQYnysBx4yLuUh+ui2Atq+Yq+fX1UePAhm0cc910qW0GepNU+SHMHJ8/
	vvg/ljWjCQ3HRUEfGh+EuitxTu5E0FOUE/6k1uxWBM/V4ZURZS0q0wZPRgDFi29qjR+ozIFFO0sXQ
	uWKLznhA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlhT-0000000FCkG-417X;
	Sat, 07 Nov 2026 19:03:40 +0000
Message-ID: <99b56c0e-064b-44f4-bffc-d26b1ecac760@infradead.org>
Date: Sat, 7 Nov 2026 11:03:38 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: xforms_lists: handle
 __cacheline_group_{begin,end}_aligned()
To: prateekshitjaiswal73@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261108-kdoc-cacheline-aligned-v1-1-a79fa228a6f3@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261108-kdoc-cacheline-aligned-v1-1-a79fa228a6f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/7/26 10:33 AM, Prateekshit Jaiswal via B4 Relay wrote:
> From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
> 
> kernel-doc treats each __cacheline_group_{begin,end}_aligned() call as
> an undescribed struct member:
> 
>   Warning: drivers/net/ethernet/intel/idpf/idpf_txrx.h:436 struct member '__cacheline_group_begin_aligned(read_mostly' not described in 'idpf_q_vector'
> 
> Those markers are defined in include/linux/cache.h. A former special
> case in push_parameter() dropped any member whose name contained
> "__cacheline_group", which covered both the plain and _aligned forms.
> Commit 8b00d6fe9696 ("docs: kdoc: trim __cacheline_group_* with the
> other annotations") replaced that with a transform that only matches
> __cacheline_group_begin() and __cacheline_group_end().
> 
> The pattern kept that shape when it later moved to CMatch, which
> requires a word boundary right after the name. Since "_aligned"
> continues the identifier, the suffix still cannot match.
> 
> Make the suffix optional, keep the copy of the rule in test_cmatch.py
> in sync, and add a kdoc-test.yaml case based on struct idpf_q_vector
> that fails without this change. The expected definition still has the
> lone ';' that each stripped marker leaves behind, as the unaligned
> markers already do.
> 
> Running "kernel-doc -none -Wall" over every file with kernel-doc
> comments on docs-next, this removes 34 distinct warnings, all in
> idpf_txrx.h, and adds none.
> 
> The problem was found, and the fix and test drafted, with the help of
> an AI coding assistant (Claude Code); I have reviewed and tested the
> result.
> 
> Fixes: 8b00d6fe9696 ("docs: kdoc: trim __cacheline_group_* with the other annotations")
> Signed-off-by: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.


> ---
> Testing:
> - tools/unittests/run.py: all 125 tests pass; the new test fails when
>   only the xforms_lists.py change is reverted.
> - kernel-doc -none -Wall over all files with kernel-doc comments,
>   before and after: 34 warnings removed, none added.
> 
> This is based on docs-next. In linux-next, the kspp tree adds
> __require_explicit_initialization to struct_xforms three lines above
> the changed one, so the context differs there; the patch still applies
> with reduced context and the resolution is trivial.
> 
> The lone ';' left in the rendered definition (also seen today for the
> plain markers, e.g. struct net_device) appeared with commit 7538df7a2d7d
> ("docs: xforms_lists: use CMatch for all identifiers"). It is left for
> a separate change, which would then also update the new test.
> ---
>  tools/lib/python/kdoc/xforms_lists.py |  2 +-
>  tools/unittests/kdoc-test.yaml        | 72 +++++++++++++++++++++++++++++++++++
>  tools/unittests/test_cmatch.py        |  2 +-
>  3 files changed, 74 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index db23fb650ea8..fa380055191c 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -38,7 +38,7 @@ class CTransforms:
>          (CMatch("__rcu"), ""),
>          (CMatch("____cacheline_aligned_in_smp"), ""),
>          (CMatch("____cacheline_aligned"), ""),
> -        (CMatch("__cacheline_group_(?:begin|end)"), ""),
> +        (CMatch("__cacheline_group_(?:begin|end)(?:_aligned)?"), ""),
>          (CMatch("__ETHTOOL_DECLARE_LINK_MODE_MASK"), r"DECLARE_BITMAP(\1, __ETHTOOL_LINK_MODE_MASK_NBITS)"),
>          (CMatch("DECLARE_PHY_INTERFACE_MASK",),r"DECLARE_BITMAP(\1, PHY_INTERFACE_MODE_MAX)"),
>          (CMatch("DECLARE_BITMAP"), r"unsigned long \1[BITS_TO_LONGS(\2)]"),
> diff --git a/tools/unittests/kdoc-test.yaml b/tools/unittests/kdoc-test.yaml
> index 14d36daa1bba..da396f975cb5 100644
> --- a/tools/unittests/kdoc-test.yaml
> +++ b/tools/unittests/kdoc-test.yaml
> @@ -1696,3 +1696,75 @@ tests:
>  
>          ``spinlock_t *lock``
>            the spinlock
> +- name: struct_cacheline_group_aligned
> +  description: "Strip __cacheline_group_{begin,end}_aligned() markers from a struct"
> +  fname: drivers/net/ethernet/intel/idpf/idpf_txrx.h
> +  source: |
> +    /**
> +     * struct idpf_q_vector
> +     * @vport: Vport back pointer
> +     * @num_rxq: Number of RX queues
> +     * @napi: napi handler
> +     * @v_idx: Vector index
> +     */
> +    struct idpf_q_vector {
> +            __cacheline_group_begin_aligned(read_mostly);
> +            struct idpf_vport *vport;
> +
> +            u16 num_rxq;
> +            __cacheline_group_end_aligned(read_mostly);
> +
> +            __cacheline_group_begin_aligned(read_write);
> +            struct napi_struct napi;
> +            __cacheline_group_end_aligned(read_write);
> +
> +            __cacheline_group_begin_aligned(cold);
> +            u16 v_idx;
> +
> +            __cacheline_group_end_aligned(cold);
> +    };
> +  expected:
> +  - kdoc_item:
> +      name: idpf_q_vector
> +      type: struct
> +      declaration_start_line: 1
> +      sections: {}
> +      sections_start_lines: {}
> +      parameterlist:
> +      - vport
> +      - num_rxq
> +      - napi
> +      - v_idx
> +      parameterdesc_start_lines:
> +        vport: 2
> +        num_rxq: 3
> +        napi: 4
> +        v_idx: 5
> +      parameterdescs:
> +        vport: |
> +          Vport back pointer
> +        num_rxq: |
> +          Number of RX queues
> +        napi: |
> +          napi handler
> +        v_idx: |
> +          Vector index
> +      parametertypes:
> +        vport: struct idpf_vport *vport
> +        num_rxq: u16 num_rxq
> +        napi: struct napi_struct napi
> +        v_idx: u16 v_idx
> +      warnings: []
> +      other_stuff:
> +        definition: |
> +          ;
> +          struct idpf_vport *vport;
> +          u16 num_rxq;
> +          ;
> +          ;
> +          struct napi_struct napi;
> +          ;
> +          ;
> +          u16 v_idx;
> +          ;
> +        purpose: ''
> diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
> index 109141cd2ab8..02d63a51c05e 100755
> --- a/tools/unittests/test_cmatch.py
> +++ b/tools/unittests/test_cmatch.py
> @@ -324,7 +324,7 @@ class TestSubWithLocalXforms(TestCaseDiff):
>          (CMatch('__guarded_by'), ' '),
>          (CMatch('__pt_guarded_by'), ' '),
>  
> -        (CMatch('__cacheline_group_(begin|end)'), ''),
> +        (CMatch('__cacheline_group_(begin|end)(_aligned)?'), ''),
>  
>          (CMatch('struct_group'), r'\2'),
>          (CMatch('struct_group_attr'), r'\3'),
> 
> ---
> base-commit: 2649344d20dfb13e30b560f06138229d8e40350a
> change-id: 20261107-kdoc-cacheline-aligned-75f1ad0a8c14
> 
> Best regards,

-- 
~Randy

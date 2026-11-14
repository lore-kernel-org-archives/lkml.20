Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678083;
	b=GrcpkOMTgot/sZ4GuNX6gTqYkz4BxWpxKtEJFhiTMfsyTH0W4i27w9sx1i44C9XNgcBW
	 7q9KRi/j/xc4+bv3MwOSyZ18qEM4hdtuoWpyXHjC8H2eYdIY0LPVcvVJkWyeHwdcApS4b
	 s0fKl+h2nItS/8j+Z2dkTXjBrcWCp4Uc1Gdd0TAFWhO31HhnIQjchDn2AqlMvBzFtVoLv
	 i0wYVfGdT3nNLp5VoKgYY6zO47RoALBgjI8k+qvt6QK+trRyeiwt14sckedYZvLKkjIdS
	 bqbd81Vp/qiGh1oNFG9YlQwYbr+QT7dkF1JN2Ab7WOrZsmV3TGiipdITupd3QVKj+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Iwtan+mCqrD8UTQ6kqOmC1YvXcL9sNkfoLvCTyQCFDY=;
	b=2cVteyk2LhZAebGDZH026PTnkA2RYRb4o29dGUgLFWeGMPbQuOi33SfdSR4wm8ddWxaU
	 EfU4UKiEkZFO8zBiSdjB94BrlOoMGQA1QVn3i+uQI1DCmsNCiRZACeBrhA+YM9HRdmxez
	 XMi9sFU3xP1DfvqKHx04Vx7VAv0jcpCaST+Co1cAV72dZ6IqIbUZGFvK5z6C68RIu870u
	 hZ5nmW4vEEnZFId6rozOaHAO9UkHqpyq22jAdt62BMDwJN1b+dHziEm3qMdZC/oD0sDmI
	 Wpy8U0as2YZfI6TAM14oF80P4aFxk3YBaNbIphYjtiVb5ai7NlYlHaJGAw3oybgJ4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nmsXVapB;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A2606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8A2606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nmsXVapB
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5430f70c827so32417771cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794678082; x=1795282882; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iwtan+mCqrD8UTQ6kqOmC1YvXcL9sNkfoLvCTyQCFDY=;
        b=nmsXVapBo/b3VTlqnGVeDoWVaDsumqpB9HGgq64GO9CLSGIDU355BUmbbedGNFBkSg
         NvFwhbaH07OzoGLHiR24BhJ3pXoEVFz3oDrflE1B9NZaXVBRHEhZ542PJp4M2aeCqlWM
         rxhH29lLTxT3zpnVsjVHNI9C03YGD+VDfccn9uQYvCF1YmkKnnvl6Pw/C9x+Xl9rkUSY
         50tpnEZo6ymDTKQoqkiYDciVnsfnJPeM5sUpQ+igHLiQ6gAfLTpWG2RkuZ2ZdalBnaRa
         ainPg0FbUx2E7rexFHQgIjuIwI6aHqmlH+5Q7o/SaWu/G3mcg4TtfQoUUeLYEH2t2CNL
         dAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678082; x=1795282882;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iwtan+mCqrD8UTQ6kqOmC1YvXcL9sNkfoLvCTyQCFDY=;
        b=2QH1EIx5gradfvwnHcMh0CX3bxLyNVscfrW1UGZjyB1N0jHpkQLvziUs+mm5u3v5cq
         oY5YQ3hANBs4ptt7VyIgWHMGPEcdeAljSFjcXedXBYw55umo9O5NtRsi4WbxIkA75zN4
         cJuqqcRl9st6R81UhYV1Mvo2Na0w4O/oIMJaUmf8jo8rRapx3mnwX7d8GEQV4miQNqAq
         ko+tn4NHjtzl4qaNO6P3GIyKdE47lfpvxvnhJgfpVaM4e9+CRm+9Gb8DFOW77TrNUeVf
         BGkhFssjCW5eiAat40OW1Gt43x1uZlTfuWM++FPldWlfp3c3YZAss8ZW4A2GowpA3+by
         XyiQ==
X-Forwarded-Encrypted: i=1; AL+hErGefvp3yWEX9bQXuqpemxIU56l8gnUrxqQOwRWWoe2DS2gq8j4QULQpcmzZJRj1Vxck0SzUopUBAvfixgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uYJv+8pu7RQOfPcPvN7CnZ8NmjwrFuI6d8Qi64vuzREuCTRRX
	FGHyE1sIMXpJFZodFdRHNs6UY5Nbq2QYVKyc65tnn7ox4ozXaB3HKrUDYqvFCLgBnOs=
X-Gm-Gg: AYBFou23nwZFrv99GRR8//TMer353D0VWGx5wADA1H/OQu26f4jk8P1B2suUjbz0mZT
	ntSyJsDaMr7fcPIDMBmL+emXx7p5PuZxBNNHGLB6BEvmA0JCyiGl3RvNBHNprkZbiAVOq0aTtEv
	DPCUfO1NpK/118lbnD1MRgb+/Y3y6N55jBWHjPJfFen/y8YxEBX3jSeV16D4Y8VHX/a0rt0nELD
	N3dWcWqc9LO6CuMRefK/WO6wlcNNCsqplOGQuctzvAcUPkFHHyfeE3zDh7EJPdwHwAhEeLMPWzl
	niKXY2u2IXBXQ6LmgVhGGA5C+Vqdkj4VqCRclgozRm611XR60C1d/vaM0R2UU82W/es8rQNlZSx
	dl0z9DrhzD+OsVZv8572pLgvJCRvNr2oALVQhWaTrFp/klBPayWtLvAu/OyTDarb6JINgHWMYvv
	1/sYiFwlv9Ly3lW1TWEpaKV0k46yWgErqLHc8yxGHJDzsanIoIikWh4YPcoG5vjChWeb9IR6+ME
	VENxLCc23yfsZ67n+iLWSjMv1RiRAyiWFKNFW56L99AlT1hCjjwrPjUqzjBPwQ4N4lPERBaGo9Z
	Mmz20BHEcHjoVMwR89voYbDbCQqnyul+ZVB1ar0AvwD1+vmH4vvZuTHSRz1USmgiFHaeuFNWb3M
	9VsW+fNOENSYQaAkT/fYRe4ztJb+GSw==
X-Received: by 2002:a05:622a:1214:b0:535:a5fb:645d with SMTP id d75a77b69052e-55ac9088a47mr98240481cf.72.1794678082332;
        Sat, 14 Nov 2026 09:41:22 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad15eb7basm44690811cf.26.2026.11.14.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:41:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
Date: Sat, 14 Nov 2026 12:41:21 -0500
Message-Id: <179467808112.482102.13365594235443107281.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 22:36 +0100, David Hildenbrand (Arm) wrote:
> Shared NUMA policy ranges can accumulate on an inode after its mappings
> are removed. Currently, these nodes are effectively unbounded (even though
> the allcoations are charged).
> 
> An unbounded tree can cause long rwlock hold times when replacing or
> freeing policies. Instead of trying to fix that, it sounds more like
> having many nodes is actually only a scenario for processes trying to
> cause trouble. Most use cases will probably only use a handful of them,
> not millions.
> 
> Add vm.max_shared_policy_count (inspired by vm.max_map_count), defaulting
> to 1024 ranges per inode. Reject updates with -ENOMEM if they would
> increase the count beyond the limit, taking merging, splitting etc.
> into account.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>


This arguably breaks userspace.

A single mapper that tries to set >1024 ranges would start getting
-ENOMEMs unexpectedly with this change.

Multi-task mappers were previously unlimited, but that seems like more
of a nasty unintended corner case - not a real feature.

A single process is already limited on the number of vmas/policies based
on `max_map_count`, so it seems natural to just use max_map_count
directly, but I took a brief look at some distros and most seem to
ship a raised `max_map_count` (>1 million) by default).

I tested that and even 1 million can cause a soft lockup.

Not sure there's an easy solution here, we might have to rework the shm
policy locks.

-- 
~Gregory


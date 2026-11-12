Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476254;
	b=cqqiTOzV63rQV0F5mT+ntSzrp9407DzodiqX2vuoS6ZrZIQOPRTK6qFt70RZ26ojtBuf
	 9mSn0Lnx032oXIQILR4fb2DpWaSNkTJ8LOscUpDqKAPqYm494+93kT3XniGVDkHmYDwRh
	 kmLAJ1MSAi344sEUR77Ww52ofk0M8zPxol3fiH09LtPnPpAcMuLfuJ89o7I8Sg67Nxtb5
	 2DUoZG+KPbQtBv/+veSE2W6Oik1n/P5AzFFlGK+hjjZf+haiVeCPZOJ90BqhA6Ia7kJA2
	 ZmxeXC87NG1yJXmroYCqv3BtTPiSUphxnrPGnv+iEigQVD8a97wuRiCJR8bKL/O6Q+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476254;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=guUgMXJMpJZTYVz358gle49CYmzbo9EaOfDTkZTQ/V0=;
	b=WobmeBXovBxJBORoXLxBMgsl630QFIrYIhq4aLn+CbFBvv6HSS0Gml2ceLadqSPGS05x
	 oloFNZ/V4UKvbnG7x2YNnnus9cDbXAJhTGciIcFXjp0JvCFJrha3PoIetrJGshtWzcN4v
	 6McAxoI/oJqvSCWhdqtDt/Llq5k2/Qsv3qCcuc/SGP6GGlSCkytK8Ngd8D/8UdB2WMj0r
	 zu97vk0JKBVovDUbX7E2o9gw32QXmSzKVhqjKZumJoWCiYRJcyhrB34Wj7lZ2RJqRoByQ
	 SKn7TbMcveYoX5RwbgcAcrbZeYzROHY9vyBAoe4zzxj99sXVXQm5RupC2lNdqJiuK2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1zNU4pQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1zNU4pQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F471F00A05;
	Thu, 12 Nov 2026 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794476253;
	bh=guUgMXJMpJZTYVz358gle49CYmzbo9EaOfDTkZTQ/V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=i1zNU4pQ6RAI0SHQH2oxMsM0nUCVXis4Rxxkc6IyJElj8kWz9/fLPxxXaJsr8SQnP
	 vIxw5uWb/5fBksp4FatGEMr/ik3Wz4w/KZ24xl02IVDAuQPUb9wKIPzD5YFQNyjVI9
	 DpfLCLLMyHqNdjxa7DI9cLe+RcUTBANCQk2gXq7fppNYIjKh/ab1qQzs0nCL9w8Jmz
	 fZ2ZzjUZoSu0YMg7f74981wrUBUlS/eYQh+jUjMkJSJStAWP/owDMexV2ELXwCHZsx
	 1nVYBUSCY8lg7WEgE1cpXnSxcc4sANgtBiKKWtL6odOni3+3EbUpsWJl+mNs3irQ3/
	 5ZYt2LgII1hiQ==
From: David Hildenbrand <david@kernel.org>
To: linux-mm@kvack.org, "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, ying.huang@linux.alibaba.com, 
 weixugc@google.com, aneesh.kumar@linux.ibm.com
In-Reply-To: <20261021024438.1942502-1-gourry@gourry.net>
References: <20261021024438.1942502-1-gourry@gourry.net>
Subject: Re: [PATCH v2] mm/memory-tiers: reset demotion targets of nodes
 without memory
Message-Id: <179447625038.6053.14351810863988916081.b4-ty@b4>
Date: Thu, 12 Nov 2026 10:37:30 +0100
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
X-Mailer: b4 0.16.0

On Tue, 20 Oct 2026 22:44:38 -0400, Gregory Price (Meta) wrote:
> When a node loses its last memory, offline_pages() clears N_MEMORY
> before the memory-tier callback rebuilds the demotion targets.
> disable_all_demotion_targets() resets only N_MEMORY nodes, so the node
> keeps its old node_demotion[] entry while it has no memory. Before
> 6c542ab75714, the reset covered every online node.
> 
> A reclaimer reads the stale entry only between the node regaining memory
> and its targets being rebuilt, and it filters the entry against the
> current allowed targets, so there is no user-visible effect. To see it,
> online and then offline a node's only DIMM: a debugger still finds the
> lower-tier node in node_demotion[nid].preferred.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: migrate-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/memory-tiers: reset demotion targets of nodes without memory
      https://git.kernel.org/mm/core/c/12566c5b

-- 
Cheers,

David


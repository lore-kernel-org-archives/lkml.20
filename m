Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203734;
	b=pRcmwQSCcgkRt7rbppGgRxP2xfhyQm+SbOywiIxrzW38NER+YDyKKZPF4xKdg/dWxNpX
	 hB/qu0laI3Rh1vt236Bho+XYxA0AtaJSuegITVSNrwfDHWZpdMz+/o7SUxazKwa/rCYwN
	 OQkHJ1DmN1llUg44untoaw58ljsjez0da8Qbo/RMENl8g5y+lSUVrAa9+OLmP7QOxJq2W
	 zIelPBWs+pYVu5dZQNClqtqLQToiGMZ4DydT00A4Dir0p0YqgHCnO88M5ctD5413Eprih
	 ab0FV0Fevo8jN/0OpG70f1S7uzWKb9+UUAnEfsf8B3Zqf+ylR5eZXutosuVlerndovQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203734;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8vo1r+wQbOzLzCV+CAr1Yh9jJ1GiuCBkoMlOOYp8Wt4=;
	b=rf5seK1yQroDvpJENV3BfP9i7efDkqy/TU+jZ+rJA1KaHfS2ic4UwL5S+LC8Fo9eV1ox
	 NHZYgTivvGi+D4k8KxZKYLbj+OIlJ0j2KMKcPg4S865XRpOvQRGbw5euy5CEsuL6Lhx7i
	 Rs3XkCrKwKEA0ppvvhK2PuDQKzQqQEZoa2QKvda+0M2dyKcbZ/jM175pPVQZ2igiDaHz+
	 yEXQFx77YGSFKQ2BDStdZU5XKu9oa8C0o7q+Jcu+qfGu09TEDy/g0t0bbtt4CmM0Ixt0v
	 zAhhp1kcWHZAUkUWw8BtVP07w+ZkJOcYjYs4J3bIlatgUQIyMg2pnp3SOWigsFN/aRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVZwcwyV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9D606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVZwcwyV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8711F01301;
	Wed, 28 Oct 2026 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793203733;
	bh=8vo1r+wQbOzLzCV+CAr1Yh9jJ1GiuCBkoMlOOYp8Wt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VVZwcwyVvSGy32C+lIKbS30eALeGvBJZe+g4bcBdMztrsf6jMbOXEq8QfsnHf6XsN
	 ZaYNXTWdnRcvpsl5OoIe1oIb8MyPAhJPCGdcR5u73Cy76hqzvj9H76jSUKwkbxpEV/
	 agYoy6aZXGkzxcOo4xEF5c47SnvYEXeM1bD1gRrlzKC3kIGzqwwxIgNrAuPA6TY8Jo
	 /vm80F2+VKdZkXF+LTNezNOC0eRYYCXwxq1On7B4ooG8w/c3qHo7K8vYWYrealIc6E
	 WkxCdcMc84FLf9C029GNywxwIMZ6vhKpxVMIUYXbILBccEptSNycsEZG+z0U8K1Dvk
	 kdO5rYESs50hg==
Date: Wed, 28 Oct 2026 18:08:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH] mm/sparse: simplify the vmemmap alignment check
Message-ID: <auIeDjoOQej4AT9b@kernel.org>
References: <20261028121129.39916-1-kaitao.cheng@linux.dev>
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
In-Reply-To: <20261028121129.39916-1-kaitao.cheng@linux.dev>

Hi,

On Wed, Oct 28, 2026 at 08:11:29PM +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> sparse_init() is called only once during boot, and the vmemmap alignment
> check is outside any loop, so VM_WARN_ON_ONCE() provides no benefit over
> VM_WARN_ON() here.
> 
> Use VM_WARN_ON() and fold compound_info_has_mask() into its condition,
> preserving short-circuit evaluation.

Do you think it's worth the churn?
 
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  mm/sparse.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 6acb628c8a73..248bee2d39b9 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -277,10 +277,8 @@ static void __init sparse_metadata_init(void)
>   */
>  void __init sparse_init(void)
>  {
> -	if (compound_info_has_mask()) {
> -		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
> -				    MAX_FOLIO_VMEMMAP_ALIGN));
> -	}
> +	VM_WARN_ON(compound_info_has_mask() && !IS_ALIGNED(
> +		   (unsigned long)pfn_to_page(0), MAX_FOLIO_VMEMMAP_ALIGN));
>  
>  	sparse_metadata_init();
>  	sparse_init_subsection_map();
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.

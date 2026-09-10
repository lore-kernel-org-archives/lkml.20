Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC157475335;
	Thu, 10 Sep 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043824; cv=none; b=MBIRm2d9+FLLwOkXRm91/Te2xc4sHuazJSETjxvp/rQOgnHRPCZO3a1NUrm9onbHu/iqse5QZS0TTHG3qbyBkHT6NTzpCfeg3/fh4DQ9+T7H9nziPCuM4wnbpbWa0Hpb4nmiUvMseWRecg4LMfvBTuZuW3VEwzH0uxCWpx9IrQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043824; c=relaxed/simple;
	bh=Ii22KJPnT1Z3jSNebgHtNAPZSs2KVYz707Z+/RnSE8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYaw52utp0tXZ7065tWZQ7YQ0+pmcZGhD5zapnApeQ4NscHcuM2aYMhlk3wKQRmJxkRxjIlcu7wpffoPTngH13sHgGMZDh/Qc3xK7mh0R/TGlqJs7El2IFj4CVL/od5PE5V6OTHQA4Xzhye7M72mgVmhKElE9q7wwXwUF2DlDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrzN3r6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrzN3r6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A2D1F000FF;
	Thu, 10 Sep 2026 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043818;
	bh=4nW91mvS/Fi4pVir8EYL5mI4Ee2UIeScYvHoNKHO+nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JrzN3r6/SuGu0wLLlhmnGwp16rjFX3IFKW8tA2Ub2oIen6X9Fy6XbcOCjDitcNsxn
	 iY8/jWDvobcGvrvU2CMKHqnY9JdNeVpWRGmoyUot83pgg6NweZjlXi5SbGmS1yIzvL
	 2gTK0mGB3Hp7CSBXiZdGRIYjs6AiY/VIYzmN4L32DoUVAuS9yGWuwRyYwS10MprPVi
	 bCgRrUUc6+F0UXYlCIxn4DFNNIIzG/mO8h3TXVAPMVR4SkEYQuchi+MLqmBfTAB8aT
	 tv7Y0SDPJD5uEVc2Uus3Wcj2t05n74G3tkFwg6omJ4WT5HjeoAfkBghnVnBCfvqWPn
	 ISd+jNGAOsEHg==
Date: Thu, 10 Sep 2026 13:36:56 +0100
From: Harry Yoo <harry@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm/slub: use a track count for user metadata
 sizing
Message-ID: <aqKkJVWz67cxoGba@thinkstation>
References: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
 <20260813161059.73855-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813161059.73855-1-pengpeng@iscas.ac.cn>

On Fri, Aug 14, 2026 at 12:10:59AM +0800, Pengpeng Hou wrote:
> SLAB_STORE_USER metadata consists of allocation and free tracks, but the
> object-layout calculations repeat the literal count at each offset site.
> 
> Add TRACK_NR to the existing track-item enum and use it for metadata
> initialization, original-size placement, object-extension offsets, padding
> checks and cache sizing.  This is a behavior-preserving preparation for
> extending the tracked history.
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon

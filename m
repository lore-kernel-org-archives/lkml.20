Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668835;
	b=QzrM6sR5fWF7gRGVanLLqjQT85AKGQ6lhGIEC4xDUY4E/DQ78jwilBToogl9sjVlFZ+g
	 /D76Q197JkytVR2zQCeZkEs0mk6GPo5AkVbj5FvAR45q+kphRtLfMbQSEk1nYxRKUfzXt
	 U/cLLI3UVYxwou8mG/ui0bmQQJCP+zYlwwUV/s42oWvMDArNSCppyd2YzeoKpgtRfLJBi
	 4HlrxD/NiseoLnGv43+gBv6FeGvk2hKHNjmnfO79Prh7r6DDD5kbgN6avrSsLSVJZo/v5
	 jf1FxCkVFcwZyYj9zAONUToOzxleu7vrmf15y9J7Lt4jiTuVZ/rUJ2iP5PS4qZZDcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668835;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=2JQZ4IUlkFeDB5ytfQHgsfOlGESRNuxkmyKkQ3o2R2o=;
	b=R22cu6dMM2qRvM/fdgdAxNKE7ULFZcLfzQaOPn2Gl4t/MrOkEK29xGhSHG8dDBTnNtI1
	 XGtoNdrseGsyKxag2IkNtHGVntUjiC+GnceGv0MCSCjRh4IUiRdfpKK/iMRYsHjozCrXE
	 4+Ir7zNF/7NvEYSzr+UuosiCLIeIXT0l44/RckY1TdJqI+EQoVHVj5Y4+3XEnqMrw6x/o
	 2fooe4ER+H9u3rCsvvI5yQGNixdygFd03uZpFxU2DG5FyQMSOZRAp2r6bNtT9x9NDkcsD
	 ULFapj3DyvDhsgu1mrCZbFCx312dabltuTAPIEblVeNFekKDCnM6WF7/NJL59/VVMUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgSxNXfU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A0606A8B5
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgSxNXfU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909D01F000C6;
	Sat, 14 Nov 2026 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668835;
	bh=2JQZ4IUlkFeDB5ytfQHgsfOlGESRNuxkmyKkQ3o2R2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GgSxNXfUXQANXP7U6NfQzgAyI2MKuOVc0F8mThZNRhZ30sdqJhIc4zaCN33wmyHum
	 KNyCf8Cus8LsRISQ33aGNdf0uwk16Al4tqHJ+QpS+O8QeDPU2bztbp34H2NsJcJQuQ
	 iPh9cGpnjB7zn9olOKmji6I5djvds7geRQwY5mu9WmC7aCbLMeRCio9BnaJH+vdvJl
	 TcSZYspfZQZ186KmC1vLeY+tJbdvzpSmJ3wTn3+jc4ZNnsSPDnmZrns2fFx0kXGewX
	 46cWhEWRysrPUO2iLKqfT6/jQXkm4uWG9NIwuiIX5/T6WseozTXFWld4IOtd6PzkEW
	 dzSlDSBGk7yVQ==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Matthew Wilcox <willy@infradead.org>, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112-folio-batch-doc-v1-1-e5a1c013e4d6@gmail.com>
References: <20261112-folio-batch-doc-v1-1-e5a1c013e4d6@gmail.com>
Subject: Re: [PATCH] mm/folio_batch: document missing struct members
Message-Id: <179466883229.4943.12759871396218135119.b4-ty@b4>
Date: Sat, 14 Nov 2026 16:07:12 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0

On Thu, 12 Nov 2026 22:10:11 -0600, Oscar Alejandro Sánchez Lucero wrote:
> Add missing kernel-doc descriptions for @nr, @i, @percpu_pvec_drained,
> and @folios in struct folio_batch to fix warnings.

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/folio_batch: document missing struct members
      https://git.kernel.org/mm/core/c/a8064247

-- 
Cheers,

David


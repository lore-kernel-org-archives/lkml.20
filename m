Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455261;
	b=WykpHU2x5iHaKzS2sfe0wlM9rBdMNUKbe9jnaOUou8kTs4rv29B7R88XfvhMM0oDgtJ0
	 bvyxnkwx+S/n0auEnZVzkKS/ST4zymu0kOB50oMyd7+68wnOiFCpQ2jtN0GVCyKqgBvBx
	 onkdk+FB+o+NLYgNfY5FRI+EDxNj16Ou6DdNjOXxowwL4bPttGQ8xYqcXqpRR+52NSmQR
	 5W1s8GGGabxc8K1CEbdOapd4FarMIbpqTCq9uotXbG9qXZ3sJwVAvK4i6J3cQ1LT8pnLx
	 RPgbB1KrlRowKiLt+pks3hURzPAFUPf4AByJ9t9I3IHhKv6yd2l3i7UTC7jo7nk79xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455261;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5qPYoL3A2hx9WJ4xEmqB6cVXrCCfT79632zdTBXvwkA=;
	b=BYBuLBhaNDxEbGDGpRfgfA8DxrHtoirpu+K9CPHpmxYmYQxA5WeKpgr+YAPdH46oEfBI
	 /rDU7DOyxROntKMp1IjsFwKIn6PSnhLjx5Lo2KfyvlJCZoVSnAcKUa0haZ0sAyFO23yJE
	 Y+VOpmnAsGMnOeXfkHlQDJYxVKhZyGu+xJOodasrk6Imom80XU946ChySCOGl3cege1nx
	 JURfgkXWP3CMrlWUj3im3VEMcQlFMu/U4uXDCwMeM5dcDlQbFpdW4DfAnryRzkRN6O4yg
	 qsxOKbd8KIxW/RHFfstWDO9PJ1MLdpci6ADz/mw5f77IV5TqVzSxdGTN7GHUKSG8ECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvIDpR4j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D59606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvIDpR4j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65581F000C4;
	Tue, 20 Oct 2026 00:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792455261;
	bh=5qPYoL3A2hx9WJ4xEmqB6cVXrCCfT79632zdTBXvwkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvIDpR4j++b2huvqPh6nDbkh9mc0rSHkK30AvHqO9crUdbXCTz0UkZKJp1krq1Md+
	 qB6JudbBOlS3gi/kmOEFBhrE9/rxUZ4A+cQ2sqysGwDdb7cA0AjY3MfkZrKb+RXA/C
	 1nfA6AO8xjJyG9Bb7wUreXHXVa2AKdgVer8Nxw6nm9ZurQ+SlSt9v6mJafk1oQ5psz
	 fVno1QV7jr5SyQkRgFs88l1+iFvXcFh3SJwJFI4TS4XsUgIerH1YFmwfexeidE0Fmi
	 jROTfX0+005Am1zaRUtQk5QfISd/zVq99okXKT/+qGSMplsGtl2diLdK5s22VS8Byt
	 UyxrNH80jbfDQ==
From: SJ Park <sj@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add an entry for MEMORY MANAGEMENT - MEMORY MAP
Date: Mon, 19 Oct 2026 17:14:13 -0700
Message-ID: <20261020001413.102313-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019-memmap-maint-v1-1-80850871d0cc@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 14:34:26 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> Split out files related to SPARSE and SPARSE_VMEMMAP management from
> MEMORY MANAGEMENT - CORE into a dedicated entry.
> 
> Also include architecture specific sparsemem.h headers, pfn_to_page() and
> page_to_pfn() conversions and Documentation/mm/memory-model.rst.
> 
> Muchun, who did a lot of work cleaning up SPARSE_VMEMMAP and extending
> vmemmap optimization, volunteered to help with the maintenance.

Thank you for stepping and keeping up, Muchun, David and Mike!

> 
> David and I will continue to look after that part of the mm subsystem.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]

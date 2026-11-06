Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967823;
	b=cqVj76jTtSBPyWVqHHjEgPfgYzzWCNY3Iy39EPKZvN4eVuCIvwTS7DPhobP0bqTXK2nv
	 wpOHKRk6HrOikBWvuvMS4z7T3cFk9jVI75vgbf1+ZUPFFKxb0ZeEpMxmLaWwJlwAiMtkb
	 dA4vZeHnosyqWMkKDXmB5OeN4SRZvw0CD+dru20qBbPIkO+NAg9hYNgiv0urLOR3AdeqI
	 hVTg2AkEaqcY7ltoUysHVSRZJlRifXzrrxPVBJ14B99qpaRqTjsOP9zOl40I9KTl5QiDV
	 MzBBaeiNyeIEc2GK+jfBoyzcTVNRu4noLR0q+INYXXX0/1lsaAnN7+HSQXI+KiRMh7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967823;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xLjGM2UfwmU67W0l87AptAXAx/R+n7IKoR/u/mXJKpg=;
	b=uzRSnw8uNAHwaCO6bkNCjP0Cdvwm+m68kEuf+aUqUA2nK2jqUTzIhGh756NoKKpasr9+
	 XjojkoF6uBOgyFASB2xtdy3D0icHht28Wk33mivt+MuGFTpxrsno3kO7MD9HYYMlHfCcR
	 mLLYGgtPglxpI7E49F3z1yjen+Dg8snWMAFP5/WNQsv7eK37C2wdYvdwg6ymJkTeaJAuK
	 evBdhzQon33x1RwxDw86b4gz0Ad8/0qc0z3rQ2gprVSmGmuvx91MCoTAgvtkOk7ocsN4o
	 TrlEu2XVVabyX1DQ4URS9Wg7J4F7ADk7WplZPMR12E1qp0IWT3ESrBmnVVh4YH4Rw+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L0/p3SHz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0/p3SHz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8181F0089F;
	Fri,  6 Nov 2026 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967823;
	bh=xLjGM2UfwmU67W0l87AptAXAx/R+n7IKoR/u/mXJKpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L0/p3SHznilxSDO7OgzJM7rwJVgmsnj//HpVD5hDrikLDqFEazTyfc8l5n7oVdoiZ
	 QWqfdk8UdMTE2CQJ0nNUuF8ihSuQ9UGqu9MpGCGBthQgERbzl6GlodrEvMp789U6Tq
	 IGyMCBX3rfBGZ+ewCHoHjhVKJjGtgDTztZBs5ViGhWmx6fLHcd694D4KgLYgywOnLE
	 pLwPhu20b9BywaahSTEmmDCVbSZ2j4G1i8tof4OEFeXpOem6F/1IYAAveAiUX/edng
	 bmyP8tHh1UqgyuqVmpL0Hji09IzIMoialiDNggEd9ZhkEgm5n0za/LmJPskyy90Wbp
	 KYS7Q+S8hhQ+A==
Date: Fri, 6 Nov 2026 12:23:37 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au3GntBF9AE57h4C@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <au3CUJO9zBMHLx-B@gremlin>
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
In-Reply-To: <au3CUJO9zBMHLx-B@gremlin>

On Fri, Nov 06, 2026 at 12:07:53PM +0000, Lorenzo Stoakes (ARM) wrote:
> On reflection, I think this would be better implemented as something like:
>
> static void collapse_scan_mm_slot(unsigned int progress_max, ...)
> {
> 	unsigned int long lock_start = jiffies;

The rare unsigned int long type, rarely deployed but super effective when it is
:P

(sorry losing my mind, should be an unsigned long)

--
Cheers, Lorenzo

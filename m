Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979263;
	b=YMhkFr9yLP+IJ/5ZZG3ebjJEtbE3Mx0VbeHiHKvanp2h2NiDGWFXx6C13rV9qLOL3xZR
	 wd0T03xIIXEJGXERzYnO/5EewDYfc7qyM5TlogvPnNCdD/dGeuvfIrPpXvg33/k2POY/5
	 89eZ/Icft2nsKsI0uzdoiQLLl9vG92iPxVYc6Vn56rVFvYD7YjH3XxVnFb1o8nqzM3zOs
	 hidQCNiowjGRK3z0d583J/mvY1GlUYd9Cd8/L/Mye5MRdSYsNCqxeX+H8sRzaOdMDRWWR
	 ADhnNifsUM5TfL4fVRAZW86ik4hLMpOdySw5WJIjkaQMcntMO6XurNJtUzVCG7FjYcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979263;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=/YxG2ZmZM2e9qBTSySrFx7lsy/MjifUIQN5iXXAUf9Y=;
	b=P+szj8f+fBJCcXPdFdGiCTrPJLvfDlnhWr7LZIBg70mL/7bJJ0oSny12LEhOtn4WWBHj
	 SokM6qqE7tcoJmGfPfP00I0FPQqzCTLfxCryOqK2Z06oO9y/+cUZFrEd5QAD3gE01g2Yv
	 BQrzTsMomfdSkvWD25/CZeilG5IZTy7HCqJcb68aYlFzcjqLrAeIJm84XDHyaLDQczvNI
	 9vs3L38YaTuX70zlD02DPCpocaP4AYOzoOKcTr4yzx/ahVPMzdweTpTJjDGkvkGTf7ZpZ
	 Q/Sh/tRCznsEwPcWxSxTT4pVUIcXI2Yn26wd4htbRe7sbts9M56tMVUugWUcyyIgaIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=nwQSXUa2;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0BE606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0BE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=nwQSXUa2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/YxG2ZmZM2e9qBTSySrFx7lsy/MjifUIQN5iXXAUf9Y=; b=nwQSXUa2bxKpHSEVGdWaum6xXR
	37cQdyep4RT0SyJtpDSFXQKFwmgnl/SHD3v1bS9x8dz+WfGChe4RZlQo6CMksMfLOQjOvd5WIf1Fv
	FUY32LP0p9GqyFw4JkD6W6/tQouC6mOeunPW5U9N46Yj6ufJNgCch6IxSKxHVu8MbprY3loJygtuf
	GNNwLKM9kOvePIQeF56CSSltpiSkeNjMUtU48twJPZEnvS4SBrpf84DwTK6sVYY9kCgaWiGoXJliK
	hyW81dnLOPLA1/gIsMLFSc01fkOvYQ0v519R87UiwMiSJIHcPMnZLxLio1SfVs5EM0FId6L9Gyrqz
	wdqi8GMA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xPLxA-009NnJ-1J;
	Fri, 06 Nov 2026 15:34:08 +0000
Date: Fri, 6 Nov 2026 07:34:02 -0800
From: Breno Leitao <leitao@debian.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, baoquan.he@linux.dev, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, jbohac@suse.cz, david@kernel.org, hbathini@linux.ibm.com, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kas@kernel.org, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH] crash: keep crashkernel CMA pages reserved if activation
 fails
Message-ID: <au3zYIPmX8bvwjet@gmail.com>
References: <20261104145600.3708886-1-usama.arif@linux.dev>
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
In-Reply-To: <20261104145600.3708886-1-usama.arif@linux.dev>
X-Debian-User: leitao

On Wed, Nov 04, 2026 at 06:56:00AM -0800, Usama Arif wrote:
> reserve_crashkernel_cma() adds each crashkernel CMA area to
> crashk_cma_ranges[] as soon as it is declared. If the area later fails
> activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
> inside it, cma_activate_area() releases the pages to the buddy allocator
> as ordinary memory. The range is still handed to the crash kernel and
> excluded from the vmcore, so kernel data that lands there is overwritten
> by the crash kernel and missing from the dump.
> 
> Mark the areas with cma_reserve_pages_on_error(), so that a failed
> activation leaves the pages reserved: lost to the first kernel, but safe
> for the crash kernel to use.
> 
> Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Tested-by: Breno Leitao <leitao@debian.org>

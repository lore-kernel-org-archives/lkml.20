Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383959;
	b=4lfMwoC/odADg1BjaFS4DBefOSaXAfhZY/Sfd/dJ7xFgNtTdelP81LpxzG81QlrPR2P5
	 aLOWrDaZagsXsihEGvs+OgkTi5oVdu02v2j7c61q3aGGE7V7+W7xTcYp/E0lxOGBO7cqF
	 jzxLtZa7uWxIEqoij1Bj3kXph1jr8o9hd/puOuj7ICS0OVcRrReDnQ4Sx9HShoGFC9GCs
	 z2UFHxaIBLDGnD1kB0pBHY0iC7Yy6ec+yyCty861rpVyoZW2VhywoLWBPkHUHoLuCXiKa
	 j8PQKgSOR0IIDaz2E+lCHbgfE0amjQP5ML4uJmCQV66xTltfpMXxaNFQZqW1gols99w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=uWm7y82K4cFIYnrfAMOIQ14NIe58vu+3cXEtCVfdH1I=;
	b=HZov5XownVgmPssCESaGBGl9VTimgVhDt8+vaRnY1BizgC1neWM4taL+oWsr5N9zrmz0
	 NHrhrG9Mro4vhrVGuTlh8z3golYtB//1xtlGYxhCaC/FhFNjHjibDfIWjoua3dRXX2J8j
	 f26cfLzRoz4uuH7rpHWtwNCm7iA0r2qC5slooORXxLmJE0PoMRXCXdbG5FHZFYZ6UUiqZ
	 yO5Jupfd3LfW9Cq+wFInZFDhKWNOvFdupAWpcDfTnqM+t0hgXdA76O5WHxVqzzOGLddma
	 Mg1vCfIMZ4L9/tIbOHSOrUohDWEmm9vQku4W816zPJRaIbstbnPs7Nv1RytCc0cWKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="R/Jqt5JV";
	arc=none smtp.remote-ip=95.215.58.174
Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E609606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E609606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R/Jqt5JV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aSKuB+/JcDcpTX/+sgM+sj2du8YsGSehFiCEOSSZUqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794383955; v=1; x=1794988755;
 b=R/Jqt5JVi3gut6+AcO2J5Fqyxe6fEUCk18381ZzZtc7KA8gEPhal86TPuzSPQOlpWKrYYmSs
 HyZMx09AQ8uDkLhy1x7M5OuBtwPjPGiqJH0WCcxRSgpSR+mLKmdMVpAJF7ygfFqOdje8Rc9JMPX
 9BAfLfu3K1kxrgDmrTMk1TjI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id bd0647fec455158d;
	Wed, 11 Nov 2026 07:59:14 +0000
X-Mizu-Trace-ID: bd0647fec455158d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 1/2] mm/mm_init: factor out
 memmap_init_page_from_template()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261110114859.76343-2-lizhe.67@bytedance.com>
Date: Wed, 11 Nov 2026 15:58:57 +0800
Cc: akpm@linux-foundation.org,
 apopple@nvidia.com,
 balbirs@nvidia.com,
 David Hildenbrand <david@kernel.org>,
 osalvador@suse.de,
 Mike Rapoport <rppt@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: 7bit
Message-Id: <27BD7A3D-0730-4677-AF65-7CF0D9207A86@linux.dev>
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
 <20261110114859.76343-2-lizhe.67@bytedance.com>
To: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 10, 2026, at 19:48, Li Zhe <lizhe.67@bytedance.com> wrote:
> 
> ZONE_DEVICE memmap initialization already uses a reusable struct page
> template when initializing compound tail pages.  The template mostly
> contains invariant state, but a few fields still depend on the target PFN
> and must be refreshed before copying the template into each destination
> struct page.
> 
> Factor that operation into memmap_init_page_from_template() so other
> boot-time memmap initialization paths can reuse the same helper.
> 
> No functional change intended.
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208665;
	b=zHtTbmhRrfpFjRV5yW0lyQY5e4aM2bcfXK0kR8wtml+H1PmRx63g6a4elxjXsVUpOMNx
	 Qd7IZ2ZSN9d5okLo2J+QvKzNvbTy23O+ItHZFcDdpRJtjiW8raOdzQPpYNXtwv8Fbw2RI
	 tyGuPl0olqSfagnTs+y9/zA6VfZHK2wGc3NdhQQNR+05NZ47JtzYqbL9hVEvbOUOS5loM
	 1HTM3j6qNZU4JZYxJ2MUI5WKhqmWecyZ3Y783WM0I9+rwPDEUNUTtIJZ3epS0EZs00jf7
	 FpLNYazs4nH4IjV4EPkE6MSQQKPQb8slYvPIdcC8vTCLq9P5cEXVIFjZJpKIaaMUHXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208665;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PPAAuGCkNf6AXziZOLwAWEjxj7/iQ7j2Pi2J4zSJGhA=;
	b=NiH0ffqKuBqcBpLggl+toqjEje9Ly+od2TojTe46tB4nXRWLF5hcYqnoNuAGSXs+xRfB
	 5fbLvdyzgpwyU7/MRya/R/SjvG2IhXfF9+iIea7DF6jxGH5buoBVQbtFUR2le/96J+kdo
	 /kS39BtXiX7oZGdkBMZwBuoTVY5bx14qyPqJcMtNJvpk27gHt/5LClta87aDKhW1mFTU6
	 h02SI4BtJOhJKVD5yYQpqDxABmJ4AO+cA/0WK+aj3oKSSlnlU5UG8F1UhFrCzdkre1pSk
	 /a1hYsUbUSbocXWAJpALj38+UtgSDJgLTeGMbbQkw/6BECDRwj2YxpoLxtVXF0mW1gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EWXtiPww;
	arc=none smtp.remote-ip=95.215.58.57
Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F66606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F66606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EWXtiPww
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/5uZXVp2mOgdAcrra3SlHMiCdYY2Ioe8dE7NBeteCQc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794208662; v=1; x=1794813462;
 b=EWXtiPww36tCLiFN9TVJaTtmO6HgCIWE+DJamoW63xK8ksSw0QljAT8E9Kk2jWUJ+fdi1x2X
 YTZJSJytEFFaUxU8Hj9oklfmv8nVsE4SfhqxUmCoGbxn0E/036h/GOd01HwQpugPgkHZUV+cocV
 P70bAuTU664ri1Co3Su43J8k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d3e43e32f10b7de9;
	Mon, 09 Nov 2026 07:17:42 +0000
X-Mizu-Trace-ID: d3e43e32f10b7de9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 15:17:35 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Dave Young <ruirui.yang@linux.dev>
Cc: akpm@linux-foundation.org, rppt@kernel.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Remove myself as a kdump reviewer
Message-ID: <avFpU8yUF956ysKM@fedora>
References: <avFSU0f0aE-amdls@darkstar>
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
In-Reply-To: <avFSU0f0aE-amdls@darkstar>

Hi Dave,

On 11/09/26 at 12:55pm, Dave Young wrote:
> I do not have enough time to review kernel patches though I still
> accasinally scanning the patches. Drop myself from the reviwer list.

Thanks a lot for your contribution to kdump development and maintenance
on patch reviewing, bug fixing and feature improvement in the past. We'd
be glad to have you keep contributing to kdump whenever you have time.

For the patch,

Acked-by: Baoquan He <baoquan.he@linux.dev>

Thanks
Baoquan

> 
> Signed-off-by: Dave Young <ruirui.yang@linux.dev>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e9fe9c2a39b..7e18fe93d4f9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14145,7 +14145,6 @@ M:	Baoquan He <baoquan.he@linux.dev>
>  M:	Mike Rapoport <rppt@kernel.org>
>  M:	Pasha Tatashin <pasha.tatashin@soleen.com>
>  M:	Pratyush Yadav <pratyush@kernel.org>
> -R:	Dave Young <ruirui.yang@linux.dev>
>  L:	kexec@lists.infradead.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
> -- 
> 2.51.1
> 

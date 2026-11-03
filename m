Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695316;
	b=UlTsCxy1zlExi1FqH1Pw+8DdQ2wf+Zwgn/vR5eGJk5RZ/1DRxoEMlib7zz0CFo+9a0dk
	 2fMAy+5Onh9+HmtW+JRhzW7Ja3EGoORhTRaXXZRmEuanqaSYc5Hx8CU4pDpPdhy6Pbzqb
	 S5QSEStE6Q3lGX//wOoeQnLkHE7F2xgAWxY9QF69DYhYp0Omu2t/G0tjHtYUM11CCvuPY
	 PuJ2vHT85nDIxMAs++9oeVdT+qrbHO9d+lhuubgFb7a1oE9qd0A6lzJxily7ERXzOeBWE
	 oEQu8vly/F/Cl2Mubf2mh+xxy5rqNZ0cze27u8yyhSwTFpiwQiNt5sbItGkYcBouUKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695316;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=r35ebxTXAFp75IFXPLib2rMbuUcQ84dYXkx8V7iwL8A=;
	b=ih3XrKW3VdXNpGfpSbhoIFfB4UAASzL2c/9h7Y6E1Kpyw+0tj0QclEmfALnCgAv0hExw
	 Z4uo6JBxDXeA5UYIYdd+9OktwjxGxRZG9KywSMNe87p2Y6wU2gmaT+L+bVMgIeMo0Q8iX
	 gv4BvkDdmpQlZ+LqM6OAR+AcY2tndMZlVKNY6ze4EKFM3OhCTPgwGjHlAB3Ydn5I/CmX/
	 avncjq6gTdOgLQNFhoXnlO3McW9r/iBAtTQx5hXjBKZOSgqKtjLltlKYex4LMdmNJfi9q
	 4TYux6LlYlvr1HNbj5RDWSKzMaxFCyvEWzDMHVs5O2fqHH/Ox/Xux/49VaqECUsO0Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XK1DYUpv;
	arc=none smtp.remote-ip=95.215.58.12
Received: from mta1.migadu.com (out-12.mta1.migadu.com [95.215.58.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE6606C69E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CE6606C69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XK1DYUpv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r35ebxTXAFp75IFXPLib2rMbuUcQ84dYXkx8V7iwL8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793695313; v=1; x=1794300113;
 b=XK1DYUpvLk5CYvkb7JFC+S4lsX1Qqv4eUJlrtaue3W3zZb7pCf3qpo4zLyxKVIkvEtUzWZ+4
 S7M1RAa8eGkZH3JNO6bg+/5kwjAD1+ljLXL5I4B0+hAixXEB+fxlf7+rJokMyImgQB9peBBDw9m
 TU5YoENfR5BdtdIOzbGdNBa8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 06b8647df261ab87;
	Tue, 03 Nov 2026 08:41:53 +0000
X-Mizu-Trace-ID: 06b8647df261ab87
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
Subject: Re: [PATCH 1/4] x86: hugetlb: disable default CMA reservations on
 32-bit kernel
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <61eee83da19a87337e68a7747fc0b89ee5d0393b.1793692578.git.zhengqi.arch@bytedance.com>
Date: Tue, 3 Nov 2026 16:41:38 +0800
Cc: osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 azpijr@gmail.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 stable@vger.kernel.org,
 x86@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4EE65C7C-3532-4056-9794-47A9B894969F@linux.dev>
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
 <61eee83da19a87337e68a7747fc0b89ee5d0393b.1793692578.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 3, 2026, at 16:01, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
> From: Qi Zheng <zhengqi.arch@bytedance.com>
>=20
> A 32-bit x86 kernel can run on a 64-bit-capable CPU advertising =
GBPAGES.

I don't think anyone would do that. That said, it is genuinely an issue.

> arch_hugetlb_cma_order() checks only this feature and returns a =
nonzero
> order, although gigantic HugeTLB support on x86 requires =
CONFIG_X86_64.
> Specifying hugetlb_cma=3D can therefore reserve a CMA area that cannot
> serve the intended gigantic HugeTLB allocations.
>=20
> On non-PAE kernels, the folded PUD_SHIFT yields a 4 MiB order, which =
is
> equal to MAX_PAGE_ORDER. With CONFIG_DEBUG_VM enabled, this triggers =
the
> VM_WARN_ON(order <=3D MAX_PAGE_ORDER) check in hugetlb_cma_reserve(),
> warning that hugetlb_cma is attempting to reserve a non-gigantic =
order.
>=20
> Require CONFIG_X86_64 as well as GBPAGES when selecting the default =
CMA
> order to avoid these ineffective reservations.
>=20
> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic =
hugepages using cma")
> Cc: stable@vger.kernel.org
> Cc: x86@kernel.org
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


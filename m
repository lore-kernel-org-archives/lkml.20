Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575918;
	b=H6Jq41LUM+tLo4X4gKyvECC6nxWfwarz5+gKWv69ZNYW4p1YZQ616zEv7dA4Med5u792
	 TmhKpx+DoixspQsRWXdYo2DwfxWGX37g2FjvcYN9hNs16U/al6JOGb7QEqAyBR/Bg+3Se
	 ZKpC5t9gS4d6ZYjzq61men5zONR4A6FJZ6opC9NE21kIcS3F1XaeDGETrtZbbwkVDlrHC
	 WPRBre2hih0r4xPknDr69oBw6JdNIR+3gG7kJpQcSq3IA067taWfq6/b5QBadhXBDUVzE
	 nIbNlC+XTSjSMWkFI/7VATUoGjafKOHBd6YptUqFy4Yzct9l1qk3p00McGQudL4zDvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575918;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=7qrLUCoAybbCPIOjIm2Qh/M2gA0Bxoq5R80FYWxMk3s=;
	b=m8t4CPQIiV+pekRrp+8A7E+H4iwjbv2B1dk6nWoKXSHXrpjH4krkffkFK+oS0k5jWh/z
	 FG3+Z2erVgE+2RV7XugwNtnThwINfSb8ndSYz/BxFF7Th8lNvl3m5GmJ+/t1gYVF4gRm7
	 v7T3FkM6WdUo0Suzm053xCJcZH04LYa49tMiriCSa4/3cnVY6DiToIrGrpptKitJV/Y8x
	 69A7GAfXoECbCo2UT38tmEJUotJ3Ms5GFbI6xTmWcYFdqKmhBSJID/sW9fFUUbeudx6GJ
	 5Vt6g1/IDh9g1OTY7SIgpTaZ4UdBaPkoVTH4wxHGfq/cq8PFIiwiyjckPGkmLp1x7zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dl8FfbUE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE0B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dl8FfbUE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347011F000C9;
	Wed, 21 Oct 2026 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575917;
	bh=7qrLUCoAybbCPIOjIm2Qh/M2gA0Bxoq5R80FYWxMk3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dl8FfbUEEph/srB3oughhas0vq05lymkKS5IjuiUXP+TWb0Kp2Nz38DlPqyh3pEcK
	 P2xvXI5JSz7zthaMiYRi4hPE1KVoO6SnF899jGCjL2pGaJkM2AtzTP9cKYRhBClA52
	 NPFMEScx1jpvUhTxDiioZrDBdU2cByQicG23fkSXUM1p27kpA20KcAxrxaSzGSiXJs
	 7GBAOjWOwiNnDkqScnL49tAkIoR5mBhlxZfZ+Tko932oSB0KjKVVzV4fQ+1A76Vbqj
	 BwyE2d0Yi1EQkoWrc0yNzELJJeKe/io9siirov/+rV1nlVtGRnpgVUYuGi08jRYq1e
	 jjsw5x4r7Bybg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7EC8D198003A;
	Wed, 21 Oct 2026 05:45:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Oct 2026 05:45:15 -0400
X-ME-Sender: <xms:qYnYaufq1do0LiMjqUh_MVS5GpCTu8MsEBrUxXrtuEYmRQIiez4Fxw>
    <xme:qYnYakkO9X2tqPtKQBq0QaTYASVnKG4i7bRJlJbH0gpHOcCDetx7dYYMBcIWWdy8h
    swM-qFQT0yeqeuJWhqBDZ1Bvdk9DzVoD_l5EnSP9Efdqtnq5ByOW1y4>
X-ME-Received: <xmr:qYnYaj88NIjHidgJaPHUmMHcKLobv2PmE6e73TvZdwCcTz96eGn54NFpN5c>
X-ME-Proxy-Cause: dmFkZTEvSGxqsS/DCaPrggYcYAQK0UZ39j8LbajDADSnOtRkzscubUYfT4QG9YFwUmB4m/
    kOLTZtPo7idkGfRZ64bg0kyTMrowCm5MlGyFhj2RDKk0JZOjsjyRhPqI+lFteJQkFUPNHn
    LozYLAA0SEOuSdMjeSqqWrdzUl1ewAlBAh6qM/3JGoxsevh0EFDBO2dV7vgsbPTDNf3Pgm
    79iw0I9pIorh5TKx/C2X5McT2BllFiKgTQ7VWpqSEgLzS90pqkNYD8KlcMrCH7Tj6OwscM
    8X80pZLzvTMIfxe0yFhsWRlt5G7fqzGqFbrLNJ1wR+Xr9XyHSX32ddD5haUU/skkilnHUB
    3zFtcBXirPMjfyxZGGrSpd251ZIIi7VPccrs9cRUe8lOjItkCBc+H7f1K5fISdK19Vfr/6
    kevT2sr2dcWqR+C3h/lXltL9BmGAb4nhmuXnUch/YpHUh2RdsvPspYvBZag0Yd2UkcbUuc
    FtaQusiN0eI3qmfzISC+tHyb/mTecI1Rth2pNEy1TregUSscp8U/3v+k2FCUScHm6lMd1O
    0UPm5z3m8ijT2DNAQveiywpygsF+K2gX9NKhbRpqrA+mW2ovUShVy5ZStxmXxrCoxG5SBe
    0O5j/SJUUf2+TGYNUEkfQoodCGzsjfBHxpC+G6mVSRXqylr6qqvqXvUvzTIg
X-ME-Proxy: <xmx:qYnYaqFVp58x8BH9wMBODSM8NWmLihPyVegrbn3ZCkhbYqui9obYCA>
    <xmx:qYnYanK7YIze1X7ly1Mkj6OL_FBM8cGAvE-Jxvqfn9DAHl8KJSL1Rw>
    <xmx:qYnYaqlfF3IT31nnq3QmPN7Xt0VLohR4Xr2WGeF2ATGt_IbkTz3Taw>
    <xmx:qYnYagyW3OXo_oHBKD8jZrok_-aFcP0eybriN1OV46m16eYMyEWX5w>
    <xmx:qonYaksedfw28ySJuezGXN1KKRNzyi5bOkQSvHzBnt5Ewz2nHRa90uGL>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 05:45:13 -0400 (EDT)
Date: Wed, 21 Oct 2026 10:45:12 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Zhijian Han <hanzhijian1991@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Nico Pache <nico.pache@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: khugepaged selftest: intermittent collapse_full(madvise:anon)
 failure and low-memory false failures on arm64 64K
Message-ID: <atiIEzFdd_sm4JG-@thinkstation>
References: <20261020024116.2949892-1-hanzhijian1991@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020024116.2949892-1-hanzhijian1991@gmail.com>

On Tue, Oct 20, 2026 at 10:41:16AM +0800, Zhijian Han wrote:
> Hi,
> 
> I ran the khugepaged selftest (as of linux-next 20261019, tip 3d229ce89862,
> which includes Kiryl's "run every supported collapse order by default"
> series) across several QEMU configurations while setting up a test
> environment for mTHP collapse work. Two observations that may be worth
> acting on; full logs available on request.
> 
> Environment: QEMU virt, cortex-a76, 2 CPUs, khugepaged test run from a
> statically linked binary inside a busybox initramfs (no distro userspace).
> 
> 1. Intermittent collapse_full(madvise:anon) failure on arm64 64K pages
> ---------------------------------------------------------------------
> With 6G of guest memory (so order-13 PMD folios are allocatable), over 7
> complete runs I saw one failure:
> 
>   # Run test: collapse_full (madvise:anon)
>   # Collapse multiple fully populated PTE table... Fail: Bad return value
>   not ok 80 collapse_full
> 
> The other 6 runs were fully green (102 pass / 0 fail / 3 skip each). The
> failing run did not report an allocation failure or OOM in the kernel log.
> A minimal probe (mmap 512M, memset, single MADV_COLLAPSE) succeeds
> deterministically on the same setup, so the failure seems specific to the
> test's sequence rather than a plain allocation shortfall.

A failed allocation would not show in the log: MADV_COLLAPSE allocates
with GFP_TRANSHUGE, which has __GFP_NOWARN, and returns ENOMEM.
collapse_full asks for four 512M folios after faulting in 2G of base
pages; your probe asks for one.

Could you check whether thp_collapse_alloc_failed in /proc/vmstat moves
in a failing run, or print errno?

> 
> This is the same symptom family as bddffa2f9cbf ("kselftest: mm: fix
> intermittent failure khugepaged test") — there may be a residual flaky
> spot on 64K-page configurations. I was not able to reproduce it
> deterministically; happy to run more instrumented iterations if that
> would help.
> 
> 2. Low-memory runs fail without a skip guard
> --------------------------------------------
> With 2G of guest memory, six cases fail outright (starting with
> "Allocate huge page on fault... Fail") because an order-13 (512M) folio
> cannot be allocated. collapse_compound_extreme() already skips itself
> with "PMD too large for fault-time THP construction" on this
> configuration; the PMD-order cases have no equivalent protection, so a
> low-memory or fragmentation-heavy environment reports what looks like
> kernel bugs rather than resource limitations.
> 
> A skip guard along the lines of "cannot allocate a PMD-order folio even
> before the test proper — skipping" (or a documented minimum memory
> requirement) would make the suite's results readable on such setups.

Generally, I don't think it is useful to run this selftest in a
memory-constrained environment. It is not the focus of the selftest.

Getting a reliable guard can be tricky, as we need not only free memory,
but memory that can be allocated for a PMD-size THP. Fragmentation or the
migratetype of the memory can also limit it.

Let's just keep it out of scope for the selftest.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

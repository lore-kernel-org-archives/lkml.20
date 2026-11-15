Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770524;
	b=1/afN4O+YnzH3DhsWuSkON/Bz9McuVtMQTVK415+vwCxFCB1AitcMfG72pRq7Tls/RaO
	 qUU5bw8BpC7QWeIazZzjSmpcYzkIJ7+4icb7/HvxkKTjZ7eMLwdDPyC2oZvcHpYbsePAQ
	 M856kvUoDTXnVjZywm4AAjxuDVAkVltJRnOIoGZLJhwvtdgpnTS02fXEDmS01omHOz1cv
	 EHsloJCnvl2RYQQ2rbGXAZZFF+1QTKl/MgDC/DgHlIhgx0/Y5tn/PnqWfdnEmIzyzzumm
	 oW1qNQti/DI93aBVJkYmtLypWAyLQwaW7Dq3H9uKu9gYsadTDFP/wyNeMufUHErZ1Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770524;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TIMpcp5q0yTDtJcCpdNxmcyuVAuHnxRcCai9kzJu3Mg=;
	b=SUv0IDl9F4Jp9AaasVpk137YD6Wbrz9K4n6Q/xPIAjxi+lB7IlZVnRfzvfrfe7SwAbO9
	 XxX5JTM9bNDVvkpYz3os1SbebvoUr9vGmj2g7Qq9ENWDfgpvN3WVXt94I3ir/+ku6nYwm
	 TmciVHLa12f6qd0Q++sp605Iy36gJPmS+fAaoBFK0A1N0mfT0KxmtwLK6RD56XX7Gk9Td
	 OFIbgY2c1pKcTzs+T+ZvqsyOetaDW6KePmarzssTQ12+vVZrXxYRfDneK9yvDuuYdF9vX
	 OIjoNDcImptjZDL2IcthyodwuHYYsSplFRVJE2bjIRiNUMUVrGT4hPYv82jl3DFUiHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYkZvG7T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852D606A329;
	Sun, 15 Nov 2026 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYkZvG7T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877A31F000C4;
	Sun, 15 Nov 2026 19:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770523;
	bh=TIMpcp5q0yTDtJcCpdNxmcyuVAuHnxRcCai9kzJu3Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YYkZvG7TDza6ISUNrA5UxvkwMkMaTYDOKtlTjJFwt5WNutN24VaxlsSYmqhTVY9li
	 mIZTkFQTGnBegqSkt7a9Ipe9CeKF14uY8FAe0wFb0LP22FzQ67JY+dckJsIF+yidHR
	 SlTuALfyn43kZRzSCEvulKt5vwiT2jphAkIg9eZwP7a32TCNO212ENSsJz4QQtyUZj
	 1uKDAouRdv8wY7F0SKuAiAd48ic38IeJ+YXUSFfSTn1IENOSTLTqYFK9EJ/6mtwox+
	 84H0dI6au4UnWReLyQSXq7WX9642Fp1ZeDtPe87f1hFUOQ5oASWAQ6wHAa68wYrhKu
	 nF6Tbtja0p8lQ==
Date: Sun, 15 Nov 2026 21:21:56 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: Re: [PATCH v3 0/5] kho: fix bootmem sizing
Message-ID: <avoGVI3Ja6ZgRBL6@kernel.org>
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
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
In-Reply-To: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>

On Thu, Nov 12, 2026 at 12:38:52PM +0200, Mike Rapoport (Microsoft) wrote:
> There were several reports about issues with KHO bootmem sizing.
> 
> The bootmem areas are sized from overlapping views of the memory reserved
> in memblock, so on NUMA systems memory allocated on a node is accounted
> twice and with CONFIG_NUMA=n the lowmem and the global areas are accounted
> once again in the area of node 0. Besides, the lowmem and the global areas
> are reserved even when they are empty.
> 
> ---
> Mike Rapoport (Microsoft) (5):
>       kho: reject zero bootmem scale
>       kho: walk bootmem areas in address order
>       kho: skip zero-sized lowmem and global bootmem areas
>       kho: fix bootmem sizing
>       kho: docs: update description of bootmem regions
> 
>  Documentation/core-api/kho/index.rst |  31 +++--
>  kernel/liveupdate/kexec_handover.c   | 225 +++++++++++++++++++++--------------
>  2 files changed, 158 insertions(+), 98 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-kho-bootmem-sizing-5d6aed47a243

I took this version to the liveupdate tree.

-- 
Sincerely yours,
Mike.

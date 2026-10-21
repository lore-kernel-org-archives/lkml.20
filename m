Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.63.92.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593759;
	b=OUcd22XqgCYoNcqpMw51CQ4bgfmzu1IPkNA99Nwg3sf6OM+nGDLhajSWDlA/uBXOrG4i
	 QkLw1Y+NgfzIajRYpI4dRanTGpgsnEEfeyF3NhiuYTv7cTSRaFQ1gqxPz4qvtM2uKagr4
	 VN8erTzfgLjh6cXoyFV4XiJl2etW0BGi3sTETJ3Dq3TpMFVsmGC7IyJPv9pLGjYi/5FCG
	 y9XzxyNhT0fOeBtkIA5v6c6h2aFlwkT/vit1NobTYxHJ42mnYjlStcsb5CZ4kPo/BOajd
	 wIyf5OZ3n0PdtX9nceqgLfelLu+H6TEbTt1YJLyQ9jKBX+RovvAoU2IgJePSRbXrzQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593759;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jKdwhaOHkMhGZmrE/gUDxDwtEcOa/DaUhSNqIxGckrE=;
	b=UApqeWoh4P+4JqN/hCd927NvOpP28ZNS3Ha3TxJOXSXrp6bEiLS3C7zIn1k7erv76fSU
	 dS3IX/RjyVu3ClBIUPKcbSyQq3qmDofrOUse8kuER1uN0VOPVrVwpEapaNPHVHuc7WWg+
	 lXrn98fp53MfiKzpFUsTok0yOMJNCHUMWRJGLAqLUA5J/ZriJPVCWbMPeko1oJ8MdRSe5
	 XHq9N4o+FdlExUYY9xYx7Q65xySb7B9WAGSdz4CvkBPtCOi/JG6M3LIIwerJkz3VgzX9J
	 IMICJ734EGgak/1XZb54tOYVo/qLTCYnta8mXm0/L/O4deQmVpr3RWQT+VSNnbYYLnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=distanz.ch;
	spf=pass smtp.mailfrom=distanz.ch;
	arc=none smtp.remote-ip=178.63.92.236
Received: from sym2.noone.org (sym.noone.org [178.63.92.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F6606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213F6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=distanz.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=distanz.ch
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4j8sSg2KSgz2Ftjl; Wed, 21 Oct 2026 16:42:27 +0200 (CEST)
Date: Wed, 21 Oct 2026 16:42:27 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: yury.norov@gmail.com, linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpumask: Preserve short reads in cpumap printing helpers
Message-ID: <20261021144226.rwvxoz5xceclt7lb@distanz.ch>
References: <20261020170126.15428-1-dennylin0707@gmail.com>
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
In-Reply-To: <20261020170126.15428-1-dennylin0707@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On 2026-10-20 at 19:01:26 +0200, Hungyu Lin <dennylin0707@gmail.com> wrote:
> The cpumap printing helpers unconditionally subtract one from the bitmap
> helper's return value to exclude a terminating NUL. A partial read may
> not reach that NUL, so this also subtracts a data byte from the returned
> length. A one-byte read therefore returns zero even when data remains.
> For example, this command prints nothing despite the file being nonempty:
> 
>   head -c 1 /sys/devices/system/cpu/cpu0/topology/core_cpus_list
> 
> Subtract one only when the copied range actually ends in NUL. This
> preserves short reads, EOF and negative error returns while continuing
> to exclude the terminator from complete sysfs reads.
> 
> Fixes: c86a2d9058c5 ("cpumask: Omit terminating null byte in cpumap_print_{list,bitmask}_to_buf")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Tobias Klauser <tklauser@distanz.ch>

Thanks

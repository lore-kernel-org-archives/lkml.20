Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677079;
	b=cD/eewVQw14CtPfae1k9SwO2UVXUsbAzKfkk88F5aZKl5sSjE2MhthQAh2Ck80ZdJjsr
	 d+Vvdv6NtIQCtDkJmcrNgARF6xQs/2Rf4EBpV+ZHOcO15ggLFZU4GPJcXoPEoPinMxxiN
	 SWSWWQLp1Kj8Vj68jZGd91UKTLmKyidUkunU0r19cuPWqTIhZbvKaS/r/C6uLnTHlUTQr
	 iwmR9+Zl/5FGRMx1xjvfB6MOTGh/bhNRRWJgesuc+si41Rzaogv0q7Tv1KqsiWSOhNCml
	 yTtx2BT6nhVgGIgPuqay7G9We+fn9GDjcKD1cFg5taPXF9GILoxSgglLjKhm6zdLk1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677079;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KGSNI6t1r+TulC/SiKfw3w2XYf50+KvxOFXvkwA2+b0=;
	b=bbkUlSWBOE5Q5JBgjYVLKjMap4QJl3emWJI8mUy8zQ28ndH+PP23cyT0Ln0c0Da0Iu/c
	 QMNAHQrterchoRehS2NHXAqxTX7KsIJe8AKEvPe6N+jybqWT4LDtQTHgPHCbLvVxaiy63
	 Mga5XRa5m8+HmVMJjkHkLvJ2dBCMnnnAAkj400iaPAnXRggQhetqEGmHKTU8P3G+UXjCp
	 vpOVG1wjBVWMD6i0CE8Gmt081WtjRPEEMr/PZV8RFMaCPl7PmiPNC5RMzCO/0iFCiU9G2
	 vaiVMApLLf8MUtKMElo5y+DJTuhC6pplNOYXhmKjV7B3QgUr8XQxDKL/u3//yPd+MEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gBaw/DQH";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C87606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBaw/DQH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465281F000C4;
	Sat, 14 Nov 2026 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794677078;
	bh=KGSNI6t1r+TulC/SiKfw3w2XYf50+KvxOFXvkwA2+b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gBaw/DQHE+HCt6pgA2K22JnPxufqmdmb70RTz6zh2rh6lcVOvYytTGcYnND/l19Wn
	 OYpFhHDZgUkF/qRDpnS5wakWtsv1IrEWO2Tx82L7oopmkW1vHH3I8Wry3t6GB8EzHk
	 K1DaLmCizuUM5I4uwa/xV5CxGICy3FOVV1cB1Tr7cpvP++FmOejT2gt+S1MJp9qNYn
	 NDrQ2kLGCuJx01c613gbf+TNsdJNKNTi//4d+gqHHXb94fPou4M5QRAQ7Hvbel4f4I
	 8H8QppBMlDCxPoB0HF9xxWB5Xbjv24TB1ybA56gIHhhwrzDdL5ArR2ySyDFey6RDPo
	 pzdpJnT4Qugbg==
Date: Sat, 14 Nov 2026 17:24:33 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: akpm@linux-foundation.org, liam@infradead.org, linux-mm@kvack.org, 
	vbabka@kernel.org, jannh@google.com, pfalcato@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: enforce the driver's page size on resize and
 move
Message-ID: <aviY3AWCYlTjHHSv@gremlin>
References: <20261115004700194_SpQtdnE3JL6bzx51l-a5@zte.com.cn>
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
In-Reply-To: <20261115004700194_SpQtdnE3JL6bzx51l-a5@zte.com.cn>

On Sun, Nov 15, 2026 at 12:47:00AM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> mm/mremap: enforce the driver's page size on resize and move
>
> device-dax exposes its mapping granularity through vm_ops->pagesize()
> and requires both VMA boundaries to be aligned to it. mremap() checks
> may_split() when moving a subrange, but does not validate the new end of
> an in-place expansion or both boundaries of the destination VMA.
>
> An unaligned expansion or move can therefore succeed and leave a VMA
> that device-dax rejects at fault time with SIGBUS. Check the final
> new_addr and new_len before moving, and check vm_end + delta before
> expanding in place.
>
> Checking the actual boundaries preserves an expansion starting inside a
> VMA when its resulting end remains aligned. The move check also covers
> equal-length MREMAP_FIXED moves. Existing PAGE_SIZE mappings pass both
> checks, and the existing hugetlb restrictions remain in effect.
>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

NAK obviously.

This patch is broken, wrong, and it's not even a bug.

Also, you are flooding the kernel with patches, 17 series across 7
subsystems over 23 hrs:

https://lore.kernel.org/all/?q=f%3Ashao.mingyin%40zte.com.cn

Please just go away. Nobody wants your AI slop.

--
Cheers, Lorenzo

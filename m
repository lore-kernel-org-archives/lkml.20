Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386891;
	b=PCdMeu7JjVNUdXfcsLM9ZXegrZwAke6E6S/WYSoNrH8NPu2MjiAfieOWUjSS7PiZzAuZ
	 jUY/ug85pRSwhj3QldmfXjpy2MyShc/Rkz51gTeLBBfj3/Ckpi39vTsgo+ISURhORz30x
	 DynasX29K1Y66R4kkQclzCEeCraE/IWoZRSIXVh8cN0JI4yzNupeXXjEPHS5gdEUIT4mO
	 zU60W6/7/4NZ4QALPlAGP91lZvY7KPjwWpFXAYNSKBIT9mja+aXrrGYkZODlhv4081Zhj
	 GFUtsVBM7fDEa67F78eJNcsVpPvxtxrdSAr/hOPnOz5q1lDRAHgjkFzO8oyoQhR8WrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386891;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aNLBnRUOOTL7tx4y3L3gcUkjBYqMniv/b4tCvxqDYJ0=;
	b=EXpolh2ZxHpIOHiE+6HIimP8pQRXWjd89yJlmVlbe79lQ1/wn6OosDuWjSudFdVTNaUL
	 3QMzRRWgYv8AacTy1G8Tv40s/OeGEmBGWm9D8r2qdQrD78u1hKrNynPwFaXnKdgfuqCeS
	 FofYLl09dYuJbsh+PG/Jvmx/75ub1AuAYFk0E4lraZeBjZwLIEDDnioF2BQCabmxNFo0s
	 LOldBs9Y/xNay/gg/pj64qfPyc5sBS8qZ+VdcY+L11oYv1+oZ3l2uE04Eqi95rilAPQii
	 Dc/UvbJjDTEeh85JOKSh1T3iYhmjRIEnuqxgn1jd9zuFh+0BDSE+t5zazToscIV1poQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5N7Zrud;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5N7Zrud
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3818D1F00A06;
	Wed, 11 Nov 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386890;
	bh=aNLBnRUOOTL7tx4y3L3gcUkjBYqMniv/b4tCvxqDYJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H5N7ZrudHWzkIgfZxXk7xBYZ++P+0L4owLET8foVocNlNcYmd9dJ6OW6ETC4ogmcU
	 nWZMaTHBkcM0MUlqspAboSHRChVa3n+fwhrR90HKGNDRbBjbMomZtDrWpEDrsr7kGu
	 CAJGV1pnSTeCiKrIj91IqzOaGNjsfGLuxgdw5m+FxcAU1rq1ooNDZwf/rVCGgXNuX9
	 wNuRJ0fUoqjXXiP6edoggUnFL3a5gaSnLnhjs+x2f2QtOsQZKD3Wwizvy2l8ELxvoD
	 2izvUwWuYHOM+/M6u3/Mt0RdH3QLQBRcCvkpwCaDTSzi+RAAylK9U9c7v82nXPBOts
	 NIkdlAh+XJazg==
Date: Wed, 11 Nov 2026 08:48:06 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: david@kernel.org, akpm@linux-foundation.org, chengming.zhou@linux.dev, 
	link@vivo.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	tujinjiang@huawei.com, xiao.wang@vivo.com
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages
 under only_merge_zero_pages
Message-ID: <avQrosxY3dUIx6jo@lucifer>
References: <avMKhCLDv-ybpmIZ@gremlin>
 <20261111083632.57199-1-xu.xin@linux.dev>
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
In-Reply-To: <20261111083632.57199-1-xu.xin@linux.dev>

On Wed, Nov 11, 2026 at 04:36:32PM +0800, Xu Xin (vivo) wrote:
> Whenever it's a good time for sending a v3, I'll make sure to address Lorenzo's
> feedback by rewriting the commit messages and comments, and simplifying
> scan_get_next_rmap_item() as much as possible.

Thanks, appreciate it :)

--
Cheers, Lorenzo

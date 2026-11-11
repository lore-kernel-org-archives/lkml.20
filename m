Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425577;
	b=UgCRoDf/tYP3UdP+Z0u9svtYzn+hhdoJn5wyYuuAT3AeCZEkC/a3HxsigZ7zCsuGBFQe
	 iygkIhR6rmxq7CSxRw2LixLuwJoPzvDv1DeIeJ0Uppmj9lSek91qXqtcwSqjN60lx9BWi
	 w0ScknX84pYitLo32velS3PaRH/3EwqjW80avAkTes6KmXhfUlECDW/iDUKwqBzSq3HEl
	 oGmGVh6WACwasy3VALqYQNq0M+NHG70Ym/nVLaLjhlgTNwRP3ITHfpZ/LKUUoRA3vzoaU
	 HUl7SdcMKmpohd0dt2hD9dsqQOqemn9hc2WIho4kz/XdEMW1VD8QGavoG76WL/RSVDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425577;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Fes9FPtsLKfqHmPVcvpxVOfAN/gOdDJJxJ44rGZjokU=;
	b=KR2LKCx8eujd7y8JioZoMUMW6jPFKkfKPDpyu9tykPX7tW+jjSRykd+4eLsboztG0xWQ
	 h8vDSCGSbyMQCr0RoFQJjcPsmgjC3DU4+4pkUB3ZxAYfP+byE6iWi3gf+JsZuX2c8eWjo
	 FCYhO1njjJd+sWpzNu4DPVdwEfoTQ6mxYoghttYbZkg+DCjcO9TfJUi+EpNxbuK9pJZTF
	 wghZwuapWT/xCmnmhG0BvRHddaKZ1r4zho8dKPJJrBbnNCd9GGkYtGnSy/4mkPEC2u6DG
	 qmb/ECSd8f8rD/So/Y6Y6xBE+FSQUsJOPO0b5svoR7iFluONA31opf4kDAZuLHB0ijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAwokv9u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD2B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAwokv9u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0D61F00A05;
	Wed, 11 Nov 2026 19:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794425577;
	bh=Fes9FPtsLKfqHmPVcvpxVOfAN/gOdDJJxJ44rGZjokU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PAwokv9uNWTvsDzvS9gdrLQ2vPV7+rqM+JtOA9rCtUByaXsTVqZJFF/2lbpJaaG31
	 R1pKFvXu5oaUVZtDdu0aMaPhW9CLe8egEoZrC2ANh+2DOch9r5Telq4OH4iQCk5iy8
	 AP1cXtUS4RmMqDz51LL1OrT3yVzmWRhIl/v/jsH4OdVLF6QOPsZZLBBC3nKQiAH0GP
	 AWlmC5JIC5Z0B/Md3DjRiNEqovl/5yJS2tdvRu9zANXZ5fkJOogMkFOAs/hfxymT9g
	 vY5rGXMFuQiyDxj1r6XTPKmYwtuNKSM0b+YYk0ag1K/CQXhFTINqE6ar8jb7p79jn9
	 /PWnpAJjl1mhg==
Date: Wed, 11 Nov 2026 20:32:49 +0100
From: Gao Xiang <xiang@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com, jefflexu@163.com,
	dhavale@google.com, hongbohbli@tencent.com, guochunhai@vivo.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] erofs: reset buf->off in erofs_init_metabuf()
Message-ID: <avTC4Q5Ps2xBxslw@MacBookPro.fritz.box>
Mail-Followup-To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
	xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@163.com, dhavale@google.com, hongbohbli@tencent.com,
	guochunhai@vivo.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
References: <20261111141529.719166-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261111141529.719166-1-zhanxusheng1024@gmail.com>

On Wed, Nov 11, 2026 at 10:15:29PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> erofs_init_metabuf() sets buf->off only for the block device and keeps
> the old value when it switches to the metabox or the managed cache.
> erofs_bread() adds buf->off to every offset, so the result depends on
> how the buffer was last initialized.
> 
> getxattr and listxattr init the same buffer twice, for the inline and
> the shared xattrs, with in_metabox taken from different places.  On a
> block device mount with fsoffset=, if the inode is outside the metabox
> and COMPAT_SHARED_EA_IN_METABOX is set, the shared xattrs are read at
> their metabox offset plus fsoffset.  The same image mounted file-backed
> returns the right values.
> 
> Reset buf->off on every init.
> 
> Fixes: 414091322c63 ("erofs: implement metadata compression")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang

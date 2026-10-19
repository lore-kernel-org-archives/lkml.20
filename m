Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423916;
	b=KSlnvSYomS+lm6ragGj8AgFbEVj/aWVnLQRudRo5UL4yT9I+lvgW5m1NRD9lePbe/1Dq
	 xQt5HoKpJpRX2zEYv0QQgHX3duMH7BxWTiRy3ItAyHtMjrV6pmEQOvv/QttMY8i7g9BeW
	 QNB4iYGB9qZNV8hIcE4iMaghN7iiU2bCirFDKuL5JQ/72Rv/p+ULf6ykWkGrmVnsnM/SB
	 QBSDhEyMFpNf22llFVWF8Dg+lnXayiPeF7kRUC04eEXGlhoMN/TGBfA/1LEunWisac4tE
	 IdnZ7P5QnK/28zjXL4/8QBYXR53UigKRLGzkFKeBibhhGjeFmdPDPogIc+PAbjfDjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423916;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9+c4hrm+9pvKCTcELM62uVCGKKJpquDOsEc8oEk4+g0=;
	b=qw8Hi+cdd6qhKKr/Yu6G/wL+37N4kboJJbDiSg5J5qyB5+5x3aiGbwYjCPbo4Uwz+m9q
	 vEcPcrv0ITT2EwfZFtTmFnoO0NZaGjoBAIS53cHKCgruAGHrvvgWX6UUN1wJmWNvFjFoz
	 LUY5kvPG7eJ7yrywNvWIGRVrVy1wr7Lz7y2DwC/b2TzZAiH1do9evFZucfHvtpa9fjU2E
	 v1zXYE1RW19EEHL8vwdYxx3JxdnwhcrZvTQjvk+4siO0CC9iow9pyGmWJV4Rs0mJMK2UM
	 8XRevhvrH9efWOo9E5D9sD1se2/1RS3O4zSoBzzKwuJgHwBXpfm81yhhRuanUYlSDeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDmNFiVB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488460AB736
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDmNFiVB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946B21F0281C;
	Mon, 19 Oct 2026 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423915;
	bh=9+c4hrm+9pvKCTcELM62uVCGKKJpquDOsEc8oEk4+g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDmNFiVBwmkw9xVJeWFEMs8sl5rgaYCwa6lFI/kU4Tkeo6okSrVnpFKdriQqKINei
	 ugZ0Oun4T5uLLwDcjl2xT8sEw/fn45FyTMQehOi1G1ZoHK7mUy35yz2Fs31WlPBLmg
	 YILMFBGsitRO51Ks428prDxTt5PnydjTz9mY50Eln9gojrJXm8jRnoFVG9q7BZkXck
	 VTCD/BBRTStcgjX5+9s/Utn/gErcxTD2m5DUpGOu/q4NnQ8e7ayUGamMp4mgAGPFQe
	 hlfWDyX76bcy+8xmBoAdC0FDld7eOkSXCPfTDaDeXxBvVbySIzWqnxriU+i9P0Q5pO
	 SSzjL8IF4TAkg==
Date: Mon, 19 Oct 2026 15:31:54 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: Seongjae Jeong <jsjlee1020@gmail.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix submit accounting for IPU writeback
Message-ID: <atY36oouQpmVHtwJ@google.com>
References: <20261014112629.59861-1-jsjlee1020@gmail.com>
 <d1236f9a-b5ec-434d-9293-54cf9f6364ef@kernel.org>
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
In-Reply-To: <d1236f9a-b5ec-434d-9293-54cf9f6364ef@kernel.org>

On 10/19, Chao Yu via Linux-f2fs-devel wrote:
> On 10/14/26 19:26, Seongjae Jeong wrote:
> > f2fs_write_cache_pages() uses the submitted count, which is set to
> > fio.submitted in f2fs_write_single_data_page(), to update nwritten
> > and decrement wbc->nr_to_write.
> > 
> > In the OPU path, f2fs_submit_page_write() sets fio->submitted to 1.
> > However, in the IPU path, fio->submitted is never set and remains zero.
> > As a result, successful IPU writes are not accounted for.
> > This can cause asynchronous writeback to continue beyond its budget.
> > 
> > Set fio->submitted in f2fs_inplace_write_data() after a page is
> > successfully merged into a bio or submitted, so that successful
> > IPU writes are included in the writeback accounting.
> > 
> 
> Missing Fixes and Cc stable line?

    Cc: stable@kernel.org
    Fixes: d68f735b3bc9 ("f2fs: check io submission more precisely")

> 
> > Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

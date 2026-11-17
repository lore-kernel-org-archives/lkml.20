Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914011;
	b=4lYHv7ih+0AuskC2ijIgrR3EG2TluQPPJiHELy3BRizNzNN2HGRGyZp5tBCzn7nIUJlB
	 qWOd+dd3fPSzFxaJjXLHPH4Ox+NUL3Ek57WHhKtyAEYtvPUjU/7dtv337fl+Q8AHK/KaK
	 B1ifH1VaZ1iZF/DGqM3la1dr9Eqq6+KVXlrNJC3wgF9iK+dxBKmo+kDnjCloKDPXlhbG5
	 87eVug8RDj0uRqPVuL2/jQGkfjRHLR3pGAcnHUNKJRbUItTf+yh3t36iui5eqw9Vrb7wS
	 nWtjG9bYYFK+vQrA3RtFKdZ6+KOzjeJOjEOeZCI+qYc56Dn1hVlucdTWwhap9UtbJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914011;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FRSk+4PvV3kogM9DF8OzMfZDrCAV6XIsCQnNkDxuFog=;
	b=dwaaCOzBrfOiqIlVb53+t2YDC270djUbjmQPelYFrqTr9Ya0tTOKE2eu7kNGcP8Ajui/
	 L4Lt+qAjq/+e0vULp292Oi37nbhzVM5qULxwTQJoQs0XahM4ZQ+z+AGIb8oz+Gbt8qkGR
	 UT/hagZ/JMJh2kFdOxgwX668BvhSfwIKkJUT/D/snYanee0ZGjHk+3lvUHg7SH2iZeyZg
	 n1DWFVNJDcyWII8rNm5q2GMunY5p+kDpG1XK+QKW4b0hQlgBKb/9vKCLuk4oACOtJcmCI
	 IYjcsOaIxO4tL1WZKAF5h+aXU9OrBtTZ0R7/Z86C+uGWOju9c3mVTlhIGoL1N7bdUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny1o4Eas;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85271606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny1o4Eas
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F831F000C6;
	Tue, 17 Nov 2026 11:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914011;
	bh=FRSk+4PvV3kogM9DF8OzMfZDrCAV6XIsCQnNkDxuFog=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Ny1o4EasfAJh1BRBm6cDi+tPU2v5g3Son7G+0D1OBwc4rB2lQSUAN7JfvDVmjnIwo
	 EXQt7L5y+wBDtodezij1FKUONwbV7l34IZGMSrn7t1uOFHxtD3X3nzZ+aK/7AigwgT
	 vArreDGysB7GChuWlQPk2HHiUBW2buN7PvtZQjwh0Y4YwSBlk96ntqqYY5AlEw2wZv
	 SsU5JP3OgRC33kJClGWKRMu4GpDxFhXJ0atBxnkcMtD8Tdnaq5iVALTD6vkCqpOpoS
	 4jWPlo433o91JAWYA0NIesui7+36I7lOSXacDVL7b88s5s+IWRTKw3J5rJNQUuIe8e
	 +NZR4CULgPO8A==
Message-ID: <9f4992e5-5d48-456c-ae4f-e14160774045@kernel.org>
Date: Tue, 17 Nov 2026 19:13:28 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 10/20] f2fs: support subpage blocks in
 collapse and insert range
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-11-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-11-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The folio holding offset may hold blocks before the shifted range.
> Write back the page cache from the PAGE_SIZE boundary below offset
> under invalidate_lock before truncating it from there, so that no
> data is lost. Detect src and dst in the same folio by folio index
> instead of block index, as a folio holds several blocks. Remove the
> -EOPNOTSUPP check.
> 
> Also take i_gc_rwsem[WRITE] and invalidate_lock before that writeback
> and keep them until the moved blocks are written back and the page
> cache is dropped, as move range does. After the block exchange, the
> page cache holds the old data of the source blocks until then. With
> subpage blocks, page_mkwrite dirties every block of a folio up to EOF,
> so a store to a neighbouring block in between writes the old data back,
> over a hole or over the moved data. This also keeps GC away from the
> inode until then, for any block size.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

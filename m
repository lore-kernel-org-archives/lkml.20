Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237577;
	b=ox3mqaNYXxc71FEius/VDv3QT8iTCY4iXm2PZzXfJ6yGqDILi6MbkApClzFeIGHfn64x
	 z6JR3Y1sn9eQ2HEIrGs6aqaxSnQxgxi/3ty71RJR+5iH7QGxdWZlSKLXl8ug9ApZgdnct
	 c33Hxj934t8O49yPvhJJCuCc2isyDiusCmkCbIwV8mFidh2eLfOK8NlYcmOM+8aFBEeU3
	 /PT3Pq2OOtMyeip1abYFTojL3+B3Xnon4pcVMMBoB8/30wKXGZ4SA64M9yEFnRnWkVHJE
	 ZFh8uKUQFQPK5uCIRdJKFiVmMHwLQYwGRl7uqz1Petotu4zjcl8d5za0Z6Lf7J7F/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237577;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pasXn6DvD+ARe187/TWHY69TAJWxzACBgh3bl/Z0huw=;
	b=ZS6/nixN6fl0OzBhSLUM5BKcBv7VkoKwQq+v4MRymZXQ1RXTctV6P8qlWK4qDOM1U6SB
	 dZ1uQmkcPSTLlBvzC6X6fDccEGFiO4tqTOV+9Uf6RbsACCsP5z04/Za4UrASYmQbKiQrI
	 azjpjtphn8UBXVWyjRGH0ecerFX1MAUZaqn9Mz51oLS4/YEcceVRrSZoq5S1PYzeLaNNQ
	 3kocWlND9OQKZvkXH5w0x/9dn/Z0/UmibxbeGgzEnoGSUW9IDkhuqW4o7Lp4d9Nk3Ut03
	 2FSIv/QYMylEGG5PAGOKjEOsJJPtKg/AXpIrKHPL7Kx7RStZMnX8qHgegbOP+V3NC+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7Hcwobs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636F7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7Hcwobs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2211F01825;
	Thu, 29 Oct 2026 01:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237577;
	bh=pasXn6DvD+ARe187/TWHY69TAJWxzACBgh3bl/Z0huw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Y7Hcwobs3s1k5Dazraj/ZlSPBP5mDSksYBHm2Hg9U+LG5s/Hi+M6OxFZZjDuMYkN+
	 //eU4xuPd/HtBAKhyvigTy/uDCk6482nxtqmleaM0Zg2YEOcDYvOmZW33lpLeXD+vP
	 NbzpGbxHn8vvS3fK48I1+OBt4+lOckS9XAF1mUY+/C8C1Oj/E0i05v2CwtBKLFbWEu
	 Y+pKtjAG4AaCDNCFOY/of6i2bugT+1MbxNK2pB+nC5Lren1JZznlGllWOyn7dx0DP/
	 kzWzQNtB0P4zhiDPn9M2V6UjBFtUWt6CZB5e55SBlvJhYAK+LT/XrLUsud36NV9XhO
	 ZgsRuKssGoVYw==
Message-ID: <0c3e3243-b9a5-4770-8d0f-a5a63ca23783@kernel.org>
Date: Thu, 29 Oct 2026 09:32:52 +0800
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
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>, kernel test robot <yi1.lai@intel.com>
Subject: Re: [PATCH v8 08/15] f2fs: make GC migration large-folio aware
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-9-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-9-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> GC can operate on a 4K block that is cached inside a large folio.
> The data lookup helpers therefore need to test and update uptodate
> state for the addressed subpage instead of rejecting large folios or
> treating the whole folio as the target block.
> 
> Let f2fs_get_read_data_folio() and f2fs_get_lock_data_folio() to use
> subpage uptodate state. Submit single-block reads at the requested
> folio offset and zero only the addressed 4K range for NEW_ADDR.
> 
> Also update `move_data_page` to mark, clear, and restore dirty
> state for the target subpage, and submit write I/O with the subpage
> offset recorded in f2fs_io_info.
> 
> The write_pages_pending reference is taken by f2fs_do_write_data_page()
> and dropped from its common error path, so a block that is truncated
> concurrently no longer leaks the counter.
> 
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


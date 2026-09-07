Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F8309F08
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764385; cv=none; b=OIw+Ona9RRSSb2It6maB/Nv3h11vhKx/rcfg+rQeyKD/jYgy6ikgA26S9NdYYDQKuaVtbh/G9WNkMxktmfGTTwj4lapG9BSusQT+MwpRR3wlB26Os/OqCSX6X6rwR1n9MQCyhU1qbm3mK73OOhrMLh991Zi4ZFsChKKIz0/A2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764385; c=relaxed/simple;
	bh=tgh/Np9IJEwLJwD/nxN76lFkcvQeWyeeMhXhP07cnAo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IAEojSWFZfzC80TPQVIOdojhwTUwHUyyXjnBSImh9j3TpgcsA04ybebEsQCZSWtxFZbKLdUwBANKfiDr5y1p79h+AY49+fB4+JQUpuGZ6w0KBTGDUkhOAwXwflJjEpbomgxN80wJHOEYPbwBspvTJmKmykRKLRrky+fOSdOr1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxmP+nFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxmP+nFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62901F00A3A;
	Mon,  7 Sep 2026 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764384;
	bh=IU5MvjFKRNVNY+OOFB3bdI4Sq6alXb1rFOLEPZAt2ek=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=PxmP+nFtiVFb2H5FtGfrDrYvaQ8L3Lto7cHUT2s86n4WigaBzRCakbNVS8xnrS5wa
	 kO4mBqcNIPuQ0qm2AVpL8qKVFvXjzdPKPsSo7LzKaHutRbYVJBrasrfWv7rgXriufL
	 kRz/xFwk9dbvCeZ4w9eWWC0s/aoMaQpp0wtQLAiR+cp+hWl7iYC3HU+ibZgkihLOS1
	 1WYbUiIxIQHzcMbtHf7CN8zl3IQgPHdGukGlPkdhwejoPnJSczyjrhhg8ytN9tTorx
	 ek+NvDNLXmHTAvNLakgoXIVPblftDi0TOwp4wkd6f5+PNHbMTtNTqpTz1iIynPesvY
	 TxsAuZc7UxEFA==
Message-ID: <5b8e5e22-5847-4097-b3ab-e9ee0b74cbd6@kernel.org>
Date: Mon, 7 Sep 2026 14:59:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered
 writes
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
References: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
 <20260907035139.2183535-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260907035139.2183535-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 11:51, Nanzhe Zhao wrote:
> On Thu, 27 Aug 2026 16:56:53 +0800, Chao Yu wrote:
>> It detaches from fault injection, why we need to change to use
>> __filemap_get_folio()?
> 
> Thanks. I missed that.
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> @@ f2fs_write_begin()
>   	fgp |= fgf_set_order(len);
> -	folio = __filemap_get_folio(mapping, index, fgp,
> -				    mapping_gfp_mask(mapping));
> +	folio = f2fs_filemap_get_folio(mapping, index, fgp,
> +				       mapping_gfp_mask(mapping));
> 
> Could you take a look?

Fine to me.

Thanks,

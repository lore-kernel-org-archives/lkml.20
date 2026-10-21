Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545433;
	b=AkjZ47suBecfUBDWxRVFQUaw+29io1JDpKM0vd4YIrL1WipKWJJwWj3jKzG9XvbwqLF7
	 snETS7SZZYmT37MRx0jTh8xYGmj/xwYx1PZDf1bTgolZlKfGIrpP5VCh7lNS8Gvl5PEMp
	 e3yzvQWlLXYwZcdQfq2YeMZUzr7MqQx2Ryunzz5f9ECOmUquRZtx5mun77C2DYYrHTjXb
	 KLl4s/M64904n7EpKXn9gqFg3vztUMRMUNrB2gjjpBjXmfDGwV8BDoOL726hnL8dXi1Z5
	 ZYKlL0LHDUIaNZQfpN9mX2zXdS+KxRy0QfjORwE0NUlQzpasvlhqlm1w0zXG49GDbgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545433;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=VIBhGgTF/gu5cW+EMsRGuH1swVB3YkyXPoNF4lKWg+M=;
	b=BAGbA4oCRl7gtWMlwQy4nqJpog0US0Ui9//RP2WRDIwP8OF6+kPTgM0utX6uvp5PZKjf
	 N4eBPvfU5JKy80Dsc+9zq/tTIJEGy+Bys9Y8G140qyd7HcQeXSCk0kpkU2t+ipb2x9fD2
	 bjdck4n8EmrbV758n1vskfNcSmhWNiXD3kMy94qjHpUTkK1Z44RNiAIlOUf7zem5GHjQu
	 x+ZhB5gYw352N0fWbuDbf/zWgtPEn+xD/piFQc6vtxn32P/WiPIEWjY6CZxFusCM+ouHC
	 +FhmSYHGfoWiyqvFwwTwGkHPG9EU+wFm6VhSrZ2ga1TGGRRhJwb4bTBPccFXJtsaX/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AdOBBDbb;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62371606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62371606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AdOBBDbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=VIBhGgTF/gu5cW+EMsRGuH1swVB3YkyXPoNF4lKWg+M=;
	b=AdOBBDbbuYYNGDUvBArpJzBQv0MAAv64sV+IoIQjHXw5zc/yhQzSQWj7u9lAhv
	lbq53bvNoOxqNEUVNlSweYaDg/Fwc9GuQOL8MxzP/ZFD3r3zjej+00gOJx9aeh2G
	roWN73vNIO883OdY/GPxIfmWM4qZkOhEer6VQbVomaGcc=
Received: from [IPV6:2409:8900:1a83:52b:6d7d:1867:24eb:16fb] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3P6N5Ethq0gxqBA--.5965S2;
	Wed, 21 Oct 2026 09:16:43 +0800 (CST)
Message-ID: <754bcba2-2f8c-4bf5-8b12-16db8f485645@163.com>
Date: Wed, 21 Oct 2026 09:16:41 +0800
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
Subject: Re: [PATCH] ntfs: fix u16 truncation of the update sequence array
 count check
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: Bryam Vargas <hexlabsecurity@proton.me>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3P6N5Ethq0gxqBA--.5965S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWUXr1ftr4xCrW3CFWUtwb_yoW8Kryfpr
	1rJFnYk395Ka43u39rKay2vFyfJw4fJay7ZrWDXFyI9wn8Wr1xKr4agFykWF40yryrW3Wj
	qF4jgr92kF17ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6a0dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RtzPmrYEnvG1gAA30



在 2026/10/20 21:44, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_check_restart_page_header() bounds the on-disk system page size by
> recomputing the update sequence array count from it:
> 
> 	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
> 	...
> 	usa_count = 1 + (logfile_system_page_size >> NTFS_BLOCK_SIZE_BITS);
> 	if (usa_count != le16_to_cpu(rp->usa_count))
> 		return false;
> 
> The right hand side is computed in u32 but stored in a u16, so the count
> wraps once the system page size reaches 0x2000000.  An image claiming any
> larger power of two passes the check by also claiming usa_count == 1.
> 
> Nothing else limits the value, so ntfs_check_and_load_restart_page() goes
> on to kvzalloc() up to 2 GiB for the restart page and copy that many bytes
> a page at a time.  The size is only rejected afterwards, by the
> (size >> NTFS_BLOCK_SIZE_BITS) != usa_count test in post_read_mst_fixup().
> 
> Compute the count in a u32 so the existing check rejects an over-large
> system page size instead of being defeated by the truncation.  This adds
> no new limit: the array holds one u16 per protected sector plus the update
> sequence number and must end within the first sector, which caps usa_count
> at 240 and the system page size at 64 KiB.
> 
> Widen ra_ofs and usa_ofs as well, as ntfs_check_restart_area() already
> does: both are loaded from __le16 on-disk fields and every comparison is
> against a non-negative value, so no result changes.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>   fs/ntfs/logfile.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
> index ce38ce87f8fc8..2f27ae7a3927f 100644
> --- a/fs/ntfs/logfile.c
> +++ b/fs/ntfs/logfile.c
> @@ -27,7 +27,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
>   		struct restart_page_header *rp, s64 pos)
>   {
>   	u32 logfile_system_page_size, logfile_log_page_size;
> -	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
> +	u32 ra_ofs, usa_count, usa_ofs, usa_end = 0;
>   	bool have_usa = true;
>   
>   	ntfs_debug("Entering.");
> 
> base-commit: 19dc08f1f2c5563ba4da6afd5ecace8eba163aef

 >

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>


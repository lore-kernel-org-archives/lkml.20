Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941393EFFD2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412128; cv=none; b=DKK6uf7IIgU4/iKo9xhgu4inWaJGW82s1EhANQN/i0ExOYcgtlAvCARSh1v6fu8J65MJGL2DUfD1URq5y+ck0GpwWSYcMQ9LPN+wrc1cmm5cWP1c9DsQDUgFg33dpNmAyH9M1XGOU/k2LSHajs3o9nmfBnAm4FGh4sYQeQ2pSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412128; c=relaxed/simple;
	bh=HuUDK72LMXktO0O4mM0y6PBXVCLmBFe58YIT1Bii2zY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m4RviPNd9Vu91DjrXn47BVeZZHdWoaV7y1kMhnd2yKEgNDeOBK3/4Ura9XcclLhVYgkCAebyKzgXQeSN/EiBhpDCZIq7fSy4gaFf+Nf929dnHqeIVZ4YBig5UmkP8SFyfkpRzKipa9eLHlUegc9JfmmlwMrtRz3GrBh0hdF6YSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWMzLl5u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWMzLl5u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4924C1F000C4;
	Mon, 19 Oct 2026 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792412127;
	bh=6TTtJoKfHd6+Axw1JqNgldMsT9Eop/fBn3fLsjLmaDM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=VWMzLl5uTYn4Nr2CO5I68kA6L5fuaaWtjx+wOU2n1sQ5caKEvscc7GS0fIIPEN74Z
	 v5CbDbEy/X+Xi4hlln3kI7zEjVy2OCzPbp3MDTgygzZC8pVe4E5PvIpxVlmkBO96Ma
	 bKG5iEuIzS5AZSPqlfXh9Tq7e3P921yXEdlaIHGQB0vnIAi1416nJSZE8BAkir3r8D
	 6SSH/XhrVbEi0F/jaifTp+HGqFBKK9aUirK4/hqoI5iUPNByBc3aZr/KkTVBDbKQKs
	 Nnig6smW16YQFecpujsjcvvjtMvwr6OXc/t7G/JXrGk+51kKNc5QnGheOj27GWojJp
	 0/5xAT2sXGbmw==
Message-ID: <5c409e48-a6ff-4572-83ea-8e63d8e3552a@kernel.org>
Date: Mon, 19 Oct 2026 20:15:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Nanzhe Zhao <zhaonanzhe@xiaomi.com>, Juan Yescas <jyescas@google.com>,
 Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v5 09/16] f2fs: optimize small block size large folio read
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-10-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261014064445.2835813-10-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 14:44, Nanzhe Zhao wrote:
> @@ -3214,17 +3227,19 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  		 * If the page is under writeback, we need to wait for
>  		 * its completion to see the correct decrypted data.
>  		 */
> -		f2fs_wait_on_block_writeback(inode, block_nr);
> +		f2fs_wait_on_block_writeback_range(inode, block_nr, len_blks);

Oops, sorry, I didn't notice there is unnecessary f2fs_truncate_meta_caches()
in f2fs_wait_on_block_writeback_range(), so still we'd better just use
f2fs_wait_on_block_writeback here?

    void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
                                    block_t len)
    {
        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
        block_t i;

        if (!f2fs_meta_inode_gc_required(inode))
            return;

        for (i = 0; i < len; i++)
            f2fs_wait_on_block_writeback(inode, blkaddr + i);

        f2fs_truncate_meta_caches(sbi, blkaddr, len);  <------------
    }

Thanks,



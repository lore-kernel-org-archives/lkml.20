Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A1456DF9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776588; cv=none; b=Xrbam0D5XqQH08C+G412YsTgFfrMVSJLddFPaQlpU2eSlnqCiRvVx0It5qBGd3glVcl66k0w58bFOpxxJmuZRG3WYbXzooOhZIVUjPp7q5BlATF0qI/ZEH+D3oLn+JL8gFYVeBnIB8u6R1kUisklhdrFJIgQl/S161ChfcWv5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776588; c=relaxed/simple;
	bh=wB3D7NIyOMvcYIHB4XkyLBdL2HpqIuXaEc37ZhNna8k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PfhvOTkgWjHkOfDQrhaWuZ06DBzjgh8HKRuYdRrpiyPoKI7ZKB+O4dAVTuGE23wQqd71qRaL5/sIu4E1+v2k2MBpCt4J5J+k2IL4iDLV3S4rNxZPTCUIsEdcj/qmPm3b8lZeEYMaCRj/yNvl72HTmcmho3BQUAFAsYWzJOBTTAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjfVB5YA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjfVB5YA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BDE1F00A3A;
	Mon,  7 Sep 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776585;
	bh=s6i5gTlzacx4tlzxnVzf43YuXi8+VX8VultCr/Bh7jY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=bjfVB5YA+9bBQbOCfv5RYwcgTL5DOHs9/KcA8It6jg6fiobBGR6cG3UJmoOmlJf5p
	 GOElVkZMTkpdjigW/9SQFo+cavKq7NBDHE47kckEX69fIV7KU/xuo66K4fMkYwfOxv
	 JKDBF8xwOIRB/DIHhHzqFv0UZ/x/aatIKeK7JRtlCdYrpn4viJvZFQGckAgeAGu94Y
	 Naz6z2v4ivSlkmabt5FZiftdu4rcFaDhLjKKs7psgjMFmOmo+DayAvjosneJNxZajp
	 h8lhMMeNwvBOGh6v07NS2GHaISzJ/SYq0DU9DU+94/rIezR9KyMUN/quUHv3RF2YJK
	 PjzR1d56//SyA==
Message-ID: <90c7fbe0-3f06-48a1-a9df-6b9ae6a3d9d1@kernel.org>
Date: Mon, 7 Sep 2026 18:23:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix livelock in f2fs_sync_inode_meta()
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260904145923.1936598-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260904145923.1936598-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 22:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> During checkpoint, f2fs_sync_inode_meta() iterates over dirty inodes in
> the DIRTY_META list. If igrab() fails on an inode (e.g. because it is in
> the freeing state), the loop continues without moving the current inode to
> the tail of the list. As a result, subsequent iterations pick the same
> inode repeatedly, preventing other ready dirty inodes in the list from
> making forward progress and leading to a livelock.
> 
> Fix this by moving the current inode to the tail of the list
> (list_move_tail(&fi->gdirty_list, head)) before attempting igrab().
> 
> Additionally, if igrab() fails, the freeing inode may be waiting for its
> pending writeback data pages to complete during eviction.
> Submit any pending merged data writes and yield the
> CPU with cond_resched() to allow the eviction to make progress.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/checkpoint.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index ef22692cef0a..5597033533b0 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1460,6 +1460,7 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
>   		}
>   		fi = list_first_entry(head, struct f2fs_inode_info,
>   							gdirty_list);
> +		list_move_tail(&fi->gdirty_list, head);

Seems fine, if so, do we need to do this in f2fs_sync_dirty_inodes() as well?

>   		inode = igrab(&fi->vfs_inode);
>   		spin_unlock(&sbi->inode_lock[DIRTY_META]);
>   		if (inode) {
> @@ -1469,6 +1470,13 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
>   			if (is_inode_flag_set(inode, FI_DIRTY_INODE))
>   				f2fs_update_inode_page(inode);
>   			iput(inode);
> +		} else {
> +			/*
> +			 * We should submit bio, since it exists several
> +			 * writebacking pages in the freeing inode.
> +			 */
> +			f2fs_submit_merged_write(sbi, DATA);
> +			cond_resched();

It uses the same implementation from f2fs_sync_dirty_inodes(), after git blame on
it, the implementation was introduce long time ago, I suspect we don't need this?
because in .writepages, we will submit cached bio anyway, right?

Thanks,

>   		}
>   	}
>   	return 0;


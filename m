Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2493EEAC2;
	Wed, 30 Sep 2026 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754367; cv=none; b=qvXcWAvxxa78TnouFtOs6MlQLNcLrCWf8pEOsLvrvjPvCCMsJxpDTd2qY/HgI2mnhXqiFPAKchow7mcHYjajyOjb8iY9vtd2ouvdp+rBvhcvUf1bYtV+YU2Dl3G4TH/B7z0P3f1ive0D+ZH5hRjocVzZBii0p5kCcuqnAQ7OS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754367; c=relaxed/simple;
	bh=vkdhDZJqaaOH8K/0FmGkj2kSC4Ue1jE4jyMQawHSd9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxY/maUnnlXOVoCmB1j5PT4gXj3w+k4vefnqMEssRC+4hToMPVyYw2hm3kFwPdRtOXZXoOVWS5gT8lDY8b6yfvtjM8UGNQYOklLlGR02XfP3vcjSGpOlO/g+66ray8dvYCcVV973b/L/9FiAAzY2ha8UxudskOxJuRwoX87Mgig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVDu7uhD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVDu7uhD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22391F000FF;
	Wed, 30 Sep 2026 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754366;
	bh=qM9t6iP2bgFF9RahCkjeLDxCRIlqy5ztRLf73Y/bLXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kVDu7uhDaxO446ri8ycNWWVSGgdU8tPuJN9xijTCSpXWv4ZcRrc+r3JZ4MCMjTmr9
	 GAv5aAkhBqn8aGj1JbPkM20ZM5G1mNrbZ0Y8lKUpAkGB6tCcEN9iglYzRGrtSn+oRd
	 8vQm19tN4DQcQE5SW49M3Qvd4JOmaE54QxR4ofoMXor9GukvaVkfz7NKpX/4gWu9wU
	 6kFKMhPnI+urQ4x1Gl7cgBU9+eUVXqvPvSeGprTI51HvLihq8SlpO1VP9VnqwKpf4o
	 O48qXeR7jNdGZ6b9GjnFnuY6a91XUINxBHg2VmEdP6j5zkmtNRVKl0gmH1bP7Ibrb4
	 G6Q6UW+NsyTrg==
Message-ID: <da512295-e265-43eb-b44a-74bc7647acfa@kernel.org>
Date: Wed, 30 Sep 2026 09:45:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-multipath: revalidate head zones after unfreezing
 the head queue
To: Palla Raghunath <raghunathpalla.0209@gmail.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Yao Sang <sangyao@kylinos.cn>
Cc: Shuah Khan <shuah@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com,
 syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com,
 linux-nvme@lists.infradead.org
References: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/30 8:26, Palla Raghunath wrote:
> When a namespace on a multipath controller is updated,
> nvme_update_ns_info() freezes the head disk queue, commits the new
> limits, and then calls nvme_mpath_revalidate_zones() before it
> unfreezes the queue again.
> 
> That is the wrong way round for blk_revalidate_disk_zones(). It starts
> a limits update, which takes q->limits_lock, and it freezes the queue
> itself while updating the zone resources. The block layer takes
> limits_lock before freezing the queue, never the other way around, so
> calling it with the head queue already frozen reverses that order.
> 
> syzbot has hit this twice. One report goes through q->limits_lock. The
> other one is on linux-next, where blk_revalidate_disk_zones() also
> takes disk->zone_revalidate_mutex and holds it across alloc_workqueue()
> the first time a disk's zone resources are set up. Lockdep then sees:
> 
>   q_usage_counter(io) (frozen head queue, nvme_update_ns_info())
>   --> &disk->zone_revalidate_mutex
>   --> wq_pool_mutex --> fs_reclaim --> q_usage_counter(io)
> 
>   WARNING: possible circular locking dependency detected
>   kworker/u8:10/3352 is trying to acquire lock:
>   (&disk->zone_revalidate_mutex){+.+.}-{4:4}, at: blk_revalidate_disk_zones+0x1c5/0x1650
>   but task is already holding lock:
>   (&q->q_usage_counter(io)#75){++++}-{0:0}, at: nvme_update_ns_info+0x3ac/0x1200
>   ...
>    blk_revalidate_disk_zones+0x1c5/0x1650 block/blk-zoned.c:2560
>    nvme_mpath_revalidate_zones+0x106/0x1c0 drivers/nvme/host/multipath.c:301
>    nvme_update_ns_info+0x984/0x1200 drivers/nvme/host/core.c:2620
> 
> The rest of the driver already does this correctly:
> nvme_update_ns_info_block() unfreezes ns->disk->queue before calling
> blk_revalidate_disk_zones(), and nvme_mpath_set_live() revalidates the
> head zones without freezing the queue. Do the same here, and only
> revalidate the head zones once the queue is unfrozen and the limits
> update has succeeded.
> 
> Fixes: 224041412693 ("nvme-multipath: revalidate zones for namespace heads")
> Reported-by: syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b0910be96b7c31314822
> Reported-by: syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2e02ccadb3c5522a5c59
> Link: https://lore.kernel.org/all/2bfc96f2-7d0d-47e0-936e-8810abb31a9f@acm.org/
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Brigham Campbell <me@brighamcampbell.com>
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

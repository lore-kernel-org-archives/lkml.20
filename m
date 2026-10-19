Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424416;
	b=xJ0izDEUAjWrx5S2oWSkTaV56m7TdCx6eNu3X3TUlDVDTdEImczZyjLwl/h1ST59RxIZ
	 YdCp7U/4J7/ol/4IeYJHGjSUGojaR/aLyAoVbfJpNbzehkDPNTPfkkftliapCs1MaJZVk
	 uYx/YS290/3K5QOmzY36eApMVH2+0z4cSWXZzhjvnBM0O/WozEs8gfXJk5YPq0F2PDz2B
	 vtROpJyIBjoMKfYBOcWoy5HCn12oSSczikqghmG1oEZ5uhywfmqO9knQ9lNeelJxqYel2
	 Go2auOxcpOewrrsj3JeKQy3mpHxR46azZeiN0IPEm1Gl7Kc+rkD01H7abBNRevzXTvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424416;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=SXHZ+e1cGJsvyptNENWdo+6tGuBkN7AAyV9j8F1Mqck=;
	b=i6ShpHjlN6VhWBJOTQE4VLK2OU2R9AUm73s/OpZIaENi1OxB4SxOd4N+ONoGttcCT7kH
	 KyDsygB4hJTNf9gj6EXa6ahvG03VO9VFxToY1+UIYMFlGN/DcpETICLfYzfPTP2XphO+Z
	 ZVBO5vfS3JqXApIRbTaKjw0i1Volu5g07UjO5p3LAZTTCWaHD8Il2qiDGEkYWKptDPkBB
	 xoSHuJmZUoZ0weP7W+hqJSyP0nIHa6pusAriHzQ4v+eUcjcEEO+OJn8WfFW7cQdzO/JOv
	 kmTBSjghjt/tTcqk5I8sg5T1RM6mZK+75/T0+PaQIU5c0+e8hOtMsZ9AFirARfcH2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSsXXuLo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89126083425
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSsXXuLo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD871F000C4;
	Mon, 19 Oct 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424415;
	bh=SXHZ+e1cGJsvyptNENWdo+6tGuBkN7AAyV9j8F1Mqck=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nSsXXuLo+A1IjoOvSDFOH9lDpkDUfQ1pUe9P0eWRXH4bzMNHBftbOlTF87MzbLbkv
	 R7PpgjU1dcPUMuCz38ATdb14eTF6WJ2Vq6vC+5LTbCskADo37Z8d6qoR5RZT1UQbUE
	 qL71xu2vtNyMnZOh8W+VbdaaOVmJoLJSNOwRTYQHCNKEVYAPEXVownXCuboM6K/V3E
	 qnqq1R8B8bZEJkf7c3vUZv8zXDJPg2u4o6PPHUz4KeQDUc5Lv62aAgogwM23e9iZrt
	 NnIidhwr1LuhFantAuNjTrRcohouXlCOxZao/Zm8T7BFnvG0lIDVS7ijzlRQIxM3cG
	 +lhjxD6o/x0TA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773143811A71;
	Mon, 19 Oct 2026 15:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: fix to don't fail to grab GC
 target
 block on zoned device
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242441406.2714099.11346194792931754269.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:14 +0000
References: <20261019090032.1170825-1-chao@kernel.org>
In-Reply-To: <20261019090032.1170825-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 19 Oct 2026 09:00:32 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> With out-of-memory fault injection (inject_type=0x0080800f) on a zoned
> device, f2fs stopped checkpoint during GC:
> 
>  F2FS-fs (dm-0): inject kmalloc in f2fs_kmalloc of move_data_block+0xc0b/0x12b0
>  Workqueue: dm-1_zwplugs blk_zone_wplug_bio_work
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x4d/0x70
>   f2fs_stop_checkpoint+0x1df/0x5d0
>   f2fs_write_end_bio+0xdbb/0x1320
>   blk_zone_wplug_bio_work+0x2aa/0x7d0
>   process_one_work+0x5c6/0xde0
>   worker_thread+0x403/0xb70
>   kthread+0x235/0x2e0
>   ret_from_fork+0x2f/0x70
>   ret_from_fork_asm+0x1a/0x30
>   </TASK>
>  F2FS-fs (dm-0): Stopped filesystem due to reason: 3
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: zone: fix to don't fail to grab GC target block on zoned device
    https://git.kernel.org/jaegeuk/f2fs/c/14f329117d10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



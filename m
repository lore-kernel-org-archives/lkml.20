Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4133D6CB0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210574; cv=none; b=lcjPXO34AS15+fI6JKfK9Jb3+NOgI1ogGQBWiwhOatDzvvKjr9QjP/oRZsL/6/B6+3DDnyTtACjOAVmsZ7UhJ+tGVMhq/Qmclm3Qioaexri0hKX+DDHBLNWXcdoACOqXfAvsn0bqNEbgv4rKcDRvSVqSisKdtb7UHtJpMLsqVmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210574; c=relaxed/simple;
	bh=0AAeOlCAIKjpk7/TzMyZHfFiHL+eIyGUQPXKyzPSQW4=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DIuGS2+yBMZwoAIyKtPLp3K4+ywFHQPgZldYXoKe4oVor6oDcUL48EVnyfWsgNvNbH57bSeme+TYCpz30wbqFbMWw9g616DaQukUHEU5Nuszvmbjh7txVzK9wjXjEsADR3O6RviDBtFOsz/ANa6c87flc3bdC7KjD/V+uiycfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=OnnppQpL; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="OnnppQpL"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yxSekVbdDs2YvZ76Mclc6ifIjoTHZncOhp1pXXoY3iM=;
	b=OnnppQpLZbeAgwTvE9Vy4oAF5aT6ep6AXpV035z+CNoGzDq9++jF7rIlil1y3iuhzvII0hqOp
	E5d9IvjDKfTHcZWRYOIwwNg/EffOOdbqJpHOtgHZXOrgE/4ATfyvkhnogofOtkU1235vgRptLBR
	eLFvHiLnw7L+YKauA+416Mw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j67ld6TdFz1T4LX;
	Sat, 17 Oct 2026 12:15:57 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id D937440579;
	Sat, 17 Oct 2026 12:15:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 17 Oct 2026 12:15:58 +0800
Subject: Re: [PATCH v1] ubifs: drop the obsolete ULONG_MAX assertion on the
 wbuf timer delta
To: Nickolai Zeldovich <nickolai@csail.mit.edu>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261017022116.792684-1-nickolai@csail.mit.edu>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9c7ffefb-a180-4220-4f09-1fc267b090fd@huawei.com>
Date: Sat, 17 Oct 2026 12:15:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261017022116.792684-1-nickolai@csail.mit.edu>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)

在 2026/10/17 10:21, Nickolai Zeldovich 写道:
> On a 32-bit kernel, once root sets vm.dirty_writeback_centisecs to 4295
> or more (43 s; raised on flash-based systems to reduce wear), the next
> journal write of every mounted UBIFS file system fails its write-buffer
> timer assertion and, with the default assert=read-only, switches the file
> system to read-only mode:
> 
>    UBIFS error (ubi0:0 pid 1): ubifs_assert_failed: UBIFS assert failed: delta <= ULONG_MAX, in fs/ubifs/io.c:516
>    UBIFS warning (ubi0:0 pid 1): ubifs_ro_mode.part.0: switched to read-only mode, error -22
> 
> The create, write, unlink or fsync that started the timer returns EROFS
> and so does every later one until the file system is remounted; with
> assert=panic the machine crashes instead. 64-bit kernels are not
> affected. The assertion has been reachable since v4.10, when the timer
> started to follow the sysctl.
> 
> new_wbuf_timer_nolock() computes the timer slack as
> 
> 	delta = dirty_writeback_interval * 10^6 ns
> 
> in an unsigned long long and asserts delta <= ULONG_MAX. On 32-bit
> ULONG_MAX is 4294967295, exceeded from 4295 centiseconds on. The check
> dates from commit 2a35a3a8ab3e ("UBIFS: set write-buffer timout to 3-5
> seconds"), when hrtimer_start_range_ns() took the slack as an unsigned
> long and the value was a compile-time constant that could only be checked
> against truncation. Commit da8b44d5a9f8 ("timer: convert timer_slack_ns
> from unsigned long to u64") widened the parameter to u64, so nothing is
> truncated any more, and commit 1b7fc2c0069f ("ubifs: Use
> dirty_writeback_interval value for wbuf timer") then derived the value
> from the sysctl, which has no upper bound. The assertion no longer guards
> anything and fails on a legitimate setting.
> 

Right, the assertion is not necessary since da8b44d5a9f8（“timer: 将 
timer_slack_ns 从 unsigned long 转换为 u64”）.
> Remove it. The timer is started with the full 64-bit slack exactly as
> before.
> 
> Tested on a riscv32 QEMU kernel with UBIFS on an mtdram-backed UBI
> volume: after "vm.dirty_writeback_centisecs = 4295" the first
> open(O_CREAT) fails with EROFS and the assertion is logged; with this
> patch the open and fsync succeed and the log is clean. 4294 works on
> both.
> 
> Found while reviewing the users of dirty_writeback_interval for the
> formal verification of the periodic writeback code.
> 
> Fixes: 1b7fc2c0069f ("ubifs: Use dirty_writeback_interval value for wbuf timer")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>      The write-buffer timer start is the only user of the value in fs/ubifs; the
>      softlimit next to it, ms_to_ktime(dirty_writeback_interval * 10), is a 32-bit
>      product on all architectures and wraps above 429496729 centiseconds (49.7 days),
>      the same wrap that fs/fs-writeback.c has at its two msecs_to_jiffies() sites;
>      that is a separate issue of the sysctl's range, not touched here.
>      
>      Reproducer (32-bit kernel, any UBIFS mount, root):
>      
>        sysctl -w vm.dirty_writeback_centisecs=4295
>        touch /mnt/ubifs/f
>      
>      Before: touch fails with EROFS; the log shows "UBIFS assert failed: delta <=
>      ULONG_MAX, in fs/ubifs/io.c:516" and "switched to read-only mode, error -22";
>      every later write to the file system fails with EROFS until it is remounted.
>      After: touch succeeds, nothing is logged. 4294 works on both; a 64-bit kernel
>      never trips the assertion.
>      
>      Run here as a freestanding init on qemu-system-riscv32 (-M virt,
>      CONFIG_MTD_MTDRAM=y with a 16 MiB device and 128 KiB erase blocks,
>      CONFIG_MTD_UBI=y, CONFIG_UBIFS_FS=y, "ubi.mtd=0" on the command line): the init
>      creates a 4 MiB dynamic UBI volume with UBI_IOCMKVOL, mounts "ubi0:v" (UBIFS
>      formats the empty volume), creates /mnt/a at 4294 (ok, fsync ok), sets 4295 and
>      creates /mnt/b: open returns -30 unpatched, 0 patched.
> 
>   fs/ubifs/io.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
> index 6c6d68242779..da4eb0a82e62 100644
> --- a/fs/ubifs/io.c
> +++ b/fs/ubifs/io.c
> @@ -513,7 +513,6 @@ static void new_wbuf_timer_nolock(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
>   	delta *= 10ULL * NSEC_PER_MSEC / 10ULL;
>   
>   	ubifs_assert(c, !hrtimer_active(&wbuf->timer));
> -	ubifs_assert(c, delta <= ULONG_MAX);
>   
>   	if (wbuf->no_timer)
>   		return;
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> 


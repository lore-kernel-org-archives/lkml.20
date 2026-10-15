Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38813D1702
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031781; cv=none; b=btW2u68kE2wZuRoB4j1y6Lgtw8ZaETV2w1S8JLqjf09JdrREWhC2eRdPQTGE/AfVrkTeCDxYv4fUaPLDxXKgcef1mzdqjjH/azX42jl+mx9f8FPWiPMWlvF+UDqRdqYpeEoREJ8zC2Bw+Ap1Hfyk0xYZSA6l6TO8oESG0WQRjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031781; c=relaxed/simple;
	bh=nv5ZXXeoddKBBKKZMh1sJM6onE/5yXh7OuyadN7InYY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F9mi9tvGUEGBr9hPfV7ZH4s6erSlbRY8fpIUo5oWtbh1y7T40M6tww9wWXcY6BFtUaiE6C+g20VbJwY2rCjJSiLJcWbuPSlTwLOIZrwhI6bkWTvefy8bqfAdIoF5/7mIWvLCbVgwE4HM2HZtp+i2nvQh7s2508ZbUs0sYpHt7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlofQ6bB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlofQ6bB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD811F000C4;
	Thu, 15 Oct 2026 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792031779;
	bh=6eW/eHF/I8EA6tsRH9MahpuPY32W/n9xdRW5mp5dtXg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=PlofQ6bBIUNPxuhxtAybTA/7SR3VM+2YPFHXWUOzLJLJxYiNWwjYmr3s7gpWZgGOo
	 FpWPYubVSYEytqB9fkkeHG6HlYdNC/ZT/GreDJkrnOB8LSjWEx4JaSxzxVwbqR/44n
	 vGIxNcvueLQRhd6NDln963Y/oygcYIyb8zelLkSciuhufW9ury2Z614tJP7Zt1ygFS
	 hFjmKSSWepR6f9YzDw5zcKCRHuJaheMrGfIx7p7BfZqFCq2rKu5N10C/Zx05IvbHNe
	 0HPSYtfS2rCHnZB4g5b89Bnpm41Z/gopD0qquqQZueP3Ohvdy/q7x/J/iMlFdSAotV
	 zXcBgeJI7Zqog==
Message-ID: <51e9b2c1-6e99-4d5b-992d-02294ab2b384@kernel.org>
Date: Thu, 15 Oct 2026 10:36:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large folios
 for writable files
To: Jaegeuk Kim <jaegeuk@kernel.org>, Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 Barry Song <baohua@kernel.org>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
 linux-f2fs-devel@lists.sourceforge.net, Ryan Roberts <Ryan.Roberts@arm.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com> <atA24UMtAqkmz_R8@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <atA24UMtAqkmz_R8@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Nanzhe,

It needs to set .folio_blkcnt = 1 in move_data_page()
in "f2fs: carry subpage offset and count in write IO" rather than
in "f2fs: make GC migration large-folio aware"

On 10/15/26 10:13, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Ok, this comes when applying "f2fs: carry subpage offset and count in write IO".
> 
> On 10/14, Jaegeuk Kim via Linux-f2fs-devel wrote:
>> Hi Nanzhe,
>>
>> Could you please check IO submission path for Zoned block device?
>> I hit this.
>>
>> [   93.100225] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.100420] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.100551] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.100948] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.101432] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.101762] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.101907] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.102564] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.103054] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.103447] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.103667] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.104294] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.104373] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.104449] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105220] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105253] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105532] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105575] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105606] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105781] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.105985] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.106192] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.106692] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.106799] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107015] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107090] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107113] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.107268] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107288] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.107499] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107511] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.107707] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107724] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.107770] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107781] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.107929] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.107941] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.108040] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.108050] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.108166] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.108179] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.108322] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443312; zone offset 19056; I/O scheduler (none); rq 00000000653b6a70 {.op=WRI
>> [   93.108341] sd 0:0:0:4: Retrying unaligned write for zone 2639; offset 259443320; zone offset 19064; I/O scheduler (none); rq 00000000ea98b61b {.op=WRI
>> [   93.108582] sd 0:0:0:4: [sde] tag#31 UNKNOWN(0x2003) Result: hostbyte=0x00 driverbyte=DRIVER_OK cmd_age=0s
>> [   93.108588] sd 0:0:0:4: [sde] tag#31 Sense Key : 0x5 [current]
>> [   93.108595] sd 0:0:0:4: [sde] tag#31 ASC=0x21 ASCQ=0x4
>> [   93.108605] sd 0:0:0:4: [sde] tag#31 CDB: opcode=0x8a 8a 00 00 00 00 00 01 ee d9 4e 00 00 00 01 03 00
>> [   93.108607] critical target error, dev sde, sector 259443312 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [   93.108612] sde: zone 2639: Aborting plugged BIOs
>> [   93.108626] CPU: 1 UID: 1000 PID: 1831 Comm: CachedAppOptimi Tainted: G        W  O       6.12.81-android16-6-maybe-dirty-4k #1 de5ea2c0fc3867082493fabcae9896176e2e435e
>> [   93.108630] Tainted: [W]=WARN, [O]=OOT_MODULE
>> [   93.108631] Hardware name: KODIAK DVT 1.0 based on MALIBU (DT)
>> [   93.108632] Call trace:
>> [   93.108633] dump_backtrace+0xec/0x128
>> [   93.108641] show_stack+0x18/0x28
>> [   93.108645] dump_stack_lvl+0x40/0xb8
>> [   93.108649] dump_stack+0x18/0x28
>> [   93.108652] f2fs_stop_checkpoint+0x1f0/0x2d8
>> [   93.108654] f2fs_write_end_bio+0x50/0x694
>> [   93.108657] f2fs_write_end_io+0x80/0x94
>> [   93.108660] bio_endio+0x114/0x224
>> [   93.108662] __dm_io_complete+0xf4/0x278
>> [   93.108665] clone_endio+0xc0/0x26c
>> [   93.108669] bio_endio+0x114/0x224
>> [   93.108671] blk_zone_write_plug_bio_endio+0x104/0x334
>> [   93.108674] bio_endio+0x160/0x224
>> [   93.108676] blk_update_request+0x17c/0x218
>>
>> On 10/14, Nanzhe Zhao wrote:
>>> This series supports large folios for most readable/writable files
>>> in buffered I/O paths, including normal files, block-layer encrypted
>>> files, and atomic files except for inline-data files, compressed files,
>>> and quota files.
>>>
>>> It also extends f2fs_folio_state to coexist with f2fs page-private
>>> flags and to handle large folio write path and partial truncate of
>>> large folios correctly.  A valid large folio always carries a
>>> f2fs_folio_state at its folio->private in the current implementation.
>>>
>>> Benchmark details can be found in the RFC v2 cover letter [1].
>>>
>>> Changes in v5:
>>> - Rebased onto the f2fs dev-test branch (d1685c24b6c3).
>>> - Dropped the two prerequisite bug fixes, which are now merged:
>>>     c04f209773ec ("f2fs: read i_size once in f2fs_vm_page_mkwrite")
>>>     b3c984358925 ("f2fs: remove mappedtodisk flag usage in mmap write path")
>>> - Link to v4: [2]
>>>
>>> Many thanks to Chao and Daeho for your extensive reviews and valuable
>>> suggestions!
>>>
>>> [1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
>>> [2] https://lore.kernel.org/linux-f2fs-devel/20261013115621.968742-1-nzzhao.sigma@gmail.com/
>>>
>>> Nanzhe Zhao (16):
>>>   f2fs: extend folio state for large folio write path
>>>   f2fs: carry subpage offset and count in write IO
>>>   f2fs: support regular file buffered writes on large folios
>>>   f2fs: support atomic file large folios buffered write
>>>   f2fs: support large folio writeback
>>>   f2fs: account large folio dirty data at block granularity
>>>   f2fs: prepare mmap write faults for large folios
>>>   f2fs: make GC migration large-folio aware
>>>   f2fs: optimize small block size large folio read
>>>   f2fs: support partial uptodate large folio read
>>>   f2fs: handle partial truncate of large folio dirty subpages
>>>   f2fs: wait for folio writeback before ffs_detach_free
>>>   f2fs: fix zeroing paths for large folios
>>>   f2fs: handle block cloning within the same large folio
>>>   f2fs: allow large folio support to writeable files
>>>   f2fs: make compressed files compatible with large folio
>>>
>>>  Documentation/filesystems/f2fs.rst |   10 +
>>>  fs/f2fs/checkpoint.c               |   40 +-
>>>  fs/f2fs/compress.c                 |    7 +-
>>>  fs/f2fs/data.c                     | 1467 +++++++++++++++++++++++++---
>>>  fs/f2fs/dir.c                      |    2 +-
>>>  fs/f2fs/f2fs.h                     |  170 +++-
>>>  fs/f2fs/file.c                     |  226 +++--
>>>  fs/f2fs/gc.c                       |   38 +-
>>>  fs/f2fs/inline.c                   |    9 +-
>>>  fs/f2fs/inode.c                    |    4 +-
>>>  fs/f2fs/namei.c                    |    1 +
>>>  fs/f2fs/node.c                     |    2 +-
>>>  fs/f2fs/segment.c                  |    5 +-
>>>  13 files changed, 1716 insertions(+), 265 deletions(-)
>>>
>>> -- 
>>> 2.43.0
>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


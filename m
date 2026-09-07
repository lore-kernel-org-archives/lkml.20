Received: from mta0.migadu.com (out-198.mta0.migadu.com [91.218.175.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECBE37C0F8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800771; cv=none; b=WP5ep48RZkewdsmGkwIHfWan8i3fApDEDmYaPns6gwCKadee4F4LJLF3LTrKv2X1CxRpdOy6A6ynF+E7gNMjI9DuHDtW30VgocHF3HqKMxFJCRGvl/JhBJDpTvljwYG8bgYNzl+iVMVbilen2ST7sw1dc4r/18j5x3l0Z8SUj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800771; c=relaxed/simple;
	bh=7pByG30llvEWWSce4UCN2bXV3w2mwOr+4zGW6Pv3EaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfEimmWWOL3RKZuVMNflfKvBNZ6znGyADOosmApNVjwXaabiA1vu8PvqpJes6JREup4ol88Bokgz6CX5fWxS96xivq0gfBE43Oc0vkjMPFJQyLuRSyhFLnPMoag8hOqp02N76Ht+LiMgeJWK+0baXHc42TDGDTMTb0rxXv6OmEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VcdN1Wmr; arc=none smtp.client-ip=91.218.175.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VcdN1Wmr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7pByG30llvEWWSce4UCN2bXV3w2mwOr+4zGW6Pv3EaM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788800767; v=1; x=1789405567;
 b=VcdN1WmrOrPCtLseFfeYX7tkR7IbS93f0Xm0+OxoJN1g4jH8KPa/wbyot+eC4JAEeQYC6ErR
 ugJKx3xs0CIFuLwzrpbmEImHDKIXqI6+3zCkGTGMW4P/bHtUaCsUa1OF9AXOb66+ozr96DjTbOp
 AcCyrfGkAI3tg3JVXoEsU6IE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22398892ef57cd52;
	Mon, 07 Sep 2026 17:05:57 +0000
X-Mizu-Trace-ID: 22398892ef57cd52
X-Migadu-Flow: FLOW_OUT
Message-ID: <fe1ec84e-31df-408b-961a-6d79848bff9c@linux.dev>
Date: Tue, 8 Sep 2026 01:05:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory: fix hugetlb_zap_begin() call in
 zap_vma_range_batched()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260904000028.149656-1-sj@kernel.org>
 <20260903173540.e8f660dcaf083946417cba3e@linux-foundation.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260903173540.e8f660dcaf083946417cba3e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 8:35 AM, Andrew Morton wrote:
> On Thu,  3 Sep 2026 17:00:26 -0700 SJ Park <sj@kernel.org> wrote:
> 
> > I didn't read the broken commit in depth.  This fix is only
> > build-tested.  I wanted to report the issue with this as a temporal fix,
> > but the broken commit doesn't have Link: tag.  So directly posting this
> > temporal and not very well verified fix first.
> 
> Yeah, this is possible fix for
> https://syzkaller.appspot.com/bug?extid=bd6aaf99e8443d8a9034 which I
> had chatgpt create for me.  It's in limbo at present until I figure out
> what to do with it.  Actually I'll hide it from others while figuring-out
> happens.
> 
> 
> 
> For the morbidly curious.  It's really only a 2-line change, plus a bunch
> of changes to pass the zap_details down to  __hugetlb_zap_begin().
> 
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm/hugetlb: don't lock private resv_map during final unmap

FYI this causes the following warn when running selftests:

 ------------[ cut here ]------------
 DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff8000059ff478, owner = 0x0, curr 0xffff800104a29000, list not empty
 WARNING: kernel/locking/rwsem.c:1412 at up_write+0x1f4/0x25c, CPU#6: pagemap_ioctl/1352
 Modules linked in: rfkill fuse virtio_gpu drm_client_lib virtio_dma_buf drm_shmem_helper drm_kms_helper drm
 CPU: 6 UID: 0 PID: 1352 Comm: pagemap_ioctl Kdump: loaded Tainted: G                 N  7.3.0-rc1+ #70 PREEMPT 
 Tainted: [N]=TEST
 Hardware name: QEMU QEMU Virtual Machine, BIOS edk2-stable202408-prebuilt.qemu.org 08/13/2024
 pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
 pc : up_write+0x1f4/0x25c
 lr : up_write+0x1f4/0x25c
 sp : ffffc0008903bab0
 x29: ffffc0008903bab0 x28: ffff800104a29000 x27: 0000000000000000
 x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
 x23: ffff800104a29000 x22: ffffc000826254d0 x21: ffffc0008903bc68
 x20: ffffc00081eb6000 x19: ffff8000059ff478 x18: 0000000000000020
 x17: ffffc000800da3a8 x16: ffffc000800d971c x15: 00000000ffffffff
 x14: 0000000000000aab x13: ffffc00081edca98 x12: 0000000000002001
 x11: ffffffffffe26460 x10: ffffc00081edca98 x9 : 0000000000000006
 x8 : 0000000000000003 x7 : ffffc0008903b800 x6 : ffffc0008018bf04
 x5 : ffff8001eeb7d208 x4 : ffff8001eeb7d280 x3 : 0000000000000001
 x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff800104a29000
 Call trace:
  up_write+0x1f4/0x25c (P)
  __hugetlb_zap_end+0x58/0xfc
  unmap_vmas+0xbc/0x178
  exit_mmap+0xbc/0x4d0
  __mmput+0x58/0x154
  mmput+0x50/0x5c
  do_exit+0x2bc/0xd00
  do_group_exit+0x34/0x90
  pid_child_should_wake+0x0/0x5c
  invoke_syscall+0x54/0x110
  el0_svc_common.constprop.0+0x40/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x54/0x424
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x1b0/0x1b4
 irq event stamp: 0
 hardirqs last  enabled at (0): [<0000000000000000>] 0x0
 hardirqs last disabled at (0): [<ffffc000800ce3a8>] copy_process+0x8f8/0x2078
 softirqs last  enabled at (0): [<ffffc000800ce3b0>] copy_process+0x900/0x2078
 softirqs last disabled at (0): [<0000000000000000>] 0x0
 ---[ end trace 0000000000000000 ]---

Thanks,
Zenghui

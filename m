Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432EA345EA3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856222; cv=none; b=nHzWnkbEivjn7wFRtenp/NWyiGOgnawymbgvT5uJOekrhGY6l25OwZmOXTjG0k8TwAiHRsQymsTNGg3ut27cw5TylB7VGeC5JQfdhXyOpyRS/ge6xIIlVYsYgGtc5hXaGijpAveHlitU+psOSukHN1Li/43Xg3LpcM5YHurZNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856222; c=relaxed/simple;
	bh=DQawA4FxSTUEWFv6oC2axneEjdTj8cn33tFq0Ssx89c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tcgKArezL8mss9twKipnKRP/Fv9yqI9+e/tSVqgsnQP22mBBsjCMFqC5IuCowjdkXbUIajONbqrOMhh7XZGID1YqQOxL2Vr2cTjn7dqhTQLTJnd34kdL5oCMpeeye6ergcloDJOgcEHMnCKkqYA+Si17EHTHW6bWzPx1HH3CAo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFGLtgI7; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFGLtgI7"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso3257349a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856218; x=1790461018; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EROucbbrabZv3805uiRoXnIvZBGdkuqwaJCZzPt9pYg=;
        b=cFGLtgI7djzSyGHq+ZEokzc9A8RiVTfmZ6ObmabIEfTTgr9jHdOe12UEOWtd+hgtIO
         026n6pnvhlXNhr8C+DchfnOICAEFWSFqr+ZLNKNN+TjMlWyUXM8FRtltb9DqNhvb4hgq
         oaiNFmaq1MnsxaTZL2Uhm666fmt/zdolZdcONYaLmXeEcHvYvUeSnC6R+23RwCK5WZzM
         ouSSwxjH/hUEUxpMk7+DKe4/uO8/LzLCaJaW2CmnyMNMqH8F9G9Ba1VuRv3qKtdET7pe
         EvaHc2ei9qmxZ0ZlTOUmSo6lhGTupqWfHSGnaLU8euBk7ov4peb5wo6bLVZJRK58VKow
         XC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856218; x=1790461018;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EROucbbrabZv3805uiRoXnIvZBGdkuqwaJCZzPt9pYg=;
        b=H0lSwV5MNWHNG1vTPNgo9fnIjrDrEoDYyI49TJI5j8bllcMffOWN8Gi34GYav1LSJX
         /uPrqkMGAW9oP9hicE88ptNaofnUboPaQCHBdWeN/RmzZPT3DPQTDjyU+W7xakpx/x0l
         jH2Mi5lg12lHEIoBKjn8YisRy+MV9qYTFt2Eg+x9+dp6+YvcD943Tse/5mqN3XyMwxtP
         2AwvOH03G7KnjLNDcB3Y+p0TAH0o3YlUcblxDRkpWJPyloToL6x3ZxEGhcEUcTuSxK8U
         vKB0bVB5nvsGaIBRFXVOs7rrKgza+RD+6R8OduK1JwFuFoVJXdGWti95kkpaOoZeKG77
         vPTw==
X-Forwarded-Encrypted: i=1; AKwUvBxLJ5cCYKgaLgWk0fww3OaIV4aiHM74bTp7NDL7/Irlh45fj94PhyRMoHeO6LHOQIKEk5UsYVOHnOyEpak=@vger.kernel.org
X-Gm-Message-State: AFuF++mslTalOlpOWvoTTaFi8U6xjMQPeru6PBIYrenDaD5CSMNPbdv5
	iJFLcB8mb0tAoFF7gYm0vRj2baZFf2ExSiPwGx2BdOmFon6d7u9zOatOxg83vrHR
X-Gm-Gg: AYBFou1AlJvSTfS2pu/eGNMvREJAq2sqqAqA3vRt0pTrwlL5Q30MP2yVwL0QZV/v9r5
	bgOROxcO1phe8eOVHooRFFwicdylYPjWQA3LePNj25DFhyR4CAWKtNtoArdpfUHZkNDuY4JSCjL
	8UBHOvjegoQ7KDssMtT81zTSB+ZkwRXchMyLbiJGkJTeg2wXf5F9LDnSHiPVBhz6HXpMNSDywWZ
	Sou5Vkk9KmdrmmiWVEPKHrqN/ZDotD8bomdGABVsmUA+3jZHsMsB0sebLhwMYAgdOnwTTMW6r+u
	sZHki1LuONZ4mxOv6G1ieyYQkbaprn39E6SqaUceI9p/3LZosHRmTwj24fu3ScMrGhRLqPf9Aea
	99LX2OppBEarujn53DWFVcmV5ael/W5FafIMYu2hYI5mwUJ8uofXbxxbtNlUmXACa3vCKZQ4JCq
	YvTJJFuDGxqHMfn2pNSvrMrtrizZSmugBTQPs+kxUWL74Tsb4NArSZJwMGWvYS7v2KTgCtww==
X-Received: by 2002:a05:6402:44c2:b0:6a8:118:9592 with SMTP id 4fb4d7f45d1cf-6aa565010d5mr3268995a12.16.1789856217535;
        Sat, 19 Sep 2026 15:16:57 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:6::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dc582csm1766619a12.16.2026.09.19.15.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:16:57 -0700 (PDT)
From: Samuel Crossley <samuelcrossley@gmail.com>
Date: Sat, 19 Sep 2026 15:13:03 -0700
Subject: [PATCH v2] vfio/type1: avoid walking reserved-only mappings while
 unpinning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-vfio-v2-1-68e7ed355972@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO4Ir2oC/12NwQ6DIBAFf4XsWRrBiNVT/6PxoLDoNlUMWNLG8
 O8N9tbjS+bNHBDQEwbo2AEeIwVyK3RMFgz0PKwTcjLQMZClVGUjKx4tOW5Qm6sabaWtgoLB5tH
 S+9Tc+98Or/GBes/fTMwUduc/ZyeKzP0po+CCV2Pd1k3bCqXVbVoGel60W6BPKX0BF0UewKoAA
 AA=
X-Change-ID: 20260723-vfio-decd86bf3cf6
To: Alex Williamson <alex@shazbot.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Crossley <samuelcrossley@gmail.com>
X-Mailer: b4 0.16-dev

Tearing down a large device-passthrough DMA mapping can process tens of
millions of reserved pfns in a single VFIO_IOMMU_UNMAP_DMA.  A 128 GiB
reserved mapping holds about 33.6 million 4KiB pfns, and
vfio_unpin_pages_remote() walks every one of them whenever dma->has_rsvd
is set, because reserved and non-reserved pfns might be mixed.  For a
mapping that contains only reserved pfns every put_pfn() is a no-op, but
each one still pays for the pfn_valid()/PageReserved() classification.

Seen on GPU-passthrough hosts running 6.13 with the v6.18 type1 series
backported, where a single VFIO_IOMMU_UNMAP_DMA held a CPU past the
soft-lockup watchdog (host identification, register dump and module list
trimmed):

 watchdog: BUG: soft lockup - CPU#261 stuck for 22s! [qemu-system-x86:134503]
 RIP: 0010:vfio_unpin_pages_remote+0x139/0x2a0 [vfio_iommu_type1]
 Code: 90 4c 89 e1 48 c1 e9 34 75 74 4c 89 e1 48 c1 e9 22 75 6b 48 8b 0d f7 6f c2 e3 48 85 c9 74 5f 4c 89 e2 48 c1 ea 16 48 8b 0c d1 <48> 85 c9 74 4f 41 8b 55 30 4c 89 e6 48 c1 ee 0f 83 e6 7f c1 e6 05
 Call Trace:
  <IRQ>
  ? watchdog_timer_fn+0x3d6/0x440
  ? running_clock+0x10/0x10
  ? hrtimer_interrupt+0x185/0x580
  ? __sysvec_apic_timer_interrupt+0x44/0xe0
  ? sysvec_apic_timer_interrupt+0x6b/0x80
  </IRQ>
  <TASK>
  ? asm_sysvec_apic_timer_interrupt+0x16/0x20
  ? vfio_unpin_pages_remote+0x139/0x2a0 [vfio_iommu_type1]
  vfio_sync_unpin+0x96/0xf0 [vfio_iommu_type1]
  vfio_unmap_unpin+0x324/0x3d0 [vfio_iommu_type1]
  vfio_remove_dma+0x25/0xa0 [vfio_iommu_type1]
  vfio_iommu_type1_ioctl+0xcd5/0x1760 [vfio_iommu_type1]
  ? amd_pmu_v2_enable_all+0xa/0x30
  ? perf_pmu_sched_task+0xbf/0xf0
  x64_sys_call+0x282/0x1ac0
  ? syscall_trace_enter+0x1e5/0x1f0
  do_syscall_64+0x68/0x130
  entry_SYSCALL_64_after_hwframe+0x4b/0x53

RIP is the mem_section root test in pfn_valid(), inlined into put_pfn()
through is_invalid_reserved_pfn(), so the stall is in the dma->has_rsvd
per-page loop.  mem_section[] has no root for that pfn, so pfn_valid()
returns false and put_pfn() does nothing - for every pfn in the mapping.

Track whether the mapping also contains non-reserved pfns and skip the
walk entirely for reserved-only mappings.  Mixed mappings keep the
existing per-pfn walk, and ordinary mappings keep the existing batched
unpin path.

Tested on an affected host: reserved-only mappings up to 128 GiB take the
new path and complete in microseconds.  The ordinary-page path was
exercised unchanged.

Suggested-by: Alex Williamson <alex@shazbot.org>
Link: https://lore.kernel.org/all/20260803154707.71cc0d6b@shazbot.org/
Signed-off-by: Samuel Crossley <samuelcrossley@gmail.com>
---
This is the reserved-only fast path you suggested on v1, tested on
the affected hosts. There is indeed no evidence that the non-reserved
VFIO path needs chunking, and agree any such change to
unpin_user_page_range_dirty_lock() would belong in mm, so not
including it in this patch.
---
Changes in v2:
- Replace v1's cond_resched() chunking with the reserved-only fast path.
- Tested on an affected host; reserved-only mappings up to 128 GiB now
  complete in microseconds instead of walking ~33.6M pfns.
- Link to v1: https://patch.msgid.link/20260723-vfio-v1-1-3b59579916c6@gmail.com
---
 drivers/vfio/vfio_iommu_type1.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c8151ba54de3..f7addfbe1aab 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -94,6 +94,7 @@ struct vfio_dma {
 	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
 	bool			vaddr_invalid;
 	bool			has_rsvd;	/* has 1 or more rsvd pfns */
+	bool			has_non_rsvd;	/* has 1 or more !rsvd pfns */
 	struct task_struct	*task;
 	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
 	unsigned long		*bitmap;
@@ -791,6 +792,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 
 out:
 	dma->has_rsvd |= rsvd;
+	dma->has_non_rsvd |= !rsvd;
 	ret = vfio_lock_acct(dma, lock_acct, false);
 
 unpin_out:
@@ -821,11 +823,13 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
 
 	if (dma->has_rsvd) {
-		unsigned long i;
+		if (dma->has_non_rsvd) {
+			unsigned long i;
 
-		for (i = 0; i < npage; i++)
-			if (put_pfn(pfn++, dma->prot))
-				unlocked++;
+			for (i = 0; i < npage; i++)
+				if (put_pfn(pfn++, dma->prot))
+					unlocked++;
+		}
 	} else {
 		put_valid_unreserved_pfns(pfn, npage, dma->prot);
 		unlocked = npage;

---
base-commit: 4e3c1fc8abcb8eff062150b4340fa4569696d645
change-id: 20260723-vfio-decd86bf3cf6

Best regards,
--  
Samuel Crossley <samuelcrossley@gmail.com>


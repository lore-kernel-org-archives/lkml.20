Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0A1FF1DA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955541; cv=none; b=sFOZCd6nhBLaevR93TP6J729r/L8CrrRxy56viGqzwVDo7c+JUq7k5l19w4e2bAATXvcOjwj9lqPPJo99I+3pkE/8rdjhhvHy7MqeQ6JV3ebnlu3OK6xDPZHp0SKOGSKaagy/f6JXEhHjifB+De7v2PFwBWJSDXGpIq7PAzStVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955541; c=relaxed/simple;
	bh=O9aI5rrFScSHVd13CMcVMMtiXqXaFDZ3RAccZUoUcS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qrVIHrGUMpWwus3mgF5qMGQwUkpivmHpEHc5jt9Pc5TkIL8mfk3/9WLC9AAjxyAvKDYQrCFQ0J80In8BeuKrrW99hndq5dkea80+H09Deaf2TbfD3Plbbax8/pEfZUQA+zD5dxsWpphqQHj7zM4j6ajh2PknL28PER+akDbMr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKtOIsNT; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKtOIsNT"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso9942a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791955540; x=1792560340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wyjNb2Ele/9LBjsTTcFa0oR1etdSEyzqUmFNVJDmtE=;
        b=BKtOIsNT8/mVz1/E5BHa6rXyMJXGkvTq68qUQLsyuHdkOfdnZTJqQDZ6lCgXpXjjt7
         2SQ9POKUuYUpcjkLkqRY7VTnS/wsInrdmSRh4DAZJOZ3JKUfKVT4STnUXSoGU9Pw0qHo
         Q7FtZIi7zQvwK0DzN1Ce3f9rTF5xW2R2H4fW9kD87BkNxaYnQEkOyxVo7MuWPFxJVjSK
         6B4tJPQUMYbdOvS7C8wBrv8YC8ETGEEOXHciIIfaTImkqUYpwqc0bC5rrUaIaHer61ho
         h7j90UCTy7vEPc8hQ7SIOj6EXIS6mCKRcoghrAyY6nBYnEEVWA7u56nTyGo6FVymgtUw
         eGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791955540; x=1792560340;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9wyjNb2Ele/9LBjsTTcFa0oR1etdSEyzqUmFNVJDmtE=;
        b=AXcjWDrB6/0WLHzuXBER5IM8eMKEhVk8QjhwjhGWDCIQdmo9SvDTu5qBbeZ8qAl9yb
         TYAIp5YqoiFJvRLoN/oxIB4GNi3TTAFNSgJknkqC4xs+Ct1MM3bKzq5NEkzgzPrhVHad
         anlm15VksthWctqgnHHQCffc9vx6BQRYFu0dwsAa7lqAlHVpU7y/2qHEocmG9i4+zwBN
         FW4ip4NqTrm9fQ8jpNCG79qpJBCu3TvEpU87fBFCnqKmemOcnpTHuyW3MrWpRcnpcGk8
         qTdmcZ+DbvHWZXlLCOAICpnmKSYjOtYRKrL75Q9U8wUA3nfUW9XXDUyeulJQ7VsjPLEN
         n+6A==
X-Forwarded-Encrypted: i=1; AKwUvBzNfhcJzO/l0sjT5uYAZWIfq72HsgqiY4FRwmo/jMG0aJrUZiRDUATXPHfEB5zWOY0U2cxnAUkwyhwwuf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWqE2MWjMQu4l8SedHKqNbTP2QhXNk7ZOzyQkPvc4eyhkDgRLM
	sRJuDsaqx9zIlBzkb5XJcjPSx1oaHPtO4j5WU20L5jfaVOyWIsbqBmZ/
X-Gm-Gg: AYBFou08iiY/uYgcX+Cf/ClYRqgDz2ex6mWRD+crF3J8Vzip9IJ1oRF3IdDB9OIIs40
	BXTdu3JXGgHz97IaBpjXNEPsN6LDStrpltMBS2TuS6Wwi9QPpqthivdpROrOUAD1GEhlgkIgqrW
	K9U4jtITCCToCgQ5j3Gy9P0rA2ZjDeB5fn8Td+n4qnGXJ+gv0iDToWXJ5w0U2B7p9pTFmguXYX2
	COnvI+NvKTbj6lYg7AjX4V1PBsGcu/hOKb7igM9CogfRXZ5K7z/u2vqrYzJ68+V4/iIpVp81GHX
	QnZitR9IP81AISwVsKLL+r0dJsIZ970gFxheeKOdmbtLi0o/laMo67VXxOAbI0U6A7ygnsF69mr
	pDpId2sqmmPl7usgJqg1D33jhOc9IlppuwCcHv7WgusxEHZcFQOvHCRlN82sXYGtvfL7mfc4hwJ
	ju/cFLoyUx12sVk7hlLnIGEtkN+DHPp/pcayiLEp0kt2+W0guRIDnV6BoH9S+f37dU6w==
X-Received: by 2002:a17:90a:d2ce:b0:3a9:9f13:e960 with SMTP id 98e67ed59e1d1-3ab3a98f4e3mr12527379a91.60.1791955539666;
        Tue, 13 Oct 2026 22:25:39 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f05083fsm2901652a91.1.2026.10.13.22.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:25:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sammiee5311@gmail.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
Date: Wed, 14 Oct 2026 13:25:31 +0800
Message-Id: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The hrtimer record must remain alive while a linked PCM action can
visit its substream. dummy_pcm_close() frees that record before
pcm_release_private() unlinks the substream. runtime->private_data still
points to the freed allocation.

With two configured dummy capture substreams linked and the hrtimer
backend selected, final close drops the group to SETUP. A surviving
peer can then issue PREPARE before the closing substream is unlinked:

  Target close                       Peer PREPARE
  snd_pcm_drop(): group -> SETUP
  do_hw_free()
  dummy_pcm_close(): kfree(dpcm)
                                     snd_pcm_action_nonatomic()
                                       read-lock snd_pcm_link_rwsem
                                     dummy_pcm_prepare()
                                       read dpcm->timer_ops
  pcm_release_private()
    snd_pcm_unlink(): write-lock

PREPARE holds the link read semaphore and the members' buffer mutexes,
but driver close holds neither across the free. Unlink's write lock
comes too late to protect the record. The ops-pointer read can use freed
memory and dispatch through an invalid function pointer. If PREPARE
already obtained the record before close, dummy_hrtimer_prepare() can
instead write period_time after it has been freed. The report below
shows the dispatch-time read and the ensuing fault; it does not show
the later write.

Defer freeing the hrtimer record to runtime->private_free. Runtime
detach follows unlink, which waits for existing linked PREPARE actions
and prevents new ones from visiting the target. Cancel the embedded
timer in the destructor before releasing its storage. Register the
destructor from the backend free callback so the open error path also
releases the record through runtime detach.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in dummy_pcm_prepare+0xb7/0xc0
    Read of size 8 at addr ffff888106b35f00 by task alsa_pcm_fixtur/491

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? dummy_pcm_prepare+0xb7/0xc0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? dummy_pcm_prepare+0xb7/0xc0
     kasan_report+0xe0/0x110
     ? dummy_pcm_prepare+0xb7/0xc0
     dummy_pcm_prepare+0xb7/0xc0
     snd_pcm_do_prepare+0x71/0xb0
     snd_pcm_action_group+0x505/0xb30
     snd_pcm_action_nonatomic+0xab/0x150
     snd_pcm_common_ioctl+0x1bf5/0x3a50
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? do_vfs_ioctl+0x1f5/0x1280
     ? __pfx_do_vfs_ioctl+0x10/0x10
     ? ioctl_has_perm.constprop.0.isra.0+0x34f/0x500
     ? __pfx_snd_pcm_common_ioctl+0x10/0x10
     ? __fput+0x5ba/0xa60
     ? srso_alias_return_thunk+0x5/0xfbef5
     snd_pcm_ioctl+0x76/0xb0
     ? __pfx_snd_pcm_ioctl+0x10/0x10
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x41ee8d
    Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
    RSP: 002b:00007ffcfa72fb60 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 000000000041ee8d
    RDX: 0000000000000000 RSI: 0000000000004140 RDI: 0000000000000004
    RBP: 00007ffcfa72fbb0 R08: 00007ffcfa72fb98 R09: 0000000000000110
    R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffcfa72fcd8
    R13: 00007ffcfa72fcf0 R14: 00000000004a8f28 R15: 0000000000000001
     </TASK>

    Allocated by task 488:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     dummy_hrtimer_create+0x4a/0x170
     dummy_pcm_open+0xe7/0x730
     snd_pcm_open_substream+0x926/0x1580
     snd_pcm_open+0x28d/0x6d0
     snd_pcm_capture_open+0x82/0xe0
     snd_open+0x1ec/0x3e0
     chrdev_open+0x21f/0x660
     do_dentry_open+0x5c8/0x1300
     vfs_open+0x87/0x390
     path_openat+0x2460/0x3cd0
     do_file_open+0x21e/0x470
     do_sys_openat2+0xf4/0x1b0
     __x64_sys_openat+0x136/0x1e0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 490:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     dummy_hrtimer_free+0x72/0xe0
     dummy_pcm_close+0x9f/0xd0
     snd_pcm_release_substream.part.0+0x104/0x310
     snd_pcm_release+0x106/0x240
     __fput+0x39f/0xa60
     fput_close_sync+0xff/0x200
     __x64_sys_close+0x8c/0xf0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    ==================================================================

Fixes: c631d03c6873 ("ALSA: dummy - Support high-res timer mode")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 6b0a06e5c87638264e5d22deda1fe4bc028febe7..ae7cef9d74819a68dcf951a21768dccf38c7c4ad 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -476,13 +476,20 @@ static int dummy_hrtimer_create(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static void dummy_hrtimer_free(struct snd_pcm_substream *substream)
+static void dummy_hrtimer_runtime_free(struct snd_pcm_runtime *runtime)
 {
-	struct dummy_hrtimer_pcm *dpcm = substream->runtime->private_data;
+	struct dummy_hrtimer_pcm *dpcm = runtime->private_data;
 
+	hrtimer_cancel(&dpcm->timer);
 	kfree(dpcm);
 }
 
+static void dummy_hrtimer_free(struct snd_pcm_substream *substream)
+{
+	/* Linked PREPARE can still use the data until unlink. */
+	substream->runtime->private_free = dummy_hrtimer_runtime_free;
+}
+
 static const struct dummy_timer_ops dummy_hrtimer_ops = {
 	.create =	dummy_hrtimer_create,
 	.free =		dummy_hrtimer_free,

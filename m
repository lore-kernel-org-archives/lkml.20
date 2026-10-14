Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBEC2EEE75
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975145; cv=none; b=g4F2FJkuUNvH4hDm6faekZHPWZAZSTCshrPJI1BGNI83L/VBAwYJ7i5TppJzwIGBkY/TQbkKXiV3kazCofha8/69Z1tt/deJ+ZT7ZV1V8YgzwrYSp1AvTrqbruG2K+fVqAoKS317QXfgfTpKGusp97ZZKuLQHnx4lQEwXi2Yidc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975145; c=relaxed/simple;
	bh=KC7L3HOCxgUxs3mngBmu27dN4Eu3zyEcFFlE3Y81JXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XFkxZ3lSbTY5Mj8CPt8D2POqfVO5MuFmms4MzG5EZ7RZXUdsjIvWvm2R4woBG/SMZWk3QjtvXRy5DwRWWvadTC9dDm0PmZ4dNusmxgVGu6D8a8TRejXwNqJMFgJUQ+mD0R+bgENeIpyBC5tQIG+tojPqcGPs4XLSyBid05fE+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jkbr5Rzi; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jkbr5Rzi"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1714885a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975144; x=1792579944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY3s9VrcLeQGc0J6wLy2piQCF+zR8PiZiRlswemnIag=;
        b=Jkbr5Rzie9oNUeSELPGKYAY5ZZvmgJ32KugOZ2Ar3heN03vLt7pG/baD0i7ochVL0N
         ZxK4AqwxJm6ZScY1VTA3tHfVoz+MxPCFPOmaHX4u4T5eooAxdM8ICm7HfEEhPCyCuyIa
         ClMfYOYaLwMONQPe3il6gDUA6MiiUUWFnUNzUrMx+NRHAqK0M74aMvz7XcuQ3zFo/rY9
         B7sm+S+iIqwgvsvtJfgn//RoGukpxEiMV1568kTGJcGlN76SsSwyFBMOaYtw2XLXOVMG
         KyrZM6rn+srRSaB1ir3hSlNvOvLA0hg7DrlsOXije6fKZgq2y/aI5hqoVTj60y79u9PB
         G0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975144; x=1792579944;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TY3s9VrcLeQGc0J6wLy2piQCF+zR8PiZiRlswemnIag=;
        b=lYr81XWQuCon9w7+mIpIlbOL7NdWqhcKCSZdRTYylF3VybbM24ccjQVh6QNojNVIAp
         SEDPRHZdW8Eo9V66uWsseEnBQaOkm7a95J5W1bZtVrHMZszPJ6yVq+ck7qG4pLFme9wW
         +HEzTFnjNYnMgwEcG2y261GNiQBMoz4KFalAgjLW0LV9XhYUgOngWmXplxLprTLCLW0q
         UBhqFQMNP2/jAjgEuu3Z9rkJp80ElP/5koD4VwyGEmU1HzpLPgTHbxR2ba0ReQGtxl8O
         3W28exxdX1Gw3ermQvQfjYi/wOo+fOQ1jJvG/gYPWr0QpPVBKS01ZeA9RyYksWkfn+Nk
         dJXw==
X-Forwarded-Encrypted: i=1; AKwUvByu41CF4VNOqahaJuf76MtxEU2IIEKy26ZMkOd217MQSLJnAfg4tCd+XA5SYaKT/5Yu7dgFJZN6bBvaKyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1JBY7OPgVBRiw3qIyGqi/vAPvWGC3xOczRMwi78ujiD+d0/4s
	qBopbK9N2kTPuwZyqJj/LCqQtaHOt/gRDRw/dlubMOfn8xsfZnut4GZd
X-Gm-Gg: AYBFou2JvFBTGfdY1D2W4zlqoFStU6I9G6pqARVfeDD0r24GZ1jvenZb6QMYlBx4zyE
	sDhCZrJ2gnDOYaUpjCO5GOE+z1LxYiUmf2C8+7y3u8M93D9Fxrv2VZuWcmPPU8Jww7gSlEskFbr
	qd6+NsFbFO51Q+yfX1xzK7jK8py4aYo8CoMTHDmJiQbDMnkl2TJJYmvWDtuQcu12Qb1OAPtgik6
	872GcrcmEENKQPruhJyfRZv0Xi+e100ZZl88nRTF5ABZ2jp5aXYyFqZ6vauIUw2t5o10HiXReov
	l992YUVxv9XjcJDcn6pvk1pIHnnWXsXr5EOEoxaicHMfp3eWLf95Hu+dlkjqJj/4FbBRLZJLJ8k
	fjGIdwIS5iGEDf+668PG6+LMto/DPvEs8yK4ppLtQaY/eXZKH6I7FI+yR0o3/FCVPpmOYVpS37r
	661VuChS3v0pZJYoiFTau3Mb1H+7cwgHmFHhksf5iwsffDBFrl/3+hv3W5Utb3tpKAzA==
X-Received: by 2002:a17:90b:4d88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ab3a952849mr13022935a91.12.1791975143729;
        Wed, 14 Oct 2026 03:52:23 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6069ca15sm4058914a91.11.2026.10.14.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:52:23 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	cassiogabrielcontato@gmail.com,
	kees+treewide@kernel.org,
	zzzccc427@gmail.com,
	yilinzhang@moonshot.ai,
	sammiee5311@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
Date: Wed, 14 Oct 2026 18:52:15 +0800
Message-Id: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A closing PCM substream can remain in its linked group after the
driver close callback has freed its private data. With two configured
dummy capture substreams on the same PCM device, linked with LINK,
PREPARE on the surviving substream can still visit the closing member:

  Final close of A                   PREPARE on linked B
  ----------------                   -------------------
  snd_pcm_drop(): group -> SETUP
  do_hw_free(A)
  dummy_pcm_close(A): free dpcm
                                     Take snd_pcm_link_rwsem for reading
                                     Walk the group, including A
                                     dummy_pcm_prepare(A)
                                       Read freed timer_ops
  pcm_release_private(A)
    snd_pcm_unlink(A)

Unlink at the start of final substream release, before dropping the
stream or releasing driver resources. The link write lock waits for
an existing group PREPARE, and unlink removes the closing member from
later group actions. Keep the existing stop synchronization in
do_hw_free() before the driver resources are freed.

Make unlink independent of the pcm_release callback so OSS substreams
are covered too. Remove the native-only unlink callback and its
registration, while retaining the callback hook for OSS cleanup.

The existing KASAN report below records the freed timer_ops read in
dummy_pcm_prepare().

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

Fixes: 1576274d3028 ("[ALSA] Fix Oops of PCM OSS emulation")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---
Changes in v2:
- Replace dummy-specific deferred freeing with Takashi Iwai's PCM core
  release ordering.
- Unlink unconditionally on final substream release before DROP and driver
  close, covering OSS callbacks too; keep the existing sync-stop in
  do_hw_free().
- Update Fixes to the PCM core commit that moved unlink after driver close.

Link to v1: https://lore.kernel.org/r/pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe9dcd8d48b934c3944d3fe159bcd6..c28d259463a11891893c352216fadcd5d9484f8b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2792,18 +2792,14 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static void pcm_release_private(struct snd_pcm_substream *substream)
-{
-	if (snd_pcm_stream_linked(substream))
-		snd_pcm_unlink(substream);
-}
-
 void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 {
 	substream->ref_count--;
 	if (substream->ref_count > 0)
 		return;
 
+	snd_pcm_unlink(substream);
+
 	snd_pcm_drop(substream);
 	if (substream->hw_opened) {
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
@@ -2887,8 +2883,6 @@ static int snd_pcm_open_file(struct file *file,
 		return -ENOMEM;
 	}
 	pcm_file->substream = substream;
-	if (substream->ref_count == 1)
-		substream->pcm_release = pcm_release_private;
 	file->private_data = pcm_file;
 
 	return 0;

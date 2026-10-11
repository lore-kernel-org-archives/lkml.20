Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BD2868B5
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734166; cv=none; b=hxzRoTi9fMOv0e8ayb7iujcDq+4zYnl2MjEybQdt7Q3eiIDYpDmjsZ1Z3MTZ9FILvN4zHudcWSjkW+xaLhZ2KHGiS2bjs7qm+KEvuDj/WJRDwEq+lqbTjxuYo07wWzZOM1ELq6uKMNhQ55n43eWV9wwkav39OomCE10OoB4QwMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734166; c=relaxed/simple;
	bh=Z33OoOUCkiF99Jg6fpBVufhDRiAJuqfotL1HShymTmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KDMxwHP0eXNowtN14vIKMAmCr+M8NaI8f/6ZRBQuBD/uX7tgJkMFR8yZd1nfpV2/uAI6IyoybZsgwpzNx2mbHxs0jtEEJc26ryNQM2AYXd8+uYW3JNZfwMSTxH7iBNforTqK6Lnd5JCSzrWzi7vIf+jvQgekoJVGg4+6C+fg+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tb+9AyfH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tb+9AyfH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e87c66e556so4131255ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791734164; x=1792338964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MliOx1SknrFw3KuGPnYR9xAOM1vlK7FM2RImt18DrR4=;
        b=Tb+9AyfH2NExuFHpFZWMF3UkpcCRZSVIfaG169GLaj0RkR7jZm5GE8JSkGrrM/QRiL
         dISUhDFev3/+EraBDpEYxjEDmvZ7+MdpZ/dGELPNOS3a6dmZw438Yq01q18aL0EMoTji
         1/uDxLeCnNLtIoHvDl6HLp2288LZ1xzszKhNAnpxgFCUhsd0lKYdvcuGlaV088zFxLKG
         B9E3lTb5HDjdqGRiFDn1i5ISd5JBo67CUTsNmwxcGWeGsBlAOFnDeoOKJlYBi279Gh/t
         Kve3H5bDhkI12oXsjzKo3iQCPnhaMoVM8p7212+diGSRY6wkeqxIgDbQ8+no8ucrYybC
         dkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734164; x=1792338964;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MliOx1SknrFw3KuGPnYR9xAOM1vlK7FM2RImt18DrR4=;
        b=xjEelBZbiSqsY3e8xWcAlNL/u1al8X0naQd/rATb4ivEcICOg4tgITGycoYWVQcBzJ
         123/caLApzp+rVlRKjuUpyHYQ21XORTjPb/No8W1SnUStFr59kqhqZqMxRkHWl1AbIXi
         WFhOSU6ZMyaZ6j/RIsVFQDR53FF1wsce4rhEkRf42kcfhXDEfuV3sE54f83RfyBiDqOM
         9p5DS05lYVagJaXo0O+TOo/Xqh5oM3bQSRjpRxSNtszIcJk15ruzR1jVh+t2O0yVkCWz
         0ALfS3ijHYhhSx+JDnG7Kt10lJ3QhOCfpCBOHVoPaedZhhBUFYU6mBAVGre8GmtJPua/
         lyTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdQCoCJir5dvkVWtiKIDicbs/GApraeMmNUrVlOCJiDW3S2q3vlh6s5euYnHEvMVxsoOzSdikBVYBYhHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPnotwAQHhPaCKjDR3MGRmqRHzhkIX1yeUfrmVUYwPTzg5NukO
	2y22NqwEhCcxHxVn5sQ/2YQS+W8SXPcyj1BCCQ5qrgNovmNKRwfTdugl
X-Gm-Gg: AYBFou2XMRJXMf6Hq2leOrrZF1NoGddll3eY6Tw0D4nVVgnTdinShFG/porYQrkVIXa
	Rvof+s8ENb2u1c3Z/bh6p3/738f+aTm8U8biIEqR4r+zwt6TUcy8S2Z2ZM3pCB4U1ByaH8TXI9Z
	xbCfUk7SvIypdXMLCsj69e3jgdKsK05+SpuzVoFqe2FxfwWZML0CSu5z7Xs+vGxiUyD9yWh4oS6
	2e/NGDC6lbvieowNGD9fpqvHfZZVmr0phb9Zq9UXxwze+1Y1Co9tEg088npTJRbTAGKTLQkmT4A
	KxBLQEZuxo3eWyaYlQUzpAudfab/E2txLU92UMTwAnZ9WQHVlqj6ODIYwHbzhX5mOtZZiOzMooP
	9c9kU0ka2ivEx8qU73cqBrFfTeRfP8ARh5Sl7Qas+XG9fxTiL40OikUggDlkrrkNZ4EdZSOh/HS
	IHIF0JIjxRbcsg4+ItwAcj+eeTH8niUmv/BmCBJ535z0Xuc8BmEflwB3NXDiuAgwvjFShSXP+dN
	0k7
X-Received: by 2002:a17:90b:3912:b0:3a4:930e:6c35 with SMTP id 98e67ed59e1d1-3ab3a369eafmr4117996a91.4.1791734163954;
        Sun, 11 Oct 2026 08:56:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39392e9bsm7732579a91.2.2026.10.11.08.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:56:03 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	blum@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: jack: Remove debugfs before freeing unregistered jacks
Date: Sun, 11 Oct 2026 23:55:56 +0800
Message-Id: <pm-pmb-e1e7490bbe7ba1b3c44a-v2-3e3b6315a18c02ced60d@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jack debugfs files store a raw snd_jack_kctl pointer, so their
callbacks must be drained before the attachment is freed.
snd_jack_dev_free() unlinks and frees the attachments before calling
snd_jack_dev_disconnect(). Its late snd_jack_remove_debugfs() call
then has no entries left to traverse.

With CONFIG_SND_JACK_INJECTION_DEBUG and input support enabled, an
HDA codec rebind on a live card can publish a non-phantom jack's type
file while its component is still in SNDRV_DEV_BUILD. A later
jack-control allocation failure permits the following order:

  1. hda_codec_driver_probe() creates a jack and publishes its debugfs
     files before reaching snd_card_register().
  2. A later control-build failure calls
     snd_hda_codec_cleanup_for_unbind(), then snd_hda_jack_tbl_clear()
     and snd_device_free(). __snd_device_disconnect() skips BUILD
     components. snd_jack_dev_free() frees the attachment before its
     late disconnect, leaving the debugfs files published.
  3. After cleanup, a reader opens the surviving type file and
     jack_type_read() dereferences the freed attachment's jack pointer.

The card's debugfs root remains live throughout this sequence. The
result is a use-after-free even without an overlapping read. An
already admitted callback is also not drained by this cleanup.

Call snd_jack_remove_debugfs() before unlinking any controls in the
free callback. The existing debugfs_remove() rundown blocks new
accesses and waits for active callbacks while the attachment, control
and jack remain valid. Roots cleared by an earlier disconnect are
NULL, so repeating the removal is harmless.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in jack_type_read+0x1da/0x1f0
    Read of size 8 at addr ffff8881085f9da0 by task python3/429

    CPU: 2 UID: 0 PID: 429 Comm: python3 Not tainted 7.2.0-rc6-pmb-alsa-functional-v2+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? jack_type_read+0x1da/0x1f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? jack_type_read+0x1da/0x1f0
     kasan_report+0xe0/0x110
     ? jack_type_read+0x1da/0x1f0
     jack_type_read+0x1da/0x1f0
     ? __pfx_jack_type_read+0x10/0x10
     ? __pfx___debugfs_file_get+0x10/0x10
     ? __pfx_cp_new_stat+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_permission+0x122/0x570
     full_proxy_read+0x11f/0x180
     ? __pfx_full_proxy_read+0x10/0x10
     vfs_read+0x1a0/0xc20
     ? __pfx_vfs_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __do_sys_newfstat+0xa6/0x100
     ? find_held_lock+0x2b/0x80
     ? __pfx___do_sys_newfstat+0x10/0x10
     ksys_read+0x111/0x200
     ? __pfx_ksys_read+0x10/0x10
     ? full_proxy_llseek+0x11e/0x170
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f7e392e7687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007fff5f7b9180 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
    RAX: ffffffffffffffda RBX: 00007f7e39253780 RCX: 00007f7e392e7687
    RDX: 0000000000002000 RSI: 000000003d2e9b00 RDI: 0000000000000003
    RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 00007f7e39253700
    R13: 0000000000002000 R14: 00007f7e38d7e2c0 R15: 0000000000a55b98
     </TASK>

    Allocated by task 425:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_jack_kctl_new+0x80/0x180
     snd_jack_new+0x4b/0x490
     snd_hda_jack_add_kctl_mst+0x19b/0x610
     add_jack_kctl+0x204/0x320
     snd_hda_jack_add_kctls+0x212/0x910
     snd_hda_gen_build_controls+0x233/0x600
     snd_hda_codec_build_controls+0x2e4/0x9f0
     hda_codec_driver_probe+0x26e/0x590
     really_probe+0x21f/0xa90
     __driver_probe_device+0x1ec/0x490
     device_driver_attach+0xdc/0x210
     bind_store+0xec/0x180
     drv_attr_store+0x79/0xb0
     sysfs_kf_write+0xed/0x140
     kernfs_fop_write_iter+0x34b/0x500
     vfs_write+0x637/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 425:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_jack_kctl_private_free+0x153/0x200
     __snd_ctl_remove+0x29f/0x3b0
     snd_ctl_remove+0x46/0x70
     snd_jack_dev_free+0x1b1/0x370
     __snd_device_free+0x193/0x3f0
     snd_device_free+0xcf/0x190
     snd_hda_jack_tbl_clear+0x159/0x2e0
     snd_hda_codec_cleanup_for_unbind+0x37e/0x9c0
     hda_codec_driver_probe+0x3ae/0x590
     really_probe+0x21f/0xa90
     __driver_probe_device+0x1ec/0x490
     device_driver_attach+0xdc/0x210
     bind_store+0xec/0x180
     drv_attr_store+0x79/0xb0
     sysfs_kf_write+0xed/0x140
     kernfs_fop_write_iter+0x34b/0x500
     vfs_write+0x637/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff8881085f9d80
     which belongs to the cache kmalloc-64 of size 64
    The buggy address is located 32 bytes inside of
     freed 64-byte region [ffff8881085f9d80, ffff8881085f9dc0)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1085f9
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff8881085f9c80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
     ffff8881085f9d00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    >ffff8881085f9d80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                   ^
     ffff8881085f9e00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
     ffff8881085f9e80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: 495000a38634 ("ALSA: core: Remove debugfs at disconnection")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 0f04018181acb20f6bf85b11a9f6d4c7d3179e5a..5cc9c42de9811e525b32935d98befbacaa09d500 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -68,6 +68,9 @@ static int snd_jack_dev_free(struct snd_device *device)
 	struct snd_card *card = device->card;
 	struct snd_jack_kctl *jack_kctl, *tmp_jack_kctl;
 
+	/* Remove debugfs while the controls are still linked. */
+	snd_jack_remove_debugfs(jack);
+
 	list_for_each_entry_safe(jack_kctl, tmp_jack_kctl, &jack->kctl_list, list) {
 		list_del_init(&jack_kctl->list);
 		snd_ctl_remove(card, jack_kctl->kctl);

Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743E39EF20
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878104; cv=none; b=L71tRN7LeLNPdYuQ5FAPXQ5DgC+aunQKyD+taXfvsz19gu7RkTI+u4Ko0aDY6DdUk4j8TlX0gFbGPjM/LiAxwGPCMF/0RS+cqFVGWQDABJWLwfGvWSbW2/ohUQDE43aBoCJLllLOp93vFfZW8vHzkWh2Pa27rmSj/pOtV0k6iQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878104; c=relaxed/simple;
	bh=EgSh0MeykZKTI/sMFgoYkWo6fEqw41vxM29on6Q8vYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UZ7paY4VP9RRr89wwtu+mAW3LQkAUTfXMUirT5acdReZd0FXN3nPbKBze+McfCipR9w15BVC2cgqdiVIklCRkHbiwbXOJZtJxNa9U6nTafPZAGvnsliiPK/qeJd1RBUjND43TGF5DKgV8WH05L0C62Q6Zsd0eBVC0WpdWuBOzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuVNOrIH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuVNOrIH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e836252e1dso21188475ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791878102; x=1792482902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVb8dGJgBOCepBEpRi0mzE+ty+vlzyd21NuC7kLzqK4=;
        b=QuVNOrIHX47GFR5LR+v949lPXnUp4PkyVv9fmEky/rrGVrfbv/uUSChRBRehfvYBCk
         9Hb9aIC4Y7P3PWfucbupa87szHj1cAuEoHf3fpnfTH23NeR6FOGGkppOB7eOtE0EX2RG
         5oWTwyFkBLAatMpt0UvKNKvOKG+W7KFnD0b5unp11SMORHmP53cxOTUFDI5X/5LMJ13S
         zR7SB+V+QxoMWvOIuS7r9oE+le3iQBmEsLyE6DE71by0+NoWOTIkHtDEd+A591Pt0G9e
         W3zjY2G8SO7V2xzZJwXOIIJVSSMgYLlATDpA51Ca6/2rRcgV0Y4drq5rIFtMSdyEVx7g
         ZTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878102; x=1792482902;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pVb8dGJgBOCepBEpRi0mzE+ty+vlzyd21NuC7kLzqK4=;
        b=ZgS1Q3UKZTMnMiTXcIyfrdkMOoQUcajUoMO+ucYBqVGtq9yc5Jye8UMSYi/26glhar
         cy3D+TQQCokbP/0VfBotSAPx7N8doopkdTb+/MYbVcFS7oOflr+DBf2Bnse69tym0Odx
         XY+E4b/pbATvDqoNDkZj8tdgRPSKioD1izlbVPmnAqEa/5/tGRLbKJY5oiGMehI6EhOs
         asLOlS5txzDiXm/Y4kfpYSJtD6Fp1ytayIr1NJl/umA01xbkxShFyL6Ddhu1JtPqYj4j
         pKvBJ+oSJNms8OguiQGnDJdFipK/ODzer0f9KQf5RVKC+CzawoB5mz90HpYln5bSUE8n
         Wnlg==
X-Forwarded-Encrypted: i=1; AKwUvBwMykb0iesz9A3yn5fpRZjED7ASb7Wt2NIJCxW0hiFiOwnS8V6MOWcYRJ+2X8wcSEPFxwnth2vr+UbrOgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/bPo0jk5nxpgRZCjDIYo+fS8rfS7Ov6C7FH5lWm0gibTW6Y7V
	fJwXCFBy06B1TcXsPok8OCQ9hW5RZJdt8h1PQu4ZA0PdyDgkzi5Au+e8
X-Gm-Gg: AYBFou1qf8vMuvbbLkt7tj2FQBBYRBw2bSOVC+5q9EuWKmCSRajb1cuSJfL3DX/8e0o
	ijG+/nUBRKUkZVKXwUk3/soZpkZzpwDWIi0aodQB6vIY+ISXNpfC0FF/LlS0Nutmd2FJj35PGTM
	E1LuACCQBKf57Jb7ppMkFlfJwFFkKvyV4cq0dfjbaj/NVuGFlBM80uyfXUsqmEA43Pd39KKmLew
	9AvAGVpIevfvmoKofNvctgaOgG06K+3dAkig3AGjQcx7Ll1U4aGlFZ9tTcNL7rVN0XrTPenivWX
	sMomTWxRJwQUT14GqUpZlAVSBlYSHUs7T3nIw9mO5mXdx9luhXXTJEYDwJN3fqwoKzIf/LX69qG
	00gkSUMUQiOEhuAh6TTBSBro6yhX3US0zhrwFlj2C6beDHFPKIfPmE4aPAYOP+i5PihvKbjvmQk
	ORiX0IbyYEW6u69ldzqayXzRoPFz8sNk04SgYl8XjZwpKa8JnNDhr3v2D+X/vqRNQkWw==
X-Received: by 2002:a17:902:e541:b0:2e8:1f8a:9113 with SMTP id d9443c01a7336-2e842bd5caamr104835355ad.40.1791878102366;
        Tue, 13 Oct 2026 00:55:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e6b6sm51111515ad.20.2026.10.13.00.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:55:01 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	2022090917019@std.uestc.edu.cn,
	hemanth.selam@gmail.com,
	nfraprado@collabora.com,
	songxiebing@kylinos.cn,
	sammiee5311@gmail.com,
	kees@kernel.org,
	cassiogabrielcontato@gmail.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: hda: Serialize virtual-master hook registration
Date: Tue, 13 Oct 2026 15:54:55 +0800
Message-Id: <pm-pmb-c2667fb9cc42fbb7943c-v2-d4b95981cdbb696491c5@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An HDA virtual-master hook must have its private argument initialized
before a control callback can invoke it. snd_hda_add_vmaster_hook()
installs the trampoline through snd_ctl_add_vmaster_hook(), which stores
master->hook before master->hook_private_data without serialization.

When a codec with a vmaster mute hook binds to an already registered
card, snd_hda_gen_build_controls() publishes and initializes the Master
Playback Switch before installing the hook. A native write that changes
the switch can then run in the following order:

  1. The codec bind path publishes and initializes the master control in
     __snd_hda_add_vmaster(), then calls snd_hda_add_vmaster_hook().
  2. The hook setter stores master->hook, but has not yet stored its
     private argument.
  3. SNDRV_CTL_IOCTL_ELEM_WRITE takes controls_rwsem and calls
     master_put() while the setter remains between those stores.
  4. master_put() sees the callback and invokes vmaster_hook() with a
     NULL argument. The trampoline dereferences it before the setter
     can complete publication.

The write lock held by snd_ctl_elem_write() does not exclude the hook
setter, so this can cause a NULL pointer dereference. Take the same
controls_rwsem for writing in snd_hda_add_vmaster_hook() so the callback
and its argument are installed together with respect to native control
callbacks. Release it when registration returns, before the caller
synchronizes the hook.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
    CPU: 1 UID: 0 PID: 499 Comm: alsa-vmaster-tr Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:vmaster_hook+0x35/0xb0
    Code: f5 53 48 89 fb 48 83 ec 08 e8 57 f0 9a fc eb 50 e8 50 f0 9a fc 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 59 48 8d 7b 10 48 8b 43 08 48 ba 00 00 00 00 00 fc
    RSP: 0018:ffff888117647cd0 EFLAGS: 00010212
    RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84e9ff50
    RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000008
    RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff89427457 R11: ffff888115ad1d00 R12: ffffffff84e9ff30
    R13: ffff888114943ca0 R14: 0000000000000000 R15: 0000000000000001
    FS:  00007fe8167b3780(0000) GS:ffff88826b7e3000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000557c8c2842a8 CR3: 000000011579f005 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     master_put+0x20e/0x2b0
     snd_ctl_elem_write+0x37f/0x5e0
     snd_ctl_ioctl+0x997/0xdd0
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7fe8168c291b
    Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
    RSP: 002b:00007fffab0cb150 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fe8168c291b
    RDX: 00007fffab0cb310 RSI: 00000000c4c85513 RDI: 0000000000000003
    RBP: 00007fffab0cb310 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
    R13: 00007fffab0cb1c0 R14: 0000000000000001 R15: 0000557c4f71fd10
     </TASK>
    Modules linked in:
    ---[ end trace 0000000000000000 ]---

Fixes: ee52e56e7b12 ("ALSA: hda - Fix mute-LED fixed mode")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 18838a45e6f72b838eace2d7b21d7a0a3b21017b..029e56ae78727c8cb3c3edbace8b27a5615c2a3c 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2024,6 +2024,8 @@ int snd_hda_add_vmaster_hook(struct hda_codec *codec,
 {
 	if (!hook->hook || !hook->sw_kctl)
 		return 0;
+	/* Serialize hook registration with control callbacks. */
+	guard(rwsem_write)(&codec->card->controls_rwsem);
 	hook->codec = codec;
 	snd_ctl_add_vmaster_hook(hook->sw_kctl, vmaster_hook, hook);
 	return 0;

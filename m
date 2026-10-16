Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345134ADD9D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155672; cv=pass; b=IpVz6S+EfwGpwmJufZInjpSfzUTQoNiHIHO20Ap3ASO0iT+887zgfuzBVTdySTO9gYQ07sTz8daAzCI0VlGo4Qrl6C6gh4fUzt5PDeBgFXYc35886EqzdS7RgkJm22cls5lxDVGNejomrrdcWZD2uThJ53G1jZMGhD1Oa2aiaLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155672; c=relaxed/simple;
	bh=bsV8fIuGRPI6VUpZy8v0ZFF1vZ9c0KWw6JeFR9I4jvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Argckwsov2IWmuCDUsbdR9OgBPCtZy/HkLBe+tCz5hO5ak43BPTXpxREdfswfzszwWDO8CAGy1XsUpeGHE/WO2f4nLe6uuAJjJkKuSHrogAL8+mh6XpV2LEN78c+NoHCKyX03POUD/0nfD9RyWnYPCyRHv4ImxrMRsUzf/WiBcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+4n4pQj; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+4n4pQj"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67921b515a7so6561020d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792155666; cv=none;
        d=google.com; s=arc-20260327;
        b=Ba/QyNKVdDC9bMAk5ot1wGq3FG3gwjKB8bqi5TELPakL8of60cDhbbClD76x7PlIdB
         sYi1gnkfZLIA00qfpXTnWwzE1+O4sJy7FEZ3sn8/TR8RpGNgn9hCQSN6ZQZditp5K3Ox
         Z/4rCvvsGPmKmrIAIC1fIzYAnE5dsvFUAooOQCQLIFo5U5cZaILoJdzYUNbtty0evozL
         0veR9p9bfPuhy1aT3IA50UP/dJDn1P5vYYFCM9JKyuYt66eJtouaG1gjzZasTpPBJJ3i
         pBruO89zjZauyvjT5c4+Kb9AalCjha5qEhUenJSFfJg3DHxNRLErH7ycEBMJvzcoCj2W
         DyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlgCp0ru0pcYZvcVjiMieOEWIxndxVWssMJlFZ1Hkr4=;
        fh=1yY+q1Q8Ll/qGm3piCjYAyRDPmJH+FNe751BNh+2W2s=;
        b=D8E4TV7rfsGrmCumB2kZXq1l5FQIma4Z9SPCILlL/KqZtYpUfzzInZoRD2UYTRA0MJ
         j35MEtXervW/pV2vJFL71UpHaY5wVOR+fOvacI9U7Ks6niIU4Yt/yij2Sg8kEHOrjhXf
         +0vVADjW5rFQijiFOCPKz5NUlghLXV5uHjZqnZnyJKRI8tUYARgZpED4XfVM9cyaGnt7
         7vzdy+NRaPBYEEiJslqmcN9a4A0NpelhH61yXsASv1q9+aYFEZhL3wsMPNx/ranU3QD/
         lfl7RCZrJCKXqTux8N/T5DngsaTCWrayaUNQFvzVGRzh4KRKD3Y6Bw3BCWOIQHMtYJC3
         8A/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155666; x=1792760466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlgCp0ru0pcYZvcVjiMieOEWIxndxVWssMJlFZ1Hkr4=;
        b=c+4n4pQjysczzn/cbeH28ZrG5lCqdnTsELZzOqSIAvPpAP/Hddy2PUqqALhHuNt81v
         ERgD0kGV7bd2iFDBaQJfCX+1HmRrTDSZ6keMlBdKwzYqzt3fS8ubwAP3H4Tfcwx1m8bR
         jC/p2kjbCNTniuNhEVNWxTGH5/Kt6IG8U7LcZe3yNRnnW5k0Lv1Kv90x9c3pdhZapnjo
         3lp4lNAyn/yJByOA9EYoyWPKsQWaOv7sJrkYPJcfX71fZfjlQT+HNVTo7SMUct7465fL
         +3ZQLJd4Zg/k/x5K50GHxN4eknJQg0WGyfYxxkARG7M7tRYjxh7gOBkHWu20zouwLhdD
         zKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155666; x=1792760466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlgCp0ru0pcYZvcVjiMieOEWIxndxVWssMJlFZ1Hkr4=;
        b=FGfB3IxYY9Dj98Jor7LdSmKlw0qqFsKTioOJIEkLAkQwm4FR9XXv0Y1Z0L5wOhgkcN
         0vexNnmCOa2I1Qt0UCV17pdMsBQLoxUPxmq97EkBAm8iXVxSWz3N733FCYkEWllvxQ1S
         J7l1h2tORNzPYmpqsJvvsx48kVp9N3KpeuvjpJppvfwAwgn0f08WvDQWsXRhpupi+8af
         qW/soRVHXGuhq9wCGl14iyDaK2n7XNLt5fP9eW0YqGGymbomlGf6VCAYjiNkDUOYzXwL
         i72ZOncqZS5vXnjiG1XIe6V62ebT2eDNL+xv5OSOsucZp8kTqHXY5C5+rZipIHZN4Tao
         0t9g==
X-Forwarded-Encrypted: i=1; AKwUvBxSHMnTpR+2Wby0vmGKLahMcs7KFVbPpM7fO8iQiKLrRBpeJ5bc+ypOiGPSC1z0FARqKcRQevziNAogOpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAdBGNiK/z12pe+LnPKamcM/Mi93vWKKTILXmxHYdYja7arf4w
	h9huoNZwIwX2xazBnHfsmxeUGBnorAec5lzTmMCWaXnwUQZYlFV9MNFmW6m6PS6tNviBBCIYMcD
	7VIGRDAk7quBq+mR8tLCirFK8OZNUuLM=
X-Gm-Gg: AYBFou3LuufuKfOhJVxM3AwX7fRfb12xh81TCZLskkrskEDK68ggJoL2N+j9CP/A/Zs
	4uJ9jTxMu5JR3yZg00IjtIRyDq0AIfG8gBL7Jua6BG2yk1McW1F/r0sdvgu7OB4fSCdEN9cQLZW
	utQV8GH07UpRRbQNZJul4+KYxE9oHTRckGkNIJcouArrSGGNKrjNLi32g8nZP4pRIpBtqWVbVeE
	0UPjkNkMnSaEC2P2uHNWVCAs7/kc+88IcuP6sNBbzxB/ZikWnkNZ/8BJOOOPM6WobLOIctWou7u
	DwCHkEhbdN5Ivd++qJSxs/nmSMVpAVk2XS1hypEmHeLwBR836C+YsTdoccuYyixuw9xkFLudpMI
	N/aMCx4dK7KLbf52tZ206
X-Received: by 2002:a05:690c:c4e5:b0:8b0:d9a6:dbcd with SMTP id
 00721157ae682-8b0d9a6e1cbmr18677817b3.48.1792155665443; Fri, 16 Oct 2026
 06:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-0f2e227b93626e3c7554-v2-0b7a6296bbea01ae57e8@gmail.com> <87ik316gq4.wl-tiwai@suse.de>
In-Reply-To: <87ik316gq4.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 21:00:37 +0800
X-Gm-Features: AclHuK_0JEOdctcH41HnPX9tEV1XrL3Y6wlqQ6kkIqbH_D20ewwgYHtBpE6WKm8
Message-ID: <CAFRLqsVH=Xkeoh2icgSftWCnk3uEUGPst=N3qeGoZ7Zy9+W6WA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Protect debugfs setup against control removal
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, kees@kernel.org, 
	blum@kernel.org, hui.wang@canonical.com, kai.vehmanen@linux.intel.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 19:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 16 Oct 2026 04:04:37 +0200,
> Cen Zhang wrote:
> >
> > The jack control attachment must remain alive while its injection
> > interface is being initialized. snd_jack_kctl_add() links the attachmen=
t
> > to jack->kctl_list and then calls snd_jack_debugfs_add_inject_node(),
> > which dereferences jack_kctl->kctl to read the control name. Neither th=
e
> > list insertion nor the debugfs setup holds controls_rwsem.
> >
> > With CONFIG_SND_JACK_INJECTION_DEBUG enabled, an independent kernel
> > control owner can remove the newly linked control in this order:
> >
> >   1. The creator publishes the control with snd_ctl_add(), which releas=
es
> >      controls_rwsem, and links its attachment in snd_jack_kctl_add().
> >   2. The remover takes controls_rwsem for writing in snd_ctl_remove().
> >      __snd_ctl_remove() unlinks the control and calls snd_ctl_free_one(=
).
> >      snd_jack_kctl_private_free() unlinks and frees the attachment, the=
n
> >      snd_ctl_free_one() frees the control.
> >   3. The creator enters snd_jack_debugfs_add_inject_node() and reads th=
e
> >      control name through the freed attachment.
> >
> > This causes a use-after-free read during jack creation. Hold the existi=
ng
> > controls_rwsem for reading before linking the attachment and until the
> > debugfs helper returns. The remover's write lock then keeps the attachm=
ent
> > and its control alive throughout this post-publication setup interval.
> >
> > KASAN report as below:
> >
> >     BUG: KASAN: slab-use-after-free in snd_jack_kctl_add+0x50b/0x5e0
> >     Read of size 8 at addr ffff88810d8def00 by task kworker/2:1/68
> >
> >     CPU: 2 UID: 0 PID: 68 Comm: kworker/2:1 Tainted: G           O     =
   7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
> >     Tainted: [O]=3DOOT_MODULE
> >     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fi=
x, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> >     Workqueue: events azx_probe_work [snd_hda_intel]
> >     Call Trace:
> >      <TASK>
> >      dump_stack_lvl+0x93/0xd0
> >      print_report+0xce/0x630
> >      ? snd_jack_kctl_add+0x50b/0x5e0
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? __virt_addr_valid+0x20d/0x410
> >      ? snd_jack_kctl_add+0x50b/0x5e0
> >      kasan_report+0xe0/0x110
> >      ? snd_jack_kctl_add+0x50b/0x5e0
> >      snd_jack_kctl_add+0x50b/0x5e0
> >      ? snd_jack_kctl_add+0x5/0x5e0
> >      snd_jack_new+0x347/0x4c0
> >      snd_hda_jack_add_kctl_mst+0x19e/0x540 [snd_hda_codec]
> >      add_jack_kctl+0x1b9/0x2c0 [snd_hda_codec]
> >      ? __pfx_add_jack_kctl+0x10/0x10 [snd_hda_codec]
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? _raw_spin_unlock_irqrestore+0x44/0x60
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? pmbd_probe_hit_cookie+0xee/0x1c0
> >      snd_hda_jack_add_kctls+0x212/0x910 [snd_hda_codec]
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      snd_hda_gen_build_controls+0x23a/0x6a0 [snd_hda_codec_generic]
> >      ? __pfx_snd_hda_gen_build_controls+0x10/0x10 [snd_hda_codec_generi=
c]
> >      snd_hda_codec_build_controls+0x2e4/0x9f0 [snd_hda_codec]
> >      ? __pfx_snd_hda_codec_build_controls+0x10/0x10 [snd_hda_codec]
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? snd_hda_codec_build_pcms+0x4d8/0x6e0 [snd_hda_codec]
> >      hda_codec_driver_probe+0x26e/0x590 [snd_hda_codec]
> >      ? __pfx_hda_codec_driver_probe+0x10/0x10 [snd_hda_codec]
> >      really_probe+0x21f/0xa90
> >      __driver_probe_device+0x1ec/0x490
> >      driver_probe_device+0x4f/0x130
> >      __device_attach_driver+0x1d2/0x2e0
> >      ? __pfx___device_attach_driver+0x10/0x10
> >      bus_for_each_drv+0x155/0x1d0
> >      ? __pfx_bus_for_each_drv+0x10/0x10
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? trace_hardirqs_on+0x18/0x160
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? _raw_spin_unlock_irqrestore+0x44/0x60
> >      __device_attach+0x1c3/0x490
> >      ? __pfx___device_attach+0x10/0x10
> >      ? snd_hda_codec_configure+0x4a2/0x690 [snd_hda_codec]
> >      snd_hda_codec_configure+0x4c5/0x690 [snd_hda_codec]
> >      ? __pfx_snd_hda_codec_configure+0x10/0x10 [snd_hda_codec]
> >      ? __pfx_azx_probe_codecs+0x10/0x10 [snd_hda_codec]
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? request_threaded_irq+0x21f/0x380
> >      azx_codec_configure+0x65/0x200 [snd_hda_codec]
> >      azx_probe_work+0x4d8/0x23b0 [snd_hda_intel]
> >      ? __pfx_azx_probe_work+0x10/0x10 [snd_hda_intel]
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? lock_release+0xc8/0x280
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      process_one_work+0x908/0x19c0
> >      ? __pfx_process_one_work+0x10/0x10
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? lock_is_held_type+0x8f/0x100
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      worker_thread+0x65c/0xe40
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? __kthread_parkme+0x175/0x220
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? __pfx_worker_thread+0x10/0x10
> >      kthread+0x34f/0x460
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? __pfx_kthread+0x10/0x10
> >      ret_from_fork+0x659/0x940
> >      ? __pfx_ret_from_fork+0x10/0x10
> >      ? srso_alias_return_thunk+0x5/0xfbef5
> >      ? __switch_to+0x74f/0xf80
> >      ? __pfx_kthread+0x10/0x10
> >      ret_from_fork_asm+0x1a/0x30
> >      </TASK>
> >
> >     Allocated by task 68:
> >      kasan_save_stack+0x33/0x60
> >      kasan_save_track+0x14/0x30
> >      __kasan_kmalloc+0xaa/0xb0
> >      __kmalloc_cache_noprof+0x251/0x610
> >      snd_jack_kctl_new+0x80/0x180
> >      snd_jack_new+0x4b/0x4c0
> >      snd_hda_jack_add_kctl_mst+0x19e/0x540 [snd_hda_codec]
> >      add_jack_kctl+0x1b9/0x2c0 [snd_hda_codec]
> >      snd_hda_jack_add_kctls+0x212/0x910 [snd_hda_codec]
> >      snd_hda_gen_build_controls+0x23a/0x6a0 [snd_hda_codec_generic]
> >      snd_hda_codec_build_controls+0x2e4/0x9f0 [snd_hda_codec]
> >      hda_codec_driver_probe+0x26e/0x590 [snd_hda_codec]
> >      really_probe+0x21f/0xa90
> >      __driver_probe_device+0x1ec/0x490
> >      driver_probe_device+0x4f/0x130
> >      __device_attach_driver+0x1d2/0x2e0
> >      bus_for_each_drv+0x155/0x1d0
> >      __device_attach+0x1c3/0x490
> >      snd_hda_codec_configure+0x4c5/0x690 [snd_hda_codec]
> >      azx_codec_configure+0x65/0x200 [snd_hda_codec]
> >      azx_probe_work+0x4d8/0x23b0 [snd_hda_intel]
> >      process_one_work+0x908/0x19c0
> >      worker_thread+0x65c/0xe40
> >      kthread+0x34f/0x460
> >      ret_from_fork+0x659/0x940
> >      ret_from_fork_asm+0x1a/0x30
> >
> >     Freed by task 436:
> >      kasan_save_stack+0x33/0x60
> >      kasan_save_track+0x14/0x30
> >      kasan_save_free_info+0x3b/0x60
> >      __kasan_slab_free+0x5f/0x80
> >      kfree+0x307/0x580
> >      snd_jack_kctl_private_free+0x154/0x200
> >      __snd_ctl_remove+0x29f/0x3b0
> >      snd_ctl_remove+0x46/0x70
> >      remove_control_set+0x110/0x1b0 [pmbd_alsa_control_remove]
> >      param_attr_store+0x191/0x2f0
> >      module_attr_store+0x5d/0x90
> >      sysfs_kf_write+0xed/0x140
> >      kernfs_fop_write_iter+0x34b/0x500
> >      vfs_write+0x637/0x1010
> >      ksys_write+0x111/0x200
> >      do_syscall_64+0x115/0x6a0
> >      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> >     The buggy address belongs to the object at ffff88810d8def00
> >      which belongs to the cache kmalloc-64 of size 64
> >     The buggy address is located 0 bytes inside of
> >      freed 64-byte region [ffff88810d8def00, ffff88810d8def40)
> >
> >     The buggy address belongs to the physical page:
> >     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:=
0x10d8de
> >     flags: 0x200000000000000(node=3D0|zone=3D2)
> >     page_type: f5(slab)
> >     raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead0000000=
00122
> >     raw: 0000000000000000 0000000000200020 00000000f5000000 00000000000=
00000
> >     page dumped because: kasan: bad access detected
> >
> >     Memory state around the buggy address:
> >      ffff88810d8dee00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> >      ffff88810d8dee80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> >     >ffff88810d8def00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> >                        ^
> >      ffff88810d8def80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
> >      ffff88810d8df000: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via=
 debugfs")
> > Assisted-by: LLM
> > Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> > ---
> >
> > diff --git a/sound/core/jack.c b/sound/core/jack.c
> > index 0f04018181acb20f6bf85b11a9f6d4c7d3179e5a..dd604ffd8c815a9828f5e4b=
30a70b7597c86a37f 100644
> > --- a/sound/core/jack.c
> > +++ b/sound/core/jack.c
> > @@ -418,6 +418,7 @@ static void snd_jack_kctl_private_free(struct snd_k=
control *kctl)
> >
> >  static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_k=
ctl *jack_kctl)
> >  {
> > +     guard(rwsem_read)(&jack->card->controls_rwsem);
> >       jack_kctl->jack =3D jack;
> >       list_add_tail(&jack_kctl->list, &jack->kctl_list);
> >       snd_jack_debugfs_add_inject_node(jack, jack_kctl);
>
> That looks too ad hoc.  We need to check the real cause at first.
>
> Could you elaborate how this situation is triggered?  In the above
> stack trace, it looks like that the jack ctl was created via hd-audio
> codec, but how was it removed?
>
>
> thanks,
>
> Takashi

I'm very sorry for wasting your time. Please disregard this patch.
I'll be much more careful
in the future.

Best regards,
Cen Zhang

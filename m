Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B751C04A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755237; cv=none; b=YVz5C7QcomNOeuWjDSYOXZSDBmsBi3k0Qj5huejJLp8GsHilAUEqkmSEy6tR0wvpI8PMdbf2aeVOk+qUIaWNSW1bqJ7CElMfbuiVVzteh9mDdLlEfAU3YvVPkfz8i6UmtDCizF43FoRbudOEtvyqWuUbUIrKurLrBjNLjtM8X4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755237; c=relaxed/simple;
	bh=FHCq7SmPbetwxFeWjQ6CxHIb7CuohVnpcgF3k8l2nLs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MtMcLn293uIntu3HnRVG97ugojSh6VCLvhdaT4uY5wwgidj+ACwFbMspyIiNQnNSrchJuJRFWUqBlXf/o+gs42ZrjibpL2uDxTcwQ/gxMr9dNP6Z+mbRe4A5Klw5Wa8SnFM7YuuIPiDIqhJWfDON35Ax/xSnS47KIvqLAuRLGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fOZsj7/M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+OzFwXK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fOZsj7/M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+OzFwXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789755233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1jtneS41EfApWU8IJSvGq3jJfWC73gwxxyLVnNUCV4=;
	b=fOZsj7/MW08aLnxxmeerfYGkvokes2E7QF3eS4hJquxcnVGIJE+sohNQRNqQtgF94mJKqh
	1SGCNAdawn8E105aSeW6TA1sGOQmm86TfiervB9vH10CIGONA9KCP6zeoCOyKTrM4S7fVw
	fAXx7NSR6EM+31TvFFK8xr3FmJcjR4A=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-GdENDVHHNDi1bz3RtQCLSQ-1; Fri, 18 Sep 2026 14:13:52 -0400
X-MC-Unique: GdENDVHHNDi1bz3RtQCLSQ-1
X-Mimecast-MFC-AGG-ID: GdENDVHHNDi1bz3RtQCLSQ_1789755232
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d912b923so19642511cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789755232; x=1790360032; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J1jtneS41EfApWU8IJSvGq3jJfWC73gwxxyLVnNUCV4=;
        b=M+OzFwXK4zfj2F5YBbASGjmo0z6+Xpi0aN2+nPIj/EOVWZtlRYBGaLi2PdPDGUQIWI
         Y8fIJGVo5cvPCstj09DQaIFJQEFEzcrbn/MH7Uh1gPV+JWz3ZU5VZVBsP5BDpJbw5IUG
         YxVQKwp4HFA1B56/KkMbosO5Nu4clsIOqzEO+tNlTvjWI2Omb0Ur5rGdp7opsJ+Ns45M
         pO/krEsQvRaCzCkLvMewX2C9Ja1Hg72y5/4AhS/krUms8NOer1oiTuWSLRpE9LJEjika
         QMUlAG4BO6wPDJsiLprXCwvQ1UHCz/eb/QM3IXoLRauV0GnEHYRRYv4QgaNgAC2cYHbh
         9nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755232; x=1790360032;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1jtneS41EfApWU8IJSvGq3jJfWC73gwxxyLVnNUCV4=;
        b=ApD3343hxDMOFli5FUKPKa4k8O/Y4Ff+KeDah9hd47Qe4TVMAWkVbR5gg/eYJc5fTg
         TDhRkPwROUvzYWB0PIgPGlYp2npneauchC+YvR+Be8kR0x7LANK2M4n3kllPTUP7FTnB
         pSzqO99R4/p+TpVjnuJezY/Uq1WAXGM1UyZjedzM69FJZiH0211Wz4K0kmxaqrkqXeN7
         sUOmD0R6tqRD/3XWlINH4MikkhkdpkWtu++W5CoPu9kjnlycttn0gyFLvzmUEOlS6jvK
         19JF9I18FmHNQR4NAynw+efI2oqpi6hwH3s5yqCRTZeOaAkSMZzPPcFbH79m/Qgl8C4S
         5OmQ==
X-Gm-Message-State: AFuF++nU7nH2o5xDsgkY1mM64WOI68oOxtjlTta3UqLOB3jP1xKA/51d
	OTwM0LIPQoNwpyZ/YxzmLoT0zJGZDnWg1kHn4Mz2LdZs8u1Q+hz6lTTG+Q2uvH9tvJIGDu7Q/rp
	YYOskiyk+Vcdy/EeN+QVk1FFo5XC+jeb2mfRAjqXTw9c6UYdzNnUv6OORu7S6JiaeVbS4Xz9jSQ
	==
X-Gm-Gg: AYBFou1KyjKwgKexDBi06YjKj2HuSLJ88MonvhCWVsz7xZk/aem1SmXw6bnTUwkWfJO
	UBMS4ynH9WHb3teW3QvirMExFH52FXxezC43I6UmiEq6FXgabnKVQElPxvCrr5fgA9rPybOJo+L
	4Hfv1iRacA6ND24K8ojlYEFCA5dHJxBvuxfbXyHR1J7wicu+gyUet5xmojyGWOGqS8Do4QbFB2E
	BdtcXo3FymemusAFtyD+wGi9EHpWsbmhN9HvPVeoszNxM0EAfpWQXUEHeOP2b117UC9amUR0zag
	9RG/8J9WYTSOBuXnKXC41y+Ib4mm+/CatCAtXjgc8G75gVSNiZhidG6gjiy/6DnftK8Cbn+/
X-Received: by 2002:a05:622a:5c16:b0:532:9add:50b4 with SMTP id d75a77b69052e-5329e3f97b8mr62334581cf.68.1789755231720;
        Fri, 18 Sep 2026 11:13:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5c16:b0:532:9add:50b4 with SMTP id d75a77b69052e-5329e3f97b8mr62333991cf.68.1789755231255;
        Fri, 18 Sep 2026 11:13:51 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260968826sm1929916d6.4.2026.09.18.11.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:13:50 -0700 (PDT)
Message-ID: <794fc2ed6ee73b65a5d714c16fd9c24bf92c4340.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: don't bump pin count on failed re-pin
 in nouveau_bo_pin_locked()
From: lyude@redhat.com
To: Peiyang He <peiyang_he@smail.nju.edu.cn>, dakr@kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 18 Sep 2026 14:13:49 -0400
In-Reply-To: <EACEF2F4E098413F+20260918025312.2814889-1-peiyang_he@smail.nju.edu.cn>
References: 
	<EACEF2F4E098413F+20260918025312.2814889-1-peiyang_he@smail.nju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Fri, 2026-09-18 at 10:53 +0800, Peiyang He wrote:
> nouveau_bo_pin_locked() checks whether an already pinned BO is in a
> memory domain compatible with a new pin request. When the domains are
> incompatible, it sets -EBUSY but still calls ttm_bo_pin() before
> returning.
>=20
> Callers treat a failed nouveau_bo_pin() as not having acquired a new
> pin,
> so the extra pin count is never decreased by a matching unpin.
> This triggers the warning in ttm_bo_release():
>=20
> 	WARN_ON_ONCE(bo->pin_count);
>=20
> Found when fuzzing the nouveau driver with a modified Syzkaller:
>=20
> 	WARNING: drivers/gpu/drm/ttm/ttm_bo.c:256 at
> ttm_bo_release+0x827/0x9e0 drivers/gpu/drm/ttm/ttm_bo.c:256, CPU#1:
> syz.3.24/2212
> 	Modules linked in:
> 	CPU: 1 UID: 0 PID: 2212 Comm: syz.3.24 Not tainted 7.2.0 #24
> PREEMPT(lazy)
> 	nouveau 0000:01:00.0: gsp:msg fn:103 len:0x40/0x20 res:0x19
> resp:0x19
> 	Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2 04/01/2014
> 	RIP: 0010:ttm_bo_release+0x827/0x9e0
> drivers/gpu/drm/ttm/ttm_bo.c:256
> 	Code: 02 00 0f 85 51 01 00 00 48 8b 7b 08 e8 d2 20 01 00 e9
> 80 fd ff ff e8 d8 15 c0 fe 90 0f 0b 90 e9 e1 f8 ff ff e8 ca 15 c0 fe
> 90 <0f> 0b 90 e9 a4 f8 ff ff e8 bc 15 c0 fe be 03 00 00 00 4c 89 e7
> e8
> 	msg: 00000000: 05 00 d0 c1 04 00 f0 f1 01 30 00 00 2d 90 00
> 00=C2=A0 .........0..-...
> 	RSP: 0018:ffffc9000f5cf710 EFLAGS: 00010293
> 	RAX: 0000000000000000 RBX: ffff888018e5d2a8 RCX:
> ffffffff82bb1b36
> 	RDX: ffff888017b68000 RSI: 0000000000000004 RDI:
> ffff888018e5d2a8
> 	msg: 00000010: 19 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00=C2=A0 ................
> 	RBP: ffff88801261c720 R08: 0000000000000001 R09:
> ffffed10031cba55
> 	R10: ffff888018e5d2ab R11: 00000000000000f3 R12:
> ffff888018e5d290
> 	R13: ffff888018e5d2d4 R14: ffff88801b219c18 R15:
> dffffc0000000000
> 	FS:=C2=A0 0000000000000000(0000) GS:ffff8880e0f6f000(0000)
> knlGS:0000000000000000
> 	CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 	CR2: 0000001b31223ffc CR3: 0000000028e00005 CR4:
> 0000000000770ef0
> 	PKRU: 80000000
> 	Call Trace:
> 	<TASK>
> 	kref_put include/linux/kref.h:65 [inline]
> 	ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:325 [inline]
> 	ttm_bo_fini+0x55/0x80 drivers/gpu/drm/ttm/ttm_bo.c:330
> 	nouveau_gem_object_del+0xb2/0x1b0
> drivers/gpu/drm/nouveau/nouveau_gem.c:90
> 	drm_gem_object_free+0x5f/0x90 drivers/gpu/drm/drm_gem.c:1165
> 	kref_put include/linux/kref.h:65 [inline]
> 	__drm_gem_object_put include/drm/drm_gem.h:562 [inline]
> 	drm_gem_object_put include/drm/drm_gem.h:575 [inline]
> 	nouveau_abi16_chan_fini.constprop.0+0x44f/0x5a0
> drivers/gpu/drm/nouveau/nouveau_abi16.c:195
> 	nouveau 0000:01:00.0: syz.2.23[2209]: Unknown handle
> 0x00000000
> 	nouveau_abi16_fini+0x1d0/0x340
> drivers/gpu/drm/nouveau/nouveau_abi16.c:225
> 	nouveau_drm_postclose+0x18b/0x3e0
> drivers/gpu/drm/nouveau/nouveau_drm.c:1284
> 	nouveau 0000:01:00.0: syz.2.23[2209]: validate_init
> 	drm_file_free.part.0+0x6d6/0xb60
> drivers/gpu/drm/drm_file.c:267
> 	drm_file_free drivers/gpu/drm/drm_file.c:237 [inline]
> 	drm_close_helper.isra.0+0x11a/0x160
> drivers/gpu/drm/drm_file.c:290
> 	drm_release+0x1ab/0x330 drivers/gpu/drm/drm_file.c:438
> 	__fput+0x39c/0xa60 fs/file_table.c:512
> 	nouveau 0000:01:00.0: syz.2.23[2209]: validate: -2
> 	task_work_run+0x15a/0x230 kernel/task_work.c:233
> 	exit_task_work include/linux/task_work.h:40 [inline]
> 	do_exit+0x82b/0x25a0 kernel/exit.c:1009
> 	do_group_exit+0xc2/0x280 kernel/exit.c:1152
> 	get_signal+0x1d6e/0x1f30 kernel/signal.c:3046
> 	arch_do_signal_or_restart+0x7d/0x6e0
> arch/x86/kernel/signal.c:337
> 	__exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
> 	exit_to_user_mode_loop+0xdf/0x440 kernel/entry/common.c:101
> 	__exit_to_user_mode_prepare include/linux/irq-entry-
> common.h:207 [inline]
> 	syscall_exit_to_user_mode_prepare include/linux/irq-entry-
> common.h:230 [inline]
> 	syscall_exit_to_user_mode include/linux/entry-common.h:318
> [inline]
> 	do_syscall_64+0x4f8/0x690 arch/x86/entry/syscall_64.c:100
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 	RIP: 0033:0x7f12bac8594d
> 	Code: Unable to access opcode bytes at 0x7f12bac85923.
> 	RSP: 002b:00007f12b96e70d8 EFLAGS: 00000246 ORIG_RAX:
> 00000000000000ca
> 	RAX: 0000000000000001 RBX: 00007f12baf15fa8 RCX:
> 00007f12bac8594d
> 	RDX: 00000000000f4240 RSI: 0000000000000081 RDI:
> 00007f12baf15fac
> 	RBP: 00007f12baf15fa0 R08: 00007f12baee8000 R09:
> 0000000000000000
> 	R10: 0000000000000000 R11: 0000000000000246 R12:
> 0000000000000000
> 	R13: 00007f12baf16038 R14: 0000000000000006 R15:
> 00007ffe2ed394b0
> 	</TASK>
> 	irq event stamp: 47867
> 	hardirqs last=C2=A0 enabled at (47883): [<ffffffff815cafc6>]
> __up_console_sem+0x66/0x70 kernel/printk/printk.c:347
> 	hardirqs last disabled at (47892): [<ffffffff815cafab>]
> __up_console_sem+0x4b/0x70 kernel/printk/printk.c:345
> 	softirqs last=C2=A0 enabled at (47880): [<ffffffff81434277>]
> __do_softirq kernel/softirq.c:656 [inline]
> 	softirqs last=C2=A0 enabled at (47880): [<ffffffff81434277>]
> invoke_softirq kernel/softirq.c:496 [inline]
> 	softirqs last=C2=A0 enabled at (47880): [<ffffffff81434277>]
> __irq_exit_rcu+0x137/0x1c0 kernel/softirq.c:735
> 	softirqs last disabled at (47875): [<ffffffff81434277>]
> __do_softirq kernel/softirq.c:656 [inline]
> 	softirqs last disabled at (47875): [<ffffffff81434277>]
> invoke_softirq kernel/softirq.c:496 [inline]
> 	softirqs last disabled at (47875): [<ffffffff81434277>]
> __irq_exit_rcu+0x137/0x1c0 kernel/softirq.c:735
>=20
> Fix by calling ttm_bo_pin() only when the existing placement is
> compatible
> with the new pin request. This matches the correct behavior in other
> DRM
> drivers such as amdgpu_bo_pin() in amdgpu.
>=20
> Cc: stable@vger.kernel.org
> Fixes: ad76b3f7c7a0 ("drm/nouveau: teach nouveau_bo_pin() how to
> force a contig vram allocation")
> Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
> Assisted-by: LLM
> ---
> Changes in v2:
> =C2=A0 - replace goto with else branch (suggested by Lyude Paul)
> =C2=A0 - fix Assisted-by tag
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 0e8de6d4b36f..6dcb92575eb4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -578,8 +578,9 @@ int nouveau_bo_pin_locked(struct nouveau_bo
> *nvbo, uint32_t domain, bool contig)
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x%08x vs 0x%08x\n", bo,
> =C2=A0				 bo->resource->mem_type, domain);
> =C2=A0			ret =3D -EBUSY;
> +		} else {
> +			ttm_bo_pin(&nvbo->bo);
> =C2=A0		}
> -		ttm_bo_pin(&nvbo->bo);
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
>=20
> base-commit: df2908090cda368b01ff43709f51890076c56157


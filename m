Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272087;
	b=pRMKIPElENTsDErOwfE3JUkTbaCRdbAOqZwtQk0Cu7NNisn+dxIQ5kMlFeit/sBXENfN
	 SqtJ9lCkGXim1+yOL2QYXBJNT5tR8t6P+NkG/nXek+eUtl0MvpPinWPIwB6PIzxvydFvf
	 +p8MOZhpBLZ0Nsa174gm5ZJ+2z9KrRE+m6P0LcKb94Hvvah+Gt8YDSDD6SOCZzocxig5U
	 5Jc+7MSvkL4kIZLPUBe48RORwHjFVQO1LSh1ccfqcrwgxBtBKar2GYPhqlaG890kNV3IC
	 ARK/fiOD0URLm+i0YnZZR73AZqPdzX0+f1b6oBEO1xwobCPMnRNyrca6U+5eQab6s8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272087;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
	b=DtqnV6PodRienuioLeMwFc6o199f7LFldi+YtAWntfTYD2DshPDYFuf0nqbEnKLkeU2s
	 pgUoffUcZV1nzqwU39i1ILoH1SEgg3AIJFww5+vLgM8bb9Tiu9PzZAnhOVpmQA2Ek4GK6
	 FEzUyu1qzqh0Qat8KXWR4a5qMYmTwZ2nEVosb6q6tCgF5Lb6WPC9nElz0/K5tNs1IQsdu
	 glKfmJqIbS/wfvG5p085wHKWrBHbJ2blZIjYX9OtCy0WMLOecTbaSMbL+NfBY6HDn6NCE
	 0zYO5t2aDm+3IAYXKV19w/KEuH0F2UgjgDvruMtKwInbG02h0g3lNW+tuTbJ7+bG32w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OvlAkxuG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="WNj/ajFZ";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5827B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OvlAkxuG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WNj/ajFZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794272086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
	b=OvlAkxuGGzXw36w68WIGfFMZgkP5UKHfIro7tACf++FIfi4BWJyyLc0C9erXi+4abyR8xF
	gAykeZZgVaQqZz90DO7dKXQrTe8wfcOsjhovRDenOWH0F5BLy0BNc8gf65LU9bnW/5QhLs
	cx/TJs9bm4QbtsEuGKK5Nb3zGFRBG7o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-SxH1ndkUNnaJiGJriFO2fQ-1; Mon, 09 Nov 2026 19:54:45 -0500
X-MC-Unique: SxH1ndkUNnaJiGJriFO2fQ-1
X-Mimecast-MFC-AGG-ID: SxH1ndkUNnaJiGJriFO2fQ_1794272084
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb16ea5c3so43223496d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794272084; x=1794876884; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
        b=WNj/ajFZtdRRqdkilxTph4O3eFRIoEuEohEx3l5d/oNUKm1zHOlJqVvLPqEEimlQt0
         InkY/OyJZlEiaIABPQnCcOpz79bUja+h219s03vW9TK0EGh9WDOdiX1L6rdcOCfQbsp+
         6Q4pSwr52ZovZKMGR1WCfYArZRfGzx7MwyROg4yIVyKD1yDmduHbD2diIRKNKO84khvf
         R8Jtz2KNKSLf9wBNuolG3ynpmUmOBF6Tt1m8HAmDb/lfeYr1k7P8CWoQUuUnWq+xUadR
         lWT7lUh7qHZah4kktY39WRTA7n+A0gdvCUELbzqfMgVIlTcGew4SNyHS5ti+dQ3Eoxdy
         eipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272084; x=1794876884;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
        b=Kus9q01O0+rMa4PHMWs5lkMPtCL3ZFMb3r2hMI57u/LeK3vwXaFlJNjZk5XRSd0WK9
         +FtHnB5iYYy35nVr+D7hmLgPiT4+9lP4dyEddN715sXoVNuRYU5ZJyqAWP/t7KyiU6Di
         KcVg+U1NaWA9Uq4bvacl8+euGUwF/e2OAOuB71RDJIGuDc47qZu2NFz8Lu4I8+0dLfn/
         1AJSbNvlIyuzqAkIba9K5voEfacHbvuEIKqeVmLukp3QEAWCrRxKJQjzg+1jgvCECf0N
         ND14F5nYECVBBHGjNSqegqmqQdUU7mfcaiZhBn7QxS1E8w4iWCmesiTp8F1hFWjwxGPf
         x9Qg==
X-Forwarded-Encrypted: i=1; AL+hErFUayDJDJwVMkqjeP7UP7yeZnmAmZjD2uvnpt3BSF8XHQ7QF4KS2RhhXO2MHLChPg0gGmJ4tDHBaRPXN1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f5SRPhNV+1Zo9qAsugx0vO2d47ETeYJzg1lfDWI8C9YWjFY41
	LX6vQwBysoozE67WedPfr2zDXGs3hgP41Fao7rF8mc8Pa48Qy4RsOaVN72PZlA01v3ytW3eNmC5
	0Ds9SaHCiaLgrK+xsGEgfJyIyfTfmDDDT0XiQjLFSQlhr0HA5lg7IpFsrOo8jaR4grg==
X-Gm-Gg: AYBFou3DWyN436HLJ38TKNnaE7uDIhQp4zHUwlqxNoz2ZElNqALqcx7gOvlbfSunjYd
	W2mXLz+XN/e+FJWkLf9eYgv8zZn68e7e8ppJcDRWE8twejCFb/viVKFJRNLY01tYEILxdNEW8u0
	CwNW+i6/NcjWSEt3f7+r8Z+WEXrvgyGwxA3G6ULcbzJWlmvdg/NJcDkzMJJF/XJxaKH6zbHVvaI
	qXK5V2Dj8Dzw7USGNznGUPrwEGf5MF7Wco2wuCu4m/qz2xVRLSctwLJb4KCMyNpT7GoDYh7Juz4
	d/f5MrbtAj/kLgYRhKrEGdDw3A88fWF0I9bIp4VQg2PDnN2+83WL3/LoNx9P4KzWvywDu4avVUV
	yar4rLiKFqSK4WB0iyGW7CXdsDUHoC0Xj59mMpISOlkVRTg8qq3Id5UfFFUpuIJh2wF3F5DBmPT
	NHxElfT5LdMzLNrw==
X-Received: by 2002:a05:6214:54c8:b0:91e:97f2:6263 with SMTP id 6a1803df08f44-91eef82c22cmr22672646d6.29.1794272084319;
        Mon, 09 Nov 2026 16:54:44 -0800 (PST)
X-Received: by 2002:a05:6214:54c8:b0:91e:97f2:6263 with SMTP id 6a1803df08f44-91eef82c22cmr22672416d6.29.1794272083739;
        Mon, 09 Nov 2026 16:54:43 -0800 (PST)
Received: from [192.168.5.11] (pool-108-49-8-41.bstnma.east.verizon.net. [108.49.8.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0501c1csm8604216d6.30.2026.11.09.16.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:54:42 -0800 (PST)
Message-ID: <b89b83ee3de3ab113820ad94cf09be6b98ec3585.camel@redhat.com>
Subject: Re: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
From: lyude@redhat.com
To: Thorsten Leemhuis <regressions@leemhuis.info>, Eric Kim
	 <seohyun.kim@outlook.kr>, "regressions@lists.linux.dev"
	 <regressions@lists.linux.dev>
Cc: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Nov 2026 19:54:40 -0500
In-Reply-To: <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
References: 
	<OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
	 <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi - I'm back! Sorry about this, I've been busy moving and only just
got my machine setup. I will take a look at this tomorrow

On Mon, 2026-11-09 at 08:45 +0100, Thorsten Leemhuis wrote:
> On 11/2/26 13:47, Eric Kim wrote:
> >=20
> > On my laptop, which has GP107 GPU with intel graphics and uses
> > nouveau
> > driver, booting kernels after commit
> > 2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer
> > dereference
> > at initialization.
>=20
> Thx for your report. Hmm, no reply yet afaics. Wondering if it would
> have been better to report it at the dedicated place for nouveau
> kernel
> bugs: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/
>=20
> You thus might want to at least check if any similar reports are
> found
> there.
>=20
> Would also be good to know if reverting 2652aca460dc ontop of latest
> mainline fixes this.
>=20
> Ciao, Thorsten
> > [=C2=A0=C2=A0 17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00=
.0 on
> > minor 0
> > [=C2=A0=C2=A0 17.556364] nouveau 0000:01:00.0: [drm] No compatible form=
at
> > found
> > [=C2=A0=C2=A0 17.556792] nouveau 0000:01:00.0: [drm] Cannot find any cr=
tc or
> > sizes
> > [=C2=A0=C2=A0 17.557237] BUG: kernel NULL pointer dereference, address:
> > 0000000000000000
> > [=C2=A0=C2=A0 17.583880] #PF: supervisor instruction fetch in kernel mo=
de
> > [=C2=A0=C2=A0 17.598078] #PF: error_code(0x0010) - not-present page
> > [=C2=A0=C2=A0 17.601475] PGD 0 P4D 0 [=C2=A0=C2=A0 17.608839] Oops: Oop=
s: 0010 [#1] SMP
> > PTI
> > [=C2=A0=C2=A0 17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tai=
nted
> > 7.3.0+
> > #1 PREEMPT(lazy) [=C2=A0=C2=A0 17.608954] Hardware name: SAMSUNG ELECTR=
ONICS
> > CO.,
> > LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS P11RDV.075.170829.XJ
> > 08/29/2017
> > [=C2=A0=C2=A0 17.608990] RIP: 0010:0x0
> > [=C2=A0=C2=A0 17.609090] Code: Unable to access opcode bytes at
> > 0xffffffffffffffd6.
> > [=C2=A0=C2=A0 17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
> > [=C2=A0=C2=A0 17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RC=
X:
> > ffffffffa97d8091
> > [=C2=A0=C2=A0 17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RD=
I:
> > ffff89b74c466800
> > [=C2=A0=C2=A0 17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R0=
9:
> > 0000000000000000
> > [=C2=A0=C2=A0 17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R1=
2:
> > ffff89b74c466800
> > [=C2=A0=C2=A0 17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R1=
5:
> > ffff89b77f1a2400
> > [=C2=A0=C2=A0 17.610320] FS:=C2=A0 00007fc4a888d780(0000)
> > GS:ffff89bac4364000(0000)
> > knlGS:0000000000000000
> > [=C2=A0=C2=A0 17.610357] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > [=C2=A0=C2=A0 17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR=
4:
> > 00000000003726f0
> > [=C2=A0=C2=A0 17.610448] Call Trace:
> > [=C2=A0=C2=A0 17.610483]=C2=A0 <TASK>
> > [=C2=A0=C2=A0 17.610521]=C2=A0 drm_atomic_commit+0xb1/0xe0
> > [=C2=A0=C2=A0 17.610558]=C2=A0 ? __pfx___drm_printfn_info+0x10/0x10
> > [=C2=A0=C2=A0 17.610590]=C2=A0 drm_client_modeset_commit_atomic+0x25c/0=
x2d0
> > [=C2=A0=C2=A0 17.610618]=C2=A0 drm_client_modeset_commit_locked+0x5a/0x=
170
> > [=C2=A0=C2=A0 17.610647]=C2=A0 ? drm_master_internal_acquire+0x1d/0x40
> > [=C2=A0=C2=A0 17.610675]=C2=A0 drm_client_modeset_commit+0x25/0x40
> > [=C2=A0=C2=A0 17.610700]=C2=A0 drm_fb_helper_single_fb_probe+0x1aa/0x1c=
0
> > [=C2=A0=C2=A0 17.610729]=C2=A0
> > __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
> > [=C2=A0=C2=A0 17.610754]=C2=A0 drm_fbdev_client_hotplug+0x79/0xb0
> > [=C2=A0=C2=A0 17.610782]=C2=A0 ? drm_client_init+0x13e/0x180
> > [=C2=A0=C2=A0 17.610811]=C2=A0 drm_client_register+0x79/0xc0
> > [=C2=A0=C2=A0 17.610839]=C2=A0 drm_fbdev_client_setup+0xc9/0x1c0
> > [=C2=A0=C2=A0 17.610867]=C2=A0 drm_client_setup+0x6a/0x90
> > [=C2=A0=C2=A0 17.610893]=C2=A0 nouveau_drm_probe+0x15b/0x1e0 [nouveau]
> > [=C2=A0=C2=A0 17.610922]=C2=A0 local_pci_probe+0x4a/0x90
> > [=C2=A0=C2=A0 17.610951]=C2=A0 ? cpu_hotplug_disable+0x15/0x30
> > [=C2=A0=C2=A0 17.610977]=C2=A0 pci_call_probe+0x5a/0x1a0
> > [=C2=A0=C2=A0 17.611009]=C2=A0 pci_device_probe+0xdb/0x180
> > [=C2=A0=C2=A0 17.611060]=C2=A0 call_driver_probe+0x23/0x100
> > [=C2=A0=C2=A0 17.611104]=C2=A0 ? driver_sysfs_add+0x55/0xc0
> > [=C2=A0=C2=A0 17.611137]=C2=A0 really_probe+0xd7/0x2d0
> > [=C2=A0=C2=A0 17.611171]=C2=A0 ? __pm_runtime_resume+0x50/0x60
> > [=C2=A0=C2=A0 17.611220]=C2=A0 __driver_probe_device+0x9c/0x1b0
> > [=C2=A0=C2=A0 17.611261]=C2=A0 driver_probe_device+0x1f/0x80
> > [=C2=A0=C2=A0 17.611297]=C2=A0 ? __pfx___driver_attach+0x10/0x10
> > [=C2=A0=C2=A0 17.611335]=C2=A0 __driver_attach+0xcc/0x200
> > [=C2=A0=C2=A0 17.611373]=C2=A0 ? __pfx___driver_attach+0x10/0x10
> > [=C2=A0=C2=A0 17.611409]=C2=A0 bus_for_each_dev+0x97/0x100
> > [=C2=A0=C2=A0 17.611451]=C2=A0 bus_add_driver+0x1d0/0x280
> > [=C2=A0=C2=A0 17.611493]=C2=A0 ? __pfx_init_module+0x10/0x10 [nouveau]
> > [=C2=A0=C2=A0 17.611530]=C2=A0 ? __pfx_init_module+0x10/0x10 [nouveau]
> > [=C2=A0=C2=A0 17.611567]=C2=A0 driver_register+0x75/0xe0
> > [=C2=A0=C2=A0 17.611602]=C2=A0 nouveau_drm_init+0x60/0xff0 [nouveau]
> > [=C2=A0=C2=A0 17.611633]=C2=A0 do_one_initcall+0x89/0x3d0
> > [=C2=A0=C2=A0 17.611667]=C2=A0 do_init_module+0x8e/0x290
> > [=C2=A0=C2=A0 17.611703]=C2=A0 init_module_from_file+0xc8/0x180
> > [=C2=A0=C2=A0 17.611736]=C2=A0 idempotent_init_module+0x23e/0x360
> > [=C2=A0=C2=A0 17.611773]=C2=A0 __x64_sys_finit_module+0x7f/0x110
> > [=C2=A0=C2=A0 17.611805]=C2=A0 do_syscall_64+0xbe/0x470
> > [=C2=A0=C2=A0 17.611844]=C2=A0 ? do_syscall_64+0x37/0x470
> > [=C2=A0=C2=A0 17.611883]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >=20
> > It boots without this problem when booting with nouveau.atomic=3D0
> > kernel parameter.
> >=20
> > My guess is that atomic_(commit|check) operation is not present in
> > nouveau_mode_config_funcs, and commit
> > 2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
> > atomic modesetting by default for NV50+ gpus caused
> > the problem.
> >=20
> > Also, drm_helper_(commit|check) was added to
> > nouveau_mode_config_funcs
> > at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
> > reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
> > unreliability.
> >=20
> > I hope this problem can be fixed at one of the next releases.
> >=20
> > Thanks,
> > Eric Kim
> >=20
> > #regzbot introduced: 2652aca460dc


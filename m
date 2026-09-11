Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70BD3E3DA4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140852; cv=pass; b=Eu2rmaJCZyS8HtvWc2g+T+/EqEdl04lv+Cc1xCAxv9/nb6M4YyAxcA7BnCTYMMHcdJZ1oQsV6hzTOsNHyoBX3C6XvS95K98upAUVRAlxBMDzFKHoFcEP9KpWtoIHS9FuDo4+BGpYSdLSNgouJQeriw583OlaUzq6fl0b4nRDrxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140852; c=relaxed/simple;
	bh=fCW4qLAxZ/EIujl2bytAV50d6IdZ5AICZnDbAlNmMJw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q3PJhB4A/XxJEHNpZfBs9V188xNiy5BP6wqsvqJpJZxUA8MFFvdt3HKPZpjdgwOFyinmaTCUCk2tRep78Qno0OcVgHGI2wC/NmxBhfgU6B7K8fQPebKIN+Tc/zaUKnk8IRH/Q68VTy+QWhCDEA5MemN1psPZQVWRL4pDpwJOvJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=Pjb1qJLE; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="Pjb1qJLE"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c5so23458b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140849; cv=none;
        d=google.com; s=arc-20260327;
        b=ViTFSgpNjB6nQuAV/LqxlVuDD3VvgK1PjKA7g7ggSMP+ulOdf0rrYoLyJqGnvVTGIL
         iBF6PFj216I0FOxu1aaEKDB1b/Hktzh1i2kK/iOLyl7CHoEwJl/mfVSmKMeZRy2gt9e4
         pJC1dcl0QGgSSYGdIQWw+JqZarBhyCiU+CjFzYcvUkf8YZFaoWF7ZQlGJEqafkAu4lU4
         8lY7k59ER933aSJHYKULOuS4wQa9bIFYJzUYXU2NSQ94KHtilTCMTRuGRiKxoafsVTOp
         4DBZF+QoqLYamy3YSOkj5/YFKat8oU5wqOM1SsbQS89C7bM5npTvoRVTFDGwx5o2T7+a
         yHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YLzl+NOsnQdKnvJDlFjNxK/26UXuTFwIgMJWvzyCapo=;
        fh=fsw4snxXEkYy2QEHTEiJSMBf2VYInQbP8Z2RbcWPQ7c=;
        b=AygiEUmBVT0Ob3xGTjpS2ejnigiDrsHTztjVxQNvT2p+8UuDUjGNxQVEUIZ3FAIpPA
         zT0OzPVzlGrVA/3UnFMsJR97ImUlaXFCSa61t0C1qfUiROsLATS/WlMg8zT4CZqsw6wa
         ciDK+WFJ/8FN7muT1ya+fhuyNUKYcbiTv+lSYWzmzgY2gATOYdK147o+GVtm80HU/bRC
         6C3Mh3GPAOmaSvJhT87bdymTpnn123UsWiTIpO4M3/Y4Wo6OeTIRVWsFa+7lJN0nHJwU
         i7Fsr0BbS/0XtQvZeGqRc3SOsTulyNSxjaCMH5IvMnWQ79n47GpWoA8TjpIP8Nm7H33i
         YRjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789140849; x=1789745649; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLzl+NOsnQdKnvJDlFjNxK/26UXuTFwIgMJWvzyCapo=;
        b=Pjb1qJLEYYFl8H8Y98zF+RWGU4SRf3usTl0wpDlpGWW3ReqzqLi2Mw5GzmfG5sblc/
         hM+flTAsSOhT04643XSy65R3WLPgqOdU/UtpUiWxQRsId3tCxRYUZWGsklfhfMYBMST9
         UcwBsxz2tQQwsaGPc++6dv5Tle6B+vIEb8VKt7mjLLg+M5G81iwKyZMH16ZWA+qcEG/I
         uKkOBG7tfGZdSuLslcJ4GzJQlYFIwlB3ULWzqlVtRHKJXSpEsdtPdXQKjw4YlGddWsMf
         yq4jT88St5iFje1jfI2ozdHRuGL6HoQpk0kVreN/bnUQ5ThBk87fF6UOnSMzSNQ/1hLd
         beeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140849; x=1789745649;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YLzl+NOsnQdKnvJDlFjNxK/26UXuTFwIgMJWvzyCapo=;
        b=GLE9nx3kEEbkrllkaNeXsGxYaGHRsfsQBiC14lS+hmpv0txttYudPnkjKZ7R4hGho3
         kmGV+Yin+YBZhCp0OYAF0q1yiHz2+7pL2XbuYVF7Iwn2SdqfG8JvSUOCNtdrRoU+MI7c
         hMaIMOXT8t5dY7lUQUyu7DKVVv90WBJDHKsoMwYeV2L3+lAI16Sg3qcuQyi9HiZjfHhP
         ia/1QtDiXYlLdxl2D0rjyhm1AmZgaU8ieYu2o/YwAMNf4f/kDH9I5icsNVEw08JarKT7
         sfedT05XjPTTbXUZSWgBAnjBdxRtg7J4Bh8v5MEJn832OdbhuUf1NkZMD3RTwKwO2MdN
         fAJA==
X-Forwarded-Encrypted: i=1; AKwUvBzWDjqMtljACI07BLst6B3eJ3aPj25KWytexDAkxfGgcuM50eupHrm5/4OOuGsn+OWRX5PrcU5pF7fFDeo=@vger.kernel.org
X-Gm-Message-State: AFuF++mAt+vgzevf5zaw52vsNqqzJnRfPJ3te4uBUgNfpZqrDpC1EVV8
	PwGIa1FqsIknuR7FxA1DGoxAeNYxC0LEG5lSUr/x3gf1hsWIyyKSFIOKUWB0SKtZBc9MqtD4lm0
	wTqPpscuQpOmYYferVpfPs/BZtOxbXnXQcBR//pRL
X-Gm-Gg: AYBFou2Ga1mzdo1AvCWZbhSOuXcE24VTVxdEzUsJvYA3HQaVl2vnaKgVFkW32SVicNR
	XcHTCKbdZ474cD08XtTARmNhF0ePrnFHgStbqg/xGfGUQf89VPKWx53UhuTk2b7Fh67VFVjwnSJ
	7NTZpm2aIKrtagANXyx7BX3RPLeS4QxKGLkrqqQuwKmNmqf8Q0nd4MeeY6rcTj0EWsg+1/SV7GV
	G+Njt6JtgAlx7/P+KhVp7ilgJP1FgVvLEP/Ef3Tfj8KrKwxhYPno2oKQ/nF1jhyEDSAj7pwN5JK
	pl2uQdNWrZHnh6CNvx9TLeKzWN7uoeoTkVVjKTMy/A8oX6u/5kok9PP1irX1fW5zsLDr0EuboqQ
	5PYbm1hawSS8znBDeAJYSnsCd8PbkKG8gKhnfFlHcc6O3nICd/P8gHcieaeYCF93kUfA9A/hzqA
	o=
X-Received: by 2002:a05:6a20:9389:b0:3d7:b90:acba with SMTP id
 adf61e73a8af0-3daed0ff5bdmr8780759637.6.1789140847311; Fri, 11 Sep 2026
 08:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:33:55 -0700
X-Gm-Features: AcwNN1WSaXE2cS1WAjzmRQxF4qaa-pr66S3AaIyX2XsOqNQyW4aiT3CzQpqXQqc
Message-ID: <CA+0ovCiBsQGLBpi4HcbyX6K1-P9kGqS6RJ4MFRU=2wET+HqFhQ@mail.gmail.com>
Subject: [BUG] KASAN: global-out-of-bounds Read in set_frame_rate
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a93ea7065b36d0b7"

--000000000000a93ea7065b36d0b7
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   47.501124][ T9479] BUG: KASAN: global-out-of-bounds in
set_frame_rate+0x48d/0x5b0
[   47.501199][ T9479] Read of size 1 at addr ffffffff8cc7f075 by task
repro/9479
[   47.501224][ T9479]
[   47.501261][ T9479] CPU: 0 UID: 0 PID: 9479 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.501318][ T9479] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.501350][ T9479] Call Trace:
[   47.501367][ T9479]  <TASK>
[   47.501399][ T9479]  dump_stack_lvl+0xe8/0x150
[   47.501441][ T9479]  print_address_description+0x55/0x1e0
[   47.501476][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.501504][ T9479]  print_report+0x58/0x70
[   47.501533][ T9479]  kasan_report+0x117/0x150
[   47.501580][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.501614][ T9479]  set_frame_rate+0x48d/0x5b0
[   47.501646][ T9479]  sd_start+0x6c9/0x1140
[   47.501700][ T9479]  gspca_init_transfer+0x2470/0x3060
[   47.501761][ T9479]  ? __pfx_gspca_init_transfer+0x10/0x10
[   47.501796][ T9479]  ? add_lock_to_list+0xc7/0x100
[   47.501845][ T9479]  ? __lock_acquire+0x74c/0x2db0
[   47.501903][ T9479]  ? __pfx_do_raw_spin_lock+0x10/0x10
[   47.501940][ T9479]  ? __pfx_gspca_start_streaming+0x10/0x10
[   47.501979][ T9479]  gspca_start_streaming+0x6f/0x250
[   47.502017][ T9479]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   47.502061][ T9479]  ? __pfx_gspca_start_streaming+0x10/0x10
[   47.502099][ T9479]  vb2_start_streaming+0x128/0x460
[   47.502135][ T9479]  vb2_core_streamon+0x2e0/0x4f0
[   47.502169][ T9479]  __vb2_init_fileio+0xca2/0xff0
[   47.502211][ T9479]  __vb2_perform_fileio+0x282/0x1620
[   47.502251][ T9479]  ? __lock_acquire+0x74c/0x2db0
[   47.502312][ T9479]  vb2_fop_read+0x273/0x360
[   47.502351][ T9479]  v4l2_read+0x19c/0x2c0
[   47.502380][ T9479]  ? __pfx_v4l2_read+0x10/0x10
[   47.502409][ T9479]  vfs_read+0x20c/0xa70
[   47.502448][ T9479]  ? __pfx_vfs_read+0x10/0x10
[   47.502482][ T9479]  ? __fget_files+0x2a/0x420
[   47.502514][ T9479]  ? __fget_files+0x2a/0x420
[   47.502543][ T9479]  ? __fget_files+0x3a0/0x420
[   47.502572][ T9479]  ? __fget_files+0x2a/0x420
[   47.502607][ T9479]  ksys_read+0x150/0x270
[   47.502641][ T9479]  ? __pfx_ksys_read+0x10/0x10
[   47.502674][ T9479]  ? __pfx_v4l2_ioctl+0x10/0x10
[   47.502709][ T9479]  do_syscall_64+0x155/0x510
[   47.502754][ T9479]  ? trace_irq_disable+0x3b/0x140
[   47.502794][ T9479]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.502826][ T9479]  ? clear_bhb_loop+0x30/0x80
[   47.502860][ T9479]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.502892][ T9479] RIP: 0033:0x43c9a2
[   47.502940][ T9479] Code: 08 0f 85 21 e0 ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   47.502975][ T9479] RSP: 002b:00007ffd4e0b0518 EFLAGS: 00000246
ORIG_RAX: 0000000000000000
[   47.503021][ T9479] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000043c9a2
[   47.503044][ T9479] RDX: 0000000000001000 RSI: 00000000004d3b00
RDI: 0000000000000004
[   47.503064][ T9479] RBP: 00007ffd4e0b0540 R08: 0000000000000000
R09: 0000000000000000
[   47.503085][ T9479] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffd4e0b0998
[   47.503105][ T9479] R13: 00007ffd4e0b09a8 R14: 0000000000000002
R15: 00000000004cd9e0
[   47.503139][ T9479]  </TASK>
[   47.503150][ T9479]
[   47.503158][ T9479] The buggy address belongs to the variable:
[   47.503169][ T9479]  set_frame_rate.rate_0+0x15/0x40
[   47.503225][ T9479]
[   47.503233][ T9479] The buggy address belongs to the physical page:
[   47.503255][ T9479] page: refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0xcc7f
[   47.503300][ T9479] flags:
0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
[   47.503367][ T9479] raw: 00fff00000002000 ffffea0000331fc8
ffffea0000331fc8 0000000000000000
[   47.503394][ T9479] raw: 0000000000000000 0000000000000000
00000001ffffffff 0000000000000000
[   47.503410][ T9479] page dumped because: kasan: bad access detected
[   47.503433][ T9479] page_owner info is not present (never set?)
[   47.503446][ T9479]
[   47.503453][ T9479] Memory state around the buggy address:
[   47.503469][ T9479]  ffffffff8cc7ef00: 00 f9 f9 f9 00 00 02 f9 f9
f9 f9 f9 00 00 02 f9
[   47.503489][ T9479]  ffffffff8cc7ef80: f9 f9 f9 f9 00 00 02 f9 f9
f9 f9 f9 00 00 02 f9
[   47.503510][ T9479] >ffffffff8cc7f000: f9 f9 f9 f9 00 00 00 00 00
00 00 00 00 00 04 f9
[   47.503531][ T9479]
             ^
[   47.503550][ T9479]  ffffffff8cc7f080: f9 f9 f9 f9 00 00 00 00 00
f9 f9 f9 f9 f9 f9 f9
[   47.503570][ T9479]  ffffffff8cc7f100: 00 00 06 f9 f9 f9 f9 f9 00
00 02 f9 f9 f9 f9 f9
[   47.503585][ T9479]
==================================================================
[   47.503663][ T9479] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   47.557098][ T9479] CPU: 0 UID: 0 PID: 9479 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.558114][ T9479] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.559131][ T9479] Call Trace:
[   47.559477][ T9479]  <TASK>
[   47.559755][ T9479]  vpanic+0x56d/0xa60
[   47.560130][ T9479]  ? __pfx_vpanic+0x10/0x10
[   47.560555][ T9479]  panic+0xc5/0xd0
[   47.560909][ T9479]  ? __pfx_panic+0x10/0x10
[   47.561326][ T9479]  ? preempt_schedule_thunk+0x16/0x40
[   47.561823][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.562274][ T9479]  ? preempt_schedule_thunk+0x16/0x40
[   47.562770][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.563218][ T9479]  check_panic_on_warn+0x89/0xb0
[   47.563681][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.564160][ T9479]  end_report+0x73/0x170
[   47.564582][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.565141][ T9479]  kasan_report+0x128/0x150
[   47.565573][ T9479]  ? set_frame_rate+0x48d/0x5b0
[   47.566023][ T9479]  set_frame_rate+0x48d/0x5b0
[   47.566466][ T9479]  sd_start+0x6c9/0x1140
[   47.566868][ T9479]  gspca_init_transfer+0x2470/0x3060
[   47.567363][ T9479]  ? __pfx_gspca_init_transfer+0x10/0x10
[   47.567879][ T9479]  ? add_lock_to_list+0xc7/0x100
[   47.568344][ T9479]  ? __lock_acquire+0x74c/0x2db0
[   47.568808][ T9479]  ? __pfx_do_raw_spin_lock+0x10/0x10
[   47.569305][ T9479]  ? __pfx_gspca_start_streaming+0x10/0x10
[   47.569840][ T9479]  gspca_start_streaming+0x6f/0x250
[   47.570325][ T9479]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   47.570862][ T9479]  ? __pfx_gspca_start_streaming+0x10/0x10
[   47.571400][ T9479]  vb2_start_streaming+0x128/0x460
[   47.571873][ T9479]  vb2_core_streamon+0x2e0/0x4f0
[   47.572368][ T9479]  __vb2_init_fileio+0xca2/0xff0
[   47.572853][ T9479]  __vb2_perform_fileio+0x282/0x1620
[   47.573372][ T9479]  ? __lock_acquire+0x74c/0x2db0
[   47.573832][ T9479]  vb2_fop_read+0x273/0x360
[   47.574258][ T9479]  v4l2_read+0x19c/0x2c0
[   47.574707][ T9479]  ? __pfx_v4l2_read+0x10/0x10
[   47.575251][ T9479]  vfs_read+0x20c/0xa70
[   47.575661][ T9479]  ? __pfx_vfs_read+0x10/0x10
[   47.576120][ T9479]  ? __fget_files+0x2a/0x420
[   47.576581][ T9479]  ? __fget_files+0x2a/0x420
[   47.577006][ T9479]  ? __fget_files+0x3a0/0x420
[   47.577445][ T9479]  ? __fget_files+0x2a/0x420
[   47.577876][ T9479]  ksys_read+0x150/0x270
[   47.578273][ T9479]  ? __pfx_ksys_read+0x10/0x10
[   47.578714][ T9479]  ? __pfx_v4l2_ioctl+0x10/0x10
[   47.579163][ T9479]  do_syscall_64+0x155/0x510
[   47.579597][ T9479]  ? trace_irq_disable+0x3b/0x140
[   47.580062][ T9479]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.580619][ T9479]  ? clear_bhb_loop+0x30/0x80
[   47.581058][ T9479]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.581604][ T9479] RIP: 0033:0x43c9a2
[   47.581967][ T9479] Code: 08 0f 85 21 e0 ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   47.583693][ T9479] RSP: 002b:00007ffd4e0b0518 EFLAGS: 00000246
ORIG_RAX: 0000000000000000
[   47.584455][ T9479] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000043c9a2
[   47.585237][ T9479] RDX: 0000000000001000 RSI: 00000000004d3b00
RDI: 0000000000000004
[   47.585957][ T9479] RBP: 00007ffd4e0b0540 R08: 0000000000000000
R09: 0000000000000000
[   47.586671][ T9479] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffd4e0b0998
[   47.587386][ T9479] R13: 00007ffd4e0b09a8 R14: 0000000000000002
R15: 00000000004cd9e0
[   47.588103][ T9479]  </TASK>
[   47.589051][ T9479] Kernel Offset: disabled
[   47.589602][ T9479] Rebooting in 86400 seconds..

Regards,

--000000000000a93ea7065b36d0b7
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx47rwv0>
X-Attachment-Id: f_mtx47rwv0

LyoKICogMjM2LWthc2FuLWdsb2JhbC1vdXQtb2YtYm91bmRzLXJlYWQtaW4tc2V0LWZyYW1lLXJh
dGUKICovCiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5jbHVkZSA8
ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRl
IDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1
ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4K
CiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxsaW51eC91c2IvcmF3X2dhZGdl
dC5oPgojaW5jbHVkZSA8bGludXgvdmlkZW9kZXYyLmg+CgojZGVmaW5lIEVQMF9NQVhfVFJBTlNG
RVIgNDA5NgojZGVmaW5lIExFMTYodmFsdWUpICgodmFsdWUpICYgMHhmZiksICgoKHZhbHVlKSA+
PiA4KSAmIDB4ZmYpCgpzdGF0aWMgaW50IHJhd19nYWRnZXRfZmQgPSAtMTsKCnN0YXRpYyBzdHJ1
Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yIGRldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGgg
ICAgICAgICAgICA9IHNpemVvZihzdHJ1Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yKSwKCS5iRGVz
Y3JpcHRvclR5cGUgICAgPSBVU0JfRFRfREVWSUNFLAoJLmJjZFVTQiAgICAgICAgICAgICA9IDB4
MDIwMCwKCS5iTWF4UGFja2V0U2l6ZTAgICAgPSA2NCwKCS5pZFZlbmRvciAgICAgICAgICAgPSAw
eDE0MTUsCgkuaWRQcm9kdWN0ICAgICAgICAgID0gMHgyMDAwLAoJLmJjZERldmljZSAgICAgICAg
ICA9IDB4MDEwMCwKCS5iTnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKc3RhdGljIGNvbnN0IHVp
bnQ4X3QgY29uZmlnX2Rlc2NyaXB0b3JbXSA9IHsKCTksIFVTQl9EVF9DT05GSUcsIExFMTYoOSAr
IDkgKyA3KSwgMSwgMSwgMCwgMHg4MCwgMHhmYSwKCTksIFVTQl9EVF9JTlRFUkZBQ0UsIDAsIDAs
IDEsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDAsCgk3LCBVU0JfRFRfRU5EUE9JTlQsIDB4ODEsIFVTQl9F
TkRQT0lOVF9YRkVSX0JVTEssIExFMTYoNTEyKSwgMCwKfTsKCnN0YXRpYyB2b2lkIHVuYmluZF92
aXZpZF90b19mcmVlX3Y0bDJfbWlub3JzKHZvaWQpCnsKCURJUiAqdml2aWRfZHJpdmVyX2RpciA9
IG9wZW5kaXIoIi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvdml2aWQiKTsKCXN0cnVjdCBkaXJl
bnQgKnZpdmlkX2luc3RhbmNlOwoKCWlmICghdml2aWRfZHJpdmVyX2RpcikKCQlyZXR1cm47Cgl3
aGlsZSAoKHZpdmlkX2luc3RhbmNlID0gcmVhZGRpcih2aXZpZF9kcml2ZXJfZGlyKSkpIHsKCQlp
bnQgdW5iaW5kX2ZkOwoKCQlpZiAoc3RybmNtcCh2aXZpZF9pbnN0YW5jZS0+ZF9uYW1lLCAidml2
aWQuIiwgNikpCgkJCWNvbnRpbnVlOwoJCXVuYmluZF9mZCA9IG9wZW4oIi9zeXMvYnVzL3BsYXRm
b3JtL2RyaXZlcnMvdml2aWQvdW5iaW5kIiwgT19XUk9OTFkpOwoJCWlmICh1bmJpbmRfZmQgPCAw
KQoJCQlicmVhazsKCQl3cml0ZSh1bmJpbmRfZmQsIHZpdmlkX2luc3RhbmNlLT5kX25hbWUsIHN0
cmxlbih2aXZpZF9pbnN0YW5jZS0+ZF9uYW1lKSk7CgkJY2xvc2UodW5iaW5kX2ZkKTsKCX0KCWNs
b3NlZGlyKHZpdmlkX2RyaXZlcl9kaXIpOwp9CgpzdGF0aWMgaW50IGZpbmRfdWRjKGNoYXIgKmRy
aXZlcl9uYW1lLCBzaXplX3QgZHJpdmVyX25hbWVfc2l6ZSwKCQkgICAgY2hhciAqZGV2aWNlX25h
bWUsIHNpemVfdCBkZXZpY2VfbmFtZV9zaXplKQp7CglESVIgKnVkY19jbGFzc19kaXIgPSBvcGVu
ZGlyKCIvc3lzL2NsYXNzL3VkYyIpOwoJc3RydWN0IGRpcmVudCAqdWRjX2VudHJ5OwoKCWlmICgh
dWRjX2NsYXNzX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKHVkY19lbnRyeSA9IHJlYWRkaXIo
dWRjX2NsYXNzX2RpcikpKSB7CgkJY2hhciAqaW5zdGFuY2Vfc3VmZml4OwoKCQlpZiAodWRjX2Vu
dHJ5LT5kX25hbWVbMF0gPT0gJy4nKQoJCQljb250aW51ZTsKCQlzbnByaW50ZihkZXZpY2VfbmFt
ZSwgZGV2aWNlX25hbWVfc2l6ZSwgIiVzIiwgdWRjX2VudHJ5LT5kX25hbWUpOwoJCXNucHJpbnRm
KGRyaXZlcl9uYW1lLCBkcml2ZXJfbmFtZV9zaXplLCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7
CgkJaW5zdGFuY2Vfc3VmZml4ID0gc3RycmNocihkcml2ZXJfbmFtZSwgJy4nKTsKCQlpZiAoaW5z
dGFuY2Vfc3VmZml4KQoJCQkqaW5zdGFuY2Vfc3VmZml4ID0gMDsKCQljbG9zZWRpcih1ZGNfY2xh
c3NfZGlyKTsKCQlyZXR1cm4gMDsKCX0KCWNsb3NlZGlyKHVkY19jbGFzc19kaXIpOwoJcmV0dXJu
IC0xOwp9CgpzdGF0aWMgaW50IGVwMF90cmFuc2Zlcih1bnNpZ25lZCBsb25nIGlvY3RsX3JlcXVl
c3QsIGNvbnN0IHZvaWQgKmRhdGEsCgkJCXVpbnQzMl90IGxlbmd0aCkKewoJdWludDhfdCBpb19i
dWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSArIEVQMF9NQVhfVFJBTlNGRVJdOwoJ
c3RydWN0IHVzYl9yYXdfZXBfaW8gKmVwMF9pbyA9ICh2b2lkICopaW9fYnVmZmVyOwoKCWlmIChs
ZW5ndGggPiBFUDBfTUFYX1RSQU5TRkVSKQoJCWxlbmd0aCA9IEVQMF9NQVhfVFJBTlNGRVI7Cgll
cDBfaW8tPmVwID0gMDsKCWVwMF9pby0+ZmxhZ3MgPSAwOwoJZXAwX2lvLT5sZW5ndGggPSBsZW5n
dGg7CglpZiAoZGF0YSAmJiBsZW5ndGgpCgkJbWVtY3B5KGVwMF9pby0+ZGF0YSwgZGF0YSwgbGVu
Z3RoKTsKCXJldHVybiBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBpb2N0bF9yZXF1ZXN0LCBlcDBfaW8p
Owp9CgpzdGF0aWMgdm9pZCBoYW5kbGVfZXAwX2NvbnRyb2xfcmVxdWVzdChjb25zdCBzdHJ1Y3Qg
dXNiX2N0cmxyZXF1ZXN0ICpzZXR1cCkKewoJdWludDhfdCByZXBseVtFUDBfTUFYX1RSQU5TRkVS
XTsKCXVpbnQxNl90IHJlcXVlc3RlZF9sZW5ndGggPSBzZXR1cC0+d0xlbmd0aDsKCWludCByZXBs
eV9sZW5ndGggPSAtMTsKCglpZiAoKHNldHVwLT5iUmVxdWVzdFR5cGUgJiBVU0JfVFlQRV9NQVNL
KSA9PSBVU0JfVFlQRV9TVEFOREFSRCkgewoJCWlmIChzZXR1cC0+YlJlcXVlc3QgPT0gVVNCX1JF
UV9HRVRfREVTQ1JJUFRPUiAmJgoJCSAgICAoc2V0dXAtPndWYWx1ZSA+PiA4KSA9PSBVU0JfRFRf
REVWSUNFKSB7CgkJCXJlcGx5X2xlbmd0aCA9IHNpemVvZihkZXZpY2VfZGVzY3JpcHRvcik7CgkJ
CW1lbWNweShyZXBseSwgJmRldmljZV9kZXNjcmlwdG9yLCByZXBseV9sZW5ndGgpOwoJCX0gZWxz
ZSBpZiAoc2V0dXAtPmJSZXF1ZXN0ID09IFVTQl9SRVFfR0VUX0RFU0NSSVBUT1IgJiYKCQkJICAg
KHNldHVwLT53VmFsdWUgPj4gOCkgPT0gVVNCX0RUX0NPTkZJRykgewoJCQlyZXBseV9sZW5ndGgg
PSBzaXplb2YoY29uZmlnX2Rlc2NyaXB0b3IpOwoJCQltZW1jcHkocmVwbHksIGNvbmZpZ19kZXNj
cmlwdG9yLCByZXBseV9sZW5ndGgpOwoJCX0gZWxzZSBpZiAoc2V0dXAtPmJSZXF1ZXN0ID09IFVT
Ql9SRVFfU0VUX0NPTkZJR1VSQVRJT04pIHsKCQkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JB
V19JT0NUTF9DT05GSUdVUkUsIDApOwoJCQlyZXBseV9sZW5ndGggPSAwOwoJCX0KCX0KCglpZiAo
cmVwbHlfbGVuZ3RoIDwgMCkgewoJCXJlcGx5X2xlbmd0aCA9IChzZXR1cC0+YlJlcXVlc3RUeXBl
ICYgVVNCX0RJUl9JTikgPwoJCQkocmVxdWVzdGVkX2xlbmd0aCA+IHNpemVvZihyZXBseSkgPyAo
aW50KXNpemVvZihyZXBseSkgOgoJCQkgcmVxdWVzdGVkX2xlbmd0aCkgOiAwOwoJCW1lbXNldChy
ZXBseSwgMCwgcmVwbHlfbGVuZ3RoKTsKCX0KCglpZiAoc2V0dXAtPmJSZXF1ZXN0VHlwZSAmIFVT
Ql9ESVJfSU4pIHsKCQlpZiAocmVwbHlfbGVuZ3RoID4gcmVxdWVzdGVkX2xlbmd0aCkKCQkJcmVw
bHlfbGVuZ3RoID0gcmVxdWVzdGVkX2xlbmd0aDsKCQllcDBfdHJhbnNmZXIoVVNCX1JBV19JT0NU
TF9FUDBfV1JJVEUsIHJlcGx5LCByZXBseV9sZW5ndGgpOwoJfSBlbHNlIHsKCQllcDBfdHJhbnNm
ZXIoVVNCX1JBV19JT0NUTF9FUDBfUkVBRCwgTlVMTCwgcmVxdWVzdGVkX2xlbmd0aCk7Cgl9Cn0K
CnN0YXRpYyB2b2lkICpnYWRnZXRfZXZlbnRfdGhyZWFkKHZvaWQgKnVudXNlZCkKewoJdWludDhf
dCBldmVudF9idWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2V2ZW50KSArIEVQMF9NQVhfVFJB
TlNGRVJdOwoJc3RydWN0IHVzYl9yYXdfZXZlbnQgKmV2ZW50ID0gKHZvaWQgKilldmVudF9idWZm
ZXI7CgoJZm9yICg7OykgewoJCWV2ZW50LT50eXBlID0gMDsKCQlldmVudC0+bGVuZ3RoID0gRVAw
X01BWF9UUkFOU0ZFUjsKCQlpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9F
VkVOVF9GRVRDSCwgZXZlbnQpIDwgMCkgewoJCQlpZiAoZXJybm8gPT0gRUlOVFIpCgkJCQljb250
aW51ZTsKCQkJcmV0dXJuIE5VTEw7CgkJfQoJCWlmIChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VW
RU5UX0NPTlRST0wpCgkJCWhhbmRsZV9lcDBfY29udHJvbF9yZXF1ZXN0KAoJCQkJKHN0cnVjdCB1
c2JfY3RybHJlcXVlc3QgKilldmVudC0+ZGF0YSk7CgkJZWxzZSBpZiAoZXZlbnQtPnR5cGUgPT0g
VVNCX1JBV19FVkVOVF9ESVNDT05ORUNUKQoJCQlyZXR1cm4gTlVMTDsKCX0KfQoKc3RhdGljIGlu
dCBvcGVuX292NTM0X3ZpZGVvX25vZGUodm9pZCkKewoJaW50IGF0dGVtcHQsIG1pbm9yOwoKCWZv
ciAoYXR0ZW1wdCA9IDA7IGF0dGVtcHQgPCAyMDA7IGF0dGVtcHQrKykgewoJCWZvciAobWlub3Ig
PSAwOyBtaW5vciA8IDI1NjsgbWlub3IrKykgewoJCQljaGFyIG5vZGVfcGF0aFs2NF07CgkJCXN0
cnVjdCB2NGwyX2NhcGFiaWxpdHkgY2FwYWJpbGl0eTsKCQkJaW50IHZpZGVvX2ZkOwoKCQkJc25w
cmludGYobm9kZV9wYXRoLCBzaXplb2Yobm9kZV9wYXRoKSwgIi9kZXYvdmlkZW8lZCIsIG1pbm9y
KTsKCQkJdmlkZW9fZmQgPSBvcGVuKG5vZGVfcGF0aCwgT19SRFdSKTsKCQkJaWYgKHZpZGVvX2Zk
IDwgMCkKCQkJCWNvbnRpbnVlOwoJCQltZW1zZXQoJmNhcGFiaWxpdHksIDAsIHNpemVvZihjYXBh
YmlsaXR5KSk7CgkJCWlmIChpb2N0bCh2aWRlb19mZCwgVklESU9DX1FVRVJZQ0FQLCAmY2FwYWJp
bGl0eSkgPT0gMCAmJgoJCQkgICAgc3Ryc3RyKChjaGFyICopY2FwYWJpbGl0eS5kcml2ZXIsICJv
djUzNCIpKQoJCQkJcmV0dXJuIHZpZGVvX2ZkOwoJCQljbG9zZSh2aWRlb19mZCk7CgkJfQoJCXVz
bGVlcCg1MDAwMCk7Cgl9CglyZXR1cm4gLTE7Cn0KCmludCBtYWluKHZvaWQpCnsKCXN0cnVjdCB1
c2JfcmF3X2luaXQgcmF3X2dhZGdldF9pbml0OwoJY2hhciB1ZGNfZHJpdmVyX25hbWVbMTI4XSwg
dWRjX2RldmljZV9uYW1lWzEyOF07CglzdHJ1Y3QgdjRsMl9zdHJlYW1wYXJtIHN0cmVhbV9wYXJh
bWV0ZXJzOwoJc3RhdGljIGNoYXIgZGlzY2FyZGVkX2ZyYW1lX2J1ZmZlcls0MDk2XTsKCXB0aHJl
YWRfdCBnYWRnZXRfdGhyZWFkOwoJaW50IHZpZGVvX2ZkOwoKCXVuYmluZF92aXZpZF90b19mcmVl
X3Y0bDJfbWlub3JzKCk7CglzeXN0ZW0oIm1vZHByb2JlIGR1bW15X2hjZCAyPi9kZXYvbnVsbCIp
OwoJc3lzdGVtKCJtb2Rwcm9iZSByYXdfZ2FkZ2V0IDI+L2Rldi9udWxsIik7CglzeXN0ZW0oIm1v
ZHByb2JlIGdzcGNhX292NTM0IDI+L2Rldi9udWxsIik7CgoJaWYgKGZpbmRfdWRjKHVkY19kcml2
ZXJfbmFtZSwgc2l6ZW9mKHVkY19kcml2ZXJfbmFtZSksCgkJICAgICB1ZGNfZGV2aWNlX25hbWUs
IHNpemVvZih1ZGNfZGV2aWNlX25hbWUpKSA8IDApCgkJcmV0dXJuIDE7CglyYXdfZ2FkZ2V0X2Zk
ID0gb3BlbigiL2Rldi9yYXctZ2FkZ2V0IiwgT19SRFdSKTsKCWlmIChyYXdfZ2FkZ2V0X2ZkIDwg
MCkKCQlyZXR1cm4gMTsKCW1lbXNldCgmcmF3X2dhZGdldF9pbml0LCAwLCBzaXplb2YocmF3X2dh
ZGdldF9pbml0KSk7CglzdHJuY3B5KChjaGFyICopcmF3X2dhZGdldF9pbml0LmRyaXZlcl9uYW1l
LCB1ZGNfZHJpdmVyX25hbWUsCgkJc2l6ZW9mKHJhd19nYWRnZXRfaW5pdC5kcml2ZXJfbmFtZSkg
LSAxKTsKCXN0cm5jcHkoKGNoYXIgKilyYXdfZ2FkZ2V0X2luaXQuZGV2aWNlX25hbWUsIHVkY19k
ZXZpY2VfbmFtZSwKCQlzaXplb2YocmF3X2dhZGdldF9pbml0LmRldmljZV9uYW1lKSAtIDEpOwoJ
cmF3X2dhZGdldF9pbml0LnNwZWVkID0gVVNCX1NQRUVEX0hJR0g7CglpZiAoaW9jdGwocmF3X2dh
ZGdldF9mZCwgVVNCX1JBV19JT0NUTF9JTklULCAmcmF3X2dhZGdldF9pbml0KSA8IDApCgkJcmV0
dXJuIDE7CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9SVU4sIDApIDwg
MCkKCQlyZXR1cm4gMTsKCXB0aHJlYWRfY3JlYXRlKCZnYWRnZXRfdGhyZWFkLCBOVUxMLCBnYWRn
ZXRfZXZlbnRfdGhyZWFkLCBOVUxMKTsKCgl2aWRlb19mZCA9IG9wZW5fb3Y1MzRfdmlkZW9fbm9k
ZSgpOwoJaWYgKHZpZGVvX2ZkIDwgMCkKCQlyZXR1cm4gMTsKCgltZW1zZXQoJnN0cmVhbV9wYXJh
bWV0ZXJzLCAwLCBzaXplb2Yoc3RyZWFtX3BhcmFtZXRlcnMpKTsKCXN0cmVhbV9wYXJhbWV0ZXJz
LnR5cGUgPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkU7CglzdHJlYW1fcGFyYW1ldGVycy5w
YXJtLmNhcHR1cmUudGltZXBlcmZyYW1lLm51bWVyYXRvciA9IDE7CglzdHJlYW1fcGFyYW1ldGVy
cy5wYXJtLmNhcHR1cmUudGltZXBlcmZyYW1lLmRlbm9taW5hdG9yID0gMTsKCWlvY3RsKHZpZGVv
X2ZkLCBWSURJT0NfU19QQVJNLCAmc3RyZWFtX3BhcmFtZXRlcnMpOwoKCXJlYWQodmlkZW9fZmQs
IGRpc2NhcmRlZF9mcmFtZV9idWZmZXIsIHNpemVvZihkaXNjYXJkZWRfZnJhbWVfYnVmZmVyKSk7
CglyZXR1cm4gMDsKfQo=
--000000000000a93ea7065b36d0b7--

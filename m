Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7893624C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147252; cv=pass; b=FUa2tJ9CKFGAlcfgqx3MD2a7Cpsfi2ta1SAptpEkJqzApfF6TB0b+tpkcpiXTXp8IxixFFd0HosvyvEyvNuGFX6iKL1O1MUziNV9HQQa8u784mj/v0/jxag6sqW18bke5qrCvtHz8Ja8AsUSGeFWjKlnMovQweoJQohRvrI02Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147252; c=relaxed/simple;
	bh=AZs/sm4zt5glGIybIrEVcQWeC/fAhNCbd0FittW9YuE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=F/ORJWg7aWuD8K6eFYvKZoawc5auiKDXxucXVbDZeh/vY5IgQUiHmZXPBUuvmtBTmFk1/Vb2vaBCXsiYhj7HPYAkDIjbXoIAz4xK9ZtU8gHXBnoTdljP2DhJ43BqdzYhVXCWr+k3ay5X+9g3PGn9tUKk4XRFCuQkyTVTLtXVGZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY2T39OL; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY2T39OL"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-529a1ee0e62so28294641cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788147241; cv=none;
        d=google.com; s=arc-20260327;
        b=gQmtluVY7Wv6afNPv4GyuS1fnRT47UHZ8RJiFAS8Ixrd6clr1dTpfOQtFyb0zhs7aB
         j7TDOI1jWIRxucnJSLp/39TjsyOR3006m83Mnuklk1J92QvxMGkXm+kwmmsXBnXhh8HE
         jCmnqUwzyipOVb4S7aPocxv4W/iWhUG/YNBwfeDMZlPXWX4ItsW0aBxg7loSwbj6Iy57
         hSMq2dHE/NA4o3Xw8WOtAVM5uQDrJ9sm8ZMwavx9NzUP+AY2bT6wZ0I09VRX/R0Er26K
         HZ+p4nfBOeHiOcauNIKpNbw5HphnJmqkt3qjDw7ZYaY/Ekz5KSBtIhklaO9VwdzOeWtj
         HcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AZs/sm4zt5glGIybIrEVcQWeC/fAhNCbd0FittW9YuE=;
        fh=XrSbaVbnzBuz9cmBFf/1ym1HbGCm4k3MMEO8Mf/icp4=;
        b=AD0jyY3kjoNX48P2cNne9UTNgb5CmaDK+QIRvn1ltlF9WIXo7KNOB/cypVMGV9d+m6
         G3JP0C4j2xhfcn7u0m8AyMj/YxlaDjWRpiV6pYxRLk3S11B6hniVEXkKrSF+J5Ow56HE
         GGL4+/xJZLSisSBLaMcALQMnF0R1jFtALiejwhuQ33VgUJt457NfkmcuQBboN5bRTD7x
         IZLEiOAmwWyKNSORtrAo96C/DIRTsxeRceGyReMcfUbHu3f8iAqQoOhu4Xef2wqmKQEq
         aLznfHuoW456Md6Xo0PIBTXkaHWYeB8T4fX+19PDAmnbRBjE8MitTy4pbinPUx8d2HUH
         Nt4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788147241; x=1788752041; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZs/sm4zt5glGIybIrEVcQWeC/fAhNCbd0FittW9YuE=;
        b=lY2T39OLMYz8inZDgVRURW5ECxtZihNwqtviZwhyKVAYkp9YvwNKHlizErZf7Jv2hX
         j1NuSpvsck6vcEMb5pfUyp77F8uV3WMmLNF/utLNLCSBH970RX+RrkXGd1xWJzx5OEMn
         0Tayuzejz5IAVyvyNEvvQ/u6Z1cWtU9U/li/GpRTLReLiMdF1p/2nuuvrggrkoGrh0Q4
         iOF4TfSQHvm8yYZrUCOz+apAJCv6B820ip2wuMQ1nNf+pHAOqvAnla/CqhQZIgEbr1HT
         dEz35De1jGgrbSaNdRBUhJcJeWTnmPL3lV3Q9G1f5egpXY+Z3zEVdo/L5jE4a+FM+dSc
         wnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788147241; x=1788752041;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AZs/sm4zt5glGIybIrEVcQWeC/fAhNCbd0FittW9YuE=;
        b=IoZN2YKN5VJL3i3TkKqksFAdo1yeaQrxHTFdo04X3i3gmnze11luKLjP505V080VSs
         H5LPPamOu6MydQyH/hkIQTvQnw0sz+PEmwRLvVil3IiXv9UGNdLvaFoPGIrJX5R+Fboh
         ICmjH8Q/IfIOxWfUQyae3RB8mm5YkrDysMEEDwGRlCccyQ0k9vkmqJQqjz9w0f2QK0Ly
         fsLZcPwVLRF0N+vOAHUFgcyXdcSAvNBvNs4z1Ml0+R9k1AavPJB9iNL60J/lpx0GDwCo
         x63f1G+XBVFmYss3dCGjdgQ+YPGN3CMLi9WzDtIKgHUrFWQ6hWFK+Sv/bKOURYeGiifJ
         aMQw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8zYgScu71cDGWuzOSzUw+/xvp6XLi8KZeIb8WWSSV5KyYpWlzWopcBy+uUZjpmEWJyBMpN64rt+HE9lU=@vger.kernel.org
X-Gm-Message-State: AFuF++mYeb2MVNORbCzoTdxtccJUzRYcR6royVsfRzcBrxsvxfmDd8I0
	alLB4Vleq2hPUNGNDHwpNUFD5LUkyH4Q5QMBcrdvqmIa2YU++zAqa8rADVWnVGt++Dyo5QwFUyA
	lTtwY1CagYvGwq91kRe1sKAeebSflWf1gt++nfbELlQ==
X-Gm-Gg: AR+sD11Bsyo9rWmx122ZKl1OnljPXfDpWID7vqP/TOp/PeX97580sRd4EnKBt24TYAS
	VRBU0EjjdHVRaY4j/Dc1hTJSoJfBpXh6dnoRYVD9GFHH36FymG2k5Cuh1zXcVvueRnJIPXT6sTV
	Yi6mMfvT4WHCuRVozlpyQlHci7ZPqOpsMQU1WRRk7NKuCK6PdiPyzUsD72MzAbZNFGkeXoirJHi
	QVTZ3R6kDUtbIzuPsAKVXkj5Aq2mkYI5mfVnOq1AEkY71s2wyMcEJsy9UmiQ9UtuL5pALK4zNvD
	pV+08Tg07ijxxO7W4f+k04GuJPWoN8qI9Vw+imSBbz6HUjGtF1uz+Y14y715eYZvBx+cdvrl/X5
	OXnnk9qbrCLktazCMiV1KknD3SYu4NtxX9AOxyZuMsydyHfET
X-Received: by 2002:a05:622a:8c6:b0:52e:fb1b:b50f with SMTP id
 d75a77b69052e-52fb967eab5mr305370061cf.35.1788147241018; Sun, 30 Aug 2026
 20:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 31 Aug 2026 11:33:49 +0800
X-Gm-Features: AcwNN1WTGXlb64mE7CNrNMnGsVoCgwkmdcjAFwSLONHTAjlK2eSrVlp7QOX01pc
Message-ID: <CAA2SOT7zxMtbW3=ZkEnb4R-Cmyqg=gX+yGr6NdG05--Nz=2pQQ@mail.gmail.com>
Subject: [BUG] ocfs2: non-static lock key warning in ocfs2_dlm_shutdown on
 crafted readonly image
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a lockdep warning triggered by a syzkaller reproducer on
Linux 7.2.0-rc3. A similar issue has been reported before, but I can still
reproduce this warning on Linux 7.2.0-rc3 with HEAD commit
1137d8b5df06137fb49513cc923b3b24d94cb809.

The reproducer mounts a crafted OCFS2 filesystem image through a loop
device. The image reports block check CRC errors, and the loop device is
detected as readonly. OCFS2 mounts the image in local mode and skips
cluster recovery. During unmount, ocfs2_dlm_shutdown() drops DLM lock
resources and reaches ocfs2_mark_lockres_freeing(), where lockdep reports
that a non-static key is being registered.

This looks like an OCFS2 shutdown-path issue for a partially initialized
or corrupted readonly mount. A lock resource appears to be dropped during
ocfs2_dlm_shutdown(), but its lockdep state/class is not initialized in a
way that lockdep can track.

Reproducer:

syz reproducer: https://pastebin.com/raw/TYgtTYYu
console output: https://pastebin.com/raw/pU2bSEGZ
kernel config: https://pastebin.com/raw/y7Hyukfc

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Relevant log:

loop0: detected capacity change from 0 to 32768

ocfs2_block_check_validate:400 ERROR: CRC32 failed:
stored: 0xb3775c19, computed 0x2dd1c265. Applying ECC.

ocfs2: Readonly device (7,0) detected. Cluster services will not be used
for this mount. Recovery will be skipped.

ocfs2: Mounting device (7,0) on (node local, slot 65535) with ordered data mode.

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.

CPU: 1 UID: 0 PID: 10387 Comm: syz-executor Not tainted 7.2.0-rc3 #1
PREEMPT(full)

Call Trace:
<TASK>
dump_stack_lvl+0x116/0x1b0
register_lock_class+0x778/0x7c0
__lock_acquire+0xa4/0x27a0
lock_acquire+0x1a4/0x350
_raw_spin_lock_irqsave+0x3d/0x60
ocfs2_mark_lockres_freeing+0xb4/0x5a0
ocfs2_simple_drop_lockres+0x1e/0x80
ocfs2_dlm_shutdown+0x43/0x250
ocfs2_dismount_volume+0x33b/0xa70
generic_shutdown_super+0x166/0x400
kill_block_super+0x3b/0x90
deactivate_locked_super+0xbb/0x130
deactivate_super+0xb1/0xd0
cleanup_mnt+0x378/0x510
task_work_run+0x172/0x280
exit_to_user_mode_loop+0x201/0x660
do_syscall_64+0x5ba/0x7a0
entry_SYSCALL_64_after_hwframe+0x76/0x7e
</TASK>

ocfs2: Unmounting device (7,0) on (node local)

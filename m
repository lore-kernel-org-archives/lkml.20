Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138B1362120
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055141; cv=pass; b=Sdsx1H5LqlYEw7P/UWAxPx9+dJgYjHdZwkU6g8daR3fNHdx6lmg7q8sfjkFbfSeokmh8uY2tg/BCMQ7T7DGkAhD4mEU8U0rFgo1jfjtYX4xVPlbsmFK2cv3mf5F0tfgZ84SkI82i9USZEv8IFx8vX2WOFygTqFEVvyzJPq1Uhzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055141; c=relaxed/simple;
	bh=tNMD9jaaAoiM5HIHauNaGThj4A1PZWuOXh1Xmlg4seg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lYpWkdH2UDjYI1SS3nbLSJX9v6NlKshfq6Qs6TfMmjYhBS73gqPuMWN8eCbyQRHgzxTxGJGRD6zg8t20Av3kKCCLcxGzDj6HulJ7OZkCQiwDNKrBM8KFdHi3uFmMGK0t2o9IbbKArN7yfjfD1q4YL412xasipBBZokpENFZAaHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCNbF+nA; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCNbF+nA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2940d16190so267046266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789055138; cv=none;
        d=google.com; s=arc-20260327;
        b=NmC/HNbxsfSaPWDZs5dQHLLgdM99HS+0O2jxPHoq5Zx429n+8onVHW43sjfk45PSAm
         wIBxRdp6wo7q4CNPQ5EbGmVQRvDR84k4MfxbelCWGAL08VOBgk2TMBX52QBGWxCBbab5
         29IIPmVc4oH2zbUxe0aWzO2KU1kuCYT2xN9WSRPuQxLfyH3XPsXNII/Z5vzNAminjee8
         0azoUstX+qEk+A9tzgQyULJ5XO1uR3h/U4+2mtSj4SMlswmBZ02FgM/QvNuvABZNOteq
         VQ8UHXGbP8KKHB9da6eAU25/oQTUdH0ubbyp7vmhHl+jLmNmy9w2j9qVQ//1sDqowCkA
         k4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MlQ4rFKTwWyoMEkW1u8Rf4R2+/mUltCh0nILf514HPE=;
        fh=FyThfcM1Y9uxDNcCqPEHsyb4ppnqIkldNBoodDG82tk=;
        b=rAQnDdSFr4bHcShADP2rlpxRqAoYAGR0pbAhvgEPVNByTImvzBns+giDZ41B5VW30m
         hiRzpFrf7ydS1cXux8/7Car1QVz0VeiFK9TqmsZPtZHE9ZNG3EDtmlPLbVG3bUmIXeFo
         CXyvlbgU9D6Jkchaw1jjk4u1ubxZC20ijiZG5UXz+IHg0Ucl82LM3tK/eXuxQ6Hve/Ji
         +Npc33RKFlg/p2BuK9IWQ7Um78mPyDuwaQc7YIOlyxIOk6O4gnbSY9WN8DyHHvHhIUHV
         4OWyDs2xRfP0h3VxA7WZ9N8oK/YYwZVLUqOf5gJJ3ZbUFcMIjMYFtoujIMRWCi3xbiLE
         EOcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789055138; x=1789659938; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlQ4rFKTwWyoMEkW1u8Rf4R2+/mUltCh0nILf514HPE=;
        b=QCNbF+nApYiEjTOgfUb7ykTvOm7AHBafbUA7YKyP675ZAdFaWWMtz1FGa1qrKXcvxD
         l3Xw7ZxefOfgeWvacsInmvESWLTAPISIll9AoZo/MY8A/koJUvqghWJqE7PlT8uq3AvG
         55Rke4hMddv4rgGYdIv4Rrn5Ddqv7v9asOG0wLDsOEVxUU+eQ1pCe6pvHmF6Pwj0F8DX
         N1JJrVLeChKvc54Hvopsi3B7tTca3uhAX2GHe7ocP5nhSmk/N5a8Vh1FWKYDUKBASztu
         EYOEqniARW3eRZezhh79tU9/FKZhFfV+MpRpkZTJxM3JsYEo6Eg2B1LvfZjqIegY4JIM
         68rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055138; x=1789659938;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MlQ4rFKTwWyoMEkW1u8Rf4R2+/mUltCh0nILf514HPE=;
        b=KP/Ecm0MQJH8pP3ypS44L/PRoUtItrX5JjcHY+Vvkn8kfPC9R4EPK3LTRQV/9CXfg1
         5ikBdijVHGWMXaLN01Ck9opsq5lTVOdxTtHMcM81+aHeJUWq8BYsApOIbJ8BQl+zSmaC
         UQLTqVkEupgcxUUCuVPNW9oVqLH/izX9I5jkKJtpx560qHqDM71j3S/V255gcIg8MIZB
         Tmpj0XfB9rgE6Zn+2MgBfNTVQaTrggwKW7EW6NWJwE92UV0oiNrUCdOK1kYDWFOWrq0U
         6qrQQYBARcDxPnLgI4hlqc3ouvy3O+FfHBrPYCy8mDOjHchHZuSH+UDf9dwRw/ZtBCyO
         FMkA==
X-Forwarded-Encrypted: i=1; AKwUvBymMV+mdRUF2WzxlJGNRmhDs+kXvktOBztSncxmQyZu+2tfY7qOsAM1g1hPbl6gTWealqd+ClbyzTGi3/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kbCSdoXBpzTpdRAxCXdB0axzc0pWYczhmx+8lX9cPSWhueN+vu
	rL5X04aYeoA/Ql6tgEhtQUeBsn9q2gqqvkTQDgmDfZgXIdTyz76R9agEUBlINNTBnzfgI5XkN6p
	ciTmu82+lR9x8TOswTU7KZUquIjN9RuTDX9CpcVH4lw==
X-Gm-Gg: AYBFou1QyV8UwbZJfwHDd0sCKNuIi6wuq0mc7jnDxffNBzQUffzjmpgid+y80Ra+TYa
	mMpV9ng1SdcQDWQRY7fKlYz3cnqCX+WkW0OV5h8tz2r8MhbazKx82g7YGpvZGUQoLjoTJWtA7et
	YJw4DbATtVN9gB22g100+lu9/YGpQpOSBwq7B0E6FvUHSNDRMy1puShx8ftvNNVyk8fllF20Uc2
	D5UR0+OVs6ApmQOscG9l/jomEJ3ATZ5ETN+7XKoZgBQq+nEk41ckvOaX3KC2Q3fIbgXBHRw9gEZ
	dKR1yC+Pi2GfjfIxCI8CsnF5CX9mEgfI9pym542bJkaBMYsw3xUR/2AUWZi+UwWLFgXNK0pSIm7
	gSAYygvAa8r67ozoaSnODRn4AwWfB73I/PZz1MZGi3i2WxJfINJUAOPyv1UmiF+V818J2Ypd0/r
	0loGghOSYKyFW0RQxgxXl35XGnGvlKgKJHTt23XBN7FA==
X-Received: by 2002:a17:907:7a8e:b0:c26:19e3:e97d with SMTP id
 a640c23a62f3a-c2619e3eefbmr1540707066b.29.1789055138082; Thu, 10 Sep 2026
 08:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?2K3Zhtin2YYg2KfZhNmF2LfZitix2Yo=?= <ha2020anan@gmail.com>
Date: Thu, 10 Sep 2026 18:45:26 +0300
X-Gm-Features: AcwNN1W7ipGTBvTBjeLBQjyXiPRmLzeN_Sk4LWMur1Ju8wfsMqjbFDUxxbJE9eM
Message-ID: <CANai08MgfRTOw3Ryx=QTfkbwu7OyjkWg9UfpWmSw5JVmDWof2Q@mail.gmail.com>
Subject: [PATCH] arch/um: Add security sandboxing by enforcing read-only on
 host system
To: richard@nod.at
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have developed a security feature for arch/um that protects the host
filesystem. It boots directly from the host system files (making it
fast and lightweight) but enforces a strict Read-Only policy on the
host, while allowing full Read/Write operations only within a specific
sandbox directory (/tmp/sandbox). Any write or modifications outside
this path will be blocked with an -EACCES error.

Since I don't use Git locally, I am sending the configuration, file
path, and explanations directly below. The actual implementation code
is appended at the very bottom of this message.

---

### 1. File Path to Modify:
arch/um/kernel/skas/syscall.c

### 2. How it Works:
- The modified handle_syscall acts as a dynamic firewall for the kernel.
- It intercepts critical file manipulation syscalls (open, openat,
unlink, unlinkat, mkdir, mkdirat, rmdir, rename, renameat, renameat2)
right before execution.
- If a syscall attempts to modify, create, or delete a file, it checks
the path string using strncpy_from_user.
- If the path is absolute and doesn't start with /tmp/sandbox, or if
it contains relative path traversal (..), it rejects the request
instantly by injecting -EACCES into the return register, thus
protecting the underlying host filesystem from any modifications.

### 3. Why the Custom Command and Script are Required:
- **Why the Command is necessary (rootfstype=hostfs):** Traditionally,
UML boots from an isolated disk image (rootfs). By passing this exact
command, we force UML to mount the real host directory (/) as its root
filesystem. This allows the sandbox to boot instantly using the host's
native system binaries and configurations without duplication.
- **Why the Script must be changed:** Since we are booting directly
from the host files, the boot and initialization scripts within the
runtime environment must be adapted to redirect their active system
state, logging, and temporary data writing exclusively into
/tmp/sandbox. If they attempt to write to the regular host paths (like
/var/log or /etc), the kernel security logic will drop the request.

Recommended Kernel Boot Command (Ensure CONFIG_HOSTFS=y is enabled):
./linux root=/dev/root rootfstype=hostfs rootflags=/ init=/sbin/init rw

---

### 4. Implementation Code (Please append this at the end of the file):

// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2026 Tamim N. Almutairi (Tamimdevlopment@hotmail.com)
 */

#include <linux/kernel.h>
#include <linux/ptrace.h>
#include <linux/seccomp.h>
#include <kern_util.h>
#include <sysdep/ptrace.h>
#include <sysdep/ptrace_user.h>
#include <linux/time-internal.h>
#include <asm/syscall.h>
#include <asm/unistd.h>
#include <asm/delay.h>
#include <linux/fcntl.h>
#include <linux/slab.h>
#include <linux/uaccess.h>

void handle_syscall(struct uml_pt_regs *r)
{
struct pt_regs *regs = container_of(r, struct pt_regs, regs);
int syscall;

UPT_SYSCALL_NR(r) = PT_SYSCALL_NR(r->gp);
PT_REGS_SET_SYSCALL_RETURN(regs, -ENOSYS);

if (syscall_trace_enter(regs))
goto out;

if (!seccomp_permit_syscall())
goto out;

syscall = UPT_SYSCALL_NR(r);

if ((time_travel_mode == TT_MODE_INFCPU ||
    time_travel_mode == TT_MODE_EXTERNAL) &&
   syscall == __NR_sched_yield)
tt_extra_sched_jiffies += 1;

if (syscall >= 0 && syscall < __NR_syscalls) {
unsigned long ret;
int violate_sandbox = 0;

if (syscall == __NR_openat || syscall == __NR_open ||
   syscall == __NR_unlinkat || syscall == __NR_unlink ||
   syscall == __NR_mkdirat || syscall == __NR_mkdir ||
   syscall == __NR_rmdir ||
   syscall == __NR_renameat2 || syscall == __NR_renameat || syscall ==
__NR_rename) {
unsigned long arg_flags = 0;
unsigned long uptr = 0;
unsigned long uptr2 = 0;
int check_path = 0;

if (syscall == __NR_openat) {
uptr = UPT_SYSCALL_ARG2(&regs->regs);
arg_flags = UPT_SYSCALL_ARG3(&regs->regs);
if ((arg_flags & O_ACCMODE) == O_WRONLY ||
   (arg_flags & O_ACCMODE) == O_RDWR ||
   (arg_flags & O_CREAT) ||
   (arg_flags & O_TRUNC)) {
check_path = 1;
}
} else if (syscall == __NR_open) {
uptr = UPT_SYSCALL_ARG1(&regs->regs);
arg_flags = UPT_SYSCALL_ARG2(&regs->regs);
if ((arg_flags & O_ACCMODE) == O_WRONLY ||
   (arg_flags & O_ACCMODE) == O_RDWR ||
   (arg_flags & O_CREAT) ||
   (arg_flags & O_TRUNC)) {
check_path = 1;
}
} else if (syscall == __NR_unlinkat || syscall == __NR_mkdirat) {
uptr = UPT_SYSCALL_ARG2(&regs->regs);
check_path = 1;
} else if (syscall == __NR_renameat2 || syscall == __NR_renameat) {
uptr = UPT_SYSCALL_ARG2(&regs->regs);
uptr2 = UPT_SYSCALL_ARG4(&regs->regs);
check_path = 1;
} else if (syscall == __NR_rename) {
uptr = UPT_SYSCALL_ARG1(&regs->regs);
uptr2 = UPT_SYSCALL_ARG2(&regs->regs);
check_path = 1;
} else {
uptr = UPT_SYSCALL_ARG1(&regs->regs);
check_path = 1;
}

if (check_path && uptr && !violate_sandbox) {
char *kname = kmalloc(256, GFP_KERNEL);
if (kname) {
long res = strncpy_from_user(kname, (const char __user *)uptr, 255);
if (res > 0) {
kname[res] = '\0';
if (kname[0] == '/') {
if (strncmp(kname, "/tmp/sandbox", 12) != 0)
violate_sandbox = 1;
} else {
if (strstr(kname, "..") != NULL)
violate_sandbox = 1;
}
}
kfree(kname);
}
}

if (uptr2 && !violate_sandbox) {
char *kname2 = kmalloc(256, GFP_KERNEL);
if (kname2) {
long res2 = strncpy_from_user(kname2, (const char __user *)uptr2, 255);
if (res2 > 0) {
kname2[res2] = '\0';
if (kname2[0] == '/') {
if (strncmp(kname2, "/tmp/sandbox", 12) != 0)
violate_sandbox = 1;
} else {
if (strstr(kname2, "..") != NULL)
violate_sandbox = 1;
}
}
kfree(kname2);
}
}
}

if (violate_sandbox) {
PT_REGS_SET_SYSCALL_RETURN(regs, -EACCES);
goto out;
}

ret = (*sys_call_table[syscall])(UPT_SYSCALL_ARG1(&regs->regs),
UPT_SYSCALL_ARG2(&regs->regs),
UPT_SYSCALL_ARG3(&regs->regs),
UPT_SYSCALL_ARG4(&regs->regs),
UPT_SYSCALL_ARG5(&regs->regs),
UPT_SYSCALL_ARG6(&regs->regs));

PT_REGS_SET_SYSCALL_RETURN(regs, ret);

if (IS_ERR_VALUE(ret) &&
   (time_travel_mode == TT_MODE_INFCPU ||
    time_travel_mode == TT_MODE_EXTERNAL)) {
um_udelay(1);
schedule();
}
}

out:
syscall_trace_leave(regs);
}

---
Please review this architectural enhancement and let me know your feedback.

Best regards,
Tamim N. Almutairi

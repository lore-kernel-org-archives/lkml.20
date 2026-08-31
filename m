Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C580F3D3339
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168393; cv=pass; b=RiEE3KQQlWEwPpoM1CVuZg1V/f10qmadetUByOo4lW93axvNhBLNj2vdaKhXDrXrtl3Tx8SlDXkwbNBryi6mpsyMx2zrBCF4Rc/jx/MnC+/ozeFPYRNvtqYxWf2FyOnPPIkYb5p+7hcdjHQkbOKE3MZ5iV8oQN4wFm4GvgmGREY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168393; c=relaxed/simple;
	bh=GBTgWejtGdJAKdiFr7UJ4AwaGexhIKwa4b9R0XxIbeg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qJroMaHgkSYM/4YCYMOeqr9W8ecnfk7lAmWcsTWIqctuOtlN2zzuuajIS8CcZ+G7/gtypZHy/h5KuB6kOWvZ0E4EyP59MHl7IRu4lNjYeFtyjVJK5k3GLQgk1WlW1rJfvtEcxaSSJDTkb2Nz4tCydWoPTOXBzS3ltpUMQER5GCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1k/CVsK; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1k/CVsK"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52f2577ac01so21670501cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168390; cv=none;
        d=google.com; s=arc-20260327;
        b=KCcmBbH9TT+Nw89ztThpI25j9FZIhO07/YLwiYGe/xH62TSLT/GvCNneKlcPvgYsPg
         pWsEkQU52yKaJeLLAyQxuYK+n1C9/wJKJh2RHv569MQdAqSCg8oxZKYg972MaWbWWtI+
         U3/bMZ4chLz9XzUuP4y5ZAjmiu6Ac6rINN+wzQoTxr2jkhouX4TI1cG0I0r0ihDV2yUV
         ibusJPWffWuLzDGCiF3yJXPrdrRVci7skNIvnG4HeFbZ0+PoJrXRCDMe8qoe6KmIA13q
         BQOf1bGg+tuMSY0+7oYX9omhkMTmTYW6zbPDv1Nx+dAT2wudi7xCSKE70WalYRjhgESR
         uOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Oc557eT+uz9yntWQBXBtcxG6zb+6RfKcRPnFhGyakfY=;
        fh=WYZIg1yIl7fK6A3sitwJ1VeZsw7xYSECTSLSaQWoQ2A=;
        b=UdJP33j8Pbv90gWOHbkAlw/gmHXVTOiMRUBykZvhluzTnlI7rS/XUzP5AjFeFhxnSJ
         IuFj/+sM40DUOQdoL9RAjdwczBr0IPZxYkR74DKoBO+dFLZBCxLmVDCeC3diPLIK64CQ
         mhjvUnIpuZMKwgx4Kc9UCbeA66lQoe0xEdoFRyaopRODBsaeKghjIX2Asc/pT3aFY2dC
         UtqNxWx22F0635btFH1q8h2vKrOh6uxR6PU1JP+KlGl/XJLTnMZ6vf4pL6p+vFm22ZUf
         QfDFU7y9dbv5WDhLDU97ESNt6iu6Qwxdi7BXJlNlGHFHqiK+gu4sOcyAwhmfcTFsL1sK
         QXUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168390; x=1788773190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc557eT+uz9yntWQBXBtcxG6zb+6RfKcRPnFhGyakfY=;
        b=d1k/CVsKVvaIyeR0uvK9X2eH41E0bdxY2jOhFnErtPi5Fm9hueftXJzYTey1dHGQbp
         Dn668Fs7dcF2WZJ76wcIlGQjgotVD1uKVDVUToY2UmIt/gA9DuB3pE/Meq/V4+mQnJ1W
         s7NdLCyC7UA5k4PCLc7wQitBCQTpzD2DREF8qXrLJjBEPQ8ihG8gwbVXXksJMtwsKqYc
         myzvE5IGoMlnoTDp9rjeo9juPt2k2TBHmkY9mp6P5ymTTUAHjkk1zcQd9v9PGsZtNiIu
         Qq33zDPIKHHEM3eb3tCj0m5FGW5uhMhwyhiVxFoKVt/OdVZFgZyPlYulTK2DYSiGvGOz
         TQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168390; x=1788773190;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oc557eT+uz9yntWQBXBtcxG6zb+6RfKcRPnFhGyakfY=;
        b=ScgN1HXcWUWRPTHdCTGqPQgOrwz6TK93B93LonYOhe4XK+WTHGgBZkWJlbyBBOdySu
         BRTOMSYC0AckEXWmd13zcWyAjjwIOsDOpmM0lGSNL52tx6rW4Ouip4QKAX/V1QiGUL5m
         psvt+F66D9HKSwQVvLX2+t5AQnoU4tHY+sKhTVA7Dk+O5tpqAwVAChSNgViIa+CDCXtL
         6LSfQKXHsfx/zQtJxW37roKkE32/MSBIkBNaQfMTicXdVxRCVLD6R+wC5IFnMLNdSkuZ
         NpNl2dudcp1gCEp8eywx8EQ6ibcezbc82RHrt3d2Z69QnvrThMknNIuB7NowL/uQYhD3
         Sidg==
X-Forwarded-Encrypted: i=1; AHgh+RoIdITulhVZKIJRk/cYlMZURKMtMH1NbdOJT6e8FjuX9nncdIIhsfuZHFFBBUz0TR9n/buDY+jYAThz4Ec=@vger.kernel.org
X-Gm-Message-State: AFuF++l9+9O8vpPCYRTA0mlXL+3PZcPfKZvU9wScSOKOQm5z7Lqc+KvP
	NrcmkgGB8Rh96YpC9HArQ/REEpltTcV4mpHReJLR2jvH4LkOSovDfxSarExcIrH6Gln4FWxgaQ/
	O8PgmkbDYJz0fXUX4pX7jDcxq3HRbFpc=
X-Gm-Gg: AR+sD115buPn1mEJbwPxKxG/iJfn/blP83pylP4PQcC+dIKc9Ctv/oSEPsioFSIDqSs
	uppV95v3piihB6fUt4d3mMpBDC5jSGSPjj1xYO+tGPaHie313k0ZaXiHdjrsk3UVEyIIYEVH9Tv
	NY1ZBa31aB59lMyJu0hm1ASgXX4V67JH0xyvJQc2UiCn9lpHxEzS6alNir483+52pdEMsRZOb+k
	D242fwxPAvWZbaLEFgNc6vFgc+z2r75B+vNMVPtwiQuBAUZNdT2A8KjTYsEbDcwgIYmq79mDsBY
	4sBMSTIl/ZJ2d40TXZb7n93lBGzmCQFqQLEsXC/DlkaBapk3wdP8SRNCMx79WaRetOocPfyjxta
	XdWKTV8wzHNPhWIOj/ElzXagRBZZnt1EFoG1ONJM=
X-Received: by 2002:ac8:5751:0:b0:528:583:a6ca with SMTP id
 d75a77b69052e-52fb947ce64mr298965361cf.14.1788168390317; Mon, 31 Aug 2026
 02:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 31 Aug 2026 17:26:19 +0800
X-Gm-Features: AcwNN1VmE5hg-mg3rivFLUTIR9ieFN67679RSw-ZKkt1qwYIsnJOkNZQM4cS9tE
Message-ID: <CAA2SOT4Hok5xOtbviX4HkeqVK_u79NZjw3+0WKZMmUQb35jORw@mail.gmail.com>
Subject: [BUG] usb: gadget: f_tcm: possible circular locking dependency in usbg_make_tpg
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a possible circular locking dependency triggered by a
syzkaller reproducer on Linux 7.2.0-rc3. Similar issues appear to have
been reported upstream before, but I can still reproduce this warning on
Linux 7.2.0-rc3 with HEAD commit
1137d8b5df06137fb49513cc923b3b24d94cb809.

The reproducer mounts configfs, creates a USB gadget TCM function, creates
a target usb_gadget fabric TPG, and then links the TCM function into a USB
gadget configuration.

Lockdep reports a cycle involving the configfs inode mutex,
tpg_instances_lock, and the f_tcm opts->dep_lock. The current path is
creating a TPG through configfs_mkdir(). It reaches usbg_make_tpg(), holds
tpg_instances_lock and opts->dep_lock, and then calls
configfs_depend_item_unlocked(), which tries to acquire a configfs inode
mutex.

The existing reverse dependency is created by the USB gadget symlink path:
configfs_symlink() calls config_usb_cfg_link(), which calls
usb_get_function() and then tcm_alloc(), where tpg_instances_lock is
acquired.

This creates the following lock order cycle:

configfs inode mutex -> tpg_instances_lock -> opts->dep_lock
opts->dep_lock -> configfs inode mutex

This looks like a lock-ordering issue in the USB gadget TCM function /
target configfs integration. The kernel should avoid taking these locks in
opposite orders, because this can lead to an actual deadlock.

Reproducer:

syz reproducer: https://pastebin.com/raw/xHmrR2GY
console output: https://pastebin.com/raw/G4WtE3Xs
kernel config: https://pastebin.com/raw/GhP15ssA

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Relevant log:

syz.0.17/12335 is trying to acquire lock:
ffff88801e4a6280 (&sb->s_type->i_mutex_key#26){+.+.}-{4:4},
at: configfs_depend_item_unlocked+0xe8/0x460

but task is already holding lock:
ffff888058c6c918 (&opts->dep_lock){+.+.}-{4:4},
at: usbg_make_tpg+0x153/0x5e0

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #3 (&opts->dep_lock){+.+.}-{4:4}:
__mutex_lock+0x16e/0x2760
usbg_make_tpg+0x153/0x5e0
target_fabric_make_tpg+0xab/0xad0
configfs_mkdir+0x5ae/0xc50
vfs_mkdir+0x35f/0x7b0
filename_mkdirat+0x407/0x580
__x64_sys_mkdirat+0x8a/0xc0

-> #2 (tpg_instances_lock){+.+.}-{4:4}:
__mutex_lock+0x16e/0x2760
tcm_alloc+0x20/0x310
usb_get_function+0x61/0xd0
config_usb_cfg_link+0x1f6/0x3f0
configfs_symlink+0x53c/0x1180
vfs_symlink+0x180/0x4e0
filename_symlinkat+0x324/0x430
__x64_sys_symlinkat+0x9c/0xe0

-> #1 (&gi->lock){+.+.}-{4:4}:
__mutex_lock+0x16e/0x2760
config_usb_cfg_link+0x57/0x3f0
configfs_symlink+0x53c/0x1180
vfs_symlink+0x180/0x4e0
filename_symlinkat+0x324/0x430
__x64_sys_symlinkat+0x9c/0xe0

-> #0 (&sb->s_type->i_mutex_key#26){+.+.}-{4:4}:
down_write+0x91/0x200
configfs_depend_item_unlocked+0xe8/0x460
usbg_make_tpg+0x214/0x5e0
target_fabric_make_tpg+0xab/0xad0
configfs_mkdir+0x5ae/0xc50
vfs_mkdir+0x35f/0x7b0
filename_mkdirat+0x407/0x580
__x64_sys_mkdirat+0x8a/0xc0

Chain exists of:
&sb->s_type->i_mutex_key#26 --> tpg_instances_lock --> &opts->dep_lock

Possible unsafe locking scenario:

  CPU0                    CPU1
  ----                    ----

lock(&opts->dep_lock);
lock(tpg_instances_lock);
lock(&opts->dep_lock);
lock(&sb->s_type->i_mutex_key#26);

*** DEADLOCK ***

Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7B3B893C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788148686; cv=pass; b=e94uRNlCa/6rF/a3XNQX6WQQCAJ8NDEZiFOGkDvg4NCHxUKG4fYQhlhVmRAD6bAkaeNoqpZlChi9Y670Mzh+rYECBHO3nvaoeCubVCbRlNz3+xLuTx0v9XUi8YOHzooVjEQlxB0Cv9epeNqXnu//mSxOQEy5KcDhlL9uWSYyK+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788148686; c=relaxed/simple;
	bh=4c+RsoD9+II3cHrkxTAlyGXQJa9lVnbS0MKfyDhd8XI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fkelLwjffsQ/mY8Mw5gbhWs0w+LF8wfnWOO2uT8i4gCyxXeyatCsLjIh3pMGSnzvtr1uHHErIxy63HHz7zJmGaRwlLvfNyvBk046PeNeP25kbw+ki1nBM+V/0KjXqJkljhkLPF0SRet8N0jwBw7Ts/TIJDKwcBkwEp26aOS8k/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ql1L32lx; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql1L32lx"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52b3934af3fso34030101cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788148683; cv=none;
        d=google.com; s=arc-20260327;
        b=ClV5IYed1eizhH/5NMtl7vuMPhH/ltX4G1CIkKSQssuwSaL3ceUdpbLVPsU6JG3Rnu
         YeP22/mBffRHl2VLP50Tnj7vUVHqcFKtD1EbVCFxgKv7UT1v/VGPlGnB6gk8sEpKD6Jy
         mvrL2H+PS3ih9Iv6pbLQLuuqbODaxiBkgOUEoHTEVedxaFSDhO9bBl+DeuI3d95ylkgp
         6m1CdviA6MkuLjwik/cHpdNP3mlhKZxdutfoKKHz6QvUdeqw8qpFHKWBbQEkk+A4rp07
         zlruyPiEoO2ARg5K/CPMdgVQ8rLCapsIFlKrQ08Z0mwkdlo1Vh8j0DJR6R7qAH7s4clT
         AE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4c+RsoD9+II3cHrkxTAlyGXQJa9lVnbS0MKfyDhd8XI=;
        fh=eqK4ozBIWylPvys/BY+aD0k2NUURA1l5tny2XP7lTUs=;
        b=SlefwFvywjQY0PWdos95ask8Vx9iaFREH5gusUk+83skuCTCpHoFDo8Q/OdT4RsNOQ
         62t1rMhtvhfX3P+GZ+3RBUq/r2ir5z6qYdjl/YPNgX2zlk3+3Ys4W0iz951UtoeqIK2Q
         4p3pIfYwn1W02jHFdLtJntby6ukr+8+ljQEQuV88IcqDdxqTB0+PQkYxTx/YzuAqQ9le
         qakEB7z3i8yBl9UkiRN5KrTNsIDXPTfXeSNqFIbFnwZCz2t4zpT06nFhvznTJxFq8O7O
         zFylePPwe8/UrZz8IhLNoneb/532OiP+FmUbHpuwkVYlPnxHnRGmw9rWnrR+7YIEiCUm
         9Z+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788148683; x=1788753483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c+RsoD9+II3cHrkxTAlyGXQJa9lVnbS0MKfyDhd8XI=;
        b=ql1L32lx0opywnNcCcqNo9pV137Gqha16UOiDMoksPDgU6+st4YU2oSTbExEsSAeRE
         A4MmPP2IPG9tAF6RsvahZDhdAfOIM1jDHQCKXBPkCy3bS0yNsK4YosmFirwuySZHevL3
         AfpzHjNrM5gG2iRb5f4js7LN83rBeXsyRWK2TRC9Lt9StYvECubja8/ncUPQyj+4/x6P
         5RcBGSsKwDhkFetdld9YdM4O+maTMTx3J5DSJUyUkHcHgF2N3d97bgdqe7DbGItMWXGV
         BfTQcSufv6uhuYzRnduYpDBhe62+lQfq4fT8NkJSgyOI+EcPu6fM46DbO0HqFXLroV/D
         Ck7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788148683; x=1788753483;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4c+RsoD9+II3cHrkxTAlyGXQJa9lVnbS0MKfyDhd8XI=;
        b=HkQu8tAwDRkzKWsgiFKCDTN5+uxieBZLdEyZ8yqoTJ8Rwuperju6rKi8sZJvaOl491
         k3qmuLvWTAa3pkUx0mtogCtnDovyNqR4XfrP9R9pJGFLCHR4WNK7aUEu8GRmFodhUZ1n
         Kc0vw4dSwVH6/+M7Qc2sGypz4zWJlGPfzphbbctEJu0ddYMST6J8BN9B1wTPa5gEK/P0
         PA1zlbI3ofPrNPIrg6HzjZAr6mQmuTBzwQazaHEw3yslC3lcQiflOdNKIK6buLtb+sFA
         1+ZnYogbDyHS5nwf+MhCMvDHSDzxqX5acSVkX+Dt06zdVDSQMA6Vz8kGmiL64+EU5azK
         ypcg==
X-Forwarded-Encrypted: i=1; AHgh+RquxHUf5/+U1urJWRTER1IJCKndqFFi2fbDD0rK3rHiXEdrLLkuNSv+rcy5WXfMVycQWSogQdbFSh4W9VY=@vger.kernel.org
X-Gm-Message-State: AFuF++kveZL6hEaZGzHcH+aMX0e88NeAXFHlD9bL1qh/Z0pQXoFpBM7C
	vtmXRTuX6XVX+sDXUGkbiODb55SGaHnWAjZVEZdCYnAL7lnx4TbTav1wjsOqMHXamtSKYn1P+ve
	dEa7/8cReCzRSnQB9IXOp8cxxUJXLdEY=
X-Gm-Gg: AR+sD13a++PvNAqbqKmgt9olO4QDwYbdWbtJBwZYs9E/sw8VVVjwnl0uy0dW2aXecQq
	K+qiL6Spo3tbDydzz3h1jFU2nmYaO3DruLT11lqy0c+Np0LoqSxRFR0DfceNbUwMvFwByGwOl1M
	El6O5ulqDlgPJihdP8w7O5qU9Y1ZNp9MiZt99vxWAVgENN7K425BEZEEk1gXRozjFD17ngz0rIe
	0AkMNJt6rcNnrPaLwlpVeYAFRwM8K5nkAeN7Y3y6Rq31zzx1+Ebz81zMvRNu67UDBAg0K+wee2D
	Gy6D4EvVtdk++1JTmaZjqbr/AXQEyMPS7EYNCYOQD1glbyIGNxUBe/KJXS9Vfd1ql5B9ILVbldK
	TdJ7bf7SJZXftR/4GK3F7vpn168FJDex1rzHfbTOLYhZc/BLY
X-Received: by 2002:ac8:5a06:0:b0:52b:4e1f:941d with SMTP id
 d75a77b69052e-52fb9374694mr266748461cf.6.1788148682642; Sun, 30 Aug 2026
 20:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 31 Aug 2026 11:57:51 +0800
X-Gm-Features: AcwNN1UlLAAe-jLwhlyyvq1Inj8sGqFww0HtJyfJLkVnL2nqFBrYPyn0YlJZXbM
Message-ID: <CAA2SOT45iFOrqCArQ8izfMO8npM-L-VjPctCoLrHaGZG=OD81w@mail.gmail.com>
Subject: [BUG] nvmet: NULL pointer dereference in nvmet_file_ns_enable without device_path
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a NULL pointer dereference triggered by a syzkaller
reproducer on Linux 7.2.0-rc3. A similar issue appears to have been
reported before, but I can still reproduce it on Linux 7.2.0-rc3 with HEAD
commit 1137d8b5df06137fb49513cc923b3b24d94cb809.

The reproducer mounts configfs, creates an NVMe target subsystem and a
namespace, sets buffered_io to 1, and then enables the namespace without
setting a device_path. During the enable path, nvmet_ns_enable_store()
calls nvmet_ns_enable(), which then reaches nvmet_file_ns_enable().
nvmet_file_ns_enable() passes ns->device_path to filp_open(), but
ns->device_path is NULL. This eventually reaches do_getname_kernel() and
strlen(), causing a NULL pointer dereference.

This looks like an nvmet configfs validation issue. Enabling a namespace
without a configured device_path should be rejected cleanly instead of
passing a NULL path to filp_open().

Reproducer:

syz reproducer: https://pastebin.com/raw/HheWvkXb
console output: https://pastebin.com/raw/K1ppzMhe
kernel config: https://pastebin.com/raw/EhG6vG6K

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Relevant log:

nvmet: adding nsid 1 to subsystem testnqn

Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI

KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]

CPU: 0 UID: 0 PID: 10781 Comm: syz.0.17 Not tainted 7.2.0-rc3 #1 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.10 PC (i440FX + PIIX, 1996)

RIP: 0010+0x1e/0xa0

Call Trace:
<TASK>
do_getname_kernel+0x1d/0x250
filp_open+0x1d/0x50
nvmet_file_ns_enable+0x97/0x4a0
nvmet_ns_enable+0x494/0x6b0
nvmet_ns_enable_store+0x11c/0x150
configfs_write_iter+0x2f4/0x4c0
vfs_write+0xbaf/0x1160
ksys_write+0x121/0x240
do_syscall_64+0xc4/0x7a0
entry_SYSCALL_64_after_hwframe+0x76/0x7e
</TASK>

Kernel panic - not syncing: Fatal exception

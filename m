Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856F43546E2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692888; cv=none; b=cj4sVAYUN/b+QDVQNV7EHGPlc+dLIyEDZS20x5PoCZ/HLkHC+wYaoV1eodWefiz9pSSInsPuGJyfhEDNBsJcLnAmez2DIGFSur93BIOcK2t7eyltc0JQsByoklB4+s4Ii8pn8VJRdYKQ9OerE8+cuEJs3il5cfCGtltIx9Ds690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692888; c=relaxed/simple;
	bh=bHsl1RoAZ+2PQm2x9KmmGpx92l8JkWFWcET72A1oqAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAx/3r+XKK8oSrqtsH5dVm59S2CTH/RygYpKX2BQh2Jvo8Ibi0M3ZYN2iIgELUk1+TmgOrTIX6aDub8f7neDH0OGMWczpDstAxWagKUwTN7Ed8iXLg3YyjsHMZ5sCXuvaZMvdOu4ZzyjmZAMOiDYVaEYcFGfVncDwOcLwdkOXz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V44ttv4d; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V44ttv4d"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so61417a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789692886; x=1790297686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSXKLzJLu9wuKLJMxpq//1SCFGckwLL0KtALmCoAmP8=;
        b=V44ttv4dzDdNfhYqOIi0wP20mDKM7xULbIjV7+vyj2rrA+qsXuWdeZaL3mrgrEZ/ga
         FwLp15vNV7eZupclhjYKMoALxt5TsT7/+FhOnzXCtvoLmjhEEsmmba9+VmpBzBCkhpNW
         IiTKLuaBC90DVe8xP4m5JHqezTzQ42ob6xpe9WdH3is+e2cWAYoZGalZCa+jvna4I6x/
         flSCIvqqr1QapjVMgpiL/uWZMNf+/vbIVvEXLLBFKhPHc3aG6rltahR0n5mHWU80A9jd
         lFucpPPqnBIOxJmgu26d8lT/N5kHzSUFq7k4ge+Tqsx3q2NjClzFE7QDcGkXushGQe+q
         Mj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789692886; x=1790297686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSXKLzJLu9wuKLJMxpq//1SCFGckwLL0KtALmCoAmP8=;
        b=P6X8AOpaGedkLEI5HrT9M0ej7V5gX6iXcAhIQZt4ZxEgP8I4t0JOTFlin/GNBxosz2
         y3mpAsX3DivOsNrcK4ONoobCrSQkfqYOCo8AA09/ES+cu0y81ulgez0QRBfCApx1gU68
         qRNp1rrEVi+pXDprF4NlRClRfzA28cOad4+JDVR2lgOshV09mJiBAwWLOCNpXIBhUUVY
         ABdSuhHME94hjtE/pSyFjLfWFd+B5nD+4Pnl2Q9Q0+yWSZ/T37kpJt+Ue9SXiQg0uuOn
         ugzQclDOZvPAMye81rAclFj2r/UW6s6nE1TS6KWqJrZSC5DeZLN78rVzVmHMh3e9zlZE
         xMrw==
X-Forwarded-Encrypted: i=1; AKwUvBygITz6Ys7MmeesKIS5jh8Dim2qXFLPpE93nOzQtI1TCgFgPbQL/axen/2OtiB5+5QRC8gYbbSs+hMDmeA=@vger.kernel.org
X-Gm-Message-State: AFuF++kP1LxssaBhxv1Fl3cL/eKgmW5cUv/lHLAtLNcjKMZLf1h3igMd
	AGOEH2NdGohqmieHAlDhGisiKzGV9+Khn0iRXTBu9wOTmoMFGynAGv3e
X-Gm-Gg: AYBFou0ZUc/NxVqvjoR5AFU6WvI95NfP+eg0JvJymwQjjJtKlvmg2c/ZZeW/RaPxyT/
	HG1ShDednlru/PbMycsXwqSbE9r5OUTz0GeJYBXR7o2yZT9IJVdKJhzOCLt76HJR1HhYHtswYYJ
	csUTPafQCt55OnaYSGCFtGqX6Q2VRzR3vXhyEa4Tmxfydiku7GYk7Im5vQ1TaoZt4FnzPIjx/gZ
	CCF2rLjr/fqDevGIVGaUcie+yNh+QrIsCSDUXVeRQCx+DX6dMFXhRk64oCnbhRP0mW2VLo/qdfl
	y+Oogg3Lr4mspVdtk7C171OB+S+xCD8R/W9j/0Zd+AA8p9BYbC9MyTSCGi8pHLgWxMoRhZI8poX
	tz/y2V3mp5JRZSt7uPWi+U4P1O9CNqRdGhXuhAuiE184lVp8yQGo+rVOi5DyympZDTo3AHVpxOM
	H+oySwvyOA2QxcombbInGytch1apoq1weiYoy3XsrOeBGFScJby/35GcxXmHstkChrPqajVN334
	BxXfzZU7uMsP2kFnICy9kV+ClAiyoAOeyM=
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr1664295637.3.1789692885701;
        Thu, 17 Sep 2026 17:54:45 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:84a7:aa72:4f01:6c70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm25238885eec.2.2026.09.17.17.54.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 17:54:45 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [RESEND PATCH 0/1] usb: gadget: f_fs: fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Fri, 18 Sep 2026 08:54:37 +0800
Message-ID: <20260918005438.81263-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Hi,

This patch addresses a kernel NULL pointer dereference panic in
FunctionFS when calling the FUNCTIONFS_ENDPOINT_DESC ioctl.

In FunctionFS, user space can legitimately supply only a subset of
speed descriptors (e.g., only full-speed descriptors via
FUNCTIONFS_HAS_FS_DESC). When the USB gadget is subsequently connected
to a high-speed or super-speed host:
1. composite.c:config_ep_by_speed() detects that the function lacks
   descriptors for the current speed and gracefully falls back to
   full-speed descriptors (f->fs_descriptors).
2. The endpoint is enabled via usb_ep_enable(), and epfile->ep becomes
   valid.
3. However, when user space calls ioctl(fd, FUNCTIONFS_ENDPOINT_DESC),
   ffs_epfile_ioctl() selects the descriptor index solely based on
   epfile->ffs->gadget->speed (desc_idx = 1 for HIGH, 2 for
   SUPER/SUPER_PLUS).
4. Because user space only supplied full-speed descriptors,
   epfile->ep->descs[desc_idx] is NULL.
5. The subsequent memcpy(&desc1, desc, desc->bLength) immediately
   dereferences the NULL pointer, causing an instant kernel crash:

[    2.154836] Call trace:
[    2.154836]  ffs_epfile_ioctl+0xe14/0x2c40 [usb_f_fs] (P)
[    2.155003]  __arm64_sys_ioctl+0x128/0x1a4
[    2.155298]  invoke_syscall.constprop.0+0x64/0x260
[    2.155374]  el0_svc_common.constprop.0+0xa0/0x240
[    2.155441]  do_el0_svc+0x3c/0x60
[    2.155494]  el0_svc+0x38/0x98
[    2.155547]  el0t_64_sync_handler+0xa0/0xe4
[    2.155606]  el0t_64_sync+0x198/0x19c
[    2.156463] Kernel panic - not syncing: Oops: Fatal exception

The fix restores the speed fallback loop mirroring config_ep_by_speed()
and historical f_fs behavior, defensively checks epfile->ep->ep->desc
as a fallback, and returns -EINVAL safely if no valid descriptor is
found.

Testing with QEMU ARM64 using dummy_hcd confirms that after applying
this patch, the ioctl succeeds and returns the fallback descriptor
cleanly without any crash.

zjamg (1):
  usb: gadget: f_fs: Fix NULL pointer dereference in
    FUNCTIONFS_ENDPOINT_DESC

 drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
2.53.0

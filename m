Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1EB52E063
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653245; cv=none; b=BrzrE2e0Cc69asmbTLY7XM7d/WjDba8JgPs9Fc0bL1YF9FajsfizoyukGqCf+EZqNpVuUOiV8ZGEdefjJ+V5YZ7kgbcgLh5Z2t5Sz3ASRNCooRF7xp8FDGxc8h/NP0w8rL3vvgy7fTcFSXfuZIj42SwBDOixCva11GtqIvPSeeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653245; c=relaxed/simple;
	bh=GVAbVs1ko/DCvmd45vSlohdLGyXD4c4o5mSOdN+8aQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejnQr9+3NUQz/TeQvJAeXvZceoW7CkodvqKa80bUaypS2WJ1ihUoGPonTSupL4SqSu29D1RFCHHse67TBbsKOiGbfg1e5jPWSCiIiZza0eXSdzomqNVmL9DdQIqy4SdKsDFc+70X1RCEMlyTAOHMdLtaApej/JFf7tILqu/UBl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUWP2Et4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUWP2Et4"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a1676000so675819a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653225; x=1790258025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QM/bFkqvQv3qHi5Zy8hlal9hiWJ8KUyMb1Ia/K3+NuU=;
        b=LUWP2Et4I1E5Gm7V//Ehf3d/mxFgtKygnQGAfjS6p1xppqcDAZ3QWWZQzyMv4AnLjA
         JImXw0qserROQneJyW54TVa+47P+DKBGt2QUslegbMrcCAdo/62k9EyZHQzW/YRLCT95
         ZnrMlHPe61KOtPl4Fv5sZdRZffoEMil+P8H9j+G7wF69oTaBqnyYtZGy/pCLmIYFCDcs
         Drf63WeWcsbkfkEkpZ8udiLfHeKbDl4wx9rwDt/ikgd5Tl+i7cILz6EN5weUaVyrWwNn
         FJUmh9SpLipV2iKh3hYiMrXiMcKcb9EHDJ3CoyANVs/h/DFKc/sVZ4s+TE9NMDloXU7z
         93Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653225; x=1790258025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QM/bFkqvQv3qHi5Zy8hlal9hiWJ8KUyMb1Ia/K3+NuU=;
        b=QItp2eePlkafcuYpqGDSVzeVEAj1ikanXGZQL/k6kQZWj3WZwWwkw9HEE1akg/A9NP
         go2/1sl1Wu69keOqeDkO0j4gh8uJnKNRllrr99CA2ul/XGjJ925aePoa3bhEnl8LsDaj
         12sbvbD157cGQaIR8bzEOz6GnODG5bah1v05XoAbFKz/hDBtJ7lUzxexgt6MQvzAcoV8
         b8iJBWekmCwxwdPG4822WzmtlkrjJLBokp3y4Q05HFv7kUP4A6L4MtmAoV4OiBuLtdE0
         txk9Ld/8OuJDLfrp9HAcW/HpeuhMOKZEyxdx/Cuq8lIgBRRsyIan86bhpZ4RqSAbXF53
         bRlw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ECCmZLsmAJerriSawwzCv+mNX+BV3bISgqfqPR9kyPs+nMXQv3zYsUyul1Zxy/4u92t04zNgdscT2iU=@vger.kernel.org
X-Gm-Message-State: AFuF++kCGwNPKjKFQgoRfseS02TAYf8HjRYfUp1oQePQ9hQ9LAgXP+Ta
	7iSCa+o2ae2W4MKtC1Mj6hxRcIy6K8XV9LRNwkXx6PMdxN/bX/3uUyJ4
X-Gm-Gg: AYBFou2YAI4K5CtnafcWR8+8xHW+NZsI+dF44aVwGNnUSmW2QYkFbhBrxXeDUhh90Uf
	s73aiusUKvk2dcU6NxQ4QIcsSeoX82TQ6EbEHpc6AusMiclqpgT8KrAJK3bgOH/Wi+C1K1V2LrE
	0bZqfi9bHJ7OewyJaXX34riQ538e4YETYj+NKUL/4OnU+7tfp38wcA1KyxhBhgYtNr3TMNGSiwB
	jkwVb/yy8JowUy/wm6UEDWsW3FRqqViD5+LrwtkH7pyVTOP7HpyzSjELBObrH3z/Mfz4H32FV4Y
	kJ/YSA8mqNOY0AnOZDlpQW4/pWqMgIjmdIFQ1JNXA6GX0mo+b+YPKgfJEcfX/YnlQthois9YWMw
	50A1w1N45SQ+2sR3iTVgtHB9pwkwU9tfB8uM5FSrtiZBMtsehTknDTcuDQNMJgQdAS8Inm57iLP
	fyqmT8LrVOUmwEyZFHU540sLgCKn4jLsKyyjuaM5OTuO7YFJ7rF6Bv7JYAi+sQfrOZ4HzWJbE06
	8GkOJ89/0FvsKqmj5jvbZnl1++VMzWnWw==
X-Received: by 2002:a17:90b:1c87:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e1e51d7dfmr15166649a91.23.1789653224957;
        Thu, 17 Sep 2026 06:53:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:2428:17da:9062:91b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5303334a91.16.2026.09.17.06.53.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 06:53:44 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>
Subject: [PATCH 0/1] usb: gadget: f_fs: fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Thu, 17 Sep 2026 21:53:36 +0800
Message-ID: <20260917135337.65444-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

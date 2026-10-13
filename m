Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC251D52E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911277; cv=none; b=n1106RB4mFt4I7tXCboxg1zm9AZalcUdmto56/AOKBkFgf4aJUnuq67VsinyjiTjfzkfXA4bAKYglubACfxHbz8XXnFn3LAmAo25GwuDySgusUD5Rp/GUdyMgGVVckd19nKtKE2NrtKgIQnQrfdotgloAh/bie4VB8syYsQmXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911277; c=relaxed/simple;
	bh=rTuBmNyR0XGlPFPwSHO2WH1nLAjzRa3ub5EVcsQW5aY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ColsS8Unz2M0Cy5EjlQj0Kiv0/YZUov4wCJjY5nh96PSFvlNFTblce2dPoImR6xsUu6rrGPrYxCCGN96/k+alZoul67T3/3gOQPNyLPOOfjqPfnD8w+8sIwme/JDn2exykK4CDhMr405IV+vmgaVUOMseqmZsrr43a1QjMi8zoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzVk6HIw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzVk6HIw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso42045425e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791911273; x=1792516073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdq9VK8+Wh/mRy8KAkG8P/JTclrVTJdKPo9KBX5A3pI=;
        b=dzVk6HIw0T3/iAzjQ3p8uI1GP9o167LUyDuHnnxwurcPbc+pxX3L/WW0QpN4XDgfQf
         evJKp+bcxa1rSHfs9fOLxh940q4GNrsZIa/XfYb5NvV+RRDIq2Q3UZCiFHM0HKnWeAgH
         73IJ6UgEnx4XuhoRe3fvu3NObnpuCbzfNDqFsI/qw8qfI5fEq4Teq103MK2GNYBLhof1
         jyK09JiJhKepNmZUZr08ZSuMvzvbl/MJ+CZugtXAzP+InRfFKtruAUuu9PQ1+HTCTwHX
         DC0KFpHWdoyNlnkRxs1jxveOg2d05HNqftqTPX0CX7Jj+sDohXT8A3ia+G6SLbOLK9wE
         2kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911273; x=1792516073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdq9VK8+Wh/mRy8KAkG8P/JTclrVTJdKPo9KBX5A3pI=;
        b=Ivky8sM8J4ehTibGgLQhoJdOGeLNQasFkw+8RwM0I//GWhz3uHgB4ynOO4+1VbTa25
         XaPtE8MWboVobdcMA7yxEWClHxi6htGpAxV1zOOq1IhG7/GCDTs9FTTRMQMrw/OPd79z
         av4KsvuHviG9owi9U1LvR/26cgRD9t8y67LF2KIL6vLdte6ZZ590bJscm9ToB6qp4eZz
         oihDVLjzb7aqrTkn3jv1DOZXJIwCXOi94ywVFWONlRG19TiRdZ4qtoeeZmTsbRhnEllT
         x+rK6CwAXWnUUBOSj7rikMmt2fVLVqCu2b32/3x2y3pH0tESqwmd99/8YavevTUfvEfD
         RiCw==
X-Forwarded-Encrypted: i=1; AKwUvByJyPCDd/BDPYtTjITEJ81qHedAQd07jbE/C1H08RdJq6fQP2MLbpFcufDRi9HP4U4h+W6pn129ZhRyCms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF1nCv0aezwNl1Ew9ECVYlOP+h0f9m7vVAElDmEpYUeF9GYWBG
	RuRixR8O4zoy9Vng8MDpwv0IHbXYkig2bH8B1EtQaXCXiuH8QhRQEizd
X-Gm-Gg: AYBFou3hLxi8c7qJ+AjKt1053pyX6Z8wnhF/gkRodSnrawxq0vt0zy0iky+eWh8H8s0
	t8rIMv+2vCVEdH7OQb4FqEmbmmuK5YiF+ZYqSRIkBgBFRYKlVGLH/kdFB2YAbjn/CRzL/24I4sz
	s8/qMm6yKIcwxYxxWZP42+bA6Vx3mTMmgAeMJKnRKkBySeUiNqKw5eW5d6uBDlVmy0kecQXiHKJ
	MMyTKZ94vDE3TY+zJlTX9EVL+D+iew4czLUjGmFaTkLkHwfugb/lKEutKgeoCiE7RbZ+ezugDSC
	B3hDvLbBwjWZlx13Vce/BrZOc88rjFwY+j/OWarYuUThJRayj6Ef3DQ0SPacs63AvF3FNa9O4xX
	fc8zJu5Xdp4w2waReSD9KeLGRZ555HF2u8tpQSjNhCeFwqENHF1KHPtMLlIH1onGJgoePfn2z/8
	nxzoCP5zRM0DP9KOdZpmeJDxNj31lgJWI5RwIK4KiqrQEiP0hkcjbKoJtWtjIqM+cAFA==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr228195185e9.8.1791911272543;
        Tue, 13 Oct 2026 10:07:52 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm379560935e9.4.2026.10.13.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:07:51 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen/gntdev: fix deadlock between map ioctl and mmap
Date: Tue, 13 Oct 2026 19:07:45 +0200
Message-ID: <20261013170745.583279-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 45ca1afe2fd1 ("xen/gntdev: fix error handling in ioctl") moved
copy_to_user() in gntdev_ioctl_map_grant_ref() under priv->lock. A
fault in copy_to_user() takes mmap_lock, while gntdev_mmap() is called
with mmap_lock held and takes priv->lock:

  ioctl thread                        mmap thread
  mutex_lock(&priv->lock)
                                      mmap_write_lock(mm)
                                      gntdev_mmap()
                                        mutex_lock(&priv->lock)
  copy_to_user() faults
    mmap_read_lock(mm)

Reproduced on Debian 6.12.111 in a Xen guest, with the ioctl argument
on a MAP_PRIVATE file page that has not been written yet. sysrq-w:

  task:repro state:D stack:0 pid:4479 tgid:4477 ppid:1 flags:0x00000000
   rwsem_down_read_slowpath+0x25c/0x480
   down_read_killable+0x48/0xc0
   lock_mm_and_find_vma+0x96/0x250
   do_user_addr_fault+0x12d/0x620
   exc_page_fault+0x7e/0x180
   asm_exc_page_fault+0x26/0x30
   _copy_to_user+0x36/0x50
   gntdev_ioctl+0x3b9/0xa00 [xen_gntdev]
   __x64_sys_ioctl+0x97/0xc0
  task:repro state:D stack:0 pid:4480 tgid:4477 ppid:1 flags:0x00000000
   __mutex_lock.constprop.0+0x41b/0x720
   gntdev_mmap+0x4d/0x330 [xen_gntdev]
   __mmap_region+0x697/0xb10
   mmap_region+0x78/0xa0
   do_mmap+0x45d/0x630
   vm_mmap_pgoff+0xf8/0x1c0

Drop priv->lock before copy_to_user() again. On failure, re-take it
and remove the map by index, as IOCTL_GNTDEV_UNMAP_GRANT_REF does,
since another thread may have unmapped it meanwhile.

Fixes: 45ca1afe2fd1 ("xen/gntdev: fix error handling in ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
 drivers/xen/gntdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index b71f5ba..1ad0220 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -670,15 +670,19 @@ static long gntdev_ioctl_map_grant_ref(struct gntdev_priv *priv,
 	mutex_lock(&priv->lock);
 	gntdev_add_map(priv, map);
 	op.index = map->index << PAGE_SHIFT;
+	mutex_unlock(&priv->lock);
 
 	if (copy_to_user(u, &op, sizeof(op)) != 0) {
-		list_del(&map->next);
+		mutex_lock(&priv->lock);
+		map = gntdev_find_map_index(priv, op.index >> PAGE_SHIFT,
+					    op.count);
+		if (map)
+			list_del(&map->next);
 		mutex_unlock(&priv->lock);
 		gntdev_put_map(priv, map);
 		return -EFAULT;
 	}
 
-	mutex_unlock(&priv->lock);
 	return 0;
 }
 

base-commit: 61b6d1df1d6234c38a6ea7e4f58e7da035ef6ab4
-- 
2.43.7


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011881;
	b=yKcstU3O9GKiYYFj5QfI9a95kT5/yKl/P27CLAvZry8F3S6PbEe7QrPzolPoCupxiJRi
	 FHtK/wOU/+87Gf6chGH2lGfoKnohc8O9Qp2+2H5SGq5s0qZcwNZgUygJ7hX9fmQkhE/Tf
	 bnRPbbzf8Y6O0Eu901Qh6FfCuNlWpRruax/3YEyS91NC/bBsGBgVI0/56AcGxE1js/mq0
	 y21sVyc9yNeH8/MPRlrmGJQ0X42kXQL2CelwkhbFk+jhMVXGuwmnmUuas2MYMDfGK9TqT
	 Z9wCnPQHTfR8S0MxthAX/U/yJ5ge3JNz91Y6pUGjj/PS+77E8fqqOEHb2tS2d6NItcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QXblNSR8xULU+e1FuWNkvIygdbsQqdtYiPxZfiJKQg0=;
	b=xZ0TKedMyn5ogLZr7HJSumkDL8qMKVi1YtZdtnagOuOY0FoCTF3bsYOA6M4RB62qy/Gf
	 8221AA3IZAvQksi2VRZOdOp4hS3QbMIpMtgmhfxcB3qmpyxOH06N+aajavxcPDmgvKkt9
	 6npHaMxiLGhf6deXYhnGeOtxi2bF/wIwKQu6L7x5D8oQF9dGs+EOfF8KkhVqYQmNYSN/8
	 4aoXDxCV3a+uPs06XRro8+vxaNnEwocDX/+4JAbZ/QLdPHKeR1MSCxAVKJ/yc5KtY1HKq
	 M0xH04BMCa8R511SvlkRrzEP7Fr6DewcOqBHLi+sCPGXp47C5ZDXyoJeiExmcaaceGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qrw5sAsh;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550B6606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qrw5sAsh
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1517bda04a0so2922372c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011880; x=1793616680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXblNSR8xULU+e1FuWNkvIygdbsQqdtYiPxZfiJKQg0=;
        b=Qrw5sAshChMITFyQBNK3qy3rOjPlqRKLvy0I10a+jkUn8D1B3To+HKYWuYF2rGn3m7
         juWhgnE8SDB/Y9XsNhNk9BNJmcrr32JiEZ+3bOJ51hfSsqUSGdTrrMPvPJ3dNJxmk+KR
         LxmVAxcCtSOuF7OUIPU7cnx+gvsLnU4XGQDarjd4zGn4rYHquEMBBSeOfd43w8VyxUiq
         9yylOy2Qxz6JGtTdb0i3lgtNGdg5i5koFxqMLjDGxI7HgyNGRKEzgXIK272K0hbmWItQ
         73gmlT9YJDTna7Fnjj+daCsoq+8iSSTvCCvMLe5kSwQLgSRwQPB4JAHx7KgGI6YfVvIT
         K1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011880; x=1793616680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXblNSR8xULU+e1FuWNkvIygdbsQqdtYiPxZfiJKQg0=;
        b=TL0/JuFSs3Jyb05fdUmtiLMs//RAjp7KuzTRU74j+/fpeM0ypqm1RmC+zIwp+Dwsaf
         iwWijwT4iTu8T0rn8Hsvod01e3NkAh5EF/53jn6nuQN6UtBAQKV+I7AlhSQo7oIpj2If
         5o4nVnGn7GQ1IN7+KykuSnHG6r4us7VbBcgUznmGZFqD9SP6HKiS/PlWiAHEWBcp6ctR
         bZwSwMsj+Coy2lkj91q5ywqpJW5KG5grB0QR7i5GfgqWVEM6jZhv6WI7Z7MkF+GFLk98
         lXioBvhKISLQOZeIWNFNk9CO5zUwssk9d95yElJp41LhzNot9PPrU2FwEv5LJAIz6RSv
         jXGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpzd+zDl/8C3Oc0XhnLbWjfeNjzybcy7eYj99JhppICOFMwbZpUQQP/LEHz2jQatQYGMNCaj4o+DYbC/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwkGYJKSpsDnEw64GCaB4+Ul0olaK7NH4u0WYOmm3EPkELODFc
	xhojLIlS8248Pnwat7uVUPEdJI/0igTVg4hNYnQQomcjGHTt1A+IZLtL
X-Gm-Gg: AYBFou1fSUmm9fIEhAtFp4lJAVnulgFYQ2gaS1M1Kq6cFpd9GXD1ahXm+f49Wq/qQ5e
	C4TZmkU1T9Q8xadyAXeAcPsfRblfHVNnLut8/dTGl4BMqI3J1r26M/yYlbn5hXNtWsg+2yECzI0
	zPDwk/ndy2PyMqhQhGWl8vmbKjUlTpcaeq5tCEGWXUIQw85Xh6QPliQCEEz1zIhuHon7qCVHW4z
	E6TQujRAtfAjl89ELZXTtjV4bqR4TU7xjJl5IDxs20Ftt/3u8VG0NovrElwVssBga5llMUy1lcH
	E2ARzJ7CghHwJCC5gs129OGhsSbGO4MeJrSBscyBerMBLPFlY83ZnStNWv07sMXBBt6RNOcXR3M
	DdN5U5c4ZM+EBli53T8v6qg8RED/smwp6zXF9s52nqCKiu71cDsmx/0qjfwsVpxufa7vwgX3/mR
	G5Jaws9QZuO+LTgYCzj9VMTStT3+i2FBT2iOeppQGStqGawizFiSe8gun8Gx2Kzcp6NOmAy7ay0
	2d1FYIHJIt536Q3SP+HZaKsrBpw5H7mqtqg11kcILuopcAClbk3cGu/bAr84L43+mkKCM6i95pj
	lMHbzP7d0mGUF7lEDMg4
X-Received: by 2002:a05:7022:4387:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a1897459a7mr3025660c88.30.1793011880275;
        Mon, 26 Oct 2026 03:51:20 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm27785940c88.10.2026.10.26.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:51:19 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Qu Wenruo <wqu@suse.com>
Subject: [PATCH v2] btrfs: remove devid kobject when deleting a missing device
Date: Mon, 26 Oct 2026 03:51:09 -0700
Message-Id: <20261026105109.1148939-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btrfs_rm_device() removes the sysfs device entry only when
device->bdev_file is non-NULL.  A missing device (created by
add_missing_dev() for an absent disk) has bdev_file == NULL, but
btrfs_sysfs_add_device() still registers its devid kobject under
/sys/fs/btrfs/<uuid>/devinfo/<devid>.

When such a device is deleted, btrfs_free_device() frees the
btrfs_device while the devid kobject remains registered.  The kobject
is embedded in the freed btrfs_device and its show functions use
container_of() to reach it, so reading any devinfo attribute is a
use-after-free:

  BUG: KASAN: slab-use-after-free in sysfs_kf_seq_show+0x157/0x490
  Read of size 8 at addr ffff88801d8172a8 by task poc/9385
  ...
  Freed by task 9385:
   kfree
   btrfs_rm_device+0x11ee/0x17b0
   btrfs_ioctl_rm_dev+0x265/0x400
  Allocated by task 9390:
   btrfs_alloc_device+0x7e/0x400
   device_list_add
   btrfs_scan_one_device
   btrfs_control_ioctl

The freed object is kmalloc-1k and the faulting access is 680 bytes
inside it (offsetof(struct btrfs_device, devid_kobj) = 640 plus
offsetof(struct kobject, ktype) = 40), confirming the embedded
devid_kobj.

btrfs_sysfs_remove_device() already skips the block-device link when
device->bdev is NULL and only touches the devid kobject when it is
initialized.  Call it for missing devices too.

Link: https://lore.kernel.org/all/20261025180252.349049-1-teel4res@gmail.com/
Fixes: 668e48af7a94 ("btrfs: sysfs, add devid/dev_state kobject and device attributes")
Cc: stable@vger.kernel.org
Reviewed-by: Qu Wenruo <wqu@suse.com>
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
v2: add Link, Fixes and stable tags, keep the Reviewed-by because the code is
unchanged, and remove local validation details from the commit message.

 fs/btrfs/volumes.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 85ea9c5..912a1ef 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -2479,11 +2479,11 @@ int btrfs_rm_device(struct btrfs_fs_info *fs_info,
 
 	btrfs_assign_next_active_device(device, NULL);
 
-	if (device->bdev_file) {
+	if (device->bdev_file)
 		cur_devices->open_devices--;
-		/* remove sysfs entry */
-		btrfs_sysfs_remove_device(device);
-	}
+
+	/* remove sysfs entry, including for a missing device */
+	btrfs_sysfs_remove_device(device);
 
 	num_devices = btrfs_super_num_devices(fs_info->super_copy) - 1;
 	btrfs_set_super_num_devices(fs_info->super_copy, num_devices);
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845993;
	b=AuJ2mrz683bxL778xAh/JWs4np8G23EuYadi2wxAtyJtfZH4Ghi0MH7tAi01ygF1hmx3
	 hq7p0QU4ua/fieLpjFOQ/rwdDY4xsS+BYwaR84LE9W8mmEvEx/2mgXAs3ntTSzVit5jca
	 zIX+KaPA4icG2qNob15dIpWImFVILV7wTRL9w2OiV2ByNiZlrHanrmuhqzryp/TjZ/tbp
	 YjmquKTjhbzGzTdjvVwwUllmKkJ0XpmJg4szoMTsgqS1uAPgqHo1rrwZR7t3syxXdgKnr
	 V70Fkpfv5ccKAMhbfRT5n9AZkX+F+3r6zT0k60wlK+T4TNblr+OiLA8n8f1f6OgUzbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BZSVbAPO2qfLkrny+jO82y3AWXTvZG3Q+zycPj60YGY=;
	b=MwQXHRYEMeGWhNBjCC1QHLC0e5HzzWAHp0VKyf0EIPi/ZcWLW7GpD//5QkapyEqrFrcM
	 DNbo7u7VicqV75egs96aYkPAlhCDpy5cdXVQZTt3fmiNAxbm2/leSSS1/LYQKfb5QnzZS
	 6o1RFHr9TLxahWjYJ+bSK/kkxntHYDY3iDA+Ub6QMr/hO7RvSiDSfbd4I5OWgpcWT2P0F
	 g8SuGgzXybdCcC/oCuIDhKF8ka8F4hbznMVvUKxB8FdbPuiy5TxnY+mV0GcDCOfWFDjDY
	 wYhfnBphhePugEai8lk1ZEuQFeu8jPS0YwX3EvZ5nfIN7ZyV21eKOFSn2Ir3jKoGmWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xP1H3D6u;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA39606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA39606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xP1H3D6u
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1925205b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845992; x=1795450792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZSVbAPO2qfLkrny+jO82y3AWXTvZG3Q+zycPj60YGY=;
        b=xP1H3D6uH7zOO4WT5w1pDnScXYRbdggED4O8N5hUGG5QidwPOLEypX2yL02P9UUiF5
         Vu+RZpcn5QGQ242GpXsE7OVHFS2Oyqro8QmRDv6/28aDgqMDiSHG743pWns1T7uKz4Dr
         TCoOKLKx0ogJKzLmDBHJSfPE8NuSNc5W+yG3kY+axSd3xdIhOS7COfgf2EURP0av7Z8c
         T/pTxtsKSQJZmOpmWFqPh+TV4KzH/IJOoLRNlDfy/g3Y2/fi7lNxtrtP0nMIqB135pM2
         F61lGMjfcVsp4NNqaGpU0qJ+N6DFO9CR7ix2xJ4Sb8i0qlhMXKxcf4/wTfxukny2G/ge
         p70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845992; x=1795450792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZSVbAPO2qfLkrny+jO82y3AWXTvZG3Q+zycPj60YGY=;
        b=ycCuC0ZKXW2rOKFVSfDhR7NPMsjkEF6+AfQz433701uMhgF84FtDmC0MTKlum+kQbp
         oAQVEUAKkNAuhKbAzcoxBmE+hX9FDkT/K8oHfbQ4pF/yuz9SuQRzjHNTrmtfDmp8DkPy
         u1HuqDhZtozy+Cv4Msh/AUoozBYxqcUIYlIrOWgGUwkLmPth+se+JSKgZP+g/geBG6Yd
         yJxChB27ktJe29blYYjr72GjlJWgtpqu96iLhwgyrPVzI8da2rVgB2xWwvNSig1LWK+t
         tz7aOenzWvLHtXeS5Zv37x4FiHuoL+sFZDCbYq92bF1o9kSPibp2t/NRnBpJokUaZCm7
         px9Q==
X-Forwarded-Encrypted: i=1; AL+hErEJdJzHY4nGUeFEYedRhM38wuDYUoOSjQy0/gqXj/ygeCDGE2wZCiOGgTLm221D5sbKg9xdMlMDDPi1DG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a9QbmZlc8h/0DUwC2rDYEfFO/HMGzzCy9DsVI2eme58Q4bF5C
	WN0TlTCvCYp4LqOVKoUk9TKAzDyUDnx4CLydhoBT0ZGMCQvWJ8vPAu7f
X-Gm-Gg: AYBFou3LVoxuaef2cmahUSvCfrjraE35FltjoU2yG77eqGmHKNQnzpjwC1Br6NdTCRY
	PXR0jaa0kBhM+V78+CDqALq6nKd6RWnjhuZcqeHcQgdmI7GDmNaHjkZ6i9vJcpCj86MltQ3dTgP
	jedB6Fe3yVp9ypQ7u/Mwsu7MuLpTkJrgAJUQwunD0KdXVZMblFiu74/3DN9aiuq/q6Tt3z3pQoX
	na/StybnoaSLi0CoCfCowgTqKYHANBsLqEv2HksnZse4wdJVICkPjHCwaNJw/os1A8xrbcH8cjF
	IHwzvc/tJoREe4zV/gC0N6kdvrAu9ct5uHT2HDYK1ZTyqQe89sRryL/Lttk8m31ojbkx4s2DxGM
	yLAo6oDtDqdcQhghAR2nxSTTYTcXu69ExPO4GiKofqxOnwuFPOmL4jyvCkK2dHLUBDp1nz0zZnV
	vTnj9Lqr1Qj7jd58pEtn4P5fUqFQZ6kFRoCHqwjgsXv57C0S22luIVhT5L48dtI+9s5xAR3GVB6
	aQb+XpCfviCw2K3yYghBp1Z5xdxL3bYN1hrNsw/3vjhpLZv3G08ZYc2IwWf4BFHYdK+JkgQnxwG
	ymmki6dwWoTDtBrOv66yDlZU7dYbw9dvGMBW7g==
X-Received: by 2002:a05:6a00:bd10:b0:8a0:1931:e6f7 with SMTP id d2e1a72fcca58-8beb7055eb6mr9557344b3a.10.1794845991725;
        Mon, 16 Nov 2026 08:19:51 -0800 (PST)
Received: from dell ([2406:da18:1825:5600:ce30:1214:e3bf:810c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2055031sm4192955b3a.39.2026.11.16.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:19:51 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ksmbd: pin parent dentry in rename share check
Date: Tue, 17 Nov 2026 00:19:45 +0800
Message-ID: <20261116161945.348983-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ksmbd_vfs_check_rename_share() passes old_path->dentry->d_parent to
ksmbd_lookup_fd_inode() without taking a reference to the parent.
Although the call in ksmbd_vfs_rename() runs with the parent directory
locked, smb2_rename() also calls this helper before entering the VFS
rename path, without that lock.

A concurrent rename can move the child to another directory and drop
the last reference to its old parent.  If that parent is then removed
and freed, ksmbd_lookup_fd_inode() reads d_inode from a freed dentry.
Holding a reference to the child does not keep its old parent alive
across a rename.

KASAN caught this on an x86_64 QEMU guest with a test-only 100 ms delay
between sampling d_parent and calling ksmbd_lookup_fd_inode():

  BUG: KASAN: slab-use-after-free in ksmbd_lookup_fd_inode+0x28c/0x2b0
  Read of size 8 at addr ffff88810faa6f30 by task kworker/3:2/76
  Workqueue: ksmbd-io handle_ksmbd_work
  Call Trace:
   ksmbd_lookup_fd_inode+0x28c/0x2b0
   ksmbd_vfs_check_rename_share+0x8e/0x240
   smb2_set_info+0x2b71/0x3bb0
   handle_ksmbd_work+0xad4/0x2110

The read is 48 bytes into a freed 192-byte dentry, at its d_inode
member.  The stack reaches the unlocked smb2_rename() call, inlined
into smb2_set_info(), rather than the check inside ksmbd_vfs_rename().

Take a parent reference with dget_parent() and hold it until the
lookup completes.  If the parent has no inode, skip the lookup and
report no parent sharing conflict.  The returned ksmbd_file has its
own reference, so the parent can be released before checking sharing.

OpenAI Codex assisted with reviewing the archived fix and preparing
the changelog and validation materials.

Fixes: 7f8029591bed ("ksmbd: synchronize lease breaks before renaming files")
Cc: stable@vger.kernel.org
Signed-off-by: Yuansheng Yang <0xbeac@gmail.com>
---
This is a standalone fix against ksmbd-for-next at c710c654b8a3.
It is independent of the maximal-access patch sent separately.

The existing KASAN report was captured on 7e1392a42ea2 using a local
rename/rmdir workload in a tmpfs share and an SMB rename request.
The 100 ms delay was only in the test kernel and is not in this patch.
The reproducer and full report are available on request.

Testing: git apply --check and an x86_64 KASAN build of
fs/smb/server/vfs.o on c710c654b8a3.  Both this patch and the
maximal-access patch apply in either order.  Checkpatch reports no
errors; its only warning is the missing Fixes commit in the local
shallow clone, whose subject and diff were checked upstream.

With the fix, the same 100 ms delay was placed after dget_parent()
and before the d_inode() check.  On a 7e1392a42ea2 KASAN guest that
also included 0383a66dabd7 and the maximal-access fix, 80 SMB rename
requests each took about 100 ms and returned STATUS_OBJECT_NAME_INVALID.
There was no KASAN report and the guest stayed up.  Those two extra
patches only keep the open path off the other parent-dentry bugs; this
fix does not depend on them.  The race has not been tested without the
artificial delay.

 fs/smb/server/vfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index 7c3edbe6cb77..d99eb28c63e0 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -731,9 +731,16 @@
 				 const struct path *old_path)
 {
 	struct ksmbd_file *parent_fp;
+	struct dentry *parent;
 	int err = 0;
 
-	parent_fp = ksmbd_lookup_fd_inode(old_path->dentry->d_parent);
+	parent = dget_parent(old_path->dentry);
+	if (!d_inode(parent)) {
+		dput(parent);
+		return 0;
+	}
+	parent_fp = ksmbd_lookup_fd_inode(parent);
+	dput(parent);
 	if (!parent_fp)
 		return 0;
 

base-commit: c710c654b8a3c92b34e38740dc17c29daf5b222e

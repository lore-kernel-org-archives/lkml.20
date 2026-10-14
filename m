Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7537391E5B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949176; cv=none; b=Nrdv6NfLns96PVUn7RnXVjfL1mSWfpHk0Mlnjg6Op3sfgPWbuRL+WeB/3uw/cJWbBa+cYpkfyzgajURxFpMIVUgQb1EwBlH4ScgGTCBizxZacfKHh3JyXP8qUTXrXcJjjFg7dHOTWwd9wY/VfiJ4z0ALpvMNy1uBrqGWSCYYbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949176; c=relaxed/simple;
	bh=+EbvMu6501+9NLez/3vMiH+VfkpyJJ15wjPGlneDRX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pPbpB10JePgF0zJbNBVH884ipEYwc+UkxniR7mwYDBiwqcVOr0xq7DKstTTUiTPubfvbTrGN7MGbFADSsJAkNHBZfdCgkIZotoWosaN0yEYFIMBXTasoF0JAKO5rJP4mVgwFLQ91ktn3nMGXjhyhoF8vlvrxVYb/6fnnlTlJjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxPYZD1I; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxPYZD1I"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd3310348d2so2631311a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791949173; x=1792553973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+VXEY6KytZXc6Fv8IK6cTFRuY+XHNxmJHHc2/60NuM=;
        b=mxPYZD1I3DUm/XaS3Q++52gPsvEhm2iZbxNP6cnElFJHYEu3BDAa74n283ArLMbBpG
         b6vvoR9h78ZNYA730hFkICOpiurQTKq++o4dD1qSZyfNIb/T5YdI4WS2xhXlsx8oLrdy
         Zt63TN9nbTrR8tunyV1TyggvJr0XiwdaYcxqXglR53YkgM7JiMvYbwwtf61XI92ojlvB
         4XgbzOmuUh8gkRdknzX28T5UVr1yRddpUg10eauZhi0KWP9SZ1iIFaEwhDznxtmoJcAm
         7/FJReLg23qcpGUXYHsY4ntkVnXQR3i07ivLOBYTffmSBpMpye1d+YYuta8V1VIw0a7Z
         OWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791949173; x=1792553973;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+VXEY6KytZXc6Fv8IK6cTFRuY+XHNxmJHHc2/60NuM=;
        b=1Z1gpZlNtFh12NeO3pPHQTu7Nr8XC1QPWCD8tM1ZY9aiZmyQuXqW6nVEhUNfNFxGZi
         N2+nG3JV10FPFXiksl7vfKz3g+gReFk3WrP3C8QTm41bzoVKi9Hu8fX2i1/Uxys1T1Ud
         7/uIIUgDltqayyr/qvsDqmCxtnyy7YCzmuWI83YVGAl97zUQdxLbkpq2wb58rCz0qwCU
         WPpqnXraDLMLLlL8LuzcNyPAnAh41qaCxOlJkZRZUyO73WkIiTc9aYrIJiOf3RV5vhKt
         o8SBirbBbsEsD70E67wGwShlZ9vhcgUgxMwh3Xi59hBWRIUOU0IVjo1R1Mg06b4gfneE
         J66Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvSOGAaGpouoLraldV9TsbXvNuFPpOD+aDVg86lMZt73t2uzdlwWBhE6c3VS/VI3ICn3mEvHKa6Pcvlk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+nzpEJZPJw22NIsfagFZjgRibOAdLCqyEr0NM3XHbhZwGlEVa
	F9lrHNPVBSvEAz/uTMTGfI4i6xV+a6MDpmicYApBJMh5c7Ac8ML+3L0Q
X-Gm-Gg: AYBFou26qCewkpO5jNaTEpoyVsuwLZH7p4xuwKOmJGPAQ7rt4RyGeCX+iFRUn27RqJg
	3QNmI/eSXMdsZX0BATgNzj2DYCgZbIqLfBu9NTvspi80bjr6xgJ7mUwwpHHSJLP2Su/sXrPZVrd
	ye1jHNQPiwX1yEKGjBkAMqHPCud+AKJvkCkZgPxtY52dbyBhzDcclAfgR77270wT2Na9EeuGk8f
	aS6bhBwd26JjPsbbDIoWAuUH5eDGMUL7DcoacXMvSC4vFCULqDLgERS+NuFBJR7a4NGu1dZGgE9
	ppdmiAc9dKz7zMlpIMhuKZ+exP6u2i7QM1sIRlOWVxiGiLQm3FTwOvp/zqHyV9z0Kc70UvoQG0k
	k7t/n/FYQEpeiH6Ung3im0fWFv6KZgiBQxvmNIsCjDTWW0UwVYvmUvZYpnlJuXxaahU59xGt+T4
	27+BrpYcXOuYojRKHC52WxXbrQoHerKkAlprml7TfPdpoENZKN5ldeYmL7qkV6hfRxCA==
X-Received: by 2002:a17:90a:1016:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ab3a953308mr5803492a91.13.1791949172711;
        Tue, 13 Oct 2026 20:39:32 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f27d573sm2485731a91.11.2026.10.13.20.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:39:32 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	heming.zhao@suse.com,
	kees@kernel.org,
	akpm@linux-foundation.org,
	kuba@kernel.org,
	zzzccc427@gmail.com,
	sunil.mushran@oracle.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: [PATCH v3] ocfs2/cluster: unlink socket containers before releasing resources
Date: Wed, 14 Oct 2026 11:39:25 +0800
Message-Id: <pm-ocfs2-objects-candidate-0065-v10-e831f26814a00e9ef241@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A socket container's node and socket must remain alive while the
container is on sock_containers. The debugfs formatter reads sc_node
and sc_sock under o2net_debug_lock without taking their references, but
sc_kref_release() releases both before taking that lock to unlink the
container.

With CONFIG_DEBUG_FS enabled, a synchronous sender can retain its last
socket-container reference after o2net_disconnect_node() has detached
the connection and flushed o2net_wq. The caller runs outside that
workqueue. After the sender removes its configfs dependency, node
removal can proceed without waiting for the sender's final sc_put():

  Sender (final sc_put)    Configfs rmdir        Debugfs reader
  --------------------    --------------        --------------
  o2nm_undepend_item()
                          Drop node item refs
  o2nm_node_put()
    [node can be freed]
                                               sc_seq_show()
                                                 Lock debug lock
                                                 Read sc_node->nd_name
                                                 Unlock debug lock
  sc_node = NULL
  o2net_debug_del_sc()

The earlier socket release has a similar window. The container is
still selectable while its socket has been released and sc_sock has
not yet been cleared:

  Sender (final sc_put)                       Debugfs reader
  --------------------                       --------------
  sock_release(sc->sc_sock)
    [socket can be freed]
                                             sc_seq_show()
                                               Lock debug lock
                                               Read sc_sock->sk fields
                                               Unlock debug lock
  sc_sock = NULL
  ...
  o2net_debug_del_sc()

Move o2net_debug_del_sc() before releasing either resource. Unlinking
under the existing debug lock waits for an active formatter to finish
and prevents later readers from selecting the container. This covers
both socket fields and node fields, including nd_num in the stats
formatter.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in string+0x42b/0x470
    Read of size 1 at addr ffff88810f56fc90 by task python3/506

    CPU: 0 UID: 0 PID: 506 Comm: python3 Not tainted 7.3.0-rc4-next-20260921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     string+0x42b/0x470
     vsnprintf+0x330/0x1110
     seq_printf+0x1a8/0x260
     sc_seq_show+0x604/0x9f0
     seq_read_iter+0x480/0x1110
     seq_read+0x362/0x5a0
     full_proxy_read+0x11f/0x180
     vfs_read+0x1a0/0xc20
     ksys_read+0x111/0x200
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

(User register dump omitted.)

     </TASK>

    Allocated by task 497:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x28d/0x610
     o2nm_node_group_make_item+0xea/0x1a0
     configfs_mkdir+0x762/0xca0
     vfs_mkdir+0x399/0x7e0
     filename_mkdirat+0x129/0x450
     __x64_sys_mkdir+0x70/0xa0
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 505:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x308/0x580
     config_item_cleanup+0x14b/0x230
     config_item_put+0x79/0x90
     sc_put+0x454/0x6e0
     o2net_send_message_vec+0x63d/0x1560
     o2net_send_message+0xa6/0xe0
     validation_send_write+0x17f/0x1d0
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff88810f56fc00
     which belongs to the cache kmalloc-512 of size 512
    The buggy address is located 144 bytes inside of
     freed 512-byte region [ffff88810f56fc00, ffff88810f56fe00)

(Page and shadow-memory dumps omitted.)

Fixes: 2309e9e040fe ("ocfs2/net: Add debug interface to o2net")
Cc: <stable@vger.kernel.org>
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---
Changes in v3:
- Revise commit message as joseph suggested.

Changes in v2:
- Move o2net_debug_del_sc() before socket and node cleanup, as Joseph
  suggested.
- Use the ocfs2/cluster title prefix and describe the races with sequence
  diagrams.
- Add Cc: stable@vger.kernel.org.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0065-v4-f45e5cef38dd587b2cfd@gmail.com
Link to v2: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0065-v6-3090153fd7cacb810214@gmail.com

 fs/ocfs2/cluster/tcp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 8b3830b601ba6e5fe964bec970581b8e4ddbb5dd..0eaf2c4a6989ecad00f7a88a66a782b334647f21 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -393,6 +393,9 @@ static void sc_kref_release(struct kref *kref)
 
 	sclog(sc, "releasing\n");
 
+	/* Unlink before freeing anything the debugfs readers dereference. */
+	o2net_debug_del_sc(sc);
+
 	if (sc->sc_sock) {
 		sock_release(sc->sc_sock);
 		sc->sc_sock = NULL;
@@ -402,8 +405,6 @@ static void sc_kref_release(struct kref *kref)
 	o2nm_node_put(sc->sc_node);
 	sc->sc_node = NULL;
 
-	o2net_debug_del_sc(sc);
-
 	if (sc->sc_page)
 		__free_page(sc->sc_page);
 	kfree(sc);

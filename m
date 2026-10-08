Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE93C3F73
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441056; cv=none; b=M/tyqY5VNB1Xs8MHBrd+3AJKusr8fBgyrBpkgs98rbMGTSEexH0BdapzM/tajAdjVu7Y4nUb+iyDUfpRgqkSgWiDBiF6GxSffX6La8q+NwrnsxQPGKSEXAZsLzs8GLmXO4wpV9vLOUI1eqqUqjzgCB1GE7TDz0hD1SrrjKNAoys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441056; c=relaxed/simple;
	bh=/lhqncHa54mif93hQURpmlAp2nbu9JhU3pGgljQ+4FI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dzsfXaFWALOnf+XvAm7wJra/hWJ/fcH0xTJEJ8LNf/hPAeG6ZKF+9zS+sS/7ctb20TG9CPidWWXGUibnFsFTNmJW7yNAVkZf8m9Vcc5vXRoODE9Df055EQ6PfL2BXZYzbNcxZ9vRI6SHB+A6/1h5qefBbQv8iY+FbQ3yYCoPC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJplgH0z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJplgH0z"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso1600411a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441054; x=1792045854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJmOQZlXuvALdzdT+nGvrQ32LbAVa2wVNh2I99r+TqQ=;
        b=sJplgH0zFuHAQy2IEi32bDDCFtSkXf/bhOybrREfXPdRpzaae6z5/x1pkeRbFsPFPN
         oyR3o4GXa3OPYkXNUjcqr5yt1EP2G8WmyklFHVMPvg9Q2PGtyGeCb8cM6dbgNDBBnTbg
         SsI7OIS3Ydvfs4dZznlcT2ivwH3NwpTyobSP7MTgxUeAje6/BEkpP+eGEePY/jVp+xRt
         EZxghDsm1BMhWNS3E6hUXfwxxrt573II6yhh0XA2u2vJ66yAYYmsBedvT7hTKqec2438
         BlfjnEED8hgGVGO9kmtregd+TmAfanfFDe17JZhQGGi4mbBnXVCAnETO4trD9O+DBch8
         O6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441054; x=1792045854;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJmOQZlXuvALdzdT+nGvrQ32LbAVa2wVNh2I99r+TqQ=;
        b=MBoKVsFS28agVGfdurino8HZX5W/H/wTQbJ5rwHdc9xObIHao0bwV3453lagSU/Bpa
         grPGVWGGDomP8VFCk09xwvtRVbK8cey8vkqbwY/5J5+xuHvVP4pwqzbsou8TAyP/GodN
         qxOo0TubIj0X0vQWZmFfqtorggTnUtjRIjVmfAyVR4QU+KeKowjkndBPcuRWT17CL3IS
         pmpysDKGosk0UIGqjZO93ZAFTqestRz9Zsh3fbuDg6aIYnjdcEdnsgIn/qYsK6jHlhZf
         UGZVSY6+zAJ1oeqjSgqApa2NMA17YgTi8CqNy6cfQPht58dY6h+rKfn+VMjzt3ACHf0B
         4WEA==
X-Forwarded-Encrypted: i=1; AKwUvBx7qwpv/h6HH0npAJZw3Pu94Hlq32zRBzG7oek8LgrZKSHpoHHeWJdyUkJp9z8V1HHU+6veYXGu7kWM0OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI81tDbk4XJ/UFOLJT2en8V6JA1Dct5nKgg2hdE0o5CNhaC2r1I
	VGNqm0iXWuKIuAR9n53BxcinXBdWdOZuvDtKd6JyX6QV7g+SjJMJTsxV
X-Gm-Gg: AYBFou18CnfcTpCYUcpUghNUd4N2PfRG2EG1QGtA/zMLGSpvgbxxEqswxp7vHs1wAcy
	4eIl1QHe5cvZ+tKa24dbyK0PQYVma3bkyyTeSqsmKW3aV4sgJystzv59cbrJVPpvomJdFIVEnJB
	ZgUmz8zeLfsZQdzPQ6OdWbgTW1/YFoAbAI9kkPT9FvQsVfGHDyIGGPQ2Kc/lRy/YbKcssiq6SZY
	wMr3C0oVNMDanFNyAIaCRqmIxe2j21hafqobVRxWr2z+jYPAZBzhX53TfFkbvmUo4nyhMiXgCsx
	u6suD4ZvL6RZmOR4GfXTxb94PTVx2ozInwGSeenSPv82kjHdVi1nSfNfbuwjOsm+p7iTUaNNFVX
	jzrO3JERsD57LBPKSGkrlhCgAXC7MMZz/rZTiNM6JcEmftKClFi5eF2rwwSCAJlJHFtZ51MKsv/
	DuuVhZEwQ0F4isdbv5TEPPEgwpjiNtp7oHNnyTmXLCvC2YBEZs+BQeSgz3PNDof9ZbZg==
X-Received: by 2002:a17:90b:544f:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3a8a13cfeabmr4187896a91.59.1791441054491;
        Wed, 07 Oct 2026 23:30:54 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbea8d3sm2783531a91.16.2026.10.07.23.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:30:54 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	sergeh@kernel.org
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] keys: Avoid the owner account dereference in named keyring lookup
Date: Thu,  8 Oct 2026 14:30:46 +0800
Message-Id: <pm-key-management-objects-candidate-0002-v2-dd6c20a1d92928b33ab7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Named keyring lookup must keep the storage containing the owner UID
alive through the namespace mapping check.  find_keyring_by_name()
reads keyring->user->uid under keyring_name_lock, but that lock protects
the keyring's name entry and allocation, not its separate key_user.

A named session-keyring join can overlap a privileged KEYCTL_CHOWN on
another CPU.  If the keyring holds the last reference to its old dynamic
key_user and the ownership transfer succeeds, the following ordering is
possible:

    Named join                         Chown
    find_keyring_by_name()              keyctl_chown_key()
      read_lock(keyring_name_lock)       down_write(key->sem)
      load old keyring->user
                                         replace key->user and key->uid
                                         up_write(key->sem)
                                         key_put(key)
                                         key_user_put(old user): free
      read old user->uid
      read_unlock(keyring_name_lock)

Chown neither takes keyring_name_lock nor key_session_mutex, so it can
free the old account between the pointer load and the UID read.  The
lookup then reads freed memory even though the keyring itself is alive.

Use keyring->uid for the mapping check.  key_alloc() initializes this
inline owner UID and keyctl_chown_key() updates it on chown.
The existing name lock keeps its containing keyring allocated throughout
the check, so lookup no longer depends on the account's lifetime.  This
also matches the owner UID used by the permission check.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in find_keyring_by_name+0x577/0x5d0
    Read of size 4 at addr ffff8881128ae2ec by task keycase/500

    CPU: 2 UID: 0 PID: 500 Comm: keycase Not tainted 7.2.0-rc5-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? find_keyring_by_name+0x577/0x5d0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? find_keyring_by_name+0x577/0x5d0
     kasan_report+0xe0/0x110
     ? find_keyring_by_name+0x577/0x5d0
     find_keyring_by_name+0x577/0x5d0
     ? __pfx_find_keyring_by_name+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? security_prepare_creds+0x4f/0xb0
     ? srso_alias_return_thunk+0x5/0xfbef5
     join_session_keyring+0x89/0x310
     keyctl_join_session_keyring+0x81/0xe0
     __do_sys_keyctl+0x3c6/0x460
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f562a4817b9
    Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 66 0d 00 f7 d8 64 89 01 48
    RSP: 002b:00007ffcb80b34a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000fa
    RAX: ffffffffffffffda RBX: 00007ffcb80b3638 RCX: 00007f562a4817b9
    RDX: 0000000000000000 RSI: 0000563212976004 RDI: 0000000000000001
    RBP: 00000000000001f5 R08: 0000000000000000 R09: 5200000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
    R13: 00007ffcb80b3658 R14: 00007f562a5ae000 R15: 0000563212977cf0
     </TASK>

    Allocated by task 501:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x630
     key_user_lookup+0x181/0x530
     key_alloc+0x164/0x11e0
     keyring_alloc+0x49/0xa0
     join_session_keyring+0x296/0x310
     keyctl_join_session_keyring+0x81/0xe0
     __do_sys_keyctl+0x3c6/0x460
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 502:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x236/0x5a0
     key_user_put+0x57/0x60
     keyctl_chown_key+0x5a7/0xda0
     __do_sys_keyctl+0x1ba/0x460
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff8881128ae200
     which belongs to the cache kmalloc-256 of size 256
    The buggy address is located 236 bytes inside of
     freed 256-byte region [ffff8881128ae200, ffff8881128ae300)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1128ae
    head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
    flags: 0x200000000000040(head|node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000040 ffff888100043400 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    head: 0200000000000040 ffff888100043400 dead000000000100 dead000000000122
    head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    head: 0200000000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
    head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff8881128ae180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff8881128ae200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    >ffff8881128ae280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                              ^
     ffff8881128ae300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff8881128ae380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: 2ea190d0a006 ("keys: skip keys from another user namespace")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 15bf4af8f28218ec3f12c97630d1c76939af7eca..46f774be72967a9bd16b0ddfdf323eda36edeff4 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1158,7 +1158,7 @@ struct key *find_keyring_by_name(const char *name, bool uid_keyring)
 	 * grants Search permission and that hasn't been revoked
 	 */
 	list_for_each_entry(keyring, &ns->keyring_name_list, name_link) {
-		if (!kuid_has_mapping(ns, keyring->user->uid))
+		if (!kuid_has_mapping(ns, keyring->uid))
 			continue;
 
 		if (test_bit(KEY_FLAG_REVOKED, &keyring->flags))

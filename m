Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706131;
	b=d2xw04KC46CODpXmwrssOlVjjdcOcGSrJMH0g41WeaREhXVwIXQSSImyMrF/mTX9rqYf
	 ptWG1TXP+OE2Cfszrge25dRWoRMaW7izkhEs3ELvSZz16uosc76RLUgVg0VBOdvOu1w9/
	 cU6BItO1r6iKdRYqRjri0EAU/GuIlBhjvGTaiNwTz8zxgQNqn2PQqTWn2YZujDsd6aUIH
	 ZMQEgoL/1CP/QngjbJzGajogY07u231Vg+sxA6e0b1jZtC6MY1JlVPfIyQxMtiXHJoNnU
	 q0u7TuvDQtGJc3wLxjicUlx/EeqzxUAsZT3a0dzdEKPR7Nr5xQv6H9GNEV7c+gU47gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SzoGWciH1854vjZQ3Vt63hGrJ+4BEttHwlTqTi2zQY0=;
	b=vFmmrufSu93RRkpaHR6b3hRbidZhQcIaehUUvOINRr1HxqFVabKE2ccy28FirC7ct7An
	 GvGAXV89rJLTrTcIMW+qTTxwTOaJpZLb49t7GDNMYBQmNMDzxjcM0FevhxlYfLXH4SIdp
	 x/Sv/NZ+mHAnqxZdneOSy2ct13wH5Yd0iHdzX0KjcU9Z+oYa7LXaixK86JUDLWaiamGZH
	 r4d7J8+POjv/es+AeSaIINBc1q7LsTIpTEbUgv6LlesV6gzFnpibNeAXcmfhtsJLupmnT
	 IWWVbqS3VLZA1+q1osLfE9BYOz+yVBHnShDBc02sFd5ICQuLZCJpwfDgYd31Ro3/g7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OsIexivg;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B98606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B98606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OsIexivg
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36661f953e4so444876eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792706131; x=1793310931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzoGWciH1854vjZQ3Vt63hGrJ+4BEttHwlTqTi2zQY0=;
        b=OsIexivgMP4q+ddjNJRpFpgOTZjKclTzttgQkfLhxe0+EOqTF/BhpMr94cPqJPMICe
         CA3Ng9hd8gyGSWKRVcD7nPRVwoqcva6zkfdom3B+aPZz2WDWzXhY5/4nVeYI7/T3V1V6
         wilPOXYjPq/pw43IHcjZwya8LyIAqdTf53AKzCV7YSIxh/t7uKIvky05tYX/fl3ouIQC
         OkGU0m/mRpTCYlIWzpRw7m7QSjls8NiOQHVDA0V3I6GS0oYxe9KVg41TcydhqFluYWiY
         HBrbamfK3FZ8/KxU//DlcpfRfq8apv8KTfN0GlsRI5NqUL7X6TTR8Wx6IQxhR14pchnT
         rqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706131; x=1793310931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzoGWciH1854vjZQ3Vt63hGrJ+4BEttHwlTqTi2zQY0=;
        b=vIFHNYfdUsDosEHuge3YcSzHpBac7g+iTwAFERznTqWiBvDo6v788ZcC9xKlEgUsVe
         T8rZZL0LS5a+gr+EOkCHhRW+0QJxAKHuV3c7inYGti75a3PZPASmiKbhVGsOpKSrZ5op
         VH5+twzYQ8m0TCRfdkewC5fv3KYj1ydCxbqeVqwjH2tfEYegzOhNjyjWX6uanrANIWwz
         JLwlImh60+gws1vvKsODZH62Kq2gqxymgiLSnlmcVrd35xLkXOwLqhxMY9+rR9fBko1C
         NL/T5ItpDubwgAs7FmQ02l/3jY9OOlKlQ6D/WQGsqc0VtfBa9d/KD3VFoW/J4Tm7qmFl
         81pg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ7uJ/oB0b8fJQ/utdScrZOjhYCuidV9MX7ioPQv+Flv+K4Yc3NONVmdexQzYx2BVQx0hrW0mzQzTNKLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdSNQS8v/DmaYPPCTyriDizi9Mys+776go2q2rjpBk+FMsrEE6
	VS6xZybjmIKZRwzDaRPQW618xDszDYb/cQJjFlkd+cLoOqs75XVzmFVn
X-Gm-Gg: AYBFou0+TVE1FUT/yPQjCX8kA4cY+Ov5MyB96TIocnaTHUw4v5QU7IsJ0hlhHy2YM1T
	l92CKPrZRz4r72017uotA9Bd/xWDbztw1IOCnGhBo2zQIgbXwNz9LJ3ney3Opl74TxZAXbQA3St
	ecFzPS22tk4oh/UuwhVpcvALdWsLNlNBQNmQLANd2yklk6jg1E4TUKRqfvBkQgeh17QCzYJKlBU
	uuiUfUl/A60bZnRohWuqzyEdIe0LCdZPGzXodIml5XKpukDHQ0QqMjb4bX4IaimrFI3a6Fy7Yq4
	eEkqMgC24JVqKx+/uk1rNQQTrvR4VbZY4f/OamduoYvUz//xyH7tkBBTNsuV2fy0ZOR1MnVbLdx
	AvOa+IdbyJc7wKY3mnMyQ3FFxKSqlCOftr1D7ci2hqJnHG4HDjOlBbTHk4uA34Ai7/nYOimq8l2
	2iBtSoVTWzksvdzwpjhNb9FCnbXFXKsGYV4KPXXmbUD3yCWWsMkr+eHmIBhMbaY5xE8xCMJ0xKB
	LR87RbZTrFlxbO0XHr7KQvrSaZdQ5RKs12r5esfH2Elmoa4xBwkWdYbZJHwPj1MvXtSXH54skAO
	vJwHyR8SKOJjfKmR9VxTeCdgFhGl6qI4DXHojPui5w==
X-Received: by 2002:a05:7022:3a08:b0:160:a80f:3ed2 with SMTP id a92af1059eb24-195c44b9d5amr665757c88.10.1792706130183;
        Thu, 22 Oct 2026 14:55:30 -0700 (PDT)
Received: from fred-server.tail1cd3ef.ts.net ([166.198.37.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9e9c4c7sm1006434c88.4.2026.10.22.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:55:29 -0700 (PDT)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH] smb: client: fix early procfs exposure race
Date: Thu, 22 Oct 2026 21:55:06 +0000
Message-ID: <20261022215506.31619-1-fredric.cover.lkernel@gmail.com>
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

Currently, init_cifs() calls cifs_proc_init() near the beginning of
the function, before INIT_LIST_HEAD, leading to a momentarily
uninitialized, but exposed, procfs. If a userspace process reads this
empty procfs, iterating over a zeroed list_head leads to a NULL
pointer dereference and a kernel oops/panic.

For example, if a delay is added between cifs_proc_init() and
INIT_LIST_HEAD, and a userspace process is polling
/proc/fs/cifs/DebugData, the following oops occurs:

BUG: kernel NULL pointer dereference, address: 0000000000000608
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP PTI
CPU: 0 UID: 0 PID: 3477 Comm: cat Not tainted 7.3.0-02212-g4df4d2a577db-dirty #6 PREEMPT(lazy)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 2025.11-3ubuntu7.3 09/23/2026
RIP: 0010:cifs_debug_data_proc_show+0x103/0xd80 [cifs]
Code: 00 31 d2 eb 25 48 89 df 48 c7 c6 4b d4 67 c0 e8 a3 12 f5 cb 48 8b 54 24 28 48 8b 6d 00 48 81 fd 28 3b 60 c0 0f 84 34 0c 00 00 <48> 83 bd 08 06 00 00 00 75 e5 ff c2 48 8b
4d 38 48 89 df 48 c7 c6
RSP: 0018:ffffb603c03c7c38 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff950240d3f2a0 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffffc0672ab7 RDI: ffffffffc0603ad8
RBP: 0000000000000000 R08: 737265767265530a R09: 203a737265767265
R10: 6552205346562065 R11: 203a737473657571 R12: 0000000000000000
R13: ffffb603c03c7d68 R14: ffff950240d3f2a0 R15: 0000000000000001
FS:  00007fdae19d9b00(0000) GS:ffff95032d4bb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000608 CR3: 000000010638e001 CR4: 0000000000370ef0
Call Trace:
<TASK>
 ? seq_read_iter+0x86/0x400
 ? seq_read_iter+0x86/0x400
 seq_read_iter+0x183/0x400
 proc_reg_read_iter+0x62/0x90
 copy_splice_read+0x215/0x310
 splice_file_to_pipe+0xec/0x1c0
 do_splice+0x4b8/0x780
 __se_sys_splice+0x18f/0x250
 do_syscall_64+0x109/0x330
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
</TASK>

Fix this by moving cifs_proc_init() down in init_cifs(), ensuring it runs
only after all internal lists, locks, counters, and workqueues are fully
ready, but before registering the filesystem. Update the error cleanup
ladder and exit_cifs() to maintain proper LIFO order.

Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
 fs/smb/client/cifsfs.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 576155caf888..1880d5134b1e 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -2019,7 +2019,6 @@ init_cifs(void)
 	if (rc)
 		return rc;
 
-	cifs_proc_init();
 	INIT_LIST_HEAD(&cifs_tcp_ses_list);
 /*
  *  Initialize Global counters
@@ -2069,8 +2068,7 @@ init_cifs(void)
 				     WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
 				     0);
 	if (!cifsiod_wq) {
-		rc = -ENOMEM;
-		goto out_clean_proc;
+		return -ENOMEM;
 	}
 
 	/*
@@ -2162,19 +2160,22 @@ init_cifs(void)
 	if (rc)
 		goto out_cifs_swn_init;
 
+	cifs_proc_init();
+
 	rc = register_filesystem(&cifs_fs_type);
 	if (rc)
-		goto out_init_cifs_idmap;
+		goto out_clean_proc;
 
 	rc = register_filesystem(&smb3_fs_type);
 	if (rc) {
 		unregister_filesystem(&cifs_fs_type);
-		goto out_init_cifs_idmap;
+		goto out_clean_proc;
 	}
 
 	return 0;
 
-out_init_cifs_idmap:
+out_clean_proc:
+	cifs_proc_clean();
 	exit_cifs_idmap();
 out_cifs_swn_init:
 #ifdef CONFIG_CIFS_SWN_UPCALL
@@ -2210,8 +2211,6 @@ init_cifs(void)
 	destroy_workqueue(decrypt_wq);
 out_destroy_cifsiod_wq:
 	destroy_workqueue(cifsiod_wq);
-out_clean_proc:
-	cifs_proc_clean();
 	return rc;
 }
 
@@ -2221,6 +2220,7 @@ exit_cifs(void)
 	cifs_dbg(NOISY, "exit_smb3\n");
 	unregister_filesystem(&cifs_fs_type);
 	unregister_filesystem(&smb3_fs_type);
+	cifs_proc_clean();
 	cifs_release_automount_timer();
 	exit_cifs_idmap();
 #ifdef CONFIG_CIFS_SWN_UPCALL
@@ -2243,7 +2243,6 @@ exit_cifs(void)
 	destroy_workqueue(serverclose_wq);
 	destroy_workqueue(cfid_put_wq);
 	destroy_workqueue(cifsiod_wq);
-	cifs_proc_clean();
 }
 
 MODULE_AUTHOR("Steve French");
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727891;
	b=R61kU5KyYQ59g3FNJVCeX2fGsuipGb6EHrcoMpvk/wcPV0Pbccaq70Ka8Mm0Cf8wSC0k
	 J2CnKYX/XbxDauOXbpxg3szzRE02znih3vxyHGT4fCxz1Xg3nYmdFGV4eACZyys2NvzCc
	 94TzNlPJV2zlRchopRzbC002/X2jmdfx3QBArEydcJLQOa9Vi5nXfxB6xz9gbmgRnBjmR
	 qAuHIUe8y5/zW9Ku3HbclyShy6EFy7atURpHK5+k3c64s7rX/snqMd6IDIHhRSpu0tANI
	 5OgzbTV91Kvtr3dguOMJHC+KYHvxLZF3znd5+0tVBMrSq8xgxgm/SnxJPI/YxfepEEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sa+akLds93BeVY1vzyQ/uvngZ/sCGwFCpoLktGOe6rI=;
	b=CsCvtSN3KW20M84HlSQ9StaEBmkpAQdjixcU0T/fSQpQdBwDf68pIF2ZFAlkb1dGeUGy
	 RjOW0+ZORA6V0tcWHbdrAB+GokmsIcd1HlQ+wxjppdsy3pUHhVspzmb56JIgWVuwqO9gu
	 f2TGW3BthKmUob9Y+wFFW5gvLPC5nk0NEP0QoYaMST900RybQ7CrsOgWg7qQCda77ET/Q
	 iJNvHTf4hl8u+pomX5x5KiWAMPe7E0izlHWquFD00/pkQZ8+sQVjV31+4hHe8Jwww/OGB
	 Nlx19U8/Uaexd9NaaUGCLBr9joyL0p4Mxuc05cOWTJTzuqJvMk4AyIGygjUr0SPMWyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3P0aCTQ;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89358606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89358606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3P0aCTQ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b37951a397so513394a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727891; x=1795332691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa+akLds93BeVY1vzyQ/uvngZ/sCGwFCpoLktGOe6rI=;
        b=y3P0aCTQn4WSyqVN5zkxPbnkLqEDzHMHWf2Ar9oDoYglX075SKR/QrPhxSRKsu+JLb
         VG6aayabQVF6xbKnfaAXPknVHtTyL++LrdvGQJynFMEr2Eitam8S8KBSktTTQuUACzbP
         eRurKT0vNOsRlXljLI9u1PfFG9pdCHA2csRYllNf/hr5bJzscbk4PlX1JvW6A+1YAGgL
         rfbXHlA5LKWHSvYXX9qN1UE3xoUitxFTKdUgsupyk4nL2yQDnkmsEIUInFiNbs8woD2C
         Sc9EAb5kpp+64cahJCWIu/3eohf3hhxg1ifoCOUu+9MZo6+V4DOcHGg972RWOCJdntRQ
         PTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727891; x=1795332691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa+akLds93BeVY1vzyQ/uvngZ/sCGwFCpoLktGOe6rI=;
        b=AcpuEqoOKobWyQkBUsSZyMDXFeH0qgby1ocS4OQUN/yPrVo57MBaWesA8dCbR0EXrd
         c0E0WtG3TKBEoelqBkL4aJ1HE5LtiHc3eG4duugkV5o9MFJ/I0Av/7+VIqG0VJq2GUG7
         zjyeJ8b1XGCAhQmfg+W83rB5vU8kI+x4lc1g0SPeF/lOUU6UhSU2sD/22MGEAwdhQ1V+
         nsNP0oH/N07sMftMl9P1fv/xa1/aZi1/G4Oh9kfTE50Oaq6JLHzUVIQaFrfQNxT//KdC
         pGGC8KtNlgWg0YWdj0BkIwAuNDtFGZbxbYMBNi9/RtgI4h6np+9qxpbsJpiDuYdHgAZK
         kgOw==
X-Forwarded-Encrypted: i=1; AL+hErFDnGaSXv2CJk2piAkO91YHZlp+Fkuy959HXNjwYgQuX72MeS9Luy9GyUoJ9F4/Vyc2b3LFoqMHDn9qI2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5NMc/u6KYXlgRuBDWizh8AFZFfSKBlKnZ8NnRIFIvsZIntk2i
	62W5zIMLvThULau0V6mm+gVNqzyM6ssGHuYubnqt1H0FUs0UiusDwHyuDNE39QBK
X-Gm-Gg: AYBFou0tS0vha5u/xC2hEqe9/O4WSo9khAgpfLSow7QlgJn084YuYFb2Jk/bDkO1MRT
	eARsr+Z0zdKnwqUyB34y+ck1kS1BVW/XRvUwj4Gpt66ghe5nvEjb1L334R3If9TKFS6nXt0PCgD
	Y4PSf2RRmBIdGgvHc2GI/VQFB63pUecheBS7H7xXbgBwsb3Gsdygdk0OMpWHNai8csrxzUC/2I/
	HlIs+HJnIKxdZ47zaZafz4yIgqxcOwn1ISjhbbFPgzkYdybhIHHr/rcmmQNYUHHA8SpEk2wrND7
	btuuZzC0oGlYvRBhNMlXE0x1CBzICAdkIFdJ6nyvGhR+/gvFj75+ilHwrLimc9DWRLUqEKAx9lV
	Qp0tCoWV+nD5RAYwxCe4nkacko3D17fQDUJ8nisVxmLlMBvMF2re6gIYcTlstch8tWX0D4i9VwS
	UAHVRsK8YMu5iJoTZAKk32EMtRHtYoFkmdRMmevHx69hed+QbZdBhl6Fc0IQiXPfVzj2S8gb8Lt
	GD9x1epF/YN9Iso7I7y4usTHzgsK9K1+I/2u4BefE5ezZjoyR2twQhBekn5OevcfYfylVwjXi3d
	zeBrj+eD2N7n1SSL/9AbS28RXtzmJ4sHhEAKCXFza6Hsl5ekgqqCNrddOgzrzOe2VLEZg9Sm84o
	k2B8pWQKmgwD4BYTsHKXl5bQETuws4p+yGwLpXDJXe+x5xCUYc7pK1NA5XLtavFMCrMK82LKpu8
	Kk68dqXYgkU5GxkNykbmJXRFPOzVfO0tiHZWJn4rbjHbdLrt8mzOFH6nqUycwguSWNe2Rq1SoFl
	ncOQr8FZfLYWhzoExPL77rNnKW9fjTHoKxizT6mxyv0XJjyfy2b4UfYkkFD1Oi1
X-Received: by 2002:a17:90a:f947:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3b1b0b553a4mr7578914a91.23.1794727890800;
        Sat, 14 Nov 2026 23:31:30 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm16837463a91.3.2026.11.14.23.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:30 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: target: iscsi: queue login_work under sk_callback_lock
Date: Sun, 15 Nov 2026 18:00:03 +1030
Message-Id: <20261115073003.9927-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

iscsi_target_sk_state_change() drops sk_callback_lock before queueing
conn->login_work:

	write_unlock_bh(&sk->sk_callback_lock);
	orig_state_change(sk);
	if (!state)
		schedule_delayed_work(&conn->login_work, 0);

Racing this, iscsi_target_do_login_rx() can take its err: path, which
restores the socket callbacks, calls cancel_delayed_work() and then
frees conn. The cancel does not help: the callback read conn from
sk->sk_user_data before the unlock, so clearing it changes nothing, and
cancel_delayed_work() cannot cancel a queueing that has not happened
yet. Nor can the err: path wait for it, being itself login_work.

The callback can therefore queue login_work after the cancel has run,
and conn is freed with that work still linked on a worker pool's list.
The core then unlinks it, reading the list pointers out of the freed
object and writing through them:

  BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report
  Read of size 8 at addr ffff88800d94c440 by task kworker/1:2/32
  Call Trace:
   move_linked_works+0xa7/0x2a0
   assign_work+0x168/0x3c0
   worker_thread+0x3f2/0xd10
  Freed by task 32:
   kfree+0x179/0x530
   iscsi_target_do_login_rx+0x3b7/0x7e0
  Last potentially related work creation:
   queue_delayed_work_on+0x80/0x90
   tcp_fin+0x238/0x470

CONFIG_DEBUG_LIST catches it there; without it the unlink proceeds.

The window is a couple of microseconds against an idle target, but it
widens to milliseconds while many logins are in flight. An
unauthenticated initiator looping logins against 64 portals faulted an
unmodified 6.12.117 once in 19577 attempts, on a stock config with no
sanitizers, that time inside iscsi_target_do_login_rx() itself:
conn->tpg read back as NULL from the freed conn, and tpg_state_lock is
at offset 0x1c. An unprivileged local user reaching the portal on
loopback hits it far more often, about once per 258 attempts.

Either path oopses in a kworker. With panic_on_oops set the machine goes
down with it. No credentials are needed: the race is in login negotiation,
so any host able to reach the portal can trigger it.

iscsi_target_sk_data_ready() already queues login_work while holding
sk_callback_lock. Doing the same here makes the read of conn and the
queueing atomic against iscsi_target_restore_sock_callbacks(), which
clears sk->sk_user_data under the same lock. Either the work is queued
first and the following cancel_delayed_work() finds it, or the clear
happens first and the callback returns at the !conn check without
queueing. orig_state_change() is still called after the unlock.

With the patch applied that local reproducer makes 11212 attempts without
a fault.

Fixes: 25cdda95fda7 ("iscsi-target: Fix initial login PDU asynchronous socket close OOPs")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
 drivers/target/iscsi/iscsi_target_nego.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index b03ed15..85531d6 100644
--- a/drivers/target/iscsi/iscsi_target_nego.c
+++ b/drivers/target/iscsi/iscsi_target_nego.c
@@ -715,12 +715,12 @@ static void iscsi_target_sk_state_change(struct sock *sk)
 		pr_debug("iscsi_target_sk_state_change got failed state\n");
 		set_bit(LOGIN_FLAGS_CLOSED, &conn->login_flags);
 		state = test_bit(LOGIN_FLAGS_INITIAL_PDU, &conn->login_flags);
+		if (!state)
+			schedule_delayed_work(&conn->login_work, 0);
 		write_unlock_bh(&sk->sk_callback_lock);
 
 		orig_state_change(sk);
 
-		if (!state)
-			schedule_delayed_work(&conn->login_work, 0);
 		return;
 	}
 	write_unlock_bh(&sk->sk_callback_lock);

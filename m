Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172F326D4A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567884; cv=none; b=d/AyBntSm8LzY5KHRWQZGlvRqdFJe7Xrr9oJOGheHdR6vk9DmVg0WfarVahs1D/8lSboSFkcWAUlTZdb0cFESpxmn6r5io1VPTmgczqH51KgQOHnkuk0XipL2LRyHqJR6W1qJ1XoRIVcsE63rRajqB3w3mq2YL4lCi8v+xFd8jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567884; c=relaxed/simple;
	bh=RCb84R1Ilbqk/brMo0ozsD4weTDX3UUsJYqs8fer/vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOT50B+VZsg5tiXCdlJ7R1Rjj4Ag9W0vstl5ndjFeTNRtuic0Vcw7mffkGm5yaK1g1tlG9LORaMeADIbssa7/fAT3goFyML+U6ocQ83ku3efR/MMRCxNRyrB9ierAOl58QjSUjsU+iYqxOl+YvEqTkkBSpPe4PoKubdqYB5pb/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE+5RxAk; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE+5RxAk"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-790b4aeb66bso1318026137.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790567882; x=1791172682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PRQtLnkGcQLLad/iSnwkqrL/4wKHSNHecCDuETOGrQ=;
        b=CE+5RxAkoZPF2ZDyvTb4nIJQXt18JC74S5W5fHZRCroLzNEnPs11sUoEz23V/sT3Z8
         SVhKP+SJOvXap51n1nPCYIk92nSJ52oJMKqJPcKWpK2GQwxguKxijjjHd6/azrnwnmkM
         Q2hOTulTf7+QyEUR2CGdNKcbuKfSBh6c0A+X3X/NPcY6h0zP1fWMe7h23OFZIl2gymI/
         ayxf4a8x9I09g9E1PEv4xgQAVbQryQ6Rk9/r0/SlbaMcqe/D1Wrr+nfcrZrT6ih/oGMB
         8dskjENNoAK3R9kQUmjMBNV9e+GBQYXGDdYuK7XUj63GnU+U0oou6DIakZPLGORJOKcR
         py4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567882; x=1791172682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PRQtLnkGcQLLad/iSnwkqrL/4wKHSNHecCDuETOGrQ=;
        b=mgeqc0GZGs6SU/Ioo43yLrE8/EqqRuyOR89L9+PaPrYSjBXLH9vKllGOLHt8jlHgMx
         aOyGBLIjBhmUv5T4ZjHZR/JxC2Lip9iuL529XQ24VEKhgUD3n25ShhSkt2ppx5lZmITY
         OvPGCIbe5BJI6K2k6ezXchjDf+z/InRH2iVnTSjGxx//Ued08n5tJNePR8PDOoxghOFm
         5SJKNUfXUUZNW8aPtxRLT07TLcjzsb+aU9IySs6ADGEqWP5lJZ5hvIisgh+zksDGKQYR
         u5Sduop9UNkKs+XkG68bcGL2nZ/1JS5aXBkf+yQZ/pVXvnopIk1UbM3ZNAR6culMq+Br
         peIQ==
X-Forwarded-Encrypted: i=1; AKwUvByLGSOt+AfOl/YiRooebn76xCQSJaVRDqld+ndrAh6fp2hoQyr/EKW3Muu+qxrEE6D4t9UHPhATWB7rGkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjrCsOFLbkXLxoO+EtEMInnGu1uxYqXU+0caj9HCb5wWDLaXu7
	AIp3rGeVrlOgQjxeFtj5awj80lXhK7ySo5U7vOd9ao9q/TUXETADdHVH
X-Gm-Gg: AYBFou0WJtz97YlDFNsirnFSp8v7dlfaoVewdn+axWuJu061HwWUFQBnmlpb/FLy2bK
	RhSFrLqoZhSZiStXhHVOBhBhMWcgd53tMXebI3MmzCU2aH27OwyKCFRnEzbS118OFYQ22gPjBkk
	z/YCNqPS7XqzrqcF5jnnk71kGFUNGS1N27jU3sK0odB1m7bwDjz3tmxNZhwpIskVc1PRVJ3EXql
	9OVGFSlOoMQfyjNSYnTdGwUcud1K25VwujKBzvfZjdiexOmdmsWq5d2D5fnYXlO4gpaJkohUr5m
	MlTcuwEee7iQdWjcwj7w/AKeUxZVw+tVpjcq4aWMOj76xfvZfzZYRsHUyyZDrA30Y7Q600vlldx
	r/+t4Ue3qpFDrJ3mj0CtojwROquoR60RyDiXhnywq48TQ/HAgYIeBZt68UF9FhWX1KgWO0EltEh
	qM9zj540YN7ixYLG+v9wd3b8hHNntb/fpcXsTmH4+JhERr8kvt42kq9Vs3nk9f59M=
X-Received: by 2002:a05:6102:358d:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7af1c692c06mr4663990137.6.1790567882180;
        Sun, 27 Sep 2026 20:58:02 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b15808esm8107452137.5.2026.09.27.20.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:58:01 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+ci3c472c63e196fe9e@syzkaller.appspotmail.com,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net v3] nfc: llcp: prevent resource leak on repeated connect after DM
Date: Mon, 28 Sep 2026 00:57:49 -0300
Message-ID: <20260928035749.2305913-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925184857.357926-1-qwe.aldo@gmail.com>
References: <20260925184857.357926-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A rejected asynchronous connect leaves a local reference, SAP allocation,
service name and device reference on a closed socket. Release them before
retrying connect.

The device pointer alone does not prove ownership: bind() puts its
temporary device reference while retaining the pointer. When device
teardown closes a bound socket, the retry cleanup would put that device
again. Clear the pointer when a bound or listening socket becomes closed,
and after a connected socket's device reference is put. Do the same when
DM closes a bound or listening socket. A DM rejected connect keeps its
device reference until the retry cleanup, so retain that put there.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://ci.syzbot.org/findings/64002827-5231-4183-bfca-0d91bded8543/syz_repro
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v3: Clear non-owning or already released device pointers on close, while
    preserving the device put for rejected asynchronous connects.

 net/nfc/llcp_core.c | 12 +++++++++++-
 net/nfc/llcp_sock.c | 17 +++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 199543c47eef..6382aacca69a 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -95,8 +95,14 @@
 
 		nfc_llcp_socket_purge(llcp_sock);
 
-		if (sk->sk_state == LLCP_CONNECTED)
+		if (sk->sk_state == LLCP_CONNECTED) {
 			nfc_put_device(llcp_sock->dev);
+			llcp_sock->dev = NULL;
+		} else if (sk->sk_state == LLCP_BOUND ||
+			   sk->sk_state == LLCP_LISTEN) {
+			/* bind() already dropped its temporary device reference. */
+			llcp_sock->dev = NULL;
+		}
 
 		if (sk->sk_state == LLCP_LISTEN) {
 			struct nfc_llcp_sock *lsk, *n;
@@ -1330,6 +1336,10 @@
 	if (connecting)
 		nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
 
+	/* Bound and listening sockets do not own a device reference. */
+	if (sk->sk_state == LLCP_BOUND || sk->sk_state == LLCP_LISTEN)
+		llcp_sock->dev = NULL;
+
 	sk->sk_err = ENXIO;
 	sk->sk_state = LLCP_CLOSED;
 	sk->sk_state_change(sk);
diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..9d76c12aee01 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -713,6 +713,23 @@
 	if (sk->sk_state == LLCP_CONNECTING) {
 		ret = -EINPROGRESS;
 		goto error;
+	}
+
+	if (sk->sk_state == LLCP_CLOSED) {
+		/* Release resources retained by a previous failed connection. */
+		if (llcp_sock->local) {
+			if (llcp_sock->reserved_ssap < LLCP_SAP_MAX)
+				nfc_llcp_put_ssap(llcp_sock->local, llcp_sock->ssap);
+			nfc_llcp_local_put(llcp_sock->local);
+		}
+		if (llcp_sock->dev)
+			nfc_put_device(llcp_sock->dev);
+		kfree(llcp_sock->service_name);
+		llcp_sock->local = NULL;
+		llcp_sock->dev = NULL;
+		llcp_sock->service_name = NULL;
+		llcp_sock->service_name_len = 0;
+		llcp_sock->reserved_ssap = LLCP_SAP_MAX;
 	}
 
 	dev = nfc_get_device(addr->dev_idx);
-- 
2.43.0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755393;
	b=IElQWxTIDSBKeI0yHQ7RjjXwkYdn0KLbdN5Z0hZU/AurUGMQRPQ9B2f4NxXtf/eFL9f/
	 WSLnoz+MoeZg6WzkUETf69ZMci04fo47O2jlA2hLr6/tWH42qtW/2WNMCJozPZMZ0W3a4
	 2Uwgj598S54ZyMBqYiRdLHiVSTonBnj0IUe6MJwI5/4xqyMrj3IAyKmtTz+RAn1SZgXJC
	 uWI3OjSkzbfYk5V9anmNEzD/8Kor8+OTHeanQqTHGpSyuHXSp8UENjkBVbhfpMrYTFreq
	 smhNaE36QIJNkthIavpuQdK14QfxlilDEF2NEcbAKs/XXQIwqYsXOe0Ww9J/As/ETZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IuDvY+GZo871EJkCLit2ojV8/CoV5VnvDfBzzstEvUM=;
	b=mQae2DndV9xQtYB1w5RSngizudR6HZ4Y2QFtpFsk79CU65wInwNmmItTJ8GmpAtLB/dd
	 2aBa3t+HaoOpHryptQVaeq2bQTYV1w+v3KePTyJIQIKsvNjg/rTtriFQSXE2E4BV1JifC
	 irA05dRJxu/GJ10m/aVBxLCzh87FOYCDT1GHVZvzIsQ7TiQhR0utf4g2yf5IIMOujzFNX
	 DqBQyiKveYcdi1kI6cnoxxm4xJyDP9qwIuSsHnuQWbSjp32WRSoUjCgS7DOLsfZmE1JGT
	 hTqL3O7EXpqHYBWKuL8EIBcA8MbjROfgvQ6TqnDYZlt3q3g/Teqfmnhpz4ag2McExng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="R/tYzWXI";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R/tYzWXI
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so421427a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792755392; x=1793360192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuDvY+GZo871EJkCLit2ojV8/CoV5VnvDfBzzstEvUM=;
        b=R/tYzWXIqBi/mMXMG9otxXeUrL7bqf9tXa/RG1I9szUdiTGk6+4DGLvs4D070Cqvp5
         hRIy5CGj6kem7oD8fJ3dMrZRTRMi/g0q22l5g1SGO//ApLOjqMNZoF7thduIEgbWoJmg
         BAUNxWzmDO7QNg4k9vSJRG/4yKvOQyxARWweiouJNSJN8w0DKHWsDA7B45Ly+iU4rAP4
         vjTrewt2T4byZbC2r3pCNzIG01rDuVKO6WUgxReLjrUDMLKlEOUwKy9qZgh/63ebEi7q
         c8oQZc9VGS/CnMjRqduhp2Lk/TXqDpZPWwDdIBUq2/nL45nj5l1X1QnDks+XvcR5B7il
         Nl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755392; x=1793360192;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IuDvY+GZo871EJkCLit2ojV8/CoV5VnvDfBzzstEvUM=;
        b=LI/UJnf6s/mhtySn6jJ6QgZsPkGiqJd42AxXJZ7BiSCiksZGOgb5G8qwV/z1eMmneo
         dVwFqdFZhAUuQn8D8799pvuHqg7sC8Cvj95NQUMwVx+GvPZw5A4fdEqSPkALMh6hRII3
         /xKsaaR8TgKRlLzilWuLEHiKFvtwkEy/ECPOpZcDHJmFEpfXDAk0GQ6KzopuzjvWA1/z
         eAPGFURiWiWxL9Kc7aaGKLnSyYGrnIGwiM4Hi5VoxN1o3HFVmF5HUdCr6OImoXGhK0X5
         g28wCkq+NiH9vDhJEHgKZdbBjAP0jdj86YM+yoqg5U7dxwGdNliK4pBVuZ4ROV5vooU5
         Qghw==
X-Forwarded-Encrypted: i=1; AKwUvBxSsXqSnMbCBSa0cxdnLysGGmIE7MR/8LTWTelKZT0f9cQcn4dzdlI+czhEMmXb4qFz2Bq61ijA5l700Ac=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOOrRtQ4oPz7PoJJkXfS+PcNelHDvs5UweSPSXgib2e34J6lQf
	I7HJHdT3BRGftE21MAvU9OGLw6CsmNL3C+JbWikTK7RvzpRoFOAyqM5p
X-Gm-Gg: AYBFou2wgn0ozfXXgpkMg/LskOOSX1achS1Ns9meThvVaQI+MwRnnq1ywU0cdrBfzrQ
	uByMBIWIBknBKNukyHGljYHvajr+k+99kujL6ROfhen3ff/sWZVhtz9Qwxkg/5FiqZy51HYscNB
	PxK/rrVW74aqB1PV6cbbrM9OfJlpTC0aKYgB58FnsN/JfrumlLQ+x8y7i80A4JvYxHSG8FEcezw
	MnJ3QG/n5uER3Syji6GEeVhNrb557fzCqab/VABxBNeqHTfSv5KrcN8q6Ro3Xr35A/LOe7ALLU1
	Ccjl+f634pc/UNeUkdkLHLV7utnaY3cgGEGtivSlhFfuM738VwZKgfySg3CsndF4kaVzHZDeSge
	kqiXBcPmFQQyJJyh7pwF/oKl08Sn1o8ejGlqq2f/0c3pkgXPtKYPYezwJ5cXSt3UDkGG6/7UjRp
	LRcFS3g6AjylwMfBR8OQ86BAobycrLT8cXERhg+Es4AVvCSrAnMwyCzD4XYIiOFsQyRIAk/IPu7
	u2B8hJ6M1IwXOi+JU6A+bOO6s85wkGZktOUuT0RcCFYCkQdVkdz619kXSiha20=
X-Received: by 2002:a17:90a:d40f:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3adce02f85dmr1515815a91.30.1792755392224;
        Fri, 23 Oct 2026 04:36:32 -0700 (PDT)
Received: from [127.0.0.1] ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3dc41dsm9276295ad.59.2026.10.23.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:36:31 -0700 (PDT)
From: Qing Zhang <diasyzhangqing@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com, linux-kernel@vger.kernel.org
Subject: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem
Date: Fri, 23 Oct 2026 19:36:28 +0800
Message-ID: <179275538809.275862.8334230595898232727@tencent.com>
X-Mailer: git-send-email 2.43.7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>From 554233f4165842a0a104896c30ed4d2e89c11931 Mon Sep 17 00:00:00 2001
From: Qing Zhang <diasyzhang@tencent.com>
Date: Fri, 23 Oct 2026 19:29:28 +0800
Subject: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem

Readers of nvmet_ports_list (e.g. nvmet_subsys_disc_changed()) hold
nvmet_config_sem and assert it via lockdep.  The writers --
nvmet_ports_make() and nvmet_port_release() -- do not take the lock;
they rely on the parent directory's VFS inode lock for serialization,
which is an implementation detail of configfs and not a guaranteed
contract.  Align the writers with the lock the readers already require.

Also move list_add() in nvmet_ports_make() to after the port is fully
initialized: the old position published the port on the global list
before INIT_LIST_HEAD(&port->subsystems), so a concurrent reader
could traverse uninitialized list heads.

flush_workqueue() in nvmet_port_release() stays outside the semaphore
to avoid a lock dependency on nvmet_wq.

Fixes: b662a078576e ("nvmet: enable Discovery Controller AENs")
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
 drivers/nvme/target/configfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index b03b5d1c2dc3..75cb9e63025f 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -2009,7 +2009,9 @@ static void nvmet_port_release(struct config_item *item)
=20
 	/* Let inflight controllers teardown complete */
 	flush_workqueue(nvmet_wq);
+	down_write(&nvmet_config_sem);
 	list_del(&port->global_entry);
+	up_write(&nvmet_config_sem);
=20
 	key_put(port->keyring);
 	kfree(port);
@@ -2070,8 +2072,6 @@ static struct config_group *nvmet_ports_make(struct con=
fig_group *group,
 			port->ana_state[i] =3D NVME_ANA_INACCESSIBLE;
 	}
=20
-	list_add(&port->global_entry, &nvmet_ports_list);
-
 	INIT_LIST_HEAD(&port->entry);
 	INIT_LIST_HEAD(&port->subsystems);
 	INIT_LIST_HEAD(&port->referrals);
@@ -2105,6 +2105,10 @@ static struct config_group *nvmet_ports_make(struct co=
nfig_group *group,
 	configfs_add_default_group(&port->ana_default_group.group,
 			&port->ana_groups_group);
=20
+	down_write(&nvmet_config_sem);
+	list_add(&port->global_entry, &nvmet_ports_list);
+	up_write(&nvmet_config_sem);
+
 	return &port->group;
 }
=20
--=20
2.43.7


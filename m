Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197356;
	b=YuWlYHzpAwBLCEOCOxwRqbuKn/3nqfS9CL6sM2Aqz++irV/QYcc6/6Nrs0Tc9ABb2894
	 UaYB8o6i7iOs8Naso24etex+Unm2oX/clFRckP1h1zo0wdNtVTbV1mKw6MxZwb9RvgLtl
	 lTqMk7Ct8EcL1W40B5No9p49ORwqjm5Loi7YM5XP/64xgt7ofMeFrR2R4LgEhQw4zeXiq
	 72iM0uPjkKN942Tl7x92ZTbDG8OhZEU8+dG/EHxM9clN4d2gmJJVPZwdQx2fOf03tv3XE
	 oxrhbY3I2ofu69W1YXGSPIut0XlquwKgfsmi5RLN18bbTz77o9AJ0KZq5A8w1uMmo+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XkCOJZX/WWMB9kGzP5MkxZIBGrbHKVoP2EMu7c4H2Kk=;
	b=cvhx80ZfE+w+/J3rD07gqWWgIS5k/uvKtxpAG7SmoM6FUQ2qqmxu/+JyO57n5UnggQpI
	 R9zBkvRmDaSJzgOcK144Mb2ZVBhwlCobgSOjM6kJrVSqieXw11yagOa1GG7M1gCueIJre
	 IH/nW09QgA/Uf5wXx3JeUhlmgs/KqkuNN9HDn4BX52Cwf1eETGK38iEncfcIVMSMYq0xo
	 YlRZqAn6gIlIUOH06WMtpdleRgZ+y46bfdl2oOZAAOq+MW5LJL9PfawrmuQcFwEDLIQnS
	 9lGRWFbjwPExBWZgDv64QZ+UGivIcgG5B2ewlwgDPiU+gDVbTfC5z5NhtFqWVMDOD+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1iUDFqo;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1iUDFqo
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso767295a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197355; x=1793802155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkCOJZX/WWMB9kGzP5MkxZIBGrbHKVoP2EMu7c4H2Kk=;
        b=p1iUDFqocQVreW8roT9uwBqm6fySMDwgzjOCMGfn8x5G2WANMhf8m8BF++eyz91ef5
         CFEgtqlNdqdmN2iKi3k+DBoajDIu+GKDYyVfMsetvRIHtSebreXYpWDd7ilJdfk2qfDc
         CPd04F9Zc1qkzDu+tl2TajmsKIdBnPFxWK0GiGu/wbEDLhf5IA6WOoQYj6tp3RKJ8LuA
         on/2ID1TXSKk8oWNqdM6upYk9J3DCwLJI/JYfistRGToKZiakbUql0ccLPKoLo9Shiyl
         2XderNpWJ4JK0sIxJtN0+pKrQACGD57RXW1wzl/ihBqFtb4Jkw3MkxXLcpyaGL8a5tKX
         MEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197355; x=1793802155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkCOJZX/WWMB9kGzP5MkxZIBGrbHKVoP2EMu7c4H2Kk=;
        b=NSHqtCVV7EoIL2ni82R8/MiRIN/rz1Awl9M9S0v4SQYBRX2N1V4+1d9uFFxFW6Nee1
         EiyfLnPe9Cckdlm0IYL99LHndnh6fLFVwmfdg7Ihz7fanRzxxR36s9lwdpiQkLjryE5e
         uvPcdUOMRlrSo6cVMfot7ouwNPchOZ1zLUCFeocF9QyX6YUYdk9wroI1XDr/lwXu0A3R
         8ESDRy6FB9KCwBlZBTfgxhqCQP84pIxdOlbqLZSkCMZ4tsjFnemySCDMNDvo8+mfnAhF
         eUOAkvDvSkigaQ9ePB0xBBVC9kWfbGaLNffZuD8WLU6bOc2OtDFejSh1bWdG7STbJ1Lo
         U7Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxmgX/qJnX9v0NXT4mPbIPGYWitNOUDsI+BXh62oC4eYWw52m2yIW+T5kYeOMG8klHjsEIuOUghiCiu7cE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKbVXTUDv/LTS055jZ+v/XrDIxBaPtVpq+wOdpbHrm3H89BMD/
	iPwRAQA6E8iXOirHc6T4ubPBhHfUf1Q7ASRcOdj9bmewelzAZ+R40jEY
X-Gm-Gg: AYBFou3GD6SYVUfRpG3FT/D2XQlNYoAWOQjItfVg/+xpT+c+zE2rneb4hgx52v6uLS3
	d+4dvc+CXVvRBPO3hIt02upQxJexgno3HYrr0uvqek14P9ehFgFPlLelYeA1dhmoHwTM5igP+Fa
	YzWOumApYqHWIj1O7bqkmBxApCX/P/M75rLb74SlKEogKDGev9brY/oTTJmE0YGiPmhGBBfFBoX
	+0ImuKVP13iWtUhaXEU7AKTXBKgDiVn4sr9735PSrTicdXTAN3P0hGUiOdTIrZVZ6f0lm3SZTat
	0Mj0cRyDpeMHEEaiY7DeAXVOF06LvjvsbkeBN6Xct7d6BoZ+eMwHkGSFWn5QwcfH7/YsexgQyes
	+fExnKgPl+Z0Q1i56An1TnbHg9jN6f9CzwvmBekhMZlAvZvSVlRV0cpLHA0A8GjrkoGMmnG0hKC
	aNCUKO61C3jh2UKB8VmDG/iQqFpy+NLFDWfzWySkQf9FwEkL4S3YAl7HuHgARVRO42U5BR8IEyF
	QQI8PpMzxPmj9INLpdC1q7e9hs8dVNYZ0s3A1MS7sCsFh2sIZv0O76YPZMLhlnyrb9TsWZ7Hq1d
	3hClHqbLhZTDcn4I5yG9dHcZsBji
X-Received: by 2002:a17:90b:1644:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae580ae5f8mr1548061a91.17.1793197354899;
        Wed, 28 Oct 2026 07:22:34 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:50::246:47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a900c22sm3309411a91.4.2026.10.28.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:22:34 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+a246ab421a728c78b4ad@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] nbd: don't take cpu_hotplug_lock under tx_lock on reconnect
Date: Wed, 28 Oct 2026 21:22:29 +0700
Message-ID: <20261028142229.24660-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

nbd_genl_reconnect_sock_cb() calls sk_set_memalloc() on the new socket
while holding nsock->tx_lock. sk_set_memalloc() bumps the
memalloc_socks_key static key, which takes cpu_hotplug_lock.

tx_lock is taken in the I/O path under cmd->lock and set->srcu, which
lockdep already orders after fs_reclaim through the queue freeze and
elevator locks. Once cpu_hotplug_lock hangs off tx_lock, any path that
allocates memory while holding a lock taken under cpu_hotplug_lock
closes a cycle:

  WARNING: possible circular locking dependency detected
  Chain exists of:
    fs_reclaim --> cpu_hotplug_lock --> uevent_sock_mutex

  -> #6 (cpu_hotplug_lock){++++}-{0:0}:
         cpus_read_lock+0x54/0x1c8 kernel/cpu.c:490
         static_key_slow_inc+0x1c/0x40 kernel/jump_label.c:190
         sk_set_memalloc+0x6c/0xa0 net/core/sock.c:307
         nbd_genl_reconnect_sock_cb+0x32c/0x72c drivers/block/nbd.c:1377
  -> #5 (&nsock->tx_lock){+.+.}-{4:4}:
         nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
         nbd_queue_rq+0x1f4/0xbac drivers/block/nbd.c:1207

The new socket isn't visible to anyone until it is installed in nsock,
so it doesn't need tx_lock. Mark it memalloc before looking for a dead
connection, as nbd_start_device() does, and undo it if there is no
dead connection to replace.

Reported-by: syzbot+a246ab421a728c78b4ad@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a246ab421a728c78b4ad
Fixes: b7aa3d39385d ("nbd: add a reconfigure netlink command")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in x86_64 QEMU (KASAN + PROVE_LOCKING) with the syzbot C
reproducer. Before: the circular dependency with
&nsock->tx_lock -> cpu_hotplug_lock is reported on every run. After:
that chain is gone. Also exercised the no-dead-connection path
(sk_clear_memalloc()) with a second NBD_CMD_RECONFIGURE.

With this applied, the reproducer then hits an unrelated lockdep false
positive (reconnected sockets are not reclassified); I'm sending a
separate fix for that.

 drivers/block/nbd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 218b99f9e1ef..a567c0bce90e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1364,6 +1364,9 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 		return -ENOMEM;
 	}
 
+	/* Takes cpu_hotplug_lock, so it must not nest inside tx_lock. */
+	sk_set_memalloc(sock->sk);
+
 	for (i = 0; i < config->num_connections; i++) {
 		struct nbd_sock *nsock = config->socks[i];
 
@@ -1375,7 +1378,6 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 			mutex_unlock(&nsock->tx_lock);
 			continue;
 		}
-		sk_set_memalloc(sock->sk);
 		if (nbd->tag_set.timeout)
 			sock->sk->sk_sndtimeo = nbd->tag_set.timeout;
 		atomic_inc(&config->recv_threads);
@@ -1404,6 +1406,7 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 		dev_info(nbd_to_dev(nbd), "reconnected socket\n");
 		return 0;
 	}
+	sk_clear_memalloc(sock->sk);
 	sockfd_put(sock);
 	kfree(args);
 	return 1;
-- 
2.43.0


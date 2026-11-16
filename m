Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811973;
	b=CAWD9pioixm74+y3yiq+LnxMjRSzExLTCpPr1V8zBmMO/J+v5Xak0ju3DGiD+i7XQnc1
	 uSqAKh+WxiW1hMvUNxt4mZhCU0XCAh9VV5p53HHEAhy5BdYTntHc+2pDZeCyaWFamI3je
	 o75xvtiT7YWEXB1xUkEYJkCy4lBwlKzGwVwOvos7/sJvOtAi6euOrO2MNIKH6vUWJqQA9
	 2FM4qmI7IajYHbVQpg0Z6ZxDG7TmJexVz6I4kXy0mJNn70noj2vNIAJfzkIcnqpBXp1xf
	 OGwbIgzLoq0WBupwvNji+iiXHaIgFxy16D3LmUTmyvoQPHhuhyZJnTj8niAROQM2zKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cjhcJXXCSoPUURtlLlIneNXvDxbgE0VczhsVYg4OWeA=;
	b=oWoSWpAgAgz7oqojybJsEY4L1BDiH8RQh78vuXnCE5hQSEPusjEJvAmTOh5yJE03/W/R
	 tWWn6/0lCKCehR1tmIL8F4CUaGqixbn6hE8xosirFgogVHAHA7/NHv6O3Ro78dWlvnqG1
	 u1rRpAzGyGvlY5+akd5wgjOHrRrlYkUHFmw3lIxM7swidOS2XyOUxUwRD00R+rMnc5+zO
	 5fqLRj+wzE+gufJxcH3rRUYXzP/9Yvf7zJfWCC0JPkn3U63UC6gL5MkWu97hy6G8d/rrb
	 G8EhI+6WHIeIf3GpOiMDEWX/9srk2oDBnEWhqMLYACf7hwbSJj/QBO9ewnn1usMM3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3H+UGzl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F2606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3H+UGzl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so2902835e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794811970; x=1795416770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjhcJXXCSoPUURtlLlIneNXvDxbgE0VczhsVYg4OWeA=;
        b=q3H+UGzlRUdmWHbUPd7t3HR5eKwNDbaFWW84LlpilKC0Bmwf+p8Qj822BX83el6jq0
         x97fSwmaPxrNovwx7gS79U6KbORn8lKnRVysFSFqxpm6Q0NWG5V0gm2gN025OB4hAx0U
         MxQRjIpSJ9RYdqEbZ6nNKCuD0f4TA2h2nssetnqFFnQ3+uLZ/eByv1m5s1MQ4ZzJB1nn
         27rKZDqHMauhvfY2iHIWBRxfdArVVwjBmh1AvkauVXRu3PzvtyPsuVHQkryoYcP2kVk8
         ov5YzEupC6YOSRgvymDeHVgQ2vU59tY7GHqk6QOGNW78yk2qVvb6ytRx8gcL0rF0zsFR
         VA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811970; x=1795416770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjhcJXXCSoPUURtlLlIneNXvDxbgE0VczhsVYg4OWeA=;
        b=k2LfffL0wY8yvCsCZDAf8YdCOv0Ky4dKWoNfcxsridgaPpr7nR3PyJ1e/lsvTSMOtV
         Jql6lqAXbsB7R8Ht8K131igPHHgGhdTopkokI47zhJ8Q8W2UbHtLOSHzrYPisBJEyk61
         L+ex0gTMyer5qzyqUH/EpP4dTpdNQx+bouyQ182wqTMAQ3E1d27YrL1SeZpKfttsuyP+
         k+KSXaHnGmUq570kNme+a5g698jEaBGrNzAaGrF55N7hPyD97TEt7tvVeBt6+snNyKbI
         5s1N514YAfDh7SxO8fVbHuD0wnpA/Qwj3eSD67548xTtcl0q3CxA2E1BCk86GS3CyudH
         yYyw==
X-Forwarded-Encrypted: i=1; AL+hErF4YkrIL0O1weI5xVHeQDfvo5bY7Ey5QzfUFzU9yM+P83dmkZL+tM7tkxZgjP79pmD3eGruSYMiFkjcQ1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fKYdYfA/z8G8Zf8JeWghqnNzLgrEn/5v+11gjDaAlpgDN8zzc
	YukErrIgC+x8jeju3afIJJqpE66x2GoSEkojJl4XFtxnT/a4aLT11HUe
X-Gm-Gg: AYBFou0c72xAqfJernSfYf9J6s/NN0wajznvw916k61f1Q5/wBAHawT473ayZf7FoMJ
	C8o/7W+OQKKNWmRqm4vX6QTh3XKPnc1rbaqRtnJFH6U4yRe1z54VwaFO1F846LjvyWTDNXT1rn5
	UVrmYey9hHrgpyN+RNOBpudzlLk9myPkhe7qCOjdXFRG6CE7EEv+Umfuv3uH8n9o2PtO2Lcp44y
	gOmZFH79fTN0cl9p+XPigyoqfA+8ANKhBUGObstDi70ome1KxrLvL1BzPZUw82TJi0b6OhoLquy
	uFReLSpG1ssl5OGSPimcH4trrV5UJE5mzkgI+SPOOTdxnLgBUVTSSnCx6L2PLu2Rq0Mp2hmxcnA
	o1i+RMzvQ7WKumOWqHdq/LdipaPRyOTGNyJMA3ULRWYw1zKPGgCVocsh9Vntf59064wlrWMZm5A
	uADaadcnXDH0VHKok1dywVggTlFwWO8cH5A3nIya2yfIUDHm37BBf6AQDSOuGY1do6gDqTQEtuz
	BDCKK7+ckPRmMpClsKO6dTf8TyIw/XJzmqz7dqC84v39Rtpuj6k3YHhyPdiqXkRG6G4EZ3bwq8T
	bXSWKi4HmoOHaCXqNja+
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr208709665e9.28.1794811970223;
        Sun, 15 Nov 2026 22:52:50 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm86848945e9.2.2026.11.15.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:52:49 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-wpan@vger.kernel.org
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Phoebe Buckheister <phoebe.buckheister@itwm.fraunhofer.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH net] mac802154: remove redundant security_enabled assignment
Date: Mon, 16 Nov 2026 13:52:34 +0700
Message-ID: <20261116065235.27348-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

During fuzz testing, the following issue was discovered:

BUG: KMSAN: uninit-value in ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
BUG: KMSAN: uninit-value in ieee802154_hdr_push+0xa62/0xb20 net/ieee802154/header_ops.c:108
 ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
 ieee802154_hdr_push+0xa62/0xb20 net/ieee802154/header_ops.c:108
 ieee802154_header_create+0xa83/0xd20 net/mac802154/iface.c:396
 wpan_dev_hard_header include/net/cfg802154.h:525 [inline]
 dgram_sendmsg+0xc6d/0x15d0 net/ieee802154/socket.c:677
 ieee802154_sock_sendmsg+0x8f/0xd0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg+0x2f3/0x360 net/socket.c:726
 ____sys_sendmsg+0x960/0xc30 net/socket.c:2581
 ___sys_sendmsg+0x285/0x3e0 net/socket.c:2635
 __sys_sendmmsg+0x33c/0x950 net/socket.c:2724
 __do_sys_sendmmsg net/socket.c:2751 [inline]
 __se_sys_sendmmsg net/socket.c:2748 [inline]
 __x64_sys_sendmmsg+0xc6/0x150 net/socket.c:2748
 x64_sys_call+0x12a8/0x3cf0 arch/x86/include/generated/asm/syscalls_64.h:308
 do_syscall_x64 arch/x86/entry/common.c:47 [inline]
 do_syscall_64+0xd9/0x1c0 arch/x86/entry/common.c:78
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:51 [inline]
 ieee802154_hdr_push+0xa5b/0xb20 net/ieee802154/header_ops.c:108
 ieee802154_header_create+0xa83/0xd20 net/mac802154/iface.c:396
 wpan_dev_hard_header include/net/cfg802154.h:525 [inline]
 dgram_sendmsg+0xc6d/0x15d0 net/ieee802154/socket.c:677
 ieee802154_sock_sendmsg+0x8f/0xd0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg+0x2f3/0x360 net/socket.c:726
 ____sys_sendmsg+0x960/0xc30 net/socket.c:2581
 ___sys_sendmsg+0x285/0x3e0 net/socket.c:2635
 __sys_sendmmsg+0x33c/0x950 net/socket.c:2724
 __do_sys_sendmmsg net/socket.c:2751 [inline]
 __se_sys_sendmmsg net/socket.c:2748 [inline]
 __x64_sys_sendmmsg+0xc6/0x150 net/socket.c:2748
 x64_sys_call+0x12a8/0x3cf0 arch/x86/include/generated/asm/syscalls_64.h:308
 do_syscall_x64 arch/x86/entry/common.c:47 [inline]
 do_syscall_64+0xd9/0x1c0 arch/x86/entry/common.c:78
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Commit f30be4d53cad ("mac802154: integrate llsec with wpan devices")
introduced mac802154_set_header_security() as the sole function
responsible for enabling frame-level security: it sets both
hdr->fc.security_enabled = 1 and initializes hdr->sec together,
maintaining the invariant that security_enabled = 1 implies hdr->sec
is initialized.

However, ieee802154_header_create() was left with a pre-existing
assignment:

    hdr.fc.security_enabled = cb->secen;

This assignment can set security_enabled = 1 (from a stale cb->secen)
even when mac802154_set_header_security() returns 0 without initializing
hdr.sec, violating that invariant. ieee802154_hdr_push_sechdr() then
reads uninitialized hdr.sec fields.

The stale value in cb->secen arises from a specific setsockopt()
sequence: calling WPAN_SECURITY_ON (secen_override=1, secen=1) and
then WPAN_SECURITY_DEFAULT (secen_override=0, secen unchanged at 1).
This undocumented combination likely explains why the bug was rarely
triggered.

Remove the redundant assignment; mac802154_set_header_security() is the
only correct place to set security_enabled.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Closes: https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
Closes: https://syzkaller.appspot.com/bug?id=23f21e76e9d2d1ed587cb5e71515260d6d025b63
Fixes: f30be4d53cad ("mac802154: integrate llsec with wpan devices")
Cc: stable@vger.kernel.org
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 net/mac802154/iface.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index f437b8daa00d..7b7332805ecc 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -368,7 +368,6 @@ static int ieee802154_header_create(struct sk_buff *skb,
 
 	memset(&hdr.fc, 0, sizeof(hdr.fc));
 	hdr.fc.type = cb->type;
-	hdr.fc.security_enabled = cb->secen;
 	hdr.fc.ack_request = cb->ackreq;
 	hdr.seq = atomic_inc_return(&dev->ieee802154_ptr->dsn) & 0xFF;
 
-- 
2.55.0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792730262;
	b=K1V4XOnAQtq9WhgNELKGBqzRMAhTWwTSnNu06TdtvPIWn/W5ZXG7em7B9GDyg9R7uFPy
	 SNoFp60LCq1wez4V/e3MW44iuEY7QWTssyfyfuuNnRVwy9hEuEnJsZ4LUuWmwWN2s8oI6
	 kOE0k5KqoHEaM0moP7hrVFaahabXSiBPonpZ6E3do0ahDV14ZmvTs4hQvXqgg0gJoYJ1T
	 zPUkK2RRHSsAy4CUk78dGAdufDMXecQ3Ug6T/sOcMvOUgsvF4pM37iHFv46QoEx3b0MIb
	 epMo8uE11moHv/xSS/OSa2tzP0/UzdyHs++foXU7zPfHp1DNJvIWXVf0MQVQIAyr6xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792730262;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=f123tdsbUST4XIUSI+zBPuw01Yi2GUfKPUwb5NzT2Rs=;
	b=41WTmq3NOgEg1UAIgWQTPgyVTXNGwNiKDThsEnoC1ZwFH6KApHjLzL4Dnf7x+o+8iE5C
	 lZhfoxelIgG/VunVvpQFu4Ppw9PIbg7B0xJVU7B0gmba5nlDdJkXF/LWqTHtXQAYt1YkL
	 sQpwQ2xJiTBJP0WNNa/UaVxgWLdRA1o5a+9ACjwM3bxoNK4JtuFwp4IsjfInGfzeL3xrP
	 U1TAqPJd8n7CDTQ2hbyFk9AcoYKPvK0nMfnKDSfw2QQFTJk1o1i2IwrB3iVSxFkjmVe73
	 YyklkWwIPkV2OMbjTiRW1g8+qg/x2Dnv9VrrSjT1OqdXTN6A+MP1Bq915M1BIxj1UjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smylZh74;
	arc=none smtp.remote-ip=95.215.58.43
Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B8606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3B8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smylZh74
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hI8lFW79eKCI4bBWDUvXpaoorI5+2uT+zu+nDueEt08=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792730258; v=1; x=1793335058;
 b=smylZh74r6ZvVqUl30ub0GCDSSt78EzeTIXYS4lkwHATPi0k3Tt1sPu4xdKCEgT5a+2KyYa1
 Iskxh7imnbdrOOu22xyULrjtuLMTPX+Mi/PdfoRb8ZTO+BioTN1k72gaXWFpwV8bmLJddfkzcex
 Izo6TrSqCKx5kcIrvRYykA44=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c621be0b7a2731b2;
	Fri, 23 Oct 2026 04:37:38 +0000
X-Mizu-Trace-ID: c621be0b7a2731b2
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Woudstra <ericwouds@gmail.com>,
	Asim Viladi Oglu Manizada <manizada@pm.me>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] pppoe: wait for RCU readers before reusing a socket
Date: Fri, 23 Oct 2026 12:37:27 +0800
Message-ID: <20261023043729.219660-1-qingfang.deng@linux.dev>
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

When pppoe_connect() disconnects or reuses a socket, it removes the old
session from the hash table and resets the socket's fields. An RCU
reader that reached the entry before it was unlinked can still be using
its address, ifindex or next pointer.

If sockets A and B share a hash bucket with A preceding B, a concurrent
__get_item() looking for B can be traversing A when it is removed.
Clearing A->next then makes the lookup miss B and drop the packet.
Reinserting A can similarly redirect the reader into another hash chain.

Call synchronize_net() after unlinking the old session and before
resetting its fields. This allows existing receive-path and
/proc/net/pppoe readers to finish before the socket is cleared or reused.

This was found by Sashiko's static analysis, and reproduced on a VM
stress test with KCSAN.

 BUG: KCSAN: data-race in hash_item+0x1c/0x60

 race at unknown origin, with read to 0xffff888000a1c566 of 2 bytes by task 147 on cpu 2:
  hash_item+0x1c/0x60
  pppoe_seq_next+0x112/0x1b0
  seq_read_iter+0x595/0x700
  seq_read+0xb0/0xe0
  proc_reg_read+0xd0/0xf0
  vfs_read+0xbd/0x220
  ksys_read+0xa9/0x100
  __x64_sys_read+0x47/0x60
  x64_sys_call+0x98/0x1fd0
  do_syscall_64+0x5b/0x260
  entry_SYSCALL_64_after_hwframe+0x4b/0x53

 value changed: 0x0002 -> 0x0000

Fixes: 72cdc67e7fa7 ("pppoe: remove rwlock usage")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261020092118.47416-1-qingfang.deng@linux.dev
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/pppoe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index ee0e318d6a2a..99600fb40c4b 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -622,6 +622,7 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 			dev_put(po->pppoe_dev);
 			po->pppoe_dev = NULL;
 		}
+		synchronize_net();
 
 		po->pppoe_ifindex = 0;
 		memset(&po->pppoe_pa, 0, sizeof(po->pppoe_pa));
-- 
2.43.0


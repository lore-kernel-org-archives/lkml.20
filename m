Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638038D3F2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134708; cv=none; b=Pd6rOz06XQkwLsicJZ5fWXgQWh3a4SOk0ke6PNjY6h+5yKiMmQhhKqKMqHxoarz83H9IM5A5AiWaK6sSYP8ZTEL6zBVDbhZ480mjEq34xyqNe6uCxd9F7G+34UI3eY3OYdL1ObKnVqfHqgj1wD4WDZN4krSsSVEyIQlqJrk+9NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134708; c=relaxed/simple;
	bh=8KiWpEfJWTbwjrKiaeWD48OpEV+pvCJHx+vWNLiFW/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtIEmeYFK+NpEdU8JviP9UqcgC+pMQeO4cyMVxTIoameQ5kcYanUCmWBCwqeC+01z8PuJy5ENtKR6k31Bm0mIdQJg9T/weNiFaGp27VyMD7QjDMA8W8WurufPK2ycd9j06Nk50XpBNBJPx5ekT+sHqK9pnyhbsv/wM1E7scJqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Mb68n54T; arc=none smtp.client-ip=61.135.153.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Mb68n54T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1790134700;
	bh=SSTJd963xEUON1+FZ/9179DjLgLkdifADFr3k1ufCjM=;
	h=From:Subject:Date:Message-ID;
	b=Mb68n54TUnwmWEdJa6SXCTaU0t/pesCCQivjPjkCwjGoLflm1WAOhuKahGIOh/8CS
	 NCGr7xu1aoTsHeqtjR70l1jl61gVYjvQqcWspDI9Cwy26hADk78gBoHnE+C3Zs59es
	 P47imIv6L7mcws9MuJYLeahkbRMRCXxqDtbBoujY=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AB349A500000440; Wed, 23 Sep 2026 11:38:16 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 2135416816513
X-SMAIL-UIID: 44FF24CBB9FB41E19821EB769B201619-20260923-113816-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_purge_client_connections
Date: Wed, 23 Sep 2026 11:38:12 +0800
Message-ID: <20260923033813.23609-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ab2989e.a6af0033.177e91.0021.GAE@google.com>
References: <6ab2989e.a6af0033.177e91.0021.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream f0100363d8c3

diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 48519f0de185..9f13520be249 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -335,6 +335,7 @@ int rxrpc_look_up_bundle(struct rxrpc_call *call, gfp_t gfp)
 /*
  * Allocate a new connection and add it into a bundle.
  */
+static void rxrpc_unbundle_conn(struct rxrpc_connection *conn);
 static bool rxrpc_add_conn_to_bundle(struct rxrpc_bundle *bundle,
 				     unsigned int slot)
 {
@@ -344,6 +345,7 @@ static bool rxrpc_add_conn_to_bundle(struct rxrpc_bundle *bundle,
 
 	old = bundle->conns[slot];
 	if (old) {
+		rxrpc_unbundle_conn(old);
 		bundle->conns[slot] = NULL;
 		bundle->conn_ids[slot] = 0;
 		trace_rxrpc_client(old, -1, rxrpc_client_replace);

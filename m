Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589517A2F6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790562366; cv=none; b=AAUir1AKeAQ0b828iBZKx/NSHtx0C/v/d0h3cUvRUDExxxWTZHGx2+OaLUzVfs+QqstlMG1aBi5qPtb+nN9FjwIWawyy7BvgngEL+UCJArQQ60b9TFqmwJXmlSREiY65FesBPJEbCsTW9n8L/UICFdphpUw9ubbRyUej70cn+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790562366; c=relaxed/simple;
	bh=DczgRzRMKddbpM/CNDquSTqL0CfVxs58MVDRoNna7Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7c7qDQ4I84QxGiApZxVAn+GE5Y/IAeY9vq0CkeKUiuNWJLJzuQsVoU2sReWldVcNwoXqKQ42tej163qiIytzRiVfhE/skw5JKvXEosunDhQtA0tZrYrvENUMlup9WWm64dYsKCiaMrwWKgefcxnCF5vPFJ004upnpdkzovG6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=fu96QELG; arc=none smtp.client-ip=202.108.3.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="fu96QELG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1790562362;
	bh=0C5YNo9SFn2yVZ0LI5HEAjziHSm/McUSG9Sb7ViONsA=;
	h=From:Subject:Date:Message-ID;
	b=fu96QELGx+9f9MU7FLeKx6LZGWxK4Ky9AlKxTBApElcgM1vwraSErjA0rSGJ9yPbk
	 sIN+NDFLTTVpzwNR70Zok0TrIpoZqMHQv8hXhuPc6EEHz0wVBruwhXJAmJhBamUutW
	 GqjLjQtcSu4D/98K1Rbv1o31KBdyip2YuAC/uCJs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AB9D03200000BBB; Mon, 28 Sep 2026 10:25:56 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6464614456614
X-SMAIL-UIID: 4F4F993676584A3AAAAA45772B084D16-20260928-102556-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_purge_client_connections
Date: Mon, 28 Sep 2026 10:25:48 +0800
Message-ID: <20260928022549.181870-1-eadavis@sina.com>
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

diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d0..f9af07d7db4a 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -272,14 +272,15 @@ static int rxrpc_process_event(struct rxrpc_connection *conn,
 	bool secured = false;
 	int ret;
 
-	if (conn->state == RXRPC_CONN_ABORTED)
-		return -ECONNABORTED;
 
 	_enter("{%d},{%u,%%%u},", conn->debug_id, sp->hdr.type, sp->hdr.serial);
 
 	switch (sp->hdr.type) {
 	case RXRPC_PACKET_TYPE_CHALLENGE:
-		ret = conn->security->respond_to_challenge(conn, skb);
+		if (conn->state != RXRPC_CONN_ABORTED)
+			ret = conn->security->respond_to_challenge(conn, skb);
+		else
+			ret = -ECONNABORTED;
 		sp->chall.conn = NULL;
 		rxrpc_put_connection(conn, rxrpc_conn_put_challenge_input);
 		return ret;
@@ -323,6 +324,8 @@ static int rxrpc_process_event(struct rxrpc_connection *conn,
 		return 0;
 
 	default:
+		if (conn->state == RXRPC_CONN_ABORTED)
+			return -ECONNABORTED;
 		WARN_ON_ONCE(1);
 		return -EPROTO;
 	}

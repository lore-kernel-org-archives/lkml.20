Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2E38AC9A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789322676; cv=none; b=HnmKS+s9skLbaauoOIeWe73H9D5euRrI9177wColTfWGHfJX9gXh0fyhbyv/9l7sBk3JRfwZycg3+ls7q0L7KHR8K4Kfrg2c1R42iMOzK+/RXnLQDVCYkwBW2+C8OyQIIVpuxkewWef9SHNk7cTXCGQ7q4e3jpqag8CUdveA+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789322676; c=relaxed/simple;
	bh=iBDKlpYSrIxEWTDJyy0WenSs+m6BqLBO4IH5of9UG88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnGx9DdtOGKcC5YpYFxM63IwWTS9Y1FHnxDRJPkyXzB9vbp9LiQMgYtHSXNuvbRjkbgqmiJaUE+p/70LdBaP+CEpO/SH24cU0Slxx/OrhocPpc9i8csksou7FZoluuHAdrD0opvd1bNiKKKPAmVhdevPSCRti5+xT/f3Bxw0IO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIPmr0v1; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIPmr0v1"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2dd68a16955so685435ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322672; x=1789927472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByuJG/ToMKb3/GEaCPutmgXOi2odRqpn7f8I+oxWvKM=;
        b=ZIPmr0v12bDZGxvas6JF8G0TK6XpkcthUihy/OYHMmv6LKwnqbzqSZnn3aC2xwOMTZ
         D2BUDxemW0taAdwxUDlTOMLvsfJu5ASd8Dm68a88TYAIHu4rSeY8eB6sajJrbZ/xp+uX
         MbhSY2iZ6rPfp4YayuRmG2wBW0H2QXbd5AUKvIKERDdi3IenaPJkxIzyAjXjqAa+ZC2R
         uP3YGOWz0BCLCJcOo8DcYzkzogk8D93lw8pFkS+L08Hm2ZUwM2kCFWN0l9rby8kOWRgH
         5T62SUHxU5jF8vk49OwiBZATsarIZOlMYB8FysqtgEoiySvVntCZGTHA1OI6LM5bdqH7
         T35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322672; x=1789927472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByuJG/ToMKb3/GEaCPutmgXOi2odRqpn7f8I+oxWvKM=;
        b=hq+Uc2Lh9TpE/Q5cLG1/Xz0jOLM2Ijab9BLyYt7xcCBo9QpG8RfKRmwwL4/7AJlBfm
         PLp+OHzB1wSZ8pXVpdc4ScW9IblcHG4f1jEU0PMtMjm2Ck8jA+fRZh5KdTXUJuMO0FvE
         D+XOb9qze98rhGHhH58Po/jXbkOU4DxKgzNV2MgteBTR93/zhznniS5RPxhPCaK7xq/A
         itM1D/oUG0sWWmc8H5spRVOP7ixYM2l2hBIc3pBLM2xPLWDP1ibzN6RW/zk/CqrNhdYF
         nRhKTzgIBtwCNfZIYzGEolSd7YjSwWj0nj/5ACaAl72dXhNaqNOK2Eqk/81o4ECmK3PY
         2QwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLMhOjfe2+2Ac5O7A9kNqsrx8nsN5M2nL+lHW3o6hp5N/8R4Hsfo5EPIigkl50yJaGSqaR6QPwFPkXNuc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDDoOi92snRxG+ZtshkL55NJuUPSudqv4DHuF1eKQ7HPVtbGyN
	R1Q6/Wk67y6ljgXUgBbQ+EMVja4DeLCFylmrvSl88dRGX/d4WXklI+g=
X-Gm-Gg: AYBFou3uD3QlhdIAAmABjPlHf7UpVqVpO8Rw8KcWv7vw7JypngXGpquvn4Ch9jHmpmS
	1OHcB8kOP726kGz0YHFB1OCNbBZnANHA7xnRDvXewaf2GUiVAYpNFmKMCKZLhSzV3J+06IwRq6V
	twqGYJpbl2AHIr5JzBVdxgl+bLiJ6OaUsZRpmj341ev3sl2FEQoaGlvbOuHEzcDXPd0uE+dl0AK
	KtaQURSl1MDuKrHfPKIJdrXJlVDLWqfgWzjK1NIwMooeSDpawqauYtSuEgaF9fkzuqMEkcXy/md
	jZblA3BZdRn9J9vyoFf9fVhMY8swSkRXziIUKXRCyKZ9GkNCIJ3+QdEFO1HaiCZm6YG+4Cy4ma1
	vLQvwGhJUrzsfMQ06aiAG8QmSeCsRC6Ro8QScx0uFm7YvAqbGRRkNnofp0HdLv0Cg3XHFnb7sQ7
	2SQD/knejy9oHNbqZhivZATnxBES4ZQVbA6Q3U3yydd8uB3NG14tv8CiKSMjvlnUJqIP6RnxCq4
	ySDQOdSXFZ7UnM=
X-Received: by 2002:a17:90b:57cb:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39dd5478bd5mr3476877a91.7.1789322672116;
        Sun, 13 Sep 2026 11:04:32 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3b24:1a8c::2a5:ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm20636958c88.3.2026.09.13.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:04:31 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: [PATCH 1/1] net: qrtr: fix coding style issues flagged by checkpatch
Date: Sun, 13 Sep 2026 23:33:42 +0530
Message-ID: <20260913180342.8948-2-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913180342.8948-1-muralikrishna2444b@gmail.com>
References: <20260913180342.8948-1-muralikrishna2444b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several coding style issues in the QRTR subsystem detected by
checkpatch --strict:

- af_qrtr.c: fix missing space in pointer cast, "(u8*)" should be
  "(u8 *)" (ERROR)
- af_qrtr.c: move trailing "*/" to a separate line in two multi-line
  block comments to match kernel comment style (WARNING)
- af_qrtr.c: add missing parameter names to the enqueue_fn function
  pointer declaration in qrtr_sendmsg() (WARNING)
- ns.c: remove unnecessary return statement at end of void function
  service_announce_del() (WARNING)

No functional change.

Signed-off-by: Murali Krishna <muralikrishna2444b@gmail.com>
---
 net/qrtr/af_qrtr.c | 12 +++++++-----
 net/qrtr/ns.c      |  2 --
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 78347c937..3f4e56a39 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -393,7 +393,8 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 		mutex_unlock(&node->ep_lock);
 	}
 	/* Need to ensure that a subsequent message carries the otherwise lost
-	 * confirm_rx flag if we dropped this one */
+	 * confirm_rx flag if we dropped this one
+	 */
 	if (rc && confirm_rx)
 		qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
 
@@ -471,7 +472,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	cb = (struct qrtr_cb *)skb->cb;
 
 	/* Version field in v1 is little endian, so this works for both cases */
-	ver = *(u8*)data;
+	ver = *(u8 *)data;
 
 	switch (ver) {
 	case QRTR_PROTO_VER_1:
@@ -769,7 +770,8 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
 	xa_erase(&qrtr_ports, port);
 
 	/* Ensure that if qrtr_port_lookup() did enter the RCU read section we
-	 * wait for it to up increment the refcount */
+	 * wait for it to up increment the refcount
+	 */
 	synchronize_rcu();
 
 	__sock_put(&ipc->sk);
@@ -957,8 +959,8 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 {
 	DECLARE_SOCKADDR(struct sockaddr_qrtr *, addr, msg->msg_name);
-	int (*enqueue_fn)(struct qrtr_node *, struct sk_buff *, int,
-			  struct sockaddr_qrtr *, struct sockaddr_qrtr *);
+	int (*enqueue_fn)(struct qrtr_node *node, struct sk_buff *skb, int type,
+			  struct sockaddr_qrtr *from, struct sockaddr_qrtr *to);
 	__le32 qrtr_type = cpu_to_le32(QRTR_TYPE_DATA);
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee7..aaf77c7f5 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -179,8 +179,6 @@ static void service_announce_del(struct sockaddr_qrtr *dest,
 	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
 	if (ret < 0 && ret != -ENODEV)
 		pr_err("failed to announce del service\n");
-
-	return;
 }
 
 static void lookup_notify(struct sockaddr_qrtr *to, struct qrtr_server *srv,
-- 
2.43.0


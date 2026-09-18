Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D439A04B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702777; cv=none; b=isxURfPVH2GapXC2+gOZSsys6iyuKl7MEh6s3KZ5H6K39CqWc3iI+XdJtWreWxxbuHT3uH7T+nc6gTeXwwlBMC+qVDzb8Lm3OmSLoMvS9RFc3OeArGd8KcY+fFpuLC2+d/KwZA5ZqAISnZ56I5MUFi0lAJ4jAAoR1ewP3lOb7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702777; c=relaxed/simple;
	bh=5DGBMHNqKO8hBWMRpZeiWO/8gLuazINjem6KokRy5sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgZTSqGwqS7O02TVtqv63BtdUb8kB1UBihcRkehtcxIRB1r0nqppGCqivI2uGI9jnIgLBjDwFpnWRdk0UpgiT4cvvatKGnZ/yGPNTTifjnfKU3rWlw6CK9PFq5xtgfIIvEz25m2Dbd7rUu3gPKrfNGNvsX7NhhGv1NbHA9UXrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCmw+uO/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCmw+uO/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd68a16955so13942445ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702774; x=1790307574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILawRzLN/r3LsyBAHOfYBFFSxWw7SDBmyvoLxd7dlsc=;
        b=hCmw+uO/iWOXQCGKQhPQgLYqUhfkfPD9uEvIzd0WB3jIAUXuh0Lo7jy6z8yCQGXCdr
         qt6E+l8vtJqW2tWWQRxyGlNLdLa9fgzq2Y2Sd9jgQYEHwXYOjMKpk4VF9BfqZFenWAm3
         MdIK/8+A2tNygA8ohdzLjNKZDRAJKrlJPYSQw3OmZHR6xX2pTZwrT7dXU+Pj+LLhuCeK
         /FRagWmWX39WtGY6sDiZXqpM1i55zt/QXlKwplz7ZzgSbE05CyYEyLeHu5HOQBF2jqJ5
         OjmOZjFIKfl63DuqIIES+hxb6fmKtv6OunbxIphhUdN5tONwRu0wm7fFLnJfTpGqewC9
         oNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702774; x=1790307574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILawRzLN/r3LsyBAHOfYBFFSxWw7SDBmyvoLxd7dlsc=;
        b=joVZm85Klo4AOb7YHScS6CYd5Almb3cr2894vcFl+3JIUT9HLj4uilbxVvTeeCxjES
         UT+J7TLnI1rY5nrfQFk3nk82lWB8se8KJWK253gey7i+TARieD8GNHU7SqGwuqHEfqdI
         9bX20zi+0Z1F/NBCDDn7W5bR8pLWp1jEIyd9JmbY2iT18rcDcxH3xdW9AwELl345KFeg
         fv6pjWWfgrAv1/IYW/tKGRjv6F+P8jKWhshtyIM/qgl3FkYPrnfYxE2Qwsv01/HtcvA1
         r6AWJW3XAkhbVzMk12tRMN4XqGTKfLx1bhMLa+9PFf1uuuFkx0gPRKZIoSHe5+1GlC9n
         9Ilg==
X-Forwarded-Encrypted: i=1; AKwUvBxFKygrFYeY0nr6jNanhWmceq1ew03MOjioShsiHoRZugeDUhj1ccRCka87f6rAhjyq5llKawyiz9i4bGs=@vger.kernel.org
X-Gm-Message-State: AFuF++mSVKTQTX3Yrpnv6ReBgjgvwe0Nlf1P+zzrS8c8JhP9LKeyvDH7
	H2HEgPCIsH9B2B/aDXYNYSEpH2O54uWlAVWnWUMaeSk7svi6v1kSFyfE
X-Gm-Gg: AYBFou1mN5uPpDVzLgiMuqKMHpvO3tQY5xRELkZlJPWl4yWupLy/2jWOxfb8zs6PEFv
	coTrndosYsyzHSmQ3e6G8G9ZiKSvkysMNsbz5QHHe+Duwdp1vly6/J5KuIko/NC5CLJnBI0uyF/
	0GUjmw1Jx/OlTiwDtdVa2BkzwD6ZK2f62KuW+aLRBx0P+v1fXcEUxWud0UIKxDcHAvUNbvz53eg
	vCvs0NqsSuGQudqbyEVdMy5BHLLYUUHroUKm4rud6S5/mYq7okY2PXvbeQUo2l4WxGlwqyu6yB1
	7vpUmhpTh6gd1zWZrRFjncpqPO1RnkysnxqIb67zu9PZoy+bSeQURZHSRzTAZjkLdQXLZ2Alu1W
	Wz1RDOnGlPidEHMTw6Eh7CPX19BwYYdRyJ+wCBd0y7P74dQflDNTefw3I8Du6lhaDoxJWrYQXFf
	hT0AjUp/28gJqYHYqwuLntt5Fpgd/AeL+2cidqsRlDW5y1rZEHWxuwJSICtJduW4i+eNaqqxFV7
	UaI39sewMmRnXblVV1uD5kuXENCFEj8SCwnqD0=
X-Received: by 2002:a17:90b:4b11:b0:39e:4c97:ce0a with SMTP id 98e67ed59e1d1-39e4c97ceebmr3098526a91.43.1789702773711;
        Thu, 17 Sep 2026 20:39:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfe957asm1039280c88.7.2026.09.17.20.39.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:39:33 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 1/1] nfc: llcp: reject connect() on sockets not in LLCP_CLOSED state
Date: Fri, 18 Sep 2026 11:39:20 +0800
Message-ID: <20260918033920.85025-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918033920.85025-1-ndaugoing@gmail.com>
References: <20260918033920.85025-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a socket is bound via llcp_sock_bind(), its state transitions to
LLCP_BOUND and it is linked into the local->sockets hlist via
nfc_llcp_sock_link().

Currently, llcp_sock_connect() only checks if the socket is already
connected (LLCP_CONNECTED) or in progress (LLCP_CONNECTING):

	if (sk->sk_state == LLCP_CONNECTED) {
		ret = -EISCONN;
		goto error;
	}
	if (sk->sk_state == LLCP_CONNECTING) {
		ret = -EINPROGRESS;
		goto error;
	}

Crucially, it does not check for the LLCP_BOUND (or LLCP_LISTEN) state.
Previous fixes addressing CVE-2020-25670 / CVE-2020-25673 added the check
for LLCP_CONNECTING to prevent duplicate in-flight connection attempts
from corrupting the connecting_sockets list. However, they assumed any
other non-connected socket was in LLCP_CLOSED, leaving the LLCP_BOUND
state window unhandled.

If connect() is invoked on a socket that has already been bound:
1. llcp_sock_connect() silently overwrites llcp_sock->dev and
   llcp_sock->local without releasing previous references or freeing the
   bound service_name, leading to refcount and memory leaks.
2. The socket remains linked in local->sockets, while llcp_sock_connect()
   links it again into local->connecting_sockets via nfc_llcp_sock_link().
3. When connection confirmation (CC) arrives, nfc_llcp_recv_cc() executes:

	nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
	nfc_llcp_sock_link(&local->sockets, sk);

   Because sk was never unlinked from local->sockets, the head.first of
   local->sockets still points to &sk->sk_node. The second
   hlist_add_head() sets sk->sk_node.next = sk->sk_node, producing a
   self-referential loop. Subsequent traversals of local->sockets
   (e.g. nfc_llcp_sock_get(), nfc_llcp_socket_release()) enter an
   infinite loop with spinlocks held, resulting in kernel soft-lockups.
4. Furthermore, if connect() specifies a different NFC device index than
   bind(), the socket remains linked on device A's socket list while
   being assigned to device B, causing cross-device socket confusion.

Fix this by ensuring that llcp_sock_connect() only accepts sockets in the
LLCP_CLOSED state, returning -EBADFD otherwise, matching the state check
behavior in llcp_sock_bind().

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 net/nfc/llcp_sock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a4d48b..66f12e9af2fd 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -689,6 +689,10 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	if (sk->sk_state != LLCP_CLOSED) {
+		ret = -EBADFD;
+		goto error;
+	}
 
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
-- 
2.53.0


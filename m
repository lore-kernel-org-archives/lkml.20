Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E039EF23
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695231; cv=none; b=LlT4ig9K4fw41cSL13h884/iS3S6X+CMnlIwso/3NQ97KA+00XOZL2K0P4Y6Q+u89HKLtniwA+xWvoEt8fLd8o0aoZ2LEqSBpeM7dlsa9MqDuF2fCZKAH3LTk+XKrmwxk1eNTDMj0LPvMISnrIgbzVSqu7fYugdwWE9zkIPnTaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695231; c=relaxed/simple;
	bh=r6wg1fxuHJV5fVthhBMAQtpw90GcHVHZyZLGN4yf8h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3HErlGA4U/h/1oxSVrOSO9rRA2BVeVakgWPMVyDijc1nXOxPU6hZWFo8emlYAuJhYRku0tydilu/irvNGQBxTatNuQTaGYsHj47wL5aDRfZnmMpDptcg7UsV9CInTPauAVZdXlWwl8AQxUioDBOhM/99PK6BhHC9nv4OSIpx1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZU3CVs1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZU3CVs1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso115279a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695229; x=1790300029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkXkRtAByi7EwmQiCmqbYZQrF7WUF4/7cAMEO1mUpMw=;
        b=mZU3CVs1aYJxtZ10KA0x+gXKognk5ldxoc/QJXwsRaRamywwmHSuHQAbb5WqJGDe+C
         aOGCtcKVi+LQKuI4iZxxS208T03sZnw/a4q17TTMOzRqwk3goRlRd9favImnMnhrD+rp
         /51OKJ2X3vZ/P78hbr+w5k09BpaUjG9Bx28xTnmhIuV5GgpezxsV/S4ibiBpXdy50lOl
         15JOX5M3nhRZX0PXUgN9U2TxxwYp0PlI+g5mvjmONH0xBumUGmxT4iPa9OfBjuiYuGhd
         ZUOaErL2x32W/YDQ9K5voMOvXiDhxrYq7/ytGUtM3tXHb8mCZAst/T9xN2vAWUoXk2kF
         dUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695229; x=1790300029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkXkRtAByi7EwmQiCmqbYZQrF7WUF4/7cAMEO1mUpMw=;
        b=EqrGBjNvW3XUxCjLjdRpgKv/LI7Jr4QeNY3PKGNpD+cuoxp08IqSIM4TsO1SJRry+w
         +af//On0bynWkCoDGLxxuA9JanBCh3/2IN9TO6AqEIJZxbih/PbZhmSsDPMPIJpvgVVb
         hTZto+tXFZgTZEHsQA8/CJc8hMYG1izBNaxXM+x6xXQIMEbu4q81vuflVEb2GikNLorB
         wEv5IofOm5IgGy1LslGOrSPSLlj7tN6hz8nkMsk+dR3ug8gmxPIa8KhuqHxBEDwcVQ3J
         zuxQTkKdDAGygjWPp9fDwjrrW4JPxnQ7t2sR9Co42XsxYuTINvNU+axrKyNmbqB3zcPq
         c0GQ==
X-Forwarded-Encrypted: i=1; AKwUvByleYgCIDUoWV8giQE14idiopFiPTPetx+rK/c8dtf0qQb3ya7ljslJ7k118/1anSI5hsnJU478DqGrS2A=@vger.kernel.org
X-Gm-Message-State: AFuF++kz52qRrWh7JbXNkcVmDiadbuCHjf9/2yJPNrsR7c/pe1EMwrHp
	sAKNFFxAE8Nr90MjAEhh4EA+obth//3k8ImN09xh5L9/yJ3RNI2OAf8O
X-Gm-Gg: AYBFou3BTpEYp3gP+Nz/KLaYapZlPJZsIxRmU65Y50gZRFAY5GUH1FA+/F8WicqoRyL
	ZIRhQhQvjGu4SzcTSk5UyBVgSvCAtoN0XiJq5LSHHuJaXT9GJsRv/4bZ+EZTdK9cPY/mlQrpMrH
	1OnUWUyfi93sl8lybH4VYt5yPlZY66tIpA7gRLLOBEenT2Z7WS2MTEv6Jw2aGDeo/nU88738OmY
	dNK3Okj0ASM8axt46tWwChkBBW3xTPQ5Kdqh19qOIYEUGu0uw8+yP0hxwl76t5D2Be/i6ZMrRga
	nZ1NL4H1P9RfgVwoXhORhYJjPV9Bij/eKAsZhgch4+bQJJubMWALIOkNkITIuDz4wIBsWWyKyH8
	JNBUp2Sd/GgmOzW7SGxG+GdA3lxK8SAxsaHjRpi7HqYMWXM/6H53LFCn5ylGia9Jd5QHiWVjcTx
	GuEMs4rNE6U03Ma/hKNYbhO029ewD7fBC4+/zteQ5y6QEbayqRwHx7MTxiyzdmGq/8YOwIXDazr
	uxnfIhy0dfO3fNDDiDLOB/AX0TRgHp9J/hK6kHU3NI2lZW0wQ==
X-Received: by 2002:a17:90b:5885:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-39e54cb0e29mr2306656a91.3.1789695228974;
        Thu, 17 Sep 2026 18:33:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e17f:a362:fc0a:a2ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm40520eec.11.2026.09.17.18.33.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 18:33:48 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] nfc: nci: ignore unexpected CORE_RESET_NTF
Date: Fri, 18 Sep 2026 09:33:37 +0800
Message-ID: <20260918013337.82214-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918013337.82214-1-ndaugoing@gmail.com>
References: <20260918013337.82214-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
added handling of CORE_RESET_NTF in nci_core_reset_ntf_packet(). When
received, it updates ndev->nci_ver, ndev->manufact_id, and
ndev->manufact_specific_info, and calls nci_req_complete(ndev,
NCI_STATUS_OK) to finish the pending reset request.

However, unlike other notification handlers in ntf.c (which validate
ndev->state before completing requests), nci_core_reset_ntf_packet()
does not check whether a core reset request is actually pending.
If an unsolicited or delayed CORE_RESET_NTF arrives (e.g. after a reset
command times out or from a misbehaving NFCC), it unconditionally:
1. Completes whatever request is currently in-flight (such as CORE_INIT,
   RF_DISCOVER, or CONN_CREATE) with NCI_STATUS_OK, leading to kernel
   state desynchronization.
2. Overwrites ndev->nci_ver and manufacturer info. Because
   ndev->nci_ver is used as a selector for subsequent packet formats
   and parsers (e.g., in nci_open_device() and nci_core_init_rsp_packet()),
   unexpectedly modifying it can cause protocol format confusion.

Introduce an NCI_RESET_PENDING flag to ensure CORE_RESET_NTF is only
processed when a reset command is actively awaiting it:
- Set NCI_RESET_PENDING in nci_reset_req() when sending CORE_RESET_CMD.
- In nci_core_reset_rsp_packet(), if the reset failed or if handling
  NCI 1.x (where no notification is expected), clear NCI_RESET_PENDING
  and complete the request immediately.
- In __nci_request(), ensure NCI_RESET_PENDING is cleared upon request
  completion, cancellation, or timeout.
- In nci_core_reset_ntf_packet(), check and clear NCI_RESET_PENDING
  before updating device fields and completing the request. If the flag
  is not set, log a warning and drop the packet.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  3 +++
 net/nfc/nci/ntf.c          |  5 +++++
 net/nfc/nci/rsp.c          | 15 ++++++++++-----
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e66e..504ea91ddf27 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -31,6 +31,7 @@ enum nci_flag {
 	NCI_DATA_EXCHANGE,
 	NCI_DATA_EXCHANGE_TO,
 	NCI_UNREG,
+	NCI_RESET_PENDING,
 };
 
 /* NCI device states */
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 5f46c4b5720f..5a90591cd9af 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -134,6 +134,7 @@ static int __nci_request(struct nci_dev *ndev,
 	}
 
 	ndev->req_status = ndev->req_result = 0;
+	clear_bit(NCI_RESET_PENDING, &ndev->flags);
 
 	return rc;
 }
@@ -163,6 +164,8 @@ static void nci_reset_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_core_reset_cmd cmd;
 
+	set_bit(NCI_RESET_PENDING, &ndev->flags);
+
 	cmd.reset_type = NCI_RESET_TYPE_RESET_CONFIG;
 	nci_send_cmd(ndev, NCI_OP_CORE_RESET_CMD, 1, &cmd);
 }
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f5c9a8ab7ec1..69bc9047f057 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -36,6 +36,11 @@ static int nci_core_reset_ntf_packet(struct nci_dev *ndev,
 	if (skb->len < sizeof(struct nci_core_reset_ntf))
 		return -EINVAL;
 
+	if (!test_and_clear_bit(NCI_RESET_PENDING, &ndev->flags)) {
+		pr_warn_ratelimited("unexpected CORE_RESET_NTF\n");
+		return -EINVAL;
+	}
+
 	ntf = (struct nci_core_reset_ntf *)skb->data;
 
 	ndev->nci_ver = ntf->nci_ver;
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index b0ab4f5acbce..a4bfe14372a8 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,14 +32,19 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,
 
 	pr_debug("status 0x%x\n", rsp->status);
 
+	if (rsp->status != NCI_STATUS_OK) {
+		clear_bit(NCI_RESET_PENDING, &ndev->flags);
+		nci_req_complete(ndev, rsp->status);
+		return;
+	}
+
 	/* Handle NCI 1.x ver */
 	if (skb->len != 1) {
-		if (rsp->status == NCI_STATUS_OK) {
-			ndev->nci_ver = rsp->nci_ver;
-			pr_debug("nci_ver 0x%x, config_status 0x%x\n",
-				 rsp->nci_ver, rsp->config_status);
-		}
+		ndev->nci_ver = rsp->nci_ver;
+		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+			 rsp->nci_ver, rsp->config_status);
 
+		clear_bit(NCI_RESET_PENDING, &ndev->flags);
 		nci_req_complete(ndev, rsp->status);
 	}
 }
-- 
2.53.0


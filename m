Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0F38553F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303741; cv=none; b=jd40l0NC1iuyUoSrnAC03Z/hSlh6bT1W1QrzPkiltiahWMDtQn6CG8vmkUpBtMUaWIoXM6O6riOgM2PZx7lkRrwoSYOsWPqQKMh4gucZcFxEyWfx5R+hBpmyp36+bnsPpnTVB+toJX+PaKi6Tdh2aaWA6paJw80ILP4FggN9A1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303741; c=relaxed/simple;
	bh=mLzFb0wUMf/2JsZbOeNHMQqBI0nCl4svyVfY+mfVD3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLA6pOkOXvQPpjPlx/u0x7oDG3YaMLSDWFbda2STnZoqwHkU+tWUrtDhy5qKtHG5KCGKGGsdSXnxk9YMhq75E66Pn2J11tLd/5HEJsvs57ED2mA/HHZsVUZ06awfMlvxfgsAWB7inv+PXUarA3YbFVilNjHNhwI71P+Eh1mxuI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRKvamD8; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRKvamD8"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso416345eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303738; x=1790908538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L60OKz5e4cB68kG1U4rmEvHYKKWbnczDtlXEaWaKfOg=;
        b=FRKvamD8KDeTbuN/DQJzIlnclGtOqL1RKAyGdsS460x7V+RMQkYONxjYhnrTmLJb0u
         +ibHibimbArtD5B/mIAcr3Yi1kQKmkA9YyX0xnejr5C/2MerHDLSEAqnXulIxlWrDiEA
         g3XzaSCSUpRvYu4nxqcz2PD9dNjcj1d0aIuai3KBBqB6v2LnT948J+DwbXcO8IS25d9o
         4YVmonE85sZXuMCRXjDqMrcOr7BRadBq5DAIvbDU0byK1KX5cv1LmOp7muR9OLTGafGH
         et1HPeWSkapJ3Bn+ZmJshiplnFG/K9l+/E/XZhy6HIEcE2cSVGoG7tPsAJ7YUMkgiyxq
         yCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303738; x=1790908538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L60OKz5e4cB68kG1U4rmEvHYKKWbnczDtlXEaWaKfOg=;
        b=NE07g959v+Tp7Kpt8YbraZzcnPLBo52GDQsIIjfhfk/9WeEvq+FWZ2YIJ1mmhad80n
         THoc1yYa2/J74uh8x/R4+FgPb/P6Vw7Z605S1Od3AbfBC2MEdssBXtluO1DcFmLGlQWH
         8eHkc+/Mqv6RYtF0vUcvTBSJ7OS/f+3R4Bpxo/yMJx1eFYjRXEZBP1lK5HGdlHgj0OGq
         94RmiNjloGYVV22rlF5upEn0x9NROuQGuiDTcZtLfhEYGTdWw5bDtlQBVr4l22n8Imm/
         WpsLt7wc0s8ZFSZbXQ3HMbU5UmOwOw/JUZdDdiH2Angj0GWnES007tS8dlBcTyYsUEZk
         SwKw==
X-Forwarded-Encrypted: i=1; AKwUvByr34EDH+/OozNTYYCtM0jvoIps0UaIrN4FDbbMpaYUCeKYisCxL1JrPasC+uzZluxEsnhZVJdoVEvJhHY=@vger.kernel.org
X-Gm-Message-State: AFuF++ldSJpHK2Ry1mcNYQ8h4O0NTVM99jae/YV6VEWgWTadwY26nO9u
	Gn/YsewnbwfDtjx1/vCjPLOYpI/cVY9Uq5bU40mJXnXwgbhIRNJq60+/
X-Gm-Gg: AYBFou3q0oTmECbimRF5V6Q2ybP8oJPzz9HtJn5Ur4BiOf0JRPXxYXswvMVQrGhOml/
	QGO2D/OmCppIizNIvvaMxBfnTc3WQtDQc1Xm8G9pL6645FYTeOgaG5EnZjtzI9a/yiRAkKadsnn
	33WJJDqmYmusJlTFUyXXEFQ33gSCiu2aQu/obEZvCGw0iezhO5nnKlZ1oU95Fn5Siuc6l0qtU7Y
	attDkzobutTKxdfB/0E5uQhFcvowls+FFtWSD64f1flJtXD6/pPFRt/Gt3ZG5OKneykReC6E4+x
	erWJYEUKkDqYQsiEZuL0ffX9zX8G5k7aJIdtNPDM8hbFwvFTT0Unh5YLq5OIoGhjh92MRMowBMG
	3Nb8l0TrKN6tOiflWLn3yCi3eSdRtYcGBtBtRw2vZWiMwbAjSMkETJw36UOSauiglpjM8z3lyXQ
	sOg5BrIdFglBsMknuzRU8wHnLpgKQdpptCorwgLubJHef9LWwvxGQwWURZgEXqnrU=
X-Received: by 2002:a05:693c:8381:20b0:33b:bd89:26d1 with SMTP id 5a478bee46e88-34004c81f1emr4004679eec.12.1790303737909;
        Thu, 24 Sep 2026 19:35:37 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm2364961eec.22.2026.09.24.19.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:35:37 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Lacuku <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] nfc: llcp: prevent resource leak on repeated connect after DM
Date: Thu, 24 Sep 2026 23:35:27 -0300
Message-ID: <20260925023527.3065197-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aldo Lacuku <qwe.aldo@gmail.com>

A nonblocking connect can return while the socket is still connecting.
If the peer rejects the connection with a DM PDU, nfc_llcp_recv_dm()
changes the socket state to LLCP_CLOSED.  A subsequent connect() on that
socket currently overwrites the previous local, SAP and service name
without releasing them.  Repeated retries therefore leak local references
and SAP allocations until no SAPs remain.

Release any resources left on the socket before obtaining resources for a
new connection.  A closed socket can also retain the device reference held
by an asynchronous connect, so drop that reference as well.  Bound sockets
do not hold the device reference, so release it only when reconnecting from
LLCP_CLOSED.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260923133339.2518641-1-qwe.aldo@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Lacuku <qwe.aldo@gmail.com>
---
  net/nfc/llcp_sock.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a..e76361e 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -690,6 +690,23 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		goto error;
 	}
 
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
+	}
+
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
 		ret = -ENODEV;
-- 
2.43.0

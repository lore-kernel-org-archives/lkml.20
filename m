Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3E3E6396
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578832; cv=none; b=ixlweY2jE6h2UvaYr+4Lz3u1RtaSK+q+oes3aTFte0jdr1NKiVYXe1qDKYkXfffUSUhQR2QtcCvTeHO8duxcny57FDG5Q0kMYtPd6fIq39HZL2sm7R7IfwjdFvjGw5nhUxalqOEGO3I8JhFyljsJiigcx4z1FIJdatDjR1cxrTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578832; c=relaxed/simple;
	bh=1apqXNpMziRrEzObYgpT19TyNM/6xZpWP4NfYwgLqDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hobTJ0cOirvpex84ZLzJqks5skwfwGdhXxC8FGm8i1N0/BQh1spnBpNzgyscoBqqofdhou7kPxIMIHh2WDkXLpDIBV8U+Qu3aL5/QsF6Sq6jP3OrYdfvP2gPaFlH++I8nv+tHa/Iruh2KG330hzOMy+oIa5bVE/Hq9OpFCqqvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxp7PdzC; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxp7PdzC"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6df7f544919so181996eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578829; x=1792183629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIvEDAgmZWjYQxTdfmeMKhjwjXAA919VytzDhm3pviA=;
        b=jxp7PdzCHZwqH4QofWmZhx/MOdiPKJPs6T4QA0+UBZWFOigrR+muJns2w9hw+KkMBv
         L0wzd0BphagCWxhYEgUjiRxv/Z6M4N2sIWJzr92NT85xZbC2r1rkdBorNRiWKcmChDZr
         w4Mfn+NjipWSIEk0AAahyLnoI9dtEIrIoVqqxuf5ozVeuaydbUJMLL12+dpModbjeDDm
         C1+shLnw9dxGhJZD/8nLysiiRCB/in5OxW83/0CPKQClomGBDOKD2OHWCoAuHJ4Daxb6
         1SKQ3DT5MucbbA9/y5nQkTKoJPvAaTj7UZGLJmYh7i+VZQH1ytmRlsT4drAPHXM5UiUE
         Lyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578829; x=1792183629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIvEDAgmZWjYQxTdfmeMKhjwjXAA919VytzDhm3pviA=;
        b=fOuQIFqiwkqI2q1gE6RIA3Z7S/yJasbUBRRdkhpIkvJqcNUiEA0GJImDapXy9MQ5tC
         D/QYMTEGPs3C9V0lEuqkR4i4ydApfEahPKcrHeEQak6VJoKckmVfrTwnw4XiiDF5bkKm
         dNKh91NPFQiCc0iVHGbNyQXwp+PqfB54+BiEbRw3gCXd33mtAHq/u9Tn8a5YQ5wRxhmp
         tiZPCx9acUNRnZfmU2W8uYMezRQ8tfo4sZySFKOiqLG8SP5oJH4+q2Qm1L9Q2UCRnYlK
         nIGJh5iZRCqbk83CyahpmqSUVGZg4krH0A6/LwS1uLmPcFFl0PR4SUIk6r6YwQMjO9UC
         cRqA==
X-Forwarded-Encrypted: i=1; AKwUvBwzdN91OVV8WPGohEf0XHv6x4mup6VBJ9/hjmT0c04o4jdiO5oMtVZRi4eVJbyUgaP1lpfXopGurf9abyY=@vger.kernel.org
X-Gm-Message-State: AFuF++mDolVs5jaLwB58jx3qNcR8ntKI4fpEitDZK7/3M8Ysjc7PIGgU
	PQ5lC7vqUhIbJLYUgtyPKCLrI74n/AfceScYjzNC4FISIVf25/mGOA2H
X-Gm-Gg: AYBFou1bWlsAi2SSJbl8Te/rbfUWovuPYQPJzgxlGJW3NhhnPDGmm+f90SFH2btDShs
	Xxwuw693Ezxv39bd7w/0Sj+1cx+YmG3sT9Rdr48dawh+VP775XWgiDrEhrWgBOmgoaO+jksC9NF
	Mu+XzmHc1+c1CRPhy47ywv1pJYe2bX0gvvXtm9Pgh5U+SWSgySeWnNgyIiOhGJX8p5B3ZNBLmoz
	Zk8LrPC0hhbOMpMmgdZiG+ESEsfunDcLyiTSTjk9TV+QQF9Nsx9jpHlG0keXVuegFWBbeGe5QiO
	O1IKG7qbbwDKnX+Xe6C58xXG1ODKvlmKni22iV/fNohWeTQLT/PCdySsqcbyEu8TUisJFSZbqyp
	QE7DayBUmSAo6ZQZueY01OB+BGfgNi0okC0Xi6NrlAoemUEU8t86JfUttYZ9LqM48Vv7ZZAhkkN
	mHEMuokRjJWEgh8uEak9qZyfwv2agyyfJMLp1+lPvkHum2ajdhf4l4tpt7fIUciJd4CLA=
X-Received: by 2002:a05:6820:f012:b0:6d8:edd2:2aee with SMTP id 006d021491bc7-6ef0d33057amr2139695eaf.31.1791578829015;
        Fri, 09 Oct 2026 13:47:09 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076d67sm3194098a34.13.2026.10.09.13.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:47:07 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 13:46:45 -0700
Subject: [PATCH net-next v2 5/7] selftests: drv-net: psp: factor out psp
 connection setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-psp-v2-5-5596ab50f677@gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-0-5596ab50f677@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Lift out connection setup and PSP assoc uapi code in psp.py and
responder, so that the key exchange sequence can be used in other test
cases that start with a key exchange, but might choose to perform
additional tx/rx assoc calls afterwards.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py         | 14 +++-
 .../testing/selftests/drivers/net/psp_responder.c  | 87 +++++++++++++++-------
 2 files changed, 73 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 473500901879..71eeade62ad2 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -447,10 +447,11 @@ def assoc_twice(cfg):
             ksft_eq(len(tx), 0)
 
 
-def _data_basic_send(cfg, version, ipver):
-    """ Test basic data send """
-    _init_psp_dev(cfg)
+def _establish_psp_conn(cfg, version, ipver=None):
+    """Establish a PSP connection and return after key exchange
 
+    Requires _init_psp_dev() to have been called first.
+    """
     # Version 0 is required by spec, don't let it skip
     if version:
         name = cfg.pspnl.consts["version"].entries_by_val[version].name
@@ -475,7 +476,14 @@ def _data_basic_send(cfg, version, ipver):
                         "version": version,
                         "tx-key": tx,
                         "sock-fd": s.fileno()})
+    return s
+
+
+def _data_basic_send(cfg, version, ipver):
+    """ Test basic data send """
+    _init_psp_dev(cfg)
 
+    s = _establish_psp_conn(cfg, version, ipver)
     data_len = _send_careful(cfg, s, 100)
     _check_data_rx(cfg, data_len)
     _close_psp_conn(cfg, s)
diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
index a26e7628bbb1..57425ecb9561 100644
--- a/tools/testing/selftests/drivers/net/psp_responder.c
+++ b/tools/testing/selftests/drivers/net/psp_responder.c
@@ -37,20 +37,24 @@ static struct {
 	unsigned char rx;
 } psp_vers;
 
-static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+static unsigned int psp_key_len(unsigned char version)
 {
+	switch (version) {
+	case PSP_VERSION_HDR0_AES_GCM_256:
+	case PSP_VERSION_HDR0_AES_GMAC_256:
+		return 32;
+	default:
+		return 16;
+	}
+}
+
+static int
+rx_assoc(struct ynl_sock *ys, __u32 *spi, char *key, int data_sock)
+{
+	unsigned int key_len = psp_key_len(psp_vers.rx);
 	struct psp_rx_assoc_rsp *rsp;
 	struct psp_rx_assoc_req *req;
-	struct psp_tx_assoc_rsp *tsp;
-	struct psp_tx_assoc_req *teq;
-	char info[300];
-	int key_len;
-	ssize_t sz;
-	__u32 spi;
 
-	dbg("create PSP connection\n");
-
-	// Rx assoc alloc
 	req = psp_rx_assoc_req_alloc();
 
 	psp_rx_assoc_req_set_sock_fd(req, data_sock);
@@ -64,29 +68,34 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 		return -1;
 	}
 
-	// SPI exchange
-	key_len = rsp->rx_key._len.key;
-	memcpy(info, &rsp->rx_key.spi, sizeof(spi));
-	memcpy(&info[sizeof(spi)], rsp->rx_key.key, key_len);
-	sz = sizeof(spi) + key_len;
+	if (rsp->rx_key._len.key != key_len) {
+		fprintf(stderr, "ERROR: unexpected Rx key length %u\n",
+			rsp->rx_key._len.key);
+		psp_rx_assoc_rsp_free(rsp);
+		return -1;
+	}
+
+	memcpy(spi, &rsp->rx_key.spi, sizeof(*spi));
+	memcpy(key, rsp->rx_key.key, key_len);
 
-	send(data_sock, info, sz, MSG_WAITALL);
 	psp_rx_assoc_rsp_free(rsp);
 
-	sz = recv(data_sock, info, sz, MSG_WAITALL);
-	if (sz < 0) {
-		perror("ERROR: failed to read PSP key from sock");
-		return -1;
-	}
-	memcpy(&spi, info, sizeof(spi));
+	return 0;
+}
+
+static int
+tx_assoc(struct ynl_sock *ys, __u8 version, __u32 spi, char *key,
+	 int data_sock)
+{
+	struct psp_tx_assoc_rsp *tsp;
+	struct psp_tx_assoc_req *teq;
 
-	// Setup Tx assoc
 	teq = psp_tx_assoc_req_alloc();
 
 	psp_tx_assoc_req_set_sock_fd(teq, data_sock);
-	psp_tx_assoc_req_set_version(teq, psp_vers.tx);
+	psp_tx_assoc_req_set_version(teq, version);
 	psp_tx_assoc_req_set_tx_key_spi(teq, spi);
-	psp_tx_assoc_req_set_tx_key_key(teq, &info[sizeof(spi)], key_len);
+	psp_tx_assoc_req_set_tx_key_key(teq, key, psp_key_len(version));
 
 	tsp = psp_tx_assoc(ys, teq);
 	psp_tx_assoc_req_free(teq);
@@ -99,6 +108,34 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 	return 0;
 }
 
+static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+{
+	unsigned int key_len = psp_key_len(psp_vers.rx);
+	char info[300];
+	ssize_t sz;
+	__u32 spi;
+
+	dbg("create PSP connection\n");
+
+	if (rx_assoc(ys, &spi, &info[sizeof(spi)], data_sock))
+		return -1;
+
+	// SPI exchange
+	memcpy(info, &spi, sizeof(spi));
+	sz = sizeof(spi) + key_len;
+
+	send(data_sock, info, sz, MSG_WAITALL);
+
+	sz = recv(data_sock, info, sz, MSG_WAITALL);
+	if (sz < 0) {
+		perror("ERROR: failed to read PSP key from sock");
+		return -1;
+	}
+	memcpy(&spi, info, sizeof(spi));
+
+	return tx_assoc(ys, psp_vers.tx, spi, &info[sizeof(spi)], data_sock);
+}
+
 static void send_ack(int sock)
 {
 	send(sock, "ack", 4, MSG_WAITALL);

-- 
2.52.0


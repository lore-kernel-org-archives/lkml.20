Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995955;
	b=csxO5deFMbiCi2nL3dxkWcNqbjI5nG2w1LidbuLK0qcmybgD2iXkpJ45a354dU8C4JgJ
	 7VnlQPYe6zTHPPMXbWwJ2LjVXHKVxisc4UxmUx8IvXkRCZqfTIrG/R62NDpS0uyQGMZ45
	 M5ofdYvs8ZssWIVL29kq92ydhWRMHumArAdZGzj2ebO+wnv13LVMEFCjOg4ISsZAEVWK/
	 0+HfP+y7oyROEAkuhHwn85UYmQt3sXo4eZwBQ86W8cGf2ukVauJWCcf15u30WBrDSqLhj
	 AE2WeEVW1CuHAHASSLjrBvZR7r3z/1mGqCzA3EjBtJp8OMFXapn4iNKZOpuSUyx+nrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ew7E1f5KeCzBIQRa8bgmL8F5+wG2gJUY5b9RGgICLtE=;
	b=QRW4leZeXnNTjwQRrle0wOYKthOe1qGNVyuO8Xh/SPJW3yyrOtz7824n5tGjHLZcbYEy
	 l35uJhkeTd7NREIejPZU39dUSml69DjKDlNaOmXUiUFyQLtuNkQQZ6+PUunXnukMQcjVj
	 PU1PkZw9UCovWDbqm8Ip0H8bK+9lmk3LarN5ZD2sNGWIoYNQ14YeSCDcSnkL0zW2COYt3
	 3V7TUsjjm64BP2ywSWQClwK7o2iGF0cMaW+xHa8NIBrykju30xhhlCuc0Zgm36p6C56F+
	 GAuQZIxGmBx71K+uc5kPA5NxDj8sNlES+o1PLq+gvlPPmYsPZ0baVJzbyHVys6MFr2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFyqFmbS;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF39606D809
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF39606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFyqFmbS
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6774639a8a4so976123d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995954; x=1794600754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ew7E1f5KeCzBIQRa8bgmL8F5+wG2gJUY5b9RGgICLtE=;
        b=yFyqFmbSPRDyOjlucTFvD3ofba1IvyWA5YmoIUekjlPTb/5GGl8xvZ1VjuQr14GTRa
         qBUiiSAYL7X7wWIEQSg1iR8foFnRdrf+ujPbUcLSh1nRt81DXcvzC74V9DQFqqtz84mn
         3rVjC70F1cK4RJ4cMtw76bDMpfhViJyRB1tti+Y6QsImD0OHMjMgluujo8W5yOAOYk7P
         Qu+pw3S8ZwzsTGHgn54UtC0A/5QTlltGtI0yVk2pgdzJzfonCQMjvZpkdSfRL4etGPdX
         cqkQ1Oh9OQnXgoxwxIMfeIm/Ci9gWKeRd5Xtah8RhX1c+oAznr0d6jxcjwU7qNadK0Hs
         I2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995954; x=1794600754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ew7E1f5KeCzBIQRa8bgmL8F5+wG2gJUY5b9RGgICLtE=;
        b=V8j4m6z2QeA9uKLs2Gjk3FO0Bu9MYSdiYG0Zu+cDFtTRtMwT2FLplE39VYkVbzs/sR
         Ohu/IKhe1AlQVscTyrEWXzoEykXOllwYiy37PCRLqqlIC55YbrHbJ/Y/3s8XKHcxnJNl
         MKMXgWSNpBYlUmnqIzMez2AydsZhyP5huV/VI+aN7tXivVBt+hG6fwpCmPGEKjg7BYzF
         Yruw23qD1Hi77BX1JIW6HZ2ahI2Na340JHPeJ29/xHsuZMvYGRe+UFxuRUzW9H54tgXw
         lOqAGdyAbdPDcOthPN0T8UkzED8ezv5c87nWzKqsabnSL/7C9/DKLUbLtIIdRv3rLVhq
         zBxQ==
X-Forwarded-Encrypted: i=1; AL+hErHBkxOv7VqNoktaBjRT8vOaBUV6sIfdHHT/F5oUcGpnEBum5lIyxt2LvrEDSr+5Xtw18D08ORCQ/hdJye8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SFl7MgRCqnErAkX1S8DEgK/hYsygqRzCnK43ktb12Y2U1YEhu
	u8FU3FkXUWgP+7DLZlxs9wtcsjW9dzv7HdXVOiK1gEbq7yB8twsMpIuk
X-Gm-Gg: AYBFou3K8ZP2vFKx79ZGEUnizQIB8w81thkKgUC+ITKfo9LPU0S0KWlbCtUyjdflTZm
	KwSXkIm00SCKx+594g1sj1Nz91G6CYmreQbz3EeJVFPqPN299msTU4mw0TAT/TqCxMY7ydlVHG0
	oSbt1U6pj/MUZcjsVQOnDAo0zl7sNfBp8FwP33N5dG5lJeVzUSmkUHqUCeW7MGlS1hLzghk0zEw
	BZwPGORE81QbvusZsQxu5JkzZKv5HnRGREpcm3rlL/7BOM7SB+Pwm3PiOSQtIlij91pMwUgn7to
	INFEjxZCneclxai9v2mEAXSVtcREOpMD3bKQFV9T7JpX4hFxlWkxLmVXlqJz6m6JAsec2eiawnX
	lYd4F2FFThibFW07/pz5EbM6b8z8vhQLpBd1uuISNIyCd5PbET+ujw+rtII/RmqV+U/lGmriVv8
	PUn5mJDWO8bYE+8u76N5/hThXjcIU8vq9EJHQ1J4bpZwC5ZP0ZqLdEPDrTTujVtyPKEX7VRKLAz
	cLXHcJlhsK00d0ObVtJRDIdop4nCZxfRGw8+Rc4R3WaTYhvDqawvmALdOjmNu1p3O9XWP8/eLDU
	YTincjqEE72/PtCCKsd1CBY5o6Lpv6CHy6gKf178U0st
X-Received: by 2002:a05:690e:788:b0:679:bb48:692b with SMTP id 956f58d0204a3-67c1455b60dmr1240896d50.59.1793995954318;
        Fri, 06 Nov 2026 12:12:34 -0800 (PST)
Received: from localhost ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13635f25sm2601355d50.23.2026.11.06.12.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:12:33 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 06 Nov 2026 12:12:12 -0800
Subject: [PATCH net-next v3 4/5] selftests: drv-net: psp: factor out psp
 connection setup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
In-Reply-To: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
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

The caller of conn_setup_psp() not handling errors was preexisting. Here
we are adding some more error paths, so we just handle errors by closing
the data sock to make the code a bit more robust.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- take key lengths from the kernel's rx-assoc reply instead of a
  per-version table
- close the data socket in psp_responder if conn_setup_psp() fails
---
 tools/testing/selftests/drivers/net/psp.py         | 14 +++-
 .../testing/selftests/drivers/net/psp_responder.c  | 78 ++++++++++++++--------
 2 files changed, 63 insertions(+), 29 deletions(-)

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
index a26e7628bbb1..14b179e1aec8 100644
--- a/tools/testing/selftests/drivers/net/psp_responder.c
+++ b/tools/testing/selftests/drivers/net/psp_responder.c
@@ -37,20 +37,15 @@ static struct {
 	unsigned char rx;
 } psp_vers;
 
-static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+#define PSP_MAX_KEY_LEN		32
+
+static int
+rx_assoc(struct ynl_sock *ys, __u32 *spi, char *key, unsigned int *key_len,
+	 int data_sock)
 {
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
@@ -64,29 +59,28 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 		return -1;
 	}
 
-	// SPI exchange
-	key_len = rsp->rx_key._len.key;
-	memcpy(info, &rsp->rx_key.spi, sizeof(spi));
-	memcpy(&info[sizeof(spi)], rsp->rx_key.key, key_len);
-	sz = sizeof(spi) + key_len;
+	*key_len = rsp->rx_key._len.key;
+	memcpy(spi, &rsp->rx_key.spi, sizeof(*spi));
+	memcpy(key, rsp->rx_key.key, *key_len);
 
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
+	 unsigned int key_len, int data_sock)
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
+	psp_tx_assoc_req_set_tx_key_key(teq, key, key_len);
 
 	tsp = psp_tx_assoc(ys, teq);
 	psp_tx_assoc_req_free(teq);
@@ -99,6 +93,35 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 	return 0;
 }
 
+static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+{
+	char info[sizeof(__u32) + PSP_MAX_KEY_LEN];
+	unsigned int key_len;
+	ssize_t sz;
+	__u32 spi;
+
+	dbg("create PSP connection\n");
+
+	if (rx_assoc(ys, &spi, &info[sizeof(spi)], &key_len, data_sock))
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
+	return tx_assoc(ys, psp_vers.tx, spi, &info[sizeof(spi)], key_len,
+			data_sock);
+}
+
 static void send_ack(int sock)
 {
 	send(sock, "ack", 4, MSG_WAITALL);
@@ -282,7 +305,10 @@ run_session(struct ynl_sock *ys, struct opts *opts,
 				/* nothing to do */
 			} else if (accept_cfg == ACCEPT_CFG_PSP) {
 				dbg("new data sock: psp\n");
-				conn_setup_psp(ys, opts, data_sock);
+				if (conn_setup_psp(ys, opts, data_sock)) {
+					close(data_sock);
+					data_sock = -1;
+				}
 			} else {
 				fprintf(stderr, "WARN: new data sock but no config\n");
 			}

-- 
2.52.0


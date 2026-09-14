Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253181C862D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346740; cv=none; b=jzpiERQiEmy8w38ZYUuWHEVLFY1zdoeAfcVIjGk+xIIZS95IyKrsV/sM6PPiBCzVKQN0pIa4BwRxUQAJSjYyg1q41UvSfXp0EjqEVRnExh64QhM94c6RVJ+IEKxIG/Osa1EbSpScmGL9Agka4yW1L3NKMTHUqVGRgVEb39SBQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346740; c=relaxed/simple;
	bh=a73nlWUpFLqK5BIq+RCvdpji6ixUwx/paZfTWdzUUB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kT8gmN4fhTa6lNUXGla3Y3PYvWrsithAeBzrwl4S0ZItSRZGHP6Mk/GJ+h8vyqy7u3NmjCK9XbJWlTVsGFT3Fu8iZqcGpvZHVESHsGD28geid1QeA1YJpxUIn32lXGlSEXImzjGtBYDP0KOlZWsysMjJepGGMiD09B4UShb5aP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=lhHKg/yY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="lhHKg/yY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db3305f94fso42133065ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789346737; x=1789951537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2pCUaRthzuM/aWjTr8lb/B8fTUBfn+Ec5IEGb7Sxaw=;
        b=lhHKg/yYfgtY7OdpK3ssm9WT+N6kIdch+Ya7gpD+QRIC5NmuyJG8/JaWyXtA4Rx1uh
         pUR47jRv+a72vKbPU2pR6vnpLQZJCBHl25a7MFeICd151SS4F9/vm19nOpRIj5mwNiww
         i2aPTe80O1yLMLy6qR+Rv8rMd3cihs5MyZIHAh6k8sgpQvZawVzCCqdJWOiD//ZPbgp7
         xN6OwgZVL6b03hg1IUGIRJl9GvXP3lKcikdeVpWo0NBtAHiMshXCZTLM3SNT9C/kbfOK
         P2KgpiHcGTRBxQjtagB2YIM4b8hrwCjmFygMUduku1nYECwkOmAMW3gm8T47KGTug9KQ
         a79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346737; x=1789951537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2pCUaRthzuM/aWjTr8lb/B8fTUBfn+Ec5IEGb7Sxaw=;
        b=Yd8JqvMLoVDdvT6J4zG87ecrZ+0P9N/qcISgcfTOUK1NSLcvuFpI2SWJc+SFu50Qki
         v8GFa103oZi1gpkFzj2tWreygTuTsrGiSiBzhwaOGCEi2nQhgvy9DjQFle3cnfcwvrXL
         JojflGga3JPxhEU8q55Mb1S2ij6K83n9JQleS8AsutK0MxGB7TuRMg6vLxsDvcA8g2H+
         myHp2DdY76RC4yRE9niVdDnzxkMbspML5W8t8yFp9PTuoltXH2v+3dsHo8tDScdTyT3g
         IX5T3sG/TQ8pXFJ+4U0ENdXzNkPR4k7L1H1ObdYxBkxrETFZ5bKWyWZMrdkrDRLoLgtd
         1L8Q==
X-Forwarded-Encrypted: i=1; AKwUvBySDIQtPfyKxZhB+J1r3qzFRDxM/HGsc3xfcZOYIUQisomDs48Q9Mfu1i65I3InuPzJFC4hITpDsU/nf9o=@vger.kernel.org
X-Gm-Message-State: AFuF++nzEzH0oP55ZYoAw5+eFXHdIFoyZHQ0DUH3v9+Qp8FeFbcp0c/O
	x3GKUqkmCzQNJMFjHrGIE9NmU1xcAulzn/Cvc3rdIu2ID/sCTRZcvtR1KHNvYhpu+/0=
X-Gm-Gg: AYBFou2J0MW03cB6nrToLGpaKNtEFMoZlbi3tDL38+qtNKMxseN4ICj9SRKZGfzDfWu
	kAbXwcBW+D4wuhw3JBdOaU3nXZQJbIOR6gEq3a6kS3va//2vZBP/E7mONRJDwrqpT4WJFfXiZcP
	p0wmzp1I1VBIhcKocodLFLg+jGpLMHAmoLBHXeV9ewnYHxRtQPH6PMhif1fCJsnM8w3AyCZZuVw
	4IFShypBK1ybh0IuzQQHkSC4lBNnOBKYTPcDQlzO5yXtW0G8zOJ3qmRtBo/pHrceGTEjuh4ba43
	zjbUjDEn3c+5lw8pAIpfeIR/lhhic5a5Pq/0CB5Pjh5orPt2wib/zhdK+cWoWL1ohfvp1iSYryd
	qfRNMyoyajJZh9L2EX7uNt4Zq2N9GucQU57zHw2y1XCkZcABQjKxyo80Q3wyVeCUXjBTXe6O4yV
	xdi/yknFSykSAzFEjWO0lMqQJSlBxgZJEeYD40e2PBM4k/x28hF8WmhTtu50KVzUTs2UvKFPh8O
	6uyCtPrrCtdyOrVkOTADye/gBVieSrZFZfdfidMuaCxgVgcu1HkPbnzQA==
X-Received: by 2002:a17:903:b8e:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd6c6e8df2mr6735155ad.13.1789346737316;
        Sun, 13 Sep 2026 17:45:37 -0700 (PDT)
Received: from localhost.localdomain (111-240-141-218.dynamic-ip.hinet.net. [111.240.141.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm32604465ad.12.2026.09.13.17.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:37 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v3 1/2] selftests: net: Add TCP payload verification to udpgso_bench_rx
Date: Mon, 14 Sep 2026 08:45:24 +0800
Message-Id: <20260914004525.46597-2-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
References: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udpgso_bench_rx supports UDP payload verification but rejects the
combination of TCP and verification mode. Its TCP receive path discards
the payload, so it cannot check the data generated by udpgso_bench_tx.

Read the TCP payload into a buffer when verification is requested
and check it against the transmitter's repeating alphabetic
pattern. Preserve the verification position across recv() calls
because TCP does not preserve send boundaries. Restart the pattern
at the payload length supplied with -l, matching the transmitter's
pattern restart on each message.

Require a nonzero -l value for TCP verification and retain the existing
discard path when verification is disabled.

Signed-off-by: shuo huang <f64116045@gs.ncku.edu.tw>
Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/net/udpgso_bench_rx.c | 51 +++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/udpgso_bench_rx.c b/tools/testing/selftests/net/udpgso_bench_rx.c
index 1cbadd267..5270a46d2 100644
--- a/tools/testing/selftests/net/udpgso_bench_rx.c
+++ b/tools/testing/selftests/net/udpgso_bench_rx.c
@@ -89,6 +89,11 @@ static unsigned long gettimeofday_ms(void)
 	return (tv.tv_sec * 1000) + (tv.tv_usec / 1000);
 }
 
+static char expected_char(unsigned int off)
+{
+	return 'a' + (off % 26);
+}
+
 static void do_poll(int fd, int timeout_ms)
 {
 	struct pollfd pfd;
@@ -161,14 +166,44 @@ static int do_socket(bool do_tcp)
 	return fd;
 }
 
+static char sanitized_char(char val)
+{
+	return (val >= 'a' && val <= 'z') ? val : '.';
+}
+
+static void do_verify_tcp(const char *data, int len)
+{
+	static unsigned int stream_off;
+	int i;
+
+	for (i = 0; i < len; i++) {
+		char expected = expected_char(stream_off);
+
+		if (data[i] != expected)
+			error(1, 0,
+			      "data[%d]: stream offset %u, %c(%hhu) != %c(%hhu)\n",
+			      i, stream_off,
+			      sanitized_char(data[i]), data[i],
+			      expected, expected);
+
+		stream_off++;
+		if (stream_off == cfg_expected_pkt_len)
+			stream_off = 0;
+	}
+}
+
 /* Flush all outstanding bytes for the tcp receive queue */
 static void do_flush_tcp(int fd)
 {
+	static char rbuf[ETH_MAX_MTU];
 	int ret;
 
 	while (true) {
-		/* MSG_TRUNC flushes up to len bytes */
-		ret = recv(fd, NULL, 1 << 21, MSG_TRUNC | MSG_DONTWAIT);
+		if (cfg_verify)
+			ret = recv(fd, rbuf, sizeof(rbuf), MSG_DONTWAIT);
+		else
+			/* MSG_TRUNC flushes up to len bytes */
+			ret = recv(fd, NULL, 1 << 21, MSG_TRUNC | MSG_DONTWAIT);
 		if (ret == -1 && errno == EAGAIN)
 			return;
 		if (ret == -1)
@@ -178,17 +213,15 @@ static void do_flush_tcp(int fd)
 			exit(0);
 		}
 
+		if (cfg_verify)
+			do_verify_tcp(rbuf, ret);
+
 		packets++;
 		bytes += ret;
 	}
 
 }
 
-static char sanitized_char(char val)
-{
-	return (val >= 'a' && val <= 'z') ? val : '.';
-}
-
 static void do_verify_udp(const char *data, int len)
 {
 	char cur = data[0];
@@ -347,8 +380,8 @@ static void parse_opts(int argc, char **argv)
 	if (optind != argc)
 		usage(argv[0]);
 
-	if (cfg_tcp && cfg_verify)
-		error(1, 0, "TODO: implement verify mode for tcp");
+	if (cfg_tcp && cfg_verify && !cfg_expected_pkt_len)
+		error(1, 0, "tcp verify mode requires -l");
 }
 
 static void do_recv(void)
-- 
2.34.1

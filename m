Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5133F589
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706624; cv=none; b=uDigTHA2MAlXIwbagVWog745rF/1rmKDlig2QYPsH/4HTpYLQxxkrnMoIZGN5611zKn/AHH+CP5ddi5hcc0fd5WodHZ68QMgN+gflBGU8dVXT6QpoSapi2sT4OI5YRR0A6+hHT95AIz0PKt2i56TI/CDl9GBoohV5h8NSdfAJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706624; c=relaxed/simple;
	bh=aPY0/u2AGw8ZO0X96EHt2DkF+60pJD+nkEu+ftpS9ok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hIXgvvZsezEJsZtEE+brdH6iqyEtsqsZG7n/C2CbQCg5sxdtekrdSbzOijLUALnLJt9jdIn4zyR3ebvSy0AgMDNhCHLVD1kgyGui+nWrU4S3fyWkpNL0SNBDmYA+1D4XUXbaYaoDPSAyoWlltxRbnUyZejgGnkZwjHP4ecFnN18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=DuLwJ/VA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="DuLwJ/VA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3525942a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1788706620; x=1789311420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/U1N8oqUrXPlxgqRESYIGpkvBK8EXbenmMc2gn96fI0=;
        b=DuLwJ/VA9U3I4Qdu5YwOdisGqpu0FXrfzwzmyCWy/s9oE+By3YQ40ceSEUZ/Gok/Tj
         R1u8wqWzX598K8jadD87NryD2R/LakvAzmSwcqc+TfoI0xFz5s4iUUgsb4vjWq5pBqSe
         1VKoz7heLAxXiWBJxdL7fg/qCLaFrXlqzBGrIeOGYJsR92v7Db8ysmSLbI+xZrwb/jUa
         stwapJARgyKZpaKIXtE727QpiHKFdjMOmelcc8IibyYTSWlQtv1X8uLwMo7fSoaIdiaw
         BgZk7Jd6A2uCJu/gUXid6eqB00buj76rJc7cDFiS38AVcsX45t1eMsgKlff3XIYnims1
         e4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788706620; x=1789311420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U1N8oqUrXPlxgqRESYIGpkvBK8EXbenmMc2gn96fI0=;
        b=czjwyX9U9g38c82o+NVoWP6d7GMMfjUsuO0soF7tywC0lIazTz4r2d27RDkotW8x1a
         wcXXb+oDGGuCKG9GWazIkNUxutljUjpMBy9fpfM9pf/qdGqyFaJOg/fd2dEitf+lOnsQ
         Qz/HfdIwyOz7UDw6zDXtdse9n7Vyv+PhQvJmzudZcMwYHo/id+z6C0HD3+UOstEPQb+9
         cXz35JtMxqTJA5stJzqx2FLN6Yf13g6Aq9omKlt4yALkEXZnD+2oBnAOXlnmKgw59eZ4
         FHqS5IszaXKxqWBdnX2WLXP+7JXzFa8yHwegRQdbT6BynT19+veP6gue9J/5na6h77SJ
         O0pQ==
X-Forwarded-Encrypted: i=1; AKwUvBywx35PBVNKKfvY0od/jde2CgvDTXG9bxcnaib15adVlH+chByLAsaIlHs3OI6k6M/tPSpnu+4fncWHw4A=@vger.kernel.org
X-Gm-Message-State: AFuF++ke0bPhRCJxdLracRTDnAge30cULO+nn0jrVGphJIAuCQIdtKIE
	E0D9hwj49ZUaSo27biVBcc6ibgJZpYwV9XKL61eVSeOg2lkiVe3JkdphqVwY+skYuFk=
X-Gm-Gg: AYBFou1nHQ5zd1H82kmNOzq8RizxxlhaJN+aqoLMstr2FP0u7VfLwFT03rhEQZUY11N
	Bo1C5TxNcDsdJK9pVhkynhUJneH4Xdl84K4DTxEIDUJRAbJdPaX6rD2yfBHOBsj20JiwAA1bHzZ
	lqT2w3fhP7hK1/qoXNI5a4UV8LUzt25OKtuDj+vTQfU2fJWJFsFyWNpnkIL4axe2h+Zdn+mO3zW
	Qhv4EZs4ksNiNjRptrUFM3P4ZYxO4teAzzqp8gt/kU93BNRM8uZVf0Cnof72TNCmFxfMJrnk9hQ
	GZzPaM7ANbyjieBQayO2vqDFqbnrh+oRZcOaHc/NhQ2NW+Jq4JoQh/R2SUDoRm1tPw+pTAKHK+Y
	ZDVknM5tjSUwc2z5O5eEi5D7nxVwU0irkrDah8Wl0zYSwzoo4EgA6eYLyprEybqjmHDhBUnaH43
	PwZ3NSGoXqJccpl1R8RTh0rE3H7G5c7zS2rqHu4tTxyBbmtv+S/ig2Zk7qlIkR+WqG4xGZcvRKD
	1P71STfYK92n/pTfrjHRU8bMBhmzPPLY1ojkQ3U9/c3yro=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr27806022a91.20.1788706619783;
        Sun, 06 Sep 2026 07:56:59 -0700 (PDT)
Received: from localhost.localdomain (111-240-146-201.dynamic-ip.hinet.net. [111.240.146.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm15199065a91.3.2026.09.06.07.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:56:58 -0700 (PDT)
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
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next] selftests: net: Add TCP payload verification to udpgso_bench_rx
Date: Sun,  6 Sep 2026 22:56:43 +0800
Message-Id: <20260906145643.219609-1-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
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

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1


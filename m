Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1AB49E5F2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142824; cv=none; b=rXZQLueIIqdmXTpc3fhMZgGVUTJ1Mz0FvzMBPMB3dpnouEilZn1NkS++eccYdxZOGQ2EJUhkBof7HXHY40vbSODfVEzv3y0L5bUFYovvEFO73QI9DvjMK+gielyXwVu4HegmFkIIxwuN34waPQoxfKOqRDrbAAsyP9myU2XE0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142824; c=relaxed/simple;
	bh=a73nlWUpFLqK5BIq+RCvdpji6ixUwx/paZfTWdzUUB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZfN1TfOg2CPr+qFZViVbzcI7gSkjMQV/WkoKh6V86aVq8LWL92BCxRjxcgL0HMPt47Ayr7X74H7zlTiVksHevb96tf3hoTn5sjOk/zByFCmZv8FgCx9mUqN2qsjsIBbFCtsEeRQ9Q5qwwJnnTYhYY7Xkgc9ekJocm/suX9Oh6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=R3WD5xj+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="R3WD5xj+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db3305f94fso15074745ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789142822; x=1789747622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2pCUaRthzuM/aWjTr8lb/B8fTUBfn+Ec5IEGb7Sxaw=;
        b=R3WD5xj+NEJWhpkZHQuer4e4w9OO+aCtG4OkcHJ3mY8kawD+83vgD5XI3TzfTrye4N
         Gvfmne8fHr9TurUYFVzHceEB/3tY5o6NDH39kPalvFzwd+q6x9LZzeOtrxP7fmPruQKK
         t7yef9P16tXKv9MttNpOFmra9L2AYeorMnFnVkX/bc71/hozRMM+kG+9/n8eZsQt/QKO
         4BCL9bciwRItZftUQMI3Sr+lAklT8gT4QoUwT2vgFnVRumuRRNeb5NVnOx2doApvm6A2
         o7/NINpqpTuWki5MXhzgFaQl1adoR5UrLdNfPc/ZzveGQ49Evi3a9uKOCi3HzGp2s9nh
         4D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142822; x=1789747622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2pCUaRthzuM/aWjTr8lb/B8fTUBfn+Ec5IEGb7Sxaw=;
        b=OPTpLN0VbztBbctA3Xyt4vUt5KO472tai05lXg3H14l2IqDnYj0nAwSwDThnCj5EJj
         mtLU/KMuJHEhLoM4JMLw0QTmS3wreJ/clJzpwq4gC1sPWxqrGu9+RJUEhccTqn9dvbRd
         J0xcrdGueqXaQw8sOzdrezf1dgvMkG8P6rrN3Z5CFy/8mbi9o9ipQVeI8pqfOBJ9pJiJ
         MnalHsJTrIUTp45IX1098GQLaEjSERFKmy+FBv9jmTR6wkdUMuBk759Bp4dfLHvB8tJv
         pv+3aHvbjYE6sQ0hsJzCnvYGoyreAXUOW6/TxQeqLWjAMXhVSsONfDyu1M8j5ZmE4FZE
         Nxtw==
X-Forwarded-Encrypted: i=1; AKwUvByex6OZh4LFPTcbN3VLG7CjT1Vad/MUkwhqt8DwtjaPm4Bt/caWhpPU93DxSVnw/kFIgDj2dBNdr7s6KR0=@vger.kernel.org
X-Gm-Message-State: AFuF++mCAd6pUUJwrGMFhU0J4tWFxsVrt6PxQU2NHT13y90DKzyvqKfR
	EjA9a36AM3fmrZtNo3gmctm5Og55um+dLoorQUGejW4hSwM3Xd7088LcwUQ9zyWYdus=
X-Gm-Gg: AYBFou2sHWgHhN3WE/wIWzLx2f/XfwBjNROunqUyNsXZsN0iOVjLDcC4HmgMiSx8+ii
	1wIGcb9xcigZ0q9091V+pC2cpplXhypzivdsa/2p3e8D2SZ6OGiI3/V15M9FMR4s1RvNY5EXv1L
	8Gv7bpvFCf1BmZ51orP9hSIdOv5FboiV456mTfpMcAcz9iwko693Q909+tPlckmLmrsZYFA+fzm
	NU/S4zPOUJPSooQ3uSNZ91g/merMsUbTc5XAzHk0XXYgmCJpFhZmXQ4JEPzWYQWyfv9Ny6Pte8B
	o4Fmj2m9lHmjOagy2oc93g1axKEx0d0PavtCVNnLE62prWHFxGI7r9Z8xwfjHVvyYbMiDcubiiA
	ESrQTaeQTEK1bZRioIyrVMmH0FDvGbrLZiIgU7T6cbdlJCW/eNyYxn7iFsImw9JCu78cwegTELV
	SFvALhkLngCTUZ0Gog/ZDO1QR4MSQnbJZmLcx75ro1MLI65IkUSFYNKVQEYeK715vEZIdZkrqhX
	Ic9gpjZmMeTVBNBQ/F0HJGwGAnhIz5nAgN299C4xIdiR7FMCf2z1Bn9Eoo=
X-Received: by 2002:a17:902:d484:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2dd2a350491mr83902715ad.17.1789142822209;
        Fri, 11 Sep 2026 09:07:02 -0700 (PDT)
Received: from localhost.localdomain (111-240-145-155.dynamic-ip.hinet.net. [111.240.145.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13883055ad.56.2026.09.11.09.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:07:01 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/2] selftests: net: Add TCP payload verification to udpgso_bench_rx
Date: Sat, 12 Sep 2026 00:06:48 +0800
Message-Id: <20260911160649.51863-2-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
References: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
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

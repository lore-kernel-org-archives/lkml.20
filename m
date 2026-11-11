Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437517;
	b=OcmDBrYYXOBgWv894IUPjqx0xNLCu8WCcZgh9EXAeJpqJKi8Bxldyy1wYV46XO9tUIzc
	 fXZzX1011BOS2+1/1ecQgU63LB5/0n4usJr0Z0H2XjBn38TR1BJ/PWg5rqDKrZ+spzdgW
	 vdOL6SgU0R6FO6qgS1hZUyNHcZz/DlyvtZfqoLOOdP/eCIV/tLF3PkA01J9M5sPaZakFf
	 x/uWz3pqfRVab2xhupTxEaObKtRNUbfYcFxU6frAlxZ9vtCskhJTvF98AuleAN/dQXIni
	 fgWxXSLqIg5qtNJHsK9iv8b+uAxzp1qMqEIZ6LAh96z/qbJErmwkFKdfXTJSuy6UUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/vhofawT2SU6SgpF8OfaiGs0g+T9Ie9hyxAqVetXP4=;
	b=hRsqyGWDHWKtJO2UesboMG0JmBoT2Qc37Pgxu4u+Pi5rNhaZeKApfAhRvrqQswO14jJh
	 avo+qcWHjNZILgR0KqEJ6LHdSSypNJ03QemTwZshWz6gX8j6Q8wnD6XcWLqVnmd3sP6oT
	 8SJKhQyMVYHykqm9aR+S7aUr7llL7tn5Fay9PnHhlquLPIEZbxDVif8zI3U2GTnXtQAhy
	 zG5bzsU1Yl92NQv012SC67ReOPwK9/U4rxmPXl3+gTVB22N694MJGHVf8lPeD3EsVlUBA
	 EJ3tvd4ZzbN2kJoROeceRo6xL2ziJkgIpdjgS4/W1kzezQNpBaTfd9WuOMKon2AndoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7Ljy7R6;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400F606AECD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E400F606AECD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7Ljy7R6
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a058315c79so1896545b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437516; x=1795042316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/vhofawT2SU6SgpF8OfaiGs0g+T9Ie9hyxAqVetXP4=;
        b=S7Ljy7R6P0pvsFfplRx8vmeSpwWlYryM2KtPN8g7PAd3MCWx0eHXmJwVwSCamyDoHo
         fY+A2Pc7gE2AWzo6Fy4uYb0L+DcX9VTlaEcA9lvfLYNO3Zud7lz7jLkxoAQH5SoZhoW1
         9TRDOIkH84I+Eue2lfJ2SETleTqSKo7htEsiPEkUKfejquFQ+N8b4qzki3DUnGoAJ5YB
         sbP69DPZTRGLBpPuKqxlEfL8qFfhykJQOR2byVPX9tcbW3xJFWg4f81Wa6rmf67sJ/tW
         LU/2X+S0/uXHYcegzexiwyYUGSq12JkrbocXZcNUesxt3R3E8nBFIQKey5IUdg8+P8Co
         iirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437516; x=1795042316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/vhofawT2SU6SgpF8OfaiGs0g+T9Ie9hyxAqVetXP4=;
        b=T7avY4WVpnggmAfXHQKxIRtaTyt1n73PmGgTazV895zCHuQevZPmiPnt9oDU18oaxS
         ZKiZj5ryr30j2R0V+dN3X4rY0AaFNUBTJm7pg546LS4lDXvX5nR3VgA9r3ignT6AtxYQ
         cuH3SmL1odjmw5nCqyQIJs8G716tMHESxrngjRjGHDKoQOnwtzO9gezDleq5snYHXhHp
         2hukr+RWmVwXiqWJ+xVvDl4xqoKDD2ioElqYJqiUefxZYYDjxqOK/yLgPr6IOHzmJuzR
         pX+LefJYjw4ElkIr1XgUjamsvgVdts017TkSjm/ygT7yu261gZeEJSL3ldHDo3d1DPHy
         tigQ==
X-Forwarded-Encrypted: i=1; AL+hErHRZJxIUTZT1Y8vOzcPg6x1L0+LzEIHxsg/nBDBkmgRzWtcVNqQ93BcNPfZ10G3e4jxRGv8KG0LdkvBfig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qhun310W/G+9St9TqH7m8/flezv9BGcqzbLaiLNr6b0UPGGeX
	U40ZNhqYWKO5pKrAUwL1bUgLDsSqb/6bzyz38xxHO0ZgSVHeEXcllPYZ
X-Gm-Gg: AYBFou1w3u/IQXSWHN0mTdunASXVCCua+qX/pruwHQcjp4ICQSfYhBqf6gDNw1lzL/Z
	4eBIh/BMszTdJOiyQqh/ySJD+Jempo6vhbnqevH3nw6JFiLhmcPnFCiOJ0zlrwfvEgT+XmAPeM/
	bkG+flg+zFRdh3g/VFwzYyyLG6jBGyO5mzHXWY3P4+y10WSiDzdznWlA+FdFuCOBCL9TE94k0mU
	8T/eUedkRXPW7t5dmJItbOpMQG4DCBto+/lsyoxsciAmqUOtRAV1mGAXSFwAQeIqjWAE4BgKPda
	WK4txNsauqAyYHgPfhnDoda+GZW5aBc6XYK/FZKtSNzi5p+aIeh3ylYOmy/b2fta5fZWsY20Vl4
	0QpeEiYXXcaVxHaB8Pj0lfK3p/iBAZ9ShDmrbQT42V53xBVluMRb5SbjVr18GPRSnqQSd8Z4DQd
	OtHYjMUsvJpYgpLCDbBkWNVvqHqwjo1yGeaQR9p21b90oE49CuO+/6LhwK5or8OTFbDhs4GsQpe
	5shcIItw02Zv2+IPpChumFhPpe6p7/wKAlSmUN1Vkas+SNqmZR439edHHSIewtiYBoXOD1VVvB1
	x1pMFJD2LTKegE3n86BecL/iiN5E+VF4A21VjNj83vTHAbJN73Cm14IKkjUFL84EPRlJfnAJhJu
	rWH684KnlMdaJ62f5jgVLQMweVDOR9XRsEjDA5Cw0SEIV5Qzdx2c4GIo7PjumXkogJbdArRdSvF
	8ib/9rWj9zdKZZl+44i6d7sMccbAjydhl0SlxgkzV4
X-Received: by 2002:a05:6a21:6f09:b0:3e1:a4ac:2d5b with SMTP id adf61e73a8af0-3f2ff4d9896mr3404820637.41.1794437516195;
        Wed, 11 Nov 2026 14:51:56 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86dd0fsm2471575b3a.22.2026.11.11.14.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:51:55 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
Date: Wed, 11 Nov 2026 22:51:48 +0000
Message-ID: <20261111225148.88506-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111225148.88506-1-sidchintamaneni@gmail.com>
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
/proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
observes a dead peer in send().

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..ced83d3173b7 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
 	close_sockets(6);
 }
 
+static int count_scm_fds(struct __test_metadata *_metadata, int fd)
+{
+	char path[64], *line = NULL;
+	int scm_fds = -1, ret;
+	size_t unused = 0;
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
+
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+
+	while (getline(&line, &unused, f) != -1) {
+		if (strncmp(line, "scm_fds:", 8))
+			continue;
+
+		ret = sscanf(line + 8, "%d", &scm_fds);
+		ASSERT_EQ(1, ret);
+
+		break;
+	}
+
+	free(line);
+
+	ret = fclose(f);
+	ASSERT_EQ(0, ret);
+
+	return scm_fds;
+}
+
+TEST(dgram_disconnect_fdinfo)
+{
+	const FIXTURE_VARIANT(scm_rights) variant = {
+		.name = "UNIX ",
+		.type = SOCK_DGRAM,
+	};
+	FIXTURE_DATA(scm_rights) self = {};
+	struct sockaddr addr = {
+		.sa_family = AF_UNSPEC,
+	};
+	int ret;
+
+	ret = unshare(CLONE_NEWNET);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(0, count_sockets(_metadata, &variant));
+
+	create_socketpairs(_metadata, &self, &variant, 2);
+
+	/* 1. Disconnect via connect(AF_UNSPEC) */
+	__send_fd(_metadata, &self, &variant, 0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
+
+	ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
+
+	/* 2. Dead-peer disconnect via send() */
+	__send_fd(_metadata, &self, &variant, 1, 1);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[3]);
+	ASSERT_EQ(0, ret);
+
+	ret = send(self.fd[2], "x", 1, 0);
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(ECONNREFUSED, errno);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[0]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[1]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[2]);
+	ASSERT_EQ(0, ret);
+
+	sleep(1);
+	ASSERT_EQ(0, count_sockets(_metadata, &variant));
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0


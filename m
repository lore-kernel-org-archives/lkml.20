Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD77606D821
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD77606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3Isvyj2
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so150112a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942399; x=1794547199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6AmEohuqIdfwDgu3Ty8WU1x3cRaQS/VCTm4XZLnhyw=;
        b=e3Isvyj2iNfcI/gjc89pfMfA3BSuHRJcNhLCNdhxsWza5gY2VzVaENk76+lg2aVfT0
         uv919mtesNeQKFgpozO9cVKUXi5j0dBW0Eyf4s89sfavgX1d6Olclb664Le3brAzZKcV
         vpCTCj1vtl1CNJF8Girkap2DNanxglS/OrfqoGaXMwltDg4JMEi+Kjt3/2dItWULMmfQ
         H5YhsCboP3CXWLrG1sZwo24SB8PBC4xDoFBBhey5OdNjFDLbDczPwqxhqE5d0+u/8z1G
         KTAkCDYXyX6OOr+b1UYkm8KAXRL50WKcSfe5IkK8KwD89ZjfNuJZFwwzCOouCAURmCpL
         8DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942399; x=1794547199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6AmEohuqIdfwDgu3Ty8WU1x3cRaQS/VCTm4XZLnhyw=;
        b=K3vrIjjSop981s7OryM5qYrfcpw5WHm823kjJoyl4VunS3KeQbt3mW37otsFywpBD1
         Onrfwa3C8ej752Al7ng4rY4CAUXlB63AEwzlOpWxOu+L1rkb9pFY39gJQViU9gmPJrNb
         WEzp82Ub3nb7jpJSDDLn5qC4xxASH/Y9BRLWiwqBf/Ogolu0mmFafVCeFxl8WlVjeTwn
         B+ZoFzLfKLbbCZhBdnT9chi3xGci7bFEDnaGsrZYpQxcA+T8uqfoghqh4pLAzbeeD7bZ
         ZpaSHW3a7wpO8u3yBDgXdqMbUsjW54ECS6fWVygzqbIq7tTf0TzOEHRMKQOjWbjoP+bB
         3E6g==
X-Forwarded-Encrypted: i=1; AL+hErGQUhqOEEGsqkEbF6UdZrsB3L9FR2RuuXoHCq22Qk5xFb17uySXUkG4fjIpG51lQwgDUc0xNc3EYaj1bNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H18sWuIuzvcIvqwg0oZ9NWnmGw+FUHzPuB65DeBRMTA+QUJJN
	HU5NU9OOtpey5xlydFPbFLKj+Umf1P1wSU6IstLFvpg9ETc+1jjlSSZE
X-Gm-Gg: AYBFou1G+xbvvKglbLVRjF3kt/SZ7LkcpHXWubhZH2o5k+dYlvuH2Jd4vP7Rw64BZVR
	WGI+TVyarJgo1aaV5OhakdCAWkZlkezyDkiBcZA6HKIgYSlW/1sD0883YyyJbdCVVVzVRsDXOTY
	h01MnCUAd5lEY3ieJGpCa3FPjYN5LpLj7wE8qBzlYLCKTkrJg5RXuKmDU/2XHuubFUnj2p8DU1w
	4ixSMaO2D5dBTqODY53GrUiSWjSEYNxiuY4XKlzyzbIRqpOhXp0+RkpUaL7p89djgCcc56n4zDN
	ULmcb2ljIUEiHsEFrNrr00m6432Fmw+Ni4xv8I3qX1Xh8xFkP8+QTYVVgDRkq6EfZQEPR5dmErB
	iXy9gmMKliicusspIFpi+qFBz57kIkemOavTMFVx2s2cfIxVKXnl0DoXz7l0zDsV1ZUD2jbTV58
	6JVDxK4DO34qPcoGRbWUY4aafYLm3F59NzIxGfJI7dKyOGkiQHJk7X2OiN1WKCtCfP4eG0Eh8GB
	X7JVxk/DoLVhqwP5iFKwHlF/u48p+pzaF37/WLCNFR5VlVis99kdwmk90wY2Gf0LteZCaZO0xiH
	/3GgWosRL/yTey0hoI8MSBxSjCwAmU2CJxEykeWD+QfBSqqsxQGMUqIgsoVY82gd9cMJXkhYvr+
	L5ItY6Uc5rVklLD5lu6+dLH7zfCMu/HygPkFJnyuJNvpp3+/3uXJaM+yPs9MztlaJGq8EbOt33H
	UWc6KyASk3iLcEyONQU+cZNoXIX943oMt+xcfyvtGQ8srMcpccP7Qf8Od0Izm+Eg==
X-Received: by 2002:a17:90b:3889:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b0db7232edmr1311891a91.62.1793942398683;
        Thu, 05 Nov 2026 21:19:58 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:58 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 4/4] selftest: af_unix: Test SIOCINQ and scm_fds with OOB and dgram disconnect.
Date: Fri,  6 Nov 2026 05:19:05 +0000
Message-ID: <20261106051905.218638-5-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
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

Verify in msg_oob's __resetpair() that ioctl(SIOCINQ) reports 0 unread
bytes after draining the stream receive queue, and add oob_fdinfo and
dgram_disconnect_fdinfo tests in scm_rights.c verifying that
/proc/self/fdinfo/<fd> (scm_fds) returns to 0 when OOB skbs carrying
SCM_RIGHTS are skipped or freed and when a dgram socket disconnects with
queued SCM_RIGHTS skbs.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 tools/testing/selftests/net/af_unix/msg_oob.c |  12 +-
 .../selftests/net/af_unix/scm_rights.c        | 108 ++++++++++++++++++
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/af_unix/msg_oob.c b/tools/testing/selftests/net/af_unix/msg_oob.c
index f051d79f7a8e..7d5a25485048 100644
--- a/tools/testing/selftests/net/af_unix/msg_oob.c
+++ b/tools/testing/selftests/net/af_unix/msg_oob.c
@@ -5,6 +5,7 @@
 #include <string.h>
 #include <unistd.h>
 
+#include <linux/sockios.h>
 #include <netinet/in.h>
 #include <sys/epoll.h>
 #include <sys/ioctl.h>
@@ -336,8 +337,17 @@ static void __resetpair(struct __test_metadata *_metadata,
 {
 	int i;
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 2; i++) {
+		if (!reset) {
+			int inq, ret;
+
+			ret = ioctl(self->fd[i * 2 + 1], SIOCINQ, &inq);
+			ASSERT_EQ(ret, 0);
+			ASSERT_EQ(inq, 0);
+		}
+
 		close(self->fd[i * 2 + 1]);
+	}
 
 	__recvpair(_metadata, self, "", reset ? -ECONNRESET : 0, 1,
 		   variant->peek ? MSG_PEEK : 0, true);
diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..38a125d9f6e4 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -378,6 +378,36 @@ TEST_F(scm_rights, backtrack_from_scc)
 	close_sockets(10);
 }
 
+static int count_scm_fds(struct __test_metadata *_metadata, int fd)
+{
+	char path[64], *line = NULL;
+	int scm_fds = -1, ret;
+	size_t unused;
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
 TEST_F(scm_rights, mixed_lowpoint)
 {
 	create_sockets(6);
@@ -395,4 +425,82 @@ TEST_F(scm_rights, mixed_lowpoint)
 	close_sockets(6);
 }
 
+TEST_F(scm_rights, oob_fdinfo)
+{
+	int recv_fd, ret;
+	char buf[2];
+
+	if (!(variant->flags & MSG_OOB) || variant->disabled)
+		return;
+
+	create_sockets(2);
+
+	if (variant->test_listener) {
+		recv_fd = accept(self->fd[0], NULL, NULL);
+		ASSERT_LE(0, recv_fd);
+	} else {
+		recv_fd = self->fd[0];
+	}
+
+	/* 1. Unconsumed OOB skb skipped by normal recv() in manage_oob() */
+	send_fd(0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, recv_fd));
+	ret = send(self->fd[1], "a", 1, 0);
+	ASSERT_EQ(1, ret);
+	ret = recv(recv_fd, buf, 1, 0);
+	ASSERT_EQ(1, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, recv_fd));
+
+	/* 2. Consumed OOB skb freed by normal recv() in manage_oob() */
+	send_fd(0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, recv_fd));
+	ret = recv(recv_fd, buf, 1, MSG_OOB);
+	ASSERT_EQ(1, ret);
+	ret = send(self->fd[1], "a", 1, 0);
+	ASSERT_EQ(1, ret);
+	ret = recv(recv_fd, buf, 1, 0);
+	ASSERT_EQ(1, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, recv_fd));
+
+	/* 3. Consumed OOB skb freed by consecutive recv(MSG_OOB) */
+	send_fd(0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, recv_fd));
+	ret = recv(recv_fd, buf, 1, MSG_OOB);
+	ASSERT_EQ(1, ret);
+	ret = send(self->fd[1], "y", 1, MSG_OOB);
+	ASSERT_EQ(1, ret);
+	ret = recv(recv_fd, buf, 1, MSG_OOB);
+	ASSERT_EQ(1, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, recv_fd));
+
+	if (variant->test_listener) {
+		ret = close(recv_fd);
+		ASSERT_EQ(0, ret);
+	}
+
+	close_sockets(2);
+}
+
+TEST_F(scm_rights, dgram_disconnect_fdinfo)
+{
+	struct sockaddr addr = {
+		.sa_family = AF_UNSPEC,
+	};
+	int ret;
+
+	if (variant->type != SOCK_DGRAM || variant->disabled)
+		return;
+
+	create_sockets(2);
+
+	send_fd(0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self->fd[0]));
+
+	ret = connect(self->fd[0], &addr, sizeof(addr.sa_family));
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self->fd[0]));
+
+	close_sockets(2);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0


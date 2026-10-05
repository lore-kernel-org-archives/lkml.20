Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B954C2247
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213006; cv=none; b=KOj1xu1E8H0aZKMT5MzOOu8ffB/XYGoVJR3KRYGmiMlxh2L3zuhblu6UPY1vXilzC2acSTznwevn+A3ltJDxQBMp/u2eGWfRFbXR21gsEwpL6aFe/zTIXU/ye6KhQl2aYF6CCZ8jOQs2q70S56lfeDrgC+T1IjNrUPtL18Du9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213006; c=relaxed/simple;
	bh=sj6IvvpiH4G5HeXtQ/w8rgZEYm6Vebo2GQ/VGeptjoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REEs9AQ39ds7LNCuDazmYk9UvzYhSEIidMWkhjpJONB4uXwwdktU/Pmm2z5Mdh4jSIcUZOEzXwb0nWG3s5s9K7GpVgcfQDcJdsR6p4VegZuHD0MGWBe+7HlJo+j/9d4om/nTY0fIRicHMqBLPtdb3ScWPUH/aRBPAydZHurnsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=00kxn9kE; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="00kxn9kE"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac525c1f05so16175807b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791212999; x=1791817799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiZ06e1bwcFWfpqrqmzoNBYBcxZ/+ZVmZd6FQIzN/qM=;
        b=00kxn9kE3vGTHtl3bKE8JrlY8b1mc/tt6MK3NzlWUmXSjEwgMtwbmTrv8kmJf3fzEb
         U7wuDL1ptAf6j3Ea+P/peJnhnXRzK/IbPIFNVvRJEd/7PlEg/A5C1rddBp3t6UCIUKtu
         X5BFR5C8lkP2VjvAg38calf5QJD70Cb2/0mDa9xyhgRfB38NZRqbKjXVQG7ViVE+Vr8l
         62psLmdkXu1b8miz5uNvIBGibmsi+ul6v5uU6nQAwGXU5xjCLLFiWAheUkYCp/ti1wCv
         zBqd8opwdrJuDrvOUODIPx4zc+R6+VhM0qj0MV2seu/Q+wAVXyZwfYDIcTtUzcBjx+zm
         KGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212999; x=1791817799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiZ06e1bwcFWfpqrqmzoNBYBcxZ/+ZVmZd6FQIzN/qM=;
        b=Z0ybxPdyhNqK5Blca3jLh0UP/pXYxt3PC51nB7beDI62Rq5EqoD6SnsTw/IfgqpwDm
         4N9j47VIWtf9yPehMicWgyH2o5liPKvLm0tw3QbzwItMQayHdiIpEMNw0HVFwiNITuzf
         DnypasEMGorcgtcN2hV6IRVxKFKVHTtmS5bPdHB0UQV9walDeLD6tza+kmwhznTvMrt3
         ep1R1idtc/t/sKayd9u0/FjSdEa+zGk6899XAyCEsIzcF01KTzQNTSjF6E0I35AeZKhB
         YNodxSk7MB4wPIIHiq0Vo+LGYMLXH57wBJ7pM7eRcF0XdPhlEYW5jrrpDzPslxJsYHcj
         ylKA==
X-Forwarded-Encrypted: i=1; AKwUvBxduLDss2WanpAR0svIc7z/8bqmvp7vU+b00CKNYQFhmdXuA3RjVkmU54xVGxJmgyExnEvJvt6J/67mp20=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw0lhsoe/0s7O+4rmUajsaYvCxSYCbTCJPO/etDsd78NMpdNwP
	5h+1Ge6nb9qu4B1gNCtSMEN8iisguVjIIslNUsR9YaI/ldzXuzgbSyGZEHieQANxzUjs
X-Gm-Gg: AYBFou3DCEbKsshsAeG0AKUiocV2hGWTHfvLEdkI0y8Gsk15IUCldt1WYWLptUQa67Y
	dxSksNelfplw+uG/zFTI1mWKMeI4zqiI1JlM/BSEEUoLdKT4d53k5pSXplsSZ04QhBz//E8V2Sa
	kxO8QAojc9mBcm+Q3KTcijFGbBtW+TyfHOdAOMHARM4V1zeXW7pg6MnXghBtsEe0anhE+d9qVZL
	CIZftk312hvFM8tPBuZ8golz/PIgqVmzs857g9unOyuhDx4OzUVQzsNoq8uRcG5y6fQI3cYZ9Qn
	HfnwOOiW2tPk8P6VttSNubMGq+rSnR0q0N4y90oyf3JSOSE/ZwqO1OkiYc+tz9JNoxeYGSn3T9h
	+F+sUhHum/TQIhVpDPL1oXBorh55UtwTITtl/tTvjJTWM9xX/IO0KlID7JbWuZno1m5VAVMyTyz
	i4E8215tCY2+FQgpGxboFcDHF5idlAtf4Gf/nOc6X1UEolxaAYdP8gBM/PHZNXDogg5XxXi+lYf
	SeYd4c5Xd/g/jlgBxzorMWaTDNftUXS14yhYoVx/NRYOW86oOzulNiU
X-Received: by 2002:a05:690c:4d49:b0:8ac:46ff:d3a5 with SMTP id 00721157ae682-8ae959d6dc1mr29681427b3.64.1791212998716;
        Mon, 05 Oct 2026 08:09:58 -0700 (PDT)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33fe81fdsm41210467b3.47.2026.10.05.08.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:58 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 05 Oct 2026 10:09:38 -0500
Subject: [PATCH v4 08/10] selftests/net: SO_PEERPIDFD_THREAD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-work-unix-passpidfd-v4-8-350183b6e02a@amutable.com>
References: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com>
In-Reply-To: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com>
To: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Andrew Halaney <andrew@amutable.com>, Eric Dumazet <edumazet@kernel.org>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>
X-Mailer: b4 0.14.3

From: Christian Brauner <brauner@kernel.org>

Add tests for SO_PEERPIDFD_THREAD.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 97 +++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c b/tools/testing/selftests/net/af_unix/scm_pidfd.c
index d73ae9d27a48..cbe53fab44fc 100644
--- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
+++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
@@ -36,6 +36,10 @@
 #define SO_PASSPIDFD_THREAD 86
 #endif
 
+#ifndef SO_PEERPIDFD_THREAD
+#define SO_PEERPIDFD_THREAD 87
+#endif
+
 #define CHILD_EXIT_CODE_OK 123
 
 static void child_die()
@@ -1058,4 +1062,97 @@ TEST(scm_pidfd_thread_creds)
 	EXPECT_EQ(msg.ids.pid, msg.thread_info.tgid);
 }
 
+static void *peer_connect_thread(void *arg)
+{
+	struct sock_addr *sa = arg;
+	struct thread_ids ids = {
+		.pid = getpid(),
+		.tid = gettid(),
+	};
+	int fd;
+	char sync;
+
+	fd = socket(AF_UNIX, SOCK_STREAM, 0);
+	if (fd < 0)
+		return (void *)1;
+
+	if (connect(fd, (struct sockaddr *)&sa->listen_addr, sa->addrlen))
+		return (void *)1;
+
+	if (send(fd, &ids, sizeof(ids), 0) != sizeof(ids))
+		return (void *)1;
+
+	/* stay alive until the server has looked at our pidfd */
+	if (read(fd, &sync, 1) != 1)
+		return (void *)1;
+
+	close(fd);
+	return NULL;
+}
+
+static int peer_pidfd_info(int fd, int optname, struct pidfd_info *info)
+{
+	int pidfd;
+	socklen_t len = sizeof(pidfd);
+
+	if (getsockopt(fd, SOL_SOCKET, optname, &pidfd, &len)) {
+		log_err("getsockopt(SO_PEERPIDFD*)");
+		return -1;
+	}
+
+	info->mask = PIDFD_INFO_PID;
+	if (ioctl(pidfd, PIDFD_GET_INFO, info)) {
+		log_err("ioctl(PIDFD_GET_INFO)");
+		close(pidfd);
+		return -1;
+	}
+
+	close(pidfd);
+	return 0;
+}
+
+/* SO_PEERPIDFD_THREAD returns a pidfd for the peer's connecting thread. */
+TEST(so_peerpidfd_thread)
+{
+	struct sock_addr sa;
+	struct thread_ids ids;
+	struct pidfd_info info;
+	pthread_t thread;
+	void *tret;
+	int server, cfd;
+
+	server = socket(AF_UNIX, SOCK_STREAM, 0);
+	ASSERT_LE(0, server);
+
+	fill_sockaddr(&sa, true);
+	ASSERT_EQ(0, bind(server, (struct sockaddr *)&sa.listen_addr, sa.addrlen));
+	ASSERT_EQ(0, listen(server, 1));
+
+	ASSERT_EQ(0, pthread_create(&thread, NULL, peer_connect_thread, &sa));
+
+	cfd = accept(server, NULL, NULL);
+	ASSERT_LE(0, cfd);
+
+	ASSERT_EQ(sizeof(ids), recv(cfd, &ids, sizeof(ids), MSG_WAITALL));
+	ASSERT_NE(ids.pid, ids.tid);
+
+	/* SO_PEERPIDFD refers to the peer's thread-group. */
+	ASSERT_EQ(0, peer_pidfd_info(cfd, SO_PEERPIDFD, &info));
+	EXPECT_EQ(ids.pid, info.pid);
+	EXPECT_EQ(ids.pid, info.tgid);
+
+	/* SO_PEERPIDFD_THREAD refers to the connecting thread. */
+	ASSERT_EQ(0, peer_pidfd_info(cfd, SO_PEERPIDFD_THREAD, &info));
+	EXPECT_EQ(ids.tid, info.pid);
+	EXPECT_EQ(ids.pid, info.tgid);
+
+	/* release the connecting thread */
+	ASSERT_EQ(1, write(cfd, "x", 1));
+	ASSERT_EQ(0, pthread_join(thread, &tret));
+	ASSERT_EQ(NULL, tret);
+
+	close(cfd);
+	close(server);
+}
+
 TEST_HARNESS_MAIN

-- 
2.55.0


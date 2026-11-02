Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661174;
	b=zluvZoUstzqBRo+/cNSbWiXH1bKSfplkCTSjxe1YhqmQOuE1vi2xs3OXwRByZYDnojcp
	 j3OUGCSeuE4sUUZta7Q16jz1hJU4Vic3RTfxZyyDVi3Qdg72DeR4dIBnhVJUsHPPjaYUs
	 jDwzSxqq2Mty31QGWDwY+lfR5v4M6lVJ44ZiLJTjyhzYW8E/U7J7UcNm2o4cRrnoMoCN8
	 yXXpj5ahA3pPAxHKgOfxv2koK5VrMu/iJs/IozXfMGO6qSTc1Bb4zLDKkUgMBZmMet7tP
	 EcWMfmjribQ9NlcMUCVu1STP6L4Pxug7EPsXo4QQybOMHM/EpODGaYQ+W0av90w++9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GPdhfWAD7Ide4EFf7M4rZk0kSAs4c2Xf02rJ8beDsak=;
	b=cl12XqcClz3iuKS+eUCp4w0DX/OmvYVVANjDUR0kss8M0uuybx0IJNjo0pleeG7p6uXV
	 jxDBI029GTA/oQv1gks3U/Y7Lr/fHfgz54YTjw2hyevLIoENHDwz7btmDePR+ALrwET0+
	 DRQ/Q+ZbBUX5r0MCFO8XsLTsTPDASe1Aa5Bbs1vww+f6png+gEuZ2iwXx8YPgvcVp8Cxs
	 qXVDBUVrbRXcv2Kym8LIbYK7C6pWQ0pUFEHbs5TBKNYmiM7pV2WoK8TW6mqxaJKdvud6U
	 4bvASO7RN+zbjWDyaag+18JrjoUNX0VRSwMnuIsNWVxI4eAS17Z6a3QgmT8WszuVYmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+0PQ1n1;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E3606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3E3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+0PQ1n1
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6798eb0d190so2503825d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793661173; x=1794265973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPdhfWAD7Ide4EFf7M4rZk0kSAs4c2Xf02rJ8beDsak=;
        b=j+0PQ1n1kmFQTc+BosPd73pckERKHrhtxYJjj3ZP/1bLRCNZ6qm9O3IOkbwOJ+gmvN
         c52YIdN61lhz4DzALcQ/xcR8osNMhdFshJIPCtg3QTu/bu2nskQAvDUhO8XdJBMZxyqt
         uQGQngkXYHf+JHkgrr/JqiX9kYl84+l8GcS/7wWP1t+ev0zlzbVtnfQqpbu4W5LlX4Ef
         aMxBI2/aWDJIzP04YG0L9UmvGpUJnm3VOd4TRkgdGv+RNzDAJhPJ6j7P23y1Za3eNHOR
         zk7qXQ+C8La7nDIjKyFS4gUx1Bq/+huALi44jhbM77ykSsm0XFaysNwKa+WbHmjql3lq
         bxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661173; x=1794265973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPdhfWAD7Ide4EFf7M4rZk0kSAs4c2Xf02rJ8beDsak=;
        b=15VT/PWTqvt1w9kjQu3jr5fXrVhy5NiPS+FEQqKetxGjeOA8Tc78EVcO8vBdon0I4v
         8zk7b/mwaDbLTO5ihId1f5AS813ApF6nJoqTEkM4g9+EF8BrQGPXLithwg13g+3JJTeR
         fBTQbwZFQeYJGEXnI9vW3lk+fkFgz0wBywmqIYfXfaqWFvngSwd0GZgO1qkApu0f3QVf
         6cYcyIvR6P/DPuWmerrY/kEY9rVaCaO60z1G2nPjAeK+F6HRGhjIJhTbNFctrOaIDHKe
         V19/2Uur+AfZv/BK+xFH6H/X0ob8IkRcXOEtdYn4g9s58n2FZX9eHvZRIes+OMaTUgyk
         xH1w==
X-Forwarded-Encrypted: i=1; AKwUvBwHWKD0YhjXEQ7oUI4zfGHFBJAFoFmXja89J6h57q4exWXUX91IMu0cEs8Ru/YQRIVUOWfmfpC64o2pU5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vrwdE9f9rlcbo2gxwq1GyBrc9QJiZ4NiekrwsGh8IxEu+Yat1
	HtcivCRuE+hb8MEmgdV54C8RMU1MfjKA/Pv1CFUoxmBAgxUPN2odAHLxFKfSqKMr+fdY
X-Gm-Gg: AYBFou0yOl+LD7uV+u7kcq6ar0u3txMYgot4aNFICXnr/eGoFeP9dsW7efmPOB0Jnsr
	JSNnXvmf4BBkbpenw83vsfNN+Uk3U3LcXh6XkyT/S3La7AYTp8TnWjfaFbd9F4QqfcDCvSVa32X
	N2v3F9kzAJPO0qSdcuSSsU6Tc/7GZgThYiCqyka9szwh4Yx/8cdS9q4dcWHsPRDad7PQobHiOZh
	X+QdOr31+EEsJQSHAhMN28YcxBuzQrnYZlrsucLtVLhsDYfpwQsFXJFpm+jze4GDooVzFDA3aIo
	xZRfI6mCVdcbi1cDDpH+dsCpWyVqPtZFx921NM1hM4L+xmhiDGoaTUJ/OI+8yTRFQMd5bfyDvYL
	eeuLjWloBD0QguDxRB8F7O2l2e4mojxKaZQQhz0mHI25Udq+X9T+d5rI71y4kCnXK/JBpzrQ/re
	dCTzcHqcqqm84XJK90/M2eeMLsfqq+rDfnkT3zpsoUk4L9dKapZww6/9rdkawq2YaG7ZZF4bElZ
	Cho+oGf5AE032fJ22bmHug4YFU1xt8Kwc/3Ha97beM+Ax7eWXGrwg+oF1QVzWKFejp0JksRgAi4
	tCHvtKDCw/4KADwLf+BQQAMzL3Aqd3GLkopf9oeD/G6Or+iQ+ZkrsbzvKMJNIO7x0VMx8X4gmIU
	/SB0TrnPxHQ==
X-Received: by 2002:a05:690e:d0e:b0:677:cc34:2f4b with SMTP id 956f58d0204a3-67ba4fb4b08mr8740681d50.22.1793661172549;
        Mon, 02 Nov 2026 15:12:52 -0800 (PST)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm5946481d50.18.2026.11.02.15.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:12:52 -0800 (PST)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 02 Nov 2026 17:12:35 -0600
Subject: [PATCH net-next 2/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
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
Message-Id: <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
To: Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>, 
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>
X-Mailer: b4 0.14.3

Currently, SCM_CREDENTIALS carries the pid of the thread-group leader,
despite carrying the uid/gid of the actual sending thread.
SO_PASSPIDFD_THREAD lets a receiver identify the sending thread, but
only through a pidfd. If you just want to know what the tid of the
sending thread is you have to do something like:

    1. Setup SO_PASSPIDFD_THREAD on the socket
    2. ioctl(thread_pidfd, PIDFD_GET_INFO) per message
    3. close(thread_pidfd) per message

For example systemd-journald wants to log the tid as "trusted field"
(aka provided by the kernel) but doesn't have a great way to do so
right now, unlike the options for uid/gid/pid which are covered by
SO_PASSCRED currently.

So add SO_PASSCRED_THREAD as a sibling of SO_PASSCRED. It delivers
SCM_CREDENTIALS_THREAD whose ucred carries the tid of the sending
thread instead of the thread-group leader. This is completely
independent of SO_PASSCRED, so a receiver can ask for both. Use
a new cmsg rather than changing SCM_CREDENTIALS because users
expect ucred.pid in that context to be the thread-group leader.

As with SO_PASSPIDFD_THREAD, recvmsg() on SOCK_STREAM sockets stops
merging data at a thread boundary once SO_PASSCRED_THREAD is set.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 arch/alpha/include/uapi/asm/socket.h  |  2 ++
 arch/mips/include/uapi/asm/socket.h   |  2 ++
 arch/parisc/include/uapi/asm/socket.h |  2 ++
 arch/sparc/include/uapi/asm/socket.h  |  2 ++
 include/linux/socket.h                |  1 +
 include/net/sock.h                    |  4 +++-
 include/uapi/asm-generic/socket.h     |  2 ++
 net/core/scm.c                        | 32 +++++++++++++++++++++-----------
 net/core/sock.c                       | 14 ++++++++++++++
 net/unix/af_unix.c                    |  6 +++---
 10 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
index 5d3524c26b2b..430ef65e51ea 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -161,6 +161,8 @@
 
 #define SO_PEERPIDFD_THREAD    87
 
+#define SO_PASSCRED_THREAD     88
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
index 245a43f52fb1..7e49b24170d2 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -172,6 +172,8 @@
 
 #define SO_PEERPIDFD_THREAD    87
 
+#define SO_PASSCRED_THREAD     88
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index f23710e1c671..e414c2397224 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -153,6 +153,8 @@
 
 #define SO_PEERPIDFD_THREAD	0x4055
 
+#define SO_PASSCRED_THREAD	0x4056
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
index b35b25bdefc2..9ca7ec9ba450 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -154,6 +154,8 @@
 
 #define SO_PEERPIDFD_THREAD      0x0060
 
+#define SO_PASSCRED_THREAD       0x0061
+
 #if !defined(__KERNEL__)
 
 
diff --git a/include/linux/socket.h b/include/linux/socket.h
index b17fdb7d38a7..37ddcdfc0377 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -194,6 +194,7 @@ static inline size_t msg_data_left(const struct msghdr *msg)
 #define SCM_SECURITY		0x03	/* rw: security label		*/
 #define SCM_PIDFD		0x04	/* ro: pidfd (int)		*/
 #define SCM_PIDFD_THREAD	0x05	/* ro: thread pidfd (int)	*/
+#define SCM_CREDENTIALS_THREAD	0x06	/* ro: struct ucred, thread	*/
 
 struct ucred {
 	__u32	pid;
diff --git a/include/net/sock.h b/include/net/sock.h
index 173b37b2b8bb..344057d3aa74 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -357,6 +357,7 @@ struct sk_filter;
   *	@sk_scm_pidfd: flagged by SO_PASSPIDFD to recv SCM_PIDFD
   *	@sk_scm_rights: flagged by SO_PASSRIGHTS to recv SCM_RIGHTS
   *	@sk_scm_pidfd_thread: flagged by SO_PASSPIDFD_THREAD to recv a thread SCM_PIDFD
+  *	@sk_scm_credentials_thread: flagged by SO_PASSCRED_THREAD to recv SCM_CREDENTIALS_THREAD
   *	@sk_scm_unused: unused flags for scm_recv()
   *	@ns_tracker: tracker for netns reference
   *	@sk_user_frags: xarray of pages the user is holding a reference on.
@@ -564,7 +565,8 @@ struct sock {
 				sk_scm_pidfd : 1,
 				sk_scm_rights : 1,
 				sk_scm_pidfd_thread : 1,
-				sk_scm_unused : 3;
+				sk_scm_credentials_thread : 1,
+				sk_scm_unused : 2;
 		};
 	};
 	u8			sk_clockid;
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index 56fed7ab27ab..2e5d9db1c9fa 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -156,6 +156,8 @@
 
 #define SO_PEERPIDFD_THREAD	87
 
+#define SO_PASSCRED_THREAD	88
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
diff --git a/net/core/scm.c b/net/core/scm.c
index ae38f3c1165c..d0d453fb811d 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -543,28 +543,34 @@ static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm,
 		fd_install(pidfd, pidfd_file);
 }
 
+static void scm_creds_recv(struct msghdr *msg, struct scm_cookie *scm,
+			   u32 pid, int cmsg_type)
+{
+	struct user_namespace *current_ns = current_user_ns();
+	struct ucred ucreds = {
+		.pid = pid,
+		.uid = from_kuid_munged(current_ns, scm->creds.uid),
+		.gid = from_kgid_munged(current_ns, scm->creds.gid),
+	};
+
+	put_cmsg(msg, SOL_SOCKET, cmsg_type, sizeof(ucreds), &ucreds);
+}
+
 static bool __scm_recv_common(struct sock *sk, struct msghdr *msg,
 			      struct scm_cookie *scm, int flags)
 {
 	if (!msg->msg_control) {
 		if (sk->sk_scm_credentials || sk->sk_scm_pidfd ||
-		    sk->sk_scm_pidfd_thread || scm->fp || scm_has_secdata(sk))
+		    sk->sk_scm_pidfd_thread || sk->sk_scm_credentials_thread ||
+		    scm->fp || scm_has_secdata(sk))
 			msg->msg_flags |= MSG_CTRUNC;
 
 		scm_destroy(scm);
 		return false;
 	}
 
-	if (sk->sk_scm_credentials) {
-		struct user_namespace *current_ns = current_user_ns();
-		struct ucred ucreds = {
-			.pid = scm->creds.pid,
-			.uid = from_kuid_munged(current_ns, scm->creds.uid),
-			.gid = from_kgid_munged(current_ns, scm->creds.gid),
-		};
-
-		put_cmsg(msg, SOL_SOCKET, SCM_CREDENTIALS, sizeof(ucreds), &ucreds);
-	}
+	if (sk->sk_scm_credentials)
+		scm_creds_recv(msg, scm, scm->creds.pid, SCM_CREDENTIALS);
 
 	scm_passec(sk, msg, scm);
 
@@ -587,6 +593,10 @@ void scm_recv_unix(struct socket *sock, struct msghdr *msg,
 	if (!__scm_recv_common(sock->sk, msg, scm, flags))
 		return;
 
+	if (sock->sk->sk_scm_credentials_thread)
+		scm_creds_recv(msg, scm, pid_vnr(scm->pid[PIDTYPE_PID]),
+			       SCM_CREDENTIALS_THREAD);
+
 	if (scm->fp) {
 		struct unix_sock *u;
 
diff --git a/net/core/sock.c b/net/core/sock.c
index e7405be8941f..6b443bd44581 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1586,6 +1586,13 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 			ret = -EOPNOTSUPP;
 		break;
 
+	case SO_PASSCRED_THREAD:
+		if (sk_is_unix(sk))
+			sk->sk_scm_credentials_thread = valbool;
+		else
+			ret = -EOPNOTSUPP;
+		break;
+
 	case SO_PASSRIGHTS:
 		if (sk_is_unix(sk))
 			sk->sk_scm_rights = valbool;
@@ -1952,6 +1959,13 @@ int sk_getsockopt(struct sock *sk, int level, int optname,
 		v.val = sk->sk_scm_pidfd_thread;
 		break;
 
+	case SO_PASSCRED_THREAD:
+		if (!sk_is_unix(sk))
+			return -EOPNOTSUPP;
+
+		v.val = sk->sk_scm_credentials_thread;
+		break;
+
 	case SO_PASSRIGHTS:
 		if (!sk_is_unix(sk))
 			return -EOPNOTSUPP;
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 98fcfd7301f6..d802463cec45 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -800,7 +800,7 @@ static void copy_peercred(struct sock *sk, struct sock *peersk)
 static bool unix_may_passcred(const struct sock *sk)
 {
 	return sk->sk_scm_credentials || sk->sk_scm_pidfd ||
-		sk->sk_scm_pidfd_thread;
+		sk->sk_scm_pidfd_thread || sk->sk_scm_credentials_thread;
 }
 
 static int unix_listen(struct socket *sock, int backlog)
@@ -2047,8 +2047,8 @@ static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
 static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
 			    struct scm_cookie *scm)
 {
-	/* Only a thread pidfd receiver can tell threads of one process apart. */
-	if (sk->sk_scm_pidfd_thread &&
+	/* Only a thread-aware receiver can tell threads of one process apart. */
+	if ((sk->sk_scm_pidfd_thread || sk->sk_scm_credentials_thread) &&
 	    UNIXCB(skb).pid[PIDTYPE_PID] != scm->pid[PIDTYPE_PID])
 		return false;
 

-- 
2.56.0


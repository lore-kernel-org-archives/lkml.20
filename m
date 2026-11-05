Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892347;
	b=LbQ8YFN9jLQTSof8AqEtP5LZycdtioEdohqa7dglg0SIdfL+7vNBck+qN+LUNw51R6CJ
	 J4W3osY3hJr0gFIdIdrKGqKfrUqorYNL5C6ta1WfvdFLw3XKkAyLuDNoSLRs9pbCPurQo
	 LOW19j2uMarIEtxqRTIXxU0YYA3jRns7NvODVwHIKnap+2PUtG3GTHndn8eHEe5H3W7Nn
	 UeqRWYsWjA1mF35wo+iYcRHAjohCLXHZ95uAJutFMS0iPcVLPlNq7aC+I6ncXkBj3EI1+
	 qaxuAAvKG7H/jtSe4PIQ5yxQpIi/PkHogSuKx0RJ9p3IBNYfifXSoNXfVLa49ZBrMZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hKxHGUslAarNQWqFnxVqWnqjb6lopyxJdeZR+xUedOo=;
	b=gSzLq+KgVALbtJRCLPhlSkqbzJ0eQZV1E2Vx2MTrkf9I+NiE34dd0fSxuYU3tUrnbvVs
	 SvpUig7Lb3YtZqHltcyqVKXpDMsdd9BjGBdSPvhlJ8RiwnC7Z3vJtnlX+O2qiElR9QQ1M
	 YwHa6Nx7ayUKrIVhIHuRsm8UAlYIykN4xLKTNzaXPsxfMaopZTmNsVV/Pqs7euiQZxAaJ
	 THgwWdbYyQ4Hf9l+/sN4ZCUG22a/oqQA8mQ8le48GsBcONF0MaRn2eIcjDrmmCaqbrcpi
	 LeUU7ejGh8eULfDsVoTIqtiHvt4Bz6YgGVphHPEySyQWGf98kbUVoB1G2YLQhKQZjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=iMWwHhTF;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF98606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF98606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=iMWwHhTF
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53634b8328eso16974681cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892346; x=1794497146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKxHGUslAarNQWqFnxVqWnqjb6lopyxJdeZR+xUedOo=;
        b=iMWwHhTFNUUgpdEZFPB35Glo0UKBW+QJgm3zBNtH8ANYAhVfTXKN3CqJ/XGeDqYkjC
         5ecckkS5ji1jkU4ifVEB1u1qRupDY+ADBE9u0cQw+x3nQTgaWyV25hH5YjQO98TrZjEP
         W7ReYLDr7YEkKs2ZCZYymNfqq1kuKWEf/Rn36M7vUO6XgMhMlps938Nd1+5ZkA90JZli
         NNB3ZAIldHzxiJvqsTrzQJHTvzdnOsi+OFFmUShi70TfBMBTeVQJqv1RCDZlwHQIOile
         LxVuyBhe8N43RS/l/c2jWpOSq3ZqxOBhDOWe6Ey4xevqAW1/Ch/S1KJOVI280FWZsMsI
         A+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892346; x=1794497146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKxHGUslAarNQWqFnxVqWnqjb6lopyxJdeZR+xUedOo=;
        b=dlxC60IHLF83mUnfGUrq8hmVB67kiXpiTRMw1hKzJk8wr63wIf2RtruK/9emVmMyBi
         xlHE0xbHpTshwBtKbKQf45MV0MXkRDIfr3LzLi1orYmONR/KcX9FQ7Oqd+Kliwo0mh+i
         /d8nEyNXeabg0pEeFcrBk1mNxoEqzOg3ykcZe6ODjlTFO6WtuxiE5inpp5F1XiCBLMxx
         Tw6aBtnmNwna/1NQ0JSJ6kcl7niqzOKdwo09TqWMQEPwvehJLlvsJXz6DjLNYJSFaVSW
         GvtaKe4YTTqzh2p8YON5yIBEk9RdKFHz1inV07EEWURS5Ioes/ejd2JXXiECakROoTBn
         uklw==
X-Forwarded-Encrypted: i=1; AKwUvByBK9L76J+VpHcnm7gRaQ9q7DOJgTjZy7JyS7JyOseixxYP6rNDXkEMho3MWCVutoewy29wp2h3o0VVtwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gLUlI5RxLWd/nbUPgIGHem2Iy65Ma8Xk4niBMxPMsB7dourGc
	WjN8xp151lnWEnmtF0CVRB/fosjJuKBFenNKh9UfmQ+Vu4RWfGxoOuVGR+RD/7LhykhL6Jx5lPC
	5wVO62sQ6KQ==
X-Gm-Gg: AYBFou1gxCLpxjsHJB0DMeViQm3QV7Amb+uPXU541ABbD4TaYmv8JL+KQt4xJ14TG8L
	8l3S2EtkiaXdtdtCLJ2zazO9WJLMybrLKRtoXq2tF3uh001A1C2rWgPPUyaZ0796AtufUMGCbBu
	ZF+n17TLgzktBCyOBxdpcWFIhbIJ6P1qPeUsJiz9EolJqq0I9qRh5GIvaqjYClAp5/8r203WdRh
	mSfhlVAKvw2nxsEBUhHE5gopqj7hlruU3eR5aCEkYkKx/UHjXGUdYkCeSlRohPX+GomHKmUBqih
	B4ANVgr3H6qLBiGmolp+EizXOZzqfzRZUgBLphqoaK8V7fAvUQwQliCCYnfC0bY2zXUoQZjYRCl
	ApgrFVbDpEEnBGHnDyTXHpvS8oFSewXLzr3FCfIyMkz23n/l4adek82jseOiJu6z2IH5i0HSQtn
	uVjPjUO27OadBjgYksAqy2juxqKVlTQq4tnUQV692t12BPMnexcuzVoakhSETtYFVRLFDJzuWhq
	yykiat5QCZkJYd/CFcugpvqdeuXAMzA+WDydkxz2qURKh5p+d/7X0gLXEgQzCAYjSDLQqsI5HBb
	btw5eqEqFzKAfCR2F0hDnJO3tsrj1OaqM8RnIRk7wsLhzQ==
X-Received: by 2002:ac8:5d8c:0:b0:535:bfc:329 with SMTP id d75a77b69052e-542b85e356dmr310565771cf.61.1793892346415;
        Thu, 05 Nov 2026 07:25:46 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10962a29sm52862011cf.12.2026.11.05.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:25:45 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:01 +0000
Subject: [PATCH RFC v3 69/90] net: do not identify a peer in another cell
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
Message-Id: <20261105-b4-cells-v3-69-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=4895;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=M8E24wZZki1Edb85Rp9EGJlvkFn5UAacTo8RqOOfUsk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEjJpMe4nAt+c/k/Z8MzRGt5H6Nb7tzjajcAJ87SqUVUv3PHeRWf2tSaDLHD7keGH71bR15n3v7
 oYpe8dpPVUwI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

SO_PEERCRED, SO_PEERGROUPS, SO_PEERPIDFD and SO_PEERSEC report who is at
the other end of a socket. No identity should cross the boundary of a
cell.

Fail with ENODATA if the credentials of the peer belong to another cell.
Reporting the overflow ids instead would be wrong: 65534 is an ordinary
uid inside of a cell, and a server that accepts peers with its own uid may
well be running with it.

The peer can change while the option is being read, because a connect() on
another thread sets it under sk_peer_lock. So the check is made in the
same critical section that reads the value, or on the very reference that
was taken. With a separate check ahead of the read, a connect() that was
waiting for the lock got in between about one time in five.

The label that SO_PEERSEC reports is not protected by that lock, and
connect() lets the LSM set it before the peer credentials are set. So a
task of a cell only gets the label once the peer is known to be in its
cell. After that point the peer of a stream socket does not change. As a
consequence, SO_PEERSEC does not work in a cell for a socket that has no
peer credentials at all, such as a labelled TCP connection.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/sock.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index e7405be8941f..cac93cba3c84 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -87,6 +87,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/capability.h>
+#include <linux/cell.h>
 #include <linux/errno.h>
 #include <linux/errqueue.h>
 #include <linux/types.h>
@@ -1737,20 +1738,37 @@ static int groups_to_user(sockptr_t dst, const struct group_info *src)
 	return 0;
 }
 
+/*
+ * Who the peer is, is nobody's business in another cell. The question fails
+ * rather than be answered with a nobody: 65534 is a uid like any other in a
+ * cell, and a server that lets in whoever has its own uid may well run as it.
+ *
+ * The caller holds sk_peer_lock and goes on holding it until it has read what it
+ * is going to hand out. A connect() on another thread may be waiting for that
+ * very lock to say who the peer is.
+ */
+static bool sk_peer_foreign(const struct sock *sk)
+{
+	lockdep_assert_held(&sk->sk_peer_lock);
+
+	return sk->sk_peer_cred && cred_cell(sk->sk_peer_cred) != current_cell();
+}
+
 /* Hand out a pidfd for @type of the socket's peer via SO_PEERPIDFD*. */
 static int sk_getsockopt_peerpidfd(struct sock *sk, enum pid_type type,
 				   sockptr_t optval, sockptr_t optlen, int len)
 {
 	struct file *pidfd_file = NULL;
 	unsigned int flags = 0;
-	struct pid *peer_pid;
+	struct pid *peer_pid = NULL;
 	int pidfd;
 
 	if (len > sizeof(pidfd))
 		len = sizeof(pidfd);
 
 	spin_lock(&sk->sk_peer_lock);
-	peer_pid = get_pid(sk->sk_peer_pid[type]);
+	if (!sk_peer_foreign(sk))
+		peer_pid = get_pid(sk->sk_peer_pid[type]);
 	spin_unlock(&sk->sk_peer_lock);
 
 	if (!peer_pid)
@@ -1962,13 +1980,20 @@ int sk_getsockopt(struct sock *sk, int level, int optname,
 	case SO_PEERCRED:
 	{
 		struct ucred peercred;
+		bool foreign;
+
 		if (len > sizeof(peercred))
 			len = sizeof(peercred);
 
 		spin_lock(&sk->sk_peer_lock);
-		cred_to_ucred(sk->sk_peer_pid[PIDTYPE_TGID], sk->sk_peer_cred,
-			      &peercred);
+		foreign = sk_peer_foreign(sk);
+		if (!foreign) {
+			cred_to_ucred(sk->sk_peer_pid[PIDTYPE_TGID],
+				      sk->sk_peer_cred, &peercred);
+		}
 		spin_unlock(&sk->sk_peer_lock);
+		if (foreign)
+			return -ENODATA;
 
 		if (copy_to_sockptr(optval, &peercred, len))
 			return -EFAULT;
@@ -1993,6 +2018,11 @@ int sk_getsockopt(struct sock *sk, int level, int optname,
 		cred = sk_get_peer_cred(sk);
 		if (!cred)
 			return -ENODATA;
+		/* What was taken is what is looked at. */
+		if (cred_cell(cred) != current_cell()) {
+			put_cred(cred);
+			return -ENODATA;
+		}
 
 		n = cred->group_info->ngroups;
 		if (len < n * sizeof(gid_t)) {
@@ -2038,8 +2068,24 @@ int sk_getsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case SO_PEERSEC:
+	{
+		bool unknown, foreign;
+
+		spin_lock(&sk->sk_peer_lock);
+		unknown = !sk->sk_peer_cred;
+		foreign = sk_peer_foreign(sk);
+		spin_unlock(&sk->sk_peer_lock);
+		/*
+		 * The label is not under sk_peer_lock, and a connect() has the
+		 * LSM note it before it says who the peer is. So a task of a
+		 * cell gets it only once the peer is known to be of its cell.
+		 * From there on the peer of a stream socket does not change.
+		 */
+		if (foreign || (unknown && current_cell()))
+			return -ENODATA;
 		return security_socket_getpeersec_stream(sock,
 							 optval, optlen, len);
+	}
 
 	case SO_MARK:
 		v.val = READ_ONCE(sk->sk_mark);

-- 
2.55.0


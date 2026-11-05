Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892455;
	b=P+No+URavwJXqxLgAALawXkX+Hk9Lcqh64YTWYBrtoX9ThWyerE5Ww+sockj3JqBu33a
	 6FrYYO7aiM76ukgLR/EZ25oRU1ly8o9jPQYOsOpZcU0YemD/LrJH3FRq4bvsCCDthAls8
	 HnFtNj1o6QJ5yHv+BkyEcwlYCCiS31UdirENBCdizBAcR9Cg4YkIDGaTFjV5imq3qJ2cx
	 c13IFlqbrta+JCfvVDuVUE4GjbuJ0EHfOYb9xH2YeJvOBxf2aLl/3arCDTLR1cDp3dPRi
	 WfgIsVLQPd2Jkvba5AIsiZLhSSvsLHO1qlgQSULbepEwLJdZChMPyxz1vYKPFQKEzEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pbsocLyCu9Rmc4dh+QFJRSGvOQb5wt/oaKgO1G9gF5g=;
	b=H7Y36h/UbMKbWlvrjkiBKvj9aTUUEL5ucSJVo8+mI/bEeOufYbBdQS/KSrI7KP91yuVS
	 G8Dg088IZ8EnMK2hLl9jPaoyaV7s7///pdM2XdMqeNodbGpbfFwC6E8PVa/2PMvx32q0Y
	 JBmqFmq94LT2cTJqSdRuY3xwsSM1GfGF7ilHJHFGobHp5rCoKd0O8N22KETLAlmjW8qdW
	 KI+jrJljqn2H8yLao/bzuOsa832hpxIfvZpVa+Kfd+5S3dG8oKTvvAbjOAnwn/4H0IAyI
	 v3RNKXWeclePS79vM/qvhUjSgSg0+J2fPQa8yoQ0UdOm9DhyFJgdEt4OYdXVikTzopA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="KQK5LU/x";
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447F606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7447F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=KQK5LU/x
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53381e53b80so20803621cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892454; x=1794497254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbsocLyCu9Rmc4dh+QFJRSGvOQb5wt/oaKgO1G9gF5g=;
        b=KQK5LU/x+9RemIJlJmNJfQXWDClHpcCB4smF2/Z013ksgNIE2GSzRwQWL7t/PN3NCP
         JQBx5Tsm1WViOWMPWLoa71ExO5S9JECK0Xko1UCk8O3kluG5fD/5LTancgyxyMcMMHLG
         MgvbY/KGZpFbWbH6Lbb/Ya+6YhHK601aDSRX+QihB+c0w5WDPQ1ReKTflS55CYfERIyZ
         R0HIsfS3SeCPIdoYEdkEVjGC5yL0DD7g5SVNCTD2PDGqNK6g+XKRAarv7sJSLpgxTIkG
         YKNtA66ZoOgEIoXTbe5wXRCWgc2zg3KitJ/2RhCLMLFRg0tTswBkUCviG5eiMFUNTKeH
         JMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892454; x=1794497254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbsocLyCu9Rmc4dh+QFJRSGvOQb5wt/oaKgO1G9gF5g=;
        b=W3cOMyFO/VErTmJx9At9FeE60d9JzvBJZFAXo53Z119koMzIIpanWFj7WL6ny3T2Xx
         zr+EXwU9D7L/8nctFRXccoVrvQUODmmavekB79ybdSdmiQ6kjvmXn0KSx+QrGpUrvy1d
         Cb99udejKfpym1kR7zlSuw/ADPopqaquwSrCeOEv6FQtLd2t43jEoRJEjbZhuBLfNc06
         Yvlr2D/o6n4GCVeCxQJI8bYIVZuFZEd4fguov05FQHsexZkKBmSDToraSXNpoF6aqvKr
         ql2b7BGyNZiquaCP97M6xKDqHLZKAUyZvQ8VVSo+psUkqrMBqMO+5cuvc6l6FiFmYsmH
         HETw==
X-Forwarded-Encrypted: i=1; AKwUvBwu+15H28/hZcvcJUerDUtaYtSoulS5l2KptuaJLw47CqmnfSO3H2oC5ftYzTrIUfJo7LJTv/BFDidUwY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sn6PzksS9xL4MjM1v08qZbwUsDys3fZLdsw1jB7sDInm+20mU
	nav16ZOR9IpOVzh44Bht7mH/X6OnuIvMT/7F7t72BtJ8Xeal52enL/CMMCZzvY8o8eg=
X-Gm-Gg: AYBFou31y69GwDu5rOZTJoAGxHUhqUPmjs0jADxK8WchG0PcVmcm1g08BciI0Og1v3X
	LdhG5wQ6xujLB6bkQcLvqbIk9Lu3TlVeFPVoCaX0IXc7vj5b2VvIalsoszUV5kqbrGWGQgPj1cT
	85S44WdFrR/jBtH2wfYRtMLcNHgbvX/v4MLS6NEfRuFw4oXOV4Ao+50XQbTUm6n52tHsCIuZq0o
	3+8vl/+KfAIwJigpp/WjbXSMAt6Z0ZxxwF43H9U5W98uBCk1b4EJCIcO2Zpz91PmM/l5XE4lFG5
	cdWILiPW6nB36dtnDY95KZMC3P4nDrD1GS/ZN4gh2vkImHM1Cn2SVV7HJFtRtEkTLlUEQA8OVMK
	oGIw2aiVmjeA9tq8Y0lUKG4/s486lCh0TfvL4W56hSPVeuQV+k/W29oSj7ETB0PcY+qmuO9Gzrx
	R0/UZb12lqBfbk5St87FyvfqNxjCu+MSdZWQ8F7Ry/1aucE/6wemWHhZzFQsYZEdo0lcSEq8z5v
	zEtqQ7l4UbtByJDRh4FQiViSpM23+uhoXFwLBs7gjMLGA8HiGIY7p29MEagBMillMUykNk2Igj+
	jguInbvH6o89nRcrbYiQOirclDFzbseerprWf0LKxJQ+9Hvang4SRhDt9Mk8dSelacg=
X-Received: by 2002:a05:622a:1f10:b0:537:59b4:3338 with SMTP id d75a77b69052e-542b65931a6mr335957311cf.25.1793892454290;
        Thu, 05 Nov 2026 07:27:34 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100af507sm54208461cf.6.2026.11.05.07.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:27:33 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:06 +0000
Subject: [PATCH RFC v3 74/90] net: give a cell without a network no sockets
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
Message-Id: <20261105-b4-cells-v3-74-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=7967;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=27wHnLTXQNwpvpKsc5xrNHL8AKs/aDpCLvYXPRw6xys=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN4edvDZLJ38j6ZZlJw8SqR/x4qkVV6HRcflJwWxhKmSLIhxpCrA54ubBo/fCXZqK+UetRMfRMd
 FGBZElve8fAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A cell whose "net" slot is left empty should have no network. So far it
has a network namespace that nobody has set up, which is not the same
thing. It is an empty network, and all the code that operates on one is
within reach. The tasks can create sockets of every family and talk to
rtnetlink and every other netlink family, although none of that is of any
use to them. There is no equivalent of failfs for the network.

Refuse every socket except a unix socket for a task of such a cell. The
error is EAFNOSUPPORT, which is what a kernel returns that was built
without the family. The check is in __sock_create(), which socket(),
socketpair() and the socket operation of io_uring all go through.

A socket that is handed to the cell works, and so do the sockets that
accept() returns for it. Holding the socket is the authority to use it,
and it is the only network that such a cell has.

Holding the socket is not the authority to inspect the network that it
belongs to, though. Many ioctls are about the network rather than the
socket, and they work on any socket. Through a single socket of the host,
a cell could list the devices of the host and their addresses. Refuse
those ioctls with ENODEV, by number, before anything else looks at them.
That covers every ioctl from SIOCADDRT upwards except SIOCOUTQNSD. The
protocol private range can contain either kind, so it is refused as well.

The check looks at the cell of the caller, not at a mark on the network
namespace. So it holds no matter which network namespace a socket belongs
to.

The decision is recorded once the seal has created the network namespace.
If the seal fails before that point, the slot can still be filled. If it
fails later and the builder then asks for the namespace with cell_open(),
the decision is reverted.

The network namespace still exists, because unix sockets need one. A
single static namespace for all such cells would avoid creating and
destroying a whole network namespace per cell. That requires moving the
unix socket tables out of struct net and is left for later. It would make
no difference from inside of the cell.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cell.h   |  7 +++++++
 kernel/cell/boundary.c | 19 +++++++++++++++++++
 kernel/cell/internal.h |  1 +
 kernel/cell/slots.c    |  9 +++++++++
 net/socket.c           | 28 ++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/include/linux/cell.h b/include/linux/cell.h
index 0451055f74fc..b12e2f124769 100644
--- a/include/linux/cell.h
+++ b/include/linux/cell.h
@@ -249,6 +249,13 @@ bool cell_may_change_cgroup(struct cgroup *cgrp);
 static inline bool cell_may_change_cgroup(struct cgroup *cgrp) { return true; }
 #endif
 
+/* A cell without a network. */
+#ifdef CONFIG_CELLS
+bool cell_no_net(void);
+#else
+static inline bool cell_no_net(void) { return false; }
+#endif
+
 /* A mount is idmapped for a cell. */
 #ifdef CONFIG_CELLS
 struct user_namespace *cell_idmap_userns(const struct file *file);
diff --git a/kernel/cell/boundary.c b/kernel/cell/boundary.c
index 3891dfe899f2..af67ef68d4a2 100644
--- a/kernel/cell/boundary.c
+++ b/kernel/cell/boundary.c
@@ -85,3 +85,22 @@ bool cell_may_change_cgroup(struct cgroup *cgrp)
 {
 	return cell_may_migrate(current, cgrp);
 }
+
+/**
+ * cell_no_net - is the caller in a cell that was built without a network?
+ *
+ * A cell whose "net" slot was left empty has no network. Its tasks make no
+ * socket but a unix socket, and learn nothing about a network through any socket.
+ * What they are handed works: a socket is the authority to use it.
+ *
+ * It goes by the cell of the caller and not by the network namespace it is in,
+ * so that it holds whatever that is.
+ *
+ * Return: true if so, false for a task of any other cell and of the host.
+ */
+bool cell_no_net(void)
+{
+	struct cell *cell = current_cell();
+
+	return cell && cell->no_net;
+}
diff --git a/kernel/cell/internal.h b/kernel/cell/internal.h
index c7a1895eadd4..4eafa19daa25 100644
--- a/kernel/cell/internal.h
+++ b/kernel/cell/internal.h
@@ -33,6 +33,7 @@ struct cell {
 	struct mnt_namespace	*mnt_ns;
 	struct pid_namespace	*pid_ns;
 	struct net		*net;
+	bool			no_net;		/* the slot was left empty */
 	struct cgroup		*budget;
 	u64			budget_id;
 	kuid_t			budget_uid;	/* who owned it before */
diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index 75855f2ee020..2273d9ce733f 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -211,6 +211,7 @@ static int cell_seal(struct cell *cell)
 	struct nsproxy *nsproxy;
 	kuid_t root_uid;
 	kgid_t root_gid;
+	bool no_net;
 	int ret;
 
 	if (!cell->budget || !cell->mnt_ns)
@@ -227,9 +228,15 @@ static int cell_seal(struct cell *cell)
 	ret = cell_make_pid_ns(cell);
 	if (ret)
 		return ret;
+	/* No network, see cell_no_net(). Unix sockets need a namespace to live in all the same. */
+	no_net = !cell->net;
 	ret = cell_make_net(cell);
 	if (ret)
 		return ret;
+	/* Only now. Had that failed, the slot would still be there to be filled. */
+	if (no_net)
+		cell->no_net = true;
+
 	cgroup_ns = cgroup_cell_ns(cell->user_ns, cell->budget);
 	if (IS_ERR(cgroup_ns))
 		return PTR_ERR(cgroup_ns);
@@ -410,6 +417,8 @@ SYSCALL_DEFINE5(cell_open, int, cfd, unsigned int, what,
 			ret = cell_make_net(cell);
 			if (ret)
 				return ret;
+			/* A seal that failed may have made it. Whoever asks means to set it up. */
+			cell->no_net = false;
 			ns = &get_net(cell->net)->ns;
 		} else if (!strcmp(key, "pids")) {
 			ret = cell_make_pid_ns(cell);
diff --git a/net/socket.c b/net/socket.c
index 2e3b5737c481..c9659f7370ef 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -106,6 +106,7 @@
 #include <linux/route.h>
 #include <linux/termios.h>
 #include <linux/sockios.h>
+#include <linux/cell.h>
 #include <net/busy_poll.h>
 #include <linux/errqueue.h>
 #include <linux/ptp_clock_kernel.h>
@@ -1352,6 +1353,22 @@ static long sock_do_ioctl(struct net *net, struct socket *sock,
  *	what to do with it - that's up to the protocol still.
  */
 
+/*
+ * Is @cmd about the network that a socket is in, its devices, addresses and
+ * routes, and not about the socket? Those are served for any socket, whatever
+ * its family, some of them by the family itself. From SIOCADDRT up that is all
+ * of them but one. What a protocol keeps to itself, SIOCPROTOPRIVATE, may be
+ * either, the counters of multicast routing are in there, so it counts.
+ */
+static bool sock_ioctl_about_net(unsigned int cmd)
+{
+	if (cmd >= SIOCIWFIRST && cmd <= SIOCIWLAST)
+		return true;
+	if (!is_socket_ioctl_cmd(cmd) || _IOC_NR(cmd) < _IOC_NR(SIOCADDRT))
+		return false;
+	return cmd != SIOCOUTQNSD;
+}
+
 static long sock_ioctl(struct file *file, unsigned cmd, unsigned long arg)
 {
 	const struct proto_ops  *ops;
@@ -1361,6 +1378,10 @@ static long sock_ioctl(struct file *file, unsigned cmd, unsigned long arg)
 	int pid, err;
 	struct net *net;
 
+	/* There is no network, so there are no devices. */
+	if (sock_ioctl_about_net(cmd) && cell_no_net())
+		return -ENODEV;
+
 	sock = file->private_data;
 	ops = READ_ONCE(sock->ops);
 	sk = sock->sk;
@@ -1620,6 +1641,10 @@ int __sock_create(struct net *net, int family, int type, int protocol,
 	if (type < 0 || type >= SOCK_MAX)
 		return -EINVAL;
 
+	/* As in a kernel that was built without the rest of them. */
+	if (!kern && family != PF_UNIX && cell_no_net())
+		return -EAFNOSUPPORT;
+
 	/* Compatibility.
 
 	   This uglymoron is moved from INET layer to here to avoid
@@ -3642,6 +3667,9 @@ static long compat_sock_ioctl(struct file *file, unsigned int cmd,
 	struct sock *sk;
 	struct net *net;
 
+	if (sock_ioctl_about_net(cmd) && cell_no_net())
+		return -ENODEV;
+
 	sk = sock->sk;
 	net = sock_net(sk);
 

-- 
2.55.0


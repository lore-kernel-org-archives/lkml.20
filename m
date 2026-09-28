Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAA492E39
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587671; cv=none; b=j3156qzikrrREY2czTnbhOmdNAGwdLnNQyO6RT5LLXNDjpU1wQdARXqz7zA0XFtS35iFO9u/PtKx6dUhG7oEuzerM0OSW2PNJRVphXOtLvxnnO/TNbcCeKUtllmimQxmv6cJIWbhe4wFggvWEiD8+dpGRLJYrfXztTQZHr1NEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587671; c=relaxed/simple;
	bh=K47S0o1IDTs57pfVqb5rYlm9JcVvnUglkwthK/H1mRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGGPC96f5AS2kTa75ivAYFjWaNY9F4VRiSDylddr6E4IAY3RgDYY3T6kxrNH3vmOmCF5IJqlNSN4QbYQvpPiVUmMoc3QTod/fPffpkANvp+RMfcakSJE/BPy9ofL7OCA76xw95lDkoeu2AGuSQAGSsfdvyql38x9zbDo+z5gfdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=k9Z2m/Bd; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="k9Z2m/Bd"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so424430866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1790587665; x=1791192465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LAF+kkW3AoPDUIK7HIdkMlRTlUPB1ATHdV+Y8MxEC4=;
        b=k9Z2m/BdqTzFMoyHfv/JOARWm/8AnlceIYR0N7n5+Wmg5ipNyzKzyIJjnxQDOwjjXT
         s5UefAkoWyfXD4/hKaXSDdDAyUwTXVdL+7mFELQWXHAKNozgGjjeTzjDgtAQ8JvRyRSx
         v0s4msjOmS5GzYSDXMG8TICnot+7vHlUL0sIARwOkLbCoAAyNndCYAW3qEwcYIuntI3t
         8yoE9yseKi4a4IIWsWFftPkoet8D4rSWcclWmrwXEc/D+2/sX+E1d8LaHjwfyEEZUpZR
         kdGenezbQx3d0FzoZsfj/MfuWlH+Exv8H84BxPl8hg/KKol6YQmlQ712okDC06NG97Yg
         NCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587665; x=1791192465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LAF+kkW3AoPDUIK7HIdkMlRTlUPB1ATHdV+Y8MxEC4=;
        b=Q1AGDHJLpDyVGfQoHcYSNm8ifRVRUqLfn5AOgMtll/SOaKwpm+pClFOuS5/ZtRpkXb
         jyMFjSuKwlfAXq6byjJUIiqbCcF+MAuEDmxIrGy/73JUdQXIlaaYfQmkCDWBySfCna4S
         2z1LWW9Y0CbTC4byvPjuzyGjbqncF1K6+ThngfMczRqrP8mjwZeyQEYTUs0AQE0ZyEPd
         WShV37uXcqWrOat5xFIZ7kPaHclw/L/nlfoRxEEErotMmHGxbmWGWPomS2BIqf3ogvQJ
         NZAvTWW2cZ4wbrxyCrH2fPZcV/8pYubBU/1FHE+w5X9/1r+ZzGyG+xlWUPrTBP+lRiTu
         U7xA==
X-Forwarded-Encrypted: i=1; AKwUvBx+7Y2qZG2gAJxl7kA/CGYAIrJMxJKZS6Ad6SM2pUYKi/tliOHzGdoyWhDsrXvdinvDPqmy/G7ZgPwMseY=@vger.kernel.org
X-Gm-Message-State: AFuF++kzWc9dyg7y/6foMDEKDOyXawAsZO6kIVxm0wXU96Wb5nuH93ix
	+f2iK3GFb/ILIlKcxvc2A39cFrmfQz1zsGj6O05W2xfp6Ft+RwwJYnbVNX2pNbKUxsHb
X-Gm-Gg: AYBFou2/HOVcAWlzDNb9GyBebOFc9m9Y7C0kpQcIcHrO2awc1AsKnozdRT8TPWDO8P+
	VZnlJNAJ7bCqzXjb+Vzw6bq4XsSGUEbwUso1sMxiSq481mCW0YIweKWCiSxmInOXAmftufRvSF1
	JxzUvy15VN0e0J3PG/Afv631g6+6Wnm9xvxRjqukd13slGwkZsvpxIjrS5mhrsbSj0PK7eyeMkj
	XmplwRWbVr9bZEGfRlA8V1iFM72D+KYS0fLT9w73gR3h35SJkkdAngF7g/kgIoyPEsDKTb3rp62
	elcgSUYS8dcrNpqQkfkKsrbF1DHDeDf7LXK1ZsDUCO+VigsC/gfDRKxePvDE61MXX9mN8yuOQvC
	lN5pkX0SDRceg0Rai4cmTCEuxK/sMrDei1CfQ+zH46DfRj9dw+/4kFrApjfQAffA2qE9zpPXjpk
	92UatXkzBSkhPGijZZu+hmoQ9GWGXg+9FOgDmoEq7HkeeYY37QAgV3U/JyB5D/0DGgW637nt2fl
	Ru0xiGBVHCKt76m3FB3reLa0ekGoUPv1cIhyO7Cua+dJJ9eaqDv
X-Received: by 2002:a17:906:9fc4:b0:c29:f5d8:9c76 with SMTP id a640c23a62f3a-c2ac229852bmr1018769466b.37.1790587665531;
        Mon, 28 Sep 2026 02:27:45 -0700 (PDT)
Received: from [169.254.24.37] (tmo-085-169.customers.d1-online.com. [80.187.85.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc8b71b4dsm205609466b.1.2026.09.28.02.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:27:45 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 28 Sep 2026 11:27:16 +0200
Subject: [PATCH v3 09/10] pidfs: record the coredump on the dumping
 thread's pid too
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-work-unix-passpidfd-v3-9-532018a91b21@amutable.com>
References: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com>
In-Reply-To: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com>
To: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 linux-fsdevel@vger.kernel.org, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Andrew Halaney <andrew@amutable.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>
X-Mailer: b4 0.14.3

From: Christian Brauner <brauner@kernel.org>

If a thread-group coredumps only the thread-group leader pidfd will
return coredump information. A pidfd for the thread that took the fatal
signal cannot be used to retrieve it.

Record both the thread-group leader and the specific thread that took
the signal and register both in pidfs. Mark both the thread-group leader
and the specific thread with the coredump information so retrieval works
for both pidfds.

Now that both SO_PEERPIDFD and SO_PEERPIDFD_THREAD are available it's
easy to get the coredump information for the specific thread.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 fs/coredump.c            | 22 +++++++++++++---------
 fs/pidfs.c               | 11 +++++++++--
 include/linux/coredump.h |  4 +++-
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 9b267d3c0ed7..870ad720b215 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -454,7 +454,7 @@ static bool coredump_parse(struct core_name *cn, struct coredump_params *cprm,
 				 * leader we know that the thread-group leader
 				 * cannot be reaped until @current has exited.
 				 */
-				cprm->pid = task_tgid(current);
+				task_pids(cprm->pid, current);
 				err = cn_printf(cn, "%d", COREDUMP_PIDFD_NUMBER);
 				break;
 			}
@@ -626,13 +626,17 @@ static int umh_coredump_setup(struct subprocess_info *info, struct cred *new)
 	struct coredump_params *cp = (struct coredump_params *)info->data;
 	int err;
 
-	if (cp->pid) {
+	if (cp->pid[PIDTYPE_TGID]) {
 		struct file *pidfs_file __free(fput) = NULL;
 
-		pidfs_file = pidfs_alloc_file(cp->pid, 0);
+		pidfs_file = pidfs_alloc_file(cp->pid[PIDTYPE_TGID], 0);
 		if (IS_ERR(pidfs_file))
 			return PTR_ERR(pidfs_file);
 
+		err = pidfs_register_pids(cp->pid);
+		if (err)
+			return err;
+
 		pidfs_coredump(cp);
 
 		/*
@@ -695,12 +699,12 @@ static bool coredump_sock_connect(struct core_name *cn, struct coredump_params *
 		return false;
 
 	/*
-	 * Set the thread-group leader pid which is used for the peer
-	 * credentials during connect() below. Then immediately register
-	 * it in pidfs...
+	 * Set the pids of the dumping thread and its thread-group leader
+	 * which are used for the peer credentials during connect() below.
+	 * Then immediately register them in pidfs...
 	 */
-	cprm->pid = task_tgid(current);
-	retval = pidfs_register_pid(cprm->pid);
+	task_pids(cprm->pid, current);
+	retval = pidfs_register_pids(cprm->pid);
 	if (retval)
 		return false;
 
@@ -722,7 +726,7 @@ static bool coredump_sock_connect(struct core_name *cn, struct coredump_params *
 	}
 
 	/* ... and validate that @sk_peer_pid matches @cprm.pid. */
-	if (WARN_ON_ONCE(unix_peer(socket->sk)->sk_peer_pid[PIDTYPE_TGID] != cprm->pid))
+	if (WARN_ON_ONCE(!pids_equal(unix_peer(socket->sk)->sk_peer_pid, cprm->pid)))
 		return false;
 
 	cprm->limit = RLIM_INFINITY;
diff --git a/fs/pidfs.c b/fs/pidfs.c
index 586af2e5811c..29299b2c7ca7 100644
--- a/fs/pidfs.c
+++ b/fs/pidfs.c
@@ -793,9 +793,9 @@ void pidfs_exit(struct task_struct *tsk)
 }
 
 #ifdef CONFIG_COREDUMP
-void pidfs_coredump(const struct coredump_params *cprm)
+static void pidfs_coredump_pid(struct pid *pid,
+			       const struct coredump_params *cprm)
 {
-	struct pid *pid = cprm->pid;
 	struct pidfs_attr *attr;
 
 	attr = READ_ONCE(pid->attr);
@@ -814,6 +814,13 @@ void pidfs_coredump(const struct coredump_params *cprm)
 	smp_wmb();
 	set_bit(PIDFS_ATTR_BIT_COREDUMP, &attr->attr_mask);
 }
+
+void pidfs_coredump(const struct coredump_params *cprm)
+{
+	/* The dumping thread's pidfd reports the coredump as well. */
+	for (enum pid_type type = PIDTYPE_PID; type <= pids_last(cprm->pid); type++)
+		pidfs_coredump_pid(cprm->pid[type], cprm);
+}
 #endif
 
 static struct vfsmount *pidfs_mnt __ro_after_init;
diff --git a/include/linux/coredump.h b/include/linux/coredump.h
index 7b38ee2e7913..0bbb7de6a402 100644
--- a/include/linux/coredump.h
+++ b/include/linux/coredump.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/fs.h>
+#include <linux/pid_types.h>
 #include <linux/sched/coredump.h>
 #include <asm/siginfo.h>
 
@@ -32,7 +33,8 @@ struct coredump_params {
 	int vma_count;
 	size_t vma_data_size;
 	struct core_vma_metadata *vma_meta;
-	struct pid *pid;
+	/* Dumping thread and its thread-group leader by pid type. */
+	DECLARE_PIDS(pid, PIDTYPE_TGID);
 };
 
 extern unsigned int core_file_note_size_limit;

-- 
2.55.0


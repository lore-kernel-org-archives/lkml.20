Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F64C77AF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213007; cv=none; b=Ec8Vy1ACKr1n44b833MmpJ73JZzwtChF8SlScLO/GeOZQnY5hcKJSF7tksWrLD/CCDVOdrfTugV0HHIHGJRa9eQUAKHrtC5G7g0TEz1LuG3TwUquEOmAc47Q3D7mWVp44LK/gHeiJXtbSH/aoObOxTMxP2Zq2gavklh95UFeUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213007; c=relaxed/simple;
	bh=K47S0o1IDTs57pfVqb5rYlm9JcVvnUglkwthK/H1mRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pe+3Y0b9alRUKNqPOEuVTcOZy89ZAGfBqGc7j/4dBN9QYbUZS+7DxID+dCnIafCfD2XALg/lReYLKAfJoW5DgNW9vl2r6pOh/34yWOZcrylFiMXThU+wDOzVRUQQ1HJgk6Ny5qcQOW3OT/LRiYCqRCBVhEr+l0gA66y77C/txuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=w31Q5w6S; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="w31Q5w6S"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8abc87cbd93so13238477b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791213000; x=1791817800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LAF+kkW3AoPDUIK7HIdkMlRTlUPB1ATHdV+Y8MxEC4=;
        b=w31Q5w6Sp/xpjvwMiFNOqqmNAAvLTQuMo9G0/hihQ/TDFNkczuU4s0RyUXcINGRcfR
         RwnKWBHYuHsh57niyNQOlo9Ef5DK6+LFVG/O2EOQAQX3QiGEQLq5ENa/vr/D0gXH85jS
         5qJviqFyCK4qvaubyaoMvbvYvbDUdr8LhGabOby0TT8cU1lY1GttHNEjRdxDjjifQJ3t
         9cPS38ODR23KPlXAwL5WtdDjyc2lA1fLRJEppcz+d5EvgEjWScRBiR92j0emAufqMRad
         966tmTKxu3zkroMyGMLmyqEvXuFqsk6qKEuql6YFTW64tWuY/5m3MS8yq3lQkvKoJHjY
         Kt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213000; x=1791817800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LAF+kkW3AoPDUIK7HIdkMlRTlUPB1ATHdV+Y8MxEC4=;
        b=k3fnnB0jHXjUuQk8IBmzGeDRalQa9OT/EEP63znhhobgVg78KKbrATHhhGCt9Uq41D
         yXCzdGY/puPRdr63shx0364dE/H2I30C6cepCYXe2+AQcNCINSWuKI6zjg6/oext25bb
         A6yw4eWSkG/K7Hz+DLNGxw6wY2bi+eGwvHKjm8Otx2WRT4cDwnWdsLnkG9tF5jpCbVxt
         qgPy7iBcCeStw6Es9zE5/sx9IkXzoogZvvnHkMiLFHMDKR8uANgtSH1o7nYJINHIRuE5
         9G793xbLPFWm7mjLDKeTwwrIIKfA8z7BK3SOvuWtFZ/zJUdyn5XnIx+ozSTHlsOdFGdR
         qWVw==
X-Forwarded-Encrypted: i=1; AKwUvBzxSjZXa5DZIxYTsVn8l0/EAqrt6GyJqhlhVF3Vyu3n5Au5o1V1p6E1UeXWgBiNgZc558f665mKLjmkHtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwfMSwXH4aD4ia4i2bEehG/NDdCEzAnO2zQtlx+txT/B/S5o2V
	y51TyS+vEKM9Ta7NajwfMZcCQtQfF6h8lclPPWZ4xBDXd419qxxPCP7l7NakMypPiXPmetbj+E3
	udo414A==
X-Gm-Gg: AYBFou32br8oquP644m+6f39fjm132EvPsAvui+kiC+eMCxoO3Dul1vXDI+RTWsTA/K
	VUXqz2BldoNXfIoXrC6FO7b/+UCGmTayvyyjXTh/2QIuya1VSAYvFQm43bA62eZXh7R5c/0l0PQ
	xY2J/BvmD6wAcQmGiK8tGyhRaPLx2D++wET/3tlwn7DX/zWQia3+EGL3KSSJSA8jI7vkQGRCAgR
	GcxdXh50359CNhwZPjqVV2ooIH8+Ffh2yvvVtWjvxcqtxvfrxA8qnKsFrqcdCaDGu9aGDJcRo3H
	Yw/aJIEVSch3USa2dnE1EWLAcKMlVPwve109vKsFuAWHKZ64GRM3xIXhY47lgF3+OhYXt57qdi9
	KtuS4eUPAM2k/e4VliV3wHUR3p79mu9rOk3KPXof6Mx4NMtaHTuapbIWoT/Wn94X7ruskQPXwQm
	AR9Qw8O9u4cdTuiL0E2Ay/Y6YzBLz2b2KHqFRsOnBYEazovZPCTL0fTuPWwCLsHY+wt7uPsb1mK
	J2uZdGkcZxD3jy3pg4Jg5aRSOxgGzWWInI4toQkubXapPj3pzpJSU4=
X-Received: by 2002:a05:690c:60c4:b0:883:768:7432 with SMTP id 00721157ae682-8ae3a2f521fmr49906927b3.49.1791212999962;
        Mon, 05 Oct 2026 08:09:59 -0700 (PDT)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33fe81fdsm41210467b3.47.2026.10.05.08.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:59 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 05 Oct 2026 10:09:39 -0500
Subject: [PATCH v4 09/10] pidfs: record the coredump on the dumping
 thread's pid too
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-work-unix-passpidfd-v4-9-350183b6e02a@amutable.com>
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


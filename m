Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030921A2C04
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728220; cv=none; b=jbCZyZ2J9K3jHSZh4lzVjCTQEL2cax39FTHjAfJ+brpywySe0svPph3zaq4qV5JYnP2RkKVmAcAVLY7Gz9m2wSJGGCHCm9zFhnbXN9FRdeZtYN9KohyAr6zOPYKtLE86i+X0DZK1it7gERtIjNOec6Q3AvfXGdZVFL4Zg4XLLjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728220; c=relaxed/simple;
	bh=e1dDLkcvXNgEO9rk83RADUXdAnMY1jEy0NVgi20o+1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPzExXAk1USzUV/297nls2g+vq0OeY97ADnCoZb0SlpgD2ZB/UyYo6WNTAbjxDESTeueA1GKWsNEx0ptqbb7dLLAeP15nzfZ7bdxjDglhd33hQICMpYT+YCi9UFzCvRBwTuFl2MMkAi89a8hsXAAl4LHsegwMZWMfhGlbzRivGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VmmdmFjc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VmmdmFjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791728217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=pe9B+AqSrDqweAKiBJmmt4yZGT2bHFlFazIrG9RY7SU=;
	b=VmmdmFjcY8Z65F1RihEW+7Tvynzd1QoQNJKJvzFap3n2x1+f0vg4VXoU2IKE8FDXR4Eawo
	8HwkzNjt31c7uguMo1zIKevKiwNmgbp/yT00KbsIRAjTji7OSC1ohY/f5upR6kCmBi1sgy
	zSVfOocfvEURxsGrWq85jPt6CpQR81s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-C3sNKSVNMjqcDM6EhQH-Zw-1; Sun,
 11 Oct 2026 14:16:56 +0000
X-MC-Unique: C3sNKSVNMjqcDM6EhQH-Zw-1
X-Mimecast-MFC-AGG-ID: C3sNKSVNMjqcDM6EhQH-Zw_1791728215
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DC73195410F;
	Sun, 11 Oct 2026 14:16:54 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6EACB472;
	Sun, 11 Oct 2026 14:16:52 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 11 Oct 2026 16:16:54 +0200 (CEST)
Date: Sun, 11 Oct 2026 16:16:51 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pid: document that do_each_pid_task() needs tasklist_lock
Message-ID: <asuaU8H_5MbO3-cW@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

do_each_pid_task() looks "obviously rcu-safe". This confuses people
and we already have 2 buggy users: send_sigio() and send_sigurg().

The reasons why it is not are not obvious at all, add the comment.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 include/linux/pid.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/pid.h b/include/linux/pid.h
index ddaef0bbc8ba..f5476d7140a3 100644
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@ -187,6 +187,15 @@ static inline pid_t pid_nr(struct pid *pid)
 pid_t pid_nr_ns(struct pid *pid, struct pid_namespace *ns);
 pid_t pid_vnr(struct pid *pid);
 
+/*
+ * Needs tasklist_lock if type > PIDTYPE_TGID. A lockless reader can:
+ *
+ * - race with a change_pid() that moves the task to another hlist,
+ *   and continue to scan the wrong list.
+ *
+ * - race with a copy_process() that adds a new task to the start of hlist,
+ *   and miss the new child.
+ */
 #define do_each_pid_task(pid, type, task)				\
 	do {								\
 		if ((pid) != NULL)					\
-- 
2.55.0



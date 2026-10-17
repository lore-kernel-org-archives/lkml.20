Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876306DCE1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252866; cv=none; b=sY2GCr0HtkC/K+t9zlJd582j0TNzD4S3CIeImOHPr/i8WfKlSNLGm4HrPUq14XGwSePQFaN7R89KvGx9B9JnTKNnVRRXcojvbCULrOIzY3U8Pk4livnxKhE4CKEMTdx2Jb7dXHSQkkHK0mOGTznWUXCg+5SE8DUhiBDqrBO2bFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252866; c=relaxed/simple;
	bh=LK9wMcLEjC6DWU8ASmB1wcW8I6axUqW3S7m+f1Fczk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eWDzffGhzM4z81hs6LT9OOdfZu0lj0Mu7B7oWLFhVNUpiMcxE5W7j4FNNLIwAC29eYXI+It3yg5CxAajCauLByPpsfgVVqzzuRNvVK/cfgw3snQ3faAdFVlqVh4TY/Au2G1uCWEkH3XJM9UXAVLGwkLpcrTzIQ03xxuzxrlDd2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFev5Y7b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFev5Y7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792252864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LLqUuJgLM3w0hVcq5wWWjL4rM/lAFogiFtiEJuhh/mQ=;
	b=QFev5Y7bRup1vwm73176p0dtI7/5xgv1CYVFiLXj3s0/Zl9AxtbIiHtxaEhcPTzStNTB6Y
	ZXV66knvHWZZlOeHAWElhOUzAMxrUk63rqhA0WoiLPCFPGy1GRmIwPvYTDP0gule2AiFk0
	q674k9f63vk8LRq0ZjgsjV9raYwnGmU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-Eznjq-ckPFe9R5q7r4wFzQ-1; Sat,
 17 Oct 2026 16:01:00 +0000
X-MC-Unique: Eznjq-ckPFe9R5q7r4wFzQ-1
X-Mimecast-MFC-AGG-ID: Eznjq-ckPFe9R5q7r4wFzQ_1792252859
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 844C91954209;
	Sat, 17 Oct 2026 16:00:59 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 578831956088;
	Sat, 17 Oct 2026 16:00:58 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 17 Oct 2026 18:00:59 +0200 (CEST)
Date: Sat, 17 Oct 2026 18:00:57 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] proc: use pid_has_task() in proc_inode_is_dead()
Message-ID: <atObuVZXbl9n-zFq@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

to make it more readable and consistent.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 fs/proc/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 6a39de424f62..a545796177e8 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2064,7 +2064,7 @@ static int pid_revalidate(struct inode *dir, const struct qstr *name,
 
 static inline bool proc_inode_is_dead(struct inode *inode)
 {
-	return !proc_pid(inode)->tasks[PIDTYPE_PID].first;
+	return !pid_has_task(proc_pid(inode), PIDTYPE_PID);
 }
 
 int pid_delete_dentry(const struct dentry *dentry)
-- 
2.55.0



Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080F23504B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104031; cv=none; b=haGgpsdhbf2ntr6z59bFDo1JZYuAxFryqdZWKKv624ygPRoie+sg0JB0wd2qnrgScVdYxqdqB/naA4AhjlYfGcA779XB2dc6Jn41xa6ACrmNGEH3J7Yt0pjOm/Wv5wwpK+ZckR0/CxCCv26YpWQhe4fCsuv8r7LjFPxH3avQia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104031; c=relaxed/simple;
	bh=y2mXXI4NcEMco3KVycXGDCt/sU6W/3q3C2TEB1HP+6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=G1+hyR4azwTUaTGUgsNhTVLYeBQe/bbxhTu86Pk5dRwEI/65pqEBip437aRGjoxaCqg8b5rj6NH9Lhx+0V2K5LUuY84T/IFE8mhyosgoZgYMZxwHcxIAaWvFdTNMgP3msJZIWj0x024AxSeuzbedKPSVIIK5AbPsWuO/uCeKLmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XRxTXga2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XRxTXga2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788104028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=oP+jvei6Pwgf08cgQpfmZlK7Y3SXlFtjw1xsW1B4eF0=;
	b=XRxTXga2RVPiSMNcR7/7NSNxzvYIDBDW4fAG1YvFGinmgFHN0C/aqOi9VoewSjHptkTYfX
	VaoAJ8tMqQKFZPRaRW3ZygzdQQl9/aXKPnrcaQSRNA34K727jB0QMbhfW4VPQ7PQ1nQ98i
	ngyvDnF5h3BjSDfBdqGRLZbiFwQYv3w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-711-1_QL-Kg1M-izdDHe0NwhBA-1; Sun,
 30 Aug 2026 11:33:45 -0400
X-MC-Unique: 1_QL-Kg1M-izdDHe0NwhBA-1
X-Mimecast-MFC-AGG-ID: 1_QL-Kg1M-izdDHe0NwhBA_1788104023
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6758B19540F2;
	Sun, 30 Aug 2026 15:33:43 +0000 (UTC)
Received: from fedora (unknown [10.44.48.13])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1E2DC7D6;
	Sun, 30 Aug 2026 15:33:39 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 30 Aug 2026 17:33:42 +0200 (CEST)
Date: Sun, 30 Aug 2026 17:33:38 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] sysctl: consolidate CONFIG_SYSCTL into a single block
 in kernel/sysctl.c
Message-ID: <apRNUoQq740oLJKy@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apRNJWJD52wsaX3s@redhat.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

After the previous cleanup there are two CONFIG_SYSCTL blocks. Move
the second block up into the first one and eliminate the redundant

Also add a proc_do_static_key() stub to the #else block. Not strictly
necessary today, but consistent with the other stubs declared in
include/linux/sysctl.h.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/sysctl.c | 160 +++++++++++++++++++++++++-----------------------
 1 file changed, 82 insertions(+), 78 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index d0a612c65b08..f6ea3eeeef65 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1255,6 +1255,87 @@ int proc_do_large_bitmap(const struct ctl_table *table, int dir,
 	return err;
 }
 
+int proc_do_static_key(const struct ctl_table *table, int dir,
+		       void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct static_key *key = (struct static_key *)table->data;
+	static DEFINE_MUTEX(static_key_mutex);
+	int val, ret;
+	struct ctl_table tmp = {
+		.data   = &val,
+		.maxlen = sizeof(val),
+		.mode   = table->mode,
+		.extra1 = SYSCTL_ZERO,
+		.extra2 = SYSCTL_ONE,
+	};
+
+	if (SYSCTL_USER_TO_KERN(dir) && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	mutex_lock(&static_key_mutex);
+	val = static_key_enabled(key);
+	ret = proc_dointvec_minmax(&tmp, dir, buffer, lenp, ppos);
+	if (SYSCTL_USER_TO_KERN(dir) && !ret) {
+		if (val)
+			static_key_enable(key);
+		else
+			static_key_disable(key);
+	}
+	mutex_unlock(&static_key_mutex);
+	return ret;
+}
+
+static const struct ctl_table sysctl_subsys_table[] = {
+	{
+		.procname	= "sysctl_writes_strict",
+		.data		= &sysctl_writes_strict,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_NEG_ONE,
+		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "ngroups_max",
+		.data		= (void *)&ngroups_max,
+		.maxlen		= sizeof (int),
+		.mode		= 0444,
+		.proc_handler	= proc_dointvec,
+	},
+	{
+		.procname	= "cap_last_cap",
+		.data		= (void *)&cap_last_cap,
+		.maxlen		= sizeof(int),
+		.mode		= 0444,
+		.proc_handler	= proc_dointvec,
+	},
+#ifdef CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW
+	{
+		.procname	= "unaligned-trap",
+		.data		= &unaligned_enabled,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
+#endif
+#ifdef CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
+	{
+		.procname	= "ignore-unaligned-usertrap",
+		.data		= &no_unaligned_warning,
+		.maxlen		= sizeof (int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
+#endif
+};
+
+int __init sysctl_init_bases(void)
+{
+	register_sysctl_init("kernel", sysctl_subsys_table);
+
+	return 0;
+}
+
 #else /* CONFIG_SYSCTL */
 
 int proc_dostring(const struct ctl_table *table, int dir,
@@ -1354,89 +1435,12 @@ int proc_do_large_bitmap(const struct ctl_table *table, int dir,
 	return -ENOSYS;
 }
 
-#endif /* CONFIG_SYSCTL */
-
-#ifdef CONFIG_SYSCTL
 int proc_do_static_key(const struct ctl_table *table, int dir,
 		       void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct static_key *key = (struct static_key *)table->data;
-	static DEFINE_MUTEX(static_key_mutex);
-	int val, ret;
-	struct ctl_table tmp = {
-		.data   = &val,
-		.maxlen = sizeof(val),
-		.mode   = table->mode,
-		.extra1 = SYSCTL_ZERO,
-		.extra2 = SYSCTL_ONE,
-	};
-
-	if (SYSCTL_USER_TO_KERN(dir) && !capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
-	mutex_lock(&static_key_mutex);
-	val = static_key_enabled(key);
-	ret = proc_dointvec_minmax(&tmp, dir, buffer, lenp, ppos);
-	if (SYSCTL_USER_TO_KERN(dir) && !ret) {
-		if (val)
-			static_key_enable(key);
-		else
-			static_key_disable(key);
-	}
-	mutex_unlock(&static_key_mutex);
-	return ret;
+	return -ENOSYS;
 }
 
-static const struct ctl_table sysctl_subsys_table[] = {
-	{
-		.procname	= "sysctl_writes_strict",
-		.data		= &sysctl_writes_strict,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_NEG_ONE,
-		.extra2		= SYSCTL_ONE,
-	},
-	{
-		.procname	= "ngroups_max",
-		.data		= (void *)&ngroups_max,
-		.maxlen		= sizeof (int),
-		.mode		= 0444,
-		.proc_handler	= proc_dointvec,
-	},
-	{
-		.procname	= "cap_last_cap",
-		.data		= (void *)&cap_last_cap,
-		.maxlen		= sizeof(int),
-		.mode		= 0444,
-		.proc_handler	= proc_dointvec,
-	},
-#ifdef CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW
-	{
-		.procname	= "unaligned-trap",
-		.data		= &unaligned_enabled,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
-	},
-#endif
-#ifdef CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
-	{
-		.procname	= "ignore-unaligned-usertrap",
-		.data		= &no_unaligned_warning,
-		.maxlen		= sizeof (int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
-	},
-#endif
-};
-
-int __init sysctl_init_bases(void)
-{
-	register_sysctl_init("kernel", sysctl_subsys_table);
-
-	return 0;
-}
 #endif /* CONFIG_SYSCTL */
 /*
  * No sense putting this after each symbol definition, twice,
-- 
2.52.0


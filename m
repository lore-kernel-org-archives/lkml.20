Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE7823504B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104036; cv=none; b=a7wAPVtgM+hHHHmJKnaxDJrWqW9rWuCR94ysPE1T8ZIJlqb1KJTbYBoHPfgtqtLsEqIzXt5Dq+GE58WNUfDkgXvnNLE1RC372/oe+TSZzGPX/nkiyw54m4SIv17UyZxhMUxLWLjfsLGptGFNzOKV3ZJkMHQy7WIx9Q0/90v1L0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104036; c=relaxed/simple;
	bh=70oCqBBoSTv5DaCW/nFvu3CrymPxNOg5ubjmttCD2fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sx6Q32nKRmWP+rEMjeTM2BXa4nBFraSZSo+tCBodivDVPjvBMhdmIizQf8L9t3fTFdqZ3rKRI/KMJCJW2x1IA2Nbn1tC+3YcA/wfiC6d6Y+52TD/TXt8w/xj8Wvj753emaemKMLNKIAp06EqXbqiyKDrLnAfjhgjtOU+eHaaRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPGcMlAz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPGcMlAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788104034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=GwKgkU/7anYEDkREv3CsBQbrNrroVx1a5tcXYAfd8fk=;
	b=gPGcMlAzi7YhVjCLfcft2xC8ygJGBn4UQHf1+PmDfLtli9LcujerPYfVxRi87ir96c9K0E
	eDWkJhAtf+AmNSxbMBM5LioePEQy1QeJ9CVvzsCOhG4++2xEmtKKNULXLs/XnGaE343Tv5
	0JHfpOzg1QzUWrwp93X5L+EQXqOyjnM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-141-L9TqTexIPRa0beGBqiHdiw-1; Sun,
 30 Aug 2026 11:33:50 -0400
X-MC-Unique: L9TqTexIPRa0beGBqiHdiw-1
X-Mimecast-MFC-AGG-ID: L9TqTexIPRa0beGBqiHdiw_1788104029
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D08161800EC7;
	Sun, 30 Aug 2026 15:33:48 +0000 (UTC)
Received: from fedora (unknown [10.44.48.13])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 86826195608A;
	Sun, 30 Aug 2026 15:33:45 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 30 Aug 2026 17:33:48 +0200 (CEST)
Date: Sun, 30 Aug 2026 17:33:43 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] sysctl: remove redundant CONFIG_PROC_FS checks
Message-ID: <apRNV23wMmkUkX31@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apRNJWJD52wsaX3s@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Now that CONFIG_PROC_SYSCTL is gone, CONFIG_SYSCTL depends on
CONFIG_PROC_FS directly in fs/proc/Kconfig, so the double guard
defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS) is redundant.
Simplify to "#ifdef CONFIG_SYSCTL".

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 drivers/parport/procfs.c | 6 +++---
 fs/dcache.c              | 2 +-
 fs/file_table.c          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/parport/procfs.c b/drivers/parport/procfs.c
index 3880460e67f2..1bfafc2a5724 100644
--- a/drivers/parport/procfs.c
+++ b/drivers/parport/procfs.c
@@ -26,7 +26,7 @@
 
 #include <linux/uaccess.h>
 
-#if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)
+#ifdef CONFIG_SYSCTL
 
 #define PARPORT_MIN_TIMESLICE_VALUE 1ul 
 #define PARPORT_MAX_TIMESLICE_VALUE ((unsigned long) HZ)
@@ -560,7 +560,7 @@ static void __exit parport_default_proc_unregister(void)
 	parport_bus_exit();
 }
 
-#else /* no sysctl or no procfs*/
+#else /* CONFIG_SYSCTL */
 
 int parport_proc_register(struct parport *pp)
 {
@@ -591,7 +591,7 @@ static void __exit parport_default_proc_unregister (void)
 {
 	parport_bus_exit();
 }
-#endif
+#endif /* CONFIG_SYSCTL */
 
 subsys_initcall(parport_default_proc_register)
 module_exit(parport_default_proc_unregister)
diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..7ce421e9191f 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -144,7 +144,7 @@ static DEFINE_PER_CPU(long, nr_dentry_unused);
 static DEFINE_PER_CPU(long, nr_dentry_negative);
 static int dentry_negative_policy;
 
-#if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)
+#ifdef CONFIG_SYSCTL
 /* Statistics gathering. */
 static struct dentry_stat_t dentry_stat = {
 	.age_limit = 45,
diff --git a/fs/file_table.c b/fs/file_table.c
index c68b8c0a4097..08ca3631b726 100644
--- a/fs/file_table.c
+++ b/fs/file_table.c
@@ -122,7 +122,7 @@ unsigned long get_max_files(void)
 }
 EXPORT_SYMBOL_GPL(get_max_files);
 
-#if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)
+#ifdef CONFIG_SYSCTL
 
 /*
  * Handle nr_files sysctl
-- 
2.52.0


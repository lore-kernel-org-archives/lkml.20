Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A890023504B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104027; cv=none; b=cftcKQEPJMsOlgH9H7Rzy4OJlzFhkdm+qzfv2kkSJ8vq71dPHup74ZUaTBSnf5lqkOwnJmuK6wui/fL2IwTlvt5dyfejNdf7c9/hD3ZV8V/MiiaE7qp+Db+8EWOJbDEVyTn/MCaaOZjtZZBMJvMfGE4ZLW5yf0/ccimMrRZzL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104027; c=relaxed/simple;
	bh=jhm3NAZ+3y+d/lkEaiwYZfH+acAQltildDJNLfw55p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fG4wgCd2gw9W2DJwcIXvCCctzOeifogjitgq2HLUic3HGziKUyt++oV45TvE4Wp0pOlJbtKd0Z9Gwg9Go7V0aAZl1lWxz8f8R56UBuDTOfO5or6WCt2HDIiqX6aaJSY/A9Yh5y/LcOb6Hj8sr28qg6A14n849iEjSfrpmh9DSXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iOc1NuEL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iOc1NuEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788104024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=HQJuDZfOh9ePnHnEm41F5AAnflLozpPvVIN5x96NxUw=;
	b=iOc1NuELfEjLOZjeEwKAWhM0PgFJswBgBSQiiNQNlD8YcsMw4iYTupiYiwNuRGg46TOygR
	XSbALDSOKyseX0ZjPzyh6D1Kn085osYm/BA4ZXLOs4sn1MbZ23N6cZ23fBJYzdesHAWcCe
	F68oxHtLUxvTk4d8EySxjm9FDPk6p2A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-EHG6YJaLNc2P2XxjBobwCA-1; Sun,
 30 Aug 2026 11:33:40 -0400
X-MC-Unique: EHG6YJaLNc2P2XxjBobwCA-1
X-Mimecast-MFC-AGG-ID: EHG6YJaLNc2P2XxjBobwCA_1788104018
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48A2119540F2;
	Sun, 30 Aug 2026 15:33:38 +0000 (UTC)
Received: from fedora (unknown [10.44.48.13])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AB5CA1800257;
	Sun, 30 Aug 2026 15:33:34 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 30 Aug 2026 17:33:37 +0200 (CEST)
Date: Sun, 30 Aug 2026 17:33:33 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] sysctl: collapse redundant CONFIG_SYSCTL nesting in
 kernel/sysctl.c
Message-ID: <apRNTTciSrVoEd64@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apRNJWJD52wsaX3s@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

After the removal of CONFIG_PROC_SYSCTL, several #ifdef CONFIG_SYSCTL
blocks ended up nested inside the outer (now the same) CONFIG_SYSCTL
guards.

Collapse them and remove a now-stale "/proc/sys support" comment which
referred to CONFIG_PROC_SYSCTL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/sysctl.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index f7b75985d542..d0a612c65b08 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -29,14 +29,12 @@ EXPORT_SYMBOL(sysctl_vals);
 const unsigned long sysctl_long_vals[] = { 0, 1, LONG_MAX };
 EXPORT_SYMBOL_GPL(sysctl_long_vals);
 
-#if defined(CONFIG_SYSCTL)
+#ifdef CONFIG_SYSCTL
 
 /* Constants used for minimum and maximum */
 static const int ngroups_max = NGROUPS_MAX;
 static const int cap_last_cap = CAP_LAST_CAP;
 
-#ifdef CONFIG_SYSCTL
-
 /**
  * enum sysctl_writes_mode - supported sysctl write modes
  *
@@ -64,14 +62,6 @@ enum sysctl_writes_mode {
 };
 
 static enum sysctl_writes_mode sysctl_writes_strict = SYSCTL_WRITES_STRICT;
-#endif /* CONFIG_SYSCTL */
-#endif /* CONFIG_SYSCTL */
-
-/*
- * /proc/sys support
- */
-
-#ifdef CONFIG_SYSCTL
 
 static int _proc_do_string(char *data, int maxlen, int dir,
 		char *buffer, size_t *lenp, loff_t *ppos)
@@ -1366,7 +1356,7 @@ int proc_do_large_bitmap(const struct ctl_table *table, int dir,
 
 #endif /* CONFIG_SYSCTL */
 
-#if defined(CONFIG_SYSCTL)
+#ifdef CONFIG_SYSCTL
 int proc_do_static_key(const struct ctl_table *table, int dir,
 		       void *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -1398,7 +1388,6 @@ int proc_do_static_key(const struct ctl_table *table, int dir,
 }
 
 static const struct ctl_table sysctl_subsys_table[] = {
-#ifdef CONFIG_SYSCTL
 	{
 		.procname	= "sysctl_writes_strict",
 		.data		= &sysctl_writes_strict,
@@ -1408,7 +1397,6 @@ static const struct ctl_table sysctl_subsys_table[] = {
 		.extra1		= SYSCTL_NEG_ONE,
 		.extra2		= SYSCTL_ONE,
 	},
-#endif
 	{
 		.procname	= "ngroups_max",
 		.data		= (void *)&ngroups_max,
-- 
2.52.0


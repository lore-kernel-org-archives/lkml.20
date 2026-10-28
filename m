Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205422;
	b=4ez2FVWhGNkPQmwGKB4ZYzRv+KYFJGgzbEfkfBUDzq3XsDqPMZv58ICumiDJ3A2JPpWH
	 ZcA8xWM+GnwynKFY6uMRgATDb1P8DFh5TSFOu+LOMlYXuLOpcdFiJL0/IH/6rwqiKuKKz
	 NKzpW075549rpLCzkpOHvPtV0frLRPndTI1LyAOdeYVbXqeBQfaeb5g/eo/GpBuqxjrDH
	 hCCcCgh9U7PaHnGCaoiVM5cNt/JWK/Zmzuli0gjk31U9e6hnOvMNJNPk1CLjlP1Y4pyf5
	 7zGm1JjAYfx7SQROgDdMvSB3Ds70kkBxyAJr8sXCmBdQl/TZn0KWeBKiAt36aQCfe+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205422;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fDePjpoho76IkO21zPxSdAlazbRUl0MQOs9eUXqZdL8=;
	b=AtjKobGH7E99RZTvtVdsGnqw11VCD3UG/euJvULuX+dioBrG4u8DsWSy7QW4Pzp7oFTW
	 hXHO/TUyz2o15NtdepKnU8i6NpO1giVExPNiVxVR0vMmGSIhHbrXCKdaDX1avn+dk/g1X
	 HHu8XcIjuOtq2lhcMAlMmX9rID3gIIZ6RtjuRvNwHFEWSKEBKJ725J7hfHjYUyq4A+7UQ
	 AI0mS8cZLytHYrKhmunPXzHPruGq5Yja0h0hGBoyPuT9S6m/wgBQlf3drixT9MMdisaC/
	 AC5VZpPvQmjVz9pBZqvI/iJRUjYiM3FuyPl2y+LnJQ8VsZVfI/RDzMrW4j4lAnqWiCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=psyj6FQO;
	arc=none smtp.remote-ip=95.215.58.27
Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEE606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BEE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=psyj6FQO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FLRUndFbYAFdlogJU4B2pEWps2bLHlKsTYbhaHv2gLk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205419; v=1; x=1793810219;
 b=psyj6FQOhbHCBf+2U4TBtnc3qEZI0bwuYPozmCh+uusjf+g2Av/V6rk30k2QCMVeQEq+5Hi6
 hAy4bGSlxqR3sF564l7REa5TMwd7qwCp2XKAxu1wieTBaWRxPpzu/JGw3WboqS2FEwUtOfP60eh
 0pLN9FAITcY6nAJRMf0vU/qc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 30602774f48cdcb9;
	Wed, 28 Oct 2026 16:36:59 +0000
X-Mizu-Trace-ID: 30602774f48cdcb9
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 14/39] sysctl: store IPv6 scalar sysctl bounds by value
Date: Thu, 29 Oct 2026 00:34:53 +0800
Message-Id: <705236dda0808b60d5429a00d1f4afc715f8bbea.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Yang <wen.yang@linux.dev>

Use numeric IPv6 bounds while preserving the IOAM native-word behavior.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/ipv6/icmp.c            | 22 ++++++++++-----------
 net/ipv6/sysctl_net_ipv6.c | 40 ++++++++++++++++++++------------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/net/ipv6/icmp.c b/net/ipv6/icmp.c
index 1ba2ff759075..4a38b2046876 100644
--- a/net/ipv6/icmp.c
+++ b/net/ipv6/icmp.c
@@ -1372,8 +1372,6 @@ EXPORT_SYMBOL(icmpv6_err_convert);
 
 #ifdef CONFIG_SYSCTL
 
-static u32 icmpv6_errors_extension_mask_all =
-	GENMASK_U8(ICMP_ERR_EXT_COUNT - 1, 0);
 
 static const struct ctl_table ipv6_icmp_table_template[] = {
 	{
@@ -1389,8 +1387,8 @@ static const struct ctl_table ipv6_icmp_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler = proc_dou8vec_minmax,
-		.min		= 0,
-		.max		= U8_MAX,
+		.min          = 0,
+		.max          = U8_MAX,
 	},
 	{
 		.procname	= "echo_ignore_multicast",
@@ -1398,8 +1396,8 @@ static const struct ctl_table ipv6_icmp_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler = proc_dou8vec_minmax,
-		.min		= 0,
-		.max		= U8_MAX,
+		.min          = 0,
+		.max          = U8_MAX,
 	},
 	{
 		.procname	= "echo_ignore_anycast",
@@ -1407,8 +1405,8 @@ static const struct ctl_table ipv6_icmp_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler = proc_dou8vec_minmax,
-		.min		= 0,
-		.max		= U8_MAX,
+		.min          = 0,
+		.max          = U8_MAX,
 	},
 	{
 		.procname	= "ratemask",
@@ -1423,8 +1421,8 @@ static const struct ctl_table ipv6_icmp_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
+		.min		= 0,
+		.max		= 1,
 	},
 	{
 		.procname	= "errors_extension_mask",
@@ -1432,8 +1430,8 @@ static const struct ctl_table ipv6_icmp_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= &icmpv6_errors_extension_mask_all,
+		.min		= 0,
+		.max		= GENMASK_U8(ICMP_ERR_EXT_COUNT - 1, 0),
 	},
 };
 
diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
index c870a364de60..144bbc1ae0c8 100644
--- a/net/ipv6/sysctl_net_ipv6.c
+++ b/net/ipv6/sysctl_net_ipv6.c
@@ -24,13 +24,6 @@
 #endif
 #include <linux/ioam6.h>
 
-static int flowlabel_reflect_max = 0x7;
-static int auto_flowlabels_max = IP6_AUTO_FLOW_LABEL_MAX;
-static u32 rt6_multipath_hash_fields_all_mask =
-	FIB_MULTIPATH_HASH_FIELD_ALL_MASK;
-static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
-static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
-
 static int proc_rt6_multipath_hash_policy(const struct ctl_table *table, int write,
 					  void *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -96,7 +89,8 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler	= proc_dou8vec_minmax,
-		.extra2		= &auto_flowlabels_max
+		.min		= 0,
+		.max		= IP6_AUTO_FLOW_LABEL_MAX,
 	},
 	{
 		.procname	= "fwmark_reflect",
@@ -145,8 +139,8 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= &flowlabel_reflect_max,
+		.min		= 0,
+		.max		= 0x7,
 	},
 	{
 		.procname	= "max_dst_opts_number",
@@ -182,8 +176,8 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler   = proc_rt6_multipath_hash_policy,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_THREE,
+		.min		= 0,
+		.max		= 3,
 	},
 	{
 		.procname	= "fib_multipath_hash_fields",
@@ -191,8 +185,8 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(u32),
 		.mode		= 0644,
 		.proc_handler	= proc_rt6_multipath_hash_fields,
-		.extra1		= SYSCTL_ONE,
-		.extra2		= &rt6_multipath_hash_fields_all_mask,
+		.min		= 1,
+		.max		= FIB_MULTIPATH_HASH_FIELD_ALL_MASK,
 	},
 	{
 		.procname	= "seg6_flowlabel",
@@ -207,8 +201,8 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(u8),
 		.mode		= 0644,
 		.proc_handler	= proc_dou8vec_minmax,
-		.extra1         = SYSCTL_ZERO,
-		.extra2         = SYSCTL_TWO,
+		.min		= 0,
+		.max		= 2,
 	},
 	{
 		.procname	= "ioam6_id",
@@ -216,7 +210,8 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(u32),
 		.mode		= 0644,
 		.proc_handler	= proc_douintvec_minmax,
-		.extra2		= &ioam6_id_max,
+		.min		= 0,
+		.max		= IOAM6_DEFAULT_ID,
 	},
 	{
 		.procname	= "ioam6_id_wide",
@@ -224,7 +219,13 @@ static const struct ctl_table ipv6_table_template[] = {
 		.maxlen		= sizeof(u64),
 		.mode		= 0644,
 		.proc_handler	= proc_doulongvec_minmax,
-		.extra2		= &ioam6_id_wide_max,
+		.min		= 0,
+		/* Preserve the native unsigned long bound read from the u64. */
+#if BITS_PER_LONG == 32 && defined(__BIG_ENDIAN)
+		.max		= (unsigned long)(IOAM6_DEFAULT_ID_WIDE >> 32),
+#else
+		.max		= (unsigned long)IOAM6_DEFAULT_ID_WIDE,
+#endif
 	},
 };
 
@@ -242,7 +243,8 @@ static struct ctl_table ipv6_rotable[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ONE
+		.min		= 1,
+		.max		= INT_MAX,
 	},
 #ifdef CONFIG_NETLABEL
 	{
-- 
2.25.1


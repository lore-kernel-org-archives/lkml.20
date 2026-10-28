Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205535;
	b=BRI/tI17ffRvfsrcLNwWPp8jiEWnTmM/n6OHohZkaxd8rrUP2Fa+JQHWvREwRlcoJiwi
	 SowmRZ6NrAexyre2iQCvcIx+FnLT23gH/cDElAgnV8XVioYt21TzreTou7vvHsCA8OTsE
	 Tcun2cSqyg18LyiKCI5HQDxlQesfswhNISn1Kh2PgsT4mYUitZUBRcdgrLPaEXLnCQVQL
	 EWsjtVo+n6sbslhzdTkFZ1qu33NqZy2ZcEm9mUj9OG89Ys0WkzmiCa+aFbfaEp0hFfN44
	 7H8jukpTALwstS3lboOSPccH+p10oyxyJuwXsga1Jp5b264KAANX6p+Tjc935UuW+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205535;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PyyEhaD8x2m34MKiecPyQSIILKDN7dZJGfcyqFPUk4o=;
	b=4G5sBaIqWMimP3H4agnGQLV5x6Ysor5YDVnCjZvM1RtyJCnhYcEeUtsai5eDBFx6/vXE
	 M8At2486gVCsh2b6FGu9maG9F8TXS/e29pl1VSYHVEkCxIQiYc+rZVPjTJf7ndpaJ65oU
	 Lgx1bz+Jjhh8Zo5mwPirTwfC/orP/J9XOz553iLbCbGZOChSdYqfwbTDQhccQEPLa1vt6
	 1yCGPu2RW4DswGsO64mcFXGjuQ36Ya3xfVwvRmk9OBD0U5kAJuvBmEEgXvq1qQChyHag2
	 tAn7tZk/+GKxxm75CH1wT7jGB6xb2mD3wCIgpMVbvLSH5OXRFTRYhOOzfgx2XoMQXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DP2PbMCG;
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2160A3813
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA2160A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DP2PbMCG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xz3+iH/EXgndvNvYbLnjDx/bNEeb8fE/MJkYV6nAti8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205532; v=1; x=1793810332;
 b=DP2PbMCGbps496lJrX4QbF5vMRxJ9ZKulVXeJ2WMWEBXTcrzHPJExtySUI5s08w4nFWn4Aoj
 mNMCL9UtwKIthGzpBf1+1TE9MdMOuDPz/QjgBCkx4PdW4r1HQ9yqt7dKk2k1sWfZPkLvKMMiYFg
 AZ8/JYum0j71Yg2S3/Vo1rx8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 97da82f30ffae365;
	Wed, 28 Oct 2026 16:38:52 +0000
X-Mizu-Trace-ID: 97da82f30ffae365
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 36/39] parport: move device sysctl context to priv
Date: Thu, 29 Oct 2026 00:35:15 +0800
Message-Id: <99e864dc88f931ba5f065717bb5a9cb950b05eb7.1793204511.git.wen.yang@linux.dev>
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

The per-port table uses extra1 for both the spintime minimum and the
port context of the active and hardware entries. During registration,
the loop also assigns the port pointer to vars[0].extra1, overwriting
the minimum. A spintime write can consequently be checked against data
from struct parport instead of the intended minimum.

Move the port context to priv and use numeric bounds for spintime.
Keep probe_info in data and set priv only for the entries that need the
port. Separating context from bounds prevents this overwrite.

The spintime bug exists in the base tree and can also be fixed separately;
this RFC does not depend on that fix.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 drivers/parport/procfs.c | 51 +++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/parport/procfs.c b/drivers/parport/procfs.c
index 1bfafc2a5724..6f6d96c37a93 100644
--- a/drivers/parport/procfs.c
+++ b/drivers/parport/procfs.c
@@ -36,7 +36,7 @@
 static int do_active_device(const struct ctl_table *table, int write,
 		      void *result, size_t *lenp, loff_t *ppos)
 {
-	struct parport *port = (struct parport *)table->extra1;
+	struct parport *port = table->priv;
 	char buffer[256];
 	struct pardevice *dev;
 	int len = 0;
@@ -73,7 +73,7 @@ static int do_active_device(const struct ctl_table *table, int write,
 static int do_autoprobe(const struct ctl_table *table, int write,
 			void *result, size_t *lenp, loff_t *ppos)
 {
-	struct parport_device_info *info = table->extra2;
+	struct parport_device_info *info = table->data;
 	const char *str;
 	char buffer[256];
 	int len = 0;
@@ -116,7 +116,7 @@ static int do_autoprobe(const struct ctl_table *table, int write,
 static int do_hardware_base_addr(const struct ctl_table *table, int write,
 				 void *result, size_t *lenp, loff_t *ppos)
 {
-	struct parport *port = (struct parport *)table->extra1;
+	struct parport *port = table->priv;
 	char buffer[64];
 	int len = 0;
 
@@ -143,7 +143,7 @@ static int do_hardware_base_addr(const struct ctl_table *table, int write,
 static int do_hardware_irq(const struct ctl_table *table, int write,
 			   void *result, size_t *lenp, loff_t *ppos)
 {
-	struct parport *port = (struct parport *)table->extra1;
+	struct parport *port = table->priv;
 	char buffer[20];
 	int len = 0;
 
@@ -170,7 +170,7 @@ static int do_hardware_irq(const struct ctl_table *table, int write,
 static int do_hardware_dma(const struct ctl_table *table, int write,
 			   void *result, size_t *lenp, loff_t *ppos)
 {
-	struct parport *port = (struct parport *)table->extra1;
+	struct parport *port = table->priv;
 	char buffer[20];
 	int len = 0;
 
@@ -197,7 +197,7 @@ static int do_hardware_dma(const struct ctl_table *table, int write,
 static int do_hardware_modes(const struct ctl_table *table, int write,
 			     void *result, size_t *lenp, loff_t *ppos)
 {
-	struct parport *port = (struct parport *)table->extra1;
+	struct parport *port = table->priv;
 	char buffer[40];
 	int len = 0;
 
@@ -236,19 +236,6 @@ do {									\
 	return 0;
 }
 
-static const unsigned long parport_min_timeslice_value =
-PARPORT_MIN_TIMESLICE_VALUE;
-
-static const unsigned long parport_max_timeslice_value =
-PARPORT_MAX_TIMESLICE_VALUE;
-
-static const  int parport_min_spintime_value =
-PARPORT_MIN_SPINTIME_VALUE;
-
-static const int parport_max_spintime_value =
-PARPORT_MAX_SPINTIME_VALUE;
-
-
 struct parport_sysctl_table {
 	struct ctl_table_header *port_header;
 	struct ctl_table_header *devices_header;
@@ -270,8 +257,8 @@ static const struct parport_sysctl_table parport_sysctl_template = {
 			.maxlen		= sizeof(int),
 			.mode		= 0644,
 			.proc_handler	= proc_dointvec_minmax,
-			.extra1		= (void*) &parport_min_spintime_value,
-			.extra2		= (void*) &parport_max_spintime_value
+			.min		= PARPORT_MIN_SPINTIME_VALUE,
+			.max		= PARPORT_MAX_SPINTIME_VALUE,
 		},
 		{
 			.procname	= "base-addr",
@@ -367,8 +354,8 @@ parport_device_sysctl_template = {
 			.maxlen		= sizeof(unsigned long),
 			.mode		= 0644,
 			.proc_handler	= proc_doulongvec_ms_jiffies_minmax,
-			.extra1		= (void*) &parport_min_timeslice_value,
-			.extra2		= (void*) &parport_max_timeslice_value
+			.min		= PARPORT_MIN_TIMESLICE_VALUE,
+			.max		= PARPORT_MAX_TIMESLICE_VALUE,
 		},
 	},
 	{
@@ -397,8 +384,8 @@ parport_default_sysctl_table = {
 			.maxlen		= sizeof(parport_default_timeslice),
 			.mode		= 0644,
 			.proc_handler	= proc_doulongvec_ms_jiffies_minmax,
-			.extra1		= (void*) &parport_min_timeslice_value,
-			.extra2		= (void*) &parport_max_timeslice_value
+			.min		= PARPORT_MIN_TIMESLICE_VALUE,
+			.max		= PARPORT_MAX_TIMESLICE_VALUE,
 		},
 		{
 			.procname	= "spintime",
@@ -406,8 +393,8 @@ parport_default_sysctl_table = {
 			.maxlen		= sizeof(parport_default_spintime),
 			.mode		= 0644,
 			.proc_handler	= proc_dointvec_minmax,
-			.extra1		= (void*) &parport_min_spintime_value,
-			.extra2		= (void*) &parport_max_spintime_value
+			.min		= PARPORT_MIN_SPINTIME_VALUE,
+			.max		= PARPORT_MAX_SPINTIME_VALUE,
 		},
 	}
 };
@@ -422,15 +409,15 @@ int parport_proc_register(struct parport *port)
 	if (t == NULL)
 		return -ENOMEM;
 
-	t->device_dir[0].extra1 = port;
+	t->device_dir[0].priv = port;
 
 	t->vars[0].data = &port->spintime;
-	for (i = 0; i < 5; i++) {
-		t->vars[i].extra1 = port;
+	for (i = 1; i < 5; i++)
+		t->vars[i].priv = port;
 #ifdef CONFIG_PARPORT_1284
-		t->vars[5 + i].extra2 = &port->probe_info[i];
+	for (i = 0; i < 5; i++)
+		t->vars[5 + i].data = &port->probe_info[i];
 #endif /* IEEE 1284 support */
-	}
 
 	tmp_dir_path = kasprintf(GFP_KERNEL, "dev/parport/%s/devices", port->name);
 	if (!tmp_dir_path) {
-- 
2.25.1


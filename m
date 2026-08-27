Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79004175A6D;
	Thu, 27 Aug 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803612; cv=none; b=bTpKIqW62JYClkBZlkkLpjCBAsnJOu/XWDTdh24OkbM4I+eg0vTPlyyna0xY2x4lbPFT/jZNTbOIymPT3+eM+MWepVJXjPLflDY+XAkr5isuLQ2o+gY98KdmjG3I4izpB+NkqmKo4LSJMN6KVrj6jTY8dpXHb4ZoXENCGDdHS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803612; c=relaxed/simple;
	bh=E7Qb6Z+Ep2s7d65G9EgLZ0UDHre8gJvvJ/zc///mxcA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y9ShjvEDBTUV6FPIJFIkmS4zAO+W+GaK6E4hz3xRCpEgopOBRiTWQon60Ji4jOvUnfm75dRenTmsTQjqxIJrdGQM07sDFectXDM+Yfz5Rzt7YsFKPesFRDR+g+qyXipS8KG6iUOFep/Qo+7KNAGXdnIptN23Oy7dodCpJQyVdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=h-partners.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=X12VNfG9; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=h-partners.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="X12VNfG9"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L+L3pyxYhokonQIOqxie4jLVf2GeZhI+oJSiPttLZOY=;
	b=X12VNfG9xpY0vI44Hwm5d0+g9VEzSXfpF6FBMf5lzNP0QjMWPUtFjlEWntrN2Jc8Qb4dmiyrT
	eLtVEnEAGt6/6lKNfUkdsZg0G/xRBrxRKHQFKH+2S8Cd3Ztehj6tsbWAmr6+bl7SlFBx+ZARt5I
	/wulnLjyfEpO05QW+2aq/N4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hVnk56JSkzmV91;
	Thu, 27 Aug 2026 11:55:57 +0800 (CST)
Received: from kwepemo100013.china.huawei.com (unknown [7.202.195.244])
	by mail.maildlp.com (Postfix) with ESMTPS id 291814057A;
	Thu, 27 Aug 2026 12:06:44 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemo100013.china.huawei.com (7.202.195.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 27 Aug 2026 12:06:43 +0800
From: Junhao He <hejunhao3@h-partners.com>
To: <linux-edac@vger.kernel.org>, <mchehab+huawei@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>,
	<shijujose2008@gmail.com>, <xueshuai@linux.alibaba.com>,
	<tanxiaofei@huawei.com>, <xieyuanbin1@huawei.com>, <linuxarm@huawei.com>,
	<hejunhao3@h-partners.com>
Subject: [PATCH] rasdaemon: ras-events: Adapt to kernel v6.19 memory-failure trace event directory change
Date: Thu, 27 Aug 2026 12:06:41 +0800
Message-ID: <20260827040641.25143-1-hejunhao3@h-partners.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo100013.china.huawei.com (7.202.195.244)

Kernel v6.19 moves memory_failure_event from the "ras" trace event
group to a separate "memory_failure" group, as the event's
TRACE_SYSTEM changed from "ras" to "memory_failure". This changes
the tracefs path from events/ras/memory_failure_event to
events/memory_failure/memory_failure_event.

Add get_memory_failure_group_name() to dynamically detect which
path exists, ensuring backward compatibility with older kernels
that still use the "ras" group.

kernel commit:
    https://lore.kernel.org/all/20251119095943.67125-1-xieyuanbin1@huawei.com/

Signed-off-by: Junhao He <hejunhao3@h-partners.com>
---
 ras-events.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/ras-events.c b/ras-events.c
index ab2dd51..229ea93 100644
--- a/ras-events.c
+++ b/ras-events.c
@@ -66,6 +66,20 @@ static const struct event_trigger event_triggers[] = {
 #endif
 };
 
+#ifdef HAVE_MEMORY_FAILURE
+static const char *get_memory_failure_group_name(struct ras_events *ras)
+{
+	char fname[MAX_PATH + 1];
+
+	snprintf(fname, sizeof(fname), "%s/events/memory_failure/memory_failure_event",
+					ras->tracing);
+	if (access(fname, F_OK) == 0)
+		return "memory_failure";
+
+	return "ras"; /* fallback to old path */
+}
+#endif
+
 static int get_mountdir_by_type(char *mount_type, char *tracing_dir, size_t len)
 {
 	FILE *fp;
@@ -325,7 +339,9 @@ int toggle_ras_mc_event(int enable)
 #endif
 
 #ifdef HAVE_MEMORY_FAILURE
-	rc |= __toggle_ras_mc_event(ras, "ras", "memory_failure_event", enable);
+	const char *group = get_memory_failure_group_name(ras);
+
+	rc |= __toggle_ras_mc_event(ras, group, "memory_failure_event", enable);
 #endif
 
 #ifdef HAVE_CXL
@@ -1166,13 +1182,15 @@ int handle_ras_events(int record_events, int enable_ipmitool)
 #endif
 
 #ifdef HAVE_MEMORY_FAILURE
-	rc = add_event_handler(ras, pevent, page_size, "ras", "memory_failure_event",
+	const char *group = get_memory_failure_group_name(ras);
+
+	rc = add_event_handler(ras, pevent, page_size, group, "memory_failure_event",
 			       ras_memory_failure_event_handler, NULL, MF_EVENT);
 	if (!rc)
 		num_events++;
 	else if (rc != EVENT_DISABLED)
 		log(ALL, LOG_ERR, "Can't get traces from %s:%s\n",
-		    "ras", "memory_failure_event");
+		    group, "memory_failure_event");
 #endif
 
 #ifdef HAVE_CXL
-- 
2.33.0


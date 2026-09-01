Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62E447F78E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255636; cv=none; b=LMaceacLMJJicnvJya9ClpT7fz3tcVEToBxbYrWH2KjQsWHlqcX8MJGqQ58dRSIp2k8ltAzSXhQCWki9Co4OqIEa253AQIb/OsjO6tMZZ6bn5TWs0h1CMAUWe7v09bMZEWFEgKV49Fz7gKaVcIXB3JAJBJ05E8D/eChc4AHEwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255636; c=relaxed/simple;
	bh=LALt3XyMX6Hs3+Ma/qa+MvuuXwg7pk7dUcR1bk+TyGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgnDAl8p9hC9BRVQGSm5cmWtjaCFxsGcL+eAeZZqipl8Gs6h/giMrpCbIHAGj96a1OI3aS8N/qlyjkh3dz7cqXeIKDjHJesb98f94zBnn2btMf7Qse7ZABU4fOmuEskcW35ByFzHsoij+NOApJorT1+B3S823nheSAL81uTGWA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=bA0F8SsL; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="bA0F8SsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=bA0F8SsLmLd9iivCo7TIRB6MBO/MCi2/vLn8n/z7Nna63rAz0csAeFBEf6ySG8jjSPTqZztWwtwnW
	 3xDFz+imzb874hE8ABpD5sE0ztb51mIGKxURj87G8bD3Og0m/8cfzdXVzrsb0kqmZmDioJg8+WMPks
	 oW8FumEQoV6Y5Ybk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46a969cc5149-37017;
	Tue, 01 Sep 2026 17:37:10 +0800 (CST)
X-RM-TRANSID:2ee46a969cc5149-37017
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16a969cbf52e-d1291;
	Tue, 01 Sep 2026 17:37:09 +0800 (CST)
X-RM-TRANSID:2ee16a969cbf52e-d1291
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: srinivas.pandruvada@linux.intel.com
Cc: raj.khem@gmail.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Clean up more build artifacts in 'clean' target
Date: Tue,  1 Sep 2026 17:36:57 +0800
Message-ID: <20260901093657.1884-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The 'clean' target currently leaves behind .* .o.cmd and .* .o.d files,
as well as the generated 'include' directory. Extend the target to
remove these so 'make clean' fully resets the build tree.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 tools/power/x86/intel-speed-select/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 6b299aae2ded..46874e4cee51 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -54,6 +54,8 @@ clean:
 	rm -f $(ALL_PROGRAMS)
 	rm -rf $(OUTPUT)include/linux/isst_if.h
 	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+	find $(or $(OUTPUT),.) -name '.*.o.cmd' -delete -o -name '.*.o.d' -delete
+	find $(or $(OUTPUT),.) -type d -name 'include' -exec rm -rf {} +
 
 install: $(ALL_PROGRAMS)
 	install -d -m 755 $(DESTDIR)$(bindir);		\
-- 
2.33.0




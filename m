Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725369;
	b=VnlpBkgrr9oI+xffpWf+ctlnVDuIjbc5OnoO8lNG4fFvJwnJzuyD0c7ApN1q0yFYMqtM
	 zA3OfbEbwD14+ISrTJBdaoUP5jYWn2Gb87Ag+X9mbx4DNBZMPFFZjaf+vXYGkDYS/gQzu
	 5ZEf6SvmtBuivpztaSE4sXVKTBt7R8AZywvl5kUOb2GvqNAJM+nh6zxaTx69J0mYs5eQP
	 AYGZiHKCkyIK8QBnoKu0Q96TbCQpCf8vfgbGocAMbresBFrAwCM72XwII0ugNJoTHEk0u
	 h9lUhPltNXKltcNO/J2tmnlxM9c3vYeASFsNROqWzMRiZWyh4wnpSbMAa17znkuf6Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725369;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=53T+lOsiCJxQyCBaXPSx/2ETRZB4EWLtPkyWmCEPcuY=;
	b=QMfHgjNnYiknoF/qVN/uP+UICZWG4cQMcBznDRKugv6iSGTrd7x7YEflhcMNdsg6V6Wn
	 RCwT0VjvYEfoGQIpiqb0vLkbfhiqFZ21qiwzi3dwq6glwS6rnttmtpNWjjeEy9dhFuQ48
	 Gz3DE2wmmncZENpL1VhxHPA7p1jBLqUpLm44hplNNnZbD5FnvYbHrwKKzqgoZOlLoig/M
	 YxZxfQiiUgi5ZomErcs5K0jK5v9v6VLClgfRPWaaBqUF9a5Gqr0K1JoPEvkuGVXMHIGni
	 MBDEWvUEfQulB5HAr36XasNtue5qry5ozzgKcBysk3bQdrNttUf3+HAyHpXT8JrZUYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="xpT7y5/h";
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555F606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8555F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xpT7y5/h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725319;
	bh=53T+lOsiCJxQyCBaXPSx/2ETRZB4EWLtPkyWmCEPcuY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=xpT7y5/hfXp6eLS5ThWsOGoEZol4oBPN+tRUXj4nKkqhPZgS4BmXko85uy8SmfLlE
	 hW0wjIlVRmNun2+PmWXH4nROp+Drm/ysGAL4jy1Wm5JszsGZ4q17O7zr2WTFSaUVhH
	 wUGgaJiK7lE2cIE1NxrHr0iIQ+LgXwOVmiFb8enc=
X-QQ-mid: esmtpsz11t1792725313t965ea44f
X-QQ-Originating-IP: p7vMAcqPWqfRfANcWnhRaUeK6HXYkU330FgkFSMDiWA=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18378101809454944597
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/24] gtrace: Move connection release into component unregister
Date: Fri, 23 Oct 2026 11:14:42 +0800
Message-Id: <20261023031505.2020925-2-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M5Uz2rwrqRnRDryVVoY5gU250CnF8xGmc4B3U1V6Xu6G9qhTpoYXwlL5
	wkdVlq2pslKK9vRqqdVFhDs/g3wqDtYxu5ogWLjaMzJILa7G914UojwqKoIJp0mAA7D7z+v
	W9KoMF7Q7BHriFHFnoCAjv3kY9zgDqAbvqM2MkmY2/bQt8ImeoXWReuTmqRAAhkHkJd/acZ
	+gKjvQCid2avSjAVsBmXDDMt8nLJFsxd2ArF8gt6b6gbpyWV4TVNfovpuMHrDSgKtdCeYBS
	6LONNCpN2YTPyVJw7pdlYv1PbZKfkitQQJemgryfMhxdP7bVR3bPl5fZ52xj5DgsM2hXwI/
	pIBgjXamrqIU9mOPgaGdwK8U6R+H2nlXeLnxe7tIwNMJGdEjGFQjrYi4JHNiUKswu1zIaDD
	66iG1bmfoAgu9qbwppR60SBhtI/epknAumMYm0573gMOCH8rbFBhqrfV0pAdEKRtA7IKsix
	2LpjJ/4y0tAi60jxuYspTKt3wkNvoxDkkdvwP9fcIcWnjZd8tyZSv/rMANQtYYQ3pxBwQrz
	UG4En+PG2HHjvbLBxa5DJZhlNfDT9Hfi7ZXDCHTvq0XVStG17BGVIuzbaciaxVDKwhgIlRw
	HIZ2+CiyQU+kUxg0L9HT8Cs5UJ6h3bNPf31dX/1Cgx2BxCl/hNO2s8uSZbnAglbG4hqHkHw
	r5/O0WkDM2gD4JddY2Jdk6HLyfBB7GyElYCGv32F1vpbydf2nk2bSx9uP4eRKUKjHXM2iE2
	frahH8tWa3PzMjlwT19LQqZl/FlCICf2mkLqsBvGnhGlml39Osd12PZ+qyOmPljUCTWidzj
	PhiqsV3IwAcwYK/ZFN35Yv8qsOSG9Hco2hAmdf4mJBsjHT+Ym0dj3uDeVdzIvPdVzueKrvf
	EVuwX/pzCihhNC3ywZ/XRFricQHG3gyugoVy7tOpy9hs5H+hRD6jw+mW1Gecvx77dRHX/Yr
	/EYJQooedUJyc4cUoAEGrK+VTDnAg6yUeV8KI5EInIo/RTvRpcH8bth3D1+o6M4FExWnUL4
	VjTlxqSQAJ3wfZNJbRFY6LkQjUXmynNKUYWhZZEw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Add gtrace_release_outconns() and call it from
gtrace_unregister_component() so the output connection fwnode
references are released in the core instead of being duplicated
in every platform driver's remove callback.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c      | 15 +++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c |  9 ---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 034987237abc..5704e426abe8 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -479,10 +479,25 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 }
 EXPORT_SYMBOL_GPL(gtrace_register_component);
 
+static void gtrace_release_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_fwnode)
+			fwnode_handle_put(conn->dest_fwnode);
+	}
+}
+
 void gtrace_unregister_component(struct gtrace_component *comp)
 {
 	struct gtrace_component *c;
 
+	gtrace_release_outconns(comp);
+
 	mutex_lock(&gtrace_mutex);
 
 	if (comp->pdata->bound_cpu >= 0) {
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index a5655e983e51..189ff0b8bc18 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -141,15 +141,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 static void rvtrace_platform_remove(struct platform_device *pdev)
 {
 	struct gtrace_component *comp = platform_get_drvdata(pdev);
-	struct gtrace_platform_data *pdata = comp->pdata;
-	struct gtrace_connection *conn;
-	int i;
-
-	for (i = 0; i < pdata->nr_outconns; i++) {
-		conn = pdata->outconns[i];
-		if (conn && conn->dest_fwnode)
-			fwnode_handle_put(conn->dest_fwnode);
-	}
 
 	gtrace_unregister_component(comp);
 }
-- 
2.34.1


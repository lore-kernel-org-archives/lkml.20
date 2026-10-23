Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725445;
	b=m9triUimDs3ErablWbo67IEZiAeG5ZKVR/G/9RRB5jAHny2bY68wj6q+NT04XO4mCKfa
	 bfVTgEWsFufdi6bJoX6E2HrvBpidTjI5Y6gWjHrCVkUkZIoeRdcI0JXbjTbWWIEaywnRc
	 qmj5EYzrkFyI6C/Otxxn4lLG1Z4mx1qBHKWyCyJKIV8LmcWUBrW/zQeL5BOCeY/uNaaDZ
	 qxkwDsLrxJ1h5fwlvWzC/poutsZdz+HUg7Q1IUrEX+YYp4bJOhMosd4fRQjU0tx34u4mm
	 ldQ30m2YgPoI1+TgOamcKXrFddyLRwL99xDcNQLVozMt1C5pVI4TGWNRWXgtngZHOUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725445;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=hrqZgpXEbRCXYwF/fMDlhxzbJHeEM8/U9JvY1dw+mwU=;
	b=rpeYSpWXrIRjt9SFa6V1miiaO2/hlsI5rwgyXzkPd2r2UcwLZEvgdVhHZa2wFvPbHpPA
	 WyqTrn8p6aUNpadQz2Mr/dCjxOVwHFLDFDurxULzkWNUJe3WnfwCkRbsHJq+ycGBBL341
	 le63RsYHR9pwHlx1QutCmOIK3vbq7oDBHedWByoE+D/4JqW1uGU7pZ1K7iooZptkm7Ptz
	 zRpTkevW53dFvhnzWEflMffpFZnauOwFm7f9a78qGeW17F0TP6tRukPLW4xHzTiewZQu8
	 iTJNj7LqaE3i5tLNvFfqbxfph+swM3hTo+Ybj1YP9mOg8upi+knIiQxv148b41JUO/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="Yaxx8N/0";
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2100606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2100606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Yaxx8N/0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725432;
	bh=hrqZgpXEbRCXYwF/fMDlhxzbJHeEM8/U9JvY1dw+mwU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Yaxx8N/0QvhLds3gHlzUahIUVA1xcvB2btKLur8hbhJKpfGeJGJIb1fTzhRUIgEI5
	 EDVMamZafQPH7yolroHuUqtAcJVPOz4tZyyfNm9OmVksBUgTeyA0T+yFyQPglo9do3
	 mPE+rdzdiPjIbniUvgrefzmq5DcKl8t45REvzrbs=
X-QQ-mid: esmtpsz11t1792725381t9933039b
X-QQ-Originating-IP: zBnCj0Pl9x55BvX5w7GkJn8w3izRmCpCLEcc7pj1jOg=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8460341350556304876
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
Subject: [PATCH 19/24] gtrace: Add setup_sysfs_buf callback to setup sysfs sink buffer
Date: Fri, 23 Oct 2026 11:15:00 +0800
Message-Id: <20261023031505.2020925-20-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NafziRg7Bx69DwGsuIEUdRQHV8p9RLmoouix5XiFLMBbE0837wOpBDuc
	unK+OYyUI8Wx0TrVIf8sEiDZBMLuG25Obkahz5sdpcovxTBArBzuLG9awkZBVxLsqWjxqJi
	3r9OuwOxpJYPCawHqVIyMx/XSRrkmpcoFGB9KgE9Y89GWtsXsJU6tuqwh3f7SeJWAQwI+cZ
	RhC+0NYiTO/T0DQ9m7jQC0LVeVa+p/x0jgU02iHPvpGY1DDQkd1ToWzk3x1HnLdYq44OO8V
	h4LfgOo1Cgkdbgik4TMFuvd+S9FB9oQyzWiKoa8V29eVzAePS02355zu85F9BTXneLzafRr
	Uq7KSI5ZsorPwPuykxtV7YVPAjLUDuK9b8d3oKe7xjOZqwj4S609/AYuKE06hR8Sgcdt5eS
	mJQp3R1KA1eFcLoYcRE/0/tpEIg73Zcrb0+CjkDY+43dUH5JzDXjF2ap1RSdTvfDtMroVUT
	0cwBYpJGMVIny9oWiAdkMzQwdLsY8ynDD7TzsJKUVuwdAyZqWWE66sMx3DFQRFpbCJSjQaB
	c+FdPZd0tYMjyrGI5165QaE73AnCw/dHUFLtjyRZHj/6N+TcI6ZOP/ov8o5dYsX8AYjBIV5
	dPLeTap2toRd0IpIKjid2o16Stmb/C14VrfNX3h/BbZIYq/BEdcNHmUMBewhJMf3AIVABon
	yucCcQlPPJWnr+6IBhqxB6VILyGxFKWENMY0tHBbj9nqL4OyeZQg9ay0LkBtpXneffUl341
	4bf/bHnHMEn1gXo80KSvI7NVliwcaYFBJq/pt8HCo1WI9RkGw2MvptnlsjYCAIUwxI6P7s6
	ltiNCfQrLHdP7Y/J47bCwmA46HMxDwzLdkAY/DzRe5TL+o23UroR6G1yDausvLvqMLi1hql
	VSTTAcS5Y3syRi5SGBnu5vNODdU7AzWCroyvAVMSCY0/bVMYpie4+QcVimFwhx5J8bQ0aVE
	z/GsMipgtqUCvNdT8bB7TNdJzF9SPd7gc6lrQQYNNy+73Jr0/0hgyYBX8UfQnp36dIaHvES
	DFn69T0oO3eumdexjb+Cm/4Nge5ZBFrP8msVAdrUretVv/vhxgFe6FE6A9ksU5PVBp7dNrf
	v5SDeLxf2mG
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Add a setup_sysfs_buf() callback to gtrace_driver and invoke it from
gtrace_enable_sysfs() before the path is started, so the sink can
allocate its sysfs trace buffer outside the spinlock held by the core
start path.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-sysfs.c | 12 ++++++++++++
 include/linux/gtrace.h                  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-sysfs.c b/drivers/hwtracing/gtrace/gtrace-sysfs.c
index 5f4f3fcb56a4..23b0a21ef9c0 100644
--- a/drivers/hwtracing/gtrace/gtrace-sysfs.c
+++ b/drivers/hwtracing/gtrace/gtrace-sysfs.c
@@ -85,6 +85,7 @@ static int gtrace_validate_source_sysfs(struct gtrace_component *comp,
 int gtrace_enable_sysfs(struct gtrace_component *comp)
 {
 	struct gtrace_component *sink;
+	struct gtrace_driver *sinkdrv;
 	struct gtrace_path *path;
 	int ret;
 
@@ -114,6 +115,17 @@ int gtrace_enable_sysfs(struct gtrace_component *comp)
 
 	mutex_lock(&gtrace_mutex);
 
+	if (!sink)
+		sink = gtrace_path_sink(path);
+	sinkdrv = to_gtrace_driver(sink->dev.driver);
+	if (sinkdrv && sinkdrv->setup_sysfs_buf) {
+		ret = sinkdrv->setup_sysfs_buf(sink);
+		if (ret) {
+			gtrace_destroy_path(path);
+			goto out;
+		}
+	}
+
 	ret = gtrace_path_start(path);
 	if (ret)
 		gtrace_destroy_path(path);
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index a3d125882ec9..0957d0490c57 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -377,6 +377,7 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @setup_sysfs_buf: Callback to setup sink-specific sysfs buffer.
  * @alloc_buf:     Callback to alloc sink-specific buffer.
  * @free_buf:      Callback to free sink-specific buffer.
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
@@ -394,6 +395,7 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*setup_sysfs_buf)(struct gtrace_component *comp);
 	void			*(*alloc_buf)(struct gtrace_component *comp,
 					     struct perf_event *event, void **pages,
 					     int nr_pages, bool overwrite);
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725360;
	b=alZy43u8KDDqylU+QySCbpovBgWYhGdqInESEFBfb+mFLzzMKj2lm9Kh+nYBGErncEFZ
	 VLSbR9Fc5B99EtL2XMO7sjIsntFZdcAuXFJqVwFy0R2NQlgy5uIcl4fuGqagejNTz1/YP
	 PkczXDIzC11PBJC5ILtURCiZxQOhH3coGE91k1Xz97vaOpyCc51kU4PJdIX8JXJldjSuI
	 KpBWrynSBvcCsqojh7ZG8Oaaiox9bY2SgXZwNFfjb6rXpcajdtkaIYzg/ImR/O9n/I+IU
	 TZ4v+m6C9ngkCWp/rejs+ZNsmowv4UZWz3qnProfrxNGsW8dn2/FH8cW8nSbMgcRwGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725360;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=MMlf6J75nDVXumN3lYDEd291b9v7/FkjUcwdAXybsaU=;
	b=16LnXnkUMZwTatEs+QhJvbj06ZWUOgVz0eGI/6QhoXtrvqgZHoOwDabEL0P3gwkthdSy
	 motx9o9Slz5ixw+GNjanX7T8cpqLF37VhqgeGylaZq9aaVRSmG7oFqgeKzq5SqdRir098
	 IKJOlLoOiNTjGQwADb41xqe02vWR0OLvI7jnXmW7QlZqxhrI7o/LVnzTlxMy11zNjkOt0
	 WKKepKheoYOh2gLEAc2pjQzUOgXnmOgfbvNnH159sUbNP3Dym0Yc5w9S8IqF2mcuJQ3p9
	 hlRhx0Y/flxMKQjZpydf8SdaeRN+sRfpc4FNyBhPD/FFFSB0eTkTysooUsbC03L74cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mpPN7P8o;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEB606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mpPN7P8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725326;
	bh=MMlf6J75nDVXumN3lYDEd291b9v7/FkjUcwdAXybsaU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mpPN7P8oyG7MZRPLAwPO0wRwyXSz0Oky+3tPv3VA/sggw1ZNuRQH03oNAtwejbsvH
	 1rzhp5Op60slDz9U4M4gJml8Q4+4xPR+fSVDbPtPThGJWkWbF5I0szWGXHNXb+ZfFv
	 lwrij86c/KKtKFKABxFRh9NvdQhK8TYpJYM/TxHw=
X-QQ-mid: esmtpsz11t1792725321t509a5208
X-QQ-Originating-IP: ohnxhK38InInZiVBUyKsKzYkj35gb18qCuBUfmUW/BI=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16734880007413768572
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
Subject: [PATCH 03/24] gtrace: Drop trace format field and helper function
Date: Fri, 23 Oct 2026 11:14:44 +0800
Message-Id: <20261023031505.2020925-4-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: MKzYG8XJzx27R8R81WwUnQO5yqrnQNtb51jeKTD97e0S6z0VUhbsgIe5
	5KurFlbJZJ7FWBfSYIbCdDOeE5aeKoUow9cFBpXzVoou4mQX+7zG4If6buFg9BBQfhaQwsN
	7/t9Q8GMWnr0p1RW4U7tRNSEkfOFvri6TnX0bJ8Tkdx3YUVMytXPLR0DbJf4j2L1pId+4/4
	Xv9ooyaQRWdjBk7uU6DGCzQvNearG8IbdIN2OVwK8sVQkiBxdi83627SyXzSPVqcErWEQtl
	FrsEEismwY8xyuHDjLdC7tFeSzxyTBMkt5EZk0Tl8nD9CnEHrc8qixhQIVLbzDmiZiampTA
	Wnn2ee8hGfK3yNNCr5W3l6VMDQsOKQMo4T3bz+TFw/e6SyDqzNF/7RW5LlkKpjEx25J3Aum
	nxVJTeGTjoa6v6Kn+B4c0UaRbTzBJe3Flbbf1mjU389IfT0UDaXGZL3Tnpzi28OnwKBs75O
	g5EzRZA5iu1oproMnb6j3gHTUaCyGSnyDkpO7q8UjEWBmLmRl0h8jzbEz4Q0WE3q0HhaaEW
	0Z4zPcleVOikREX3PAjG3XX1MC7bEVe8xvtQdyXmfxLzYzh062c3LrG6KAvSUYRsRNSuW1t
	O7zYtmg4oiAIr/0DWAkET2nBO5M99bFfxiFliAAYOBRPwlqwksMqGjRvy4xNm8h7Oj3TzCM
	k6wsc8KbNpgIBuofSvJ+FLbAYgdyS/Dj0HeqelwvEATRf5as9JeVW6HJixf7+2IE/HxjfYu
	m+Y5LYGAMaZhcHTEehLsSpt3x+e7IsmjQ85+VmZPns+W58+0lG77+Fb8W2qox4Eh0X4PAUW
	kUlLgRAYgKazT1WKeKE9bbFzrTUIyieTF6kKqwrwMqki49jCKlf7vWI7nQwx5cHPUH/NsWo
	7UZhU9rhXUixvENNkXZGIgbWg2wXP9xVTjR1thbJh44wDV3P1p0yMoeSm9esRgP7hQb/OAF
	DLRiMyBz1WyAG0voBLOWr001gkfN0/75GgQejLEoogHzKIFJK0pQnbL3HXmz142rdkjYEwk
	+vhqm1WXBmgEVhZcqh1N+EhMesSXiVqB9UPtkxrN805f8qn58O
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Remove the format field from struct gtrace_platform_data and drop
the associated gtrace_path_aux_format() helper function.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-perf.c      | 15 --------
 drivers/hwtracing/gtrace/rvtrace-encoder.c  | 39 ---------------------
 drivers/hwtracing/gtrace/rvtrace-platform.c |  3 +-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c  |  1 -
 include/linux/gtrace.h                      |  3 --
 5 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 928f0405c6c1..56713c8ee850 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -167,20 +167,6 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 	return NULL;
 }
 
-static u64 gtrace_path_aux_format(struct gtrace_path *path)
-{
-	struct gtrace_component *src = gtrace_path_source(path);
-
-	switch (src->pdata->format) {
-	case GTRACE_FORMAT_ETRACE:
-		return PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
-	case GTRACE_FORMAT_NTRACE:
-		return PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE;
-	default:
-		return PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
-	}
-}
-
 static void gtrace_event_read(struct perf_event *event)
 {
 }
@@ -295,7 +281,6 @@ static void gtrace_event_stop(struct perf_event *event, int mode)
 			return;
 		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
 		WARN_ON_ONCE(ret);
-		format = gtrace_path_aux_format(path);
 		if (READ_ONCE(handle->event)) {
 			/* Tag the AUX data with the source's trace format. */
 			perf_aux_output_flag(handle, format);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 1f06b1a2b412..f24780b1ca1e 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -53,38 +53,11 @@ static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 sr
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 }
 
-/* Set requested trace format and return 0 if hardware supports that format */
-static int rvtrace_encoder_set_format(struct gtrace_platform_data *pdata)
-{
-	u32 val, fmt;
-
-	switch (pdata->format) {
-	case GTRACE_FORMAT_ETRACE:
-		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE;
-		break;
-	case GTRACE_FORMAT_NTRACE:
-		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val &= ~(RVTRACE_COMPONENT_CTRL_FORMAT_MASK << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT);
-	val |= fmt << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT;
-	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
-
-	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val = (val >> RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT) & RVTRACE_COMPONENT_CTRL_FORMAT_MASK;
-	return val == fmt ? 0 : -EOPNOTSUPP;
-}
-
 static int rvtrace_encoder_probe(struct gtrace_component *comp)
 {
 	struct gtrace_platform_data *pdata = comp->pdata;
 	struct rvtrace_encoder_priv *priv;
 	u32 val, hw_srcbits, srcbits;
-	int ret;
 
 	if (pdata->bound_cpu < 0) {
 		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
@@ -95,12 +68,6 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
-	}
-
 	/* Check if trTeInhibitSrc is hardwired to 1 */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
@@ -144,12 +111,6 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	if (priv->srcbits)
 		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
-	}
-
 	ret = gtrace_enable_component(comp);
 	if (ret) {
 		dev_err(&comp->dev, "failed to enable encoder.\n");
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 189ff0b8bc18..e5c1f47388a2 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -78,7 +78,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	pdata->dev = dev;
 	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
 	pdata->hw_ops = &rvtrace_hw_ops;
-	pdata->format = (uintptr_t)device_get_match_data(dev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -146,7 +145,7 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rvtrace_platform_match[] = {
-	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
+	{ .compatible = "riscv,trace-component" },
 	{}
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 67b6779aacee..9588c32c5b13 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -161,7 +161,6 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 	dst.cur = buf->pos;
 	src.base = priv->va;
 	src.len = priv->size;
-	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
 	wp = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 9945303d2713..0a017f1f888d 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -96,7 +96,6 @@ struct gtrace_hw_ops {
  * @bound_cpu:   CPU to which the component is bound, or -1 if unbound. For a
  *               source component bound to a CPU this must not be -1.
  * @control_poll_timeout_usecs: Delay in usecs when polling control bits.
- * @format:      Trace format selected by the platform driver.
  * @nr_inconns:  Number of input connections.
  * @inconns:     Array of pointers to input connections.
  * @nr_outconns: Number of output connections.
@@ -128,8 +127,6 @@ struct gtrace_platform_data {
 	/* Delay in microseconds when polling control register bits */
 	int control_poll_timeout_usecs;
 
-	enum gtrace_format format;
-
 	/*
 	 * Platform driver must only populate empty pointer array without
 	 * any actual input connections.
-- 
2.34.1


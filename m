Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725362;
	b=5EzGnTZkaaYMC3b8CJarzq1UKMd3kawQfdG7ZEhnirDpwIA1OUwsBUZb5+Ct3lM5mOau
	 0onkEuUQPF84EczJwmrr/igAeX9nOuwQelQNbf/uAo/AE7am1xlOpe4l0oLAW5KdJ3ETY
	 rnTEprdeWVfUKRTTC/TksTsRcoKngqOJh4zqxYgdWs4/pmqaM3vwfJkjbLJUyZiCb55O5
	 xTXGOLZ2Db6a8nBgYKE95U8BhUIJm5M4yNRO1dSm88GcH2uLlhqLRK+JTPj3R0FOVAbJj
	 HvvUTwa/sx6l0mPJ+YuD/9mnoD6Pt3I8dzArc/b0CpxTx6k2Sqisp8/zc9QVt/ySG1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725362;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=agQ+74FSxZS+AQ2bKZyg5UFSSbvxZz8jhUlTJIaIkkg=;
	b=L7cNY6HQXdRGKuWfT6CZ8y9lMVf+EE0JFC10lPtTlqRrl9yZTcSxxxhyGJS3ulC4hDJT
	 Wp83vO1rAqJ9X5kSvH9aIComB01HMi7mCIlPMSP9PUlEvrMPRm5iT/+Y/vmMViVJE1Se+
	 Sf2q1Cepd+EWnrnoMR0TGeCTX00FbTibRO22t/JwYPd354XFy+Ndr2R77eTeRB3qojsab
	 whnllzOdc/Rn2JTfjvLHRRMJD4kWzW0Mc2qgLUe1UQ+xTEEGvSc1nC6Bm9f5hBOfQNJ3v
	 t2tIUKnnTTx5UTtgS0BKqf38CpypAmayifuvIGxUvFghiol3scEBTv3jwgVZlg+VIcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kmYNLKab;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04463606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04463606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kmYNLKab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725337;
	bh=agQ+74FSxZS+AQ2bKZyg5UFSSbvxZz8jhUlTJIaIkkg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kmYNLKabqxE/itXYtqKVUmNLgGpWOkSnU2zyxFgX3VF6mfW68P8+XaKhzBhx+Hsn6
	 JwG5qG6pO9eimYD8oBXbyDGxrXOFK6wtIXI7P/6LcyOcAGRS3AK36SpywBQPyXIgX2
	 inG5Dnt6/W8Y6yVIr134GC28I1Z3dT/tyNgOmdME=
X-QQ-mid: esmtpsz11t1792725332t2413c7a2
X-QQ-Originating-IP: z2kObITc/I9gIbeKVsCchJumtTr1zVVJZUDXOCA4ViM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12303599440400516652
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
Subject: [PATCH 06/24] gtrace: Replace owner PID with perf_event pointer in gtrace_path
Date: Fri, 23 Oct 2026 11:14:47 +0800
Message-Id: <20261023031505.2020925-7-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NDgMZBR9sMmaBCRONdrM3P746ARtphw2NnsOCyjNE1VwQ3l0UDoptDZu
	wR/b7mE1YKaq/9fdIUx6ukCey2WfctVxT+0B5I5SQdjKDr0kGPeeHhSwHG6Y0r/FlObUDEF
	sOmY9Q+twkv/BiG7BxzQxtsEQlDtRl4FlomlXvwFsSKaFAe5AmY8I/FRTW8X2EFqRrdPgnU
	T7m4tmHIw4vPonLJFFVB8BDgBCGdOe92NUFe1x8RIsf1UhMyW4wdAWHo2Dk7YGp+QvwDl8I
	KDJXMRx3kUdROjPGTEX4A484ljG0TipVfxmNkx2ZBQ4TGmElmqGbBB1EfJOLv5iRQoqnQbS
	fXabKCNi5nDwaVD6gOR1RSDNIf0r9F3z4MJAeeQB6ZmA60lLZT2mWF0u7nmSRVTo77yQq03
	w6ExpAU52iEgn2aHB5CEQQ1ZVNPyior4OGNXFHAwCK/aO/RLU0g7Uj/s1VGLlZ+FAJpIWK2
	wpyHt55WAwE0a8lgdIh+bQcmt87T/b4Mnelj3WZ7P+axrzaw9NHwG1ZO4SoXJfQjsmpKnkN
	+yomScN9Kzj429Rqbde4kzQbMCw6aqcXkU4QMrhLQJUmwbBz8MbcDDZB5U0c0CTWnQ5LUSi
	TUU0LTM1wjXcO/417PlzShYHqlKMf8a9cxqDKX0xdrvYv2p701PVTBNdvCFO/3YGzKNvMqD
	SdGZvqkseSjJ4hzK9Tbal1451PJVgAm+BEOAoGEbX8qELwOl3TbxopYUggggnZ4TyAeNvi9
	8Cq6MX8uXCM2k01BKp9ZvVfoZeJ3O0RoqbpGO20JC8LjuhRFvR8wA4dFFXtGN0+Rhv+Vmu8
	bnGsw0GepSTwkHrdtIi7/KY2Hl251pTGGb3c37ZkC+LpoJV7xzEcKPl3CX5yQSerpMjAeHa
	MnXzb3jsvA5I0N6Ww+hHDZohU4prFP7a/RgpZ+ynL6jvZJhLh9vUQN7EBwDf7v4LgfV9yZt
	YxYEushH82Aqcz08WQnzBxI/Bs90ufHMvGQtSEaNTG2mXXfi6ntPfyA26Yz7GYDZqv6PMDH
	MjFmIEIOa/9PUwEoDN7UfK6fqiA794+TLvZlPGwKmiRJ5wn1qp4MicinQA5TbbRZxlNbY1z
	CSyve3yVs59
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Replace 'pid_t owner' with 'struct perf_event *event' in struct gtrace_path.
This allows component drivers to directly access the perf_event for PMU
configuration.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 12 ++++++++++--
 drivers/hwtracing/gtrace/gtrace-perf.c |  2 +-
 include/linux/gtrace.h                 |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index cae0a7fa820f..3f55d8b7302d 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -13,6 +13,7 @@
 #include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
+#include <linux/perf_event.h>
 
 #define GTRACE_POLL_TIMEOUT_US_DEFAULT	10
 
@@ -665,10 +666,16 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 
 	raw_spin_lock_irqsave(&cpriv->lock, flags);
 	if (cpriv->start_count) {
-		if (cpriv->owner != path->owner || cpriv->mode != path->mode) {
+		if (cpriv->mode != path->mode) {
 			ret = -EBUSY;
 			goto out;
 		}
+		if (cpriv->mode == GTRACE_COMPONENT_MODE_PERF) {
+			if (cpriv->owner != task_pid_nr(path->event->owner)) {
+				ret = -EBUSY;
+				goto out;
+			}
+		}
 	} else {
 		if (gtdrv->start) {
 			comp->path = path;
@@ -678,8 +685,9 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 				goto out;
 			}
 		}
-		cpriv->owner = path->owner;
 		cpriv->mode = path->mode;
+		if (cpriv->mode == GTRACE_COMPONENT_MODE_PERF)
+			cpriv->owner = task_pid_nr(path->event->owner);
 	}
 
 	cpriv->start_count++;
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 703c12b95665..2fcfbae9acf6 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -137,7 +137,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
-		path->owner = task_pid_nr(event->owner);
+		path->event = event;
 		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 76b1aa9cfe79..3d769b405030 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -325,7 +325,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	0
-	pid_t				owner;
+	struct perf_event		*event;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
-- 
2.34.1


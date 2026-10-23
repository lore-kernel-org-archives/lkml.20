Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.155.65.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725481;
	b=U/bB2x3BaOchULVL/JtNaxE/8ahT49eVa6hXPv73t9P/6XP58coLD90g/CKPK4A/v2zz
	 wcg8jCfkgBFmsgCBFPF/lUM7MDMVAICdiyejvCMYCJJPP8VvbQtFiVyEk69fzBwZ8J9Xz
	 07kBTClh4OBsvcHqozx0kI+luDHvx9Aemf/c42uHXavUW/0rwKeuy9TbPahE4qbukx+BS
	 FEV8ryKuWRn+7L/oIH2WiS9TbSF73jPbvw5x2o7WsJVAya6lJLIqYG6q3lAeShj5RcHM1
	 mgI2rV0AkNQiBLGfK9CTa0XalvYUf/TdpX8uHDUX6vLpqmHBrxWZhyuRg6uQSzVFSZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725481;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-SPAM:X-QQ-RECHKSPAM;
	bh=TJKnXlsFNec6dkG8Of/+OQNoL/g553QNDCHrW4f2rMw=;
	b=n6R0YhiSp9EGd7DNLZ002gRGrxx42F10/wR5XXJktMmnLokuvA9glrA5pLJ+Gsw9AVN+
	 SbcPXDkI7h6fdYXKrXGjoUTw4ad1UOlVESDHIBs8CqvtapYj9Gt30+cxZU2MNdeqq70wM
	 yg5Gk//PoTLkNzkQM8msMpRpXrsQVbUtNyGYDsmYZKSj2XEtRIkB3t0Tbu6MpDUih0/Iv
	 5atHtqWhh1Z7McZT7k9KQufjjc9dBDu5SKgRnKFq86pNMI9Dk7wJnI/kQgRIei5KS+OsW
	 4ck3PWMxVFb4EV3MnIU6hN11mt6sx+S5sq1HXuyHvPw8fYsHDuUtuJVPwAU6AGIy9Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YMXz2WHv;
	arc=none smtp.remote-ip=43.155.65.254
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33803606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33803606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YMXz2WHv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725400;
	bh=TJKnXlsFNec6dkG8Of/+OQNoL/g553QNDCHrW4f2rMw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=YMXz2WHv/7S+OQ3EoBuMUEBrZLL+fjG+h6ZEHB1TkGsRVTvAIh2mjNv9bz95ilVJb
	 3SQ4+hqTibT9vPRFi8g9WvCeIVSrZO8Lzgy+zPk60jbqB4Lambo3uiiZjxETz7H2AH
	 CYD7K7OOrjYkmmRIfIRZs0zp+9qMxxhpMjnRrQCA=
X-QQ-mid: esmtpsz11t1792725396ta92cdf18
X-QQ-Originating-IP: uS23LMjyJb0eY6SsY9MC10n7RoVJDT5LFpIhRm3plCE=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8401073697936701238
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
Subject: [PATCH 23/24] perf tools: gtrace: Record and parse trace encoder metadata
Date: Fri, 23 Oct 2026 11:15:04 +0800
Message-Id: <20261023031505.2020925-24-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: OXSFEkMxlpRKP1rs8etXPtI2lbsMGsumcbIaOjof+n/wRuPBH5d1IYLp
	9amAfPbO5Zw5qryMxeymbx1cxvY4R9xQqWBKjWbRhH8AxCVawTJ3ekSFKcb3cUpWhDFrL9z
	Z2+IosnlZeiH7Wbgue6xkeRhBZdA+fb96HR+VCR2tCLFa8hhIG6qVDAou2qvGokeEmSJ5Ov
	hit79/TRsWf7wvMfQSgg4DD3YCyHPEQmYGX14mpakOUcVYQiQPOOsCYTmA2ci2KHmqp7N4+
	t/Qy/TSPLI6Z9uikp930rZ8QDZ/HjbeClyjV+0CJDDU6T9CduZq14JisQNj6p7MQ+ImSw9i
	RWyFGCsKFyktvrRL+xZjBsb1bwLxRYCky82eXK0N+JqTaFvkoz96TtWzT87wmD5x0cismMs
	oCPyd+XhRVqhd+8bTwIgZ5GoEjqo97tV56bmzw5xchGdxdwdxTm8C2lWF+Aa8KF9UyU1lgI
	Cafr4+eI31d0gf7IJ+tnvrzpRurmShzFDGAktU4aOkb2h5dDTsLBz9S7AoglmW2HxriKmxc
	ZcnHjXdV614y9qxH/tYbKbvO1M5qym/dXTe0poSzl7MzkhsDocnUsVJNoT41IUBYuV/Pi6X
	GJCT9vgF7aqLjvt0Cb8m5t7rxy9xFaxgIdvsardWGSQxTKBrQyxyZIdxk4zp4NUVgDaFmf8
	nvK61L9t+5LK3rvbpfAJYjDc8pBt3qU0E46ICJoiMi3/VoBmv3UKDsstAMGXnskVo1RJWPn
	mwxHprzGLBOATIBRE61XF8/30JccjYKhygT/YpMxtjoTIi3d0yxz07/OjK/+n8K0pidJaSS
	Q6Nm64c4okHQ5lucBepay/sTcjHRCM3vzRebYeH3f/0I1KL9q58ZDn94Faz8MHTgf0Iz3Ka
	5gu5O8/4/aNOvNdnI5Ek8cbSD0jDMpdntVOmH/VjWa4dKnb8e5GQ42Xpe3hvx6ZtymWqzQo
	0JbKJz0zhZHn7DTC3b1Ey9E/zjhMWt31dBtAIxs5n3NISbmwLoJCqnAw13hwUnqDSVuHOCH
	Kc+nCpk6HqVwpnT5ColVumlfQB1H3LLSAPYucXqCT/eIdiI/1+EMLmBteiiTjaZunqSgcMu
	XoXwX6URFGIRQ1RhxFl4/PbhkwviPagW0HL0lDbRb2o2SS73GwWvNkeKTZcaUJD1A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

Collect the read-only trace encoder control, features and timestamp
registers per CPU into the AUXTRACE_INFO metadata and validate the
requested context, syncmode, syncmax and timestamp options against the
hardware before recording. Parse the metadata back in the decoder.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 tools/perf/arch/riscv/util/auxtrace.c | 203 +++++++++++++++++++++++++-
 tools/perf/util/gtrace-decoder.c      |  89 ++++++++++-
 tools/perf/util/gtrace.h              |  30 +++-
 3 files changed, 311 insertions(+), 11 deletions(-)

diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
index 882632511d09..c11c5c34cbc8 100644
--- a/tools/perf/arch/riscv/util/auxtrace.c
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -9,6 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/log2.h>
 #include <linux/zalloc.h>
+#include <linux/bitfield.h>
 #include <errno.h>
 #include <limits.h>
 #include <stdlib.h>
@@ -39,28 +40,217 @@ struct rvtrace_recording {
 	struct evlist *evlist;
 };
 
+static const char * const metadata_encoder_ro[] = {
+	[RVTRACE_ENCODER_FORMAT]    = "control/format",
+	[RVTRACE_ENCODER_CONTEXT]   = "control/has_context",
+	[RVTRACE_ENCODER_SRCBITS]   = "features/srcbits",
+	[RVTRACE_ENCODER_TIMESTAMP] = "timestamp/source",
+};
+
 static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
 				     struct evlist *evlist __maybe_unused)
 {
-	return GTRACE_AUXTRACE_PRIV_SIZE;
+	int encoder;
+	struct perf_cpu_map *event_cpus = evlist->core.user_requested_cpus;
+	struct perf_cpu_map *intersect_cpus;
+
+	if (!perf_cpu_map__has_any_cpu(event_cpus)) {
+		/* cpu map is not "any" CPU , we have specific CPUs to work with */
+		struct perf_cpu_map *online_cpus = perf_cpu_map__new_online_cpus();
+
+		intersect_cpus = perf_cpu_map__intersect(event_cpus, online_cpus);
+		perf_cpu_map__put(online_cpus);
+	} else {
+		/* Event can be "any" CPU so count all online CPUs. */
+		intersect_cpus = perf_cpu_map__new_online_cpus();
+	}
+
+	encoder = perf_cpu_map__nr(intersect_cpus);
+	perf_cpu_map__put(intersect_cpus);
+
+	return (GTRACE_HEADER_SIZE + encoder * RVTRACE_ENCODER_PRIV_SIZE);
+
+}
+
+static bool gtrace_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path)
+{
+	char pmu_path[PATH_MAX];
+
+	/* Get RO metadata from sysfs */
+	snprintf(pmu_path, PATH_MAX, "cpu%d/%s", cpu.cpu, path);
+
+	return perf_pmu__file_exists(pmu, pmu_path);
+}
+
+static int rvtrace_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val)
+{
+	char pmu_path[PATH_MAX];
+	int scan;
+
+	/* Get RO metadata from sysfs */
+	snprintf(pmu_path, PATH_MAX, "cpu%d/%s", cpu.cpu, path);
+
+	scan = perf_pmu__scan_file(pmu, pmu_path, "%llx", val);
+	if (scan != 1) {
+		pr_err("%s: error reading: %s\n", __func__, pmu_path);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void rvtrace_get_metadata(struct perf_cpu cpu, u32 *offset,
+				 struct auxtrace_record *itr,
+				 struct perf_record_auxtrace_info *info)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+	bool timestamp_exists;
+
+	info->priv[*offset + RVTRACE_ENCODER_CPU] = cpu.cpu;
+	info->priv[*offset + RVTRACE_ENCODER_NR_TRC_PARAMS] = RVTRACE_ENCODER_NR_TRC_PARAMS_LENGTH;
+
+	/* Get read-only information from sysFS */
+	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_FORMAT],
+		       &info->priv[*offset + RVTRACE_ENCODER_FORMAT]);
+	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_CONTEXT],
+		       &info->priv[*offset + RVTRACE_ENCODER_CONTEXT]);
+	rvtrace_get_ro(rvtrace_pmu, cpu, metadata_encoder_ro[RVTRACE_ENCODER_SRCBITS],
+		       &info->priv[*offset + RVTRACE_ENCODER_SRCBITS]);
+
+	timestamp_exists = gtrace_pmu_path_exists(rvtrace_pmu, cpu,
+			metadata_encoder_ro[RVTRACE_ENCODER_TIMESTAMP]);
+	info->priv[*offset + RVTRACE_ENCODER_TIMESTAMP] = timestamp_exists ? 1 : 0;
+
+	/* Where the next CPU entry should start from */
+	*offset += RVTRACE_ENCODER_PRIV_MAX;
 }
 
 static int rvtrace_info_fill(struct auxtrace_record *itr,
 			     struct perf_session *session __maybe_unused,
 			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
 {
+	unsigned int i;
+	u32 offset;
+	u64 nr_cpu, type;
+	struct perf_cpu_map *cpu_map;
+	struct perf_cpu_map *event_cpus = evlist__core(session->evlist)->user_requested_cpus;
+	struct perf_cpu_map *online_cpus = perf_cpu_map__new_online_cpus();
 	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
 	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+	struct perf_cpu cpu;
+
+	if (priv_size != rvtrace_info_priv_size(itr, session->evlist))
+		return -EINVAL;
 
-	if (priv_size != GTRACE_AUXTRACE_PRIV_SIZE)
+	if (!evlist__core(session->evlist)->nr_mmaps)
 		return -EINVAL;
 
+	if (perf_cpu_map__has_any_cpu(event_cpus)) {
+		cpu_map = online_cpus;
+	} else {
+		perf_cpu_map__for_each_cpu(cpu, i, event_cpus) {
+			if (!perf_cpu_map__has(online_cpus, cpu))
+				return -EINVAL;
+		}
+
+		cpu_map = event_cpus;
+	}
+
+	nr_cpu = perf_cpu_map__nr(cpu_map);
+	type = rvtrace_pmu->type;
+
 	auxtrace_info->type = PERF_AUXTRACE_GTRACE;
-	auxtrace_info->priv[0] = rvtrace_pmu->type;
+	auxtrace_info->priv[GTRACE_PMU_TYPE_CPUS] = type << 32;
+	auxtrace_info->priv[GTRACE_PMU_TYPE_CPUS] |= nr_cpu;
+
+	offset = GTRACE_HEADER_MAX;
+
+	perf_cpu_map__for_each_cpu(cpu, i, cpu_map) {
+		assert(offset < priv_size);
+		rvtrace_get_metadata(cpu, &offset, itr, auxtrace_info);
+	}
+
+	perf_cpu_map__put(online_cpus);
+
+	return 0;
+}
+
+static int rvtrace_encoder_validate_context(struct perf_pmu *rvtrace_pmu, struct evsel *evsel,
+					    struct perf_cpu cpu)
+{
+	int err;
+	u64 ctxt;
+	__u64 context;
+
+	evsel__get_config_val(evsel, "context", &ctxt);
+
+	if (!ctxt)
+		return 0;
+
+	err = rvtrace_get_ro(rvtrace_pmu, cpu,
+			     metadata_encoder_ro[RVTRACE_ENCODER_CONTEXT], &context);
+	if (err)
+		return err;
+
+	if (!context) {
+		pr_err("context not supported");
+		return -EINVAL;
+	}
 
 	return 0;
 }
 
+static int rvtrace_encoder_validate_timestamp(struct perf_pmu *rvtrace_pmu, struct evsel *evsel,
+					      struct perf_cpu cpu)
+{
+	u64 ts;
+
+	evsel__get_config_val(evsel, "timestamp", &ts);
+
+	if (!ts)
+		return 0;
+
+	if (!gtrace_pmu_path_exists(rvtrace_pmu, cpu,
+		    metadata_encoder_ro[RVTRACE_ENCODER_TIMESTAMP])) {
+		pr_err("timestamp not supported");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rvtrace_validate_config(struct perf_pmu *rvtrace_pmu, struct evsel *evsel)
+{
+	unsigned int idx;
+	int err = 0;
+	struct perf_cpu_map *event_cpus = evlist__core(evsel->evlist)->user_requested_cpus;
+	struct perf_cpu_map *intersect_cpus;
+	struct perf_cpu cpu;
+
+	if (!perf_cpu_map__has_any_cpu(event_cpus)) {
+		struct perf_cpu_map *online_cpus = perf_cpu_map__new_online_cpus();
+
+		intersect_cpus = perf_cpu_map__intersect(event_cpus, online_cpus);
+		perf_cpu_map__put(online_cpus);
+	} else {
+		intersect_cpus = perf_cpu_map__new_online_cpus();
+	}
+
+	perf_cpu_map__for_each_cpu_skip_any(cpu, idx, intersect_cpus) {
+		err = rvtrace_encoder_validate_context(rvtrace_pmu, evsel, cpu);
+		if (err)
+			break;
+
+		err = rvtrace_encoder_validate_timestamp(rvtrace_pmu, evsel, cpu);
+		if (err)
+			break;
+	}
+
+	perf_cpu_map__put(intersect_cpus);
+	return err;
+}
+
 static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
 {
 	bool privileged = perf_event_paranoid_check(-1);
@@ -127,6 +317,9 @@ static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist
 	evlist__to_front(evlist, rvtrace_evsel);
 	evsel__set_sample_bit(rvtrace_evsel, TIME);
 
+	if (opts->sample_time_set)
+		evsel__set_config_if_unset(rvtrace_evsel, "timestamp", 1);
+
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");
 	if (err)
@@ -139,6 +332,10 @@ static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist
 	tracking_evsel->core.attr.sample_period = 1;
 	evsel__set_sample_bit(tracking_evsel, TIME);
 
+	err = rvtrace_validate_config(rvtrace_pmu, rvtrace_evsel);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-decoder.c
index c25fbfc61928..d70cb7cd399f 100644
--- a/tools/perf/util/gtrace-decoder.c
+++ b/tools/perf/util/gtrace-decoder.c
@@ -12,6 +12,7 @@
 #include "evlist.h"
 #include "session.h"
 #include "gtrace.h"
+#include "debug.h"
 
 struct gtrace_decoder {
 	struct auxtrace auxtrace;
@@ -19,6 +20,8 @@ struct gtrace_decoder {
 	struct perf_session *session;
 	struct machine *machine;
 	u32 pmu_type;
+	int num_cpu;
+	u64 **metadata;
 };
 
 static int gtrace_process_event(struct perf_session *session __maybe_unused,
@@ -52,7 +55,10 @@ static void gtrace_free(struct perf_session *session)
 					    auxtrace);
 
 	session->auxtrace = NULL;
-	free(ptr);
+	for (int i = 0; i < ptr->num_cpu; i++)
+		zfree(&ptr->metadata[i]);
+	zfree(&ptr->metadata);
+	zfree(&ptr);
 }
 
 static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
@@ -64,24 +70,88 @@ static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
 	return evsel->core.attr.type == ptr->pmu_type;
 }
 
+static const char * const gtrace_global_header_fmts[] = {
+	[GTRACE_PMU_TYPE_CPUS]		    = "	    PMU type/num cpus	    %llx\n",
+};
+
+static const char * const rvtrace_encoder_priv_fmts[] = {
+	[RVTRACE_ENCODER_CPU]		    = "	    CPU			    %lld\n",
+	[RVTRACE_ENCODER_NR_TRC_PARAMS]	    = "	    NR_TRC_PARAMS	    %lld\n",
+	[RVTRACE_ENCODER_FORMAT]	    = "	    FORMAT		    %lld\n",
+	[RVTRACE_ENCODER_CONTEXT]	    = "	    CONTEXT		    %lld\n",
+	[RVTRACE_ENCODER_SRCBITS]	    = "	    SRCBITS		    %lld\n",
+	[RVTRACE_ENCODER_TIMESTAMP]	    = "	    TIMESTAMP		    %lld\n",
+};
+
+static void gtrace_print_auxtrace_info(u64 *val, int num_cpu)
+{
+	int i, j, cpu = 0, nr_params = 0, fmt_offset = 0;
+
+	for (i = 0; i < GTRACE_HEADER_MAX; i++)
+		fprintf(stdout, gtrace_global_header_fmts[i], val[i]);
+
+	for (i = GTRACE_HEADER_MAX; cpu < num_cpu; cpu++) {
+		fprintf(stdout, rvtrace_encoder_priv_fmts[RVTRACE_ENCODER_CPU], val[i++]);
+		nr_params = val[i++];
+		fmt_offset = RVTRACE_ENCODER_FORMAT;
+		for (j = fmt_offset; j < nr_params + fmt_offset; j++, i++)
+			fprintf(stdout, rvtrace_encoder_priv_fmts[j], val[i]);
+	}
+}
+
 int gtrace__process_auxtrace_info(union perf_event *event,
 				   struct perf_session *session)
 {
 	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
 	struct gtrace_decoder *ptr;
-
-	if (auxtrace_info->header.size < GTRACE_AUXTRACE_PRIV_SIZE +
-	    sizeof(struct perf_record_auxtrace_info))
+	u64 *priv;
+	u64 **metadata;
+	int num_cpu;
+	int priv_size;
+	int err;
+	int i;
+
+	priv = (u64 *) auxtrace_info->priv;
+	num_cpu = priv[GTRACE_PMU_TYPE_CPUS] & 0xffffffff;
+	if (dump_trace)
+		gtrace_print_auxtrace_info(priv, num_cpu);
+
+	priv_size = auxtrace_info->header.size - sizeof(struct perf_event_header) -
+		    INFO_HEADER_SIZE - GTRACE_HEADER_SIZE;
+	if (num_cpu <= 0 || priv_size <= 0 ||
+	    num_cpu > priv_size / (int)sizeof(u64))
 		return -EINVAL;
 
-	ptr = zalloc(sizeof(*ptr));
-	if (!ptr)
+	metadata = zalloc(sizeof(*metadata) * num_cpu);
+	if (!metadata)
 		return -ENOMEM;
 
+	i = GTRACE_HEADER_SIZE;
+
+	for (int j = 0; j < num_cpu; j++) {
+		metadata[j] = zalloc(sizeof(*metadata[j]) * RVTRACE_ENCODER_PRIV_MAX);
+		if (!metadata[j]) {
+			err = -ENOMEM;
+			goto err_free_metadata;
+		}
+
+		for (int k = 0; k < RVTRACE_ENCODER_PRIV_MAX; k++)
+			metadata[j][k] = priv[i + k];
+		i += RVTRACE_ENCODER_PRIV_MAX;
+	}
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr) {
+		err = -ENOMEM;
+		goto err_free_metadata;
+	}
+
 	ptr->session = session;
 	ptr->machine = &session->machines.host;
 	ptr->auxtrace_type = auxtrace_info->type;
-	ptr->pmu_type = auxtrace_info->priv[0];
+	ptr->pmu_type = (unsigned int) ((priv[GTRACE_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
+	ptr->num_cpu = num_cpu;
+	ptr->metadata = metadata;
 
 	ptr->auxtrace.process_event = gtrace_process_event;
 	ptr->auxtrace.process_auxtrace_event = gtrace_process_auxtrace_event;
@@ -92,4 +162,9 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 	session->auxtrace = &ptr->auxtrace;
 
 	return 0;
+
+err_free_metadata:
+	for (int j = 0; j < num_cpu; j++)
+		zfree(&metadata);
+	return err;
 }
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
index 02db4f2ff9f5..76006e30e7c3 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -11,7 +11,35 @@
 
 struct perf_session;
 
-#define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
+/* Supported trace protocol formats */
+enum gtrace_format {
+	GTRACE_FORMAT_ETRACE,
+	GTRACE_FORMAT_NTRACE,
+};
+
+enum {
+	GTRACE_PMU_TYPE_CPUS,
+	GTRACE_HEADER_MAX,
+};
+
+/* RISC-V Trace Encoder metadata */
+enum {
+	RVTRACE_ENCODER_CPU,
+	RVTRACE_ENCODER_NR_TRC_PARAMS,
+	RVTRACE_ENCODER_FORMAT,
+	RVTRACE_ENCODER_CONTEXT,
+	RVTRACE_ENCODER_SRCBITS,
+	RVTRACE_ENCODER_TIMESTAMP,
+	RVTRACE_ENCODER_PRIV_MAX,
+};
+
+#define RVTRACE_ENCODER_NR_TRC_PARAMS_LENGTH (RVTRACE_ENCODER_PRIV_MAX - RVTRACE_ENCODER_FORMAT)
+
+#define GTRACE_HEADER_SIZE             (GTRACE_HEADER_MAX * sizeof(u64))
+#define RVTRACE_ENCODER_PRIV_SIZE      (RVTRACE_ENCODER_PRIV_MAX * sizeof(u64))
+
+#define INFO_HEADER_SIZE (sizeof(((struct perf_record_auxtrace_info *)0)->type) + \
+			  sizeof(((struct perf_record_auxtrace_info *)0)->reserved__))
 
 int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
-- 
2.34.1


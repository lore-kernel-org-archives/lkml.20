Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9944B2045
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962754; cv=none; b=tMqL9FwbxcVxSJjRzFbfeAm7qs0EKa8vkxZnzfhsawkbki2Z0c3M81rFh2Fe9yB3ZlX5VUkNSEAEwOVoBhYfC25mvoLKWDa+Tp9nEXnkAkcnWJ4D/UyvJd1IGf4T2EYVr+3vPJ+nsBParkEHj7tfC9eAy69Ow2cLay9iapJs2Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962754; c=relaxed/simple;
	bh=mg2UlutrBqcb5MjaWPYKu+hG8o4JrsODVLn0ia5+Hmo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RtH16Jt2Onfdh8yfiZTP/rbZt7FuDtwX825VEqQgZBGM/IL25i9YL4LIENmJ3rRf/Tgb2k515hON69b2hh/yhvWotMqzuhlE/pHmHY7F+ppPnubM1wCVtK4b6GqWpoxXQ/QM68oudkvWETbiLvn/q4MKx4ZtZMY/mTQ1xlDLd4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LnbZFAhk; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LnbZFAhk"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a0f55a3941so7684891a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790962742; x=1791567542; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WlbWcbT+1Dp0bXpd4OixG7p51siVZ3My9qDVldfBRk=;
        b=LnbZFAhkjpsjNDud7LKUIERwgHh1oJaH+jpcesRIdPKKFczTduAQ1F4ARF04cS/8hd
         quOGYHzpgY9NfEgUIP8YgkGUsuBuLIjgA5nZwNLPSJ16y3HnFCt0j3cGYP2qXzPXf4kR
         nOf4DedRFd2dcPRi3lAghIue2krHgCmH0AWdeyoEwlqeCwf3uPavDNfTMUro82+YQTOu
         W72fe1RQ4CyXcii+rzlEd7kDjN+aJ3NbcjKQUtxQjnB2CUJNJ14T944Arfpfxth29bD/
         Jve9dyU5AlEnS0pYs00s+RhVJFCLBon1h3ozG8zE33uIw5VTQw0VkVfr9NJikY1OXDek
         dQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790962742; x=1791567542;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WlbWcbT+1Dp0bXpd4OixG7p51siVZ3My9qDVldfBRk=;
        b=bLYClhoPjunB/FOqO7x0+dKVf44h4aX40hKctH9ncOOS3EBc8VgP8WOApf9bkVhyHR
         dMIufNt1wgNCWaSenLhFLFY+ijNmeQdH9upJ66t9ebR2o7aBNtdL0WZ6p9YKPaJzTfIA
         SPDKGKXX3lNksBTLhg7q++GkwzmHZY6OK+Q/eM4LOuC/PcJ4meAV5izIeAM4IXe0Ndy5
         OzRmiwDN394JzfgEC8GO9vpJA3GXDa21/REyM+hSCAxFWkG+oLnDrxAa02SWZhVqNz97
         o69NrU3I2eNu4ZsqnSVpUjmQhDsPpuIApyzxtZiilg6a6JXja7KMwpgQaMCR2qNoGifC
         B+KA==
X-Forwarded-Encrypted: i=1; AKwUvBx7lzYb/o5fl1f5UdmCU+7V1tNMsbB+TqytEukswihrrKToNeFx4n1rKdY2IoMXVdQgpZ46eJ/Vzv7rYCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBCLzCQ3UFgNYgKHJZXwtfONDkXFQNN2u+mYzj/5bIYjTgrcgi
	w4dfgZDgmS38w2/+A9mynyflo27ZYKvqY4PVbu7eiUmz7mUh9hkTb7FR+U5XBEQqwNr7S4nh7CH
	HCRInxKQPYA==
X-Received: from pjrf1.prod.google.com ([2002:a17:90a:b401:b0:3a6:f2a2:7e74])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35c3:b0:3a0:4668:4cb0
 with SMTP id 98e67ed59e1d1-3a6cead5baemr3093754a91.47.1790962741600; Fri, 02
 Oct 2026 10:39:01 -0700 (PDT)
Date: Fri,  2 Oct 2026 10:38:34 -0700
In-Reply-To: <20261002173848.3228217-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424061943.1321025-1-irogers@google.com> <20261002173848.3228217-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002173848.3228217-2-irogers@google.com>
Subject: [PATCH v2 1/8] perf event: Factor build_id out into its own top-level struct
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org
Cc: ak@linux.intel.com, alexander.shishkin@linux.intel.com, 
	atrajeev@linux.ibm.com, dvyukov@google.com, fzczx123@gmail.com, 
	james.clark@linaro.org, jolsa@kernel.org, kjain@linux.ibm.com, 
	krzysztof.m.lopatowski@gmail.com, leo.yan@arm.com, lihuafei1@huawei.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux@treblig.org, m.liska@foxlink.cz, mark.rutland@arm.com, 
	martin.liska@hey.com, mpetlan@redhat.com, quic_zhonhan@quicinc.com, 
	scclevenger@os.amperecomputing.com, sesse@google.com, 
	stephen.s.brennan@oracle.com, thomas.falcon@intel.com, 
	yangyicong@hisilicon.com
Content-Type: text/plain; charset="UTF-8"

Future changes will use build_id in more contexts. For consistency make
the struct its own type and update usage to be of this type.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/uapi/linux/perf_event.h       | 19 +++++++++-----
 tools/include/uapi/linux/perf_event.h | 19 +++++++++-----
 tools/lib/perf/include/perf/event.h   | 18 ++++++++------
 tools/perf/builtin-inject.c           |  3 ++-
 tools/perf/util/event.c               |  4 +--
 tools/perf/util/machine.c             |  3 ++-
 tools/perf/util/python.c              |  8 +++---
 tools/perf/util/synthetic-events.c    | 36 ++++++++++++++-------------
 8 files changed, 66 insertions(+), 44 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8d697f..035b4b416ce3 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1058,6 +1058,18 @@ enum perf_event_type {
 	 */
 	PERF_RECORD_SAMPLE			= 9,
 
+	/*
+	 * Build IDs may be present in a number of events. They have a
+	 * consistent encoding of:
+	 *
+	 * struct perf_build_id {
+	 *	u8		size;
+	 *	u8		__reserved_1;
+	 *	u16		__reserved_2;
+	 *	u8		data[20];
+	 * };
+	 */
+
 	/*
 	 * The MMAP2 records are an augmented version of MMAP, they add
 	 * maj, min, ino numbers to be used to uniquely identify each mapping
@@ -1076,12 +1088,7 @@ enum perf_event_type {
 	 *			u64		ino;
 	 *			u64		ino_generation;
 	 *		};
-	 *		struct {
-	 *			u8		build_id_size;
-	 *			u8		__reserved_1;
-	 *			u16		__reserved_2;
-	 *			u8		build_id[20];
-	 *		};
+	 *		struct perf_build_id	build_id;
 	 *	};
 	 *	u32				prot, flags;
 	 *	char				filename[];
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index c49fc76292f7..63f8866479a3 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1099,6 +1099,18 @@ enum perf_event_type {
 	 */
 	PERF_RECORD_SAMPLE			= 9,
 
+	/*
+	 * Build IDs may be present in a number of events. They have a
+	 * consistent encoding of:
+	 *
+	 * struct perf_build_id {
+	 *	u8		size;
+	 *	u8		__reserved_1;
+	 *	u16		__reserved_2;
+	 *	u8		data[20];
+	 * };
+	 */
+
 	/*
 	 * The MMAP2 records are an augmented version of MMAP, they add
 	 * maj, min, ino numbers to be used to uniquely identify each mapping
@@ -1117,12 +1129,7 @@ enum perf_event_type {
 	 *			u64		ino;
 	 *			u64		ino_generation;
 	 *		};
-	 *		struct {
-	 *			u8		build_id_size;
-	 *			u8		__reserved_1;
-	 *			u16		__reserved_2;
-	 *			u8		build_id[20];
-	 *		};
+	 *		struct perf_build_id	build_id;
 	 *	};
 	 *	u32				prot, flags;
 	 *	char				filename[];
diff --git a/tools/lib/perf/include/perf/event.h b/tools/lib/perf/include/perf/event.h
index fdced574c889..173eab43c148 100644
--- a/tools/lib/perf/include/perf/event.h
+++ b/tools/lib/perf/include/perf/event.h
@@ -26,6 +26,15 @@ struct perf_record_mmap {
 	char			 filename[PATH_MAX];
 };
 
+#define PERF_BUILD_ID_SIZE 20
+
+struct perf_build_id {
+	__u8	 size;
+	__u8	 __reserved_1;
+	__u16	 __reserved_2;
+	__u8	 data[PERF_BUILD_ID_SIZE];
+};
+
 struct perf_record_mmap2 {
 	struct perf_event_header header;
 	__u32			 pid, tid;
@@ -39,12 +48,7 @@ struct perf_record_mmap2 {
 			__u64	 ino;
 			__u64	 ino_generation;
 		};
-		struct {
-			__u8	 build_id_size;
-			__u8	 __reserved_1;
-			__u16	 __reserved_2;
-			__u8	 build_id[20];
-		};
+		struct perf_build_id build_id;
 	};
 	__u32			 prot;
 	__u32			 flags;
@@ -321,7 +325,7 @@ struct perf_record_header_build_id {
 	union {
 		__u8		 build_id[24];
 		struct {
-			__u8	 data[20];
+			__u8	 data[PERF_BUILD_ID_SIZE];
 			__u8	 size;
 			__u8	 reserved1__;
 			__u16	 reserved2__;
diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index ce7562fc788c..67f019acb6c0 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -811,7 +811,8 @@ static int perf_event__repipe_mmap2(const struct perf_tool *tool,
 	struct dso_id id = dso_id_empty;
 
 	if (event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) {
-		build_id__init(&id.build_id, event->mmap2.build_id, event->mmap2.build_id_size);
+		build_id__init(&id.build_id, event->mmap2.build_id.data,
+			       event->mmap2.build_id.size);
 	} else {
 		id.maj = event->mmap2.maj;
 		id.min = event->mmap2.min;
diff --git a/tools/perf/util/event.c b/tools/perf/util/event.c
index ea75816d126a..c69ae57ce679 100644
--- a/tools/perf/util/event.c
+++ b/tools/perf/util/event.c
@@ -335,8 +335,8 @@ size_t perf_event__fprintf_mmap2(union perf_event *event, FILE *fp)
 		char sbuild_id[SBUILD_ID_SIZE];
 		struct build_id bid;
 
-		build_id__init(&bid, event->mmap2.build_id,
-			       event->mmap2.build_id_size);
+		build_id__init(&bid, event->mmap2.build_id.data,
+			       event->mmap2.build_id.size);
 		build_id__snprintf(&bid, sbuild_id, sizeof(sbuild_id));
 
 		return fprintf(fp, " %d/%d: [%#" PRI_lx64 "(%#" PRI_lx64 ") @ %#" PRI_lx64
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 1d9d3bf57720..4bcb16da6481 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -1799,7 +1799,8 @@ int machine__process_mmap2_event(struct machine *machine,
 		perf_event__fprintf_mmap2(event, stdout);
 
 	if (event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) {
-		build_id__init(&dso_id.build_id, event->mmap2.build_id, event->mmap2.build_id_size);
+		build_id__init(&dso_id.build_id, event->mmap2.build_id.data,
+			       event->mmap2.build_id.size);
 	} else {
 		dso_id.maj = event->mmap2.maj;
 		dso_id.min = event->mmap2.min;
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 95140dfaef9c..cc9257e2cceb 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -250,12 +250,12 @@ static PyObject *pyrf_mmap2_event__get_build_id(PyObject *self, void *closure __
 	if (!(pevent->event.header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID))
 		Py_RETURN_NONE;
 
-	int size = pevent->event.mmap2.build_id_size;
+	size_t size = pevent->event.mmap2.build_id.size;
 
-	if (size > 20)
-		size = 20;
+	if (size > sizeof(pevent->event.mmap2.build_id.data))
+		size = sizeof(pevent->event.mmap2.build_id.data);
 
-	return PyBytes_FromStringAndSize((const char *)pevent->event.mmap2.build_id, size);
+	return PyBytes_FromStringAndSize((const char *)pevent->event.mmap2.build_id.data, size);
 }
 
 static PyGetSetDef pyrf_mmap2_event__getset[] = {
diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
index b9dbd105cdc3..4d552150bc04 100644
--- a/tools/perf/util/synthetic-events.c
+++ b/tools/perf/util/synthetic-events.c
@@ -452,7 +452,7 @@ static void perf_record_mmap2__read_build_id(struct perf_record_mmap2 *event,
 	}
 
 	if (event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) {
-		build_id__init(&dso_id.build_id, event->build_id, event->build_id_size);
+		build_id__init(&dso_id.build_id, event->build_id.data, event->build_id.size);
 	} else {
 		dso_id.maj = event->maj;
 		dso_id.min = event->min;
@@ -479,11 +479,11 @@ static void perf_record_mmap2__read_build_id(struct perf_record_mmap2 *event,
 
 out:
 	if (rc == 0) {
-		memcpy(event->build_id, bid.data, sizeof(bid.data));
-		event->build_id_size = (u8) bid.size;
+		memcpy(event->build_id.data, bid.data, sizeof(bid.data));
+		event->build_id.size = (u8) bid.size;
 		event->header.misc |= PERF_RECORD_MISC_MMAP_BUILD_ID;
-		event->__reserved_1 = 0;
-		event->__reserved_2 = 0;
+		event->build_id.__reserved_1 = 0;
+		event->build_id.__reserved_2 = 0;
 
 		if (dso && !dso__has_build_id(dso))
 			dso__set_build_id(dso, &bid);
@@ -611,8 +611,10 @@ int perf_event__synthesize_mmap_events(const struct perf_tool *tool,
 		event->mmap2.prot = prot;
 		event->mmap2.flags = flags;
 
-		if (!symbol_conf.no_buildid_mmap2)
-			perf_record_mmap2__read_build_id(&event->mmap2, machine, false);
+		if (!symbol_conf.no_buildid_mmap2) {
+			perf_record_mmap2__read_build_id(&event->mmap2, machine,
+							 /*is_kernel=*/false);
+		}
 
 		if (perf_tool__process_synth_event(tool, event, machine, process) != 0) {
 			rc = -1;
@@ -807,12 +809,12 @@ static int perf_event__synthesize_modules_maps_cb(struct map *map, void *data)
 
 		/* Clear stale build ID and entire union from previous module iteration */
 		event->mmap2.header.misc &= ~PERF_RECORD_MISC_MMAP_BUILD_ID;
-		memset(event->mmap2.build_id, 0, sizeof(event->mmap2.build_id));
-		event->mmap2.build_id_size = 0;
-		event->mmap2.__reserved_1 = 0;
-		event->mmap2.__reserved_2 = 0;
+		memset(event->mmap2.build_id.data, 0, sizeof(event->mmap2.build_id.data));
+		event->mmap2.build_id.size = 0;
+		event->mmap2.build_id.__reserved_1 = 0;
+		event->mmap2.build_id.__reserved_2 = 0;
 
-		perf_record_mmap2__read_build_id(&event->mmap2, args->machine, false);
+		perf_record_mmap2__read_build_id(&event->mmap2, args->machine, /*is_kernel=*/false);
 	} else {
 		const char *long_name = dso__long_name(dso);
 
@@ -1293,7 +1295,7 @@ static int __perf_event__synthesize_kernel_mmap(const struct perf_tool *tool,
 		event->mmap2.len   = map__end(map) - event->mmap.start;
 		event->mmap2.pid   = machine->pid;
 
-		perf_record_mmap2__read_build_id(&event->mmap2, machine, true);
+		perf_record_mmap2__read_build_id(&event->mmap2, machine, /*is_kernel=*/true);
 	} else {
 		size = snprintf(event->mmap.filename, sizeof(event->mmap.filename),
 				"%s%s", machine->mmap_name, kmap->ref_reloc_sym->name) + 1;
@@ -2524,10 +2526,10 @@ int perf_event__synthesize_mmap2_build_id(const struct perf_tool *tool,
 	ev.mmap2.len = len;
 	ev.mmap2.pgoff = pgoff;
 
-	ev.mmap2.build_id_size = bid->size;
-	if (ev.mmap2.build_id_size > sizeof(ev.mmap2.build_id))
-		ev.mmap2.build_id_size = sizeof(ev.mmap2.build_id);
-	memcpy(ev.mmap2.build_id, bid->data, ev.mmap2.build_id_size);
+	ev.mmap2.build_id.size = bid->size;
+	if (ev.mmap2.build_id.size > sizeof(ev.mmap2.build_id.data))
+		ev.mmap2.build_id.size = sizeof(ev.mmap2.build_id.data);
+	memcpy(ev.mmap2.build_id.data, bid->data, ev.mmap2.build_id.size);
 
 	ev.mmap2.prot = prot;
 	ev.mmap2.flags = flags;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


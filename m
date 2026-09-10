Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FA42E413
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074778; cv=none; b=XidV3k24A1SEblrvS8vV/IVp++8qmXqwjg/VKI/JWni4XlPgTxKHwH+ZBulCu/Qb0epn/CkXTuTAJeATc7YKMYMNPdq+JROPWfMHdsKok4DCpwDMoLr/LKdqyogz3yNz+7XvntdrCNqQu507rVFnyE6uwA/SFkp1lcyAUrdklfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074778; c=relaxed/simple;
	bh=pHmH4FKVoanWCsK6EvzxcfwQB0GYW9gq4JtV5uiHIwM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=BoP/A7mpLtKrwg4f8hju5cgrW1U0LGTMRdiPL8MyOZilw3lGBK68y4BJyvvd+fjPhjre7o0zIQh1JyvXIc3kg83zb3IGnDA8K4010Eg+bdafEioc8imXaAVEOuKHAV5x+xfZ6WIi71nwduOt/aSknTTO6ll57c1+Y3XF30YgW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ae1y8A5c; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ae1y8A5c"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so385503a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789074762; x=1789679562; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmuwdNR4NKfLQOl78IvOzdTNOGEQTEMkPYahKNXJxGY=;
        b=ae1y8A5cGiboZjuE9w7IHqGVAX3yh+AoiTAJZKHJJudD8gniefqgHkrYyqufYZPg5B
         CydwIuRRqZlAmOp02dqkzNm2uSDS08AaIqDBGvXSQcA3MHsj79R/lkQb799TdAwDLy9p
         8/EhdW1Nt3JIyCEain74Syv+shim9eCv9T/j7z0NDgQIYtddJmt1hG8s73uAnfbgwnor
         9slYUSpzEesRkPpNS/p/bRFh7Rc66DHhb7dJC7Oistwozxj7YtZlLaeLBETkmwoEslPg
         yqki1Ni4/ETj23ZhOkRgs7xAZz3LaNOeBYIhxs36e21zkW7zCCQI7e/6T5oFQIwshMUQ
         MGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074762; x=1789679562;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmuwdNR4NKfLQOl78IvOzdTNOGEQTEMkPYahKNXJxGY=;
        b=idEHi9fg3BHydWST2sCL2CwZ3VyTYefoziHMQomFilR8urKlEwoEtA40vxEXzL58Ug
         3gYsH9b3gf5sc1GdC0mfGnXwr7GUnHujqfE1CzMRI8IjNbhNFWnRnxGzSr/TFbHXy+Vc
         1UIkReSsteiLzumpInC4fiermn8NpnrR1CzB0cbV0GKObSkecopMBtqf4IGB0qUALKMS
         zOTT61WqyXaTbx+au1rM01mxEWLqpyLs2NqN0pg0Dz3mJj10qkT+sD7F+Piw9G0ue1ie
         vXPgcBLSKdV2Vx9S6CfKVeXwPksVYQPGIA7CD/LKcTyNzxAZdihLfj+M0xwtzpibmFba
         QCiw==
X-Forwarded-Encrypted: i=1; AKwUvByhHuZpVdqrMu6yv+pjvatlSKCAS9QiHvuNv7eVdCK8uvNYYl49v3U4+8FC20DAmglGiAdeWNFMPd1j0ZA=@vger.kernel.org
X-Gm-Message-State: AFuF++kSyQqssQdX5RI32IAr8Lroj3kUi/4fISTLZQP7igVBrgiY42XL
	dDE+eI3KOtvwKvidlbGuVAH3Xt4V8heBN9cXpdBx0cc5KNUmI8g2EnOUO2ayk/JlcSsvq8hndbT
	uBACLyQAQ9g==
X-Received: from dlbdt18.prod.google.com ([2002:a05:7022:2592:b0:143:6670:4d89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:618d:b0:3cc:f008:8123
 with SMTP id adf61e73a8af0-3daed153d75mr1559765637.8.1789074761613; Thu, 10
 Sep 2026 14:12:41 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:12:20 -0700
In-Reply-To: <20260910211221.3154261-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910175634.3014018-1-irogers@google.com> <20260910211221.3154261-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910211221.3154261-4-irogers@google.com>
Subject: [PATCH v3 3/3] perf header: Transition WARN macros to debug.h equivalents
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Avoid a checkpatch.pl warning on the use of asm/bug.h by switching the
use of WARN macros to explicit tests and then using pr_warning from
debug.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/header.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 0a4236fc0293..c7f2c29f02b0 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -8,7 +8,6 @@
 #include <stdlib.h>
 #include <string.h>
 
-#include <asm/bug.h>
 #include <byteswap.h>
 #include <dirent.h>
 #include <linux/bitops.h>
@@ -385,8 +384,10 @@ static int do_read_bitmap(struct feat_fd *ff, unsigned long **pset, u64 *psize)
 static int write_tracing_data(struct feat_fd *ff,
 			      struct evlist *evlist __maybe_unused)
 {
-	if (WARN(ff->buf, "Error: calling %s in pipe-mode.\n", __func__))
+	if (ff->buf) {
+		pr_warning("Error: calling %s in pipe-mode.\n", __func__);
 		return -1;
+	}
 
 #ifdef HAVE_LIBTRACEEVENT
 	return read_tracing_data(ff->fd, &evlist__core(evlist)->entries);
@@ -407,8 +408,10 @@ static int write_build_id(struct feat_fd *ff,
 	if (!perf_session__read_build_ids(session, true))
 		return -1;
 
-	if (WARN(ff->buf, "Error: calling %s in pipe-mode.\n", __func__))
+	if (ff->buf) {
+		pr_warning("Error: calling %s in pipe-mode.\n", __func__);
 		return -1;
+	}
 
 	err = perf_session__write_buildid_table(session, ff);
 	if (err < 0) {
@@ -1014,8 +1017,10 @@ static int write_auxtrace(struct feat_fd *ff,
 	struct perf_session *session;
 	int err;
 
-	if (WARN(ff->buf, "Error: calling %s in pipe-mode.\n", __func__))
+	if (ff->buf) {
+		pr_warning("Error: calling %s in pipe-mode.\n", __func__);
 		return -1;
+	}
 
 	session = container_of(ff->ph, struct perf_session, header);
 
@@ -1109,9 +1114,10 @@ static int write_dir_format(struct feat_fd *ff,
 	session = container_of(ff->ph, struct perf_session, header);
 	data = session->data;
 
-	if (WARN_ON(!perf_data__is_dir(data)))
+	if (!perf_data__is_dir(data)) {
+		pr_warning("Expected data to be a directory\n");
 		return -1;
-
+	}
 	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
 }
 
@@ -3715,9 +3721,10 @@ static int process_dir_format(struct feat_fd *ff,
 	session = container_of(ff->ph, struct perf_session, header);
 	data = session->data;
 
-	if (WARN_ON(!perf_data__is_dir(data)))
+	if (!perf_data__is_dir(data)) {
+		pr_warning("Expected data to be a directory\n");
 		return -1;
-
+	}
 	return do_read_u64(ff, &data->dir.version);
 }
 
@@ -4395,8 +4402,10 @@ static int do_write_feat(struct feat_fd *ff, int type,
 		if (!feat_ops[type].write)
 			return -1;
 
-		if (WARN(ff->buf, "Error: calling %s in pipe-mode.\n", __func__))
+		if (ff->buf) {
+			pr_warning("Error: calling %s in pipe-mode.\n", __func__);
 			return -1;
+		}
 
 		(*p)->offset = lseek(ff->fd, 0, SEEK_CUR);
 
-- 
2.55.0.1007.g17ff1f9808-goog


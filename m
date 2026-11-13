Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606561;
	b=wV9DWpX6NpSiS/sA4/FMk7G5urAaiS/UR657nmHiOF6s+YgpDUsxZhqR+pxv3hSZAtXy
	 pdt/9UNXMu9tqYvVjd89eZafUdQhX3i8Cqvkq0FLy8Uewq3lvddTrz8lJp8cjzQ2AZFHy
	 lXcXl8SUQk7sw1TnE3vZfQPyAt/e8STAv/Jp0NiAR7waWr+fgIyeMYIwREq2yeht2nJ0c
	 Sq2iXDs66W3RJydiTl5C9z2MSHlxIFnZ2eJccpIb5FMiJANymttxy7Zhoan5Zqmcfj7A+
	 cWYZkvj+bb5Y8YGOwpFWQJi0eBL7Wk/alryT2PvMfKzGnDnDoRfeUDNEQK+CqSbkCuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Nj5LFje5rjDypMD41TfYsvDxSNpFbWc1YeYlPKh1FBk=;
	b=bdSCq0c+QGixvKunGPIEeBNL20qKdp6oPuZVyetd5OJPDPNAxSQNcjqVQBPoXG5y0Y2d
	 3SGPjMhnztyt4KtDq8myx+P8WOt2VhSXS40i9EfOKrNWDdnHiq/SRia18foRVEbPz7ZnC
	 VnhUqKE+cYqEzu2Ydj8MbcvpuUB6jHSigWeTEwHpJN4YZX5LFQNekxf2Cxz5y+k/N+HcZ
	 5j/fYXojbclYVdFLrZEzsosUmVp3NbZ2yH/PS/6+nr002aruzVYVAkfEsYI71Qt7P3TfK
	 VQI2sqo+0WwMgBzf8GHQrsrnk21xiCsGT4V8lsifBP+oxI5p5F+8DdyGNXlY26ZNIEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=odfzQzjP;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E0606A8A2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760E0606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=odfzQzjP
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso6341512eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606560; x=1795211360; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nj5LFje5rjDypMD41TfYsvDxSNpFbWc1YeYlPKh1FBk=;
        b=odfzQzjP+7ShpqERtnXA0JZeTw4C3iuTyeG9umyCNRyuAXOGuz7n0ju2mqhXeFiFKV
         NZdUFsHt2HWqW4sfcYLpidSb56dSkdjZWa4Va2LxvyNnJFHAqMdmBDrydUCpi/tBla5B
         QpoxAcqSDOeuCeFR8OX01PaarnGI59wD11QZdGYOQeY6lhmBVkb4gNZwKKRiqoHK4YKF
         NRL+ia5ZWI5UVFmqVqSIPjF/Jqk3zge1OXBNcgp8SZgbgAwj4sY0ftqvKhJb3GDtWDRg
         PnlIdg8BtuYirwXzsYgT0zX5IUPCfCFhdMBKHezJfl0Fb8b3KTbsdzqW5xgBiXlfqRDv
         lpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606560; x=1795211360;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nj5LFje5rjDypMD41TfYsvDxSNpFbWc1YeYlPKh1FBk=;
        b=fpnfWNMv/QJmuyQdmyLy8Z1ZVvsDATYwsXNELz+TqU6Bkh75lcyXL1VvIak/NESi23
         Y9WUc45yUFI937xlpvAwMrPVxWICHcSB4kZI/KOKYaATwRM6dXx3+RzYTDxKLySuAr8U
         wSiAQxOOYVYa5XUmDkmJgdfSZBGeD08+dG0hm0H3BDUEiGcja889yfERWG+JZiRPZR/X
         PtspNzybF2jdSCX/ccrjXSJuTElvaReRCnwdtmqh+h6gQMJt9M47IJRCq2o8alwdw+4S
         0avxic0eoTSz4g8pfWFwv0/yDasekFjzy36ZfTWUjtAOlFCgQJzy/buf7AfsKbbboMRn
         +XFA==
X-Forwarded-Encrypted: i=1; AL+hErElxvWBUsUJV70NYY3CmOBZAR+gFcVHP2RnWiKenrSWTJiyuwD5XLOOmoxlkwLQBLUTv864+9nvcjKEgXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WG7YgIYln0xzbmsbL7Uq92gTzyLW2R8fs3xv81IuUTeAtDvem
	ot1pgdt4inowawRc1mKoyuCYeab/pc78235+ZLQDlUlPhPBe0f0J15cw5h4CnTYA/DCTNLi7kxL
	venhMLzvqaA==
X-Received: from dlec2-n1.prod.google.com ([2002:a05:701b:4282:10b0:1a7:2bf1:46cc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:260a:b0:1b2:6a01:f55e
 with SMTP id a92af1059eb24-1b50312bccfmr3345764c88.34.1794606559279; Fri, 13
 Nov 2026 13:49:19 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:27 -0800
In-Reply-To: <20261113214850.3329699-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113214850.3329699-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113214850.3329699-4-irogers@google.com>
Subject: [PATCH v1 03/26] perf stat: Fix per_pkg_mask key leak on hashmap__add failure
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In check_per_pkg(), key is allocated with malloc() before checking
whether the (die, socket) pair is already present in per_pkg_mask. If
hashmap__find() misses and hashmap__add() fails (e.g. -ENOMEM), key is
never freed.

Free key when hashmap__add() fails.

Fixes: 034f7ee130c1 ("perf stat: Fix wrong skipping for per-die aggregation")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
index 6da3dbbde0e2..e7013449271d 100644
--- a/tools/perf/util/stat.c
+++ b/tools/perf/util/stat.c
@@ -363,8 +363,11 @@ static int check_per_pkg(struct evsel *counter, struct perf_counts_values *vals,
 	if (hashmap__find(mask, key, NULL)) {
 		*skip = true;
 		free(key);
-	} else
+	} else {
 		ret = hashmap__add(mask, key, 1);
+		if (ret)
+			free(key);
+	}
 
 	return ret;
 }
-- 
2.56.1.703.gf848ed807c-goog


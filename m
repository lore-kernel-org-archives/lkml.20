Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7046AA62
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965603; cv=none; b=kUt/sdTTtFnaHX8sNBpFA5wVxOTOZLJiBPRmPDxsYAaQruUAU+YfiIoZrP4jvQ9YXXk8k+JP/jLngS5zk2UcLdoEume8aMK+KC7pXgCR0hUW8y4OwYnje6iiLj5QlUYjI+IvHxu6TF7RwXVlbdIkpX0by352u08vy+Tg1WcIeS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965603; c=relaxed/simple;
	bh=OM46CAJaPz4QYEd8sDanlXYv8xwY3Glth8bKP5V2FjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=p1IPVRdbANzLuybdgX+ms4mZLJTnbtaexIGNuRuIImdrVwemxTj3H1xvMqc5YMvipoxKtmXrbnClNB7m/yd3Fq/DGo2XINfmvVjc1nc1n6b4PdyhGpyjdkC8Cv4eGR/6rBHRedCg/sE3+CcQmkeJ2O1GiRty5l4SicgN+DkdrTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbU63/K5; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbU63/K5"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34e676375d9so1678505eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790965601; x=1791570401; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBeh34sZOWhKN5OeKCeSIDvs4CKilup494f+n9rG9v0=;
        b=bbU63/K5rBBQoTlBLstqm4u7J4hHXVnsd+bjfYqnCuQ/TXQwU25VKcvInEr3MYy5wb
         vslWaXj/uK+83Vgo0oaaHCfNCWpyiAmrjfta4GiCu4IYsQ7GeA2824YsRDd2WfH4JPhE
         +TlLZ+MAkjUSK9OhEBUwpD7OYGBujLW9FPKDmooXsZJmyzyILh+oCg6C2KCIPxi7jLNp
         jKBShg2EGmqeS6LCA2Rgjf3GT9f5HMVXQlRwQIM/+WYO426nLnPikGEuq69U1JH76m9n
         j5VMpu8UUBfS5fZ51kiZz+btIHmMugxJY+75stUUt6XPCmO4Ug3zuaqAauxeybv8k+JT
         pIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965601; x=1791570401;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBeh34sZOWhKN5OeKCeSIDvs4CKilup494f+n9rG9v0=;
        b=QDj5J9YBzdZ/2w+MqlMoRlgPgrIi8MAPELxThgYAPvfPwV04bhvHYOTG3aDJQC+KWb
         VUFjIK/9gmPAP+KkVhoz8yt+KsbJOfY/CtndPO6ZBVWilT42vm1/+X/L2Pu9/HT3XQvl
         GR1fr70srlKkmz2Q4is/Qzx6hn8Qgqr+RqBK+4TIivqig7qVF8f1hS8v5B8okUnZYn/x
         XOXuPdIViOlzQ95YSQJrU+ztCJqhmTKlx+svSN05JFtE26YvSAw/1j/KLBrINx9aLq1t
         KHgWoGdS9ICrL915wFnBNH0r9SycDO4CSDNQRP5cJ3Sy6n5jpv/vWHrd4xEdsT4FT/ZZ
         DT0g==
X-Forwarded-Encrypted: i=1; AKwUvBwX1MXtrEDORdWgYY30GkHexRrG7Pyw39HiKRviTdyrzpOabGJVX0eJycWMO6jb6Gsz2N0wDNOen9L0kK0=@vger.kernel.org
X-Gm-Message-State: AFuF++lT4OyPcl1mB6k1AV0yupJNrYHY+UVDl958fy/Pv62xzz/NDfr/
	GvbD6OBtKrD+Y7oE1XbDkk1yGh+TTbeC4KHL/9vxHMuD1KcAqNcZFeN0LskjzFlbCCHMSTCOBMn
	BB+i7c6VtWQ==
X-Received: from dlbsw13.prod.google.com ([2002:a05:7022:3a8d:b0:14f:62f7:d5cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2816:b0:14a:6a66:f6e3
 with SMTP id a92af1059eb24-14dd1969ba7mr6241334c88.20.1790965600160; Fri, 02
 Oct 2026 11:26:40 -0700 (PDT)
Date: Fri,  2 Oct 2026 11:26:10 -0700
In-Reply-To: <20261002182624.3259797-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261002182624.3259797-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261002182624.3259797-2-irogers@google.com>
Subject: [PATCH v1 01/13] perf session: Don't flush remaining events once
 processing is done
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Falcon <thomas.falcon@intel.com>, 
	Alice Rogers <alice.mei.rogers@gmail.com>, Changbin Du <changbin.du@huawei.com>, 
	Tengda Wu <wutengda@huaweicloud.com>, tanze <tanze@kylinos.cn>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When session_done() is set, for example by SIGINT or by a python
callback requesting processing stop, the reader loops stop but the
deferred samples and auxtrace data are still flushed afterwards. For
large traces decoding and delivering the remaining auxtrace data can be
slow, and the events are delivered to tools that asked to stop.

Discard the remaining deferred samples, and skip
auxtrace__flush_events(), when session_done() is set. The
ordered_events flush already honors session_done().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 7 +++++++
 tools/perf/util/session.c  | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index ed2113190785..f30f86156a3a 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -2978,6 +2978,13 @@ int auxtrace__flush_events(struct perf_session *session, const struct perf_tool
 	if (!session->auxtrace)
 		return 0;
 
+	/*
+	 * Processing was stopped early, e.g. by SIGINT, so don't decode and
+	 * deliver the remaining trace data which can be slow.
+	 */
+	if (session_done())
+		return 0;
+
 	return session->auxtrace->flush_events(session, tool);
 }
 
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 7fea9e72726c..74b0fc0514d3 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2018,6 +2018,14 @@ static int session__flush_deferred_samples(struct perf_session *session,
 		struct perf_sample sample;
 		struct evsel *new_evsel;
 
+		if (session_done()) {
+			/* Processing was stopped early, discard the sample. */
+			list_del(&de->list);
+			free(de->event);
+			free(de);
+			continue;
+		}
+
 		perf_sample__init(&sample, /*all=*/false);
 		ret = evlist__parse_sample(evlist, de->event, &sample);
 		if (ret < 0) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


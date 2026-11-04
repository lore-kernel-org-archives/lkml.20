Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825986;
	b=v7we+1NWvSvUAu5sEY0PULXzARPjaE9NBfsQf3PGuo0Lwa9ObJjNpHzVav56M4mClMTu
	 zwHkWoCWhaAF6A5d1Eipdm11KL83CVdBnQmvhyXT4LkR81oXAU5Q3zdamaOsoF5ZL0DIs
	 kq/ZdX3doTrG6bq8YZ8wT5Yo8ZuXppQNo4wX8oo+3DX8hNKHODtzF8gDrfLCiSWR5sgGq
	 7gVfGEOta4EEquMLeoF3f8Iah8p6YDosd6UHbKX4HGXP3l5nzdt3CAW6gr6/8Qm6QpyJr
	 KFrcS2Ffi2DkXSuRvn7aapQOZ+C+tZ81kE81RgvAgl9oQaU6OT7s3niuHaQeOSOBAYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
	b=UCGYJV8D/LqoYiHZj2452D2NnAPn4VoDLPjgmmSU5FLzyRC7xaQ+3dyyTymQWK4VrC0p
	 DKTV+siapkl784q059cYRkn2mncJxLVHJ8Mkb/Rk6zZ2UA8zycYxrySfnqNJvtXu3SFDm
	 iIEeOL3KKqd+4MTYfGZPCmiPGi68oZhXsRa8S8ytRoI5+pvgfyDhoVghpHoOGW8/+Ee/W
	 5hOzLkcrTZ+eGKq8EesLNhMs4WYptz4Sb2va6Mlmx+VI5te3i1gn2gYFc/z4Rkd5sXBbn
	 DsjrzvWn7vJh2lDjmCqE0DrrXys/JAT2HjjgpEc2q67onKuXkMIbgwI0UghGIc9KUAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CjZ4RWyh;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77561606D154
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77561606D154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CjZ4RWyh
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so2431351eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825985; x=1794430785; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=CjZ4RWyhOmNmJ+RQ8yLK7ClqEBbaW26nZ+oXOA9+K3akR9J0rjGdWXZZCzLdSjtne8
         RWIXHqkWFDHkh2Ywt4yc8/BhgkPtBKpdhiY8QhsJY4X9Ig231Hvd6AXfUpQtAkaArj+p
         Px3Bqgd1zYeu63Z6SPwuJ1JW4n21/dk2ya91FdcWLNRBZpy9n3Kpdvw4b+V1cwDF/7dc
         ZSOKUe85QUa8JoBP2dyBDknSRZK2we05gq+oFn9yyLjSFrocm67UlMeucpo7LbCPla7J
         4Ct4a2dGoZR2rtrAjg+cGLS71ryI2qHLJEEUIY8yTpVrXzwcLNPhvKpIi1IwYsxxF8sb
         5J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825985; x=1794430785;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=aUUCJTn8h85RcfyW4R+7HtzcuG7g1qupg2Ns7mxhchG3b8ihj+YA9yjZu3bBfTboAZ
         gVWmjw5uJfEWuhf0l8CyuWAQZc0sieYsvHwhyBsln4Ky37aQ14P/9TUFXcj/2cvjySJJ
         kQn7dM+Fmgl8+Rqs5kC7LnGbODgqJ/pzDe9eeMicy+/xaPk7KugLz6b1EqK4V9PreaNz
         naNouvK442irLXC4hvQGzaCJNoNgoJsqHbdiGr8OKUebgQFA6gVLuAGfqxu5+Ypzts/u
         ttG60P7dAN5JfDGL73/N2iOEFJcASuJoqI1wzffQ5OBYPsj/BncerPQBsf8hU2bSS4YJ
         lr0w==
X-Forwarded-Encrypted: i=1; AKwUvBwm1YZl5Pe4ceWiY2MnxQy9TpFMBsvfcafbLsDcMRs88cewdawkq0y2PQSVj0TtzlYmke3rvzIBrpZYjcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZHf+3BZ6/ZzJnOKD4JkgYMG5kUlHJEhMyDUZh0IQMLC1C/YeW
	pt5WbkLr4E6QIYyPBOispAqHwYYce7eyeDGcOkKYo5E6OErO2y3ON0pZR0Cdl5DuIQ0Qsmtvpf3
	+g11mDGrPDg==
X-Received: from dyblj29.prod.google.com ([2002:a05:7301:111d:b0:36c:9ca8:5abe])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7306:b0:369:38e3:5363
 with SMTP id 5a478bee46e88-36a4234586bmr23137344eec.7.1793825984405; Wed, 04
 Nov 2026 12:59:44 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:02 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-13-irogers@google.com>
Subject: [PATCH v9 12/19] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In dsos__findnew_id(), try finding the DSO under the read lock first and
only acquire the write lock when a new DSO must be inserted or an
existing DSO needs its ID updated (checked via dso__needs_improve_id()).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c  | 16 +++++++++++++++-
 tools/perf/util/dso.h  |  1 +
 tools/perf/util/dsos.c | 10 ++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index f0e02062c09c..4dc518f7cb7d 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1685,6 +1685,18 @@ const struct dso_id dso_id_empty = {
 	}
 };
 
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id)
+{
+	const struct dso_id *dso_id = dso__id_const(dso);
+
+	if (!id)
+		return false;
+
+	return (id->mmap2_valid && !dso_id->mmap2_valid) ||
+	       (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) ||
+	       (build_id__is_defined(&id->build_id) && !build_id__is_defined(&dso_id->build_id));
+}
+
 void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1692,6 +1704,8 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 	bool changed = false;
 
 	/* dsos write lock held by caller. */
+	if (!id)
+		return;
 
 	if (id->mmap2_valid && !dso_id->mmap2_valid) {
 		dso_id->maj = id->maj;
@@ -1715,7 +1729,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
-	if (a == &dso_id_empty || b == &dso_id_empty) {
+	if (!a || !b || a == &dso_id_empty || b == &dso_id_empty) {
 		/* There is no valid data to compare so the comparison always returns identical. */
 		return 0;
 	}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 9e38b3b69e9b..df1748763d95 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -802,6 +802,7 @@ void dso__delete(struct dso *dso);
 int dso__cmp_id(struct dso *a, struct dso *b);
 void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated);
 void dso__set_long_name(struct dso *dso, const char *name, bool name_allocated);
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id);
 void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 
 int dso__name_len(const struct dso *dso);
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index fbbf98c4ccae..1b3f8b84ed30 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -349,6 +349,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
 {
 	struct dso *dso;
+
+	down_read(&dsos->lock);
+	dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/false);
+	if (dso && !dso__needs_improve_id(dso, id)) {
+		up_read(&dsos->lock);
+		return dso;
+	}
+	up_read(&dsos->lock);
+	dso__put(dso);
+
 	down_write(&dsos->lock);
 	dso = __dsos__findnew_id(dsos, name, id);
 	up_write(&dsos->lock);
-- 
2.56.0.455.g6c5a503b38-goog


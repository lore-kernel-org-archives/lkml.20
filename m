Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602714;
	b=KsVwsKIdB2pxXY1Khg60eqiAL2Db0m1Woif/hUC6pHvKJruD/27wT/O0tHgPWrwCnMYY
	 No8RNIrIK/6fH3aclRgYZVqRYjQzAMkv1tDUh/B8obRiD4aj6N4Skkc1AgEXGSwKnkujO
	 9JLGy0GD+iLl0avGaCjBkIoAhNim1e9yDM1up339SAnaRTlWipChujlBhBZEBfbO/Jswc
	 SMphHgDmGl6PsTKgBWE1hVZ2pkwfgXT9l3B1PIdMYHI4ixaRmfNvgnmQB9a9TiCLHLwKn
	 sdYtLZIFms5U9K/zrXZK2GwxNXWmsJrdRDkpIhmz13nqYy1hsS+xPeiN022uYX/7Gbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
	b=ftFHTt8ClWy7yeiqJ78ytz+yOvTDCmXp7erDFAgVGqCE1j6lWx4jsrAEA8w7UpsAHUMF
	 nTzVy6yDZ/tKyKfnBrBtG6rFofofHW2yt6zDBK4CZStUM/HsyNDaqr+V06O0Ze55GENzp
	 NEmz+kDiwXl5aYxGDiNUgqADktDpTJkZrIjl7UOwRM26wSDKI+xLG96cVEe6JVYFWQ3VY
	 GeWKMFYyRnIKPE0MWqiDywA7ifEfhQznpt82CxgenchqsevL1bCCu13MhA5EGECHZGEXy
	 2W6rCSKqv3fvE6Mv7IGIUARvPgR403PMfEMohdMySC3qUhSutNFmdMTkbbXw+7J3qUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sctevxHx;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647C606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1647C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sctevxHx
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so1343481c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602713; x=1793207513; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=sctevxHxYfUdJZUvVaAEMMcW8BewUvn6OU06KSRogcTl6nJZQquGxAd08i5Ht4Sdpt
         hBLSKQFup9dIpeOsrEixSVU9UOq/ni0Y5hMHYewpzrywkduNV/ayxgeHTANzh+0CaQGd
         DlI7XoUe/QgeMIdqmo9DiQDyRobmhg2gm6H2Wwoy0rqqeo+c0D/sICA0KwbaNsiwoNBh
         44FUkaMSw0Ti9eNB+ZWWlx1CUBsvvWtzyC0EY0d+5j9Jj5lzn+2ols6YnRV4yGjOXWCT
         jqtgAv6PKtvHEMVIr9enP7GCnbwZkdevCaGgRGPnCWFtYGsXSSjqw5215XRhiLHroZNA
         vmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602713; x=1793207513;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=l6H5+/Ab3DejIzWHGSiQ670b3Gkor+7VLjoxoL+r6rQ1lnB6+rYMLN0YWv9qHVifxi
         4dqi8DcZQ8dBBALPb1HXei4t2U2SLiFrhpYdUwA9hfGFMzl+wqRYHcKbqgBgy+6TiYWL
         CaYOcbPpGSQlbBgV/aenzEkuNsvEIErUTvfQKh8R+7Lz+ebEHLNCPOKD2TSJ2Gs1g5Lg
         AylhZ/8cWholR9ZCzqL0bHEJ9jTK0BZdfS5SijOO7VTFtaCMbzoxpotcCApBZWjvjBKY
         aDG2rWSZJDFPb5jtE8MUjYprHxCcSbzdBsB+m75LjH3lJ9HhUvSAYUWXxM4+v/AE2AQD
         s5uw==
X-Forwarded-Encrypted: i=1; AKwUvBzgf0qZFNMDIhPkT57xhAY7PABWZi52MTCQQfjP2wgtXi0Z7BuYVOzsKxY24JGHJefFGA61DtgdxRBgu1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEp0sp/mytL/a0x//x/tyMMwO+z2/ByRhKL8Jzq+oV//5kU3z/
	IylT6bXEA3P8D0Zpt7wk+Btmzb0Ba6MqdlNLLQHL6rnQLKyfsIBsyNvXFV55sb8sDjF1Tq/fHZI
	/SVzgC0rPUw==
X-Received: from dlbts17-n2.prod.google.com ([2002:a05:7022:b051:20b0:18f:4e29:3ddd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:32b:b0:151:f0c5:7a09
 with SMTP id a92af1059eb24-190a7c215f6mr4036164c88.43.1792602711852; Wed, 21
 Oct 2026 10:11:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:36 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-11-irogers@google.com>
Subject: [PATCH v6 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
index 9f026ccb0eb6..394960cd2004 100644
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
index 40267d3a725d..b5c8086941d5 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -348,6 +348,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
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
2.56.0.218.g1ec904b173-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142952;
	b=tcSXfNo3w+UOgce+133mw84oxruOzYJQqBrp7QKe1hoOr+pyJU5nuOZn805KJr8xevo5
	 DPXrIKrCqyfbU1axBaHzKUSz9zHn+r0B3yqNNu7922GyQAp7sxXDruq5lNDd2sxJZq5Tf
	 qjvDr+3Xsg1vwBpGLc3jjD7StcjCQifXLw642RjPaaRnOt5zomIVcr75dEau8TUJHLIF/
	 td2YfQuvAUiVyLSRrtoAwbD37IC0Sz3aZ5alIkc9kYROLdFOdJMjxBEgSwKylTAUPBKc/
	 ZfTuj1z0uDoiBO4NicHirrHtxrXXCe0gQJf9KbK5cKYxzN0zJmyb2PQYLmJV4xPDjNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KBkH5Nn6KwmCJAHfu/YWXefwXi+nPHLDKKFILwJFl2c=;
	b=ubFy6rkN2MRSlhDe8K6Jorkl5Hc/0kWKL/PAW3re0f+KHhhJRgrnfsmXUryJB8/LuKNb
	 7JTHXk/CEuiM5S5uyLu4uB6IANL675b0Kn/kldP0sIhRKwfsfjWW4rTzs9NroyjUCUXIo
	 5ZjtbOOv0inNnznn4LyuciHekFXWMuRkViWP3ppje4r7Mp5UKGEel5dFoqOCxoALiV04P
	 tsBqMM9KQCfSU3JEmTruVAa0jCWuqFzGY3CTrtWQYsVhXwgQWpdfPEyTlWh8OrMin9Jgo
	 K7ccnlysVOULCeDKfRbxQccBnv0n1XRzXV0AfaCc3IV8BqDI3HdL0NduoLn9PgGc4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BpxwMHXe;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97F0606A330
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E97F0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BpxwMHXe
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso559637eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793142951; x=1793747751; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBkH5Nn6KwmCJAHfu/YWXefwXi+nPHLDKKFILwJFl2c=;
        b=BpxwMHXeRLmT2bbcwUZCVi3qQNxU4CWIJichXCkFlK7QoiXV9n+k6tBBPdzGKGSkba
         Wn4P6xPboN9EKh8Tf2NCydLjZhAZZIyjvG4plrPXD6hwGxWna8HJXf+t8a8PENXJtwGw
         vg+uh19ib09vz3/7IFejfFAVnZvgnAoM+XLEgGMVMaIH8NolKYQK2nEaYbWWQ/EzVjRx
         tNEJTqUfdeefqCfFeXwErFb2OVvr/zXYctyWEW4SMVjnPkZVqPgNIeYYazfHo3zWCxDv
         2TErajon5qelWgbHMGdNpgq81n2b57oUb3wj7aNhimxubiqX/LpIJ15Bd11b8UKjb5cT
         nb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142951; x=1793747751;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBkH5Nn6KwmCJAHfu/YWXefwXi+nPHLDKKFILwJFl2c=;
        b=cu/iB0zg0oyn9GkSQUSTWJX9fKl49eOGMI52V+J62Wse8KAFQJ3SWFHe6uaCFaFzVz
         ppSn+gjGTe439LRtXGVSMUC2+0rl84gyBQxZuO+hg5b7SrKLX00EuqboDXtzfj7xYC8t
         J0gXPVK8KAIyVtjMiGj7lfxUQppSQc3L1UT/XZTQg50JZ38wVQNVdogCH2oSIS/rtBFP
         5z5kH0tCnwBTQPDlLd3Sfi0dGxLIn0okcN5IOOm8bM+M5AdvNgYwPfSEYPbTsPbjnnJz
         F5B6N5/8xRYptB7g31fnzSoP5mREE4DzHSxdjnHl8psg+brZEzyDgmEANDadFZnkmYsV
         +Khg==
X-Forwarded-Encrypted: i=1; AKwUvBx7pf5HGodSpW7vFosbXgdk6CECA05HboQpyRA60Ndh5vFPruaR3s7PHnCFRr9cb2dqTr4dCZL30qBv+Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI2TGxJ9/S+9SJpxXPoTLWaVZWzQ3De+gVRh1gZNeZqCZe9m9L
	WBleT23UEDNuwt2cWZ7MJBuwJtlBd20o2sabVjw1evTUey4jaFf5lmsZCXGDlQ0ze52FI5qHkj/
	kdGEBLAImAA==
X-Received: from dyki4.prod.google.com ([2002:a05:7300:7c04:b0:364:225c:dfac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:41c8:20b0:369:fa7c:aee9
 with SMTP id 5a478bee46e88-36a201686b1mr1520976eec.19.1793142950771; Tue, 27
 Oct 2026 16:15:50 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:15:07 -0700
In-Reply-To: <20261027231513.816148-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027231513.816148-14-irogers@google.com>
Subject: [PATCH v2 13/18] perf vdso: Constify dso parameter in dso__is_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, haghdoost@uber.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

dso__can_shrink_symbols(const struct dso *dso) needs to query
dso__is_vdso(dso) on a const struct dso pointer to exclude vDSO images
from symbol shrinking.

Change the parameter of dso__is_vdso() from 'struct dso *' to
'const struct dso *'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/vdso.c | 2 +-
 tools/perf/util/vdso.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..7f2dde70f3e4 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -361,7 +361,7 @@ struct dso *machine__findnew_vdso(struct machine *machine,
 	return __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
 }
 
-bool dso__is_vdso(struct dso *dso)
+bool dso__is_vdso(const struct dso *dso)
 {
 	return !strcmp(dso__short_name(dso), DSO__NAME_VDSO) ||
 	       !strcmp(dso__short_name(dso), DSO__NAME_VDSO32) ||
diff --git a/tools/perf/util/vdso.h b/tools/perf/util/vdso.h
index bc74ace603ae..b6e05bc2d9f3 100644
--- a/tools/perf/util/vdso.h
+++ b/tools/perf/util/vdso.h
@@ -19,7 +19,7 @@ static inline bool is_vdso_map(const char *filename)
 
 struct dso;
 
-bool dso__is_vdso(struct dso *dso);
+bool dso__is_vdso(const struct dso *dso);
 
 struct machine;
 struct thread;
-- 
2.56.0.313.g2479322e68-goog


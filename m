Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05696514774
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026020; cv=none; b=UHzzYpBWRpBxjK/CWN9CgyEX6I2zQ2LbV+vfQzQtaMUB7nVY1uDYoja53pRcFXhSGyPfjFgPtCcvK6/FDm5EmhXoI2CkqarfJGBODRSLWaA4M2tnqFwwnyjUNf6ZMBWBloYIusgKr+jAKF8vxupYqXJLQypZTIkjopxQe5HlmTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026020; c=relaxed/simple;
	bh=JQ/lbKA9YQdgwnnkaFloU/3l/iRjfaxtxV1VWvxRrpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H6WNM17nmAJ4H6zSztsfOEQcWavHuylLfqAYCxnJxNscw3nPHimEm391v3f7IX7tj+ttZsSelbjMctpBdGzVgW6DzwUCjpsZZKjPLjdlttkvWVAmAhlywfveZN6QRiIpXP2mpK4ADD3jcmCq+Q7wtzNHtKXrrEiK8JASBMJSGkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xtf/iLOl; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xtf/iLOl"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94a158dc8so61115585ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790026018; x=1790630818; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thyHfYtRbZkf/h8UY4YJlFOO7BMX5P6p7QG3tm7dEMQ=;
        b=Xtf/iLOlmeigqXAIsJx3Pb/dj9ZcwkdRVvJKJXrJ1wM6fol/vYXuXdAXSiNjagdZj7
         3qvEPSPs8/mVDnjBIaGEQSuOoWHMlOIGkIgYPCsaUD5p9LLiMz77ALDus/27uJ8QdMtf
         grYd6NDo+a0icxOEUgmp38XhCcbjhNpoC8AraZlO+bwc0gpydFeety5iVPp/G9L84+zd
         EqyEryHyvLF4HSWF+1Rj/kkgjP01jYsyFrhJ9K820Abod3T0inouh2GSZqJJrJBfr1HB
         S7hiH9dPQ+fj7CI2d25BJ8TTndazGuUoF6exW2Vt+nzKsCKPYJSaufmrDQmp6Si2ec4n
         h23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026018; x=1790630818;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thyHfYtRbZkf/h8UY4YJlFOO7BMX5P6p7QG3tm7dEMQ=;
        b=v1G86yiwmnwLZ1p5XrKc/jI+oq9zzK41caNJ1GGo7m1CYen9dAGA5pBgQxmjUBrGtH
         jQVX07f7GoDQzRlcKryt5MFi1xul0l3r+5W6AnKGcA+o6rn81lZmPCokKORxHAjRrgPt
         o73W/0aUsSByTHVGz2QJ/8sLdGkwGA2opyF2VjlIxDbP/MoDVTsKFKtWqNU4gGtce33d
         tknHIGS51uFhIDLIqpTIh4v3J1s6Mrav7b8E55POAutOVacJzFGlEgq1rAnHQpcq/8RC
         TVJ0ma6ONktX/74oq/D+VA/PNQZhGNEWWKOOZigCqn9WiXbS+T6iSoxSm+1Sos1PQh9L
         6o5g==
X-Forwarded-Encrypted: i=1; AKwUvBykI9r8jGdnOqgh6ew59xn4Idibtv7tbLtmF04oWVGqQIawRKyzUmM9pIQWHrwdQyvGDaXK3GBRaKfa1+o=@vger.kernel.org
X-Gm-Message-State: AFuF++kYN8ffkhWvh0PHB9ZUOAlZSNNQ8G033CCtr6IFTxojhluB5aJf
	EMO1GAPVPkv5bzsFiviuya8TuOmJdLaXw7Gjrqqqp24wacFAjw4Jnaj6sr0hUxY7j+2ty0K62mw
	y3cRZzu0QitGfhJ8kO62JEz2LJU5JHt1zPg==
X-Received: from dybsr41.prod.google.com ([2002:a05:7301:71a9:b0:339:7118:d1b6])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:234d:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2ddb1acad2dmr184944625ad.6.1790026018153;
 Mon, 21 Sep 2026 14:26:58 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:26:40 +0000
In-Reply-To: <cover.1790025465.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <c429b37092a4cb33535965163072a63adf57d8e9.1790025465.git.abhishekbapat@google.com>
Subject: [PATCH 3/4] alloc_tag: extend allocinfo_filter to support tracing queries
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their trace state.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 include/uapi/linux/alloc_tag.h | 8 ++++++--
 mm/alloc_tag.c                 | 8 ++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 069ab8341e87..e65c32afceee 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -38,7 +38,8 @@ struct allocinfo_counter {
 	__u64 bytes;
 	__u64 calls;
 	__u8 accurate;
-	__u8 pad[7];
+	__u8 trace_on;
+	__u8 pad[6];
 } __attribute__((aligned(8)));
 
 struct allocinfo_tag_data {
@@ -54,7 +55,8 @@ enum {
 	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
-	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
+	ALLOCINFO_FILTER_TRACE_ON,
+	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_TRACE_ON
 };
 
 #define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
@@ -64,6 +66,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
+#define ALLOCINFO_FILTER_MASK_TRACE_ON		(1 << ALLOCINFO_FILTER_TRACE_ON)
 
 #define ALLOCINFO_FILTER_MASKS \
 	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
@@ -75,6 +78,7 @@ struct allocinfo_filter {
 	__u64 max_size;
 	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
 	__u64 inaccurate;
+	__u64 tracing;
 };
 
 struct allocinfo_get_at {
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index fb179321a2a1..50632b627d92 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -251,6 +251,7 @@ static void allocinfo_to_params(struct codetag *ct,
 	data->counter.bytes = counters->bytes;
 	data->counter.calls = counters->calls;
 	data->counter.accurate = !alloc_tag_is_inaccurate(ct_to_alloc_tag(ct));
+	data->counter.trace_on = alloc_tag_is_traced(ct_to_alloc_tag(ct));
 }
 
 /*
@@ -324,6 +325,13 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			return false;
 	}
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_TRACE_ON) {
+		bool tracing = alloc_tag_is_traced(ct_to_alloc_tag(ct));
+
+		if (tracing != !!(filter->tracing))
+			return false;
+	}
+
 	return true;
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog


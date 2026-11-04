Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819029;
	b=4/yrsmbWZja3rBeadJT0QSA5eyW3XaqwtqnvY7yS7Z2RqOnc5u8dTDtX4vbC+2I62ZS8
	 W1PcDsBwOvUJvUI2vLFuUvR5t5Ek6WgOOp8ru6PtQnqWSraPSx5UIF/JJqQSgd6MZsWNw
	 tomt9GT/y2dXelAUzJvz+oljNGZKiT8EvWKUwLgyTcyNiOy5yBKkniWExsoTOtBqbw8pJ
	 hx9N24SIeRc39aINr4vMCNmxncHW8P+YW51ho3vL8MT/jGRgPH94cq2xG2EuR3IN7zEUR
	 11A2lG+2GNYqQ5u6K8ZRj0wFyTCOf4fB9DfELKecYhmeOzWqjuiKmXf5yB7G6c2+Wkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=R1wTzVdxrTRC/qBh+6d+SrZjPquJu2n+wXysktuAQQw=;
	b=zGwHBhSczZBMQKGszBkFHPBBwXAAfHHpJn+Zt/ntZWwqThHyx6zoNGzeyKLI9XcS3ZHE
	 zNcMgRpvw5SuLOitcYr5NGB7jY86YNij67wV5ZtWVuGGJwiQ2Htw2ImG/Q0TKXRkTUn33
	 SQb6Ukiavio+70jkAAd4GAbQirtkHrosKd4WxgB3lBxeu/ObZXdXdXEBGClO4qM5jgzQs
	 WYvWFW0FPY+cVt9ykI2OSZBFOvJ3duOuNvmOzw8Cyfrlon9BwbjyIJd2VdBQS8/ArgVKN
	 fh9so8gjmtwblyfoX5okYEBew4FX9rVDfJAdBzfoMsJdg7Mu5gq6ZtcAmPWFqxLnbLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="dWK/O2e/";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED6606A33C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85ED6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWK/O2e/
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso693731eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793819029; x=1794423829; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1wTzVdxrTRC/qBh+6d+SrZjPquJu2n+wXysktuAQQw=;
        b=dWK/O2e/82P/RAsHXA6dG631NPInpH1FjQQ4OcoH9CRL/fm3tM9ZEpuY4FED5ziGs0
         kBxD4FuZLOufilZQzq3Lb+ujkuiUpJZyWas0bEm8ZQS0uTLv4vyoh3lT3Mte5+P72nde
         +1HhdVNz4btg+oLY/CxSWwQFFOAFXPSfnFg+/amp+CT85abPXzSsYQetTbKPsqwH8YbM
         VrvtN4LmV6BpHdlRokPPjt/dWTo2bShDTWmEfdYSQebFl2/NXnKhd8Cud3p9o7iw2AgI
         v31HY9ftqTCD5OareFZI1s6hxqBygv5Ho29Z5PURh98n1OsAJtL+HzEQ2/VlBpwSqpsK
         PdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819029; x=1794423829;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1wTzVdxrTRC/qBh+6d+SrZjPquJu2n+wXysktuAQQw=;
        b=2ith8ya2ssFjesoSEELIspplDZdosGPHXrigzOpNq5T/VE5CLbugDCN0mL9EvMQNiq
         9YX/4LarbLgjm7UyhrZbTPASUXux8eYQJtfsYNADNjQL2K4g92E+HjzhY5pwWKumYgOi
         rxbmVa2fPXRicJ6l+JPqzJDfdj3d30I07XhHQFBJ6V8J3RgYaTwmtemAvXGePMGs9tau
         Cv6W4Hpr6UcACwUduo2xCtaOAgVkuIBMZObEuCnzO8OPOXVj30kaQ8PyK46Pq0XgXT/5
         2UwP4HExrOmDD51baVNxK7lG9IJgLnwHWa5DfD5OTmYADkd5ujNisSj5RA4qztvEPqiB
         s7ZQ==
X-Gm-Message-State: APuU4Z9zNOsawYEwZXqWVnxNZ+EaCjwT1GJKPvzmC1y7xUJ00HvJGlCh
	UGEIAy8H/S8THklgz6KVcPe2dLDsmEN4lg3/dX7iI+HKpCx0lZ06/tcOBbNOO5g21o3MiDMw51d
	Ah+dIenRra6uizQw0Pp/uSxsrpfS50ho/JA==
X-Received: from dlbsv9.prod.google.com ([2002:a05:7022:3a09:b0:1ab:fb55:f657])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr32740055c88.47.1793819028398;
 Wed, 04 Nov 2026 11:03:48 -0800 (PST)
Date: Wed,  4 Nov 2026 19:03:39 +0000
In-Reply-To: <cover.1793818636.git.abhishekbapat@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1793818636.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <1cb54b7e6ffe2e7a0890815c3072d8a3819b48d9.1793818636.git.abhishekbapat@google.com>
Subject: [PATCH v5 4/5] alloc_tag: Extend allocinfo_filter to support tracing queries
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their trace state.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Hao Ge <hao.ge@linux.dev>
---
 include/uapi/linux/alloc_tag.h | 8 ++++++--
 mm/alloc_tag.c                 | 8 ++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 2fc843bb06bc..ca0779051cf4 100644
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
@@ -64,11 +66,13 @@ enum {
 #define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
+#define ALLOCINFO_FILTER_MASK_TRACE_ON		(1 << ALLOCINFO_FILTER_TRACE_ON)
 
 #define ALLOCINFO_FILTER_MASKS \
 	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
 
 #define ALLOCINFO_FILTER_FLAG_INACCURATE	(1ULL << 0)
+#define ALLOCINFO_FILTER_FLAG_TRACE_ON		(1ULL << 1)
 
 struct allocinfo_filter {
 	__u64 mask; /* bitmask of the filter fields used */
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 504c1a85050d..e9b70268eacb 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -250,6 +250,7 @@ static void allocinfo_to_params(struct codetag *ct,
 	data->counter.bytes = counters->bytes;
 	data->counter.calls = counters->calls;
 	data->counter.accurate = !alloc_tag_is_inaccurate(ct_to_alloc_tag(ct));
+	data->counter.trace_on = alloc_tag_is_traced(ct_to_alloc_tag(ct));
 }
 
 /*
@@ -323,6 +324,13 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			return false;
 	}
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_TRACE_ON) {
+		bool tracing = alloc_tag_is_traced(ct_to_alloc_tag(ct));
+
+		if (tracing != !!(filter->flags & ALLOCINFO_FILTER_FLAG_TRACE_ON))
+			return false;
+	}
+
 	return true;
 }
 
-- 
2.56.0.506.g506a7eabc5-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690712;
	b=zhw/gM8+Q3Jeq12+IaM7a/lcPeerzR44wgfzO6nL4P6NRt/htzEhv62DJz8fLICsf+mx
	 7CRt3//g3DdLMZSlNfMTaY7oxaaWcj2fd+n+oOb47ont3QG7SrhhOu7r+Vf65YRkCmNTZ
	 QlU2sJwyddf9t9lEsibTGXWS6fGJarAJ3DrYDb94t3aLMYnxHo+Nl64sqzcpJ1Gt7JM+n
	 dtIZqif8WG59rzDt/hz9QrPr3UWP0Tb0TJ/jSdWgfM3Eufa3Zb7Ydl8aWeg1u41Mz5Ezv
	 Oo0HrVcaXwCGA/vtD2lT4U6FWFW4YKF+4b57eNnKc7/RvBe3oEtb19EUwb24uEKC0gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=X6SRqz0wu3RKsaKxsc5vvLTus3kwMNmtPQXe2gI16No=;
	b=aJSdoe6kMUCzK3hWUkPSQVPGq4my0xraKceGToxANhM3n0NWBmLC8KoLu+UJO30s8xdF
	 0+7jbBPhKgTznNM+0b/EpbafLx7HAecKDyF2MrMqEj42F8Bdj06JPYjM65qKSpEA6FdZ9
	 2TlpzSPVEmFruaVXwVMl6y9K1JP6/3Ya6xkGiRWnt/S4h6nZT4oC6ROB6rpDst8sbO9QC
	 yXaYW7i+7NC5Sh3jljWzw7kkSiLescGnkHeYH9P/1tM4jvhAvxjJhTqZR5KedDAmC4kih
	 45ULX6MNKaPAvROj+L0uiDoSGgb7Ao95WCllY+7SPE/LEm8Q7u8jHodYYnUMg60HEYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vMcEls3K;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBDB606F1D1
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBDB606F1D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vMcEls3K
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso61800eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792690711; x=1793295511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6SRqz0wu3RKsaKxsc5vvLTus3kwMNmtPQXe2gI16No=;
        b=vMcEls3KkdQl4MisgH10Y2B2yXEL0Buk3wltxuNXS2dHtqn76qfXwfjtBT4yn9nUWr
         7/tCsAf8Pw2v7ynKkzHTBqPvd2Wlhgpi/gTE/ZfADthxh13XlZgzoOL6sZld178gW6S8
         hHzMLH7F0NplQJeMGHQMMpsOnu2LnPe7KEmaHr7ZgNrVea4WQbVTAYKg7W09Ow6UJRuO
         OqBqn7D2/3pcIbMd+GN11MFCmjNFRtfPI7uAj0s3BGnre9pmpFJkcy2jiyBkQrbotGWf
         fapVjV6xIRT5pbOlKeOqJhNSLdVnhhziRmGGtK5p15eCTJlQN05159lYNXufeY6zgvGP
         JDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690711; x=1793295511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6SRqz0wu3RKsaKxsc5vvLTus3kwMNmtPQXe2gI16No=;
        b=tZ6FXZXHV3LhFhNw+66yYSW8t4RlCX+FAQAocJLU3shcJcfBJjNHlYSAzFYwHlWNRb
         bNdKpEPH5edGaLIJQlLjibDR5MXK4sw6ng3xFd8TAp31F0wdwUvDR7bQ9Q9W9TKZjJMX
         ovpoStCWeq1pVFB2/dEFnnAHg5Xl7SY/fcMm7Hs9r3NevyWEc+YwgV7LEoLH7Dz/eI2s
         jf3Srqed+0CkV7qhKGg9FQYMUa1JaTkREVY8zT218y1F94Mjs8b10si/qJKuqPHG0edh
         2EXwU06BQ9I+ZgSBDB4GEOIyJur9UCQOxY2gzccDLXb6HhE+FpjpNlYi4QOcsK3mZ5Uo
         RiMw==
X-Gm-Message-State: AFq9FYIT9Fx/Wbn5Bl2HI9fsSN0C8kZXEwhPAZLsCvxLU2c/P1H5Njua
	f+imnJf6Vweqg0AcJNvEnASVVp+WXyzjuE8vcKePx/mixEubmXQsWOF7Zk9uWjMIXa0JSoHfOJF
	4Gse/HAYv+kR4tJB4gPkzaRNHHP1GdxeY5Q==
X-Received: from dybnq2.prod.google.com ([2002:a05:7300:e502:b0:366:233a:49c7])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:6c85:b0:35f:5591:e40c with SMTP id 5a478bee46e88-3674de4ca70mr11857901eec.22.1792690710622;
 Thu, 22 Oct 2026 10:38:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:38:23 +0000
In-Reply-To: <cover.1792690544.git.abhishekbapat@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1792690544.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <46a82e8f6e901531704ecf14c714e0b83d4e6f36.1792690544.git.abhishekbapat@google.com>
Subject: [PATCH v4 4/4] alloc_tag: Add a test for trace state toggle and filtering
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Following the introduction of the ALLOCINFO_IOC_TOGGLE_TRACE IOCTL and
ALLOCINFO_FILTER_MASK_TRACE_ON filters for selective memory allocation
tracing, update the kselftests to validate this behaviour.

Introduce `test_tracing_toggle_and_filter`, which validates the
architecture by:
1. Dynamically flipping trace execution state for a designated allocation.
2. Query the same tag again, and check that the returned tag reports the
   new state in its `trace_on` field.
3. Restore the tag's original trace state, also on failure, so the test
   does not leave tracing changed on the system.

The test uses `dup_mm()` function name with the function filter in the
IOCTL to run the above steps. If the `dup_mm()` tag is not found, the
test is skipped.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 .../alloc_tag/allocinfo_ioctl_test.c          | 113 +++++++++++++++++-
 1 file changed, 110 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
index 74fd64b2370c..eb52ca1a1dc4 100644
--- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
+++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
@@ -48,6 +48,11 @@ static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_tag_data *pa
 	return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
 }
 
+static inline int __allocinfo_toggle_trace(int dev_fd, struct allocinfo_toggle_traces *params)
+{
+	return ioctl(dev_fd, ALLOCINFO_IOC_TOGGLE_TRACE, params);
+}
+
 static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
 			const struct allocinfo_tag_data *tag_data,
 			bool match_bytes, bool match_calls, bool match_lineno,
@@ -289,6 +294,8 @@ static int run_filter_test(const struct allocinfo_filter *filter)
 	return ret;
 }
 
+static const char *target_test_function = "dup_mm";
+
 static int test_filename_filter(void)
 {
 	struct allocinfo_filter filter;
@@ -304,11 +311,10 @@ static int test_filename_filter(void)
 static int test_function_filter(void)
 {
 	struct allocinfo_filter filter;
-	const char *target_function = "dup_mm";
 
 	memset(&filter, 0, sizeof(filter));
 	filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
-	strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
+	strncpy(filter.fields.function, target_test_function, ALLOCINFO_STR_SIZE);
 
 	return run_filter_test(&filter);
 }
@@ -514,11 +520,106 @@ static int test_lineno_filter(void)
 	return ret;
 }
 
+static enum ioctl_ret toggle_trace(struct allocinfo_tag *target_tag,
+				   bool enable)
+{
+	int fd;
+	struct allocinfo_toggle_traces toggle_params;
+
+	fd = open(ALLOCINFO_PROC, O_RDONLY);
+	if (fd < 0) {
+		ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n", strerror(errno));
+		return IOCTL_FAILURE;
+	}
+
+	memset(&toggle_params, 0, sizeof(toggle_params));
+	toggle_params.filter.mask = ALLOCINFO_FILTER_MASK_MODNAME | ALLOCINFO_FILTER_MASK_FUNCTION |
+				    ALLOCINFO_FILTER_MASK_FILENAME | ALLOCINFO_FILTER_MASK_LINENO;
+	toggle_params.filter.fields = *target_tag;
+	toggle_params.enable = enable;
+
+	if (__allocinfo_toggle_trace(fd, &toggle_params)) {
+		close(fd);
+		return IOCTL_FAILURE;
+	}
+
+	close(fd);
+	return IOCTL_SUCCESS;
+}
+
+static int test_tracing_toggle_and_filter(void)
+{
+	struct allocinfo_filter filter = { 0 };
+	enum ioctl_ret ioctl_status;
+	int ret = KSFT_PASS;
+	bool initial_state, target_state;
+	struct allocinfo_tag target_tag;
+	struct allocinfo_tag_data_vec *tags = calloc(1, sizeof(*tags));
+
+	if (!tags) {
+		ksft_print_msg("Memory allocation failed.\n");
+		return KSFT_FAIL;
+	}
+
+	filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
+	strncpy(filter.fields.function, target_test_function, ALLOCINFO_STR_SIZE);
+
+	ioctl_status = get_filtered_ioctl_entries(tags, &filter, 0);
+	if (ioctl_status != IOCTL_SUCCESS || tags->count == 0) {
+		ksft_print_msg("Could not retrieve IOCTL entries for %s\n", target_test_function);
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+
+	target_tag = tags->tag[0].tag;
+	initial_state = tags->tag[0].counter.trace_on;
+	target_state = !initial_state;
+
+	ioctl_status = toggle_trace(&target_tag, target_state);
+	if (ioctl_status != IOCTL_SUCCESS) {
+		ksft_print_msg("Failed to toggle tracing\n");
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+
+	filter.mask |= ALLOCINFO_FILTER_MASK_TRACE_ON;
+	filter.tracing = target_state;
+
+	ioctl_status = get_filtered_ioctl_entries(tags, &filter, 0);
+	if (ioctl_status != IOCTL_SUCCESS) {
+		ksft_print_msg("Error retrieving IOCTL entries with trace filter.\n");
+		ret = KSFT_FAIL;
+		goto exit_revert;
+	}
+
+	if (tags->count != 1) {
+		ksft_print_msg("Expected exactly 1 entry, but got %llu\n", tags->count);
+		ret = KSFT_FAIL;
+		goto exit_revert;
+	}
+
+	if (tags->tag[0].counter.trace_on != target_state) {
+		ksft_print_msg("Entry returned by trace filter does not match target state\n");
+		ret = KSFT_FAIL;
+	}
+
+exit_revert:
+	ioctl_status = toggle_trace(&target_tag, initial_state);
+	if (ioctl_status != IOCTL_SUCCESS) {
+		ksft_print_msg("Failed to revert tracing to initial state\n");
+		ret = KSFT_FAIL;
+	}
+
+exit:
+	free(tags);
+	return ret;
+}
+
 int main(int argc, char *argv[])
 {
 	int ret;
 
-	ksft_set_plan(4);
+	ksft_set_plan(5);
 
 	ret = test_filename_filter();
 	if (ret == KSFT_SKIP)
@@ -526,6 +627,12 @@ int main(int argc, char *argv[])
 	else
 		ksft_test_result(ret == KSFT_PASS, "test_filename_filter\n");
 
+	ret = test_tracing_toggle_and_filter();
+	if (ret == KSFT_SKIP)
+		ksft_test_result_skip("Skipping test_tracing_toggle_and_filter\n");
+	else
+		ksft_test_result(ret == KSFT_PASS, "test_tracing_toggle_and_filter\n");
+
 	ret = test_function_filter();
 	if (ret == KSFT_SKIP)
 		ksft_test_result_skip("Skipping test_function_filter\n");
-- 
2.56.0.257.gf7497c7d27-goog


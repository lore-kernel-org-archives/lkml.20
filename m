Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138C390C9F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088447; cv=none; b=WSHTuV2cxxTTLCo1BaNuwcKZozJAT5ISWY0aQbwHKiLrzWqAPsGirRcP0TeOByj/taMC0pUT3IpdnIABColdL24MCTsjjiDSUBRHGORAZBKXADSIp3sS+waP1dEMCKssov+WDmGd7mOW8hnN2Tn2yGji89Ruth1/Q++r85+Ee9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088447; c=relaxed/simple;
	bh=Qflv37Sa7wWaxNeJAHcQTneqg58I96O+afHtd4nx7d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XxyyVDirTCG+4Hgd5uKBqd4THXvXHSCJrj70M2mUiSbGUwI9VDPAsKIa8LAsqWyMpoUp8tYs6NWDnOWxCtYU+OsNJfBIF90GMXfijfMg7F8R07uVwUESPs/BaQZkqH+MY2AI55sirZd9I8d+LXtP1gAgLS8iiABWVa8Aelw4Qb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RklOo8MD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RklOo8MD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso29014845e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790088443; x=1790693243; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rJTKtke9NrTPXWw8MFISVlZTxlOkqHMtrx2BCGnmWu4=;
        b=RklOo8MD4h6KgjrFCimiuNqKb73hIHpBUY9e1/uSGVDUF/WJDaYfnv1tEg9pMS+qU2
         Y+/u94hr6hPvLQcMlhSa+3yPD4pAUk6U7e0Y7G+tCozXG6hIELtssQHmM66zSKEQgABn
         OGwnWhnWwTQ9Bno5arv3Bq3TpYjgyZtMOvlqv5vavHGBsxY47ZAIBEDxJW3T0HHqNWAK
         5iT7s2biy4fONZTf8CP7rvjZ3pqHWes0PNZxJfc79g14EllWb4P7WlnV1WONSU8rxI6j
         hZ+Qv7Oog/sASB/ONyMbP7uZ6aHZquSvsTbrSO6UG8A6515xz5ZtFzodECg95SAryKCS
         f9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088443; x=1790693243;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rJTKtke9NrTPXWw8MFISVlZTxlOkqHMtrx2BCGnmWu4=;
        b=J//k1J3gQZGFLpfOrTZBbrtJEBsAE1CY7bb2WGWYfw+BfQ0ak/eq7YpX2PIGijbDhj
         VSL0bQ4NHEdumU1RmWKyu77gZwQ4wLUBmOn0eMnuKY7ZSteKaJFAcTY7iMMmI9OJER73
         IyHOu6FJgJW/Kd+2FDiK7l5+nJfAMRnMj6u0wTn6CGuW3Jlomjw/mFbt5r3snC7q3ElZ
         W7NUCBJO0wpI+qNajywSxHeyLmIgyHyErILdFLi+tQa8u0xOxi7j8psZSu/pD8ZqA2Zp
         6z9m4SVCsKG+Jgp+XKzILflu33R1rRbI8qwaC+ijFyrf7aWJ5ldbrCL0DJAiX+bw85UB
         uriQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFgk8PfMTUrbTHWTfo43Y1fqhXkSdDN0yc+ya9BjR0J7LzP95Laf9RrIxkKTZfYWrZa/PmV03pRJeNKf4=@vger.kernel.org
X-Gm-Message-State: AFuF++m++N97LjJ1VZJD6HrrUWMpMgGBJ81j8Vw2DEcnP1vXbQu9wcuQ
	ui1aiSnm+8+XQJjWc0PqJiDIU9sY8fEb+KgFgOUpc4gNZaPGWhImfxV6lpmsRQOpgjc=
X-Gm-Gg: AYBFou39UdEvMf/GkY0bui/P66/LP0daZSBauIhP+hQRLm1iRLPLiuhecy4ludzbpej
	cEMLirD7hyAYEiIesS90uBBLPzHt8R2j2sfUe4tGz8IWMSfWfS13WeSWwx+QM6iwtvU/pMfChy6
	ek7fEjkB5yj9oEaY3P1tXMvEMSGcNPbX3ob6ghHcqOOxh9svk6BIW6HeMFOL60Igbarbopgmnqp
	WAuSPhvtzG79xvpNJNFM4TFANmQeSkdDIkM+r+FOfIiKL6j6ewB+HX9q86LWqbp+bU2gkBvrRzr
	j/4pR6owBB7rr9lZJ7WoyqVSP1ye7WNOrbhqrcTRG+s8pCMxz6jZFFX4cAJg6icnsN5yvdJ1QnN
	OCFfa+AGE0C2C4Nnf5vopNjbFYOwpP+KJTyPv5MTt3oxlexwuUGSeQenKL5XhWqYOeO1MPrJUwj
	0WhXzgyBaGI9uDM/RilPExxUeDiNfzu6n3YbZp0NO99BbZM+gvXD3tUQLWteyvA2chDiQnzS5rI
	Q==
X-Received: by 2002:a05:600c:3e06:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49fc56daf07mr212651135e9.14.1790088443571;
        Tue, 22 Sep 2026 07:47:23 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad53c7dsm51322455e9.12.2026.09.22.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:47:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 22 Sep 2026 15:47:01 +0100
Subject: [PATCH] perf buildid-list: Fix empty output for AUX data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-james-perf-aux-archive-v1-1-0ede8ed764ff@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOSUsmoC/yXMQQ6CQAxG4auQrm0yjhMRr2JcjPVHSiKSVggJ4
 e6OuvwW763kMIXTuVrJMKvrayjY7yqSLg8PsN6LKYZ4DE2M3OcnnEdYy3laOJt0OoOThCB1kw7
 pVFOJR0Ory298uf7t062HvL832rYPqr6tK3oAAAA=
X-Change-ID: 20260922-james-perf-aux-archive-4c00c7943487
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

perf record enables buildid_all for AUX trace because buildid-list does
not decode AUX data to identify hit DSOs. Historically those build IDs
were available in HEADER_BUILD_ID, and buildid-list disabled hit
filtering when HEADER_AUXTRACE was present.

Build IDs are now carried by MMAP2 records by default and the build-ID
header is omitted. perf_session__list_build_ids() forces with_hits when
the header is absent so that it processes the event stream. That also
filters the result to DSOs referenced by ordinary samples. AUX data has
no such samples unless the trace is decoded, so every DSO is dropped and
perf archive reports that no build IDs were found.

Process the event stream whenever the build-ID header is absent,
allowing MMAP2 build IDs to be read, but do not enable hit filtering for
AUX data, this ensures that all build-IDs are included for AUX data.

Fixes: 6bd89ae7d147 ("perf record: Make sure to update build-ID cache")
Assisted-by: Codex:GPT-5.6-Sol
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/builtin-buildid-list.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/builtin-buildid-list.c b/tools/perf/builtin-buildid-list.c
index e0881b0ac38f..5555f5dcefe4 100644
--- a/tools/perf/builtin-buildid-list.c
+++ b/tools/perf/builtin-buildid-list.c
@@ -87,6 +87,7 @@ static bool dso__skip_buildid(struct dso *dso, int with_hits)
 static int perf_session__list_build_ids(bool force, bool with_hits)
 {
 	struct perf_session *session;
+	bool has_auxtrace, has_build_id;
 	struct perf_data data = {
 		.path  = input_name,
 		.mode  = PERF_DATA_MODE_READ,
@@ -118,11 +119,19 @@ static int perf_session__list_build_ids(bool force, bool with_hits)
 	 * We take all buildids when the file contains AUX area tracing data
 	 * because we do not decode the trace because it would take too long.
 	 */
-	if (!perf_data__is_pipe(&data) &&
-	    perf_header__has_feat(&session->header, HEADER_AUXTRACE))
+	has_auxtrace = !perf_data__is_pipe(&data) &&
+		perf_header__has_feat(&session->header, HEADER_AUXTRACE);
+	has_build_id = perf_header__has_feat(&session->header, HEADER_BUILD_ID);
+
+	if (has_auxtrace)
 		with_hits = false;
 
-	if (!perf_header__has_feat(&session->header, HEADER_BUILD_ID))
+	/*
+	 * Without a build-ID header, the event stream is processed below to find
+	 * build IDs in MMAP2 records. For AUX data keep all DSOs because the trace
+	 * is not decoded and consequently none of them can be marked as hit.
+	 */
+	if (!has_build_id && !has_auxtrace)
 		with_hits = true;
 
 	if (zstd_init(&(session->zstd_data), 0) < 0)
@@ -132,7 +141,7 @@ static int perf_session__list_build_ids(bool force, bool with_hits)
 	 * in pipe-mode, the only way to get the buildids is to parse
 	 * the record stream. Buildids are stored as RECORD_HEADER_BUILD_ID
 	 */
-	if (with_hits || perf_data__is_pipe(&data))
+	if (with_hits || perf_data__is_pipe(&data) || !has_build_id)
 		perf_session__process_events(session);
 
 	perf_session__fprintf_dsos_buildid(session, stdout, dso__skip_buildid, with_hits);

---
base-commit: edd8a9fe2eca009599e013a29c421c7a6b5ad1b9
change-id: 20260922-james-perf-aux-archive-4c00c7943487

Best regards,
--  
James Clark <james.clark@linaro.org>


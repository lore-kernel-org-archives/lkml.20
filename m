Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485756;
	b=A2BqkiMIpsgHl3bYq592SZfLpgWOqMOPCTFt4h1u+CyVtNnuZewWBURUuATDJJBEDMx1
	 1eSjpxKPEyLUndxG9Fno95j9hZMsaOzENO+lidNmVnVCEnONnuRS8B/EVIzzUrPxezJvQ
	 ca8178MwR7cd2UKKwFh+ES1nmm/cz8rO0VTM2hvKoPkyIylOJgGbJOOAmUTPM0ZWFQ7Cy
	 43A86tNejJwSyPhw1ZvtJXcflJHF5cRm2rrKtNlmWWu3iNkOByYhHbvbCzBb28zZBdtHE
	 VT6w/8HUu2N/9caBZWUt9UDQbd92RO6gQJpmOogMUHxUvsG3v5OHIliWQntf451EXFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B5dwS+JSg4KVRmJk8D3bUXhM4YDMd6Zv8kscnFZDGw0=;
	b=BSIpt+7QgNjOPO9jYZIY3g1vmU5xmkWXSZE5Nte4zC+RBzvU1Cx97AaQ4d5SHD98RP5P
	 Fy/VdNzDI0sJOjEaZImm0wp39Vvx8YmAYmfRDt+DuwDxeGcll0GC9PZRFSZDvkX6FlCUB
	 GM0KT4dXdRrE6cm1MK0FzgBljd9gVsT7VTC7WDWqRz0u+w7b3L8I6zNG9oGRD9uklGvzO
	 WxY9f6yYEp6n/4iC+HNfwG4NdcSNSb51WwDNXJixZcNSONNVmHyxr5+VsUso15JEYrrNU
	 /Xzgn6nyeu8PAkGIgqCDZodMJvpSkdN85Mo09/HpzuoxlIya0KGFNND7wkJHEehJYJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojOTqk+E;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2828606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2828606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojOTqk+E
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bb5afa736so198975eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485755; x=1795090555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5dwS+JSg4KVRmJk8D3bUXhM4YDMd6Zv8kscnFZDGw0=;
        b=ojOTqk+EuQHLzkYchUS8u1NhiDCGXK6+ZTCp8wr8E8MxxCh6KGaOgiWkpF9wEo+Aq5
         9Oycc0UkhL75g3VBdDtUpJCTnJSC1961/Ty9O1jYte/X+dRsz+xqcfSrjIcKf1ktYBSg
         yvi8ppQpABu72JEff7Nh7ulrGWgNHwO74ICgPLrmHDqi8h0LBdXi2KFgRYqOFXW+zsTV
         gKbECRsgfuHX9IZdhPZhwYHiYwByF08YDUIdizh9MpdBNl3bgqBxoDpzMEEL+JNJUxb8
         pVxAyZD40+j7XJ2C9YUzyWlSHctrH2XTkZzJb4cPoZvBn0+WviVhYPraFFQKGUBZ7rBT
         D/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485755; x=1795090555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5dwS+JSg4KVRmJk8D3bUXhM4YDMd6Zv8kscnFZDGw0=;
        b=DNz0yCDBa6pD839nL80F+E+z55mMFXbMT+/W5xyf8jKEGXnOFVhZ26TNSj7PmVX0Va
         P+a+N8PnnHYlxteSaC5+oB2RT1LKdgumZWS5T0tU7DiO4LyJopatzXjyP7PHm0NKbMF7
         VjrS1uCQEXcmeDICCaZAlFx7a/fGp2V7T9WXO7y9PZa/gg7VK/RXtAfymtalQLZzzE4+
         UDNn/PPD/DMNj0ppIXYC99pqbTU9KKtSvrjXXq30ZnTZwDeNqulZUWHyt6yp4miUeGMl
         jqZ7g0HaAAVD0ha+3YoMv9RuAMuWl3ollsAflTDpu+xgA9vSNU2FR6jvyNsvndS6im0a
         c0+A==
X-Forwarded-Encrypted: i=1; AL+hErGGQdCRBuhwCyhnqmifAJxY1uNGAuQvBGYAoMcmg/vz4QUdUXVovg1RNnVvbufLIoqpSJOB4DiZNZH0Mw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q20C+yeXbHqreUKH3VFoJJ9jPb4gu5M69QsxPgmiwLdb41bru
	6hfjzdKqccoXCe0KtgtMMJB4OmkGu5Ysu9BrzVzBEz2hP7S2JK5AW1Yl
X-Gm-Gg: AYBFou2bSkxeyUzxU0Z/3ELI186Bi+LuXKZPqSb1BU1CAX17VTZEBkK9WnapFKpOc12
	IV7gc7eoPDrRIvUxU2e6rwOezhki0mgggvDvapUqLN4dWMqqChUGOmzCwnVlRiHkA9F24f++S5e
	N9vbZpeBln9rCelYRgMUFJ4crf5QkCMkhetr+rhKnsXFlQQzA0I4NY3Nh2SOFnFIsyOhucE4MqK
	/Zbd2Lne9rvq0ZFiDsx563PgQNbQaJtD1nWLQ7Eh9E1WcEUYyt6wrlXMTI30Gger8wwsauH83tF
	k7r2Zlh0L/Jqh2GOBiujS9uN50r1N9P/Ub8WhfgbWg9u2APX3qg15TVJLU6fK2WPWjh7sHK1b0F
	Lhzy2IgXX9qLc+yX1OvKXSt8BbRACvE+j60PTT2Dn58QAjkg5Q+6SqyZsN5kUmfgKcPd6hjI1SN
	ArVwJ1qUXSaEtIAGF6rZ7TWGzE8J6C8uQR9kgrL9dTCDDVPA4N/sQ4tcMkXeTtY+hr9yaXvMN8B
	GFsvNLHtPonOiH1OLdv2vROm1uzyax1aDxZF97eBrmgl8SjudNCdmiIjbx/X0jOqUoYDnzwbXEd
	ykVHm18ypG6OqdMxA9Vg6yhH07igsGP8DrTscPa+41wEowE1LtUcwY3nrPfLrfc5z4Caxra5/6d
	6
X-Received: by 2002:a05:7300:7aa5:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-37685c76d17mr8719831eec.2.1794485754829;
        Thu, 12 Nov 2026 04:15:54 -0800 (PST)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm29740235eec.14.2026.11.12.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:15:54 -0800 (PST)
From: Wenwu Hou <hwenwur@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenwu Hou <hwenwur@gmail.com>
Subject: [PATCH v2] tracing/hwlat: Do the latency calculations in nanoseconds
Date: Thu, 12 Nov 2026 20:15:01 +0800
Message-ID: <20261112121502.2070755-1-hwenwur@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tr->max_latency is expected to hold nanoseconds: tracing_max_lat_read()
converts it with nsecs_to_usecs() to print the usecs documented in
hwlat_detector.rst, and the other latency tracers store nanoseconds there
too.

Do all the latency calculations in nanoseconds instead, and only convert
the durations to microseconds when recording the hwlat event.

Fixes: e7c15cd8a1133 ("tracing: Added hardware latency tracer")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
Tested in a 4-vCPU KVM guest; all three hwlat modes worked as expected.

Changes in v2:
- Perform the latency calculations in nanoseconds instead of converting
  only the maximum latency, as suggested by Steven Rostedt.
- Convert the durations to microseconds only when recording the hwlat event
  to preserve the existing event format.

 kernel/trace/trace_hwlat.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 65e184d800ff1..a16905ac12b0d 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -203,14 +203,12 @@ static int get_sample(void)
 	time_type start, t1, t2, last_t2;
 	s64 diff, outer_diff, total, last_total = 0;
 	u64 sample = 0;
-	u64 sample_width = READ_ONCE(hwlat_data.sample_width);
+	u64 sample_width = READ_ONCE(hwlat_data.sample_width) * NSEC_PER_USEC;
 	u64 thresh = tracing_thresh;
 	u64 outer_sample = 0;
 	int ret = -1;
 	unsigned int count = 0;
 
-	do_div(thresh, NSEC_PER_USEC); /* modifies interval value */
-
 	kdata->nmi_total_ts = 0;
 	kdata->nmi_count = 0;
 	/* Make sure NMIs see this first */
@@ -229,7 +227,7 @@ static int get_sample(void)
 
 		if (time_u64(last_t2)) {
 			/* Check the delta from outer loop (t2 to next t1) */
-			outer_diff = time_to_us(time_sub(t1, last_t2));
+			outer_diff = time_sub(t1, last_t2);
 			/* This shouldn't happen */
 			if (outer_diff < 0) {
 				hwlat_err(BANNER "time running backwards\n");
@@ -240,7 +238,7 @@ static int get_sample(void)
 		}
 		last_t2 = t2;
 
-		total = time_to_us(time_sub(t2, start)); /* sample width */
+		total = time_sub(t2, start); /* sample width */
 
 		/* Check for possible overflows */
 		if (total < last_total) {
@@ -250,7 +248,7 @@ static int get_sample(void)
 		last_total = total;
 
 		/* This checks the inner loop (t1 to t2) */
-		diff = time_to_us(time_sub(t2, t1));     /* current diff */
+		diff = time_sub(t2, t1);     /* current diff */
 
 		if (diff > thresh || outer_diff > thresh) {
 			if (!count)
@@ -286,8 +284,8 @@ static int get_sample(void)
 			do_div(kdata->nmi_total_ts, NSEC_PER_USEC);
 
 		s.seqnum = atomic64_inc_return(&hwlat_data.count);
-		s.duration = sample;
-		s.outer_duration = outer_sample;
+		s.duration = time_to_us(sample);
+		s.outer_duration = time_to_us(outer_sample);
 		s.nmi_total_ts = kdata->nmi_total_ts;
 		s.nmi_count = kdata->nmi_count;
 		s.count = count;
-- 
2.43.0


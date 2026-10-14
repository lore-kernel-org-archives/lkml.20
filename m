Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDEB531628
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999271; cv=none; b=A2yZoJke8J9/0WfDV+uCeEviW4UUWqLDPf3VeSXG9ph8kUOVjSWjLjZIyYZgZiCO+mNIP0Z3Ai53nPGeBPNXbNFC0uI1m9BPQkhYhmIYmVDZMAzWM9mQdidOpnnoKfU6Hh0RyamrP0WjAuP9ym39Of7oVbVM/O+sZMdyZG9gDVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999271; c=relaxed/simple;
	bh=fmjT0XGVfi/hdDqj1Oxl4qa2hoy7VyMk07w+tQHGCaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjXIdOx+mEjS9oXmZTZuGy3WzV6MYfeZFFDDpOGJP4hzJFn16XNxoLuS/eyY0RPu3IaBxs3mFeiAizOsmUB3JM5dhhk+CYBNx0iA1G1noQQW8Zn02+V/nV3f/XPjZQRi9IKtTgpkUyG6q4CI7Ex6ShdQ5Ek3cIw/+phsq4yMQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=cONWmHMy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="cONWmHMy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so11127245e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1791999262; x=1792604062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KX7EG5jm1y1io+uFRjUKs+8ni8glQU7BjdzPalGrl6k=;
        b=cONWmHMyNFvxTl9dudBB+omcDdg7z/45WKOwUoEmZwGaKkC9sBDDtuTS880mhZr20o
         20l3V/2Hfp/iQyOYHAQvwcoJnX+g6zFshTjVP/Hg5hJgKglHCekHkqFRjJD6gm1wnJiW
         yTgtP3/55fEzQ2lhRj08XaGccgDyVJMnP9MxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999262; x=1792604062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KX7EG5jm1y1io+uFRjUKs+8ni8glQU7BjdzPalGrl6k=;
        b=aaQSu+8gx+ULrjOCsgIp8Pcj+l02qmDHVeghDsDkE/b0MFflV6mOSkArIgnERjVUci
         l85vfEuCSAMJQ/UDnQEZEPx7vgQ04ieK94cPZgvvraWRMCBGtfrPpB+kZO0MD1Znja3P
         QEn/dHO/b3JcUtFKZ/dS4c7lh2sQIPBXj04azYsJsCiHxWGTmmDJBY4KtdP/9sZ4rxGK
         cVyAdlVwZQuNj/Qjp0gJQ3ALOwMg9GUKgc3AOXb6GM4ZxzVxLXrZs2jVQgVXcVLkUB0o
         6kJYBE4b8KTaOK3m/iNKHMw9XqBpsSQqyQa2hSevcEJP1fOiSFT27PNa702GSXSOFBvc
         EKZw==
X-Forwarded-Encrypted: i=1; AKwUvBxWZcVbnt3hgu6bkXuxmL0TWsNOffw4B5oazZTvqzYeGwuvY3SNMPVVvblfQYsnEQyo1YUzGgQUiRcublQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRIOACQij7zCk6f8qVbSkpLzmXWEQ30UEr9tcm33SGhKB92beT
	YkcipDOOmINPnEwgbs2ga38DpwrX/aZA/wi+J1MwiimvrrtrMhglVcwWixmnMQVaT6I=
X-Gm-Gg: AYBFou17TmiuZoVoCPD5+a/oqelumHpMk4h+LTkZkmrpXho430+TQY6DXckSgzUgoAb
	KAJNvgRuqm4WRO8VUQkMTEeyRLl+0x2f14Th/w+OyR1OvnX3ykRZ7XrNldmTLr/G+6LO4VKWihJ
	vjWQTRe0B+KOLyddJyAjDyQ6iv9mJcTlV17sdYuJ4IjSlHjNJjxyr32FhuAIlb/6rOaEBFaGjmK
	n7TrXTTLC9ofhtsHfnShi45YgFlssNE02RnOCTHJG9Ch2Zjl7n4RH/CgLKUenngf3oLwOSU6/CL
	L0TWQPlzLHf0iEau0ML7mrX5H5goQIFUaapEqt3XGzo39wKYS1CyfqdwwBStrPhI4RYtLKQeNSi
	voOO0pPkLxwPDMEQ0ATLgnFkz97mQ96BZdkEJmvc982A9Gw6xw54azfHplaMQXZZCuEoQcV1IV8
	dIJ1Ni56L+6X2i3JEMPPhboRMbeOa/AAFTCjFtiv57LbhmFoPP2ocHkIGk
X-Received: by 2002:a05:600c:8518:b0:4a1:7ecc:b23c with SMTP id 5b1f17b1804b1-4a18e49879dmr306176935e9.6.1791999261734;
        Wed, 14 Oct 2026 10:34:21 -0700 (PDT)
Received: from localhost ([2a00:1358:e0ce:6800::3db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993caesm11586015e9.12.2026.10.14.10.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:20 -0700 (PDT)
From: Ivan Shapovalov <intelfx@intelfx.name>
Date: Wed, 14 Oct 2026 20:34:08 +0300
Subject: [PATCH 2/4] perf: zstd: factor out zstd_init_{c,d}stream()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-perf-zstd-v1-2-9652727886fa@intelfx.name>
References: <20261014-perf-zstd-v1-0-9652727886fa@intelfx.name>
In-Reply-To: <20261014-perf-zstd-v1-0-9652727886fa@intelfx.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ivan Shapovalov <intelfx@intelfx.name>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3464; i=intelfx@intelfx.name;
 h=from:subject:message-id; bh=fmjT0XGVfi/hdDqj1Oxl4qa2hoy7VyMk07w+tQHGCaA=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0did012TXdDVVdHM2x2aGVTbFF6Mk1wO
 VdTR0xMTzd4VnUrN3dsbjduWVRuQUwzMXJMNWk5djk2NTI5Rm5nCmtHNFJvM3E3NXZ2a2JkdmRP
 MHBaR01TNEdHVEZGRmwyMzU4VzltanVCS1ZEbmh0eVllYXdNb0VNWWVEaUZJQ0oKYkx6TnlMQk9
 SUEZEMk55NTk1N252NnlQbnQ1MVAzSHhzNVhUcm03WUVkKzllZDN0UEtGT1JvYWxqejVma0Z1eg
 pmOXQ2cTJLV1V5OVU1em53UDFQT243Vm1VcjNra3djMVNkUDRBUT09Cj1xTUl1Ci0tLS0tRU5EI
 FBHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=intelfx@intelfx.name; a=openpgp;
 fpr=04DEA27EEF682F17083D892295D5D5F5A5A5E5E5

Factor out functions to manage CStream/DStream in `struct zstd_data`
for reuse across multiple zstd (de)compression entry points.

Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
 tools/perf/util/zstd.c | 82 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 30 deletions(-)

diff --git a/tools/perf/util/zstd.c b/tools/perf/util/zstd.c
index af113660d1ce0..3af8910bb87cf 100644
--- a/tools/perf/util/zstd.c
+++ b/tools/perf/util/zstd.c
@@ -14,6 +14,50 @@ int zstd_init(struct zstd_data *data, int level)
 	return 0;
 }
 
+static int zstd_init_cstream(struct zstd_data *data)
+{
+	size_t ret;
+
+	if (!data->cstream) {
+		data->cstream = ZSTD_createCStream();
+		if (data->cstream == NULL) {
+			pr_err("zstd: failed to create compression stream\n");
+			return -1;
+		}
+
+		ret = ZSTD_initCStream(data->cstream, data->comp_level);
+		if (ZSTD_isError(ret)) {
+			pr_err("zstd: failed to initialize compression stream: %s\n",
+				ZSTD_getErrorName(ret));
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+static int zstd_init_dstream(struct zstd_data *data)
+{
+	size_t ret;
+
+	if (!data->dstream) {
+		data->dstream = ZSTD_createDStream();
+		if (data->dstream == NULL) {
+			pr_err("zstd: failed to create decompression stream\n");
+			return -1;
+		}
+
+		ret = ZSTD_initDStream(data->dstream);
+		if (ZSTD_isError(ret)) {
+			pr_err("zstd: failed to initialize decompression stream: %s\n",
+				ZSTD_getErrorName(ret));
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
 int zstd_fini(struct zstd_data *data)
 {
 	if (data->dstream) {
@@ -34,26 +78,14 @@ ssize_t zstd_compress_stream_to_records(struct zstd_data *data, void *dst, size_
 				       ssize_t process_header(void *record, size_t dst_size,
 							      size_t data_size))
 {
-	size_t ret, compressed = 0;
-	ssize_t size;
+	ssize_t ret, size, compressed = 0;
 	ZSTD_inBuffer input = { src, src_size, 0 };
 	ZSTD_outBuffer output;
 	void *record;
 
-	if (!data->cstream) {
-		data->cstream = ZSTD_createCStream();
-		if (data->cstream == NULL) {
-			pr_err("Couldn't create compression stream.\n");
-			return -1;
-		}
-
-		ret = ZSTD_initCStream(data->cstream, data->comp_level);
-		if (ZSTD_isError(ret)) {
-			pr_err("Failed to initialize compression stream: %s\n",
-				ZSTD_getErrorName(ret));
-			return -1;
-		}
-	}
+	ret = zstd_init_cstream(data);
+	if (ret < 0)
+		return ret;
 
 	while (input.pos < input.size) {
 		record = dst;
@@ -107,24 +139,14 @@ ssize_t zstd_compress_stream_to_records(struct zstd_data *data, void *dst, size_
 size_t zstd_decompress_buffer(struct zstd_data *data, void *src, size_t src_size,
 			      void *dst, size_t dst_size)
 {
-	size_t ret;
+	ssize_t ret;
 	ZSTD_inBuffer input = { src, src_size, 0 };
 	ZSTD_outBuffer output = { dst, dst_size, 0 };
 
-	if (!data->dstream) {
-		data->dstream = ZSTD_createDStream();
-		if (data->dstream == NULL) {
-			pr_err("Couldn't create decompression stream.\n");
-			return 0;
-		}
+	ret = zstd_init_dstream(data);
+	if (ret < 0)
+		return ret;
 
-		ret = ZSTD_initDStream(data->dstream);
-		if (ZSTD_isError(ret)) {
-			pr_err("Failed to initialize decompression stream: %s\n",
-				ZSTD_getErrorName(ret));
-			return 0;
-		}
-	}
 	while (input.pos < input.size) {
 		size_t prev_in = input.pos;
 		size_t prev_out = output.pos;

-- 
2.55.0.8.g37e2a0019f


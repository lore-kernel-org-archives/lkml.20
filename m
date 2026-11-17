Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882521;
	b=uqZ2gU1addRBR2RW9AqYLHLJZrtkW7Ry10/Tloe1p0YbYOsoaJ+u4bI1sRBN5EREqR7K
	 I2IzKIw1RNMB+tLpTlvBBJ32VSIAyC51Mal+r498Vb2OzHT3UxMd1KwsTsPpR5csgnwqv
	 R4EEAjtAZtrnI6vjhxyPIznAREefGjns69kUP0Wr4qoYTVVVasMeygGK3F7+SzCMUuXhR
	 qpHy5c/shrj2Je4WhjaMYTGxuT/X38kBHO94Cetj52Eaic0iI+3/3QaGNyOVdZScoZn01
	 oGMv824kCXlg1/ijT8XnKg/KGQawDsRL3KP/xzMNrlMeSCdkkUHcqmnpE8dJGdkwP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ypFwQA0FZOPRuiqI0RyJwEY/z4AuSyUwMT7yZK7iq/g=;
	b=hV+1P5NWprVs8IhRJE3GBgy/44HG0l0RLrh0i1iF9e89UBAX1CEwqIQMSu+duFSMDRe/
	 fDHbrku9JevODdsQ9KaZw3rfwetOrfsRwsu4Hl7sUdnmbzxIiaEQYaOnlk9d6A7Ief5PT
	 aHtSY/PPKBNI7fM4pljcjwRGqiW+HRKCJelw3mCqIerL4QJKoDOY+eC/Ur19Xe9BAo3Hs
	 HQI7hImMiMu1vgzsLQ9nKT1VnxJEqlSyBYvDCceg137AhSEgzS5dqfqDzBIm+qkP3KbQ4
	 pgohz7QNdgyPlizzN//hMMMxacHdx6uhb8UBORpH0fZCq9yK2/BVymI1f1aPSH7GZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UUIAycOK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1243606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1243606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UUIAycOK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so528429eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794882520; x=1795487320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypFwQA0FZOPRuiqI0RyJwEY/z4AuSyUwMT7yZK7iq/g=;
        b=UUIAycOKp8saHa3hRn/60RdoK9ypwBXAxgMsedsROiE7Kq5HCJ0vR9h/QzRk63ncXw
         s76HKQd7otKxOUM6wG56oONR0zaKQxxusnekj5ajpK7acbCGmUctYK6+h//RHM013zW6
         V20Flvt7xwcvvwy7M4IOt+8RMVmtwQbmxmdXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794882520; x=1795487320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypFwQA0FZOPRuiqI0RyJwEY/z4AuSyUwMT7yZK7iq/g=;
        b=Nabr4fboNk+F9J/8XOX4JCY2byk9U/VQFXaKRPUN4ANLzEfnrC6BEWsS5zt32EdLpv
         ijE8ceZTf7PivnjCoouYygBrE+scvERRMqv1dBwmnWdUXPoH4jiEbj/9JRx5/+B5zrn1
         MhJIpfcNImU7ZMdZXuI0GU+jg2rx6hbXJ7ft4y+rD5q3aOuL5TAGmFdnN3PNZpusCjv8
         j+6RJRH0JMCgu2a7+i2DzrIZUcYkW+8k621ZOJFohXYxqH4obFB/KF9haFpdd6MJ46La
         otCbCh7maHLSEdtI/3JYiPH44xU5zawfERf+SFkT7yxRMdWsowY7Wlm8rN7lhXRbd7mT
         eaOA==
X-Forwarded-Encrypted: i=1; AL+hErGgeDLpBSASlEuX4hCQ7ksmt65MiJMeqxj0epVIj08kV8r4WGdTldvngHHWzj9wRCLBt9U455nm8dW+V/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UP+CUrgIodtnhSIv2WRsWalCjEsS+f1mofI44RstKgul7MuLY
	KMrvWsy5HEQdUU8BNHORFypa7hdmC9pRBJ3tU4YXk4ioTgClOKi7XK2MP9ZQ4aPa5g==
X-Gm-Gg: AZFdTZdnqkZ7wJ0URcNMpLZ9bIPDD2DRAdDPomNfGPdAUP2bM4pnsY/AeMkkY0wsGQf
	diofyOt1fA2L9G8lVrt9AXPTpAwA/m1B6Km35hec2foRC4uuVkO/Fndy2wb3vUtObVYmp4y6CAO
	Zn7bFqtDNPXPe+BUqg86w2j+PQSdIS5qFmysgdRxnb75xHfPn9hXfbLFdVr7wU4kAx9Itb4y+N8
	DEVhdBJUWirvsuYRVWypuLpTalHvjswz9SJlBdr4ElcobA5WyZESV2sSaOyByIz88JGeeXwJzQN
	XDFnczPt3ReTqBLjcv3Jd+tasIAkfi1/QpbT941csHdUv4r3ZAtvfhdtpRXbpIDY8OuYFZfrlJu
	PYo3ar98YoqzTGB7JbUU/wjtPH0h4tjFvOjJCbYVRCTVyA9qMwxdlDWqq/DPff4u6ThefRD3jId
	G8iyrKrxRKf10OADUXTM/fVmFN95LH/LSMsbS+cjQTutcURHfAQf9IdWqkHWn+DPpxC2wSt2I6s
	jKqczOeoPP4FmIe3NLNKSPSl5uHgXPyLTduglhV/hCl48jdeK0zyGhmSmStaWwEl93FSQ4Apwj+
	/4zJw9aaK0ZWR0HkKNOz50cv1cH5VVLRRpXTj4fHccxVO212Qbv0A3ORPY6KBnNRicTW
X-Received: by 2002:a05:7300:b21:b0:36d:158c:e31d with SMTP id 5a478bee46e88-3810f21a0bemr1286841eec.18.1794882519385;
        Mon, 16 Nov 2026 18:28:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-380d5135221sm3648441eec.24.2026.11.16.18.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:28:38 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/2] tracing: Properly match strings that start with numbers
Date: Mon, 16 Nov 2026 18:27:10 -0800
Message-ID: <20261116182710.1.Ic0625a2bd2e6f8960c0f75e5d15f14f3c84d1d38@changeid>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
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

As an optimization, set_ftrace_filter supports writing indices (numbers)
instead of function names. This support was added to the generic glob
(fake regex) function, which breaks the ability to filter string
patterns that start with a number. For example, PCI device names tend to
look like '0001:01:00.0', and a reasonable filter might be:

  echo 'name ~ "0001:*"' > /sys/kernel/tracing/events/rpm/rpm_resume/filter

Move the MATCH_INDEX code out to the only place it actually was intended
to work -- ftrace match_records(), with a 'func' and no 'mod'.

As a side effect, this also fixes :mod:<module> function filtering for
modules whose names start with a digit.

Fixes: f79b3f338564 ("ftrace: Allow enabling of filters via index of available_filter_functions")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 kernel/trace/ftrace.c              | 3 ++-
 kernel/trace/trace.h               | 1 -
 kernel/trace/trace_events_filter.c | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c7d74b33d36d..6654da9d1bbf 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5029,7 +5029,8 @@ match_records(struct ftrace_hash *hash, char *func, int len, char *mod)
 	if (unlikely(ftrace_disabled))
 		return 0;
 
-	if (func_g.type == MATCH_INDEX)
+	if (func_g.type == MATCH_FULL && !mod &&
+	    func_g.search && isdigit(func_g.search[0]))
 		return add_rec_by_index(hash, &func_g, clear_filter);
 
 	do_for_each_ftrace_rec(pg, rec) {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 0635503a31dd..3613476e5508 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1807,7 +1807,6 @@ enum regex_type {
 	MATCH_MIDDLE_ONLY,
 	MATCH_END_ONLY,
 	MATCH_GLOB,
-	MATCH_INDEX,
 };
 
 struct regex {
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index c10951bcfc5f..07ce75244233 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1118,9 +1118,6 @@ enum regex_type filter_parse_regex(char *buff, int len, char **search, int *not)
 
 	*search = buff;
 
-	if (isdigit(buff[0]))
-		return MATCH_INDEX;
-
 	for (i = 0; i < len; i++) {
 		if (buff[i] == '*') {
 			if (!i) {
@@ -1158,8 +1155,6 @@ static void filter_build_regex(struct filter_pred *pred)
 	}
 
 	switch (type) {
-	/* MATCH_INDEX should not happen, but if it does, match full */
-	case MATCH_INDEX:
 	case MATCH_FULL:
 		r->match = regex_match_full;
 		break;
-- 
2.56.1.703.gf848ed807c-goog


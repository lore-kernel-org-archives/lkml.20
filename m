Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686361;
	b=wBFdw2HHOFieVclJnL9qEadibbhABOiarZYO+3BaAbWUGPq0/5y1gRRlb60j7pIj1vq6
	 TDFacL1cZ8pjN3szTMRb9cNOAvl+b8qARt0nmnaKvpBq7Dj0w7M5cfjygzR1QwEu2pJJs
	 aVt4BnM2z7AHrIvKmSJhAak6mK9BpPAzj/4JfH5y4t7i/CZEwDZ+Vf4mCUcGkwLpIFtZb
	 gECxfD9iLghK9a15Z0NWP/tu+z3B1a20hW7wJEYVGhSi/LIQMfH+NJ1t60c0JvK2fhL+Q
	 LGt/T6EXTZQAJZkWTV+RbGbJxpFo6IpyXEAmvub2GyGflu7JSBr6ki0GrVBS5fYc88A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kEf2B9QYpi3ckJDBCR/s09wzAUjGwxpz/3KtgUVx8/s=;
	b=LGmf9V38nM5togBsA5REXoNsGrB8eARWGLTvvMosTIBKMB5zt1sgfUG6exbmcQEVFi+r
	 4rQ8PEeyqip+k0rhPPdXMIRh4zyrOXsarBmTLomKBSKRAzo1dWHn2u7GuG97lMnYEtYfE
	 b3Zn2P9Yeh0bzorJUAfcz83RQUeH/l6SokJhXSFbsCzXItRxFjhS8DFom/g495Fzc174P
	 XDeW4hNus0pD/drCG7GuR06dOVofe5xvIhm/Q6ZyL//WAJ4IsgLkXNMIGwlLKnjD0Ep1s
	 wAiVrRl8+rtdpq39R/Kzg5QknObGf8BCS2SnQFRn8m6EQL4ehtnHu3f/k6RCjwRxP5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epNIjQ67;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA4606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBEA4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epNIjQ67
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so2512890f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686359; x=1795291159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEf2B9QYpi3ckJDBCR/s09wzAUjGwxpz/3KtgUVx8/s=;
        b=epNIjQ67nCN3j7wLAT7F/mQhaZcAZaFpGbT9sEyMcTUT10Ob81+mPa/O8MX3E1hUU5
         jk5WPbgcZ9mhEoktRxGqidHA+EwmVOubKe4261DXsWhZ/LbKRj4vef6wVToiW8hxK5n8
         7eCRornhAole6nBV/nY4TMAs08cTMpWYExHjwAiDKB4oTu8B0HGHRkpICP2Z+LgnopAn
         k8HYEhBuaUkoqyka3MPupohJYTqB04ofUspDvdnGKr50YJdVnU/19aKaaHqQq2VlnY3i
         UXpPIRDl0KIsZaeLYqUZj+naeNShP8N+7JlWp/THRL/i8QhPPNcOrliM3JgVlblvplmL
         +CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686359; x=1795291159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEf2B9QYpi3ckJDBCR/s09wzAUjGwxpz/3KtgUVx8/s=;
        b=ULmwMRFLA2hN6/4D9avJaMCXj1ALWzm3rOkjI+DdeLTUAmJIJaSMeIS+GfbSoeCCi/
         /opZDxhEZ5rEELlVWShjVJHt1uPaCUfgw4x9TD3FCJX4yLrBm9OlLmerqNVVolnQFRNN
         e0/FyD+fe/PLJbGPAqa4JyAzffwxkaqZG2cYaayVibAR+TvKYQEwYPtpOiyqBwDN3kKT
         qOYC2bVGbH9p89Qi/omd3uyMnljHzAs88av7jLzVl6HA97eOmJAsooTcFaEgSk2+kfTy
         O+JR/ecNWMVbPa0ycAwJ0zzfsN7XP48L+g2dThY0xIvaCmzXdG90+NgN8LPZZ7WTtcgB
         GXcw==
X-Forwarded-Encrypted: i=1; AL+hErH2EH5/QnqlNkxe5+Po3I3u8JTXhE/Ux/i0jFqFvxeRvX9dhBGGCg8DWP8YhaKyeABq02hpZt01r/Pu3a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bZC03j61rt0i6UJpbVBkOBCwHnxreviJsg+VAzRF+BHeRbcj9
	+X9PpPBE5xR1bHDGjtiPJm6SuFjipExnWmlOGsuA4ClwRElrwyfZG/C7
X-Gm-Gg: AYBFou2Eot0GZ9W2xUKZjZxV/XG97+6L1Z2paSWVYP0qCwJanK6+7JypmkMXAgk9U/+
	WIXL4IWwmkrHYcVVlOwEQyQXcEqATaD73FV7Ek3npqsLI6kJNVKd69uwHjz9dsUBWvtaa3Hcqt6
	OcPUznlhOYcP+OUY4vjT6/d4QjSUjTl4PHaNMw6aGggLa8rTxuMk3X4CN5pjEeOTAlKnf6TQ+lJ
	TkepqUidY2h1VS7oFvJAp00BDeiRgFgbRZB+H5iKnw7e+GnkysCFjiNNXcL5M6TAsDlVg5CsZAa
	VjWR8CUS4vRv6d5k0Mmhs7UY1s836N1hRfkOLZneVyITiXWWvJlAvx53NQ7QT9I1RIThJ2LL9Kt
	UyRz9BG1/JwfoFwJ8iMC1QKddF7+s/2KmAbNyFUZicNjADch+bGrlfnJx/bhSGpk6QcjYCLveRb
	vCVjIzL6jRg5GJiDNKGzxq0NE3CfHJSBJlZTbmkYCBsgGmvZE9a00jhGC7vBimDRoLmaoDEoKK9
	XhDSmYFHD1dzBQtqocVZtSu8TcAIfaM+r0TlIDKLtU3SVjsTEENKbMtVV3uhzQoskz/PG1g1HCn
	YM5YlkSmIMlDFURgelkf6WPERvCnBbzE7xcCG4W+OiW4vIQEzHPZCdgWLfGIv+Sj8s7n7+W0Av3
	zancfbQvMi4fsDqNdNAUsmkLRoylA1DAosJA=
X-Received: by 2002:a05:6000:3103:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-49c71783077mr13999489f8f.42.1794686358935;
        Sat, 14 Nov 2026 11:59:18 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm12989691f8f.24.2026.11.14.11.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:59:17 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Reject .function on the function trace event
Date: Sat, 14 Nov 2026 19:59:14 +0000
Message-ID: <20261114195914.2678414-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

For the function event, parse_pred() handles the .function suffix
before the ftrace_event_is_function() case, so "ip.function == schedule"
builds a predicate with no regex. Setting it through perf then
dereferences the NULL pred->regex in ftrace_function_set_filter_pred().

The "ip" field of that event already takes a function name, so reject
the suffix there.

Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace_events_filter.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index c10951bcfc5f..11bb751c4388 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1743,6 +1743,12 @@ static int parse_pred(const char *str, void *data,
 	pred->op = op;
 
 	if (function) {
+		/* Function events already take a function name on 'ip' */
+		if (ftrace_event_is_function(call)) {
+			parse_error(pe, FILT_ERR_ILLEGAL_FIELD_OP, pos + i);
+			goto err_free;
+		}
+
 		/* The field must be the same size as long */
 		if (field->size != sizeof(long)) {
 			parse_error(pe, FILT_ERR_ILLEGAL_FIELD_OP, pos + i);
-- 
2.55.0


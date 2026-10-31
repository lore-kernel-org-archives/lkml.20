Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479161;
	b=FvWwUGByHHrcV0QcAXNlSjrMObAdN4n/8uW30/LDQHHjOLEG2JilrG/wYmxP1ZiUMwQO
	 WZcf+v4zPbaT+CGb3azx42WPD20Kx1kBVsaMS0ECbWHYMfg50XXq9usfbSanMqO2Gfi8z
	 B6/M4U8uGVypLsr8IwtIjj+c9pKO1QuEWuiMep044vEANvkpUKLfXpmAoCIS+2WzBXIDf
	 Nsdkcwd9w0+8+7XeooSDDgL8YY/GWRfiDdLyeA+zhItFm3cq55UuuQW+7qWQlnl40ldPZ
	 mS0AFO4ezR8fWC/re9sMfMfiOCALccgSFlfEL6lni85zWj2qdfcWTfZhGZdAuOGibBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lw1QeIPbva61X8kOSwfRbW2IpFMSjR97yWrLghxbqQs=;
	b=gaTpc1Qm7peFAyUG4yeLmwUtiYNbsUyUCT++cJv99UFQR32crWp/YdIAJ6DQ0LgPSmJy
	 FQPPYF4ZTSdBl0sMB29VagBYFQ4GgGM8hK7Vz6iyE0i+AgiMeq7LW5VtlW1tQbv1mksNp
	 rUCQ8XvPtLIRFZ7pj3HEGF45wpZBdDxUIJfYTIvNTdQZFx5tIJi3bVGh4y7QQxTuzWqUt
	 hQvqCOkOuRWDxn3lWw0OWPFYhAqWXm6qtQSJEHJIAxDRJJFPywuElkd2aapDv0n+hAgMc
	 o5ZJuMLLpk0msJ8azltEopnoxBlOWAAi1MxPkom+5JuoiinIHxQSRncsc9tfqlWPXcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vnzncOL5;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB78606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vnzncOL5
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e4831c028so1663156f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793479159; x=1794083959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw1QeIPbva61X8kOSwfRbW2IpFMSjR97yWrLghxbqQs=;
        b=vnzncOL56tJDqqOdKFxHy2ZiIzQGcH5TieMVIfutGfF47fn50E83iUFGfz63/dsONO
         pyZwMHwvQ5qQDsDf/5dsqMYoeiPPeyq/CfOZgdYBZenIAvf8LFjK8nqd8LcE8tr/N+Yl
         lfPURBQF7RFRTFhwY9iRsM/I0EhOh5OXJX2jdCdgGQLdmkyCn3DEOJ+EOGUZMIEPpA/d
         hbRipmVS1PneGisJlzprJwDG2AwcJLOcby9bqoByWJOyy8xpxOfQw9OYeCFoRlDZvtGE
         kr4JIPbc9bWdLtH30gOdpW3eecKnI5vYgvWOUWN8B6YDKaCp2G66IMaqyfuim85I4TvK
         hJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479159; x=1794083959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw1QeIPbva61X8kOSwfRbW2IpFMSjR97yWrLghxbqQs=;
        b=ww3rI8P+ZMki71Ai4uM+xLCbPe1r9G1kJ64kuVjDa8WvaJz1z4Ga/oDBenmvNs0mIS
         kdtFLdDbIQrvfT3z64KjYyES8Thcz1+MJfX9ZN1Qbk1kLgb1b2/OzLGvUwk13weXTrFf
         4gGJEsSPMeRSWuKRlrepSWb3qeTVOXvo/kszxbmY6L5lCRs2aYzn3SykVItcvxhiU9CJ
         h2iLDph+4lJQCw9Tg2kVi5Hdnj6OqxpTXiCoBY6yKPmFRcgG7rPAo3nL01mjM+O5epF/
         ejQmVHwoZ5w274Tx3KDG+ZA2dOBwN7PP8Cm3NMmSuqqW0RTr0NSXEPQmFGYXNAt7fguQ
         3NSA==
X-Forwarded-Encrypted: i=1; AKwUvBzOsY9o4CZb8bGQZycp3rRgEcErZGCyWQXkXkX+vwwFImc5EMATzh/FiSP1UUMZZyFFlcQl5Djbn+JUdPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp+8XarY8ws9y4LmTB3cuytgCK2f84ZoDFZzx6OH5xIuO3NYzO
	4Ie8iIVcSOSSy0JX3Ibo7vhD03kdOiNcyLpGf1Cib0S7MC/XBt5Gi9tu
X-Gm-Gg: AYBFou3duegSPAfW6kkI4fEqjWuc8HpN3rivSAxCgn74fuVDlmzaqHZ1DBpHLvXHe8l
	ZoE5SZnom9bbRg6kWkViIRob6W6TMyYcHk4xE2EO4+79aXwkbQiPvuCxw0not8mc53IOrqbd1UK
	mVTI+BwEUQ0JjX6BPSO6uZe0/a3lBaimbRSND3Yp9BG1ceKd0j8mBe9ngS5u/A2+8wVPYP183Jy
	puCblOJCEV9gmCfbrXfap14X8XjzY85VfmuP9Kmrqb8Bj8F4g7tyBzCFW+fdYahqQ3pN7UEwjaR
	uc6VAKHPeh5k/dV7ZgBCQf0HRrNVMqWPqid2RvoznhhZ+9B21ROELgxMtlpiA9tFAYebrJNlCAt
	Qw3g4p5EzrXIt77mpBP9STQua1zz227tcxqC499WSRlM50+LxiDpAWBDOxixmwMJzHbtei0jgoZ
	t2RhD8jCLy+A2OgA1yhtWkVoTfNKa5fb4fF831sA/wvne8EQW9E/tclYzVZW7Y5+jGDpzyLXjgG
	YCXyqOiD9OqL5Zd70vlSDznQ/9Z5T+2fOHflDO01SCzXLZCCZW/gfvLDfmQ7SVBFfHJW6kNZO/H
	MRgRTWnUVLPDCUWbRArq27ADA9lcBI4rdvTZ55sHx5SMINfRpkyNsrwi881Uqw4zaDTX30xkK/A
	sNBdSKYQcLT2RKw==
X-Received: by 2002:a05:600c:870f:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ac1899348bmr125929225e9.30.1793479158956;
        Sat, 31 Oct 2026 13:39:18 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a84esm11386624f8f.39.2026.10.31.13.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:39:18 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing/eprobe: Install the trigger for every instance that enables the eprobe
Date: Sat, 31 Oct 2026 20:39:15 +0000
Message-ID: <20261031203915.491866-1-devnexen@gmail.com>
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

The eprobe trigger lives in the instance of the enabling file, but it is
only added when the eprobe is first enabled and only removed when the
last file goes away. A second instance then records nothing, and the
first instance's trigger is left behind once the eprobe is disabled
there, so the eprobe can be deleted while that trigger still uses it.

Add and remove the trigger for each file.

Fixes: 7491e2c44278 ("tracing: Add a probe that attaches to trace events")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace_eprobe.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
index 998e6390937a..a0bc6fa1fc69 100644
--- a/kernel/trace/trace_eprobe.c
+++ b/kernel/trace/trace_eprobe.c
@@ -661,20 +661,20 @@ static int enable_trace_eprobe(struct trace_event_call *call,
 	} else
 		trace_probe_set_flag(tp, TP_FLAG_PROFILE);
 
-	if (enabled)
+	/* The trigger lives in the instance of the file, add it for each file */
+	if (!file && enabled)
 		return 0;
 
 	for_each_trace_eprobe_tp(ep, tp) {
 		ret = enable_eprobe(ep, file);
 		if (ret)
 			break;
-		enabled = true;
 		cnt++;
 	}
 
 	if (ret) {
 		/* Failed to enable one of them. Roll back all */
-		if (enabled) {
+		if (cnt) {
 			/*
 			 * It's a bug if one failed for something other than memory
 			 * not being available but another eprobe succeeded.
@@ -709,18 +709,11 @@ static int disable_trace_eprobe(struct trace_event_call *call,
 	if (file) {
 		if (!trace_probe_get_file_link(tp, file))
 			return -ENOENT;
-		if (!trace_probe_has_single_file(tp))
-			goto out;
-		trace_probe_clear_flag(tp, TP_FLAG_TRACE);
-	} else
-		trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
-
-	if (!trace_probe_is_enabled(tp)) {
 		for_each_trace_eprobe_tp(ep, tp)
 			disable_eprobe(ep, file->tr);
-	}
+	} else
+		trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
 
- out:
 	if (file)
 		/*
 		 * Synchronization is done in below function. For perf event,
-- 
2.55.0


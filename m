Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818172;
	b=BobMldDadcdYW4jj5TlCfhzm3PVvHYTH3g1dc16hJxy3UcCXY1bWLmIIHfMphejcSdAn
	 fqy9d8ZIhDdM8XjYc1JX0qcupVe06wga+84ZghTXoVos8nBoFHVyN9NTYsYYKl84R5reh
	 /iNF0JVusvVMIHSIvsMiOFGDGg/DJ0HDjHA4boqJen2rOY/na3+WXWjJpMVG/WoepK5Rr
	 A7hS6UHgfi8e84gGSvjPfwIHDeW5flmyUwtZ5EvX1LW40N3PadAlkzahQxxtrm4QVwg0F
	 wzdITuZdOg9vq1XqkdldBMcf6ZhCAyzY23uyjsvpmixGiuv+TxxkD7w8vxms4Fw32IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yqpx/mpDeXMZXHlMMGG8fT7M3snzQ/eaSZH/S7I+jLw=;
	b=khAMxlZ9WRBvBrafah9R+DxesVIY7AvD6/AUcAUss7w+fcnkxi7d9D6kdgMSIzIoPhB5
	 7dpoAE8V5mAG7DsHWHpSPAzaa9JiP2pxhCnmZlO1yrOLoo1/j7CmTAf6hvWqY9QyQbI5/
	 jCcnKLZw03gsrYvqvpo223MrrJL2TPTEX6t9s5qSe+l9R/H+PdAcIOsco3sws0yIFWP2t
	 9SAXr1RRRYEtEcBMhD6syervBHE4235FxK29RsukoAHTrIxQZJ0je2WLuC710PhbCH9t/
	 F9dqRSqYl29bL4RgXLZb9EpBmn1L49LOiDVBTt7VQnsooW3U9QJUzjtAFjtZd/AkS+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcvN3bX;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603026083618
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603026083618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcvN3bX
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0cf2c0785so9617877b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818170; x=1794422970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqpx/mpDeXMZXHlMMGG8fT7M3snzQ/eaSZH/S7I+jLw=;
        b=TBcvN3bXAtfwxVhcDIjc0RC/pX42zn6EaoVCD84MEzTO9LjZOK+EVZ++2sEVgjYu0H
         epp+4/B5E5wZSc704IMncCP9lZa02Vr4XWgqs2bPcF5UBV4+KI+VSZUIFuanYTx28y9C
         TLlCvsTK9p34Q8Zm5Pvp8Z1YHVvMQca5O2qji3kwMOy8Z3ywh4XFsrb492G0yEX67vM4
         3CQA6B7vBVvRLbZtfjbzwnThhfc6j7lSV0a+ZmmbQCH5T0EXSpqWHB6rASCGIctZZR5C
         GL08OMePQxiZwA1QIimhGY3G//Vj5Zu9joAZDTuqbyN3BfeCMOvUtZxib0gVA7tX+nm7
         g/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818170; x=1794422970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqpx/mpDeXMZXHlMMGG8fT7M3snzQ/eaSZH/S7I+jLw=;
        b=Qn4bzN/sqSstxeZU1gyPsTB6IIsnb8TmYkA/JdLnM3RhFAd11m0z2sQfYt5kzhCmw3
         EqpEf+i1WMwhMlsvqRLjAN9fuR2yGbU0BGbDY6qdjoySy+7qruJWzQ4AbRtOeT6u5LOM
         zrHa/SJrM6yhZ+Ae4akKf2jiGT/Nmu7z5qPzH39Pcut7PgQ5oqO4ekE0DyGbqLi+jNu1
         92wiPGfF6hWhc8VfJ6v5n5UkAXhd2M8bZNTkdtdWm4MKT0T9rXkZQMyCNiWl7boxCBmw
         Blw6xFxBuLQoiIjsCcW/WJrM6PWmLl3rkPKCeqfqHhVIgvr/Jut41fBg4D3C2ykYbZU8
         cOhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvhD6VN0BUy/6Zq2hIfAKwpecbRJoy6zknKHdR1UIl6Q2CuBRufp5BUOGzg7H3batmgy11E29nqs4o+Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MEIwVxC6W54I25HNdM/qkhgNJlRHqjM0+74/ymqRq74LYFc8u
	TLqxldWgAcjrLHIxJZy+Y4+opkvlI1ymI44arr4H9BG7L3vi9p5j1cV8s9dciQ==
X-Gm-Gg: AYBFou01eQcBxQqz7UEjmVyeTjmjvN1pwSoMGj9ZmnEP8jR4P8B5Mc9fq/iYfVjIAMX
	DZszKzsril+XYuL73nulvt7LbLfuTAQmo/rFBcSGTMAtH8c+tmFubkja/6TvzrIMjd7ZXlFI23R
	L/hBdNmAUQ7pdOhKTaJYwFWJ0uVKJewt/2lT92wO73vLvLwFz0Sj4HHBueq26FAeHQUB6o00q4I
	BEIClk3LQlj16PE0sq8gkSKa/i4aSBOLdNNcp/oMe7niLSsgUuo2uBn5YNBQ2OAznSSGvxIoVjQ
	CJ0EiXLGWu0vc5HGf/hwuKcara6XagCYhXH1+B1M8AtsoShYnuBDmPIRPTTmX0/8p9xhfBkBLMK
	EFUcuWdZL9ZynTeSS4tnhcfZqqGlr99vqSFxh0mYM+hoS6Rdm9mcLo0+Wtrlo678T5v2bMsH278
	Cq9rHLoeFlbDaZgOnuVbisJEuXFAgroIdyayhPwfUa4T5q1RU1ZO/EjMiwNBttbtOonJdxc/ti3
	XvtiZppaU7zeMfFfKy33JMT6h6HkGO78G2BtDzFx36sxhN4H+8A13PgqEnAmrYJaGc34Czyg8a/
	a3NBxmG7X+A5Vh++zxVYA4001tyaSKlRe39EertwNaZAu1A5Zv6NTbAdWzAsjW5Xfc9925iyQOV
	MaUXrQiih1Q==
X-Received: by 2002:a05:690c:e0dc:10b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b2b67a4c2dmr71395087b3.96.1793818170428;
        Wed, 04 Nov 2026 10:49:30 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee28e4e1sm1983347d50.17.2026.11.04.10.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:29 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:19 -0500
Subject: [PATCH v6 12/13] alpha/perf: sample only retired instructions for
 precise events
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-alpha-profileme-v6-12-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=dXinNQWRSOHUF7W4/7e5c+VGWyfWHZj2yb6aCe5eh9I=;
 b=kA0DAAoWrOspdAyaTpcByyZiAGrrfiWhrdh1ohcZkL3nl5+bqVxZIQ6Hu94iqr9FHGv6llraq
 ojxBAAWCgCZFiEEXq8hBJqGuKVMyxv6rOspdAyaTpcFAmrrfiUbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3J
 zZW1hbi5uZXQ1RUFGMjEwNDlBODZCOEE1NENDQjFCRkFBQ0VCMjk3NDBDOUE0RTk3AAoJEKzrKX
 QMmk6XxhgA/0Y0ha3Nl0y6k33nwxDP4L3wVWh6lAWbgaQRyd3mXDqfAQDnDfnx3+h6FfO9gLlXj
 IESk2GyTMmJxMsvAjrGdXOgCQ==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples include instructions killed on a wrong path, which
show up as hot spots in perf report although they did no work. On an
EV7 loop with a randomly mispredicted branch, 19% of the samples were
killed before being mapped and another 48% later.

PEBS and AMD IBS op samples are of retired instructions only, so make
precise_ip imply the retired filter, unless filters are given. The
profileme bit still selects every sample. With cycles:p, both kinds of
killed sample went to 0%.

DTB miss samples, whose instruction is aborted, are then dropped too:
cycles:p reports DTB hits only, and the misses need cpu/cycles,trapped/p.

The kept samples carry the full period, as do those AMD IBS keeps when
its swfilt discards others. So in frequency mode the sample rate, and
the event count perf report estimates from the periods, fall by the
share of killed instructions: to about a third on that loop.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 32a8b5c98381..7e34eac0ea47 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -837,6 +837,11 @@ static int __hw_perf_event_init(struct perf_event *event)
 	if (attr->config1 && !profileme)
 		return -EINVAL;
 	hwc->config = attr->config1;
+	/* As with PEBS, precise samples are of retired instructions. */
+	if (attr->precise_ip && !attr->config1 &&
+	    !(attr->type == PERF_TYPE_RAW &&
+	      (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
+		hwc->config = ALPHA_PERF_CONFIG1_RETIRED;
 
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {

-- 
2.55.0


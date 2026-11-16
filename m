Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812467;
	b=iV/ZAYroc2t3F6x5IS4LvsUzCP8CfIwDDLiMrzh9Bz4DBcJSCYVKym23OO1maYB1oMKe
	 6dsFbIb8hm8DR4L9Rig/xVDZe5vtWLhM/Cy0x5shI2uLiIQpmNsqK0f1gI2Qqg4GBCf3i
	 FvKwoK2ex01LVtxaXR/FOBzduCSkWw/EolWxDnr32V3I7CrH82Gp0PizpwjsxMuEq4pdt
	 3bnm9WGTT08Fj0RuWs/XZ7Umw6qtskBOe3tRLKk7RT3luv7s1iQF5mRYAGX29I8SBq63i
	 1mceRt/KHsZn5v9tcSQiyiGapG380++ypcM7FTzhWDvA9a58SsXGnzwEdK8o3hc14RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=++1ntAHxYp1b3dxKL8jJq9n8qLU3ShgVGvnl2PLKljY=;
	b=ij3Bpm8Z6wqT5WI4N343WeoICmCy5GRtjdzkH7jZv5ZpMiGsoIppysV4kvFAZ8pbfvf5
	 ad/bl0iRHtg0NGXTgI4UlcpZildF968gqESERtxHzdIdKo09wNgjj0bPUu4YXDQzjh/MA
	 OG60dCyWehGx1FWI+4C6aQ0pHLdKFpUXVQbLiYn4GP2HNGv6h9xuVJF78Dt1mdcteItQs
	 jfXAR0jISUqT4XjBbd48+0HtT6i3RRRRhYFQo5vGVQOorxV+1JeFcNBxCKIZ0vKKGSFH/
	 Iyl8phaLsI+gbd95QX29aqBR9ivUV0SgkWdu1IWX8NMmWBXEIgZeZskhUq7cseca4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBnMn4Yk;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AB9606A8B5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AB9606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBnMn4Yk
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so3220862eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794812465; x=1795417265; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++1ntAHxYp1b3dxKL8jJq9n8qLU3ShgVGvnl2PLKljY=;
        b=ZBnMn4YkychZWvYbSxbV2LS4ZOdHXPSPw6sYk34YtJJyLRy+BmrQVdpqip7QrHbDwG
         8nh7fUEweT1zxzUHZvKH4i2BbrMEitHWhzKonbsQp3qTM9h/VYUb6vO73YlIQuj3xOtv
         3YP+QHQ8DR9dhnMN+LdibtjOT2LFCsTwBO4BsOimUh9fINRT6wsBo9ILiOV5u65klykN
         xm39J6WUjM2beDXSGGSjA0LKhAwxQQaNLkAO3fkft5AbL1EDfCq+PhKo515CDQSkmrZC
         tnLJ1AWNj84/fm45exzlvgFK4T/E5fsggCduJsoo/jvlNPAQOmh+Ruw0mSsbTCHsXgoz
         vtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812465; x=1795417265;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++1ntAHxYp1b3dxKL8jJq9n8qLU3ShgVGvnl2PLKljY=;
        b=AWY1P546VEd1IvrNNEp74uhTULa25lAB26VHH3nzPsHF+amfxWh4cxWLa/2bvD7QM4
         2mgV+1sQUtTDulU+lAjP8Cqp1Y3ff3gh8kFIc4rh4yc9rMhVipzYuFvu6cV3NJP2kxhU
         4Pe0JbFbFcmQYvlZqLQ71+XBPKHSTeAZprya5y0UxGm13AY74c5HesiY+ux+nRT2o5fn
         r+vaYzNTdxy9/eMBjRnKjUpOLHJupu39WdHnI+07yuvTxjfl6LuHQ5V4go7xWlud0Zxw
         3XFHTkCWt2Rz4KveUuXaJZxwtetc6kbC2bl5FMZeaiRVVowE1RNND8sDnj1xBSpw7jyi
         E4vQ==
X-Forwarded-Encrypted: i=1; AL+hErFbm9sdboClP8gbvw8fXax8hfA7AXM0tF10ZC2DSXHXj7ev1aIMyM9B0GGE1kZx0ocFnchUL2fZ8bVbS3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aDp5QjwnyzekMekdjlPySJpT7UkNQ3jprJk9w+xqFImAaukiD
	eX13E9rvDtEJC9Uku+8SAiUPZLSAY9BrCSb9xz9sshPPESWUdYzyUrV4eQ84O12thkS1tmXHwC3
	ELK18XgviSA==
X-Received: from dyay11.prod.google.com ([2002:a05:693c:62cb:b0:370:71c0:f285])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4006:b0:369:2f25:33a7
 with SMTP id 5a478bee46e88-3796676adaamr8952349eec.15.1794812464881; Sun, 15
 Nov 2026 23:01:04 -0800 (PST)
Date: Sun, 15 Nov 2026 23:00:33 -0800
In-Reply-To: <20261116070038.2968725-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116070038.2968725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116070038.2968725-7-irogers@google.com>
Subject: [PATCH v2 06/10] perf jevents: Add --compress=lzma block compression backend
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an 'lzma' block-indexed string compression backend to jevents.py
using Python's standard-library lzma module (imported lazily) to
compress each ~8 KiB string block independently as a raw LZMA2 stream
(FORMAT_RAW + FILTER_LZMA2, dict_size=64 KiB) decoded on demand via
liblzma's lzma_raw_buffer_decode() in pmu-events-string.c.

This provides random-access per-block string decompression indexed by
(block_id << 16) | sub_offset on builds where liblzma is enabled without
libzstd or zlib. On x86, --compress=lzma shrinks pmu-events-string.o
from ~6.90 MB to ~819 KB.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 51d44550b0b0..293c6ee10e60 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -238,10 +238,54 @@ def _compress_blocks_zlib(blocks: Sequence[bytes]) -> Optional[CompressedStringO
   )
 
 
+def _compress_blocks_lzma(blocks: Sequence[bytes]) -> Optional[CompressedStringOutput]:
+  """Compress blocks using stdlib lzma raw LZMA2 streams."""
+  try:
+    lzma_mod = importlib.import_module('lzma')
+  except ImportError:
+    return None
+
+  dict_size = 1 << _BIG_C_STRING_BLOCK_SHIFT
+  filters = [{'id': lzma_mod.FILTER_LZMA2, 'preset': 6, 'dict_size': dict_size}]
+  compressed_blocks = [
+      lzma_mod.compress(block, format=lzma_mod.FORMAT_RAW, filters=filters)
+      for block in blocks
+  ]
+
+  decompress_fn = f"""static bool decompress_block(const unsigned char *src, uint32_t src_len,
+\t\t\t     char *dst, uint32_t dst_len)
+{{
+\tlzma_options_lzma opt = {{
+\t\t.dict_size = {dict_size}U,
+\t\t.preset_dict = NULL,
+\t\t.preset_dict_size = 0,
+\t}};
+\tconst lzma_filter filters[] = {{
+\t\t{{ .id = LZMA_FILTER_LZMA2, .options = &opt }},
+\t\t{{ .id = LZMA_VLI_UNKNOWN, .options = NULL }},
+\t}};
+\tsize_t in_pos = 0, out_pos = 0;
+\tlzma_ret ret;
+
+\tret = lzma_raw_buffer_decode(filters, NULL, src, &in_pos, src_len,
+\t\t\t\t     (uint8_t *)dst, &out_pos, dst_len);
+\treturn ret == LZMA_OK && in_pos == src_len && out_pos == dst_len;
+}}
+"""
+  return CompressedStringOutput(
+      name='lzma',
+      c_headers=['<lzma.h>'],
+      compressed_blocks=compressed_blocks,
+      extra_c_decls='',
+      decompress_c_fn=decompress_fn,
+  )
+
+
 _COMPRESS_BACKENDS: Dict[
     str, Optional[Callable[[Sequence[bytes]], Optional[CompressedStringOutput]]]
 ] = {
     'none': None,
+    'lzma': _compress_blocks_lzma,
     'zlib': _compress_blocks_zlib,
 }
 
-- 
2.56.1.703.gf848ed807c-goog


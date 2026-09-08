Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B05505C8;
	Tue,  8 Sep 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879082; cv=none; b=aZU3xsGdgx1WSbNgzDJys1rToq9LqX1iAwsvM6MJugDDblHsJtXJ8f721efAWvPowXKCtVIy7TdvIkVECbKViHGnyoOTOGGAwRtq9r14iN9H9gxv0OU6Biql891yCswE4PFS61ZtZKPDyWoa7AgLvdy2OTIa2hW+RWcFX3Ky2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879082; c=relaxed/simple;
	bh=Nfk9JEwo70bwHGDlZdjGP1hRIyqKW1ZZjVz0jUb29eE=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=r7XCxVoimOqYH6jnfm2flyGren5DLaHQ95vl2sgmCxJk41cTPSPzdKsv2qomHU4Q4CqNkR5wmuIitM9GNpjHSL0dMPAoReXsOplpuTT41qe4zltgs0SPeGiPXbMYAYTvs0uoxVuRhea/gsWo+HhHNZOKhd+7ShZbXPboNghvF1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hfRhN3tHvz8XrrJ;
	Tue, 08 Sep 2026 22:51:00 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 688EoqNg024546;
	Tue, 8 Sep 2026 22:50:53 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 8 Sep 2026 22:50:56 +0800 (CST)
X-Zmail-TransId: 2afa6aa020d0d0f-60043
X-Mailer: Zmail v1.0
Message-ID: <20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn>
Date: Tue, 8 Sep 2026 22:50:56 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <thomas.weissschuh@linutronix.de>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvMyB2NF0gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXgsIHRpbWVzdGFtcCBhbmQgc29ydGluZyBmb3IgdG9wIGxhdGVuY3kgYW5hbHlzaXPCoA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 688EoqNg024546
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 08 Sep 2026 22:51:00 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA020D4.000/4hfRhN3tHvz8XrrJ

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Previously delaytop only showed average delays. This patch adds:

1. delay_max fields to track the maximum delay value for each delay type
   (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
   per task.

2. The -t/--type option displays only the specified delay type with avg/max
   values side by side, allowing focused analysis:
     delaytop -t cpu    # Show only CPU delay with avg/max
     delaytop -t wpcopy # Show Copy-on-Write delay with avg/max

3. Wall-clock timestamp when each maximum delay occurred, displayed in the
   MAX_TIMESTAMP column when using -t/--type option. This enables:
   - Identifying the time when a process experienced an abnormal delay max
   - Correlating delay max across multiple processes at the same timestamp
   - Cross-referencing with logs, traces, or other metrics at that time

4. When using -t/--type option, tasks are sorted by maximum delay value in
   descending order (largest delay first), enabling quick identification of
   top N processes with highest delay spikes.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

v3->v4:
[patch 3/3]
1. Fix ReST syntax errors (indentation, list formatting) that triggered
warnings when running 'make htmldocs'. No content changes are made.

v2->v3:
[patch 1/3]
1. fix get_field_by_name() MODE_TYPE filter breaking --sort for non-type fields
2. zero-init stats struct and cap memcpy size in netlink response parsing
3. fix compare_tasks() count field read as unsigned long long for 32-bit safety

[patch 2/3]
1. fix 32-bit time_t overflow check to use max representable value instead of (time_t)-1
2. fix gmtime() pointer aliasing by assigning timespec64 tv_sec to local time_t

[patch 3/3]
1. fixed Y2038 overflow false negative in format_kernel_timespec()
2. switched to localtime_r() with stack `struct tm` for thread safety.

Wang Yaxin (3):
  delaytop: add delay max for delaytop
  delaytop: add timestamp of delay max
  delaytop: sort by max delay to highlight top latency processes

 Documentation/accounting/delay-accounting.rst |  87 ++++--
 Documentation/sphinx/maintainers_include.py   |   2 +-
 tools/accounting/delaytop.c                   | 286 +++++++++++++++---
 tools/accounting/getdelays.c                  |   5 +
 4 files changed, 319 insertions(+), 61 deletions(-)

-- 
2.47.1

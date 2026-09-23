Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E531E83D;
	Wed, 23 Sep 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168544; cv=none; b=X/U6lcfvLyncn4QZ0c+yXCTRCLjFtNtpszNY/bVw5gpXWVI/UZ9aXd5p2K7VGTfCbyG7c3WZFUzZ7Hkvsn+Uj0xQH6sSlP9x9NpXb3SOUQ2+6BUq/jIX5m/glh3X30n07nGmX+axafQdprFw0uFiul7RpKx4/wbb/lPWeKBLvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168544; c=relaxed/simple;
	bh=XEOfB1kL8PtYnt4jlP2JmakvYfU32mkSz0b6D53nEoo=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=NlJOhHrcC5663VusdGy8RniCls0NSGS0TimbWAL8LFNavJzMnbmi+j2uR+wKPTYHEuh3hDD+Ij7GYbmSuaBKtONaybThRkdzE7IlKdR4492KRrYNJtbk2KAr3Nc/8Dd9xo+h1z0xscvXG2WRdqbVbEOUJkiIjJ9pc2BSLBX3k8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hqcYv3zLMz57fK;
	Wed, 23 Sep 2026 21:02:11 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4hqcYk0dNzz54BgW;
	Wed, 23 Sep 2026 21:02:02 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hqcYX4fxhz5BNS0;
	Wed, 23 Sep 2026 21:01:52 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 68ND1jlZ041096;
	Wed, 23 Sep 2026 21:01:45 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 23 Sep 2026 21:01:49 +0800 (CST)
X-Zmail-TransId: 2afb6ab3cdbd8b2-e27c1
X-Mailer: Zmail v1.0
Message-ID: <20260923210149015t-X8AvGrXfHE4PDn9gZOM@zte.com.cn>
Date: Wed, 23 Sep 2026 21:01:49 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvMyB2NV0gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXgsIHRpbWVzdGFtcCBhbmQgc29ydGluZyBmb3IgdG9wIGxhdGVuY3kgYW5hbHlzaXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68ND1jlZ041096
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.35.20.165 unknown Wed, 23 Sep 2026 21:02:11 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB3CDD2.000/4hqcYv3zLMz57fK

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Add delay max, timestamp of delay max and max-delay sorting to delaytop,
which can help quickly detect potential abnormal delays from a global
perspective and locate the top-N processes with the highest latency
spikes.

Problem
=======
Delay accounting can track the average delay of processes to show
system workload.  delaytop provides a global view of average delays
across all tasks, which differs from getdelays's single-task
perspective.  However, when a process experiences a significant delay,
maybe a delay spike, which adversely affects performance, delaytop can
only display the average delay over a period of time.  Yet, average
delay is unhelpful for diagnosing delay peak.  A brief but severe
latency spike is averaged out and hidden by the average-only metric,
and the top-N list sorted by average cannot identify the processes that
actually contributed most to the delay peak, nor provide any time
context to correlate the spike with other system events.

Solution
========
Extend delaytop with the delay max, timestamp and sorting ability:

1. delay_max fields track the maximum delay value for each delay type
   (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
   per task, recording every delay peak since task start.

2. Record the timestamp when each maximum delay occurred, which is the
   same capability as getdelays but provided from a global perspective.

3. The -t/--type option displays only the specified delay type with
   avg/max/timestamp side by side, and sorts tasks by the maximum delay
   in descending order.  This highlights the top-N processes with the
   highest delay spikes, so abnormal delays can be located from a
   global perspective and root causes pinpointed by correlating the
   timestamps with logs, traces or other metrics.

Use case
========
bash# ./delaytop -t cpu
System Pressure Information: (avg10/avg60/avg300/total)
CPU some:       0.4%/   0.2%/   0.1%/     220(ms)
CPU full:       0.0%/   0.0%/   0.0%/       0(ms)
Memory full:    0.0%/   0.0%/   0.0%/       0(ms)
Memory some:    0.0%/   0.0%/   0.0%/       0(ms)
IO full:        0.0%/   0.0%/   0.0%/      12(ms)
IO some:        0.0%/   0.0%/   0.0%/      13(ms)
IRQ full:       0.0%/   0.0%/   0.0%/       0(ms)
[q]quit
Top 20 processes (sorted by cpu MAX delay, largest first):
PID      TGID  COMMAND          AVG(ms)  MAX(ms)   MAX_TIMESTAMP
 ----------------------------------------------------------------
9         9   kworker/0:0-eve   0.59   16.87  2026-05-27T13:32:39
30        30  kworker/2:0H-kb   2.87   11.36  2026-05-27T13:32:36
27        27  migration/2       1.05    9.51  2026-05-27T13:32:37
50        50  kworker/2:1-eve   0.50    9.13  2026-05-27T13:32:37
15        15  rcu_preempt       0.11    8.98  2026-05-27T13:32:37
1         1   init              0.17    7.12  2026-05-27T13:32:38


Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

v4->v5:
https://sashiko.dev/#/patchset/20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn
[patch 0/3]
1. update cover letter to state problem, solution and use cases for
delay max, timestamp and sorting series

[patch 1/3]
2. fix -t/--type output column alignment by matching the row AVG/MAX
columns to the header spacing.

[patch 2/3]
3. fix Y2038 timestamp truncation check on 32-bit to handle pre-1970
timestamps by comparing the max time_t value in the signed domain.

[patch 3/3]
4. fix delaytop ReST literal block indentation in delay-accounting.rst
to keep all example lines consistently tab-indented.

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
 tools/accounting/delaytop.c                   | 289 +++++++++++++++---
 tools/accounting/getdelays.c                  |   8 +
 3 files changed, 324 insertions(+), 60 deletions(-)

-- 
2.25.1

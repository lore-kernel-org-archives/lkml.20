Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702084;
	b=30oZWr6btFBNoXTJ8HHDTL/PNzsPT7OdsnIXbqyvWxsYahmOEiykNpD7AOsbIHByZVPo
	 GMxPFKR6eQJamSnXNXzZIZYGwao6/tHTvyTykNC/kTBs07ngaXMwlNyd20IAR7CLOtCSt
	 QBJya+6Tzu6EZ2Q/GQL0ZtiWvirp8EeEKTdfH3OOeVKdnD2hB25To8gPXL/hcpbr94PAd
	 YOYNsctB2y0ohSqGGpXeUmaclpGrXwZNmpDoNkkI4KftHe4dy275JtrOsEkNCTDpMnbWX
	 SKjSSCcAwXyPbTcaHYAlwA++hDuHfpLbp/S1fcLdq2ajhyaQt7id9ap0NZYz32t4ILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0xH/WrIOIK17cV/BjXX0X0kNLTBo9mg0Ue7IWYiwnqM=;
	b=KSar3hA7lbrQ+vN7FJzh8gM0wBa282l3aEb6K/JnGzalLySRoRt9trOysG6dVnQNV/WH
	 mzBoMUxj8gydqzlGFKxWuwORoQDEXWwNDhMeI6v+VoUvyzgjOapELZ+YLB/GHx/27BypW
	 +3ls6/ErcvlLypqR1fNPb+Avj3huCywJtKw8UChTr9UOpeEPoYBNG7dlV9r+sV3LJ67ER
	 W4vgyuKCa4z4+NKW5g8RJdOzO93xtqtbrLhgSYhQcgkY7mXg5Y6Dnto/Aturex86gDChK
	 Jg/Qd9iBGn6lRtM4UGsYth6LBxdbVbPJgjZjU3PLDW/kJkicv1v5BJlrXroeHSwZNTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsrxJG2m;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF0607E61B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30EF0607E61B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsrxJG2m
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so30091475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702082; x=1794306882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xH/WrIOIK17cV/BjXX0X0kNLTBo9mg0Ue7IWYiwnqM=;
        b=zsrxJG2m4RO7ZVyKTDYHpme0bSX9Bns3Uejrsht3vzu6hlkzQvwpOo1mcvzuybNm2P
         wIBxoEQ1g9LrZIrFLK10h6Ub92rtorX6Ir+mMJPyqsnk+aWn/lN9ol2ZyaGaDGKOC+Fd
         2tiTUYBBTfYssv4+E6CD+Nue+Hyx6H7PG9GaFfhY+4y+oxFlInUaDXO6kyQx+/RAUCFx
         cL6e5l3tzvq19v+c04KBxhh0mEf9hu8nBmSCabnzBrUAvEV8M0t8bPYnc9UrFpDpQ8gj
         9ScyX5uryqYWy01vP8Lh4+qA/d9Qjy4+xdvGiI7oKc6CqQf7z3uesYOw/r65t/bPWbS8
         HcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702082; x=1794306882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xH/WrIOIK17cV/BjXX0X0kNLTBo9mg0Ue7IWYiwnqM=;
        b=q8Kzb4YYN/NVX3QUEODsenmsCU9NSjxJMFwFIkuumiwr/Hi6mmrmV2yx3Lc1Dxwkca
         MbF1pQVOLJ12f5/AlJSTGo36UWSRWB3AqTPdobXhV8URoDa/LeoOh+qO3hu4m6ufp3Fu
         oNV9eeIWQr+7bweYIDwxNvGFV+rbbwFDMiSYt8WB1UMIi5abn8iNUxNspURx+BooodYZ
         uvsLXZvOjRsIoEhsOkUJALzuub3TlW1LgdTAucOUOmtLohRaxUE84vtOFiUX2/q+PLbz
         dqF00AxBzmMherDpm9fiL5ET5q/pneWC37R15RWR0Ngiuc7IkUOh3p2aPvI86DHVSfcW
         TZ2A==
X-Gm-Message-State: APuU4Z8iiBasRCsBvg1F7rTQIXUg4BkhjhI3711NypiItNN6cHrVT3UN
	61rAiiiW30HIIyHdj6/wULM0F7dQhb2OiKSCJNXRihrq6fC5jOCoENHP
X-Gm-Gg: AYBFou2P2Sn0y5HfmgGXlYyWdMEhH4TfFmqqwlqme1H1thUqe46E7m19onoIZABECq3
	n2aOatKbHXw/t1Tpes7Sh/SjQMdbuOXD9eRvZAjXnkNj2eRvX5IMvHgpc1qa6U0egQrevFapuol
	iLEiLFh5fcAtRWHRYmOe/+zqrfFx834PKzeXcj5ttE+K0mxVEa6BX+mQo8a2Ibloo6cS2lSA6b7
	raMDCGIVCK7lOb1PpGrLIvr8oqNhTSyxwkDU1hd4VjoxrbzdqJd/YI5wzgOx6/gJvJDC11CTjdK
	Kz7HIzPWgMwNlA1hpzryro69o1lDGOGgT0rz5SgDYQNWguQsfKNKyhfuUNnhqqsRo0ZOsOVcyXl
	1+RshUQdwu/TUWNwFOWP4qZ6aPGVi0VpwVASeV141L0SNxD5Sq0shzOzFgIxBLXl2faZZXjW/Bb
	xlmkPUVeWMX7Ivk7d+yEVEhM/Gcgt4foPnTD0SOM3jIt9jBcnC6H6EUkZ+vwA3wjfufQ7sBbUil
	l1rptlzWT5DJ22LFr0rEzTRjSeQGGjjTtGOwlLLHKDqoVduf/e0zkhdryXTbdB48UUmGojSWHXk
	jCsWxIhHlGaRyrWO7PuzuADiKKMod5mxo2S808Uh7S8oQw==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr306794485e9.17.1793702082418;
        Tue, 03 Nov 2026 02:34:42 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4745:6c00:3cda:8d8e:309a:f6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm223581865e9.1.2026.11.03.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:34:42 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] timers: Stop hrtimer queue traversal after seq_file overflow
Date: Tue,  3 Nov 2026 12:34:39 +0200
Message-ID: <20261103103438.2154751-2-thnkslprpt@gmail.com>
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

When /proc/timer_list overflows its seq_file buffer, seq_file retries
formatting with a larger buffer. print_active_timers() nevertheless
continues scanning the remaining hrtimers, restarting its quadratic
traversal even though the overflowing attempt will be discarded.

Stop traversing at next_one when the seq_file has overflowed. Preserve
the SysRq console path, which passes a NULL seq_file pointer.

In a (virtual) two-CPU KVM guest with 2,048 timerfds pinned to one CPU,
median reader CPU time for a complete /proc/timer_list read fell from
51.1 ms to 14.6 ms. Repeated tests showed no material slowdown for
non-overflowing reads (13.7us before versus 13.8 after). Short reads,
seek-to-start, and SysRq-Q tests also look fine.

Fixes: 289f480af87e ("[PATCH] Add debugging feature /proc/timer_list")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/timer_list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 0406bf4488e9..84275b6cd2c9 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -64,6 +64,8 @@ static void print_active_timers(struct seq_file *m, struct hrtimer_clock_base *b
 	unsigned long flags;
 
 next_one:
+	if (m && seq_has_overflowed(m))
+		return;
 	i = 0;
 
 	touch_nmi_watchdog();
-- 
2.43.0


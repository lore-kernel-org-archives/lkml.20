Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755710;
	b=XvwZjDhjra97otChLfdCYL1ZotBmbjsStEeS8bhf0VHJuo23Kc9xzZRfyxRv8J9OoM1b
	 WVBSLwqFcUfVDa1HFsG3FWjaLlpKgda5PYL6TgF6xpXnkdEF7sSfY2mEbf0GDqrXCU3Qw
	 c41BX7/AJeFZRRz7XU0l3k6vnA3nYQNsKDw3l3DqRGHEczhGzWrFsB3BEOn4G6eXhcVxg
	 uSDtY59QzlRkTuWt/CnYRZdiSwMuX/FEfikfcVDgbhuYDQjZYfptnKrbEwwG4u+VJMeqp
	 ivVgJklNPzBi6nidL3Jrj+9DjvgEMiS+a+My+tbScS0Q/IFQvTFsd5a/y75IA0bMHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cZkFsjybWyp8PjTu67kBKwCmbR0V30VjwyOw+3AeO7Y=;
	b=vFffw+9WkLpk/mxvFlyt3LARSncyuPrUh0SEbqmwCS5jyrBgDJRnbOMDZR9YGrXSU0lu
	 bT5Ku2bGmWv5JPR+sysbhQx+6kjjbr0Z12bF9aK4fL+PP1xG/Lv/414eg2oQWMPOehhQX
	 fbRsjgANuPS+6GV9F057MsT4je+b/o2uxZ3x0uuiDW0xh1va3P6jyk0uVDw1By6rttb9x
	 enTPSDJxnQ7IeyFnJwMdyGlqWcVOtTzkhlJHnlZUhBanMx+GHaJFoGroXUGAByi2+zwX0
	 VrvXhcLvFpTpYGEo9xXFIYRreWcTYDqNO9Al8YCm7ALrRJaomO/KuRzRgsLbsrS462g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6lgTjbT;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBCA606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBCA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6lgTjbT
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17291125e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755708; x=1795360508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZkFsjybWyp8PjTu67kBKwCmbR0V30VjwyOw+3AeO7Y=;
        b=C6lgTjbTuFvJPGz8jzpXUUJRfmN9NSfXOISzs+mHebQZT62v7AzFvnXxNtqcPaGz54
         ZI5GWWr+rFmAcu25SHHkptTUgknZ6BW1GjiQqJmZrW53OZRZiqnYEdZPPVgI3lUFXHD/
         llWtXnRCZCnDavH1+HRDZLEbC9q6CTLKN0mx4XDzoy6nxQaUpl6bhmB9ijx3qdhutPf8
         xJ7kgcY0n+TEq0S3P+wt9xpXtbElr+47EoMjMgZRHtu0BR4zWcT/HEBAohLlV2BxF058
         s7eOwREPNIMHus0kE77EfOY6bOfz0zXuzBtgUn1ExS1vrsICJQYgYQGcgelF8FjP511S
         0yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755708; x=1795360508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZkFsjybWyp8PjTu67kBKwCmbR0V30VjwyOw+3AeO7Y=;
        b=BgUaEYQDicNrvcsRIfeQzZl6cLFtuiG6Ywf1VS9DnQ0ZwraRVtfHl/ClRdTx5vqY1u
         1E0TbGXkzMOw27oCKWzOFcB/tHW16M2u6IA3eiSjIUqOlxP1kiuDTWpQpCDqnD9pBz3e
         bkjlnQFzE9j76Ec7yxeoZQrHwvtLQ6352rG+0L2adbl0Zq1d0XIY269hx031Dne9x/kn
         3/gzNnDCTDGg9nSmyAxXKMAvMBI3kWLVNWNE0FX5WhbtOSWqWJkf5uzAb6yEv5Do1JrD
         hDlYyAaMESewchdHYQhx+QwhfrBVV93wr4OSwLmwgeX0v4fNiI6G6bxBTDJM+9vHJQff
         iGiA==
X-Forwarded-Encrypted: i=1; AL+hErGf7Tbirc7EIF2Q392Gug9pE3wgprrhiadA9V1Bk90Fku1mBk7WHZklSrn2fH1eQP8ThZlkJfNyU6he5dI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A7LZMSiIjbyqeMEy421Cw9toNyVFVxIVdI8EAnHAC/qzAZTMN
	JZd/4g655eRZBPm7EmBpkmpAYPc03LKbkx22HknZrxfoii17IHi8yCUQ
X-Gm-Gg: AYBFou0+q0gfRRDZYT03m4+O2EXgXgUjWfLBG1OjewsIYu61xUwnOtX0wI9aybyUG+k
	bnjqtO3mURqjW4u2f3F4n8yyoWhBF/btoNelBHY3pI5UtunLWYmjRzTboPJrmCneCYDgh4Ewqbj
	+Lhc9Q0foOOZwP2cC+jZC3UEB4Y/PbtQ8uJ1Wfl07s5vVK6eNQnDCZtxOjZ/NoOucYo/q5wKdws
	25srrOPlkYY+7oixvo4IpjFxgLuPnkXJLrX0NhK6FcCnS+lRVJMgRGH6Ir0GQfm50LXEhMkQSnD
	OAoBRWrmT+VXcYjk5+kP2PMob4GUKo1uYQs4YyOH9jhh+Cp0aS8lkWvsijr1aAFwQNNFn/abaeJ
	2BMdHTqYczjhNmcGrDQEhLD6iV3oHTG9AVvetAWTitSCubNGQpww6d1xCEQVbh9baY0yCb/iOAy
	uZIFCabQhqstm5u6/kJ56hgP/1qesiokPppg6rJjWq/KknQUfUUGCD8n/m1hUtURO4v2GmSwJ4V
	5OCi2e7rWAJnvQZfdzuPjo8v0hrms++5Mvae8E1kAODQz705ft4s+/aCf9Xb8r06e3jtP+y7Cv1
	2nDAa9/47jAEt2Fwhy4sToHmle380GXlcQ==
X-Received: by 2002:a05:600c:3d92:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4bb559f7044mr167377585e9.1.1794755707706;
        Sun, 15 Nov 2026 07:15:07 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:474b:1700:f61b:bfec:b5f1:a453])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm14556419f8f.19.2026.11.15.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:15:07 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: peterz@infradead.org,
	namhyung@kernel.org
Cc: mingo@redhat.com,
	acme@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf/core: Accumulate lost samples in inherited group reads
Date: Sun, 15 Nov 2026 17:14:58 +0200
Message-ID: <20261115151458.258097-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

`__perf_read_group_add()` accumulates event counts from inherited
child events, but overwrites the `PERF_FORMAT_LOST` fields. A
child reporting no losses therefore hides nonzero parent losses
while it is alive.

Accumulate `lost_samples` for the group leader and siblings so
group reads preserve losses across inherited events.

Fixes: 119a784c8127 ("perf/core: Add a new read format to get a number of lost samples")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 457d75ea7142..165eb55608b6 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6163,14 +6163,14 @@ static int __perf_read_group_add(struct perf_event *leader,
 	if (read_format & PERF_FORMAT_ID)
 		values[n++] = primary_event_id(leader);
 	if (read_format & PERF_FORMAT_LOST)
-		values[n++] = atomic64_read(&leader->lost_samples);
+		values[n++] += atomic64_read(&leader->lost_samples);
 
 	for_each_sibling_event(sub, leader) {
 		values[n++] += perf_event_count(sub, false);
 		if (read_format & PERF_FORMAT_ID)
 			values[n++] = primary_event_id(sub);
 		if (read_format & PERF_FORMAT_LOST)
-			values[n++] = atomic64_read(&sub->lost_samples);
+			values[n++] += atomic64_read(&sub->lost_samples);
 	}
 
 unlock:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


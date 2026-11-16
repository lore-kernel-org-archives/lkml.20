Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816862;
	b=Jm32PlwEjBiWNgk/MWH6Jd1rAQtkMWF7JFDcBKMWufgfwBH+CFGbH1FVqz1o3PhcDoJi
	 bkoBofDEgiT9DWOdfo1uPB5LfQ8fHjRnJHHurey7C8ewfNACXoE7lDPAnP4oBtDamrp+G
	 sD2b3kjhzXYU5U1HlBVt7r0lIaAjW2Ao3qpoevCvchDvbbCLTMo1G1t2kEioLi5NWhVGE
	 X83yDUQsNf7LmdXETqHZhHW5dOoQmj7A//FZG0/Hu/dYhupyR2wFuzPWXAcswKTQ/bgvX
	 XBr2ZjLUDIQL3bntFYc/K7lbeced6oQ2q1cRX8oOqUoji7tX9Tv1MCchnVJ0yXAMvjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bKgCjEB/L7NjUFFwv+JmT6TUn26DjOLxcRu48u5oJDs=;
	b=YpaIcxJrmHmHBgbIaFVAl3BWr+i8XyhobGfEmtgH295HtR87+RABrioN+3UGC2sDZKjf
	 bZHYcYtLWw3AAD4H1MgMxEsKaQ7sPUqxwPyntK/G0DE/qvk92UJyJSgBKloVmLozdwjDs
	 5L8sM/VP39or5jSvrcbGU1kzq5jt+kHmcSzrcY5Wg+tUhEAU09NwfX8LaFY/eeYGuYn1y
	 GMe7Q9JAm1NUv5n2WgWaYzGZ8Ph6hOYuIm5B8MD6xrPQqhx7QxvXjptRHDN1YKr5mXvAR
	 t35a6CidmAkge1RcvYxeOS7UhrKkqQxAZ/L1oWu+BOH+QQ3yhinTY3etrwDk5g/Prjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=N30RaGbt;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B8606A8B5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3B8606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=N30RaGbt
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1544166f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816860; x=1795421660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKgCjEB/L7NjUFFwv+JmT6TUn26DjOLxcRu48u5oJDs=;
        b=N30RaGbtBhTAcpWoQQYzskE7xXD6X0Yf9EzOSIZ57NGyRnFGSYnM8rPtwlYxX5qp3j
         xJkjeOEAQr4ViRwNh9twbq9bV9cG+Jv/8mbdarjEn3H3gaRtMvLwGkTJx8Q72uBFmaLz
         i6b7v0DDwS+Y04VmRRbigcYiq/LSYhTs5j+pFwl/J/7wVAusAQFlAcMGzF6ym+176pSs
         Oh3fuQo4weS6M3O/jEkc5f+DmLqGcH2wRmNiixGGvI3pH2+E7Tox3fr626LPul+ABLqG
         5+Wu+RNqvzp5b6fOK/3Z+KHE+nS5f4HqhGqstOmsmPLAm4mhxDbyD6t8I5/6wfOc9Hee
         S8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816860; x=1795421660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKgCjEB/L7NjUFFwv+JmT6TUn26DjOLxcRu48u5oJDs=;
        b=vwilEqeRDExC3bxJAZCEaaTuqHZ9SGWwZz708M9mxmyQiAJOnWfksiwJqAjqkYoS6j
         2v7rT5yNYQtz9GTJQNcDghGnz4Hz2elsZR0u41VwJ05GydtCeYI19Jhp5jF2anSUeML6
         O58/q7j0gukR8qPKz7CiM04Y+8aliNycGVNBgGsDnGaNOV/hc38KRft1U4ZgqYkm2uoI
         Scwha9wUQXGzROlNeOHKg/+6261QrZO4BNa8WpfscsyelPIo85D+XA8yRNyQRvIJ7WR6
         PnoXSSc2/9uKowMEqcoCBZqr/R6d4llm6XpAXRhUUlm4bPQqbcZhaX/n7+mGApDVFhy5
         lKGg==
X-Forwarded-Encrypted: i=1; AL+hErFTBqSh3Eshf/AN4ah976C/Z8p0+9ZHB021sSs4sa/asi5n3bv0CcYzdawmz2pDwpf4lIW4oKhxO3A3MHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//DvqaQVGFh812SuljBe1/c1wBqdCHj407CmKc9417ok0PE/Mh
	o9loRxLJ3MXA2KE3LYyt3c/SDR0jPg4/uwbnnQgEhqyizv3jEgSt5srQ7NnYGiPef08=
X-Gm-Gg: AZFdTZemxWAPaHMTcd024IoztrYPjbp7LkomQou/32hJsd9R5hb5dQrrBoG1ad3j1hO
	z+hwo+7TnOQj1YL2vOYt3XVbFaE2nhsrdjsfVOeXHNtxUKj80uI8K/f6Y87O8TejOUkSrSSE5S3
	Q1NlfSFVZnEF9fbRdTUs0ZqkJcQRYEDfgMmOkANxqOJVcJLhmO5KUkrKjSpgUg+T9J03EFjxG2Z
	Nyk/h8cbzsNriMHwNkgAsGaTzSAsMO1KfrZe/0QNBnFwiykzUZFbRXE3WX4kmmDSg7a52MvhAYG
	oy3Qc3zF6gIOhUeEF3/unQKzoe7pgjEiAHkk+tdHeLeUIc1U++HYwg2Ud3MaD4UnsbY4YTIGP9O
	Wfw2qJmAgjATJGUjVjbQ0qS/fuSYJEITV98tPdaK5E/5WHIv4G4VKi/xNsZ95q0zsYQxcIixv5E
	x7HDL0LqSgn/gYzDd56VnXYoCrjKybCjx5lQr3uAnZES5dj/tWJVchmGMT4F0M2/s4bkqvObrpx
	a3RtHRkks9lInryYpGm91jKOmf9fmU1m2mrRfTfvLb4tXtQcq+eEMizTzsST9R7AaW4mqupL1x2
	+oQ5P3S+hLkLQiTHULS57cOXGoSUWJDTfnYZKFRIi6utewxGXfQIvQbpMVLxOy26IXPvya+k00v
	cOTcu7A+Dny1EWdVvK8rp2QXKJIY6
X-Received: by 2002:a05:6000:22c1:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-49c6fc9e5bemr21910324f8f.4.1794816859538;
        Mon, 16 Nov 2026 00:14:19 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22902289f8f.11.2026.11.16.00.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:14:19 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v3 5/5] mm/mglru: reschedule between memcg reclaim attempts
Date: Mon, 16 Nov 2026 09:14:03 +0100
Message-ID: <20261116081403.216452-6-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116081403.216452-1-max.kellermann@ionos.com>
References: <20261116081403.216452-1-max.kellermann@ionos.com>
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

shrink_one() can return immediately for empty or protected memcgs, and
try_to_shrink_lruvec() can break out before reaching its
cond_resched().  A scan through many memcgs can repeatedly rotate
entries without giving other runnable tasks a scheduling opportunity.

Call cond_resched_tasks_rcu_qs() (as the existing shrink_lruvec() loop
does) after shrink_one(), while the memcg reference still pins the
cursor and before reacquiring the RCU read lock.  Also call it between
bins and nulls-marker retries, covering scans that skip every entry.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6b7c9f118e18..a0d76e5a10c0 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5400,6 +5400,9 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
 	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
 restart:
+	/* Yield between bins/retries that contain only skipped entries. */
+	cond_resched_tasks_rcu_qs();
+
 	op = 0;
 	memcg = NULL;
 
@@ -5430,6 +5433,14 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 
 		op = shrink_one(lruvec, sc);
 
+		/*
+		 * Empty or protected memcgs can bypass the
+		 * rescheduling points in page reclaim.  The memcg
+		 * reference pins our cursor while we yield outside
+		 * the RCU read-side critical section.
+		 */
+		cond_resched_tasks_rcu_qs();
+
 		rcu_read_lock();
 
 		if (should_abort_scan(lruvec, sc))
-- 
2.53.0


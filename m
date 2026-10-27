Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085048;
	b=Ifor510/ZyBkrLqOYJgrMntk7zaw7H4OPTaNrakwYX4ndrlctVAdhAJxtcN/kP9Soh+y
	 k23BxRhJsEpDZ+q+mYvzDTVpzWB7tWyhL5VbZF3AQS6GCBRj30AOeM876G9pyzFVTEZte
	 hxeqCfy3zPcoUCL61bpz1Y8dB+fEj6B//T8TH5MJk/AmJENDiH2ECHXaC52vCp/FJNRX7
	 b4wyqRpUWD7QKsrUnAuUmGjEnghVWomr0TvGCgM7TsmYkgoUq3iufg0onIy8eSbY+kTFI
	 7He0F+HP5zJm746k3qcI8Nq4xTf9JlxhSIat530STPA28Afqnq1NwnqWcq/9SuyCo5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s86LnAWFmWP59VgheQcHJpguzX26fuGNoKB7W+R3clE=;
	b=Ao/oPfEM/lBvfRHQxbGoYMw1tQyCzBcQoxKJ8RJmy5LWWNnpaw19adp/tJK0YZlRBOhc
	 YDEj7NEOICNIPdw8eTdrLnJuDwUN6yjKtMp0bawhcw3uaEgMrrLzS7xAIhBMRiTHC/EK/
	 Eibq9inAoWwZUaAjTm4GYcbW4gUEMlU5droHoDDNmqOlq7p+nNfqB7Iu2CU+P5JNgIfT0
	 vR0ZPpnBcKyeNbJgygubQ1YRHS12ogtKx2KRQB7jw5Ek5rWluhV/uSFbb/PUG+kGLxwpo
	 2ORuD0o1GZsvRRN0uC3DDCOvX2BTWzOACIdRjWA1oM/03/v9u2K/k9DP8EqL3GMUElw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWAEdlFC;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C0F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWAEdlFC
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd69954c755so2533648a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085048; x=1793689848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s86LnAWFmWP59VgheQcHJpguzX26fuGNoKB7W+R3clE=;
        b=DWAEdlFC3+yN2oI9TavrfsZxuJTSD12sq+7ZpsG+Gs7zHAGEe82AvbQTGBQvDK4PJK
         Lsuz+xxHVk+6NC+QsqQrqjUmDKGPJa/MLocM69v1lXQDeZZ1ulMmcJQSQ3YsY4rTiQ5o
         vGdBUmnP4UyH/hxj9OlnRfGmd9eqKwgzd6bBksPiU5xoeGpuKeiGfvsnzBdfjBZD8vjN
         sp8CW8cmgnI44qdfr0JPNNH4c67Xmhp6o3AoGxjI0Kkvj9Qq3gAS8r3UQFNGaUIUilDv
         rLxiXVRvHg8jGIXQoB/+0W3Djuaasc83juJbNm5T31TBxNHnHu09w6GCg1ZUbUd9Hino
         NUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085048; x=1793689848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s86LnAWFmWP59VgheQcHJpguzX26fuGNoKB7W+R3clE=;
        b=EfIFEpKXwgJ9ho97aXoPHPNXdbwrw96r0eIRAoGqpC2HT6msQ67e1KrVLQK2X36JZH
         0XoupdtIs0gHCxOkgO3I+/nCNcNJtpoyJGs4cI7Nhk4vKw7miTJFTDJ3rFVDx4L48oHe
         MFpgXh5rinLw4WhgMZWSG/XeBrt+Hbn3qc4O7/U0zQxSesCH8QxwZfVWJ7DIlsKvMAG0
         K6ybS5a0C0xpFON147bIv113rHrX0MxoKZzx2P4A2n90aRkYU+ll7iuN4FJE+1id+pJU
         uhKeRbfaXNdgytkeMcW4O2qCbVv23t7Aiq0eJS9jhJxQ8NHA4liYI6mGX2h358wzo3QX
         /TPA==
X-Forwarded-Encrypted: i=1; AKwUvBzEkjSN3ihtzSzc0WSzWHhzgeUN8DxHQbsPNV+ZDJaCFiRC+sWa/ocWi+gsESWEbzrF3FMMUzn4JijAgdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYnxja8V4/DiLnZAjKcAusdM5CVN/SJbaWOJy78WTGOva2gfrj
	uUyDZcDCxQ0FntK+CjWcbbMHtDmj3gcUVc9bQyIrXnThR9OlMMIalV0P
X-Gm-Gg: AYBFou3Sr04VhU6IXnAWzkr//xX8MXAnnt4IMQQQyAoKa0SwzIs12zxUScxN4k45i5j
	a7FGWPmTqp3AcIkmiyohuvxMvRyhxC9I0p+fHDrdpT5v7Dc1CL1d/BoxnXlljxkhU/Oi3knxHaQ
	ACpSxvERXI3HgGZV4q7wg3Uz9DbkApo01r5H5E7PqJES722DzDW+DT2aKZx9DB9rvEGnT2iVntX
	Tn6bQWWiNGBbU5JANdYEbf6Th7A61aQS7/oCvtze4O7y7CkVolYEoAi6BuT1IgSTL6hmVoKZ+e5
	g1a87NzXQA+dzM1kfv3YZTKl7lJq6fFtI4iHzISMX+YWWdYDgkZwHlZ7QZuG8HMfeyJlNcykdt0
	+0Jxt7IVkYwvr1L1WeVcHUe8bdUlGSgeRGCYzsV62Tg3BldQnvHepv+lhP99Uqf6kK96Cxdj03Z
	TyxSt1MY8SZY6rGbYz1fwm0CS4+mogjDemzcTKtcUTBG0Bbr1BWSDwMFQOAixYv+hZgzn/UKo3n
	4GK9P0LtMs9kBR10Ln55VfrVTlna4DH+T3CdZMUd471aMIwfpNyB9v4Sm+4LbMuwjdLDq1yZg==
X-Received: by 2002:a05:6300:2786:20b0:3e8:d18d:c68c with SMTP id adf61e73a8af0-3e8d18dc748mr2680636637.62.1793085047559;
        Tue, 27 Oct 2026 00:10:47 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:10:47 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 05/10] rcu: Validate callback arguments in Tiny RCU
Date: Tue, 27 Oct 2026 15:09:18 +0800
Message-ID: <20261027070923.3054462-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027070923.3054462-1-kunwu.chan@gmail.com>
References: <20261027070923.3054462-1-kunwu.chan@gmail.com>
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

Check callback-head alignment and reject NULL callback
functions in Tiny RCU's call_rcu() path.

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tiny.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index bd22fa43108d..ef0b0474f207 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -252,6 +252,13 @@ EXPORT_SYMBOL_GPL(synchronize_rcu);
  */
 void call_rcu(struct rcu_head *head, rcu_callback_t func)
 {
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	/* Record the caller: the irq_work's stack says nothing about it. */
 	kasan_record_aux_stack(head);
 
-- 
2.43.0


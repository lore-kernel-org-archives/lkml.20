Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085042;
	b=W8fzEydYbv3TdHd0k6SyScrIJd9TaAN8Wrrv8xoHW2U4E2Mq1jN+dQhwlFeFVLZTkVG7
	 GCV+Tu9W9GdrEvrra/c333nnm4xKIVEjBKteHf9HNYYm4McyeCxgryMHgxQ2vQo68w+bI
	 zL1rRoCoDMXkfF6OQ/bi8UuSx4Yq3gNjWaXF3+xvqXA2PSsQ6zOqfSKvTxN4o1Nbizaig
	 MM1tOyGLNpSKO74UgizK3LY39OsaL0xsbR8/WRMZ9u6EbIIB+xPkrABdtUz525R0UF5z7
	 VKv9x/JJRp1baqrJO8tthg8Epa0U2UQu3UrnXs87l2MObYStUqgdfXOGymHy84/fg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OxH7CoGZzoMgyGL01lqgix9fdQuQFlpvLB0r4SdF5hI=;
	b=FOAXLsYNYmQ+hZX+4ls2eL6a7KJqKPpTkaYVa3WFmwgIiZ8/WPs8fDKX7b2lxn7vOmmO
	 PcNTe5xFs8f+RCEi2N4UrbMHHThDQo7foKTS4m2ND8NQTYuN8Z0gO4n1otYfvAFevz+3X
	 rE23q7Nc6z8HGsPIvfwZpOd2kzGnkhYQI17tegwxLVGwnGddhsf8ZF/XXZk6FW3k4sqhq
	 hbTV0tD5AwFFEtg2M072bhsShyU1oaIqmY1cG2WYX/D9dxNyeyuo9HQGwxNfh3HB9WdZN
	 mKhPuVxIFXA/YuAlPtA+fKGGzzxhXqVAsSgSJSYbXTzmBbnITNILKXBzaH5mxDJOGVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c0q55t24;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D23606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c0q55t24
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-881269371acso307584b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085041; x=1793689841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxH7CoGZzoMgyGL01lqgix9fdQuQFlpvLB0r4SdF5hI=;
        b=c0q55t24VkuzSYewJ6och5i8auUNWEhK3q1xa+PLYTisR66TT0bivoRPCf3pZN/7pY
         xt+3AHssmHRuYvwg8TAfwD6P7ha6V3lLgBdiKzCvA69lv4TW3r2T4OjegSsGm6t9XXKp
         Z/XkvqJ+I9LZr/0wfmfHWbvV6bQv3GuNHuIezqebgHQAi5c9+6VhWAR/lXav9sk5VkbM
         8pD5cVGssrptTOB9k1iB4K9oFWphDkTGxCUA2KdqiqIfXkc+PNR3pPyRp14VdC1LxkmN
         a+aLsiygOzcKHr+bNdn1DNTHNc1JzOAwN8udVJ/cz96EwCKBKotuo5IzxmWBa4luCWgF
         20Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085041; x=1793689841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxH7CoGZzoMgyGL01lqgix9fdQuQFlpvLB0r4SdF5hI=;
        b=Wl9ZVLHqsgu7EssJziiRIU+85gFLUHB3/mPCRkWAsef+YU61Se+kbWODUJVOhBbxIM
         8mfDygmneXl32xK9m9Uyk66ykOYMKzTi45uossDy/AGtzChJxjZK8s+lJvp48dwDIzqY
         vuCQDvvQkeFTCnCA3Y6bis9tCJskn+nsb/75d+uTKZNORn5b5Ilctb4o7PMbJnoFR8Da
         n/QPELhICwsM6vNdvPYxHJNnvnkw5EFfv9v8uKHo6z8DTuZH0990NPcRpWtisfUwYuIY
         EbDqNbo7NEE3FWOTPn4qakqFGOog75LmYTHa59Y6gGvGt6WFUAIH0RyTeRRWYAF3wipj
         ymwg==
X-Forwarded-Encrypted: i=1; AKwUvBxBSNl5NMinuiRAF8iMHqdvMSIP5yJKxif2IpvMYKZETewc/Z2y7g7Gn6sFKdXFySvtR4/AWrML3I+GtIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC7OMU/td3+QjtIS3K5JCy4nCe8EZKfFCOsxwWcydcjyuALN52
	mL4KZRkR78/2FWaEvkc9UoZr3KUFtKcmuY30Xpc7mmCfKmbBRnw3U2ks
X-Gm-Gg: AYBFou3mclbzjF21561km+4zelt2FDu75agSSQ/ByBqIpLPCXSdhxK9YdcEeE79vsFZ
	mfATu2M8m4eKa0XNmI26lnkbtC0DedCVKllDpjHbo1AoGFyednMu+7gSRYqfDZr153pLYirj3xv
	B6UDRIrx5pKHgYmz+JAw8pGXgeEQl6Bn13pwVhiJNHx+QiLKiM2xsAjQ12XzClKbXKc9UrCacEA
	z1CkrO5KLvd3/zbNm0fiMViZconbJXXiEruuYM9PWHXygc+QE0r4RNxDut5VStNqf1VCA4gpO4y
	KE+0xHICvPm5QYlDd7aaw5PAJWc4rjiteFGJh1p0HPRcokZ63KLC1aJCq/1Z/bJo5SiTdWs8zAP
	JOM6qxtjoi0IMZfGF2kborjsdLEVB4JVFvd0qqj4HjdaCCpYJn93LX/Dtu/B4W38+3h0ulZua97
	NvUuRhUN/Nah72F4mb3/uI0Oa35bnEWDHGNoQeUW2Q3dRqjWmBP4SWbKaa+AxgVcadTKV1VRL8c
	VisRbeMYgz6seD2odD0G6vTdpXOnu4VaTPy/7X4tfEBYJ+tI2G6ReLI2PA+yFhV60aNKp4uzg==
X-Received: by 2002:a05:6a21:3b92:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e8eae8a1c0mr1343122637.46.1793085041329;
        Tue, 27 Oct 2026 00:10:41 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:10:40 -0700 (PDT)
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
Subject: [PATCH v2 04/10] srcu: Validate callback arguments
Date: Tue, 27 Oct 2026 15:09:17 +0800
Message-ID: <20261027070923.3054462-5-kunwu.chan@gmail.com>
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
functions in the SRCU callback registration paths.

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutiny.c | 7 +++++++
 kernel/rcu/srcutree.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 3ee28885b96f..98864977bed2 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -291,6 +291,13 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	       rcu_callback_t func)
 {
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	/* Record the caller: the irq_work's stack says nothing about it. */
 	kasan_record_aux_stack(rhp);
 
diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 46fe2f0cef85..1993ddbdb828 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1529,6 +1529,13 @@ static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *rhp,
 static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 			rcu_callback_t func, bool do_norm)
 {
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return; // Leak the callback rather than corrupt SRCU state.
 
-- 
2.43.0


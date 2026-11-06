Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975996;
	b=P9BSvEgDAJsEfVhxWHWJ13Xk6fPlc5ioJo8mmK19bJWlzA4h+76qoGZ7qpYpTHPOvJhd
	 /2pn5dh5EjP8aby37f08KQ+dIRJ2Gr6/DGW2mifeqw8zeSG4hXbLtlzF2UTwIfvmTHk3y
	 U97cSlvTSHzVCH45DNSvxxYnrriLPYiyAFF+jLrJtJkTddlPQRbaW6h6A/kAM/gAdMzya
	 0spsVbqxYjsZG3NsaP6t8fscXeUR805/jQQKsekn/wZfM+hgvdhvbdmggVlEEFzOCDQlo
	 U9YRZXUVdv9RxddZR+NyriaJdd+jaLDWlK4JMy3zSNmBkLM/hIYv7YntCySYYE05vXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G4kP5SUxSDXPf0VaBA3CGEW1gurDI8/8IILo+sIVkNc=;
	b=pzITJ7qWSl3OqQci3CdlQP1Ak9eNaJUIC5M2iyQsgK2N7L9Zi2913AvSbA9+J9Jo/B33
	 +CX6xzdiFjCjTlkV7WvcUHwYqO7U49TNB7CuITejyvzen2pI5tJdVDRADlbocjqZBj1Y9
	 OejcEa7laXnanJR1Ql2/ymaP3L4abCHLRTD6xHzhd1NlJielth0A21zihQnwA/Zd+JYmZ
	 LNRH55U2YJziOX2lVKFUCUM45dh+VFkARQtbS2x3SPQnRn3GGx9QM+8bT4A9S9mDEycMS
	 SVWA9z1CeLVrReINRsP/Hzd2fKBnfcHEaX8ID0h4pQWJTgiBc+GUdbR/2YyBIdTgHXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOknn993;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD7606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFD7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOknn993
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so722523eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975995; x=1794580795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4kP5SUxSDXPf0VaBA3CGEW1gurDI8/8IILo+sIVkNc=;
        b=JOknn993yVnz8eAgpZZBu6G1zaQNsUIIv467fXSUI+G9Od31BojkWLkimJTrqy6St7
         B2ALZxck3LyBfdvODkcNDwqVFfqBY9pnCt0gu3ebgrkYKFqwNIcxNe/8kTvIjmEHxlS6
         7EM0OdkM7MxkNSJyoTvVwfEzkqSJMnUk+UNshwLMdZXbR229GA3eseNY2K23vNeDm7EL
         VFwx07hKI6+SY+Bxwk5iYT962/eJ8Fr56UAKnwQbczrBhtxstWF19b6O/m4tyWkDlSlr
         9SffVFbUuslHMS6qVr7jBPyUb9gTk6m5Q+3nqFd8fOYnFASkaMd978l/HEemqjGPfmmp
         Cwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975995; x=1794580795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4kP5SUxSDXPf0VaBA3CGEW1gurDI8/8IILo+sIVkNc=;
        b=RFCsweSY63XZkPgwQmiym1JpEHSm55dEO/5bQUZRcK5ZqVfdb1j9fbsioHrFJcbQTL
         l9zNZb+tZMWyxurSn9YeM3Vf+OjtNyoP7JbSm9xRmRFyfcwtZqlrNBKoHqBfA7qtYtfr
         SRdjMtKFZEprwC8Xx2MCveUEfFlvqZweT58lFLLCY6sCDNT9d8w5qlsmxXh6m0CM1UOf
         4zArXTShXUsTw63JqR+KMu3DhWWMa9J58gbFXhunUI2+zlFisWSJ4vrj6S1WjLJUNBvu
         LF6z+pg1hA64MrGhSywWuqTol72SXpW/T5ALXe3HxqE3yuBICqbnVajPmgnBXv6OuJ61
         AJPQ==
X-Forwarded-Encrypted: i=1; AL+hErHTze1zmAGlW7O+3oMxi5ut8IXoAnvjNq4qyarEfU/j5MOCHDxUbscOxV5hH7TSQu3JGvbHs15msrE36hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gYyPeqeYSfcctWdTf3XzJCMt2+RALlgFLEo5emYDx4FScI7xY
	0qPJbKV3IJyDUHJzaRYK2dAno251xI3mHfdm37/uusdL/zMz2IhdGpAp
X-Gm-Gg: AYBFou3n4NSivl+bQMrGRLBjXzjnTk1wMcR9b/Jp/t4hsjnF2CNhgu+lpebUJNPdo52
	cvol4BU/Z73gx+DzGSK0S61Rni4IlUU2fU2VjhQv4czdDvPAumUN9shCCPQWq63efW9UcjGhsbN
	uN67FwzMFtjsPlQxP81RLtTQd4hNbgQpUFVehxlzH6EKBVYvWjulhYYKUW5OCyLWd2TfLIwK2w0
	GFTUUXsil85ydcajd0osN+j8facDfnPGee6gMf9H8YSxbMHsLFgoJGwM1/lDVG7jhS5A686Dt0m
	cNCETlT6W6ziv4svkwOxZuCa4otRXBCWBTVK7VA8KWWTnohMAX9ic4ObfAvjmbrjqubDkhXOm8Y
	iJGWb65ppdc+bjKAPFZcQeHgFu1T8jjcPZRtuKpBnon+3sncIrcUkRQN8SrblR07pA74c3/TYvD
	yelw70Z+UfOv4xLpnOn8TgJGcbyAY6CLs1HAe7QwY56VXDBKkVOa0svSG90jkNMDhx+vAuTvlHD
	Bq22Z+7NjeKeKR7YMqzyHWeutqkWPPRBmPrb+dhATDd1gJUjaeZKd4Fq2GrgNFEoxLOAqHJf0wk
	PKKGRtEgsUW+4T/kaGdoLFTwEfiHs9WzKXQl7Sk=
X-Received: by 2002:a05:693c:6096:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-36f77200d2dmr4440985eec.29.1793975994651;
        Fri, 06 Nov 2026 06:39:54 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7182068eec.26.2026.11.06.06.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:39:54 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 3/5] rcutorture: Test duplicate call_rcu_tasks_trace() callback enqueue
Date: Fri,  6 Nov 2026 22:39:11 +0800
Message-ID: <20261106143913.3627722-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106143913.3627722-1-kunwu.chan@gmail.com>
References: <20261106143913.3627722-1-kunwu.chan@gmail.com>
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

The rcu_test_debug_objects() function tests duplicate-callback
detection, but only for torture types whose ->debug_objects field
is set.  This commit therefore sets ->debug_objects for the
"tasks-tracing" torture type so that duplicate call_rcu_tasks_trace()
invocations are detected.  The detection itself is provided by
__call_srcu() because call_rcu_tasks_trace() is implemented
in terms of call_srcu().

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index a056a79aa3d2..5ee9e70a6199 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1315,6 +1315,7 @@ static struct rcu_torture_ops tasks_tracing_ops = {
 	.irq_capable	= 1,
 	.slow_gps	= 1,
 	.nmi_capable	= 1,
+	.debug_objects	= 1,
 	.name		= "tasks-tracing"
 };
 
-- 
2.43.0


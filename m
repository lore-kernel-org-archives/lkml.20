Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750780;
	b=UC55N1aPn0jFwXFuutzgCU8bSaBk1cXQWMvKvM1GZmJ+f+PbNI383Sy5Twc+mggpNB4t
	 y7m0CgcDzYo8UT6+Lm+zRscY6Vg8N0c+e7TlqfgM18kb0oUu4ljdrdVlW321CmMKZsYFt
	 ZZ3Cx6gGuLOpPV7Jf03GhB/CuqOMJs4fgEhWvwL90hPxqyKTwyTO8jBlb44XpTPx+RhBg
	 pxaut2k3muv9MzCX+hfHPsp4eWrxsH5eFbCotSiwZhMc8hEWPqbrwgRE6iQUpnOHodMXf
	 lBgERF9tvyGTQTCEd6M0czPNemzjAXg4diTb3ZszcnBXq0+6cY7IDTBE7pBOEkljpSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=18cHTa8MQcXYDKpSR+x3BmukqRMz/yqNYKnCpHUnqLM=;
	b=viZrXrnSriTAHRxnxsP/aCul5YvlQqiFcSDTcApbS7dcrTBYN+X8lf436wDnV6W26k6G
	 yy/L3EaCFZP/Nd8DSQZmHX/iCclmyoEkqwXK2SQWhcz6crR0syGdxJ9ROggaVwWNQEfqQ
	 i1eGegufgF99cK0q18LqZ5iYtqTvyZ68i4grY2MFqatWYBBUe29uX78bXDCm11hgGR2PE
	 NfVQQRtUVpcVSF5kdilUe3LO2kthf1izI0v2J9cxYiAxWHt+LNX17QI2B3Q+geEan6JTk
	 QY9C5ZaYg6Z3uLGnxVJvCulnX+goDkkj9Hfa6z91CTEQvBZ697Pa7Ii1wsusykGjPoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eo+8UNaz;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E0B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eo+8UNaz
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so2062405eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750779; x=1793355579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18cHTa8MQcXYDKpSR+x3BmukqRMz/yqNYKnCpHUnqLM=;
        b=eo+8UNazy+U7YGHuO/DhJ3EJN06y0fja3DIF25mCX//xIaTOy7Mxqi6tGEq6BQbtRM
         iqZwJTsn6g309omuZzGTKsaaMJw7hBo0ga0TlKqmQ4qsQPexw1n0Gwlx9sx9X5z8FAm6
         1HRK1LFZjX0xufhpsMG4iAquTZgmaNzt4QKpVq4EdsGBNEl3KgCu/lSWiZvW7oovXQ4V
         ibD4OgoPFacLa4xFbZRLT0MEHtNNwLgqbeecZrgD7S9o951z+zcuzFDkTryJRp+1gGps
         OtoljZHVQrQcdIgUXHEnMUAyprnraWTZqaReN6hVzEg/lBVq82dRCDiFxgx1RqMdsURm
         PQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750779; x=1793355579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18cHTa8MQcXYDKpSR+x3BmukqRMz/yqNYKnCpHUnqLM=;
        b=w5AIVmfyDAFEO8+iFK9OONODAFpKRJRlYsIUHoMJt6IJS6vTDt3GLaO7irqf/kKhyq
         MFlDcCs/dSz/p8Ri69VHYlPjmnHTT6qM4RuEqb2hpSXlaCquGfyENChz2H3b05puTMH7
         E55EjaPDBbT+iHFVpWHPuQHjRDy2qPkpdEF0alzl9LhwfMljoif11fWD1tI+qOGrworj
         nvJ39xQyMCOLmOGxoQp8g5iQNcBBxFRk9tL6yyHkHvhNlqiGE59KmeafAFZNBcHHEnP6
         FQTdwLuPjuQ/Lp7ivOKDtDjCmYFaUa6WWjyN9qtBD5vKycOhVt5ov04z5GLcWw85nQO2
         VymA==
X-Forwarded-Encrypted: i=1; AKwUvBzYr/+2ERoD3vKhqdzYjgkRoZbw9VD62671QX3JNd2pJ7xCHjg/y/VlVZUSuZjNy173Mx/U0OQFPgMZIAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8r0KiMUu3F15sh3zO2Io1EC7qWBVVpmb6A2Xl17toLY3Cc361
	jf/vKgXQtg+vP4vt6dEyLh68VSw1XGbf4RG8jpawDcprkbtT+N6074r5
X-Gm-Gg: AYBFou05ykbkViUy1AsnfyZ1CEn+yHPLkbnjeRWaOClmwcAAGZgJ6kV3akuThQahmgq
	5MqlO1whzmUzvxUKImVw60++ojwnqIQH15gFmWlMH98mzUJJylVG4/pDgYkv96hMRNIDAKqaKnh
	mjWgYkqawdBwcjLj77EWxn4wc2Wm96bWN7IeFc5Gu4wBiBHFlgz2TRD1xd/fV4g5t75WMMrbxn5
	6tTnAUp7573lx9AIN/0DHMKMxHZo+QgCAyKRzQxcNCLlzNHgzM5h3EBLFjicOp5CJR98ecAUZwN
	2CdBPBC2H8hPbOCgf234PT1yA5iJiD7MpWQFXxcxZxx5L/e+qZq59aH253Bp3xJimyqcDAQM+HC
	vKVKW3mw/WFq2Zc8E1q83FxAgeiZga+DbKaOHxGnV69Cisbeg53a07o3rm1bNxCtSRciZvV0a9a
	ghai3goDLhrMS/SxVLH8v9LAAkoHGbLFnJgRYhz3mE40xt1EVytA22T5LL3UQ+tJOS8VVNB/FfQ
	aDUfJ7nbiXj4M+sBwows7kT8y3GVC22U9W4f9KIWmDjm5bg2XTjWmbglteqNcVnRzqs2+0CZw==
X-Received: by 2002:a05:7300:ce13:b0:364:377c:cabe with SMTP id 5a478bee46e88-368b122d304mr5653362eec.24.1792750779241;
        Fri, 23 Oct 2026 03:19:39 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:38 -0700 (PDT)
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
Subject: [PATCH 6/9] rcu-tasks: Validate callback arguments
Date: Fri, 23 Oct 2026 18:18:38 +0800
Message-ID: <20261023101841.2910719-7-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023101841.2910719-1-kunwu.chan@gmail.com>
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
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
functions in the generic RCU Tasks callback registration path.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index fcac7361ec51..5d7f234795b4 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -351,6 +351,13 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	bool needwake;
 	struct rcu_tasks_percpu *rtpcp;
 
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	rhp->next = NULL;
 	rhp->func = func;
 	local_irq_save(flags);
-- 
2.43.0


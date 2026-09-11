Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860DA39EF27
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119330; cv=none; b=jdU9A0HhdM3RUGpYEtcXqA5yB8ieanZ90JTY7aMIQNHVYYniW6ML/R1/W1n5Wng77Y85x4UxP4chvP5re3ad91q5c/awlcIhtouQu33vbRHHGgBoSG2E/ut4jsZYBbS6Axcb37uXJWmccImnDfXNomZmpRWivHVinhDG5iS+R+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119330; c=relaxed/simple;
	bh=kqWs3gslUippxzNOyNWeD+9l2TgXs+ueYRgqDLPCDfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8G0NhVelEY7/qPdbAy/E1yy2ZIJMbnvdxcS92WfNoDQeiSrxYYja2lf6Wv5JD2LM2gS5HY/o+UtsxhpLNGr7gJkWFdXvgwfnfJItqmbw8ojjloIcOAP78CCsnddqJLcCLQlwM3GFR4nEaFnnd50NrKmR9ESdmAN4Wk4KTAUYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2gmZUvU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2gmZUvU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso705521a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789119329; x=1789724129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPaVl76vMKtxyEaYdRMge2DXsMWSeY/qgY/dx2nMKuA=;
        b=g2gmZUvUowKzWsTtoRx8chvMFZgN9ye8ys5OVuZVoStX1enw3wKZV7dQecCk7UkGLd
         6xLl9/lJ8XD5KxY8jgQiVY2KA+aDwGQeVRmiRkrA1ihmFxFdDhwNPUh728/TEzNMipXd
         q/a6f+hfO3jnv9e/u0HqWdW1OxQzrr+qrQfezbQArQX88HLIgDBoHR3wb3tzayIRy9j8
         rD94c0n83K/t1LPI2mEqDe5ofO1jw4QmxvceZUE+nae3+mc6/9LYACNcfPkM5KWvXLQZ
         cdrsqoz1c+BR9Hb+Mf39rLw+k5YbvN8SMtLrWkKj0W+4EfVAFGjjBJFI6UvVXsJZ1xpr
         7eHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119329; x=1789724129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPaVl76vMKtxyEaYdRMge2DXsMWSeY/qgY/dx2nMKuA=;
        b=pNsaiOqPwJdwMmoIwduZ0TAXPQIH9mZmSk+RVx8/IMGxJqi+1qAvf0mDjIms1ALRHq
         keLCsejfXuNrkHF4EabwFpJhUAneJxBZpZC2cokOM5jmvPyxcH2JzZ7JEX0RnJfcnpdQ
         k9yb9hURdGWFlpTUy5rWQIPFns/+6DGcRBq+3ALdQrdDXB1yu2hIgW6A6Av4Okf9Uzl7
         zL6KuDnHNbl0YM1ZF1ROgXIJA9MWow10Wa1qUeZbIeyGcHfCicvXqMo5z842+OwZs0B0
         jj2S9lAD6VpSgetLlMzSBFdyl1SkInVbZX61WJZWvuaEr/wuqz/BhvewJ4+Z06WQ466Y
         R8lA==
X-Forwarded-Encrypted: i=1; AKwUvBz9H4G6XR4pU4IUbQta6B580tu6soTX73GmCu6+JvaP9ysxGALdbqVVszDw5SunwhrkyFyzw2bH/7vXz+k=@vger.kernel.org
X-Gm-Message-State: AFuF++m5O3tlJyj+t7UtIYYMOultLj8QKZA/fb7wFsVfLhs+N+UdI7wn
	9rxlqmTmST0ymIKUTyJIfwPpO4+G+ZaC+uqKpvsyvDUMr1dBrVzg2hXU
X-Gm-Gg: AYBFou1vP11k/cRontGemggUcA4veAd4AsFf7wCMVhnZ4JMXkcRrPBHuYHQlQCHKLoW
	iQDkjL8kWw6QfdZHRxWcg0uKl8t2SQB7R1KULKGRK8bxo+6abKZmcviuXVTblWHifaFB8C60Tpm
	fyfXedOk8TkH17aCBYrXFqCi8evaNcsoTfNUY2WEA2h9IWBaFQUDpJkedvlKWhG+p/YmxhlCCan
	B/h1ToNQW7Drn1iQlHpItLFtpfKgkewSS6PwT3oIakdfVeOhbPDowq3gMHsm1FpOca6Ql+DAT7g
	xPCXOmHx7V+QAv2k5lZxC+26ynB3sf9hKBioiyBwHutOfAJdOCIZnWBcjwBRzeoWv26hCns/jZK
	gnzsYgQlF7A2fxPofHmeBexQLjjO56k5Txux1e4ppZTNBYP/A7L+89HyLQQGgeRWNQou3FRFdzK
	6HwXogHAUmKGTRUc8h1aI3y3m0c49LfFcHYlnzUyhnZIlrcds6z56CioorkV0kms/nw+H47+DTy
	5qof4oXPafwmkDUkw==
X-Received: by 2002:a17:90a:ec8c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39d9bf0af3fmr6071321a91.11.1789119328350;
        Fri, 11 Sep 2026 02:35:28 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm4240809a91.11.2026.09.11.02.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:35:27 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org
Cc: josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>
Subject: [PATCH] srcutree: Add lockdep and early-boot checks to synchronize_srcu_atomic()
Date: Fri, 11 Sep 2026 17:35:15 +0800
Message-ID: <20260911093515.2802551-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the lockdep annotation, same-type SRCU nesting warning, and
early-boot check used by __synchronize_srcu().

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 6a9c432a3bd0..6c729e805fb3 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -2123,6 +2123,14 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp)
 	unsigned long rdm0, rdm1;
 	unsigned long unlocks0, unlocks1;
 
+	srcu_lock_sync(&ssp->dep_map);
+
+	RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
+			 "Illegal synchronize_srcu_atomic() in same-type SRCU read-side critical section");
+
+	if (rcu_scheduler_active == RCU_SCHEDULER_INACTIVE)
+		return;
+
 	// Initialize.	Either init_srcu_struct() was invoked or
 	// DEFINE_SRCU() or similar was used.  Therefore, no allocation
 	// will be done here.
-- 
2.43.0


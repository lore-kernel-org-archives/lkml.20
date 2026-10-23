Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750753;
	b=DN09h+bcf8oSno48XnwF1yulr6qFM19owVMEmVpxL81UcC0DYSBV9s4YlkQCann7Zv73
	 MTQY32DEApKL/Mw8CV5Y5bAZSUqjqoVmuHiuxjIizeffvR6/BkvR0CIy9Ma5X04c4E+hf
	 iif9qxuYmfqnkjTrvg3l8a644p5Rp1uQndmF7w7IYOOtxMRdRTtyY3OdLR2gV4MSMsWMu
	 3OnSJeGx+GwU6e4DYKv8TGAFBGcc4ndf8AUHYTUb0VLndxEJKiUXcOcyHtH7Tyz2uMwi4
	 Xf5NU0fH+YGvWQruSugc/pRWIGDpudyEy+ZihXXiGrtsds6uIFjPEKXrL+5BxGaD+Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ccfSLrgWT8yZZMCQWDheXOVMnyMH2wrHGPHQpEmc4TY=;
	b=Ecku/6qYgdRO4ZE9ZNff7AXE7fodctnbzG5+hn0c+21JGxYKMaJqpWSm+xXC7vc0bEZ7
	 yaOmHYvEMOyNovna3YCMLRrjobAVBlBhTotJahFPoGwlTbmHQqWHm9QKsZb2NMaHRdPtq
	 b8VZBEONvLc+tLshQLvoHRaXgWvSDZIbenYO0eIqfFIlYDucN6ljB93tMrtlMmEKBDao2
	 pXFqjVuq1eDIMyqXmLE+cC/ZA7bhEI4OTAfCC1QqjlRi/HLcyH2nG2IPGxNE49s4Swexo
	 ZZxqRM+Iusi47KmAivMqgD+kKzNbySGu5M/JkCzrwNXfeAv0WUwTvLLnbbQ7CQcFjTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f99j3Bds;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3339D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f99j3Bds
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36681e85e87so1782010eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750752; x=1793355552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccfSLrgWT8yZZMCQWDheXOVMnyMH2wrHGPHQpEmc4TY=;
        b=f99j3BdssGlXPzRkM3T6A3GFImg3v1XmiVjOD8r+27nY/0ZI45AakS7nUy1hUBfB0+
         uAb0P+RlPRaCt9DFTl2PdY6heEm2m2o6LzYIwKS3+lOwdYomSiXLVi4nC29DHKKC2ONR
         wZe2uqWfPajLfET+mm9zyMrK3ZrZHKLGkXwubTBEw9n7S4JNXsCq7kDv5X+9I2G/M3la
         vFrSepOMGEces1F3cUlyCLybqf6y5GCvu/vysk8IvEhkwM8y5938r3Z2SaxiK7AIelqE
         3GTHzrNU+NvObn64gFNXzBrxWU+hwu1PeSONyAcP/KTImJ9wJIXfjOBR2rLfmMY/F1C6
         bJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750752; x=1793355552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccfSLrgWT8yZZMCQWDheXOVMnyMH2wrHGPHQpEmc4TY=;
        b=WpcOD82PoQWJ6o9jRZ/cz+0+nC6LW1TJkmyOG3At9rXir4flXhxqq4qOrVWU8vzENx
         f9XC0UduR8ItXGKLqmVOk97rmGdVW2cuGAw7Lwx7oToSlui1V4k4N3HSklsS033gCFse
         CaISYnpsHhpb+T0nF6YPK3WYrW/Wu7wRSFTXV8di3L3+5moc7lht6KfIzZcqRsTKXnJN
         uUnUHEWf9Wb7Khuq4/bFYf5jZ+qvDcqdFyUvpqjqnW/1VKkBNqmoQjJES0w3uQ51a+s5
         crl31VbGM+MCN9xVt5GohmsTyttKrfBpJVn2M/24j3a223UQoXEoHucNAJ4UWYYpr35c
         89UA==
X-Forwarded-Encrypted: i=1; AKwUvBxTNKOVEcDCZeiudndqjwsekyYjOcXhOl8b/IOC8BT7+z780InE0XVwBRCqJEnU5tCeXQWsi/hGR6+Psy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDCX19qMBIN1UeHcwA4FP7hyPxy03EDCs1S/aYVzs0jTsVjwVV
	ZC8OfAa8AvsCFKL38d9c//uhjpnXthE5oMxku+UmDxr0FvwoGU/NhX4B
X-Gm-Gg: AYBFou3gRgKANUxuyIjbD9ZfLPDhUSzx7CfDaZgRriSAfdRfjqQb0+uAniDxQtEM2wY
	FOnB1OFBQQJGgJgOVlfctASIX/iC4c0JsXP2QLE6K3qei8owOf8s+okxbRjoIzBWVLwt5GUWWhn
	anMSHLw3rLKJKDblWdhXXm/Laz5Gk/pd0SvXO5owlwW2r3lVr/4t8tz3D14hqD8Jhb6mo8OxAA3
	2fzh0a3ntofIpxU92/y0NUjY4AY7HHdSm7LCac/kEu49GibQQki9q0NjkXQgMfVDNkJM8WFWzh7
	Egwt+wjexWhyxVf2lvRYNaw7fudypcU88M1MnKXmhoI3kj0rJzZpnVirHPsqnB3O80Wun9jnmpi
	5XPSqN5fYt1x7BmlKqBKsNKYqI/yBFGKjvCHo8kfYnFpYhz8biKmf/t9paz8bfXDCuZwR0cV7jt
	QJchZ5JLNIjMoacIkHdzSjrUNkXBw07s6fJpnHAnDk0pHYEsbmDDxBRtpFEGI7NiFB6y0tEjKwS
	FYQKJdhJQzcoxxQAJBh4Az9zahSphA7d0OK685F/2W6LqfTYiYhEAiNdTlj4GzifX3QAE26cg==
X-Received: by 2002:a05:7300:f14b:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-369d975d6a0mr2732844eec.17.1792750752248;
        Fri, 23 Oct 2026 03:19:12 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:11 -0700 (PDT)
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
Subject: [PATCH 2/9] srcutiny: Record callback registration stack for KASAN
Date: Fri, 23 Oct 2026 18:18:34 +0800
Message-ID: <20261023101841.2910719-3-kunwu.chan@gmail.com>
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

Record the callback registration stack in call_srcu()
for KASAN diagnostics involving Tiny SRCU callbacks.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutiny.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 63a3f0a8bc53..3ee28885b96f 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -10,6 +10,7 @@
 
 #include <linux/export.h>
 #include <linux/irq_work.h>
+#include <linux/kasan.h>
 #include <linux/llist.h>
 #include <linux/mutex.h>
 #include <linux/preempt.h>
@@ -290,6 +291,9 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	       rcu_callback_t func)
 {
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (should_rcu_defer()) {
 		/* A re-entrant call_srcu() during the drain would livelock it. */
 		if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
-- 
2.43.0


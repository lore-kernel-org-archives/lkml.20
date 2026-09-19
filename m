Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F903947A4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854763; cv=none; b=P14yXwhm6L/+T1WqPMlTTD0ROzjF5bhn1EE/kQCyeuPO5DLQtmxfOzJvUP31OFb1MyPSXCeExOHEQ2DNb9XzDgVUYUiySwFmo61hK2rCvkxXj3fsYfjSuSkmlu0SsSoQJmBjGqov68EbGmd+nR51keoNMYwCfuA1xzDsl1vwoMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854763; c=relaxed/simple;
	bh=BntXNVTAE1crzVQG4zUNy15sf1O1LyXIl22qSy/4NXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICYR0bMncI/jrymsvXN4GcGBRhDqjwUI3VbUbI/tK+P2SLyvA5sARgZaLeH9JPbANHtPI83pjIr7kXhru1osOv24p7bE7buWNstwdxbaz3oAtAaH+F+QBtAbQffB2ZrLpQNBhf81WJ32Uxuj1k6dHwwYZz5mLZEqEfJXBg4BKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkOLYO87; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkOLYO87"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86efece610cso1408912b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854757; x=1790459557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/h/iBMsKjYf4gXSNgib/JEQ4/EySf55r7ftrtNb0u6U=;
        b=OkOLYO875xlu1OUviRhPkxZx7TNPu6MWrs91r9X5sCMydAsJ4gt9j8JJJtPUN1fgk4
         BdikYCIqOfqujv18gfGTuQJQaej4BhIu0hU6at6VhmBvmgllkPG8SiwMPAC5tc+re7fH
         auQStbuDHhHkpeh7GXFTtoB+tnhOAbj6SUvzIu3a+SMM48DEcLE15lQMMhn9aW2F69Bf
         8H60ambonw2c0nxfvl3TgR4TUmXoDbb5jFLT1PxZXj3pzVbgUps9t+eo6ORWFELHDwb7
         zhGHPExNpE93A9Xj9zPBN/DWQtreCNe7igIe1/1YKl34yEh+EQb8bibEkmysb2k9BZ15
         lTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854757; x=1790459557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h/iBMsKjYf4gXSNgib/JEQ4/EySf55r7ftrtNb0u6U=;
        b=Y0Q5sPB6iFVud1gqDEIT1hDT2GsJRAxgF6PUHWUW+P4Z8nOzLCnQFgyFz0JxKplDL8
         KoSmqSZ9a83231ydzTBRZeK2n+C8fxsVLkj/rLVaQMZfoYvjLAJuOWA6GhYj/IT2138u
         SKP+1y+opPz2ajY9DxYWWhP0YYIto+9oNQtgGvq0eE3z6q5jSnqniY5TIluVNuiBfnZ3
         6qXPLKUR9j3galsIGY0VvieOhx/Iod4VcHY8XeevfWspYSUI2vuuALCOfkDNSiz5+Fkp
         J1eZnI0HRwC55TmrGoo99kuhfil7InDdqJg9eb3fq5iyqqCS3zaVw4yGlZJabtvnSIoQ
         XURQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoS3Huv8+VVXjOkMwl6L2V9P6nyp+zABRNOJaLhRo5RVJrHmIJM2o08Pb4hTkMICmb8nQnZVsXlh+VhQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m4+PyKOMJ5pYKTWugNtJ5uTkfPCgUbxH+F0s0dW+jqzEUZ8xr8
	vSysv+F99ivj3cORvqnV+IMmvB3cksTqABfftuYcSzSqK4WGW7WlDxoe
X-Gm-Gg: AYBFou24VKFNH47An7MpBGRK906JreJZ+Vk09PIHON1e8byLgG5NRCgekNQmHhFvwSg
	VcqPqKcAFnbRjxY2jHwM4N3fYHB6UqpbtyHkVJT5/ixP4bG07NPI0QPp0EGeBrFlCFnvVHE/AXh
	JmW9KLgsINMk1e/RbUj7UlD3PnOJ160jFVzOd4+rgG9KbbGnep171p/rCiBalLwP6GSdb8quXrr
	2Bd0WBqWzpw12XvIuAZm35QTssfPfho8kZylM/KcV2ff+MuQ9P9U/VBDc1bjudQx4APJnRL+PKD
	5Sx0diE4T5ZmKBW2NFkXOd3nMd+QX2l+Y6zwqNSywGq8n+dx5efL9Z1WJ0dOogzBBvBzUJ+rMZV
	kaPHqWwqcn3Ks6ZhCLUyraHsVySTi4amddrheU4/+MLzdNhVHfbJzTWkBxdlF8nVd1p2Yqu+YmU
	0Fd2cdAq8wHhSd52XIQ9rGzy+lAALoWRmmif9ZyEeHUm3KxU4JmU0Zr83TTnQuwAPdt+VMw+DEF
	JV5SA3yrLoXpQNpl+2IDgjUtdZTmGanDoOKFGQiubtWLtp6CY9pJ6TpwIZwLyapxOb2z4nNiU8H
	/RoF6AZkHQ==
X-Received: by 2002:a05:6a00:ae0c:b0:878:3507:8d69 with SMTP id d2e1a72fcca58-87835078ebfmr2119429b3a.48.1789854757327;
        Sat, 19 Sep 2026 14:52:37 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f4ab3sm1339922b3a.23.2026.09.19.14.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:36 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tcp: drain out_of_order_queue and update SACKs in tcp_send_rcvq()
Date: Sat, 19 Sep 2026 21:52:36 +0000
Message-ID: <20260919215236.3470714-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When TCP_REPAIR injects data into the receive queue via tcp_send_rcvq() and
advances tp->copied_seq and tp->rcv_nxt, any segments already sitting in
tp->out_of_order_queue that are now covered or contiguous with rcv_nxt are
not coalesced or removed from tp->rx_opt.num_sacks. Drain
out_of_order_queue via tcp_ofo_queue(sk) and update SACK blocks via
tcp_sack_remove(tp) after advancing rcv_nxt in tcp_send_rcvq().

Fixes: 292e8d8c8538 ("tcp: Move rcvq sending to tcp_input.c")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 92bc60716f33..8a7c38a4b1ec 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5589,6 +5589,11 @@ int tcp_send_rcvq(struct sock *sk, struct msghdr *msg, size_t size)
 		WARN_ON_ONCE(fragstolen); /* should not happen */
 		__kfree_skb(skb);
 	}
+	if (!RB_EMPTY_ROOT(&tcp_sk(sk)->out_of_order_queue)) {
+		tcp_ofo_queue(sk);
+		if (tcp_sk(sk)->rx_opt.num_sacks)
+			tcp_sack_remove(tcp_sk(sk));
+	}
 	return size;
 
 err_free:

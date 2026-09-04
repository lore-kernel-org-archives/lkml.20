Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D730149F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522346; cv=none; b=glOT98D/Ax1OBMwF/6u1RqMT3SeUkr258ojbpHwP3x+5cnNCGigMKTpbrS0RRGsAS3/03IXGgLu8yAG+CL3DotqRjQFxAqKmDYVqK/6yAfn2HpRCXGORxvMSw1WtQweoNhsMBnlthr1vF2RjsxD9RLyAkV3igbWk/66zebXrays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522346; c=relaxed/simple;
	bh=4DYiEOsZKjx/4f4PSXfRJejITB67NJXF4cNdrqZROfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rak4NA1cDS4SF9sYMsk3wnGRZ3dMwZEtlANSZU/6r//lvCq/lA/cCeFqJ/9EjuCL7QTl61V+2KLewTZo2D8XFk66nO4lHWu/vdF3dYuXX1TiwoFqoOk9B8o0dlHcNDhQR3yO/Wz3W4VQsku7LXqiJzHJ65XGZSNNA1ZEqI95bwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glMIBwnc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glMIBwnc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1050803a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522345; x=1789127145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ypdm6ycnQEZOWN8WJPUUE2HwMGTgKp4dCj8wtNt7vJI=;
        b=glMIBwncTttwvAe5mGxgfuLlNw2tGMxm8GK/vE00V2EV+D5nQR4OM6pDKnTCDJrarr
         VRIIWrSu6Be0a4wwUH4gjT8BU5fH1e37niqC+ldAEXYVqls70gcwILPRRkzbx7xiHlwo
         J1qS6IFF5XtXKY5Rf9gUlzA2eHQRg9qSOWhVh/M2Q/KayChmZdJnhnjGVCfLMD2Gx3qh
         qg6L6OBBKVIizJqTTuMEq6xrsiI95TFv0ww/I0nj3vRANAIJEwlWuWQ0w+elFtwMZxRN
         EGjA5Q8W5qjTrdOW4B0X1q3TpCr/6qsCZ1PLme9zvwwwKlzwtNqiVV3+IRDknIlfRDYA
         KJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522345; x=1789127145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ypdm6ycnQEZOWN8WJPUUE2HwMGTgKp4dCj8wtNt7vJI=;
        b=XhiRgNMqC+NY/9ko/Pf48vaVcEpAbSze+71xqaw7Posc8Gg1S/d18qco1twMf85On3
         G6xGMqhPIR4D/SSewk32hxEaXoZWmoWBjnHr7bRwZH6ZpJqF5b9vPc6j9syogUUaisSE
         drUd+3HmZ3LoOn2OUCpD6WhsZLTTW8gi1hfmF8V3dXbQ5way2afwld23y8nmENCVvyB4
         4WL+9kH+abhDplh9L+S0aegGq8pQgzN3UFdeGigU9RrKIAQRShk5Qu5Am/Mv1hxZ5CIw
         S27GlUo+XwowDHcQ78h+BLOgWdyjgBXLANjUv35CZSKPRKddy7HhkcCYwVPAiewWXrmX
         uH7Q==
X-Gm-Message-State: AFuF++l65xNWbXwHW4Si3cxPGu2dJO6+cWpJQ1xBEhQuO3+SXsD/LLMQ
	jmXB4NtqwBgOwVZHJ24dXQ56TZd+N1BYpb40vAs0o43IYw8svL1o6Qsy
X-Gm-Gg: AYBFou3iEZV5go0+CH1G8AGyd00b/rxj9isX8C1x2CSKEJ5j5Anw+ifVP4o5fvjekIQ
	K/RzvKw9dk8U5FTUOqey6vQBn9ipm47Nqr3hOiEQByd2Cm554H4/dWbZdvuk9/MVG/lwa/Wba/a
	hz/WtbF7o7mv/Gy+vkl8Aq0i48UgEl3OFlGYlREf6eIozCy6Q7mtw1+vx6ZP6my0YJolA94tYSK
	0tNPp1//nqaaxLBK6zOAjFheHbvbOEDXMvXqf5BsVOE5TF8DNyaCE3xe0Ljns820yIEw8iQX1wG
	SekNxYRJQyhLwEFufWKlFUob9THsyrDupfxkxlj5UmkYLt1l3aaV4DrvmOl6WzRNeYXGeb2TYe1
	E64Z//irssvcZM8UyyZiWaavISQ/OU3pC+LsC5uyh6jDjU8AkPk1/JxPKXnyQDExH9Wq9K9pTnt
	0Sjyp8T+TANECYIsbOKjBBIg7ntiEFpcYXjlpM0BeO7mpRN+b9agb2QV7y1s+Bqte4iDbfNT/dx
	R1p7X0HPDu7iMWg0ilOhrKDWw==
X-Received: by 2002:a17:90a:e7c2:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39b261da126mr7004862a91.19.1788522344797;
        Fri, 04 Sep 2026 04:45:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm7148372eec.1.2026.09.04.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:45:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Simon Horman <horms@verge.net.au>,
	Julian Anastasov <ja@ssi.bg>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: [PATCH] net: netfilter: fix typo "specifiy" in comment
Date: Fri,  4 Sep 2026 17:15:36 +0530
Message-ID: <20260904114537.29953-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "specifiy" to "Specify", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/netfilter/ipvs/ip_vs_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/ipvs/ip_vs_sync.c b/net/netfilter/ipvs/ip_vs_sync.c
index ea5fdd4f4ce7..5ddde3ab2e59 100644
--- a/net/netfilter/ipvs/ip_vs_sync.c
+++ b/net/netfilter/ipvs/ip_vs_sync.c
@@ -1344,7 +1344,7 @@ static void set_mcast_pmtudisc(struct sock *sk, int val)
 }
 
 /*
- *      Specifiy default interface for outgoing multicasts
+ *      Specify default interface for outgoing multicasts
  */
 static int set_mcast_if(struct sock *sk, struct net_device *dev)
 {
-- 
2.48.1


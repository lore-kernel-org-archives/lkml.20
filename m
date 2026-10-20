Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515389;
	b=jC5izK02HMbD4skS4BRpa8JtsfvJonNJQ8S+90D9liKbaNoghG7MuD602wT7JgyTDFHz
	 E2+N7punKf6vefZRwj4RFUSe3pOI7l8LOjIptHEkMcuLYASJIERX80254B+c91tRjD0I8
	 L3Ieg97XjqwOnKM4cf1RbteQStUPd1BFe0zIeWTKa4soDkGfpNEDjKFkG/hmQErcLhgPd
	 K8Poy93s0ABlZYd69iAcpup/8PUA1b2LlQbIbC7ZtK4z/H5gLbyN4tAhwzVaZqcNgG8C2
	 qBZqoMS4gSS/Y1wuVDE8kl4DT1XqrIC7iO12ve8j6GI2vAEyG9/Qq3ZMcAVtCLxExDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lJA6tKVLSd/rks8VATU4AwzUzgulNjgUJQKYEzoQbI0=;
	b=x18Un31zGuQpMXsnUIGuXHJt1PPq67kJjKFtoTeEejWYJ7ldlq0iCLVCnGqcH5HN5209
	 uPuhT3z3H8PV47fQ4XDChVLIVe6UfLUSiQce0P6t18DdmKJzll3X/vbbwuqoXfj40+uu1
	 lBilhWuVnjJ9TjKYTUAxnjkEKu2FyrgvblbGwbU1ha9HGfx7UcqVjkbc662ycs7s8xO39
	 6w6O8SgKVHaVMu3bWPXiq/1Gcj5b/Loo2tvFkfI9h3jeQ2yduL9zP6uxBcEEQL+yElCYb
	 PTKqCeeOmsk94bsy2tH0Qv2lwhU5cyQSuIsGfFmlTO65lPG5EgbxhTnMyJm9IX/NMMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rPcumr3h;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF7606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DF7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rPcumr3h
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b10ac6ab7bso17490177b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515388; x=1793120188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJA6tKVLSd/rks8VATU4AwzUzgulNjgUJQKYEzoQbI0=;
        b=rPcumr3hk92ul3zXknSP9ezvJXtbsOjBFUcexwd+d06SRbxRqchUGHCasG/ZKBsC8r
         P+2in+A40BsBSmqyMsQKCF6Bg+UMhT1YHmuHxJ0ddDno/m4YI/1irGtzS5vbhx8R8BH8
         j53tCE5oLzFxDGzTMIa58F/nuA/rP/QVeEua2FoCQrRTbwUgNKzyLLWncQtP6my2gAaw
         D5uLE4WBc4k0qv9zL5RG2PC4zlFRWmUD7Ter0xbpFYV67h+g0scghhUVrHo1Y6Syl6fA
         XLYiYPxE3TKTjcSdX42jVrkALtgMtAirKZHLx7YgKJYCHN81dZDenyXt+tXOq9K20SDG
         BrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515388; x=1793120188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJA6tKVLSd/rks8VATU4AwzUzgulNjgUJQKYEzoQbI0=;
        b=NdzfTah/E84in3Hd7+74tTAm490wHy/1f42L4mW+IepFclI36CZnSq1ttR9RREzqSR
         lpI5SCfoMWJPuzdDwd73MEOZZYaO85lebbZGgssBAmVWg1i+zVCJr85YmqyiG+RPOhf1
         7lYNjWssErJ0I4TJbiAHWHG+7d7YIosXjpiz3kqKAzAOeGn1t0ks9MqGV+D4jCl4ekRl
         Xe0xJI83rQfpFuukYwXIJYPpf6MuOgMO8S1UgnKdsYFNpisJbvSWmJAeZxmN/eKYZD/a
         CcgJt0Hgk8zYruLEXmGXHAJVptxpriQWdTywBSDgylOexW9dYUjFaq3jnAefU/AWIH3x
         SK1w==
X-Forwarded-Encrypted: i=1; AKwUvBzcJq5fzsdrNaK97N7CxKGKcdPI9e7OYLYVaLPTtEwM6sCdOr3E+EXgEcpv/FCYIMDrVOQwLTLLlUZhO6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnLN5Hww7Iut1xt1wrWARzxov5lTR1ZOIQsvJ7Ci4kbD4SbGkF
	zUHPSsnJGXiecDFylZrZYThoD5sbf01mxnyMqjd5NF5piK+uunfAsIG0
X-Gm-Gg: AYBFou13qeATh4KJHqken7jR4wgw4S9GfBbc+FMsz25V1rzUx13mQgJ5vn/M3f8z0Sz
	KSYSvmp7I6Mhhhsqr4+krsGxjICsDsq+se1od9/B1sifWAexTh2LsLCIxU+yh66GWfWT9xSKm5U
	T2d1DbErq3DRB6dI2nPApLRLMEgIDH5VxgEUJr7kBwWAi9OUWW2qTS5JRRVX47bkSmDXOMQRNtK
	QSbjJ6znXiqz5EfprMUWNtss7Yx6Jbdns0eMzCyE5snzrxDG6zmYF7S21682GQekaphH9eiKzOk
	FF2sWJ1RwRmF++oEdFdj7hcHL4vF9MBLCLkXw+eDJQuY882BWYB5RFfw1JjQYA6jDUCMuFcDO4a
	ozALoLW8pJiVdaQrsAxQG9DIkmFL6FLeW2iYoVnOdZRBVabBU4PvHmrZXrQdDzYaCUnVnyhBMN9
	BZ2vYR6dqvGLNXVh2YJrxOT7vtY+FJKYt+fNKyuPYHjbhuqUZnKV+jLqSKZVQcwvGDGPQHOP9sO
	/6u+sQCcCS51qFXSNOjJx0yASBs
X-Received: by 2002:a05:690c:888:b0:873:17c9:b054 with SMTP id 00721157ae682-8b0f21690aemr36925147b3.21.1792515388537;
        Tue, 20 Oct 2026 09:56:28 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300715cfsm549777b3.14.2026.10.20.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:56:28 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] mm/memcontrol: publish null pointer before dropping css reference
Date: Tue, 20 Oct 2026 09:56:26 -0700
Message-ID: <20261020165627.1599959-1-joshua.hahnjy@gmail.com>
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

struct memcg_stock_pcp hold references to cgroups that it tracks to make
sure that the memcg never gets freed with unaccounted charges still
living in the stock. The cached stock can be cleared either via
drain_stock() or consume_stock(), which drop the reference if the
stock goes to 0, and then clears the pointer from the stock.

If that was the last reference, the memcg is freed after an RCU grace
period, but this can happen while the pointer still points to the
to-be-freed memcg. Then a reader that enters its read-side critical
section after the grace period has started is not waited for, and then
can dereference it after the memcg gets freed.

In practice, this is very rare and I have not been able to reproduce
the issue in my own testing.

Switch the order of the reference drop and the publishing so that
we first publish the NULL pointer, then drop the reference.

This is based on a report from Sashiko, who found this pre-existing
issue in my page_counter_stock series [1].

[1] https://sashiko.dev/#/patchset/20260928192349.3432886-1-joshua.hahnjy%40gmail.com

Fixes: e1a366be5cb4 ("mm: memcontrol: switch to rcu protection in drain_all_stock()")
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index e7d7db5718f9a..a05d9a8baa1b6 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2172,8 +2172,8 @@ static bool consume_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
 			stock_pages -= nr_pages;
 			WRITE_ONCE(stock->nr_pages[i], stock_pages);
 			if (!stock_pages) {
-				css_put(&memcg->css);
 				WRITE_ONCE(stock->cached[i], NULL);
+				css_put(&memcg->css);
 			}
 			ret = true;
 		}
@@ -2209,8 +2209,8 @@ static void drain_stock(struct memcg_stock_pcp *stock, int i)
 		WRITE_ONCE(stock->nr_pages[i], 0);
 	}
 
-	css_put(&old->css);
 	WRITE_ONCE(stock->cached[i], NULL);
+	css_put(&old->css);
 }
 
 static void drain_stock_fully(struct memcg_stock_pcp *stock)
-- 
2.53.0-Meta


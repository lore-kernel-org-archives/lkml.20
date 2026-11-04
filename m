Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814224;
	b=zi4l77lTW7ItJv2ycYN11KpcfJPPlGfzYWDFtzRa08EsaFNVAJrTpEAKkFsmD0cxJynI
	 XHv3s/wXJa27phU3i1ZgIQqDuKPbjoMfZrQyBWiMbPG48rTcB8ZJZDJNQ16qvOyvuJDrP
	 gzrhOfQ9z9R9WZMG+v/FUdGCVS8NXGFnzwAGCyhRHa/z8qLviw9b7PfZVEJrtsqGvJuuG
	 33PpzSUrVMYwwcqXJdSJOO6GPjHONNUnVux2kyIRxl26bwE/lONAxu+XMMt2TCV5jmMwX
	 8QRj5ezRf/uUq4+/BlgYnS/YE9ITZTc35CkxdlJllXooH3uFhkuXvMJ6AwxoDRSVGtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ItZUs4rAkttw16yN200Z8k0fdOnF5WAA/wo1XxPg2KE=;
	b=KbZ+ubSOBW12OphilYLtYLL9J1DJdR+LDQFkuV+DCnfxOob36i+pN/WBMeL92BGCj5sU
	 D4AGZyRXmMKnSS1A31pNSuwWc2+CM7JDN01JjsZKZc5mJUX1HIj6RBcyBaxJ1AMN7/sKN
	 3cNg/KBOQI3TuBTZjorB5fAINsM/V98uiHuQPWAYf0mfGkKpe2Ieyfck49CAEQd+a/Mg0
	 N2D3HEkrqon9bS7cP0HgI6ngQHqrPPcfSh11WovK+a5yUXu93GVmRKK7e9tOvW2Dw85dt
	 wW0F46cBBXnJ3DgPRnArvCNiNYsms25ySYQTY6oYYlqN9MoY7qObSJ7+lLNcpDvdnFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmIaoUeL;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B54F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmIaoUeL
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so1976729c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793814223; x=1794419023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ItZUs4rAkttw16yN200Z8k0fdOnF5WAA/wo1XxPg2KE=;
        b=AmIaoUeLi2Q/TlozqiC/bjSSYDzbLHl3l03iQ1msp4uho0ZFTjEwWOCEuNY0zLkul0
         LCIVaG73rhShZ31dT6u+MnMlfLzErl0oCsrZslfVrVnkkAjBwpVCrA2CBIpmQ2E2OkrW
         rEENQ/Axdfwbts4w5VeGsJ4EsmWIek1NH7VGh74FGREfEYZfrQ14Vtu9CgQ2J854o1tJ
         ZweqEcYTY2VJW5bNbZX38mmlMKRb27eSpBWK/vJYuSMCkpEz9+TL2dUdiI5alawv6tie
         u2Hw5NFBOJ5noHXBKWWCkLAlNITOTMehafsvlhcf4bcOtvlDc1hUjByf4TN5tEMuOt1T
         u0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814223; x=1794419023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItZUs4rAkttw16yN200Z8k0fdOnF5WAA/wo1XxPg2KE=;
        b=qhGGJ2PZiBvkrt5e8iowYNEX3bSbE30InydQ6ridEk6rKKXh2UzcLBPFJULDYW60y+
         GueM+f2RqqWlTLhWIgvsjwW91mJ3QwXQPxHisLBH8Xi7xhLxOhpZ6MMZWRN0ewsnsFnA
         vC7kad5FDuGCESHlSwcXzZpznwHVkjuI9Vj8wlKzl9Tm0Lkf3sFyLU0ATgcMW78O1/9/
         ZQkCoYiJ4cKmbmPl5dv8WxEw27muIlB8cGwwb5GCgPIj8Z4CGWtpenKKkUzD1C9F/RHq
         CeR50keUr5kykiZCVLo0tW+V9O+fo7SOsZPdQb4oD6PAIcoqiAWedqFFi3KvhXaBxuL7
         v3aA==
X-Forwarded-Encrypted: i=1; AKwUvBw6VD5mgLy+LKt/DIK0GOO5TzZRxx/kH4rdYxRZCZwanCSdnY9HHvLlCswD4SzPyCvX4tmNi75mDHvHo9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Ay/goXBRWM+A2A2qQ6ciyBl6nj2KPOmxOOW0NkMvyVSVlZrQ
	HmelDAxmjOtnWFnQ6rp223U9jM+1qziU7Yure1h7crmAw9kF4IIWr6jw
X-Gm-Gg: AYBFou30gKWn5n7nqK7k4AL+N9hqMkZjRaQlkgJQJ0lNEXXigG96+7+giZUOeBNg4dK
	r7rQA/XFaxDNbDyow/ARFVkUejMBy0qHYLHUSLOSt+yL+DWcbqwoh5eP0MU2h8JdMGVSXqOOC9x
	lMoH6fadpgfwvZM1lAN7Uj7iDsnI899FMKk6e6286JA7xFYpXrsQCVS2mJZp1LV689mmAyYCMNh
	R0hSaSqSRSCb2FdH0vNn6LRABs7PCmv4lnBQaSmVDH/ZYUg6wNr/dFUU150Me8cU6H6PLi1LMEI
	tUwpJwDeLLV6NYcuUZvIjh/R59O5NeGtornnkRU7dETNHQM2RBKVrmhFPDVFSgPRQfTJ+6/eA0j
	H2hRyI9/uj94+QNjrJDsn1h+g9Hh2zEPqYN9f5XpVlc7fYH8/hpRnp0YV9Y7DjgSLk+cNjjVV/8
	5JtzYllYwnKo5prxbkR6TUksYWU4K031qdh/oZLbsCEl5iHcVpjdZqmJpeu+LQ3wkJSNBFDPfvt
	MQiz9ng1T/sWcpvvOmaevPcrurUPsyazHde33pGxFUEx0ZqUjogoqkGt0zhvNvbOAmQdv9NUGz7
	BFoyQc/qsQ4LFR1SBtLqQWPQJ4UtMiHhY7dzZ/gsaHM10IYmnBxU
X-Received: by 2002:a05:7022:223:b0:144:f089:b189 with SMTP id a92af1059eb24-1ac5c369250mr34671500c88.36.1793814223214;
        Wed, 04 Nov 2026 09:43:43 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1c60:e7b2:735c:e3ea:7972:e818])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3989670sm11988565eec.25.2026.11.04.09.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:43:42 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>
Subject: [PATCH net] tun: delete the flow entries of the moved queue on detach
Date: Wed,  4 Nov 2026 23:12:40 +0530
Message-ID: <20261104174240.138491-1-umangpokhriyall@gmail.com>
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

When a queue is detached, __tun_detach() moves the last queue into the
freed slot and decrements tun->numqueues. The flow entries that point at
the old index of the moved queue, now tun->numqueues, are meant to be
deleted, but the call passes tun->numqueues + 1, an index that never
exists, so nothing is deleted.

Until those entries are refreshed by a write on their flow or age out,
tun_automq_select_queue() returns an index past the last queue, and
netdev_core_pick_tx() sends every such flow to queue 0 and warns:

  tapq0 selects TX queue 3, but real number of TX queues is 3

Found with an LLM while testing how a VMM detaches tap queues when a
guest lowers its virtio-net queue pairs. With four queues, 30 flows
learned on queue 3 and queue 1 detached, all 30 went to queue 0 with the
warning; with this patch they are spread by hash and no warning is
printed (3 runs each, in a guest booted on net).

Pass tun->numqueues.

Fixes: 96442e42429e ("tuntap: choose the txq based on rxq")
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 drivers/net/tun.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e..3b292bce4 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -615,7 +615,7 @@ static void __tun_detach(struct tun_file *tfile, bool clean)
 		}
 
 		synchronize_net();
-		tun_flow_delete_by_queue(tun, tun->numqueues + 1);
+		tun_flow_delete_by_queue(tun, tun->numqueues);
 		/* Drop read queue */
 		tun_queue_purge(tfile);
 		spin_lock_bh(&ntfile->tx_ring.consumer_lock);
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672784;
	b=pHwJSIwUWQ9PvXhWLug5W73E734hBcN8JmiKow+2utq8OBGZPWlqpU/x9X/mffssF3jN
	 qE6gRuWdoY1J72XYgEnA1SstqVu1+fAHxbi622tYWAxBueRi9f7jlNvupAsAJAel0iHeC
	 a1EzNyRyiiJR4qWelDno7oyL3i6jI0LdDQ/PoTqzhnMoEzSSnBOC88twKOOhdBv2DVOum
	 qnRTPGjVWpCpj4sdnPw7g5r+xavi5H4RyEfFtUcXxN4zmENRGNHH1gmlRUa5KcRRjEeP6
	 apiDpfjOxmw9kCf8hTAHPcC+BTBWjI2SueUMlX+y2K2BT724ZGBTcKZdzfgj/TeTYfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UvTFqc8i3xyEhBMWLvMQamC41/wDFIIexgs3eOodVog=;
	b=vKqnmRJtD3Fn5Jnn14yKU+q0J49jSFimJi2PJSEXe5ZExKaK8i9sqhqF/BH5Zn4fVqXH
	 /rij3n/PwQ1mCD1qnxwH7jbU51zssMbWQvNd9KLsTSK+l3RRNIjpV7UACVuWNq1oBvPAW
	 l2J/PyzrLqpI7MFCITKCxtBuRSyfNy3XT41pMseDySOMTypgtL5Odn7kaDwQeMU64rPWQ
	 +muQhisuO8MqPcrRDXa/9f0vmwoAvWpb4p8yx/ILLGFVNY9tOtDRzl3m4G297Ex8faj70
	 2fHQN5YVgmeGa9J2xC1LOTADKZXeAMACRxJ61bed9v+EjC+bciT168fV3lckIus3mtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c8HPKNYE;
	arc=none smtp.remote-ip=209.85.217.72
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3299606A8AE
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3299606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c8HPKNYE
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2eba20719so362979137.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672783; x=1795277583; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvTFqc8i3xyEhBMWLvMQamC41/wDFIIexgs3eOodVog=;
        b=c8HPKNYEmcHOl3IwX4ciUm1Q6JbHB6U7VIWphFKKMIZtXKciUK00PgjJ/KuE8gAE25
         l/Itm4h5f3A6xVkzCCo8KYJPdwSIZWnlE7EKOF63+NLvUE0i080hQkg3kk8zfXcI3V6F
         PALW6n5s3I3TgzLMYpoeTSRXKs6n858IISTr5QgS3bJyHz3VTrog51f9wM4lUMt3wj9V
         pCqAn5MKK/2HsBromVQoNuk9ttqii0BU15nqPSs/eaYAdh3GGh7M9IHehgXhD8XUBfOd
         yPKBv31VYOr10MHFUWQJFuhKszM5nnLlzJC2xDxQ4tFDouQCYxAJ/Lz7FhhgwfZS3PM3
         PLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672783; x=1795277583;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvTFqc8i3xyEhBMWLvMQamC41/wDFIIexgs3eOodVog=;
        b=NQ17oIdDPOt4sSOywNHigqBF6yG4B+MKzVTc7QI6xnJomNRdURCuLCzLpcHuNrPKWN
         hutrJTMVVBtLULp7prixZJRNm6sxkxJb+HV5Nxsysb1idpRVSI6/OAyDDNlOW5tiw5YC
         MT1Y8HJEBBJQD19t+O7y9rJaBexeo3ndqHxp0xVBCkykDPdcm53552O/+HvM1pFtP+qb
         OCJ6GZCnFG6qDRQp98sKR9SU6d/n26/ybG1UuikVQv/sX8ncKfx99ZUS+lF8O5vSb1oC
         Xq/3Lk0C52NKUXGWtrzmSr6lM2V7359kMRyftLDbiqyH0rvr6YeSmX2dgjXkgyanCN1s
         Ze/Q==
X-Forwarded-Encrypted: i=1; AL+hErERkh+KEcsH2vYVUYQaCobWYdyQP3NfJzEfCTpQ2Rm/TjuB/Ik1fwqNRBg5MmZDK5FnzV/qmxoW16ZNrm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f6u4V3UbJxcqqMO4nRxuatC118dSnYKyKJMvmzLIf5ZNNrOLK
	sCWvP6e7jBuIzdM5lNNDurDZATlaskrfpb9H+Vi3r9RnjZs25P3DcvQTV/zSnsPgbAJCb9f28KD
	T2iebidjoaMEUvMAB5fVjj04DGw==
X-Received: from uapd15.prod.google.com ([2002:ab0:724f:0:b0:99e:d09:7f0d])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3594:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d64d8196f7mr2244002137.25.1794672782484;
 Sat, 14 Nov 2026 08:13:02 -0800 (PST)
Date: Sat, 14 Nov 2026 16:12:46 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114161248.3428695-1-thaisonphan@google.com>
Subject: [PATCH net 0/2] tcp: initialize missing request_sock fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Cc: Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Initialize missing request_sock fields for TCP connections accepted via
SYN cookies, where cookie_tcp_reqsk_alloc() and
bpf_sk_assign_tcp_reqsk() allocate without __GFP_ZERO:

- Patch 1 initializes ireq->ir_rmt_addr and ireq->ir_loc_addr to
  LOOPBACK4_IPV6 in cookie_v6_check(), matching tcp_v6_init_req().
- Patch 2 initializes the AccECN request_sock fields in
  cookie_tcp_reqsk_init() and sets syn_ect_snt in cookie_{v4,v6}_check(),
  matching tcp_openreq_init() and tcp_{v4,v6}_send_synack().

An AI coding assistant helped audit the request_sock initialization
paths, write the QEMU reproducer, and draft the changelogs.

Thaison Phan (2):
  tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
  tcp: accecn: initialize AccECN fields in syncookie path

 net/ipv4/syncookies.c | 5 +++++
 net/ipv6/syncookies.c | 4 ++++
 2 files changed, 9 insertions(+)


base-commit: 19ec8416a76c08326fe5f814410a1b43046e63be
-- 
2.56.0.611.g1030f0b940-goog


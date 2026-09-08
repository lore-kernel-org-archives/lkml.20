Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2C51A742
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863905; cv=none; b=R5w0zxkfyl5B9HC4qci2ApZrpfXdTP6Ho0p/Pau3aejimnRzdWv+rLEF9BrUhH7XJX6QwZ4rp1eNQEkLxiWnZSFNgUUuHEbJQrigqgESFhXmuXn4C34yZknLHEUkdoiFP1z+7hwk/N3/7+UGE6jt6ESZjv2DUAzLohJ1nlA0IWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863905; c=relaxed/simple;
	bh=PoJ6Q5M0DPUlQ0YysIg5TB4c61efy8lFCLIq+TrJz8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upMzNe3apOmWy1IrBsqYCSQlIffjrlbChyfd95p/KFNmr+8ba1goinsMhHlfNhsOPEBgZQ2BBtEAbsOSdCUUKtcMCD3PiX4UQNU2Q/Nl2bSaKxaXlyQwMy2kz55SvqXgaya9242SFHXgC2ka0stOqGObcbNe1DCJwRxy0haSvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=LsjfDbJn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="LsjfDbJn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843703c170so300350f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1788863902; x=1789468702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbZ7q/pzMG2HFYHsDRloOW3kv1MN2rhYA4VNX+/OTZ4=;
        b=LsjfDbJn81Y6tsLA4vth47qYc7c9Ieu0/+is5HR6YIRzJp3BHQiJQli7AuWPqvfi8L
         M5Sx1380iEw1nZT2v6k2bofEr/EGDb+5SmFEtYa1c3lnfCuFzehf6+95FSRe9twr5UrH
         ihdKM0UgWbsti52l9PLCTi9eEPw9tZXpAGEBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863902; x=1789468702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbZ7q/pzMG2HFYHsDRloOW3kv1MN2rhYA4VNX+/OTZ4=;
        b=D8/OxhYLvyUUnG5yIohJFI7uT9rhWZafDiCHgpLfg2rh8iZ2k8g4RuXaeA0xO+DYWz
         vFDcwabhoAD8t48ueniU58UWWHMA/+o4SYXBhX/rtDGScN5XAuhBVl4w0MEqZzww5Og2
         ZzKVkeb6Fd+p0StKU376pRBqjJaq8a5Hul7GLpGoayQIrI+tc9FLQAzJ2DD3Kg5g6Q9S
         ojLNFXrVzEEu7WiAYFqEXR8rxcpi9Jt7+8FXPXe/n2zFU66snes94KcxK/lk6ByJmJ3F
         OHNZu3z3UqjJvHq0KyVFa92UnT4Iet0wsuPNK0fsJtnMtdbuywrtlsbvfTE1RuFXYqtn
         GwWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyoq+ad4o8UluinwW4L/ztXRxSqEARecjxkBFdMNY04ft7Kj6Ej0SW4ELEFp8rdF2bijQBsmG0nppIFk4=@vger.kernel.org
X-Gm-Message-State: AFuF++nf6N9U20KUqPBzM5heicYBMC0XNbYxxdsPyC5naOpLjaXIiZMc
	VdqrQxJlwUPxrLgbl8/IuadDx/k8pKtLDimy8h6PH8a/y6bbC39KUoAOzWJz3bZXYw==
X-Gm-Gg: AYBFou1zrG5OEv3LYunPsQKtoIhI4QdlOd0NlCVg0NzfAYST5AQ29kMzKxUB8BfwKad
	aiZophjJwufSGwvnn4FP2z8TXF7pUb5lexCrHYc5IIBBdrWecyOZK5E/9TP1eIfbpqjnCXw40zS
	6CBVphu7bWc8A/k76Gty4a1QHV1G2xwDKbbGeGgq0cw+ST562jQ7YG5qcIYzJZVkUz+ev7UsGBw
	5cUdbI/rL5FrDrO58C6LLZe1l2ruImH2uMbMcHkkydzdvNT2jiImCCDQvPt+K7K9i+Ds7hsYpLk
	GSbXie3eVhKbN6VaOXhw+cFa+R/dElugAw8BvBIFjJ+cqrUBkSwdtINxaM+lyQ2GjvcnApPu7yh
	MQkMjsehNUp54LPX38AbB468G2Csy/YzMZpoczevNjdudZmMX1sz71C9wZ2Z1rbaw27GMf2i83D
	VHpWs/cVgEbm7pROxAuvLDYTKJApGnIVnTRGGUKvjF7oh8hUvIArbbk6C57/stqBLnhq06gonIN
	VSAvHZN0QRTg7N8hJxhs1StWIM=
X-Received: by 2002:a05:6000:2501:b0:482:f930:95be with SMTP id ffacd0b85a97d-485907aaad6mr18498773f8f.2.1788863901975;
        Tue, 08 Sep 2026 03:38:21 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm37697594f8f.24.2026.09.08.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:38:21 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: edumazet@google.com
Cc: ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Subject: [PATCH v2 2/2] selftests: net: packetdrill: test exclusion of old ACK from TCP fast path
Date: Tue,  8 Sep 2026 13:37:15 +0300
Message-ID: <20260908103715.1402788-3-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
References: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il>
 <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a packetdrill test for an in-sequence data segment carrying an
excessively old ACK.

Verify that the segment falls through from the TCP fast path to the slow
path, where the existing ACK validation rejects it and sends a challenge
ACK. The payload is not accepted and RCV.NXT remains unchanged.

Based on the reproducer from Commit 3d501dd326fb
("tcp: do not accept ACK of bytes we never sent").

Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
---
 .../tcp_rfc5961_reject-old-ack.pkt            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
new file mode 100644
index 000000000000..8e7229127670
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
@@ -0,0 +1,23 @@
+// Test rejection of data segments carrying excessively old ACKs
+
+0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
++0 bind(3, ..., ...) = 0
++0 listen(3, 1024) = 0
+
+// ---------------- Handshake ------------------- //
++0 < S 0:0(0) win 65535
++0 > S. 0:0(0) ack 1 <...>
++0 < . 1:1(0) ack 1 win 65535
++0 accept(3, ..., ...) = 4
+
+// Populate receive memory so the following segment can use
+// header prediction.
++0 < P. 1:501(500) ack 1 win 65535
++0 > . 1:1(0) ack 501
+
+// Send an in-sequence data segment carrying an excessively old ACK.
++0 < P. 501:1501(1000) ack 2794967397 win 65535
+
+// Challenge ACK; RCV.NXT must remain 501.
++0 > . 1:1(0) ack 501
-- 
2.43.0


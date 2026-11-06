Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977524;
	b=4/WHKzPBmrUl8NObXtpPTOVPZzutAI3t99rmWkJr07+JmUs4hZT9GF956see3wX/qpAx
	 p1A7FXHfKIHciIZtFEjxGp+4PKkDf5lG+OkGmZhJTLamHE2L2kw3UbCaR6ovwlRw5gqrT
	 RLrrKrDpB5e6+xOa5PTO1FGpqS43BTsvlnY7SX+PWOEBr5kg+ov98R86sX2DUfURMbqm7
	 u7s9ko+G/oCL3eOY6ozCqI5VgpinhWVQfLves82YpZTOLoE6hXQIdfJWpPLke5eEZ7HJg
	 0v21UhrAh7SbU9FcolKMvRr4eiizXFXUW8G+jBl7/5d08ks6qMclzSNL2AsaPAKgNYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AmiW9emmj8T3laIwBfZf//xv7IetRbnMAUqXEU+CEsc=;
	b=RLkwg11Kmpm3ShqvOH/ctFNcC/bUmD05Ml4m6gw6S1Iig8p9s6rLXfJfPd6O5k5LeKvD
	 Gw55XfQY08k7z5TnAh1WcFc0UuW0d5/SmrO5tepTL4vRPhWUeeH0e0VTYSRNVdfsl/KbQ
	 nEgvi/8b5x1YP/1wGS+QuuIWWBHkpwUPxTiNb9ZvW9wRJW0s+2n8O4Gz1Rta12enn7r8h
	 lt4QfmE3vIiZeYf6qi7RLy63Cee3Ky2KKKoIzKrBVlwFmBC6O8spbdFIOsUt9wffkGIot
	 hrA+yVWf29s5qxQnpjJfaU2c7bYTAjmVzFNQrOz1IFp4LUHO98/bM6PnIG2mYYUgqhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGusTcbF;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B4606D80B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4B4606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGusTcbF
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1f80b7bf6so653715e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977522; x=1794582322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AmiW9emmj8T3laIwBfZf//xv7IetRbnMAUqXEU+CEsc=;
        b=yGusTcbFvJMxDWFkQqL7/7VJc1srXLp1ZyzkqHljAh9MJgxGv0TdBf2kCq4x40R+8N
         +uwVNgGt4KQHUS6+kqz+zb92xHF/zFdVYC9D+KTiXRelHT/2ym1HxC3v2h9uoS3XyNTV
         Ah2701llocXqBRcfMeIY11U0ipBWRCj4y1vl0MWadrdDFIEZH7PfO5EINmVW3B15CYKF
         smvJXapilCrmhv4OIowo9s8cLk5cus2nG+e2z/akTx0pNMrSVKJbaGKZW9fFRChBjVQ6
         Ye9UsBgrTBmQqcmaBWUkAZhtTnoTfxeRV2ohscUmyF+oHkluWLECHsbSUpXcB4ShUF8q
         BQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977522; x=1794582322;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmiW9emmj8T3laIwBfZf//xv7IetRbnMAUqXEU+CEsc=;
        b=IyfJ8MheHPah06b5FKfd9udLGbs2CNmkCS55xPrURVZFnLX9uSvAOm8q4Su2MPi8oh
         gvOxw6CxPuQXW+C7Cc2vPBfK4BWRa6e27dzr+fLF7rgCpr0BnvMvx6BsH2DtybFqaXX6
         R+N3xi2uHn2qnFdUOoqCtVU4QKLpHWKEt8TK216kVajab43CRbgoq22yKgNzBBl5Zkf0
         PjwGHuYBIxYk77MIbwUFg3ap5Xh19wLY5yOUxa08a0vo+1CN9hBxNJFodiicfkv2Up3f
         OB202b8wrrCqtUTqEVOdheGcaUJxmaggnWyUwtZ4fYrhPT6zOq3HMCpyZtTexdCnEw2t
         R/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwn4Vrvla00YbJ99UgjhaebJa6qVVFRzg0sOQjqg6Ruk4o1xZhck1FxUeuTwkStGlefDSqxB/P0IQ8ZvH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qrF20/wY5Cj2M9BAVZm9AiM25mp0MSsutqUujk6VtP5odXX1E
	iNa/VPfIOcfjPHfIgFHX88HH3ZF61MHVvMKmqJpvVn/Yo0q1YmS/bMCF
X-Gm-Gg: AYBFou0sjL862ADyQeclXpuc++xPAqLZDzkgVpxh2jQvNYgucrSMBn+EV7WQoE1CU0g
	Q2vJEFJbBNQ+XL3uF88BT3lhMx2hDZY6IGASEm/OlcUZwJ1xCtiG3HpHttN1UIAFraufu9A4Vzx
	5lRM80+MrCk7iC4Lip+gnrIpt+sldA6Rp/rj59ieYG6VAr4ulrp+qpcdJKqDAOTtLILcBaKCxKJ
	b6dFDXeUixK1RBLSalsZJ5/1XnEHujot7armving9lvH8Zjm5Yx9bWpKSDq5PKqWzgMoKdXfOoO
	hW2zraTWPCQa3TIQ3Uiy0G0SNOTRooa0Iey03VN9aSSotZkpV3WeXpac3q2LAw9AqbAqlVop2Sr
	C8kd5F3NsSjdmfQQ1yUJc8xaA2R3gP1/JmhxPGRC7nDI9QJD98oN4UdwF5LyYnBEgu7xfQlm2Zi
	JWDTnJF422r9Njtg+MRhJF64S4Bkr2GtzS8cJ56ZcheSAVaWHJpgRlMFhq4/5NTjMu/9QPsuWHE
	/eB/Afpusl9EzLPMFPhfutydRkfCYhaMyZo9l6Aq1vMAh8HkvGtW5Q+g6a6FE5gZoHO8rTu2v1S
	yOwPwZGYW/rzn3rv8lUZGbb97lkhGv8/tW5IPmzwHOom2Z23KQqQpBMqq6ZyY68+jBgydciq
X-Received: by 2002:a05:600c:c111:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4b6d8a63e17mr41374465e9.0.1793977522560;
        Fri, 06 Nov 2026 07:05:22 -0800 (PST)
Received: from localhost.localdomain ([193.255.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm260950305e9.2.2026.11.06.07.05.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 07:05:22 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	hmohsin@meta.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net 2/2] selftests: drv-net: ring_reconfig: skip tx stall test without channel config
Date: Fri,  6 Nov 2026 18:05:09 +0300
Message-ID: <20261106150509.30458-3-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
References: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reconfig_tx_stall() needs at least two combined channels and already
skips devices which don't report enough of them. On devices whose
driver doesn't implement the ethtool get_channels op (e.g. e1000e)
the initial channels_get call fails with -EOPNOTSUPP instead, which
YNL raises as an NlError, so the test is reported as a failure.

Use the _channels_get_or_skip() helper to skip the test in that case
as well. Other netlink errors are still reported as failures.

The issue was found through AI-assisted source code analysis
(OpenAI Codex) and confirmed on a ThinkPad T480 with an Intel I219-V
(e1000e, 8086:15d8). As for the previous patch, the test function
was run against that device with a stub environment and ethtool set
requests blocked, and is now skipped.

Fixes: c98610c2eb70 ("selftests: drv-net: Test queue stall upon reconfig")
Signed-off-by: Bilal Yazıcıoğlu <ahmetbilalyazicioglu@gmail.com>
---
 tools/testing/selftests/drivers/net/ring_reconfig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index baac20e8d3e..dd6ff6b2b64 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -319,7 +319,7 @@ def reconfig_tx_stall(cfg) -> None:
     other_queue = 0
 
     ehdr = {'header': {'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    chans = _channels_get_or_skip(cfg, ehdr)
 
     if "combined-max" not in chans:
         raise KsftSkipEx("device does not support combined channels")
-- 
2.56.0


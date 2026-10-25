Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901132;
	b=uM+qa0ymxzNwQO1IJTDU54MUGTKXT/Pdl2m/MGSmCnUspOmt66WXI5u9YqV3pBApdWuJ
	 +m8r2WnHhrm5BXVXVct7iIbwTy3edocTCWCEN9PKQcmkvr2ItSNfka1lgf4Ydk3zyMNA3
	 dwvalLbY+WTc2hYJJV2Kd5rTuJkRzuIoBUhXfOReD3zN8YpWgeBa7CJICymAIcgUJRcdA
	 zDMNL1MKFKB8DBj2QmhIFxCfW0wBIviOr4B94jBboTuRfUYyXETrkkq3qG/8zOkQJ3MBu
	 zsaPeKsd+qQ9kQ0eua6K1GN0rpPMACifRuGlTdGZTaQpCsN0pvKpfZnRLHr/nhVPo7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gTPwTs6KQ9y0OogJsarYNN8wQnpNX/uHSQbAgmpcfg8=;
	b=oh1Kkuj/6bUzqem5xz35/NKN/MhvtZJLAmvcoQWAW2OFMw/Rqo+bl+nzh4hHrccMsRwh
	 AmekIO+NI/kEBIgtuufEpBKdmFYnBArHeYwxaNJG/j+48vM/o+sUhYsdPvQ1kN/I7Yeqs
	 vqGJ5sL13aeOdRYSskULnYi4IK9rfrVj6NCcJ09TcB7PAoVRGxPTZtLOpdzb3OK4Srz56
	 1YFQjExFOp2Ce8TpkKOeKQ2WkWL+7RVZZDLx0BomwJKYRXBPtT62dYXssGI745Wvg6dtE
	 ulyGfDvsoL2lXeP+XYOMR4IUBkM7rmHkUbT9tR3LM38bFkQjQUWLo2UWa5o3uFO6DbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WruFuch8;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86C606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E86C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WruFuch8
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e6ddd4554so1274110b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792901132; x=1793505932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTPwTs6KQ9y0OogJsarYNN8wQnpNX/uHSQbAgmpcfg8=;
        b=WruFuch8yfURzb8ZGFIy5pQuDQ0rbwdUz8UzGedqewcmOlonpl+TOvKkBhHCS8k7zx
         QbbfksQH3++GId6saBoRpRwOtzWEtX6yya4XyH7zRfW4znWbi+Q6wbCwCu+HvfT+/oKa
         f0hgXQ+kVNIdVUPgt6H528AxLSEoLJsjnCiGSjrqwSNnUW3DvSvSQUhb/pK44zMMW8ys
         IU1zTOsnm/isPBN2KEbK7VvbwTpV1hE9bKnRPuVQCWg2TcEvKIk/jy2iJKswN6mOKNv9
         08xshmL2GCo1FzaG8S91+IEuypW7MhOx//Z2sjjDb8PiuxjMeKILtghCGZ0KoUs1yqsZ
         hrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901132; x=1793505932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTPwTs6KQ9y0OogJsarYNN8wQnpNX/uHSQbAgmpcfg8=;
        b=eNR04vKAO8iielusqbpinPu7UNFJ40nRSYTwxiCha0dpS6BqgKvX0NL/1xKwVH+dVp
         YoT0PtVKiY5+UO2AXSyup2ZvEByiZ15sUbOqTo7WLXkbfoD5ogn4C5g5IdJBnubA0JWj
         8QHPTSBBt19ib7qLttwjW1PbXovgA1uN3nq0IHFZLLmmX67H+DYohYHyB7TGQCt7cEoJ
         FxA2sPufNr9t03z0/KdtWMguj2m1otHs1PTtC8lh6pfAHmgACCogcbYGOaYck5pRcO77
         MZuKGeb+CBkJPO7A30DIHyTQDQRuIgu2fWiS/tpxf5WYZ2ZZ2C+hmcZqdet/ZeXyFxZg
         6bog==
X-Forwarded-Encrypted: i=1; AKwUvByqMFdnTtcSNrnP0xaMznSK24Grj4cqJVFrj50vPYnTh3zR7KcOOIuTD1/K99wbupT3Pakg4XKSM+0VAUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTlONrX0zrgIRxuMGjsSeRaT4/BiSXuVmeDlsZThCtdbUfa9Lf
	eVbLehcWLF6XB/N1aMpFksxdlnRKiS3hlX7RytTPeo3pfAT2w9zdzvP4LYobflgbL7vLXA5abGj
	77eQqyw==
X-Received: from pfbeb23.prod.google.com ([2002:a05:6a00:4c97:b0:894:b24f:9540])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b56:b0:89c:6036:c63
 with SMTP id d2e1a72fcca58-8a366d7a4e4mr2631352b3a.32.1792901131466; Sat, 24
 Oct 2026 21:05:31 -0700 (PDT)
Date: Sun, 25 Oct 2026 04:05:23 +0000
In-Reply-To: <20261025040523.678027-1-weiwan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025040523.678027-1-weiwan@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261025040523.678027-3-weiwan@google.com>
Subject: [PATCH net 2/2] selftests/net: psp: test bidirectional data transfer
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

_data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
only verify unidirectional data transmission from the test socket to
psp_responder. As a result, they do not exercise the receive path for
PSP-encrypted TCP data segments arriving at the test socket (such as
packets redirected across a netkit interface associated via dev-assoc).

Use the existing "data echo" command in psp_responder to verify that the
test socket can also receive PSP-encrypted data from the peer in both
_data_basic_send() and _data_basic_send_netkit_psp_assoc().

Signed-off-by: Wei Wang <weiwan@google.com>
---
 tools/testing/selftests/drivers/net/psp.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 473500901879..e507951b440b 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -120,6 +120,12 @@ def _check_data_rx(cfg, exp_len):
     ksft_eq(read_len, exp_len)
 
 
+def _check_data_echo(cfg, s):
+    _send_with_ack(cfg, b'data echo\0')
+    s.settimeout(1.0)
+    ksft_eq(s.recv(5), b'echo\0')
+
+
 def _check_data_outq(s, exp_len, force_wait=False):
     outq = 0
     for _ in range(10):
@@ -478,6 +484,7 @@ def _data_basic_send(cfg, version, ipver):
 
     data_len = _send_careful(cfg, s, 100)
     _check_data_rx(cfg, data_len)
+    _check_data_echo(cfg, s)
     _close_psp_conn(cfg, s)
 
 
@@ -726,6 +733,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, ipver):
 
         data_len = _send_careful(cfg, sock, 100)
         _check_data_rx(cfg, data_len)
+        _check_data_echo(cfg, sock)
         _close_psp_conn(cfg, sock)
 
 
-- 
2.56.0.257.gf7497c7d27-goog


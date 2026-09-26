Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BE1CAA78
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386091; cv=none; b=Se4dXIwLTiPC6UErvus36diQb1nvVjjisMHjbw0/gRfG4NMsHiz2qMe9vecZx9kjXW4eG0k9Ji8N0C0yBY9dF3iRtFo9/KCXms7tl27Lin7nrMSYEy71NKbv1nN/YNv4XX2tGX9/CW5sPKqXh7JHvKr2ImmZkUA7ich1XelKoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386091; c=relaxed/simple;
	bh=mz8Xya+gPiclZwIhsBkxksxF7ov6sWOduLtKykuks78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uORNsB1gl8gI2rc6xUdzEmCMJbO8O36Et8qXTq7avJi1oBHDvtuDSrNntNipWcttSuQRSuqKcy91nEwCDHm4LHyUXXEIl1PrvAvGEmILtW3NHh/wrrS90F/XqkHw71EWGUvsormh2yyVzaBT8RyY9t5pE5qXr/5mCyWzAuBVLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibRwiNDW; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibRwiNDW"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f1354074so354965a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386088; x=1790990888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTW4OSle0I3w8OnmtDONa5t95Cmh6dnFxar+YNwWTOk=;
        b=ibRwiNDWTdyruiqBQjC8vFlAe0AkGk6JmZepkKjmQZbXirV7RDyaIMpJ1kJ9645krW
         EmAoZC+vvYw3neZi3fnw1XVnNsHwijp9IXEC075C5o5v/oA3K+nwHO/EaFrgnxdhTCBm
         Nhe663oPP7M1q+F0vEG0vGFg6pnJUzB6A0yRrtIfna/P09CzilwFqYSH/WpzJJr0x/2/
         rKfyWJoC3Hk5jGMh4+ZTOqHCb3UYMoqGKX1uuTOJuM4JdoA3UVjtXQWxCkbmn3GBqOxl
         uTyAo+pzsS0speu5kgkEDfLUxWZSS816hKFPtxm1sjDvKHoN9QdsLfHtpzXNVJ9hVV6A
         F6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386088; x=1790990888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTW4OSle0I3w8OnmtDONa5t95Cmh6dnFxar+YNwWTOk=;
        b=GHsHiPoQML1YCBdNp0Jn/6O4Cy+PHTCUoZe32e0bcK9c5+JjyEeAUJhRG+xjFhg4oy
         mExRCfKuX9AVB2PursAUkJ99NkJ8hlOTQHu19KDAFYzpukAEj4K3l4ngRLNYKxSqJYd0
         vvpGd/GJ54D8PztnVyRjQZ3UdX2YPliUlBvrMctfiFRZ0zh/NnQU6EVy/U++WpOE/SKO
         c2vohst5Af18lZ+38BYltibc6SHqDDTcuFOkSBz6JD8+XuzVFGUJKc28zDOxMQFnvDoJ
         C7dW2YCh7NDOvVZPRUskgSNxvtqlpTSwssYPaTfli7N0AfVbJllXB0JX0ieCMfPs0cS9
         qpzA==
X-Forwarded-Encrypted: i=1; AKwUvByKL+yIGpmuj56imU+Q/MuwG+OY83W4y3lDJldXfOthXBm8VutTn12JcRWu6ucov2oIlwGh+xVCL1tty8s=@vger.kernel.org
X-Gm-Message-State: AFuF++mwEw9DCjgsTKpQcXMW60//tTJemDSA7Qp4jeQD+u3YbOCKyheN
	x2Hwki4xz16uzCTGIJYEx1SMy3MG9NU1VeSMMj4asgmrNnFOPKEM8tsT
X-Gm-Gg: AYBFou3oBTAGebjxU9sbHmJH9yO9VazbD8fw7sdqS4cVJ1VdFtlBbiiNzi3znkd65GG
	0leAsmKzaDz1wIVqnBGGob6UKTsvMYkqHkWDkpeVdYYuikaPu07moaN+nVqTkZCxrDTLkLZW/ZG
	k4Ar8iksvKKSnq5gGN7+6XSnp5G2IZOVWwpIuWHDoGWA0IzVo783BGLR1XX2lMUSQX0fCQ+38CJ
	aIOhnnI50O6SPZX/SDIUbOVS4qzGcDXrKl/tfP2/6By28AuZhChKEosXzl99BgMgwXrQtvQlk2u
	NWZHZnKC8BZf2iLMp8eTByZSGd16XwCgwi6wKw5w1mKrnqt2FIL4GD6rGdmZ9rWgSV3+BUh+w+x
	6WAJ94E2FruLUM6F9VrfbyIs9405qyMj2h1YqDqREI7lGZ5rJdwUaQs51FLkIG7rxuO5JaypyKI
	gNslprmzdv44o0GZCkoQt3HvU/yqxE4iBQJ3ljG8rB5+Btvl7Mi3Wcd5oNioKZJSd93vCm
X-Received: by 2002:a05:6808:17a5:b0:4c3:cec9:fd18 with SMTP id 5614622812f47-4d72af50de4mr7327372b6e.11.1790386088487;
        Fri, 25 Sep 2026 18:28:08 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:4::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf849da07sm3566547b6e.12.2026.09.25.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:07 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:56 -0700
Subject: [PATCH net-next 1/4] selftests: drv-net: psp: swap closed for
 connected sockets in assoc tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-1-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
In-Reply-To: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Future work will only allow rx-assoc and tx-assoc to be performed when
the sock is in TCP_ESTABLISHED state.

Several assoc_ tests, as well as dev_rotate_spi, test using the rx-assoc
and tx-assoc uapi calls against sockets in TCP_CLOSE state.
These tests don't involve sending or receiving data, nor involve looking
up psp device by dst entry, so using a disposable disconnected socket
was just a convenience. These can be replaced by a disposable loopback
socket.

Some users of rx-assoc and tx-assoc on closed sockets are left, if they
validate errors that are returned before the kernel will check the
socket for TCP_ESTABLISHED.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/psp.py | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 5a81f40cac7d..0a2329f41431 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -11,6 +11,8 @@ import struct
 import termios
 import time
 
+from contextlib import contextmanager
+
 from lib.py import defer
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import ksft_true, ksft_eq, ksft_ne, ksft_gt, ksft_raises
@@ -58,6 +60,17 @@ def _make_psp_conn(cfg, version=0, ipver=None):
     return s
 
 
+@contextmanager
+def _make_lo_conn():
+    # After tx-assoc, the client's egress is dropped, since lo has no
+    # psp_dev, so its FIN never reaches the server. Closing the server
+    # resets the unaccepted child, and the client accepts the cleartext
+    # RST because it hasn't received any PSP traffic yet.
+    with socket.create_server(("localhost", 0)) as srv, \
+         socket.create_connection(srv.getsockname()[:2]) as s:
+        yield s
+
+
 def _close_conn(cfg, s):
     _send_with_ack(cfg, b'data close\0')
     s.close()
@@ -200,20 +213,18 @@ def dev_rotate_spi(cfg):
     _init_psp_dev(cfg)
 
     top_a = top_b = 0
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         assoc_a = cfg.pspnl.rx_assoc({"version": 0,
                                      "dev-id": cfg.psp_dev_id,
                                      "sock-fd": s.fileno()})
         top_a = assoc_a['rx-key']['spi'] >> 31
-        s.close()
     rot = cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         ksft_eq(rot['id'], cfg.psp_dev_id)
         assoc_b = cfg.pspnl.rx_assoc({"version": 0,
                                     "dev-id": cfg.psp_dev_id,
                                     "sock-fd": s.fileno()})
         top_b = assoc_b['rx-key']['spi'] >> 31
-        s.close()
     ksft_ne(top_a, top_b)
 
 
@@ -221,7 +232,7 @@ def assoc_basic(cfg):
     """ Test creating associations """
     _init_psp_dev(cfg)
 
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         assoc = cfg.pspnl.rx_assoc({"version": 0,
                                   "dev-id": cfg.psp_dev_id,
                                   "sock-fd": s.fileno()})
@@ -234,7 +245,6 @@ def assoc_basic(cfg):
                                   "tx-key": assoc['rx-key'],
                                   "sock-fd": s.fileno()})
         ksft_eq(len(assoc), 0)
-        s.close()
 
 
 def assoc_bad_dev(cfg):
@@ -320,7 +330,7 @@ def assoc_version_mismatch(cfg):
     # Translate versions to integers
     versions = [cfg.pspnl.consts["version"].entries[v].value for v in versions]
 
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         rx = cfg.pspnl.rx_assoc({"version": versions[0],
                                  "dev-id": cfg.psp_dev_id,
                                  "sock-fd": s.fileno()})
@@ -393,7 +403,7 @@ def assoc_twice(cfg):
 
         return assoc
 
-    with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s:
+    with _make_lo_conn() as s:
         assoc = rx_assoc_check(s)
         tx = cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
                                "version": 0,
@@ -402,7 +412,7 @@ def assoc_twice(cfg):
         ksft_eq(len(tx), 0)
 
         # Use the same Tx assoc second time
-        with socket.socket(socket.AF_INET6, socket.SOCK_STREAM) as s2:
+        with _make_lo_conn() as s2:
             rx_assoc_check(s2)
             tx = cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
                                    "version": 0,
@@ -410,8 +420,6 @@ def assoc_twice(cfg):
                                    "sock-fd": s2.fileno()})
             ksft_eq(len(tx), 0)
 
-        s.close()
-
 
 def _data_basic_send(cfg, version, ipver):
     """ Test basic data send """

-- 
2.52.0


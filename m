Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984938F651
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513915; cv=none; b=P5R8ZxIR4i6U8L7N1FEAbgRUuwfxYUqYHvHqjRfZ0umKfJaZgdpgLBiHaq/AlSiEUJOFi64KNAP0lbOlZylMfTAd/+oTL6vVDPTFq4FY5UXqifaHH1vD/aDokiwhsisISMej/L3gd/kjyjYQm6DdX39xYzyPnIuxZp1AxiX/9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513915; c=relaxed/simple;
	bh=y6UJqHJdFjJ6HBQ9dPEgMz+8A6jHpPtqxx0jW8XZw/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGIFKhFOz9CorOmxBvZS8Zy5Q6/+WNLsw+w4LJOtd2V54XHeonbRx3GgU71UHd+PaPenCLWgp0q0gxBv8bgZADdQ8f6udIwaV4l4cw+HCb9QYjfmbD4M0c8riGmeoNNRLF56pIyL8UEhaEj6qrCmgqIK49R2ufi3F2jl/dBglrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGhkGtvb; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGhkGtvb"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae739df5so82056eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789513912; x=1790118712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYnx8lIChO5awa8u7wXu34IHHlum4k9WS5sRW0361To=;
        b=cGhkGtvb2/dtLXnOJSd+h4Dz73eqp6uwUZR4FC0tQIcZjQ6USwvcyMigmIz/pg9ClO
         v8HEaUglT/ImBaPXNfQVgdGhWrdn1fETDL7rYfwinq/4tssCD2N209EJoJjteHdESxvP
         R67yse0XkBSe/epgnD/OUIY+8+hVMy7wxs9uUQazs0vpDnossWM7vxIW4ffN66DcHWHt
         SVzAYIziHaSeCRSp0BxFNwS+Floqf/V7vk+WWk1ImUGIfjXo2EhYBriFpEA+/otOC8Iz
         g667U4ROsy7SEWGQoiyRkty1OTI7Rh0hVEikl4/18dkA5Tr35HxjfUMFZEknuT308cNO
         Hamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789513912; x=1790118712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYnx8lIChO5awa8u7wXu34IHHlum4k9WS5sRW0361To=;
        b=0FJ0ABa6E1WWzmLXSeoIxr6dC6DetAy+aZ7qVqwo3B4EPofSE1Ko8nYc/7Rz93O2Dv
         L6Bsy8Dwy07sdRXNibyurfd1wFXMOAwI1CEpBnH0ih4kPan2CF3QL7J2hcqjapaVcwbk
         hn6y5GcuB4gphFbUKWNowV491vMy/hXAxYYf8QjZ/jjXx2LUdJU9S7xtZuJXgNhOG8la
         3xMIM1VBOAOOH6QvvcHfRPtVjVuTWCJyBfRMzfDxrut4vrs6jFLxKDJDbQH0XeS/gkIW
         YU1N4K0Jn6RZZw8L0kcozJcY5X7O2z6DDPjK+D1aRweUgZgoo5YlYUrSQ84/2r9RCvza
         1B8g==
X-Forwarded-Encrypted: i=1; AKwUvBwT3WchBpy5EV2CPjZQGPc3r+yRXjEr4sWaEEePEi8UNhvrJiXROyUzfAUl15aaW4KBs3+LSQJK6dgm5Yk=@vger.kernel.org
X-Gm-Message-State: AFuF++nDdCpAWKOHBER9SwMLTwjnuNikuzxnG5ZltLnKa4jgv4haZlLl
	S4UV/5XNGujpdgHcU3iOEzlNPQyfezJdgZBGQXO14XG7nqm8LREjdU5G
X-Gm-Gg: AYBFou0c03FGUhcv8OyWv6JWDRlupcTg8V4cZladJChJ03hWJiJsF+BcV7GxNkaKtIb
	cMZVq5VJwQeA+FzbYeonZdNPf0ZFINY/icxKewVqvIDUZBlVeYKioe2Qat7CY18NnwfAdvqlw3p
	ePHiFiCFzvUyN97+5RhnvDrao69oINxa9nUadkn18IlWGytHUJzqdjTlZazoiJvzMTO3F57C+0c
	ngDYOc6eyvy37zYNKnFJS1ASSissf8beULOUIgSKvlGdBNO74IXOEaLuLLjWpF+KnIAlU9K29mQ
	Hq9gjhAb4AxiLQ/JRUh1lY9a7z0s2vD+0YYXukssoSwJWnAU4V/IB6KRO6MEAuMxe+FdVODPBeD
	KDNEDXmI9tspVGJyJgrq7zF1cpOh0MwL90EoAfLbuuesKoMr6PKo9B3L7kZKYs0YIphAR8cDaTp
	uXF9r46qg3AujZRYaRHZlWXRI7ImvKP+2Z7zkfUiCMxMuUeQqGrxAupzx+SYuu9poggGoX
X-Received: by 2002:a05:6820:80c7:b0:6c2:c7b7:770a with SMTP id 006d021491bc7-6c7e6c8267bmr279047eaf.10.1789513912098;
        Tue, 15 Sep 2026 16:11:52 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1222340eaf.6.2026.09.15.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:11:51 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 15 Sep 2026 16:11:38 -0700
Subject: [PATCH net v2 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
References: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com>
In-Reply-To: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com>
To: Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Test both setting PSP after TLS ULP, and TLS ULP after PSP.

Add CONFIG_TLS=y to the drivers/net/config.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 tools/testing/selftests/drivers/net/config |  1 +
 tools/testing/selftests/drivers/net/psp.py | 46 ++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index b6989c7d3d9d..4838adf27fa1 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -21,5 +21,6 @@ CONFIG_NET_SCH_INGRESS=y
 CONFIG_NET_SCH_PRIO=m
 CONFIG_PPP=y
 CONFIG_PPPOE=y
+CONFIG_TLS=y
 CONFIG_VLAN_8021Q=m
 CONFIG_XDP_SOCKETS=y
diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 315648a770d0..a5b1e14f120f 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -23,6 +23,8 @@ from lib.py import NetNSEnter
 from lib.py import bkg, rand_port, wait_port_listen
 from lib.py import ip
 
+TCP_ULP = 31
+
 
 def _get_outq(s):
     one = b'\0' * 4
@@ -333,6 +335,50 @@ def assoc_version_mismatch(cfg):
             ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
 
 
+def _require_tls_ulp():
+    with socket.create_server(("localhost", 0)) as srv, \
+         socket.create_connection(srv.getsockname()) as s:
+        try:
+            s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+        except OSError as exc:
+            raise KsftSkipEx("kTLS not available") from exc
+
+
+def assoc_psp_ulp_exclusive(cfg):
+    """ Test that a TCP ULP cannot be attached to a PSP socket """
+    _init_psp_dev(cfg)
+    _require_tls_ulp()
+
+    with _make_clr_conn(cfg) as s:
+        try:
+            cfg.pspnl.rx_assoc({"version": 0,
+                                "dev-id": cfg.psp_dev_id,
+                                "sock-fd": s.fileno()})
+            with ksft_raises(OSError) as cm:
+                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+            ksft_eq(cm.exception.errno, errno.EINVAL)
+        finally:
+            _close_conn(cfg, s)
+
+
+def assoc_ulp_psp_exclusive(cfg):
+    """ Test that a PSP assoc cannot be added to a socket with a TCP ULP """
+    _init_psp_dev(cfg)
+    _require_tls_ulp()
+
+    with _make_clr_conn(cfg) as s:
+        try:
+            s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+            with ksft_raises(NlError) as cm:
+                cfg.pspnl.rx_assoc({"version": 0,
+                                    "dev-id": cfg.psp_dev_id,
+                                    "sock-fd": s.fileno()})
+            ksft_eq(cm.exception.nl_msg.error, -errno.EINVAL)
+            ksft_eq(cm.exception.nl_msg.extack['bad-attr'], ".sock-fd")
+        finally:
+            _close_conn(cfg, s)
+
+
 def assoc_twice(cfg):
     """ Test reusing Tx assoc for two sockets """
     _init_psp_dev(cfg)

-- 
2.52.0


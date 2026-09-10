Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85A39E9CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083987; cv=none; b=XDChqWlSX710+EkbK8/Q2//1AZt901V80vWQaKr8ZgBuEbbQKMsc6+AGekyLDLbGvo7dT4C+lkAVGyTIKuY4w5pVZ2Hf/BQATdD9SG/V1N8GWysofZbzlpBqwCWMoqREqLIcHd1M878YelA0PFe6p9EFCBnPk1uHxyhohMkgqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083987; c=relaxed/simple;
	bh=i5SSJclfpTZsD3tbZQrq1a93Y6jfPDeXDX017S0hopk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grebmCyahXh8iohfoBrmjw+V+YKO+MDDdmTjOCfpU8FP3uziUpzmQ84klCDQRtRYgh47J0EppEkr27khPs4l0QWrR/3y9J303ersnt8Oaek36m4NVYpXWmjuyb3dQfBB/S7EAiG9AAhF7UcgkXeYKjGubnG5UrrI+U+RcNYMqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7ivxdE4; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7ivxdE4"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bf948737e1so318595b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789083984; x=1789688784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n6jlSmBF1kKwhxMNpXMOGrKa/toteP0cdIVsSP+HbE=;
        b=T7ivxdE4Fif996iORt5oA7e3pLkxwRGj/3nP3hJCO0A9UO23rObl1IjQXF02XW7G4M
         lqlc864YT5wrsuIARDbQdxrB897JjqjUFaTobHCgh8rvtUjKqMt41Wxt5hQJi8M1R0sE
         fnZcfnBs2fNQHVZxE2/gujk78ISoUQGXWPJn2O5SvrZBIcYhA8MjMths9Nzjlz8t/0Jn
         W0emt2tKdBLL5pYBV4gRrmZ2XYPR4sN8Kb5TJ98JscmmGl8pNCPJcvHsxmb6g1M4ea/U
         +QCkGk2ZbObVKbmjgKStRN1UgkDktvQt1HuOntcnWpdrHKAR2cosmWuhvOWbpDdxUPJV
         UZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083984; x=1789688784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n6jlSmBF1kKwhxMNpXMOGrKa/toteP0cdIVsSP+HbE=;
        b=b2fUBcrPTK5YzWgD6kkp7xWi7N+WgyoeoI2EEllrc5VBEZTYCburjR8fitsHoaNfHW
         qi0ufhVJmmF3+qbaTV+xXswufQUPl6C5W15MhdEBpXcQ+o8aGnYW9nQfel+xiSPdxnab
         41nue7ydSQvJawqhClJXAtYXyjrM2Ot5UTTMiwRq6zPgKCIGyEWLS57P3VYLBVfkiwNR
         xKQkFjlQtk7CnDmJVR2EL7aZd3I8W+1HG9rSsQLN8vaKdDxtIgKmQ2ko8oXLBzqyC4n6
         j2oiBLE7vbcRzx6R7TGLmVSbmV4Y5uh5orhIEmJC9SIefARlXEmuxAfI5EGDcP8EwqDY
         OcQA==
X-Forwarded-Encrypted: i=1; AKwUvBwW0ouqzd0cDH9Xa/IzJJJnmwUfHH9d8OTEwUmNSq23cFkm3uKtQ2pwOzui+/X4b6IQnh4m7krwQdYpwFc=@vger.kernel.org
X-Gm-Message-State: AFuF++mDLHxnVVa0YZNLuj2iBYnmfLAzrTJIVSBIa5BtDc7V1w+jvqH7
	46sX6nSlH2OrPAsdE2o6mQWNAxvJF3YjRctdiW+X2nuLvmLDwCXA7ERJ
X-Gm-Gg: AYBFou3fbBOjYubVNR+Ioy2tUmlCDlsBU6N+y4la6LaWMz79FwOBae+5s0aqL1VhQ4r
	kyT1gLPgqErtmI6nMt4G8z0eNAR3v0r5eqvUfw/87VDPY2IpgOqvUFM2MwViwfQ7cnf4ei+L5Op
	Rgh461jPhnTZDeDVAcaXcg9xnAQxVi720IzS4bU2I67qz3pw9Ko2Iz1sAZ5n8aGJIKJg6RCNefQ
	e1o/44UN6F9b98BjhUuvf6+Q8KrDhF1Fg7MiqCBj2nb+6QYfFDFbkOhndbUhaHeZdVTTO5SmG7b
	52zVcMZy27GzDvbbD3UimqR+lwZEjPKWxIYO7W45+Sg+oBs4mR3CINhpGg7DE2NrbtviYkPtXTN
	NKuWpLa4oDczlHyAbh8+m9d+4aBMU0g6pkixnhKazDtyKPzLGpYxqaYz0l7eSsnD/RlQEnxyERN
	EGS4ww79VgjTgx1980vxji6pDIyAxpjgcJSWsihboDsHYu+Ac0cn6FZszojWVr10pMgarQ
X-Received: by 2002:a05:6808:30aa:b0:495:eb86:6e8f with SMTP id 5614622812f47-4c31bcf3a50mr2081426b6e.14.1789083983151;
        Thu, 10 Sep 2026 16:46:23 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c331bc9342sm698094b6e.12.2026.09.10.16.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:46:22 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 10 Sep 2026 16:46:05 -0700
Subject: [PATCH net 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-psp-ktls-fix-v1-2-e3f30aaeca4e@gmail.com>
References: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
In-Reply-To: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
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
index 315648a770d0..12b27f2a3fa1 100755
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
+    with socket.create_server(("localhost", 0)) as srv:
+        with socket.create_connection(srv.getsockname()) as s:
+            try:
+                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
+            except OSError as exc:
+                raise KsftSkipEx("kTLS not available") from exc
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


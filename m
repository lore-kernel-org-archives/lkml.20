Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39C399364
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483088; cv=none; b=bkdq4xy7AUGub3PDwJUWCBFbLhAVezMwjpZy6omopekf++qTTk4vrf8mpUOv4+Sw+Djz5Gk5S3fFbC6RnkKIuI8XYskH2Xfn4Med5V6KjcncaFp0oBOPc0cVuTiOZRGVvIUrCchcrMpfj++A5UuT9iDhZCmSscPvoeMNn/OaHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483088; c=relaxed/simple;
	bh=b4bJJKMYnnSOZWTAtIMwW+0Ztt7/kwnxaA42k+pn6iA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B4mi+uG4DFfhjXRXNb5sbBk3zqewhvvveIEwgbtLGGvANaRDzthCbl6eBPM89nhUcuePywO9QopzxQ+1aSU8ZgAa1l903nAJ/NAZs759qxhtnJq+kx6zddlB3qkm2fc6K6XZOpQARbbXsJFudvZNT1pjP/78Nh2ZRw1btxLxkek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cisoz62c; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cisoz62c"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-141395927feso5427628c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483086; x=1792087886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyDOMjXTDjzVI9PeVZYX8DHF8ljnr1gWYCLzLBAx5do=;
        b=Cisoz62c9+vWlaEC/QDZLaeAVFbUr+4POVYvhGBhHafTc19qf5/FE1Wme8censWLth
         6J1k/OkuQkMz/uoJFE7wTik06oom6zm4XwA15gRqh+ivGZnMsfJkag7ScgPOsHAj7sBg
         n+NT9beczedcaeh2/cFwdfpXlqh+7nHWoBTn304tJkJAARmtahdNuU2eWLp/dm8juZqM
         ChEMYiWKmYYVHhx13trAreCQagpC226B4RmM9ORcJj9nYS7TaweZrVDWurvcdPH3hKzr
         ttpItLF0TcsAhTCi0AsDN2qohsf0sC0s0TLnEPUdAOJ1yRUyr/fj5wvG5kEdnpAfejdO
         W58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483086; x=1792087886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oyDOMjXTDjzVI9PeVZYX8DHF8ljnr1gWYCLzLBAx5do=;
        b=owfQX+Frq0vjtuX3YDdf1//3kxVsYzR3iZMfVPZ4pfz/Xl67yHbYuJaCO3kIgLO2O1
         P3gZTfz0Q5lrrnYwzOFMdDIYOTwVJ1aRC66oUSMqfU5aFRWRitO8xnGFrFPVhyBCSZhF
         h/iEYusJtFqgXozJ4kIy48vCHrG0UvDqmc0nT/jN8F5c3ZrGkUtoaXOES231hlrrj8tF
         LJj9VGETxvbbG34bU+T6fZ4GZmr4kOgoESQGKMsthzfOLM73rmcnuSqWkjZWzpUyuLHH
         f6x4XPPeyRySZaZ0PZxjQu+OoDMU8/cHAF5pjEroZqFQIUmTKtrg4qDtiUfUwD+6AHas
         cSNg==
X-Forwarded-Encrypted: i=1; AKwUvBzj77vSw5bPFIXCw2q8Eb/CSZi1x3LfvT7tvayGcvz+keHv7EwHEbV/eJUYrOtWpdG0g++yCnfQeL9T0tY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI05jeOp+bbc/1lmvFg8l4XL+BD7bcPk+yD1gmJ+w7WHhZzMJfP
	6gsjNkcPFqtVgUT+MU1eOVF2PThE/1liK4cLhm960UrhIBT+2VMVwFj1
X-Gm-Gg: AYBFou3Ofs8h0S4A08JZSCIcknVJuya8l9kEIpMhmbvhQwzf6DccI/JsiN7YNPzFtFx
	y7WU77XQ81MKn+2HfdwUV6CjJYfmwgk0wuGTFzN+H3t/Qwd9f6tihGxgUHmuFA7G7J9Bt7mskkT
	IHOiHeYplaRocA3Y4ehVaCnApxx3TL/pS57BRJyyHgj/s6csDqbkSyhuYuohfCFyd5cWZotQPsC
	vI+LU0dA7yiuU/vq69jPOdMLNQ+pmTwhdDyeHaWo72lqDjlgwzhflAOfyEHzmGp3AkNmQIGhcOX
	Tp5mkancfl6SVmM567GrYxktspM5Gmy3Sy++q+ReCcRNCcEqhjFJq8rhzUtcjdd8ykObs+vHpD4
	Z4IcFaW1fQ5rSaA5bk/iavrmbcyzo1mUuzwaAOb2qwEv1GBWNH7etOIx1rqtalCaCCBCXUZG73c
	bX9JJZ3PyZNvMUeb9MrNK38/KxvPLOcllv4KCizhH3wDthrXYO+Owdzk5LQxlKMFiL5BwmyBFhs
	sPst/69xpEWQDsGLPIqXJpUAZ40QIR69rSGBnF/IVHuqCWaCBD1qTWPfRlrLz3NqHA2SrPLKujw
	hdCr6w+iEdLa5hLclBcCDVksM04rXKxSuatr+jjL8kQ=
X-Received: by 2002:a05:693c:41d3:10b0:351:68e8:4646 with SMTP id 5a478bee46e88-35168e84af3mr5366804eec.37.1791483085641;
        Thu, 08 Oct 2026 11:11:25 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b479e76sm162161eec.26.2026.10.08.11.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:11:25 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	osmocom-net-gprs@lists.osmocom.org,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v2 3/3] selftests: net: add a test for the gtp netlink family
Date: Thu,  8 Oct 2026 18:10:31 +0000
Message-Id: <20261008181031.4129029-4-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
References: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the gtp generic netlink family through its ynl spec: create a
gtp device, add a PDP context with newpdp, check getpdp lists it and
delpdp removes it. Two more cases check that two contexts are dumped and
that deleting an unknown context fails.

Add a GtpFamily ynl wrapper and register the test.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 MAINTAINERS                                   |  1 +
 tools/testing/selftests/net/Makefile          |  1 +
 tools/testing/selftests/net/gtp.py            | 77 +++++++++++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |  5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |  8 +-
 5 files changed, 89 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/gtp.py

diff --git a/MAINTAINERS b/MAINTAINERS
index a6e43995e..8ac817a78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11423,6 +11423,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
 F:	Documentation/netlink/specs/gtp.yaml
 F:	drivers/net/gtp.c
+F:	tools/testing/selftests/net/gtp.py
 
 GUID PARTITION TABLE (GPT)
 M:	Davidlohr Bueso <dave@stgolabs.net>
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index d4ca82fec..5366de878 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -44,6 +44,7 @@ TEST_PROGS := \
 	fin_ack_lat.sh \
 	fou_mcast_encap.sh \
 	fq_band_pktlimit.sh \
+	gtp.py \
 	gre_gso.sh \
 	gre_ipv6_lladdr.sh \
 	icmp.sh \
diff --git a/tools/testing/selftests/net/gtp.py b/tools/testing/selftests/net/gtp.py
new file mode 100644
index 000000000..984c626b7
--- /dev/null
+++ b/tools/testing/selftests/net/gtp.py
@@ -0,0 +1,77 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for the gtp netlink family."""
+
+from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_eq, ksft_in, ksft_not_in, ksft_raises
+from lib.py import KsftSkipEx
+from lib.py import NetNS, NetNSEnter
+from lib.py import GtpFamily, NlError
+from lib.py import CmdExitFailure
+from lib.py import ip, defer
+
+
+def _add_gtp_dev(ns):
+    try:
+        ip("link add gtp0 type gtp role ggsn", ns=str(ns))
+    except CmdExitFailure:
+        raise KsftSkipEx("no gtp support (CONFIG_GTP, iproute2)")
+    defer(ip, "link del gtp0", ns=str(ns))
+    ip("link set gtp0 up", ns=str(ns))
+    return ip("-d link show gtp0", ns=str(ns), json=True)[0]["ifindex"]
+
+
+def _iteis(contexts):
+    return [c.get("i-tei") for c in contexts]
+
+
+def add_del_pdp(gtp, ns) -> None:
+    link = _add_gtp_dev(ns)
+
+    gtp.newpdp({"link": link, "version": 1,
+                "i-tei": 0x100, "o-tei": 0x200,
+                "ms-address": "10.0.0.1", "peer-address": "192.0.2.1"})
+
+    pdp = [c for c in gtp.getpdp({}, dump=True) if c.get("i-tei") == 0x100]
+    ksft_eq(len(pdp), 1)
+    ksft_eq(pdp[0]["o-tei"], 0x200)
+    ksft_eq(pdp[0]["ms-address"], "10.0.0.1")
+    ksft_eq(pdp[0]["peer-address"], "192.0.2.1")
+
+    gtp.delpdp({"link": link, "version": 1,
+                "i-tei": 0x100, "ms-address": "10.0.0.1"})
+    ksft_not_in(0x100, _iteis(gtp.getpdp({}, dump=True)))
+
+
+def add_two_pdp(gtp, ns) -> None:
+    link = _add_gtp_dev(ns)
+
+    for i_tei, o_tei, ms in ((0x111, 0x211, "10.0.1.1"),
+                             (0x112, 0x212, "10.0.1.2")):
+        gtp.newpdp({"link": link, "version": 1,
+                    "i-tei": i_tei, "o-tei": o_tei,
+                    "ms-address": ms, "peer-address": "192.0.2.5"})
+
+    iteis = _iteis(gtp.getpdp({}, dump=True))
+    ksft_in(0x111, iteis)
+    ksft_in(0x112, iteis)
+
+
+def del_unknown_pdp(gtp, ns) -> None:
+    link = _add_gtp_dev(ns)
+    with ksft_raises(NlError):
+        gtp.delpdp({"link": link, "version": 1,
+                    "i-tei": 0x999, "ms-address": "10.9.9.9"})
+
+
+def main() -> None:
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            gtp = GtpFamily()
+        ksft_run([add_del_pdp, add_two_pdp, del_unknown_pdp], args=(gtp, ns))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index 71df5880b..8d34f2659 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -18,7 +18,7 @@ from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
 from .bpf import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
 from .ynl import NlError, NlctrlFamily, YnlFamily, \
     EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily, RtnlRouteFamily
-from .ynl import NetshaperFamily, DevlinkFamily, PSPFamily, Netlink
+from .ynl import NetshaperFamily, DevlinkFamily, PSPFamily, GtpFamily, Netlink
 
 __all__ = ["KSRC",
            "KsftFailEx", "KsftSkipEx", "KsftXfailEx", "ksft_pr", "ksft_eq",
@@ -32,6 +32,7 @@ __all__ = ["KSRC",
            "wait_port_listen", "ctl_file_write", "wait_file", "tool", "tc",
            "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
            "NetdevSim", "NetdevSimDev",
-           "NetshaperFamily", "DevlinkFamily", "PSPFamily", "NlError",
+           "NetshaperFamily", "DevlinkFamily", "PSPFamily", "GtpFamily",
+           "NlError",
            "YnlFamily", "EthtoolFamily", "NetdevFamily", "RtnlFamily",
            "NlctrlFamily", "RtnlAddrFamily", "RtnlRouteFamily", "Netlink"]
diff --git a/tools/testing/selftests/net/lib/py/ynl.py b/tools/testing/selftests/net/lib/py/ynl.py
index 08deff756..492994812 100644
--- a/tools/testing/selftests/net/lib/py/ynl.py
+++ b/tools/testing/selftests/net/lib/py/ynl.py
@@ -31,7 +31,7 @@ __all__ = [
     "NlError", "NlPolicy", "Netlink", "YnlFamily", "SPEC_PATH",
     "EthtoolFamily", "RtnlFamily", "RtnlAddrFamily", "RtnlRouteFamily",
     "NetdevFamily", "NetshaperFamily", "NlctrlFamily", "DevlinkFamily",
-    "PSPFamily",
+    "PSPFamily", "GtpFamily",
 ]
 
 #
@@ -85,3 +85,9 @@ class PSPFamily(YnlFamily):
     def __init__(self, recv_size=0):
         super().__init__((SPEC_PATH / Path('psp.yaml')).as_posix(),
                          schema='', recv_size=recv_size)
+
+
+class GtpFamily(YnlFamily):
+    def __init__(self, recv_size=0):
+        super().__init__((SPEC_PATH / Path('gtp.yaml')).as_posix(),
+                         schema='', recv_size=recv_size)
-- 
2.25.1


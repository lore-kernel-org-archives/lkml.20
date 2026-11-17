Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885421;
	b=Au7wbgKBDFZkPVSxRAVb60/d8j3TpX/2wi1TsSA4x9IpZFBRQhSKqHFvBb+9x43zUY7v
	 kR3kAxdEpUQrrb3mcXfLxIiJctQWkQQdIKWoTdhacqH4Z+dl2B7EriBCujyFXv6aosUrl
	 RGZmSq5s4q8Umlmotn/PsAqt4rhCr2cyF7qfV63Bg12TkozN3riXclUpk3qvme3/4Fltc
	 y9u9jDPrKJsoAfFqRRZYuc/tVR8+6pjKYdoCCVfSy0JFCvMxboRVdow7wV+U6Ejdi63E3
	 6DgENt3XkiK8V559IQEgTQXh9WPNd02JKQVpIQWWaEOoz3QX4kyRXaxl7BL17xuuWDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885421;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=3BqVgFLoD0zMoWkTopht5WfAySy+wXgHPJD+MrXKHjI=;
	b=Bh9GiV7dze545t7ZfUm40wJQ9q3QnDKqjuOtPvqEe6xHuUz6XR2rMKLzRyQhcwjF0753
	 UBPWlIr/j4Qr9eOWxzjGnXjtLQTIVCcJxRjoahS86qbOyp3MEPq6En9eUMpAxF4sG+sF7
	 PCwnV6FnCiFHQ5c4ra/CgpTEdRn5463SrWVd1RJHq0FGmJ6YDOOJSFOmEgiXvJZrgJDC8
	 MIqXlgHuBCWPTDICw8w15E+4Z8p3bba1IKhW7dilHmEjraQ1cZQDm3+KCuhFJWkddyriJ
	 Wgi53H3TEoFa9D1gb1LDsCRmTVeRWhNSFURQ+vZL3fbWL023OgDBP/hq27XsxuPtJ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wgTSP80y;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20477606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20477606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wgTSP80y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MuaxYUaRsYPdPpOlAIaSnGJvIHgDTOslJBgHM2iQNqA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794885419; v=1; x=1795490219;
 b=wgTSP80yf8EKN4oHSZ2m3SstsUZs7TXUchyozPdwqShSTRfuD/Lj8GdjqoX+3V0EXsShQeiA
 yJhbVlp8SxUm6yli/qnWWD0K/wk9BytlNhCbuT6/rOhaiTwK5x9XzPXkp++PDGKMFA6FyUQmbin
 T8MqqOB8XEwan0jTFnPwNQX0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 01e8b328d17bca94;
	Tue, 17 Nov 2026 03:16:59 +0000
X-Mizu-Trace-ID: 01e8b328d17bca94
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 17 Nov 2026 11:16:40 +0800
Subject: [PATCH net-next v2] tools: ynl: render operations-level
 fixed-header in docs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-ynl_fixed_header-v2-1-e7ac247956ee@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2Rq2AQFP/ochpLSLrJJi2kogh
 H+X4tnjy8y8WcGTY/JwTVZwNLHn0e4gTwnoXtkHCTY7g0zlBRGlWOzQdDyTaXpShpyQplC6022
 edSXss7ejmEflHSwFYWkOUP8S/2mfpEM0xm7PPoxuOd4nPBb/jyYUKMqsyElhRVla3V7LwHb0Z
 22h3rbtCw4EoenNAAAA
X-Change-ID: 20261112-ynl_fixed_header-2d7acfcb54f8
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, Wessel Jacobi <wessel@jacobi.pw>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The doc generator only rendered keys on each operations list entry, so
operations-level fixed-header (the family default) never showed up in the
generated HTML. Add a fallback to emit the default_fixed_header on ops
that do not set their own.

After update, rt-route, rt-addr, rt-rule, rt-nexthop and ovs_* all
shows the fixed header correctly in generated html doc.

Reported-by: Wessel Jacobi <wessel@jacobi.pw>
Closes: https://patch.msgid.link/8610ee11-e1dc-481a-9654-11188a06786a@jacobi.pw
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
I rebuilt the HTML documentation, the `fixed-header` shows up correctly
for rt-addr.yaml, rt-route.yaml, rt-rule.yaml, rt-nexthop.yaml, ovs_*.yaml
---
Changes in v2:
- Fix the issue in doc_generator instead of specific yaml file
- Link to v1: https://patch.msgid.link/20261112-ynl_fixed_header-v1-1-8475ea19e409@kylinos.cn
---
 tools/net/ynl/pyynl/lib/doc_generator.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/doc_generator.py b/tools/net/ynl/pyynl/lib/doc_generator.py
index 74f5d408e048..0bd83da9a654 100644
--- a/tools/net/ynl/pyynl/lib/doc_generator.py
+++ b/tools/net/ynl/pyynl/lib/doc_generator.py
@@ -17,7 +17,7 @@
         2) YAML Netlink (YNL) doc generator: Generate docs from YAML data
 """
 
-from typing import Any, Dict, List
+from typing import Any, Dict, List, Optional
 import yaml
 
 LINE_STR = '__lineno__'
@@ -181,7 +181,8 @@ class YnlDocGenerator:
 
         return "\n".join(lines)
 
-    def parse_operations(self, operations: List[Dict[str, Any]], namespace: str) -> str:
+    def parse_operations(self, operations: List[Dict[str, Any]], namespace: str,
+                         default_fixed_header: Optional[str] = None) -> str:
         """Parse operations block"""
         preprocessed = ["name", "doc", "title", "do", "dump", "flags", "event"]
         linkable = ["fixed-header", "attribute-set"]
@@ -206,6 +207,13 @@ class YnlDocGenerator:
                 if key in linkable:
                     value = self.fmt.rst_ref(namespace, key, value)
                 lines.append(self.fmt.rst_fields(key, value, 0))
+
+            # Show the family-wide default when the op does not set its own
+            if default_fixed_header and "fixed-header" not in operation:
+                value = self.fmt.rst_ref(namespace, "fixed-header",
+                                         default_fixed_header)
+                lines.append(self.fmt.rst_fields("fixed-header", value, 0))
+
             if 'flags' in operation:
                 lines.append(self.fmt.rst_fields('flags',
                                                  self.fmt.rst_list_inline(operation['flags'])))
@@ -367,8 +375,10 @@ class YnlDocGenerator:
         # Operations
         if "operations" in obj:
             lines.append(self.fmt.rst_subtitle("Operations"))
-            lines.append(self.parse_operations(obj["operations"]["list"],
-                                               family))
+            lines.append(self.parse_operations(
+                obj["operations"]["list"],
+                family,
+                obj["operations"].get("fixed-header")))
 
         # Multicast groups
         if "mcast-groups" in obj:

---
base-commit: c88fd6989aea9237a60a4859139a265bfb7ddc0b
change-id: 20261112-ynl_fixed_header-2d7acfcb54f8

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>


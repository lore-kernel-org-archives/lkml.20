Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682861;
	b=Y+eBysEBa5UeOmCGtU+zf0ty/UTKP/708voROXQQmB2v/hi7/XQ5culChUwZFQVQounj
	 TCa5CSQ6rYz9ba/eOLZVrZimVIC5nZ4P9L2zdfKpD19EFravzpf5IwIhbGGCyMcz/DhbT
	 Q1MrooNFz3hs5WmLBg6+5uk/kFl6teLCadKJlbWQgsVTIZBOC45HJq9gGKPwdNDsxW8RV
	 TdgzXZTrz2YybAraa2xuWfbrmOLHL2ZxVOk/Rm3CStU9yLgKDyBTy2M2wizsDZiMukIDZ
	 16Q0mSUk1LNvU9R3gi2wDVdhArRGvvpc7CBcUE3ZgEUKIdS1QCaGvYaqH6/xQvOiSeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682861;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7LPMc/lC+ozLSTe8VNHPhqL4qdVQcV7k/IImu38wmMY=;
	b=VU5yWLJcqvAj9hOkihuhkEDpmrX1mjfE7OHgpADB4dsezAOe3rwk60suHf1Ddc7K8IiS
	 2M1WrdneEFv8LuttzDHwA3Fz/uhgnhn5RQe03ip9jO3QyvPJhk1pVCYCY02LFRMVXqLr6
	 p9e5loAJLuGbwtwM/DX6V3xbYWRtdhxrYVmbrzUPA3XCvfEEQQNH6Eai7W+8VFLG1Ux1Y
	 hVBVYe3vx5t0+wpKJb02ChyfGupO16/P11zbsMpu7Oy60QKFRpCxqgNuZjwx30zd75/9c
	 Ia7qQxxGGx9vaEGPVUYhClLGq5d9audJ8Fpam6MqvTzH1DDaPbdCsXXsVSeffEeqNIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=bGbDsops;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4E60A263B;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C4E60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=bGbDsops
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682853; bh=7LPMc/lC+ozLSTe8VNHPhqL4qdVQcV7k/IImu38wmMY=;
	h=From:Message-ID:From;
	b=bGbDsopsp+yX75NhXo+v79DjWHVDmobSojT5ql97BLxTNFFbJdU8FakhMV8YQtJhB
	 QWbKdnf/+M9yjLreJATgm+xl1gzfEHMOmO8QZvV0L+eWr/gBNZ8oQ3HyVKomcUE5TD
	 6JaWhH46ufRrOTLRr8YL9q+rBI01+v+0VJfzqOQg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 90FACC096C;
	Sat, 14 Nov 2026 20:00:53 +0100 (CET)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH v2 08/14] docs: security-bugs: explain what to do when a report gets no response
Date: Sat, 14 Nov 2026 20:00:08 +0100
Message-ID: <20261114190014.17826-9-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114190014.17826-1-w@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
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

Some reports get lost, especially those with attachments or HTML, and
reporters sometimes wait for weeks for a response that will never come.
Since reports are private, the reporter has no other way to know if the
report was delivered than asking. The doc only mentioned resending a
message with no response within a week, in the middle of the rules
about copying the security team.

Let's explain it in "After sending the report": wait for a week, since
some maintainers are overloaded or only work in their spare time, then
resend the report with the security team in Cc. Also suggest to drop
any attachment and double-check the output format.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 437f3cb29e80a..82ece82ecfb75 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -275,9 +275,7 @@ security team in any of the following cases:
     this impact, and you will need to share any information you have;
 
   * you are seeking specific help, such as when resending a message which got
-    no response within a week (and please do not ask for feedback before such
-    a delay, some subsystems have a long report queue, and some maintainers can
-    only read them in their spare time).
+    no response within a week (see "After sending the report").
 
 Otherwise, when a report of clear impact is sent to a larger team of clearly
 identified maintainers, it is not necessary to Cc: the security list.  Never
@@ -384,6 +382,19 @@ run additional tests.  Reports where the reporter does not respond promptly
 or cannot effectively discuss their findings may be abandoned if the
 communication does not quickly improve.
 
+Messages sometimes get lost, especially those containing attachments or HTML.
+Since the report is private, you have no other way to know whether it was
+delivered than to ask. However, some subsystems have a long report queue, some
+maintainers are overloaded or only work in their spare time, so please wait for
+a week without any response before resending your report with the security team
+in Cc: (see above). In this case, be clear about the fact that it is a resend,
+and if possible, provide a reference to the original message. Better double
+check that the message is sent in plain text, and drop any attachment when
+resending, to increase the chances of successful delivery. In any case, please
+do not ask for proper receipt before this delay. This will not make your report
+be processed faster, will add extra load on maintainers and all you risk is
+your future messages being ignored.
+
 Disclosure and embargoed information
 ------------------------------------
 
-- 
2.52.0


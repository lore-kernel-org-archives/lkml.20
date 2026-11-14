Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682859;
	b=D34hL/FB7aZWxFSjc20cKeDqaWRlBQKmPIVbdeCOs0tGMFm0njnkRI1YRl1XGy2ES49r
	 79xbMuLsqXhVxYX7/+yiQTFz5vOng+FD8Dhq5IljbbdlZK7Lvay1DoxSofTkyQDUPoeZ+
	 sHzZUl/igQOH8xCXpbMgTvfIfSGa2Ay5Y8SSxZCwmNd8DF6hdcOTh2gAgaspuAkkS5CfG
	 3h0yzIPGxzHaAIeaaVHSEA/KqvnGHc3GWXUlbGTbesw4XMM/jPLk5KeBbuo6OdfPA5vKt
	 d2MZjvyO/FNRsy076UxjsjO6TVVXl24dKX0aUrBE+4bkkPFx021CFd3xa2J+wAkehFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682859;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zfEy1sXdvZlECu986bz1DTufnCl+5cAMZjDHBpXD1BY=;
	b=1/J4loy0aH3qCXUwhul4fLehVlSmJ6ig02BV5SedcqLb59rzbsrQh+lJkMp8zgrVTJMj
	 kukT8GwzRONttIqAA0/5BC4ki6Erz8BEZ8ZnaBqZNBWUcikzMg6/Q0qHwDCPSoaMGm19y
	 TGV0TxpJDqV7VufigZEQgRnLDakmDEAbSKZldPcZiLT9Vanq6OY3KUj7DEGAoZ2aolXgC
	 lhBtTyf5R6y2y0xWLmI0j0xBOCHDvfbxMcdPcY3o1+izZAflg0wm1OtvCJOHFaUQE/0vV
	 N+snX1pyskQ+zG8iLSG5Lw2q6uuwPG29UBVXNUawWlcYu6N7FyuusaRD10rOfm5a+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=PpHsXMVG;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C9606A33D;
	Sat, 14 Nov 2026 19:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479C9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=PpHsXMVG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=zfEy1sXdvZlECu986bz1DTufnCl+5cAMZjDHBpXD1BY=;
	h=From:Message-ID:From;
	b=PpHsXMVGHveyP9dtBIyKc/i4C19dYJ0737q8nEyzymhMRs/mclz0FAxpzQiJaZQfq
	 UuF6QdY8AFP0Gz0HIK4tHKa0dzPAEJ9dqOL6jNdcM6da4Tz7BEjljqGMWHBEHFaFHH
	 R7DbSnAJbU1SQ6KTd7++s4kL/gEAN69wmO0el2y0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 39D6EC095D;
	Sat, 14 Nov 2026 20:00:37 +0100 (CET)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH v2 02/14] docs: security-bugs: clarify when to Cc the security team
Date: Sat, 14 Nov 2026 20:00:02 +0100
Message-ID: <20261114190014.17826-3-w@1wt.eu>
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

The rules indicating when to Cc the security team were a bit confusing,
because "Identifying contacts" said to always Cc it, while the details
said it was only needed for small teams or for the first few reports,
and nothing said what to do when the impact is unclear or when posting
to a public list.

Let's try to clarify this a little bit now that the rules have evolved
a few times, while not changing what already works fine nor from what
is being properly practiced. It also clarifies the "within a week" by
insisting not to ask before that delay.

This patch changes the unconditional Cc at the top to "when needed, see
below", and groups all cases in a single list that's easier to verify
for the reporter.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 48 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 3575af5274f04..157e84c0d12a5 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -190,11 +190,11 @@ Identifying contacts
 --------------------
 
 The most effective way to report a security bug is to send it directly to the
-affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
-not send it to a public list at this stage, unless you have good reasons to
-consider the issue as being public or trivial to discover (e.g. result of a
-widely available automated vulnerability scanning tool that can be repeated by
-anyone, or use of AI-based tools).
+affected subsystem's maintainers, and to Cc: the Linux kernel security team
+when needed (see below).  Do not send it to a public list at this stage,
+unless you have good reasons to consider the issue as being public or trivial
+to discover (e.g. result of a widely available automated vulnerability
+scanning tool that can be repeated by anyone, or use of AI-based tools).
 
 Finding the maintainers
 ~~~~~~~~~~~~~~~~~~~~~~~
@@ -250,15 +250,35 @@ equally be forwarded as-is to the relevant maintainers.
 Copying the security team
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The report must be sent to maintainers.  If there are two or fewer
-recipients in your message, you must also always Cc: the Linux kernel
-security team who will ensure the message is delivered to the proper
-people, and will be able to assist small maintainer teams with processes
-they may not be familiar with.  For larger teams, Cc: the Linux kernel
-security team for your first few reports or when seeking specific help,
-such as when resending a message which got no response within a week.
-Once you have become comfortable with the process for a few reports, it is
-no longer necessary to Cc: the security list when sending to large teams.
+The report must be sent to maintainers.  You must also Cc: the Linux kernel
+security team in any of the following cases:
+
+  * it is your first report: many first reports are incomplete, too long, too
+    strong, difficult to handle, and put a lot of pressure on maintainers. The
+    security team will help with the process and with the qualification of the
+    issue. Note that this rule also applies if you were asked to fix or adjust
+    a previous submission;
+
+  * there are two or fewer maintainers among the recipients: the security
+    team will ensure the message is delivered to the proper people, and
+    will be able to assist small maintainer teams with processes they may
+    not be familiar with;
+
+  * the maintainers could not be clearly identified (see above);
+
+  * the impact of the issue is uncertain and needs to be qualified. In this
+    case, your must clearly state upfront that you are seeking help to qualify
+    this impact, and you will need to share any information you have;
+
+  * you are seeking specific help, such as when resending a message which got
+    no response within a week (and please do not ask for feedback before such
+    a delay, some subsystems have a long report queue, and some maintainers can
+    only read them in their spare time).
+
+Otherwise, when a report of clear impact is sent to a larger team of clearly
+identified maintainers, it is not necessary to Cc: the security list.  Never
+Cc: the security list on a message sent to a public list.
+
 The Linux kernel security team can be contacted by email at
 <security@kernel.org>.  This is a private list of security officers
 who will help verify the bug report and assist developers working on a fix.
-- 
2.52.0


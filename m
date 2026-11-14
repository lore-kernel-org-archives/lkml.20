Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682861;
	b=UcaAk8beYT7WFvuY+Zj7L9i9HrKpkzA5Grsqmzuo32RqSZofJ77UkqgG+k5zySt+7sk4
	 Ihw2/w9S/y5KlDFT2pAarIoBRJbxF6FWoIdsjWSyWjjaMGrLHMeI5/VEyOB+uG+0ekH08
	 Jwo6Vt8cmg6fqKd4Xs4O1tCPT0PA50JC8zQBy2SKdvEe3gEKYkJj4I5fcowj6psWESExW
	 P48YYCqxrngnqS7pN0TCVHwYyGj6gaxp/0m8i4Rgi28pfGCBYLp5Uem6aoVURmsfAQEPN
	 UvmCRYbSJilAL7P9s+3ViCcioKdZDkr65MaiWRIUlOoqiKwDCSL63qxH/xLTslVloog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682861;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9FRCwjqJS55z7HUF/th3aJAKSoRTPKmJ2g0Nmu5UQxI=;
	b=Oi9dMolRssvYog+dDLPX0yHTdM/Ht4geg39yWx5UElPJinBeEnZr/UEBVc9zJuNxDWH3
	 m4gW9CIY905D7tnEstP/uzvCsp1K2PkhUdqqE+7EiDhtJYTuYaZs2Zp8a6RdHyW1WZ/P4
	 caILtQw22DlMWETLvb++SotunWKaelW3JnG40Tvcj47X8utB8Q1JLgvrViSCy2B+Ih8Wh
	 XCfj8a1GJ5dZAJhpfB9lexQDr5JmuKjutbJQtGYHAPTRqZAqwNIuUr9ykHZ81V++i8j5Y
	 Oi4sm8UbiM2rySF+W7GGqz/RTxEbJxdNCEvDkm/7eDh8BrVEJxH4y2j9AhGRH19ntiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=QEpTenG4;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D3060A261E;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D3060A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=QEpTenG4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=9FRCwjqJS55z7HUF/th3aJAKSoRTPKmJ2g0Nmu5UQxI=;
	h=From:Message-ID:From;
	b=QEpTenG4vQ/3Faa732PcRMSSQzgcEgWc6mX4lZAphy78Cw7jLqxJFH51J96AzMAtz
	 /hE6Mgtz5oarPDqoWmWnRgrslHDXovIT3OKO7R6W0U/Si8mCmtg2Mp6wWoSZcr4wMB
	 k7nzjKMnENEe56J6t//qn5dTzJ58rQu++PBRLsLw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id ACB67C0965;
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
Subject: [PATCH v2 06/14] docs: security-bugs: do not send archives or binary attachments
Date: Sat, 14 Nov 2026 20:00:06 +0100
Message-ID: <20261114190014.17826-7-w@1wt.eu>
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

Many reports still come with zip files or other archives attached, which
are a pain to deal with, may be blocked by filtering on some maintainers'
end, and that also encourage recipients to adopt risky practices of
opening binary files. The doc only used to say to avoid attachments
"where possible".

Let's clarify that archives, binary files and documents are never
acceptable, that large reproducers should be attached as plain text
source files, and that scripts generating the required files (e.g. file
system images) are a better solution.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 42b7926f3021c..38bdb2354353e 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -305,7 +305,11 @@ at once by the same commit, then it may be acceptable to report them at once.
 
 Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
-issue if all the details are hidden away in attachments.  Think of it like a
+issue if all the details are hidden away in attachments. Archives (zip, tar,
+etc.), binary files and documents (PDF, etc.) are never acceptable: when a
+reproducer is too large to be placed in the message, attach its source files
+as plain text, and provide scripts that generate the required files (e.g. file
+system images) instead of the files themselves. Think of it like a
 :doc:`regular patch submission <../process/submitting-patches>`
 (even if you don't have a patch yet): describe the problem and impact, and
 list reproduction steps, all in plain text, then provide a proposed fix as
-- 
2.52.0


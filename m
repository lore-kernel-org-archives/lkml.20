Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682861;
	b=BcJddnqbTBsomYIo8vJwjf1gg1Fieg+CsH8xvvwXnh6zDacl8qpiNUzcplw4uQI8FVHu
	 Gw5RjnRKQWYnQRofDqDBTIBBrzvSRvG7qglpyxv6brKROTBso8EXMQzP+tUWCC2j+/jIf
	 XXrisdDsXXm2u5WG/IuO8cvITQ2ZEViQeHkVMQnsc4wFjo0lGvTxb7lLDxrto2N/m3skx
	 5yNZmY8b99p8QaGjhH/27n/HKov5IK2nrRO/Hjl2X2JP78OiyQUCxUMIRrYZ1Iul4B7kK
	 4VYN1/EZQ3LwjtLAtvlKwCbt9UeluHrrtNky7REFEKqV+6Oz7iRUg//gZpiFGNw2loQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682861;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o4zipBxrf57Ip5A3uG09UJtOdVO+Is3MJ1ZNofk0WJg=;
	b=zqtzg3sMuuTGFOpFdPKKEePo8KK3LFySkKJsX8gRUDM8jh8qSlA1OgD49+VG7ijBo3sM
	 fQFh+qA4oxX4qbW9+TAPz9bcDWApFbP5EsxKJ5IbvE12NvoIurzHEHHYod0X/Z667S9+t
	 tCrIXohddZ7yZoQ1A/oUK6ctNjhhPgbvd8qp2OCuKXLCX7Se+pZCIKF0BUsf4703725V0
	 sVNUi5kq2kcgjTm9DVEnnZAvzZ26gix2cXp2TLi9a6JyuBmFsEX+Y1eRkzVBdQfjX98S9
	 V5tpHL8xKhY50Ji762pEAHWmS9wH+J6pTwln9Aj0pDCOx2wQ+C7ZVzrZuEYICbEH3fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=hq9pPgtO;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4F60A261F;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D4F60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=hq9pPgtO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=o4zipBxrf57Ip5A3uG09UJtOdVO+Is3MJ1ZNofk0WJg=;
	h=From:Message-ID:From;
	b=hq9pPgtOGKYMI769+9JaRgZ5xBf3AYiQfmug4deuJLdSm6C0Eik0v9u9xKc2huAmi
	 4FLxLB7jaFcdiW+F5l593Wqm7S7pqBBa0qhJIGl7P1Jh/aD8H3vq3MuxqbJ8qfOYV2
	 dClHCH0ZsP4Z1Njl7sSOnRdX2zy4r9OyPpHUes90=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id AB43AC0963;
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
Subject: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix that can be applied
Date: Sat, 14 Nov 2026 20:00:05 +0100
Message-ID: <20261114190014.17826-6-w@1wt.eu>
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

Most fixes accompanying security reports cannot be applied with git am,
either because they were damaged by the mailer, or because they just
lack a commit message, and the vast majority of our responses to
reporters are about the patch format. The doc only said to format the
fix "in a way that can be immediately merged", but by now it has
become clear that for many reporters it doesn't have the same meaning
as for maintainers.

Let's give concrete methods: preferably the report as the cover letter
of the series produced by git format-patch, then the fix sent as a reply
to the report, and as a last resort the patch attached, with a warning
that some maintainers won't look at it. Let's also explain how to deal
with public patches and private reports.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 46 +++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 2744259267170..42b7926f3021c 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -307,8 +307,9 @@ Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
 issue if all the details are hidden away in attachments.  Think of it like a
 :doc:`regular patch submission <../process/submitting-patches>`
-(even if you don't have a patch yet): describe the problem and impact, list
-reproduction steps, and follow it with a proposed fix, all in plain text.
+(even if you don't have a patch yet): describe the problem and impact, and
+list reproduction steps, all in plain text, then provide a proposed fix as
+described below.
 Markdown, HTML and RST formatted reports are particularly frowned upon since
 they're quite hard to read for humans and encourage to use dedicated viewers,
 sometimes online, which by definition is not acceptable for a confidential
@@ -316,6 +317,47 @@ security report. Note that some mailers tend to mangle formatting of plain
 text by default, please consult Documentation/process/email-clients.rst for
 more info.
 
+Sending a fix
+~~~~~~~~~~~~~
+
+Most fixes sent along with reports cannot be applied as-is because they were
+damaged by the mailer or lacking a commit message, forcing maintainers to ask
+for a resend. A fix must be applicable using ``git am``, which is most easily
+achieved by letting git produce and send the messages (see
+Documentation/process/submitting-patches.rst).
+
+When the fix is meant to only be sent privately, the preferred method is to
+send the report as a cover letter of a series, followed by the fix::
+
+  $ git format-patch --cover-letter -1
+  (edit 0000-cover-letter.patch and replace the subject and text with the
+   report's subject and text)
+  $ git send-email --suppress-cc=all --to=<maintainers> 000*.patch
+
+The recipients are those determined above (add ``--cc=`` for the security team
+when needed). The ``--suppress-cc=all`` option is important: without it,
+``git send-email`` also sends the messages to addresses found in the patch's
+tags (e.g. ``Cc: stable@vger.kernel.org``), which would leak the report to a
+public list.
+
+If the report was already sent, the fix may be sent as a reply to it, to the
+same recipients, for example using ``git send-email --suppress-cc=all
+--in-reply-to=<report's Message-ID>``. As a last resort, when none of these
+methods is possible, the file produced by ``git format-patch`` may be attached
+as-is to the report, but be aware that some maintainers will not look at
+attachments. However, never attach more than one patch per message without
+being explicitly invited to so, as this would significantly complicate reviews.
+
+When the fix is meant to be public (e.g. for bugs found using AI-based tools,
+see above), send it using ``git send-email`` to the maintainers and lists
+reported by get_maintainer.pl (i.e. without the ``--no-l`` option), with a
+commit message that does not detail how to exploit the bug. Then send the
+report and the reproducer privately to the maintainers (and to the security
+team when needed), mentioning the patch's Message-ID or its link on
+https://lore.kernel.org/ so that they can be matched. The report may also be
+sent as a reply to the public message, after carefully removing all public
+addresses from the To: and Cc: fields.
+
 After sending the report
 ------------------------
 
-- 
2.52.0


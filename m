Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682860;
	b=efdjslsbjpDnrb5xzhLNkfrwASLJWtUSCrZnQ5yTABCvHmquPV/JwEMpAc/+VwXTKMR8
	 0yl+uc7wm5f9sxSVoTNuELmKWL2SsPfp1qTslX8OpP7SYIWmjPQafEjGIOm3otRL+6XAj
	 b/j0oEVkccBsLT0tPv+Rwd3JCU2hd6lt+6nwa8GXzXLWhRm3Bizjv73H1YUtKN5AQ108W
	 AytXqIst1LIZJO0WkGHCtXiJD0jr+II7sLCaGbpnOrmY20PqCSJZozU3LvZZ5KlJ3CaD9
	 LQmI0WIzRsRdbk2iL7toYZlBOLok/7KBwzvpqkDUTfmtFEA+xFjpnspZCZL3mGBJ5MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682860;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+2/o+xpFogW6590XzSo4T2W00LT2lndqOCkOkQWV+0g=;
	b=XQrwXm/3xnncEJK43nPKBhf0OXGYA7GlnWmUwNU8IMbATcKXdQOLSdf88eqJjis9p7h+
	 UIEcCIwFdCXy3lu1GVMQpSdPpttyuOqeJtCrpjNSg2nMWP/93CCmlfJ7tkj89N0RmTTHU
	 PzpOANA1ddfHx3m3/1BTNFlbbcjey2S1TOdsxuYpwty5JvJUgP2ztMr1m8n2VdU1FUSIO
	 N2uzC8gQZiZXwZ29qW7vG2KakSWbMB3S3U1qpUh/VyyHje4wuBfczkeMtykUDRFL+QCS/
	 iaA8LM0N5bRLwZaXgjYCFZUgou2w0ILmc5fPmEP7Ew/vbgol5ExlxVcbxMUYvXiAqSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=U5DxJpai;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6A606A8B6;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB6A606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=U5DxJpai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=+2/o+xpFogW6590XzSo4T2W00LT2lndqOCkOkQWV+0g=;
	h=From:Message-ID:From;
	b=U5DxJpaiMG4R/brZqZz0BRCiM3lvbl4rJ17L4hhV6piTiB4whqGK2/8BTBgL5Eowx
	 ZIbcLuyzVCPtXGjFOWe3BYZWBohvPbgcLkHJoFAXMqlN8ndoHd6i9QvZv4xZknZOLo
	 yhaAs+599LTSt1gVta3O3kJmF3P7UYmO3KbeSMuo=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id B45EDC0967;
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
Subject: [PATCH v2 12/14] docs: security-bugs: explain why AI-found bugs are handled publicly
Date: Sat, 14 Nov 2026 20:00:12 +0100
Message-ID: <20261114190014.17826-13-w@1wt.eu>
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

Many reporters of bugs found using AI do not follow the instructions to
treat them as public, likely because they're worried to be blamed for
disclosing it.

The security team constantly receives duplicate reports within a very
short time, which makes it clear that when an LLM finds a bug, others
find it at the same time, and some may already be working on exploiting
it. Keeping it private then protects nobody, while handling it publicly
lets everyone fix it quickly without a needless embargo.

Let's clarify these points and also reword a sentence about AI reports
that could be read as "do not send them to us".

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 11a4ee5558947..b37d9ed94f6e7 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -42,10 +42,16 @@ a system.
 **If you resorted to AI assistance to identify a bug, you must treat it as
 public**. While you may have valid reasons to believe it is not, the security
 team's experience shows that bugs discovered this way systematically surface
-simultaneously across multiple researchers, often on the same day. In this
-case, do not publicly share a reproducer, as this could cause unintended harm;
-just mention that one is available and maintainers might ask for it privately
-if they need it.
+simultaneously across multiple researchers, often on the same day. Others are
+then likely to be already working on exploiting the same bug, so keeping it
+private would protect nobody, while handling it publicly lets everyone fix it
+quickly without wasting time in a needless embargo. This applies even when the
+bug falls within the threat model: only the fix and its description are made
+public, and reporters following this procedure will never be blamed for it. In
+any case, do not publicly share a reproducer, as this could cause unintended
+harm; just mention that one is available and maintainers might ask for it
+privately if they need it, or better, send it upfront in a separate message to
+maintainers only.
 
 If you are unsure whether an issue qualifies, err on the side of reporting
 privately: the security team would rather triage a borderline report than miss
@@ -169,10 +175,10 @@ ignored.
 Use common sense when evaluating the report. If the affected file has not been
 touched for more than one year and is maintained by a single individual, it is
 likely that usage has declined and exposed users are virtually non-existent
-(e.g., drivers for very old hardware, obsolete filesystems). In such cases,
-there is no need to consume a maintainer's time with an unimportant report. If
-the issue is clearly trivial and publicly discoverable, you should report it
-directly to the public mailing lists, without the reproducer.
+(e.g., drivers for very old hardware, obsolete filesystems). In such cases, as
+well as when the issue is clearly trivial and publicly discoverable, there is
+no need to consume a maintainer's time with a private security report: just
+send the fix publicly like any regular bug fix, without the reproducer.
 
 At the very least, when using an AI assistant to find and report bugs, make the
 assistant read this file and threat-model.rst before proceeding, and have it
-- 
2.52.0


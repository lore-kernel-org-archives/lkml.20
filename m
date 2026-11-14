Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682861;
	b=RvHSNswVAiJaN/YTZctO4h1ml68gKOIWi82rMExhCIRagWBZyGBijCnXJZfQ5T/Bhqjr
	 Oph6KqT5esmevUG/mYEpbve99qUxodVyYN/LupHHTByfE/TQamrvBRZiyEIhAETtYsYsO
	 kpZzhUsAwFPwKY72ctYLosLP3MKmBZadbluFJeNkhgHYtHHsodBRQ7YcnqnpBs08rpvGY
	 Oi93ZGleJT3xnHVbUxEy5T0i6vsbinA+h7QWBfZxgmCZVnJNM4RV1gobBxGcfyBeu6gMX
	 IJjAdbDE0iHdu8eGLU47TwG5x0EO5sxLM5sPSbRG2unOrSj0NO0xQgLPK7BmD5oU3eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682861;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZTUWfewqWeolAsKKieFUnaFT4u7k2HeKDElZPLzIIrk=;
	b=CpB02jZ5IZRvIbdIznat9dL7wVdkwTEkhWUEqkKgyUm+cb0lAVqRfnMmqCtDW1OyycLe
	 /TdxzwKlXXacylo3vhtRG7HXo3xH2YLCDVWXY9KQmkrF/9qqZJewkfPdJvoGvdDmpJN1u
	 1autJvxhEarA2ZXoMeuoapAHjsVy5zReANjF0TRKaD4G5fOhivn+C1sYuo0YzPC3G2/8X
	 CBNxvVPNbJ6st9RW4ZBterKwG61aZe6FgYWWWQRb9ExeurSQ5ntTrjkOe9VTORMlqq3TV
	 wRXVDQoWwgouwLD273/nJlWahr8IfFacLXti+fqfvxEOv8xBGNNPySBzld4VuLfyWEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=gURAcHhP;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF160A380A;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EF160A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=gURAcHhP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682853; bh=ZTUWfewqWeolAsKKieFUnaFT4u7k2HeKDElZPLzIIrk=;
	h=From:Message-ID:From;
	b=gURAcHhP/DECaGr+GsNDzjgWF2FWcZkQvAS0HjU55lR1tg4+4E/A2nka+SW0NW4kx
	 3no9UcuQg/9ddzIhXwk+J5I9Kowq4HiEJhnnvfKVzdqIzmHWVCeOxQJ8GCpEjNsfjW
	 jmllixLxHFuvFt9CMG/S8GaBKXvnoMiSwkMnwvno=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 9028FC096B;
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
Subject: [PATCH v2 14/14] docs: netdev: drop references to the securit list in the doc
Date: Sat, 14 Nov 2026 20:00:14 +0100
Message-ID: <20261114190014.17826-15-w@1wt.eu>
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

The netdev maintainer profile asks reporters of bugs with possible
security implications to use the public lists, which is consistent with
the way most of these bugs are handled, but it says nothing about
reproducers, and its suggested alternatives contradict security-bugs.rst:
it points to the security team's address, and to the linux-distros list
which must not be contacted before a fix is accepted. This text has been
left unchanged since 2013 when security reports were not yet a problem,
just because it remained unnoticed during the security doc refactoring.

Instead of making a special case of security fixes, let's just drop
this outdated section entirely, so that readers refer to the usual docs.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/maintainer-netdev.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index 0c155adccfac9..3157b71c01dd9 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -328,18 +328,6 @@ the case today. Please follow the standard stable rules in
 :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`,
 and make sure you include appropriate Fixes tags!
 
-Security fixes
-~~~~~~~~~~~~~~
-
-Do not email netdev maintainers directly if you think you discovered
-a bug that might have possible security implications.
-The current netdev maintainer has consistently requested that
-people use the mailing lists and not reach out directly.  If you aren't
-OK with that, then perhaps consider mailing security@kernel.org or
-reading about http://oss-security.openwall.org/wiki/mailing-lists/distros
-as possible alternative mechanisms.
-
-
 Co-posting changes to user space components
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.52.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682860;
	b=tNlNTdxsPSd2I55BSaCULNMUxvE2K8hdIJ3ZNEclc47+dI68HZr0IMIXb3yiIWGHU9Tf
	 TEh4H2oL8fHbxQDLEnApVFXfS/Yj/KGu4oyJGHWTuHgMBogYn1S6FGtpXXN2+eWxXoDUc
	 GzKWm+8gGvIttJGuhEXGo46+QKFvUIELVC8II+iDzXdXM9hfBLVO8DOYovHwtHn+VJWOP
	 KuP87UuA/k/oLdeukYtzE/MqoR5t9yHI1d4SPX4/0kd/AALdUv0mPKSkR8135me6JgKwA
	 aFITzCp2Ws27yoBFRZEKhz8I5pTb6fLBQ8gPOS6DuOHGzJOXf74ZCr9P9CAhu0oiLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682860;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rrI6Yz3XaT08uhhOr52TQupezqsK7T5Jelkk8zWlIQY=;
	b=R9jTSwiAWnNgl94v7Mk0TrE7Su98PDVR75f1ibDxfAgd74vXq+JXmZOsRDbqC7XkYrH1
	 AZKzIS0ucxxgFIfMfIFNAKDS7zjXZY/N1ZzovTCSlD9HDCc3Oz8VPspD+IMOehMu9ecm+
	 V2hcMdLdtM6B8R/c4IgESZiU4otlQlOt3bn+rjSw2i03WBxNKWnfksRagnJGxnsSSos1S
	 /Nrck/5kfchbJ9F3DNyDbWOYSpZWB+DCAtJa+Csa4NOUjZmTmqaGDFrlcTaM7w8B9Hcxe
	 LtehaHBHFhNw+HPgBchB0XqnOz0uYkOzg3uLlsM55FA/evSdExh9V4y9d0CtRKM4Jew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=rxSnvowG;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D260A2627;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6D260A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=rxSnvowG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=rrI6Yz3XaT08uhhOr52TQupezqsK7T5Jelkk8zWlIQY=;
	h=From:Message-ID:From;
	b=rxSnvowGaJcN0+HC2z1mJy5AD4Nu0qOpLWj2dtURcF9ZalVhXR3wG39E7A7z/u3iH
	 DdRj8KMvfq9Ha8Y/+z26GvB5sS1HRtCEwMj6YK5mEnQcrwXrnECcuSPyRFHIsoxuGJ
	 pee1n39eCxKI1niP/xOiSRrEDWgQ/NPcNSOAFWCo=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id BCA29C0968;
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
Subject: [PATCH v2 13/14] docs: submitting-patches: defer to security-bugs.rst for security fixes
Date: Sat, 14 Nov 2026 20:00:13 +0100
Message-ID: <20261114190014.17826-14-w@1wt.eu>
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

Despite recent improvements, the security team continues to receive
non-compliant reports clearly indicating that the author had not read
the documentation. It turns out that submitting-patches.rst asks to
send such reports to list's address in a short paragraph, so it's very
likely that some reports only find this one and do not read the rest!
Let's replace this with an invitation to read the security doc instead.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/submitting-patches.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72c..ac7d0d8f5be56 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -253,11 +253,11 @@ He gets a lot of e-mail, and, at this point, very few patches go through
 Linus directly, so typically you should do your best to -avoid-
 sending him e-mail.
 
-If you have a patch that fixes an exploitable security bug, send that patch
-to security@kernel.org.  For severe bugs, a short embargo may be considered
-to allow distributors to get the patch out to users; in such cases,
-obviously, the patch should not be sent to any public lists. See also
-Documentation/process/security-bugs.rst.
+If you have a patch that fixes a bug with possible security implications, you
+need to read Documentation/process/security-bugs.rst first: it explains which
+bugs need to be handled privately, and whom to send them to.  Most such fixes
+are posted publicly like any other fix, but their reproducers and exploits must
+never be posted publicly.
 
 Patches that fix a severe bug in a released kernel should be directed
 toward the stable maintainers by putting a line like this::
-- 
2.52.0


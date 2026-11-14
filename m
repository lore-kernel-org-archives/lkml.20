Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682860;
	b=2nis2V271rhKofmQU6bY6Jaxq7xCqoCN+HHAKkGjsLIqbPXaP26/OZdeJkQecc7RKbfU
	 pm5gvv6OJ2SJH9PRUCKU3RO0StcA0j7GqyKseG9Y+mW4vpDqymj0x0hWKXFsmaVJV3IrN
	 LXxSnMwBA4Gjn1u7uE6IRG3iJxve0lHwNcD6nhAj145o3Zj5xnI7SkX/Lo4QKQkAmeuhk
	 fslZPkje/2N/VduZZ1xyBh4kSqTTU74vPM7+MJJ1CRhK/nRp9Js+03tWrCQL1H2yFML2L
	 uEpZ2HFwcQJzke3FyeBUqICOAepdqgCBx2XO4RIx/wzzTmEZd66Fbhhxh+gQarmLr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682860;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w9yQx3Fszku1+AMI1UEi0i5x9EyyYJwrKjvTridGjuQ=;
	b=hnFwHnGlQA5Xu4y9BBIYdsE0ArdNvk9lk8zViXVi4WwlpscX2PI+8rWw0wdj/cJgWzTb
	 L/kaqdDyzbk5eSCyd/uwxnWxc46MICbrBOD9XduI39lahzh8CRkf3XK/xQgDxxSiqHh/m
	 +ky7WXFPFCZFCPLwcocO9IxMVRAx88S+WO9UxUR7LOPG4XrWD4LegyvyRtCsVfoxTrWfT
	 4Zk3+vInABdYJ/rtbj3E4nzz2hro//CLacfm61zXwuA6shiEHFH4bTqXIZrp8KcrkpuR3
	 8pKCEmpXw9AAwLMOg6JLU9O9QBpZFuH5reWK4T6M6uqPvatl/oL7b2r9c/equydrO+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=H3IEzjou;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124960A2621;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5124960A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=H3IEzjou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682853; bh=w9yQx3Fszku1+AMI1UEi0i5x9EyyYJwrKjvTridGjuQ=;
	h=From:Message-ID:From;
	b=H3IEzjou3bf1j3j9EUO+hdDyMBzttjoAKf2IXvhhpl1P/7d6Cy29ai9NU/QeIiN2X
	 y6bHoM3GmLDMmHRoKNHZ+teh2xl+LKe9W/brf5xN+OhK96tiuRz953p1rtljxgoY2c
	 0kTTV/QluqSesXOHZjbrwpj95RPHPcxYArI2VHWw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 8F935C096A;
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
Subject: [PATCH v2 11/14] docs: security-bugs: explain why directly sent reports add extra work
Date: Sat, 14 Nov 2026 20:00:11 +0100
Message-ID: <20261114190014.17826-12-w@1wt.eu>
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

Many reporters imagine that contacting a maintainer directly will bring
their report a special attention but it's exactly the opposite because
it breaks the normal workflow, and deprives the maintainer from their
usual tools (CI, reviews etc), and even requires extra care (e.g. use
separate branches, avoid CCing stable etc). Let's just explain this
upfront so that reporters understand that there is a reason for everyone
insisting on public posts.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 791a78964a9d3..11a4ee5558947 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -15,7 +15,14 @@ It is important that most bugs are handled publicly so as to involve the widest
 possible audience and find the best solution.  By nature, bugs that are handled
 in closed discussions between a small set of participants are less likely to
 produce the best possible fix (e.g., risk of missing valid use cases, limited
-testing abilities).
+testing abilities). In addition, dealing with private discussions on patches
+adds much more burden to maintainers who cannot follow their usual process nor
+benefit from their usual tools. For example, many subsystems have CI jobs
+running on publicly posted patches and will not merge a fix before it has been
+validated, and automated review tools such as Sashiko review patches posted to
+the lists. Since the fix will have to be posted publicly anyway, sending it
+privately first only delays it by the time needed to ask for it to be reposted
+publicly, adds extra work, and loses the benefit of early reviews.
 
 It turns out that the majority of the bugs reported via the security team are
 just regular bugs that have been improperly qualified as security bugs due to
-- 
2.52.0


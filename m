Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682861;
	b=mb6RfmaaWRl7PwWRq6hrcHZTX+/nWcXRsc9zaRz+A4B0Gpq/DDho8a7mDHZ+sean5MoK
	 yvvjG0fqaxpxfoO0w4ePvk+CmzELrSj7mnwaJgroxkYvN/u2dW5SjwZHh97q9v9lthk9T
	 TlI55U6kQrnSxUK/7OHcmjydwxi10ZR6tnmOiAVNhu9XBqeiBsiU48+RX6Rb4k9Ptbcct
	 POrbLl/98WzXJEgV+7/hiSOOHxF7KCJjP4vOmVsEqOjpXxaXCpM4FFWmMqCVmIxd4iwI6
	 UmxKKvSa2ExZd/m4Q9Frwen70mUHpFyVxx9SN2+FmJYFE/qBI7IXo6gN2xkVRf51dIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682861;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SEwPImDSCZaI51QjguZhlRib6X/f9NM3lrHiSg595QY=;
	b=WUUMpNI4EQLflfm8hIDw+tzIl7A04myXs2QS33nrmoFWu76hPFtUOpvE+gv9ElclrfXb
	 CPfZIvLyYxHiImSs5QYyf4ORk/r67SlbVizks0PI2n03Is87/x9PiJ5+i9S9FcCSwc1LJ
	 /97780Y3Uo7dAZmUWl+LTKVJDTdJeBpkofHs4IiHRqV7Qb11SY6spbuzrlmUK4xoiSYY1
	 0QSfE82RU5UH/PAqigZz2fJa0WN5CL/uyCgVVRC2FBXq+f7Pi682nbL9t5H9+kIq5FjeT
	 EZSysrv6MsIjApNaLZZ3xe9GYhhq0RFt9HQsuDO867QiAXi+DgWfK4JKH5DihOWhOEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=dbjPLla3;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2360A2620;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E2360A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=dbjPLla3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=SEwPImDSCZaI51QjguZhlRib6X/f9NM3lrHiSg595QY=;
	h=From:Message-ID:From;
	b=dbjPLla3Erz1Ulg3XICvj2rtYanZSzEoHpnvjqJnZ877YPbUG5SZhef3EVJ5C9aVS
	 qaKDt20tW6QJgnQzOeO5jKOaeqynebwr6+EZ2+vQK5t6s35m0d8xiaokiNqmDhY49w
	 HsPbOIcVIRTHpV5/4eY89XpW8zdox0f2EhGVoqN4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 5C938C0961;
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
Subject: [PATCH v2 07/14] docs: security-bugs: first-time reporters must send a single report first
Date: Sat, 14 Nov 2026 20:00:07 +0100
Message-ID: <20261114190014.17826-8-w@1wt.eu>
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

The security team regularly receives series of reports from first-time
reporters, all of them suffering from the same issues (missing fix,
wrong format, missing information), which need to be addressed one at a
time and put unneeded pressure on maintainers. Worse, the security team
ends up having to respond to each one of these messages so that CCed
maintainers know about the problem.

Let's ask first-time reporters to send only one report, and to wait for
confirmation that it is in the expected form before sending the other
ones. Also make it clear that violating this rule shows that the
reporter did not read the doc, and that such reporters should be
prepared not to receive any response.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 38bdb2354353e..437f3cb29e80a 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -303,6 +303,15 @@ exception is when an issue concerns closely related parts maintained by the
 exact same subset of maintainers, and these parts are expected to be fixed all
 at once by the same commit, then it may be acceptable to report them at once.
 
+If this is your first report, send only one, and wait for confirmation that it
+is in the expected form before sending the other ones as individual messages.
+The vast majority of first reports need to be adjusted, and otherwise the same
+mistakes are repeated in all of them, putting needless pressure on the
+maintainers and on the security team.  Violating this rule is a clear
+indication that the reporter did not read this document, and such reporters
+should be prepared not to receive any response at all, as maintainers and the
+security team have better things to do than to repeat what is written here.
+
 Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
 issue if all the details are hidden away in attachments. Archives (zip, tar,
-- 
2.52.0


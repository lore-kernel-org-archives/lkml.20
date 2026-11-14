Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682858;
	b=K3MEBtVybntD+0GjGQzAP8zEkPmtTzoZhK3wcLxGOFa2igPIgZzCELZrdFCx8iPakaKI
	 gY9wY1j0hY+hJE4pjlcOn5LI7zSyiz703qsoMwdVvIp93RgD89yr1V/KQYeQpErVV+E9H
	 PaXuqutVzXMh2ZZjlBuBY+OUEzjimTjhOF2d2GIj3NOuiP+Eur5oJZjul64pK8W47PlsL
	 1JZVnl6Mj/83puQc5Rg5Cq+HCVC9fhlZWiuICLcROc3OLnVqlu96nNCKBmA1cUxsEd1zg
	 h9xpxuiXBQDh5KgXFoMeMBfVdaAXkspiOC0bIFHfUbSnW9yFlVVXBr3/1EWHKXPF04Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682858;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d94VSXJN67mMncU42K5uwIo/1aJEGK7XaOOOUlwXwHs=;
	b=wDMbzlusO9HtMWsgUXzpejoT8Q8TeKTvx0RDNwPvjAbfWwXzpTivN8N5yc8IHyWwRIft
	 0kfMy9WhietTRITSXSGWWQc3/vch7Z2bxNh+BMCW/2Topg4I0L2ommlwdVTzva+tqdlJy
	 VQPNK54xh70f9WVhUXG4g0jx1lVu3w8mxmCdfFWG61lQd00JqTiv+/HWSxYbMOH6oU5If
	 LXzh5bFhW9/5h9RFf7/Tlr85XEKfqxAIEdLnwSeOMtY+Fn0Owk9ProLCmtdob3KNCEe7n
	 Nw43uMt0ktY5V1RIjUeoRWkCzxqWoZIYYcTDcvfvs80h4ZOeovj0E2D7Ulmch7u1bvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=HOIc4Uh8;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C871606A33B;
	Sat, 14 Nov 2026 19:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C871606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=HOIc4Uh8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=d94VSXJN67mMncU42K5uwIo/1aJEGK7XaOOOUlwXwHs=;
	h=From:Message-ID:From;
	b=HOIc4Uh8CrWwAHWhZ5uW7r7uQ7z1LtE7FJBOkd/lBzJ5K2HEy3kBuJt196Ip6XLWF
	 YTR59dN4xL7X5YYOVDjFOzbmIyPjnSYmuCrTPgJodSqmJzIf5hNEl5t9zyq/mUS4WO
	 SqER7gsfb1eaucWYGHTh4cRY5upFAB/ahoi1aFls=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 26310C095B;
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
Subject: [PATCH v2 04/14] docs: threat-model: clarify the case of automatically mounted file systems
Date: Sat, 14 Nov 2026 20:00:04 +0100
Message-ID: <20261114190014.17826-5-w@1wt.eu>
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

Bugs triggered by crafted file system images are among the most
frequently reported non-security issues, often with the argument that
some desktop environments automatically mount removable media without
checking them.

Let's state that automatic mounting of unchecked file systems does not
change the analysis: an automounter is expected to check a file system
before mounting it, otherwise it is at fault, and if the check does not
detect the issue, the file system checker is at fault (this doesn't void
the need to handle the kernel side of the report). Fixes should then be
directed to these tools. The only exception remains drivers specifically
documented as being hardened against hostile inputs, as already stated
for non-conforming devices and media.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/threat-model.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index 4c61f196fa84d..a55e7c1c11968 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -234,7 +234,12 @@ The following classes of problems are not considered vulnerabilities:
     image: mounting a block device is a privileged operation (see above), and
     the administrator is responsible for the media they mount. This includes
     issues that are resolved, mitigated, or detected by running a filesystem
-    consistency check (fsck) on the image prior to mounting.
+    consistency check (fsck) on the image prior to mounting. Automatic
+    mounting of unchecked file systems (e.g. removable media mounted by a
+    desktop environment) does not change this: an automounter is expected to
+    check a file system before mounting it, otherwise it is at fault, and if
+    the check does not detect the issue, the file system checker is at fault.
+    In such cases, fixes should be directed to these tools.
 
   * bugs whose reproduction requires hardware modification or emulation,
     including fake USB devices that pretend to be another one, or devices
-- 
2.52.0


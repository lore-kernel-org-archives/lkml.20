Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972398;
	b=ynewxs4dL3kRr1X/j3Q2eWQX8T5UhAe2Vvgty4cma5ZRdOAm6CHlibUJp3hKBlbvjIMu
	 R7MQBN75x9SKP+n+ENgZ3g1ONU+B+5e6U7fHI14gx8TFKyn4egF2Tyx/EPvFKJBZtG1b+
	 7GzNhKmm/5/pCklKQ6pxwK4N5b8yqvvAtYBlr5sWuhba++ipJtwV3PYTLLRvyQDrv+lWS
	 QfIK71fS3YB+6VP4Gf5d3Yk5EC9u56GG/nnSEjzL1RNswQA6sBrDDzK7sv9Mf6Tb0TKhK
	 yg1gSQk0L9EcknKePXr10D1TxHljx+CBbFERijkrhBnRkX9AlWUCGXcaku1QnGLA7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972398;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kOShCq2U4JEXiRarVFOrZYdD4vx45blyVPCctjn43nk=;
	b=zRzTlTsL8qEITk1Zg7LjKuzDGBBzfGj3Is5sKZK1fn5ireHpwG9MV8ssGvCirhqU7Nzt
	 1gflsObhcxgbtBPkS2Cj5GdyKKeUMcoWeJj/Y+Yb4FypWmcOj1iXsAOKV5B2FzdwQvHAw
	 HXILb3IF/aReeSHc/so2xAmxLXiRQbhU9CseVV7jHjHNSkVOMviJ/a/qAIS/dVg3PpIxE
	 Fjfm7CGVe/pzsRLKELXZ7EJId2RY3+6tI2F7edKa2qELf8WAnTc1UYXvtru9xWgTJjo4P
	 WVR6H1VJAa8JUu5OTjZ1Q/E9av9d8OyaL+Mcgzmj4F2LyH5yOOQ1C7AjP5NGd0b3YCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VB0ui4T4;
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B5C60A5BEA
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B5C60A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VB0ui4T4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nn6GkR6sKN00vvch3hLPYNcxKz8wsGc6g8V7oTwW2ns=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792972396; v=1; x=1793577196;
 b=VB0ui4T4N8GnBrQqNo+cdnUJoDVPGr1N9abN5+a61ZiRK43CsmRGqoPyKN6I9F/xEfyi0+uk
 9hCHWSd1+JbQ1sRHFNek+bhZDgRTSGArN/Rs9PcQzMzHJE7gFramnOwMgRJ63oUXEzfrvmVQwTe
 KoGrzl8rENnRhx2rf/Ezh5NU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9d5c2c34b647df5;
	Sun, 25 Oct 2026 23:53:16 +0000
X-Mizu-Trace-ID: a9d5c2c34b647df5
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v11 18/18] MAINTAINERS: add maintainer for the ASUS HID driver
Date: Sun, 25 Oct 2026 23:52:31 +0000
Message-ID: <20261025235232.129945-19-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025235232.129945-1-denis.benato@linux.dev>
References: <20261025235232.129945-1-denis.benato@linux.dev>
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

I already maintain the ASUS drivers in platform/x86, know these
devices well, have contributed in reviewing and bugfixing and have a
lot more work pending so I volunteer on helping making this driver
better: give hid-asus.c a dedicated entry and list me as its maintainer.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a69da715c58..1a3cca5c5f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,6 +4135,12 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/asus-ec-sensors.c
 
+ASUS HID DRIVER
+M:	Denis Benato <denis.benato@linux.dev>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-asus.c
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-- 
2.47.3


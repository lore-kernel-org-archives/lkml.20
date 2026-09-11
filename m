Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D904A99D7;
	Fri, 11 Sep 2026 17:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147936; cv=none; b=b6p5T6sPsjX9s/Mu65YLtW0fQAiI70NygzgfZ2MUl6qk+VAMcSxwGIgql4dDdEh2+JTP8fO/w8Iqn5AbO3qTs4TymgnAVQwI49HbFoAbigZkY6YEuMJ9G5g1/BdUk3Gwj1EQD21OWtXIKxKq7mP5I/LixkO8uVWirRXVfxqQczU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147936; c=relaxed/simple;
	bh=U5EPtwPnVzGoQa66Q6UkBkS7Y6PG7MX3kKDPy934Vt4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qOCPAfARYelBOOTYs2mS/zT52Dp2tRsbTNOD/B6bBlfCe/nk/thqv0DomcE5nKVxRciolIpRme7PwoFj5KcqxQD9goJfeqVsLMxkZZRBNaDOJfKRMKf5jcOod1QFsvo6WkG7dkFkbT8ai08Hfs5XdK3Liga+JY/u0PktALxX5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xvAtfaFp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xvAtfaFp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 727874E401F2;
	Fri, 11 Sep 2026 17:32:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1D2601A3;
	Fri, 11 Sep 2026 17:32:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A319011C7A9DC;
	Fri, 11 Sep 2026 19:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789147923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JcB9bhgVut9tKHA9A+c05srf0xReEifMfQuuEFW+4U0=;
	b=xvAtfaFp7jCLWqG8iPGnC6V2QbMWcAJYO5V5oi6m631GLh/wC+2nA7F802d2BVDbhT/maU
	pGM7C/XllDVdZnST7ldUZes/2FE+y/VqWkX5dG5giAzJK0banIl5UIX8QmbZQtZ8qM0Meu
	cMN+MZLEYQWFssDKdKe+B+6t71mDcmld6rMTdd7Y9X8+bqnD+AUMsDtydQEwl5U5ikxIaN
	xNEEVDh9pwhgEVP7FmvKEkrnAS1lI6m8gcmXWm9f2QJ3v4pEzy/Za8n0Hu9EOMgQNu4f3T
	ezY2PgFO9mqWSwC8Sv6MTs7ar6x67KJWSHtWRZZSI75x5C1JkIffoFlXtzsAyA==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Subject: [PATCH v2 0/2] Congatec Board Controller: Fix current sensor
 lookup and add new sensors
Date: Fri, 11 Sep 2026 19:31:57 +0200
Message-Id: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ6CMBBFr0K6dkxbFNCV9zAs2jJAjbSmU0FDu
 LsFDuDyJS///ZkRBovErtnMAo6WrHcJ5CFjpleuQ7BNYia5LHjFCzCdNtBPg3fQ2g8o14DDCQg
 d+UAghSqVPudVqXOWRl4Bk7YF7vXO9NYPNHFdXY3eUvThuz0YxertsYvg/2KjAA7YilyhbJU4l
 TftfXxadzR+YPWyLD81tcXs4AAAAA==
X-Change-ID: 20260806-cgbc-hwmon-fix-and-new-sensors-21a7ab5387b3
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Second iteration, I just added the missing 'in' channel in cgbc_hwmon_info
(reported by Sashiko). I also fixed the commit message, and made it more
generic.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
Changes in v2:
- Add missing in channel in cgbc_hwmon_info. 
- Link to v1: https://patch.msgid.link/20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com

To: Thomas Richard <thomas.richard@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Werner Gartner <Werner.Gartner@congatec.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Thomas Richard (congatec GmbH) (2):
      hwmon: (cgbc-hwmon): Fix current sensors ID lookup
      hwmon: (cgbc-hwmon): Add some sensors

 Documentation/hwmon/cgbc-hwmon.rst |  42 +++++++-----
 drivers/hwmon/cgbc-hwmon.c         | 129 +++++++++++++++++++++++--------------
 2 files changed, 106 insertions(+), 65 deletions(-)
---
base-commit: d2587340a8575100d9ddd10270c7a5c216766b5b
change-id: 20260806-cgbc-hwmon-fix-and-new-sensors-21a7ab5387b3

Best regards,
--  
Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>


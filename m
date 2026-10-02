Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525A3921F1;
	Fri,  2 Oct 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945163; cv=none; b=ESeL1lN3kCbTmu6OwU+aTdStEOumtVDWrokeACD+dvnj/1HpSij1+FIr1h4hw6Igj53WLI8Jtp+wMof0JijxuZ2zFqM7250XT4PS9cAlB6/Tqby0a9iHr5kSoT5UoGi3dnzOWJ93va5hMWCLcx8XRNNXdlr9625JnqGvFXv/3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945163; c=relaxed/simple;
	bh=TbZgjai+kDrZAPaKC3HYnXR5EAAvBGmpFQl0ndVI3l8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdoNIRlxzWOmhvly/rta+BKbOv5H19bVepXPvp1ReFkr6Di0x2KFUdD2T4+DL6oReKqfevYYZIFs7iP2b6HS5FcAXl/nJlGUfrliYICEsj2laEOytHsC3N4lN5dPhUk4zdKCpFlC5JPlsZYhuqRaOMlXg4nA1iL1+jWzIeki4F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogJs8tcB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogJs8tcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8521F000FF;
	Fri,  2 Oct 2026 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945162;
	bh=qCPk/TFUlQ1A+V4nab13llI+cpwiph0XkA1bls2wHQk=;
	h=From:To:Cc:Subject:Date;
	b=ogJs8tcB2wp0RIXBZIqb0DowEBvLNgX9+qXin0b4S9qpeIhcaWYeSiM3nI6lpwFjz
	 A3JrgUm5YnuhAF3TuBCDj6rHVoE/drPqNsGHq48KSdVO4U1kBe2OA2toQqS/0+sIw6
	 Px9+5WALfQMFwFULxrPg/GJ+5cr/KY5kJ1wkOWSXUPbMeXbap12oW1NvuxB8x4S3pm
	 mwPEIiYFVZqzIeKuz0PWce9GD/Ozho3/ufO5KExCINx8dDz0bdkJe782HZZYpwVdLk
	 apHO2yvLkcYfHU5d5dM1Z5Mwx+lP2YFChA8SPZf+0RueTXutRPnGT9temKCAYMHbLZ
	 UHaBJchTCCMXA==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Korsgaard <jacmet@sunsite.dk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: c67x00: fix uninitialized data access
Date: Fri,  2 Oct 2026 14:45:46 +0200
Message-ID: <20261002124558.3495203-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds for s390 using gcc-10.5 revealed that the
c67x00_ll_husb_init_host_port() writes bogus data into the
registers:

drivers/usb/c67x00/c67x00-ll-hpi.c: In function 'c67x00_ll_husb_init_host_port':
drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: error: '*(u16 *)((char *)&data+-452)' is used uninitialized in this function [-Werror=uninitialized]
  288 |   hpi_write_word(dev, COMM_R(i), data->regs[i]);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I have not seen this error before, but the compiler is clearly correct
and the bug has been in the driver since it was added in 2008.
This particular build has CONFIG_INIT_STACK_NONE=y and CONFIG_UBSAN=y,
but I don't think that alone is sufficient to find the bug.

Change this to write zeroes instead, which may still not be what
is intended but at least avoids the undefined behavior and the
warning about it.

Fixes: e9b29ffc519b ("USB: add Cypress c67x00 OTG controller HCD driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/c67x00/c67x00-ll-hpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/c67x00/c67x00-ll-hpi.c b/drivers/usb/c67x00/c67x00-ll-hpi.c
index 7a214a3a6cc7..3825552dc024 100644
--- a/drivers/usb/c67x00/c67x00-ll-hpi.c
+++ b/drivers/usb/c67x00/c67x00-ll-hpi.c
@@ -306,7 +306,7 @@ void c67x00_ll_set_husb_eot(struct c67x00_device *dev, u16 value)
 static inline void c67x00_ll_husb_sie_init(struct c67x00_sie *sie)
 {
 	struct c67x00_device *dev = sie->dev;
-	struct c67x00_lcp_int_data data;
+	struct c67x00_lcp_int_data data = {};
 	int rc;
 
 	rc = c67x00_comm_exec_int(dev, HUSB_SIE_INIT_INT(sie->sie_num), &data);
-- 
2.53.0


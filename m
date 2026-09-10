Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBA3A5422
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023806; cv=none; b=Ncsmeqju7HseI7s6ikm49gIEXIBA8W8A7fy0InTzebA09LyGzR096z7DUTbHlQGGqaZvaZIkO3y2jkKfEJrtLp+kauvOe8frRnSftk1Q7ALGhFuxMhGrs78yjV57BOz4UNi0uATs87hMvwYpLGEErfsh9q9NFewjQ9yYaJxVorU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023806; c=relaxed/simple;
	bh=nBgM/1oqj4Wrxw4cYGui+uuAG8euMJNT4Qx+2yJ3Ge4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YeINkHI1FAz9gZnWYihsO2oEDM8k6rUc9r64rJU26Wr/kM/vQ3WfUxO5/YWnrLNzuA0g3UwGUM4NIx252/VN9FyXZm0zRJ6QDZMTVycwjXSSqKttAMgAMQMkp0bfyAbcFZQ5UEfEBAzDXxKCDThM8tGW5bv2hsaW6hgz3n61Iuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GVKkkR+b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GVKkkR+b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 926224E415BC;
	Thu, 10 Sep 2026 07:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67D3E602B8;
	Thu, 10 Sep 2026 07:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0608A11C7AF88;
	Thu, 10 Sep 2026 09:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789023797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=0kek9b5THWFb/trQl1A6XJqkLCTRh7k28a7DVY54xPo=;
	b=GVKkkR+bmZeK0tuzzqoc9Kr7+z/lusTiFyn3p1ARreNgBJDGnIiJqTxV9d+Vey8eaprgHU
	17UY/x05vT4Y1NQdHR0FNvUexLEx9BU/DBZqAbrw3WXOQTWkTxKNMDZcOTT0Ts/hys0vJw
	uQp9EOrUW8pAjoH6XBo1zcVogODLqJ2jI1eHU4DH9fnTr3XwCPCgZWgMSzu9VbIUiNbWSI
	MwAI4mg2OeNJKqNb4jHOmaJgyh5ispDIG6bbUVGzfxZvREwNskAY/32bxtKt96M7qS29hI
	y5s+f+on73ejD2Lk4cYxCLSICmyerHw/yDroo+YOkjOZuo9mZpa3dHgzm2VHgQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v2 0/3] hwmon: (nct6775) Add support for NCT6122D and
 NCT6126D
Date: Thu, 10 Sep 2026 09:02:37 +0200
Message-Id: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2SrWuvIdhQesgY6Q1bUUN4
 e4Cunf5kvffHyBRZEpwKAaI1HPi4CdQqwJcW/sLIZ8nBiWUFkYYtCHkG3tsn13w6F3WUml0Wol
 6szO2FAam7T1Sw6+le6q+nB72Si7PsdloOeUQ38txL2fv30cvUeCW9qWWZUONFMeft3ahg2ocx
 w9WDlsmzgAAAA==
X-Change-ID: 20260909-bootlin-hwmon-nct6126-c620a379b509
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789023793; l=1630;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=nBgM/1oqj4Wrxw4cYGui+uuAG8euMJNT4Qx+2yJ3Ge4=;
 b=FoRHzW3YtUEzE2kxrAtEM3Pp4Y7fya+1FbPA8SmySkdsk81oVIDQBmMHUZlEOMFUcu4KEiORo
 rr1NXwV1DKuB0Rg2dfZTTDfAL5kJzTdq8jarm0FE0xLOF96m1ZpB24Q
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series adds support for the hardware monitoring functionality of
the Nuvoton NCT6122D and NCT6126D Super-I/O chips. It is based on the
NCT6122D/NCT6126D datasheet (V2.4) availale on Nuvoton website.

The two chips shares the same hardware monitor block, so both are
handled through a single chip kind.

Patch 1 document the support of NCT6116D/NCT6122D/NCT6126D.

Patch 2 adds the NCT6126D and reuses the existing NCT6116D register
tables, adding only different VIN tables.

Patch 3 then adds the NCT6122D, which differs only in its device IDs and
UART count.

Tested on a Kontron SBC-EKL 3"5.

Thanks.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Changes in v2:
- My Signed-Off-by trailer was incorrect on patch 2.
  Changed it.
- Link to v1: https://patch.msgid.link/20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com

---
Paul Louvel (3):
      Documentation: hwmon: (nct6775) Document NCT6116D/NCT6122D/NCT6126D support
      hwmon: (nct6775) Add support for NCT6126D
      hwmon: (nct6775) Add support for NCT6122D

 Documentation/hwmon/nct6775.rst  |  16 ++++++
 drivers/hwmon/nct6775-core.c     | 116 +++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/nct6775-platform.c |  33 ++++++++++-
 drivers/hwmon/nct6775.h          |   4 +-
 4 files changed, 166 insertions(+), 3 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260909-bootlin-hwmon-nct6126-c620a379b509

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4553B71DC;
	Fri,  4 Sep 2026 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545587; cv=none; b=I6Xb6NwBGpO/0BCVd45qNLTQNGtbLyq0Romy9COS/Zd0skCyxFWoun2BZ2U9YeySoBgfLNgMD3X1ZSu/dkqiwDbKcH29JkMZI51upayoskhPhWQ3rO4EMddzk3apLQtIPxZZNAvXkmUYMx34ncFtRkeyRKZX5f5ni/dkMsP0Sio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545587; c=relaxed/simple;
	bh=pyfMSOC/fK80BkbkuJFpxjp61MkzRrttIzUNktUsITw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ACtdZq5gZmJkWSNPJjInAD+5UjFEC03PgS7WB2rN2y9mcvjeCHpnoE97T0DhhpHoCkDcTpZ/gOiYXztKImFVjrlTFUyO4jEea3vFgwcz+8nLLBC9UTCqiPsg5DGUvzFP1TPy+jx/UJeYOxZPLXk3xZOxEFt9Fn1Wo6cqqfLhlrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YovRCXvp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YovRCXvp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 49A494E41521;
	Fri,  4 Sep 2026 18:13:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 151A56057F;
	Fri,  4 Sep 2026 18:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4640D11C78158;
	Fri,  4 Sep 2026 20:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LqQYuvwvraZg7CYMTKbtFxp307I8aZf3xSHZ/HLQRDA=;
	b=YovRCXvp0IpXbEJEJcuBowy3IAuG3jcHkZesKqsN7Z+vF8J8PBAZpYvzke3a6btV+RG9UA
	AFP1I+bPwWOqRiGIhUPORlzx/ZiSlLP9LMp5+oZWk5xajmdkAoojh5U3e+s4iqmtkF/6v8
	9HzPYkHOnrj0oLo/b/4K+tAYxoCqTPMJbFpVKhGSf6ubP3aBDNHBD1ibdA7dDEg7Uj/qF3
	nT2fJJuuvjZdDdcl7GbTLiXTtR53nv8VS2wJtygIWzBXXIgDul6pkHAQhVQOPYkYywO5kR
	sRd2OPxT41Iwk6ljPRRCMJUPmUxp8UpKquw5AnEbY1a4c2sGKhRX8W+AA35Tsg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 00/25] mtd: spi-nor: QE handling cleanup + fixup reworks
 + Winbond RV chips addition
Date: Fri, 04 Sep 2026 20:12:37 +0200
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PS27DIBCA4atYrDsRD2OcKKp6j6oLDENDlUAKD
 m0V+e4lziKp0oWXg8T3z5xJxuQxk01zJgmLzz6GOsinhpidDu8I3taZcMo7KvkavnwYYrBQFDD
 IRw8hJkgFtLV+rJ/BoOaOOSb7AUlljgmd/54Tr2/XOeHnqZbG6yM5YM56Lm2a7Rzqqfw/9FHA7
 FGH0xGKBAq94qJHqZRaty9DjOPeh5WJh+dLedAZoQ4HP26aolYckmHkssPO5zGmn/nqwuYllh9
 YWA07oZH1knIr9X145gu/kT1VC0heyXqD6lpunWnpIynuSCYWkKKSQyeUcYxTK80j2d7INeULy
 Pa6pRVSUGGd+0tO0/QLjdkDjU8CAAA=
X-Change-ID: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Following my "software protection" enhancement series, there were
several comments about the need to simplify and reorganize the handling
of the QE bits, which is strongly impacted by the various read/write
status register capabilities.

The third patch is all about this. It is a massive cleanup, everything
is explained inside, the how and the why. This is a commit that must be
tested, so if you have a SPI NOR chip with one of the not yet tested
SFDP QER configuration, please consider applying that patch (just patch
1 is enough) and boot. If your chip is recognized, it's probably all
good.

Since it was pointed that the legacy .name fields were part of the ABI,
my previous deletion was no longer possible, so I now propose a
(writable) indirection for accessing this field, which will allow
developers to hide that name using fixups.

Talking about fixups, I continued with another rework that has been
asked for: changing the way fixups are listed. I am now creating a table
of fixups, which can be matched by ID and/or with a match function, as
per Michael Walle's suggestion. This cleans quite a bit the fixup lists
in the winbond driver, especially because of the new name hiding fixup,
so thanks for the suggestion!

Then I add support for JESD216 revision F and its new QER field.

Finally, I rework a bit the fixups in the Winbond driver, which allows
a clean addition of the new Winbond RV chips.

All chips I will ever be able to test are now listed and proof of
testing is below the commit message.

Thanks,
Miquèl

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v5:
- Rebased the series and fixed all the conflicts.
- Fixed the double typo reported by Takahiro.
- Link to v4: https://lore.kernel.org/r/20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com

Changes in v4:
- Moved the fixup_flags into the spi-nor fixup structure.
- Used strstarts instead of strncmp (pm25lv).
- Created spi_nor_sfdp_get_header() to retrieve the SFDP header.
- Added a comment about the use of the nor->sfdp field in fixup hooks
  not being possible with the early default_init fixup (due to SFDP not
  being parsed yet).
- Moved the read_sr2 subtleties to swp.c to make sure we do not widen
  the scope of these hacks.
- Reintegrated the ->quad_enable() field check to make sure we won't
  set the QE bit if the hook was disabled.
- Fixed the SFDP table of the 128Mb variant which strangely repeats the
  same error as the Zetta clone (?).
- Fixed the part name in two commit titles.
- Added testing for the 256Mb densities I just received.
- Collected tags (except the one on the W25Q25RV chips since they are
  now tested and M vs/Q/N variants are split).
- Link to v3: https://lore.kernel.org/r/20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com

Changes in v3:
- Added support for two new chips that I could test (W25Q51RV-M and
  W25Q02RV-Q/N). Edited the last commit which is now only adding the
  256M-bit densities without the possibility to test, since I will not
  receive any of these any time soon.
- Reworked completely the way fixups are now being applied.
- Re-instated the legacy .names, created a way to overwrite them and
  enabled a fixup for that.
- Link to v2: https://lore.kernel.org/r/20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com

Changes in v2:
- Added support for more chips that I received and could test. The main
  logic in the first patches is completely untouched.
- Fixed the name of a parameter (s/sr2/srs/) in the low level read status
  registers helper.
- Decided that there was no specific handling of the WP pin being
  strapped wrt the read check over the SR content. This would be new,
  and I don't think it is wide to handle it in the verify helper, but
  instead this should be let to the caller to decide whether it needs
  to hard fail or just degrade into single mode (typically if the QE
  bit has not been written). But this would require an extra DT
  property indicating the WP strap state which cannot be read back by
  software.
- Created a structure to store the flash specific opcodes.
- Proposed a rename of BFPT_DWORD15_QER_SR2_BIT1_BUGGY in favour of
  the _NO_1B_WR suffix.
- After checking, decided that the .name field is legacy and not part
  of any stable API, thus it can be removed. So added back a commit
  for that, removing the names for the whole JV family.
- Exposed all opcodes through debugfs, including the QE bit position.
- OTP and SWP writes are now read back like before.
- 2 known deviations are now explicitely stated in the commit log.
- I changed a little bit the QER field parsing in the sfdp.c driver, to
  limit deviations, as much as my understanding would allow me.
- Link to v1: https://lore.kernel.org/r/20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com

---
Miquel Raynal (25):
      mtd: spi-nor: Rename BFPT_DWORD15_QER_SR2_BIT1_BUGGY
      mtd: spi-nor: Create a structure containing the flash opcodes
      mtd: spi-nor: Refactor Read Status/Write Status support
      mtd: spi-nor: Add support for the new JESD216 rev F QER field
      mtd: spi-nor: Create the concept of fixup table with match function
      mtd: spi-nor: Move the fixup flags into the fixup list
      mtd: spi-nor: Create an indirection on the part name
      mtd: spi-nor: Move the SFDP header structure to a C header
      mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-Q/N parts
      mtd: spi-nor: winbond: Add support for W25Q32RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q25RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q51RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q01RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q02RV-Q/N
      mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-M parts
      mtd: spi-nor: winbond: Add support for W25Q32RV-M
      mtd: spi-nor: winbond: Add support for W25Q64RV-M
      mtd: spi-nor: winbond: Add support for W25Q12RV-M
      mtd: spi-nor: winbond: Add support for W25Q25RV-M
      mtd: spi-nor: winbond: Add support for W25Q51RV-M
      mtd: spi-nor: winbond: Add support for W25Q01RV-M
      mtd: spi-nor: winbond: Add support for W25Q02RV-M
      mtd: spi-nor: debugfs: Expose SR opcodes and QE mask

 Documentation/driver-api/mtd/spi-nor.rst |   2 +-
 drivers/mtd/spi-nor/atmel.c              |  75 +--
 drivers/mtd/spi-nor/core.c               | 753 ++++++++++++-------------------
 drivers/mtd/spi-nor/core.h               | 125 ++---
 drivers/mtd/spi-nor/debugfs.c            |  22 +-
 drivers/mtd/spi-nor/everspin.c           |   7 +-
 drivers/mtd/spi-nor/gigadevice.c         |  15 +-
 drivers/mtd/spi-nor/issi.c               |  29 +-
 drivers/mtd/spi-nor/macronix.c           |  39 +-
 drivers/mtd/spi-nor/micron-st.c          |  66 ++-
 drivers/mtd/spi-nor/otp.c                |  16 +-
 drivers/mtd/spi-nor/sfdp.c               | 148 ++++--
 drivers/mtd/spi-nor/sfdp.h               |  23 +-
 drivers/mtd/spi-nor/spansion.c           |  67 +--
 drivers/mtd/spi-nor/sst.c                |  16 +-
 drivers/mtd/spi-nor/swp.c                |  99 ++--
 drivers/mtd/spi-nor/sysfs.c              |   4 +-
 drivers/mtd/spi-nor/winbond.c            | 133 ++++--
 include/linux/mtd/spi-nor.h              |   6 +-
 19 files changed, 857 insertions(+), 788 deletions(-)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
prerequisite-message-id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
prerequisite-patch-id: b4c64eddd0cbb8a67a3ceb3d5a8fb7118ee8bbd3
prerequisite-patch-id: ea4fe4b14c3613b81a14c7af7ef5b7783c8cc633
prerequisite-patch-id: 4386d6ade3a3cd161669fec71550a9ccd96313f1
prerequisite-patch-id: c8a25a85853dc662591c1099350a37ff842d072b
prerequisite-patch-id: 74656376c96b96fc1b3cdc7074de6b3cb87d9ca7
prerequisite-patch-id: 90271b7e055db3079d3897546c3480a285b740c8
prerequisite-patch-id: 600c72d0a18dc003917f774209625f24c37d11d5
prerequisite-patch-id: e4543f8bf8f0fc69ce6dffc1b18858cf9ba6c04c
prerequisite-patch-id: 260a5ff56d2e5fc5583b875e0e0eca14786f23c6
prerequisite-patch-id: 2895240e7ee5b7d3f0792e7c964be474c583a4c6
prerequisite-patch-id: d429c7951d6bc134fb9f8990d72ff678b55e39d2
prerequisite-patch-id: 4733bf85a0015bf832f46909518c5c3b291824ff
prerequisite-patch-id: 876879d9ca584afcfda5ea388a39f71ba5e88847
prerequisite-patch-id: 849e3782c7a6263bce97a359f1e8521dc2b2ec77
prerequisite-patch-id: a4d9ceb8d99e527d9b9b184cbb1923c99e15fe1a
prerequisite-patch-id: 8c9246e1485d06429b1caaae7a1efb7af5122723
prerequisite-patch-id: 66880ad35a1681b724b51cb40e591270a65429ce
prerequisite-patch-id: a750eb3c350e1a88aef8749506332663fb44e007
prerequisite-patch-id: 6e9d4b20e02afb09defda703c74d56ea222d10c1
prerequisite-patch-id: 808ce773f9ecb493ba9362e088453638ee93b222
prerequisite-patch-id: 462a6751e3e9074102e8d31b23bf06140f6ee6e6
prerequisite-patch-id: 309ee450a2ac8eb24516c6839b944bc5f36a6db6
prerequisite-patch-id: 07059d14bb516ba19fc0a678a96b3224f91caf24
prerequisite-patch-id: 1e221a9bbfb1fc53982beaf75bccf48baaba491f
prerequisite-patch-id: 20ce5105adc4c7f8ebc6c779b107fd54def4f1f8
prerequisite-patch-id: cd8fddc6d97316419b52997207a198037b41b32d
prerequisite-patch-id: 759f747940c26df6ec85fecb4779fd54e0ea3735
prerequisite-patch-id: eaeebc9df5221bab68a6cabc64a97e9c2608899b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


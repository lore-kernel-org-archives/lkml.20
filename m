Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382336;
	b=m1nZZnRAAHIZH8bZyhNr6qRjB/rE8nD8rBfDJmswLfPV+Utq3SU5232FSF3Is0akqSq2
	 O0pHYAvPn0JHRFAVSfZEDi4bM+6g7ThocsTOyv5R/zOQ4KXFMmjmHVW9AnjTZ82ELRgdO
	 Tvl65yRBM9JwkkRM+Ix/tshLEPd+yzTHfTb7L1VCyD0yiSQJPvH/9RTUGuEnkyIgeVQU8
	 YQDoJwtGm//UkTLJ4WeO4XmiR/3SgaqA83LGbWI22tuj2zrwlduSEAzoBCEuW72h08nMM
	 XlXhc+hPe25mdFdhxk4jWM7vqNKOb1SNsYDxNgW+MMoL3vfeCtsvpT3mChKE7ewyjwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382336;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=2go0p9yvpcIObJSf0p5k000x9/NneUIJMnzDKOu9y1g=;
	b=MTaVD2QV3KG5uTXKQVdUhPjJ87e46R7HEPTT2cvVCu2oVXlfH3QOrNu77pMALThXVMq3
	 QV8YPM+Kkp80rodfqdkwNlLTOJwieRwwEBqD65TZ79CsYZkm1pv7ZxXUiKwi9Dm7pJ3GO
	 3B179vYc5p4nYEIonAfhALizVoPTa9ImJJX7BpsFdM4JvRG7e4LuMnVEJhGre0aHv20pc
	 quPJdg8LYwlnbpe6oJN2ROSd0XEWjvYXOORKRgLL0stxYZa5dxdfjvfXmqnHnROI/eT2J
	 N/6JyfJzrSVtPIVlmElB52AT/wVVDmKlI6St9uiukwHCwNcDL5C9uArFeABWsqhL9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GIHQ6q94;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A04606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A04606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GIHQ6q94
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF6F71A13C4;
	Fri, 30 Oct 2026 17:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A8B5603C2;
	Fri, 30 Oct 2026 17:45:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45BA210328D09;
	Fri, 30 Oct 2026 18:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2go0p9yvpcIObJSf0p5k000x9/NneUIJMnzDKOu9y1g=;
	b=GIHQ6q94ShdZBB+aACiDcuq+6rAeERoLG6WWWVgqVMDIBfA/FhayllF/jBOW7wCk7ia2Hf
	orwEeKQ1pGppWUkci3TflBtAUeLAY7xbNtzHVM2ZFSr0+fOg8M7L6x7hBmY9jn7Gwegdvu
	7B2Iju8gEi5uvVOrifmkjhDheA8XCNCqMOWqgRZJ4fi1l5trDecSpXyBTo/N927E3eA7A0
	uoKVMJDvKNioSHZ0vLovtZosuxy592H81ILxJms/TzwwFaGy+6ZNKT+6DXqeQVbuPu565X
	h0oKGYjVC2zK8hBimIy+/lycLNcn9DlEXaoFbpKZDoD5vTtlczMoikcO8GjqCg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/13] mtd: spinand winbond: Add support for W25NxxLV and
 W25NxxLW chips
Date: Fri, 30 Oct 2026 18:45:24 +0100
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrB1IIlrbq0gX0UzsgB1LIiYQv
 HuDy7f4v0CkwBTh1RQIdHLkXSp028DysbISsqsGo8ygVacwscy7OPzaeFDAZHrJeTsT6uc4O9t
 Z/1gM1PwXyHO+19P7uv6d4YQoagAAAA==
X-Change-ID: 20261030-winbond-master-w25nxxlvw-198bda3af7c2
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

These chips mostly reuse the existing infrastructure and have been
tested using the mtd-utils test suite. In particular, I wrote and
contributed a new tool to ease continuous read testing:
https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com/T/#u

A bit of reorganization and renaming is being done as well as
preparation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (13):
      mtd: spinand: winbond: Fix an OOB layout inconsistency with W25NxxLW chips
      mtd: spinand: winbond: Generalize the KV OOB layout
      mtd: spinand: winbond: Generalize the LW OOB layout
      mtd: spinand: winbond: Rename the ->set_cont_read() helper
      mtd: spinand: winbond: Rename the ->ecc_get_status() helper
      mtd: spinand: winbond: Add 1S_1S_1S continuous read variant
      mtd: spinand: winbond: Add basic support for W25N02LV
      mtd: spinand: winbond: Add basic support for W25N04LV
      mtd: spinand: winbond: Add basic support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N02LV
      mtd: spinand: winbond: Add continuous read support for W25N04LV
      mtd: spinand: winbond: Add continuous read support for W25N02LW
      mtd: spinand: winbond: Add continuous read support for W25N04LW

 drivers/mtd/nand/spi/winbond.c | 187 +++++++++++++++++++++++++++--------------
 1 file changed, 126 insertions(+), 61 deletions(-)
---
base-commit: b243a89e1b1e8ead7b44fc4eb0d0d4df0c9e3f4b
change-id: 20261030-winbond-master-w25nxxlvw-198bda3af7c2

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


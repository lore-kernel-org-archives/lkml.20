Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAC3DAADA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053746; cv=none; b=fMRjLKJvU8ix3mDmlKsDqw6MCx8iGOWCiN1MeOPGqzFd9E2aGyI57yOJ99RuPzj0vkF9J7rCjcpGdWfNz3SvN6Q5ZxYIScl78YU+c7F2pZ4Uayf89jSsgo8foBOUdT8Sodz06IHd+kvwZk4AA2sn+53RYl2mfFro2KYlp/vWKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053746; c=relaxed/simple;
	bh=3/exXtAS0wTcuZo/jQLMxhfQp9TH0oipgL7Utw4qJqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMdYUdS/Go+V9b+J6l9HKyauxiderlkVHnFhibg8sjOilAdlfo16THqpJh7tpK+VwtxeUd7qTyuQWVxBfyuPsBaKvHJ2GUxW2iB3iEp0zC9PH/gRXgSMdljVrSoNGip29IuIg3rNAN/s8xyTFZrGz8rx2mI1owrm/OYoja0/w1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmT/vhXP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmT/vhXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558F1F000C4;
	Thu, 15 Oct 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053744;
	bh=3T+BBYG9njKm84IFi+JsC2GV6JdjgiVsPr6ozUNOJ5I=;
	h=From:To:Cc:Subject:Date;
	b=FmT/vhXPIM4BkJdjoZ3nFFJNW/Gki9HL86MTaMeiu496SaTyn2OHTSB9mp4tmUAaa
	 /8yANjuaRZiAmXRrWUhwy++zaQuXm2GIXH5vK8bMXRTHqsvkX4+1+LZGxcBh3Y2DfR
	 P9hIjkob44kZu7oGrepfQlIwFFSst7gg9lJNHhGtzCnEOUh3xL/ub5LE7I8x1ceHlq
	 FSnG+cz8kQibfEeqpWXZFgqpj8N0oMH7a0D/AS3Hf57z2tGvypoWIsYu2pJyATwLoW
	 Hiha86xyEQfwqaxHRSKvp3IMeg9PFgkX0yw0kLhisyFuk8csstQ+VBgRZcomKrV0Tw
	 tZxW6Otv5ooMg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: spi-nor: sfdp: fix missing kernel-doc
Date: Thu, 15 Oct 2026 10:42:14 +0200
Message-ID: <20261015084219.887963-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into
sfdp") added the kernel-doc but missed one description for bfpt. Fix it.

While at it, also add documentation for the return value.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610040802.yD5XKM5i-lkp@intel.com/
Fixes: 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/sfdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index beb0f5c66212..818c7d4d69d4 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -403,9 +403,12 @@ static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
  * @nor:	pointer to a 'struct spi_nor'
  * @bfpt_header:	pointer to the 'struct sfdp_parameter_header' describing
  *			the Basic Flash Parameter Table length and version
+ * @bfpt:	pointer to the 'struct sfdp_bfpt' to be fixed up
  *
  * Used to tweak various flash parameters when information provided by the SFDP
  * tables are wrong.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
 static int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 				    const struct sfdp_parameter_header *bfpt_header,
-- 
2.47.3


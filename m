Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384263783B4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760557; cv=none; b=NJ1MzN48rLpHZDLULGR32mSLyVhxtxKr07rbXuNXp0N8bOQQ1ySs1+NUlNQxu0VLXN8Fq6kh1mn/hhM7YU2ixWV/5OWfBsmeJGHGiuKAQiTyroJVhn7Zu3BUgGOzfzIqs7Cj9kFBj2pFl2kPBmOoZFMBdOxVUMjUduGZobhgOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760557; c=relaxed/simple;
	bh=VdYiVlAaEz21Hi+q/JsnUD7U1RNcR3aPRlDlKQ3I68g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ghl7HB3eP237/GOlcbR63fo1Pz3ccXeeYu4JBDQm+4veUbSSkBedHwCAp5n/ABFnb1ddvQhJgBuC8WmLMow8xmUmuRQriYEYvUvi027EubJJ8aRBF9JpNr0Rk5i5LLMKAsq7bRCzPo2NyUaeaaD7nWs4mvMNIA3osGkAAnu6Nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am+xWD6s; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am+xWD6s"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c26d7e951so169529966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760553; x=1788365353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVZDnx8w1K3i56E12CadQZF3S/QBfdgckzz9SPQi62o=;
        b=am+xWD6sMaQ/1o+4R6V8ERC0x3PueG4ZAXsxL3Gz8G7wl806hH+2oPJO6as9DGphlP
         aghPtJFudU5QGiWk/PbfCqgJTUL6MY6DZ/zP7GRZm6PAlfzMqgX7rUAHVD7xy86n6VhF
         oxlQNuGw8KKyph6EMpBNsBE/F1POCuYr34tsM1oAsZlGC7WMLpqyvomEZYTj10JlHYXU
         ld7B9KI0Xc1H7M/CVkzk3eISvPE5nHGvzORYUQai8U47c68N18dMl12b+N/jER4AAf55
         UVVzHz92Wik0iNS640RCwVxNlkcxVlTtIwBVa3DwPx9qITKGEGP8Kh1YqpWhIiiawrhZ
         ANaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760553; x=1788365353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVZDnx8w1K3i56E12CadQZF3S/QBfdgckzz9SPQi62o=;
        b=B980xHOoZ0Ijr1qUFS7AGKGr8VDyU5OHuITrmTk4HNSSDtf7k/bk6dnN8TCKKH9T+M
         JdJXi6ZQXEX+45nb125xKcV2nvd10DJRNlWcJbm4WkjfJU76mYK8V48INmQbwoACOqyk
         RwP//5G532apnVfqGCVjBNrENm0NG3UPldp11IXMFeUIvgoNFfzfqfgWRYDS7GL1lxvL
         HvKq0oQLMk8PIbnJ8GiS2GkUPN9yWTp/bE6bh2uGoDynUUxHeCACkA4wVFnWNA8tzeq0
         OoMLDsLhIjQiNR/0PHZqqG4Vgr+HRWkDpgp1pSBHA8Kcx1CDfaW0bmBiMxuZWWequ9rO
         Fnyw==
X-Forwarded-Encrypted: i=1; AHgh+RqNPD6AUv/IRNo5x9MzqrVOQVT8dt8TFRuHOEc9atm4PgcL7rw2HJVm13yQCZmgj7D2mqOaBm9/CvoOVMM=@vger.kernel.org
X-Gm-Message-State: AFuF++nRVKOqcuMQFQ+OrORwNnw1TpK4Nf2umg352/1/pXmLyjiPwPMX
	86WwgICHj9ZoYyTiwbqqNKPaLQngqFdqlM/enpMGBB8rm0NQdQX8pMO5oSMQTG10
X-Gm-Gg: AR+sD10ydi9LY441Z1krbLi2+UF/wXH8nGqvAZKzvLs2Spe8OMbZFyHaozxuavFRRhB
	39mp4Ep7Bot448Lr/KDyZdQ+WSCLt8eVhZ73ZbkPH+2re7HoP/xCoVM0h2xVd7du5A5gPWNQLKm
	IJVBCXWK1jFS6uMareeTuJDtLAlmTaEje7V4FLIYplfh1esX/6SM4g1IZxE6DOUt5Yh3HvNfNPW
	ezW0SYK89xn3+Ai2NyYv/7BSt8V0Pw6727ZPt/ZOvGhQkTxKjEiE1O9u2i6KOV+rG0obuHJfb0O
	kEjzcATV64VeGwyc0enV96pj1MMWxlFIWzUwgdgXXRM3BfCSdfwoh0BvXHZXukWaxwEZvT1CfGj
	T9rz4vXT68q9hyzjtwrqT/hQhG2+J/mxFNifYNZGIIsjJ30kjEe670hGsqW7nxeYFr7LDXEolUb
	I8JvXzu/I14x/ZMJRbEdcCpUZgvG3FDIKN9l1w5+7+eNIg4UCGQRl/o334NkZC5sje2148px4+D
	2Ogt28eNUAwIvzKnRThJmRfZi4Ye6ZQDC5wSW7eq+kq0oU=
X-Received: by 2002:a17:907:e1c4:20b0:c25:1b4f:6d95 with SMTP id a640c23a62f3a-c251b4f7a1fmr632539166b.6.1787760552958;
        Wed, 26 Aug 2026 09:09:12 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:78ce:12f6:160d:28db])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25271e4cbcsm386050366b.18.2026.08.26.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:09:12 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
Date: Wed, 26 Aug 2026 18:09:09 +0200
Message-ID: <20260826160911.460165-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a driver (and the subsequent defconfig change) for the pata/CF socket in
the CS-Lab Warp series of Amiga boards.

This is a respin of v5 addressing Geert's and sashiko-bot's review.

Tested on real Warp hardware.

v5: https://lore.kernel.org/linux-ide/20260824153339.512487-1-p.pisati@gmail.com/

Changes in v6:
 - fix 7.3 FTBFS (include <linux/device-id/zorro.h>, and use named initializers in
   the zorro_device_id table)
 - use devm_ioremap()
 - print the register window with %pR in ata_port_desc()

Changes in v5:
 - return the number of bytes actually consumed on the bus
 - fix the trailing byte in pata_cswarp_data_xfer()
 - drop a blank line in Kconfig
 - fix the remaining checkpatch complaints

Changes in v4:
 - refactor pata_cswarp_data_xfer()
 - ioremap WARP_OFFSET_ATA region

Changes in v3:
 - suppress a comment
 - properly return ata_host_activate() error code

Change in v2:
 - fix style, remove duplicate swap macro, driver version, etc
 - rework the zorro attach mechanism
 - remove the unnecessary zorro ids refactor

Paolo Pisati (2):
  ata: pata_cswarp: Add Amiga cslab ata support
  m68k: defconfig: enable PATA_CSWARP

 arch/m68k/configs/amiga_defconfig |   1 +
 arch/m68k/configs/multi_defconfig |   1 +
 drivers/ata/Kconfig               |  10 ++
 drivers/ata/Makefile              |   1 +
 drivers/ata/pata_cswarp.c         | 183 ++++++++++++++++++++++++++++++
 5 files changed, 196 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0


Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748E13AF2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324159; cv=none; b=M4m5CQMt5f0+fn0x3geQeAoigXVIYiJGYbdZj5eQiPmg59dwjw6TCPffmjXvB6LqhIgvGzJxYJSIr1C0rrsK+bHaflrPPFTUFC7wycjvkPb//cbzRYzx69dQa5Ka5GGtrwSA2spWCJz58FwC6Dpbg/uihmR4L07dEftg1kQr5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324159; c=relaxed/simple;
	bh=+sQjzs5GJoXwuRBHuC+lUm9JDrE1H7apLMAsW9pyFcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIrknbouhthyxnivezfWbP3n9iX22PtPzh9D3NbsSIxHpquZxSMcl2SYxeVtO9z8YR3kAMg5+iIVGX8hFf1VYAGFnft+G1p5V7vNUtoEmgypYaBKKe97i7Lxup++Snk1nZNP79SAn3tH7bYdlutW9/EVzos6rlVPoweZ3XiWCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=METp9Wlt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="METp9Wlt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so5272435e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788324156; x=1788928956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtWKIpNLXlriEGn93C9K9TziWn2g7UFHuiQX5OgZJiw=;
        b=METp9WltQOP0TVQYiDvT0ZWooCcBS0gf0IVme7NqChEgjPA2sjMvpQU0A427ng8wED
         Sm0pvgIrZap0lYTXLuhOMgbKNO+nel8ULQOtv7MYJb8IWaiWQc6Xr0MZJcdEp8i6imhD
         K6/bhqtOY0UBNAcuywMs/5R7/Qj1eDjCoeqTRMGMjNZQu5OiE4fYxzRAZXjGi7upD+93
         J3DM+iusIHPojUR8/SWY9fbEI8QSN3nyYQp1qHelVrFHmY5YLH5/TJepVjQ3LSjd1wWY
         wi6837AavEsk3VDgbKi6bRgFByaxzJ/u7wuj67PHktmfju+Qx4USOQRYfUiU1/czsNer
         zETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324156; x=1788928956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtWKIpNLXlriEGn93C9K9TziWn2g7UFHuiQX5OgZJiw=;
        b=h04Wq4E7KC6Zkzqv2gJhVWDDuxjJqVcBr6FspHI91yfCHO5iiwfp6EoTNpwlTtOCW9
         SwHqoqkd11Lr9GbHTnki+7aOAZZnGHclWKzfQfskVe58QmrpAZWZzdh1sy3LnEFtGTkl
         XQFD+xG44BBtdaVC29/54AuaxIUTCPP0C1BDEdsmXKpS4F44sVADIy1B+rmC2AuXJC8h
         GLKZSG5Cnp3+XKUqbdkUO/+kI3077W3Wf1Re7Lc++vMp36wmeSoVXe0uSe/jcSl+UUZX
         x1XYMQvYRtoh06LhWm8NBFigbFvtbvczo2hkBQi8qBTR8KBBUbR08ebsOvhxVT6O2Psr
         nrPg==
X-Forwarded-Encrypted: i=1; AHgh+RpoAYU6hrSZbHoUa5FUablkWUxfIqt3XoyNOZJ9x/s09f58f7Or+7wQj2wj32lG3GyVubwgx9/O2ynwxPA=@vger.kernel.org
X-Gm-Message-State: AFuF++lfkrZW0ZAzGy5um7f/LDzlL1beuzLzsECbS1DwYozyZjze7BmQ
	gc3TdEEdBb1OSgroCUnFc3P/uR245mAfGT5hWfoGsWxftpmAzXWGYzGS
X-Gm-Gg: AR+sD10Jb16sEE8VarLV+EHodKHQvGO/sLSWKB2x3RPndeXnmkztnNqxiHEinLt13Xq
	fdoa7ebBfcm2/St7RW0gE/Vi9a6Hwl/EqPE6XXnIlexrWBqXcMbc952DnKpw5xk2MeTLVXwMEbp
	6VkJWYh83n1B5eWsDIZYTHqziPB9MbsTTyC54JcjYSoZQABpfzMQMB+lnGHsW4gZX8vNtICRdtz
	HaMmD+P+aRoDK9KlcLqXMZJ632Q9NcZ9SdK2hlbBaf+BMVn+NyeEafeAPXVi6RuMHp1UzdIydm+
	ymNh+KdDdaejEpAk1chXm2S04Azh1kyyMkb89DZ6KozphyfI8lWlAqwevIhl8OA1j0E2F4J+/rq
	7l2XL8mpgTmSeIejaW96tbDUftjNWK+10ucxxUcBq75B7xgP0hpXFsW4Nqvxjc2/CvFKBDG5O8x
	VxlhBfPDSgVw//3R7MDk8JRReBN12ZzMIqR4FRtXOCQZgdtixmSeCWvA41z6UD/p8tDynP2uLcF
	JFAT6zRSY8pBDMrj2xpo9JL0rpL6Cg=
X-Received: by 2002:a05:600c:3b11:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49ce5843baemr32203165e9.13.1788324156118;
        Tue, 01 Sep 2026 21:42:36 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm127274165e9.4.2026.09.01.21.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:42:35 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v12 0/2] ptp: ocp: add TAP CPLD support for ADVA TimeCard X1
Date: Wed,  2 Sep 2026 07:42:30 +0300
Message-ID: <20260902044232.21188-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADVA TimeCard X1 (PCI device 0x0410) carries a Lattice MachXO3 CPLD
on the TMC I2C bus.  This series adds access to it and an update path
through the kernel firmware-upload subsystem.

The card has two I2C controllers.  Linux registers only the one at
0x00150000, normally routed to the config EEPROMs; the one at 0x00120000
belongs to the on-card MicroBlaze and is routed to the TMC or M.2 bus as
its firmware selects.  A request/grant handshake re-routes the host
controller onto the TMC bus, where the PCA9548 and the CPLD behind its
channel 0 live.  Everything here is built on that handshake.

Patch 1 adds the arbitration and the read-only interfaces on top of it.
Patch 2 adds the flashing.

v11: https://lore.kernel.org/netdev/20260811135720.109580-1-maimon.sagi@gmail.com/T/#u

Changes since v11 - all from Vadim's review of the ISC command path:

 - adva_x1_i2c_xfer() takes the opcode as its own argument and assembles
   the message in a scratch buffer taken once per bus claim, so the
   opcode and its arguments are copied exactly once and a firmware upload
   costs one allocation instead of one per 16-byte page.  The bound check
   lives here now, against the scratch size.  Patch 1.
 - adva_x1_cpld_write() takes just the opcode; the per-command argument
   bytes come from adva_x1_cpld_args(), a switch-case helper returning a
   pointer to the static data.  This drops the seven per-caller argument
   arrays, including the dis_args duplicated between prepare() and
   cleanup().  Patch 2.
 - Commands whose arguments are all zero (RESET_ADDR, SET_DONE, DIS_CFG,
   REFRESH) pass NULL and the transfer sends zeros, so the zero3 arrays
   are gone.
 - Comment fix: the LCMXO3LF-2100 IDCODE is 0xe12bc043 (0x612bc043 is the
   4300-LUT part).  Patch 1.

No functional change: the byte sequences on the wire are unchanged, and
CPLD programming was verified on an ADVA TimeCard X1.

Sagi Maimon (2):
  ptp: ocp: add TAP CPLD access for ADVA TimeCard X1
  ptp: ocp: add TAP CPLD firmware upload for ADVA TimeCard X1

 Documentation/ABI/testing/sysfs-timecard |  24 +
 drivers/ptp/Kconfig                      |   2 +
 drivers/ptp/ptp_ocp.c                    | 693 ++++++++++++++++++++++-
 3 files changed, 715 insertions(+), 4 deletions(-)


base-commit: c29b37ed7a4d9856ed758a82282456d69cee2ed1
-- 
2.47.0


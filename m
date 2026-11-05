Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867062;
	b=dHPaBV9sy4o1gXe4uafeeT10r6R7fp3NjNmjrgwTRz5Pb/OV6rgs4EyUAhJspWcuLmpt
	 wf55SXl6Llg4BPOl0z1j9Pp6qdsNZtp16wCkcudGXOktY/6szH+Sm+YDgQYfZE6rnoCN1
	 FuSD2a9kTPx3zY5d/G1UvwcdDshPTeLfmX7KXNwAoim5qQgHH60H7JocRo57rSwc4oV/V
	 8L3TBaAOTATmcPMFFhGQ90zpHX7vP2DTrnTojegV3OXt0M1je3Trb2ppbW50wCCRvAGXd
	 4YpwK3+GYNdfGVk6Pj7uYH2hFYHO1gqlaeEblUmM+rc13J2UzVU0gt8VRZmqzlHMVvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867062;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ZJ249AtmwSuCZsIIsSDb7ydrGHQ516oqgxihKKAwghE=;
	b=R6BR4ybwhKZiSc4NNtEFS6b81w+7iLaSDXqkahc+DiWl9BdUUxnUj6Lrqmrz1yh0VYMw
	 JeYQDOTZ7vtg0LYg2K2kjXgCm4CzO6uMeC5AVW8jZZXenK3271BxLyhdwyikdXHnPfXzJ
	 jPVrXM1wnChBbBTW/EV2+I2vNnYBo4qRJCU+eb7E1FdOX0InFWJ7WtrhS8aaFFC8z4exF
	 Ua2Ul+pq8VccsmFi/2wESuIIGp4s2dcy1CUeOQGKKuVka52OaV5dp+0o0j+I32i0n1sTq
	 asNPdya8SSMiXLwCHvaaJUbnz08oqeKiSnPRbc2A1j2ZkUeMHK1sYCRRrf7zgorTJzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ejh5VaEX;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F210606D805;
	Thu,  5 Nov 2026 08:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F210606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ejh5VaEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867049;
	bh=ZJ249AtmwSuCZsIIsSDb7ydrGHQ516oqgxihKKAwghE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ejh5VaEXKo5X4pSwhBx9obfWqL9P31aPI11Z8vPwOdWDgIiPSdsj3O838TVlycE5B
	 XmRRJtlJdAtKa6BKmya+EloOym8zhBTupABRfpjIpzD90kKp096C2c0/OHvMEp0z0l
	 1UolzRd2jDfeRZ450u+TtKE8e2f3ptcHHdH/36aA=
X-QQ-mid: zesmtpgz4t1793867048tf3e3ee76
X-QQ-Originating-IP: iZG4yoHhf8J3fsBiHX52Fhia9VgMbLyclOKJK/7Bw84=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264579372122570667
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:49 +0000
Subject: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=8xFU6VvJImZA2MbPgp1OYJlmNmjSbxKEyOFL+rbF1NI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEVuXHzh/eF4jYeN3aEbZnN2z9+6e9PPOymRP2vaG
 PT2uMTP7ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiI4haG/05XCvXD2T1Ul5Q9
 ZPI917/yvnvX3r+HIwzj7vE837fK/BDD/9wTnzqnVZ+9/0n551w3g9eL7l/r4elw/z+lwnNfgdX
 /CG4A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NafyJWIkf4MPGBhqAbi6cTpkeIcvBusEH0OWwBEx3TLNmMowmkiJy/WY
	uZf+vpQHjkkc8rYDVzufdUaZKzBFfqZCViVYOhGRzQP0X/bRy2jDVVlcEddjLkZSEAml+dl
	FDZ3gMCL0rrfHi3mzhppnKksn+cW5+63UIMj72BjoLDnRtb10s8mu8/aJQHTcZvZxGimlle
	fnb8CppLqYad/daQgEwdVr30Ji+h20P2dBDta3TKV7hFIJtOy89Llq2CIKwHuzRllniWW9j
	B/dYEoo+tOv6XumiXSoPNjQOhgFWZ/nxPDAvCjGescVPYKE0Q5ElQq1AOKOxLz4HReW1//H
	8q+7PY70ljL9/RcSX7h43HgVyEDa2EuRTMzlqx0rfakptGZmxtmjPvtOg+kzY1b9BxYZCNE
	K96to3y0z3grYAGROu0igr7M4uJQ6pYrVUbPsrAIvvYttACyU3ElvhSulXGsYKwdMF/9JkJ
	BqDeI+Y+ih2IkD4ez1lSNIkGCQryjHiCQ/K0oebzFiizml0xXz1+NSaByLfP7VjO2BSEviz
	RD6nu/z7W3v4A29DjT9jkZKkfglVGs8tpYztWbCrao/y0FmcmOJMzG4FdEWGStYF5sXWzAC
	iZHIXa1xpcskKDImsHOX0GJwy/HaQxyStGqClF0cNZoU/Fmoban2eNvAkwihz/pmCWrBZVl
	TLCr6vpTPXpMn6uU1Sm2gTYsgijSdbeogMLvt3hG3vvyuhd5cIM2U0Qo9S434xwYImT9xZS
	9NDZd5jbEDaLEdWf7j7u//YtAe4NE7w0XNzK1Z18Rjb+a9tPkrItko3I2C4pPeieGihaZGE
	Zz3Ctw+5309IZNLqRNnYUa6lajuw2tv6ZvMwHczYlo+Y/jS4aaKQajqB2/1ArCVON92t69p
	Nrb/wYzDZgHZwmWCTABjy1nmeiDed04a4e/wIoyooQlnhOhR8e/jnl7HXuMO7y/9TWQjfIG
	7ldUDGDtXmfl3swbsQbGco490GCrCPSGjn+ZvfqHWZ2cbRLi0Ja1slpqmwrQdlph8WIBbk1
	rjkx6bkHjbi8m16bOy5Cjb/gaTaTmH5uEJ6KzLepW0rSjivTwDHnh0ynopKB/BWnQgUVqzS
	jWq7f80P/dyC7Ow2NoxkOBCzX18mjo2T0FG1k7rGbtQ7zrO9KsNN7zYAZnW/N34gFiyu3tI
	AYvt
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
MAC address the same way. Without the EEPROM driver and the ONIE TLV
layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
Ethernet controller never probes unless the bootloader passes a MAC
address in the device tree.

Enable both drivers as built-in so the MAC address is available as soon
as the Ethernet driver probes, including for network root file systems.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..a76f801d8eed 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
 CONFIG_LIBNVDIMM=y
+CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
+CONFIG_EEPROM_AT24=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y

-- 
2.56.0


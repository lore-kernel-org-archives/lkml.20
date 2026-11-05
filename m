Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867039;
	b=bLvtxkpD0DoTl+2BqlNgbsc8+ta+Khr0OQn5/H6fZpnV2Qu4En3KL26zVNG2L+F8aNJs
	 ucrdyNWGdpj0zwXbOi9LXFVcXISRQK2WyV8EkMogUUxrEX7yshu1We69OxRxrW/f01pRp
	 gGqEXQEMa8TTURo8ynKE3oSvPU4NGW2Yl5lTSHTm83pyu6uGLsDYKPEoOmRhncbJj1nBG
	 ZOMR+fZjLZLt04ZA6vdIrHYCfBRjTMLGM8dg126RjYxDbWkaYKF27LfqCY0njeKdDUcN2
	 nxuakGwU7oCjEpxHrJcwuvB60biQsV9SF8KbNvOEh0ms1SLiBzmJZK/cBnniN29r4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867039;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=PMy26U+a8p6T/DZbXU09t/uUDgp8RhhSnvRaYUMUKHQ=;
	b=LzEzNdFNJcCIYoQbvwaRSEpkOy6wmkwc6htGzUmiGrMAOWfmy8rCaxGZDLsdvXtga/J8
	 uXogYRWyLLbAOtCXwyKkDTtOSWC1kLzya3OWXvcBzw+tBjYAT1HmSzqrDfwoEfPFlTro5
	 aw3qs+7TpvV1Kve6dcd8v6xDDotts8e/I1gQYtedSiTIOwnxJibMwwqDw4nZvNs1m72M8
	 zN7iE/TbNsXgap+Pt+miiosm53E5i7ckPMXiO862Lnt+JIC09rh0fPasJwi66WelN2eHR
	 PLgzmEnImF2yp4Rlwd/pxuNjuMAiApRs81WRFDbXtP4TSh75CjtM5ohI7KMrbUkS/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="w3S/F3Gn";
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC678606A32D;
	Thu,  5 Nov 2026 08:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC678606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=w3S/F3Gn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867032;
	bh=PMy26U+a8p6T/DZbXU09t/uUDgp8RhhSnvRaYUMUKHQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=w3S/F3Gn97YS7b8k/zWQLBH4kGJVVAPDCZso/q7Yd5Ov1twQ1Y/dVtZ8RjPaIHAwP
	 EifBninTic1fqdXnnVmgEXZuTX91obKx97IckaeAqNWFiyBeS/o7aPRtQvZPMybx1b
	 FhrV33k/c+I4/g6Q2+CRN+NulrdhgYhONDmGAap4=
X-QQ-mid: esmtpsz10t1793867031t33177925
X-QQ-Originating-IP: S5npOyi7aINTfxWjzN8uAgHEA4v9Zxn+qFnXr53kbTw=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11420959379972091869
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/5] riscv: dts: spacemit: k3-com260: Describe SD card, SPI
 NOR and MAC
Date: Thu, 05 Nov 2026 08:23:45 +0000
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s+4kgLQxXsV0UWHUUQHDtMaEc
 PdizV+9zS8glJkETl2BTB8WTrFB9x24+xxvhOybwSgzaq0GfB7QpWBGhSH59UUoHmPKGGaH1pJ
 vaTscDbTDO9OVv/v9PP0t6+VBbvktodYN44gfFX8AAAA=
X-Change-ID: 20261105-k3-com260-module-sd-nor-mac-44edede14582
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=f8JEl3nwmhnXtGnW8XRJdFD/mPXqxg42zaRBQTXPx4o=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbIWnvTgvpOEbvNRl4l7OK8dTZ/zQEUlJO7Xwl9sVh
 QRxOROxjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgInML2L4n8jqofpLSHHf1Y+7
 A74cvuH5+qFuScwd9R3fDlhk7/v94y8jw+Ggh/M+SrqLpAZ6x+Vv0fHQPBj2dKL3QhHJkPu3bYo
 eswMA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2DIfDzSfv0dcHyCjnrUVymz+ILJz3gdwWt1q2FwcGN4GF
	S85gtH+aEBzJ2Pr8uFyBsAGULPO4W35qmb0OMPVBvMqJkBSqQvshDUevdrqzeC51tbsjxcM
	R/KgA/SDFysKpQY423swtj4d6oLqYFqh7zO207YMAzRvXMuRNo9VoCLyf5zXW4st4pWka+F
	j2KbZ5pBzwE88fUcIYwyuCFg0KQ8ofzN0kYtC3LC0QxcYOyHZmzon9TQbgDYidSVo6dPXOI
	Vbzo9OJzuydNN6bBqBrIIZJ3cSn+IDWSKkb0DMAPrx71uSWYQYLthxVlf67A+LRrfee9Z+e
	vhXHvisKv4xg4mgb4LKvMwiQc+n8OP7LNfKQZLQQdlcte8VZJH4KFhn3KWlzIZ2A3kZV31L
	NOMj82z0RUGkw9pcjeAwZvrFB83iUTxLB//WFz4fn+kgvod8uuq7IYOTh3m7GEKJ9maVJVj
	6T+Zw0wnWpYcFEyoMT9D1FHCQ4IyP5UFAGjsI09wfGerw2YhtSDTRNnmeyeiTFwDnskXRkc
	U2glyt33KVZ3zuyoKWj8wUBjVDv8ZQM2q2R0erGFk62pBbzilC+ZsD+ndyQN1qEh6KA0go/
	paxl3cH8VdXYGLZgrRDqG5WCOplWPeRP1xMn1x3P3Pmf1NRVhVMur9Dt8tgzoLq4B+Gcy9p
	W795glPT6YZil8yrBAgrAJKLSpdXq7H7q0Eiw/cWTT/iylJBXktjtIrytUniHW2Ja+TUPeo
	Bp23/Lz779gTUlWbktijzw6eSjnh9bFmQOyXS+Hp1DnUUNZ2cQ0zJhYo7x4+v//9j3Gmxu5
	fk64vMmIRwaBlYJOBlMsuOpasLSjy3azGROMa3Olxp1dRwdmmyL2TzlPghlu2GeJMxSG3Yj
	B6rAuAa9n5lLWwLxf20xb6BBeRIc2F0ARJxwtT6FNtD0cDlQezGJmhER55/1o0k4iIJqYrX
	54Ce/JucEds3q/0vOfVDQPE960s8KGG8AtsLOJ5dgVLhutsF83w0SDj0CGGh1HPBifJG0G+
	gb+FT4djauKkHcbQk0q1004r8zX1cMGTHcstn4KRzOUI38nlotfLlUXkOxu7Q2EPm4+tiEV
	lzAAtn56s4jjEetOcniVi99IFOT3xboufAJiQA5zpNV
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The SD card slot and the SPI NOR flash of the K3 CoM260 module, and the
MAC address stored in its EEPROM, are part of the module, but they are
either described only in the IFX carrier device tree or not described
at all.

Fix the SD card power description, move the SD card slot into the
shared CoM260 device tree and describe the SPI NOR flash there. Enable
the AT24 EEPROM driver and the ONIE TLV layout in the RISC-V defconfig,
then let the module's Ethernet controller take its MAC address from the
module EEPROM. Every carrier using the module inherits these
descriptions.

---
Troy Mitchell (5):
      riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD card vmmc-supply
      riscv: dts: spacemit: k3-com260: Move SD card to the module
      riscv: dts: spacemit: k3-com260: Add SPI NOR flash
      riscv: defconfig: Enable AT24 EEPROM and ONIE TLV layout
      riscv: dts: spacemit: k3-com260: Set Ethernet MAC from EEPROM

 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 18 ------
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 76 +++++++++++++++++++++++++-
 arch/riscv/configs/defconfig                   |  2 +
 3 files changed, 77 insertions(+), 19 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-k3-com260-module-sd-nor-mac-44edede14582

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


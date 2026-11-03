Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695092;
	b=LPlR9sJscIpFXaasRNHPCOU49nOvSJsYjqQm66cB7s2XH0ohGBbqTvtZSfCywSclNr0g
	 W1iPy/S9wJSLFkTGBs8653Sw6Pa75mjrQVudTsZoM5qjTYI+omfy1E+0tjRLl5Iqt44Sy
	 V7FCW1cEEyxHQlKkTVo9oD5rfETQZwQ7oOHGYFUqY3C2FWEmBHoryiDjlPF1Xmg/vR1yM
	 FOcDnkz4F4klw7ZTT3gF46VwbIQZ/9fhyY7ABBaFTnOmfywz+hH+DJUlJEN9F6QsuM1aJ
	 ZRPG6UC+8I66SbnWp1Ct1tZSARyaufWhZWLTtSC+5gksCSjEusM5kEicYQB7f2z1TVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695092;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=TdamLChv+sdG6LNLYw2Qd9U2h+0ZmzxZDp/9+0oIr/8=;
	b=gYxTFUTUpcuaXGCygEL8SZn1W6UKYJ6EIBVfKUFkz3fpdX1lUswGG9aYQ5YkZ42XOWGY
	 G4f1CWOt0ncShFnEZFwEwWcWArKF+VLWwEyfxaYaNVxzGQbrVLanaJZVfk5MrJTnV8Pgs
	 8DouLsT14oDKq8VMu1G9/qFTQGY0fGBx82Xu0gPbJ3RdsxK5sJrd3MRJZdpbcASvqWJC6
	 KAWo4uPvXxV8WRD9aotQKNSZf+8uEAYwHIvx0EvkdOqulio8c6GbE72HQnBFJ5zoA3cjw
	 G29cKVwWv7SuT2OD+UBeGhKWt2suzN2CvHM1/kPl9km48hXs6vGTn7YqJcVLVxTEVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=w6cO5Iqj;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D336606B6CE;
	Tue,  3 Nov 2026 08:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D336606B6CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=w6cO5Iqj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695016;
	bh=TdamLChv+sdG6LNLYw2Qd9U2h+0ZmzxZDp/9+0oIr/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=w6cO5IqjJExIIXtaNNyHsNqRVmvJutHxeRni/Qqkl+1gKQ9qzkX7zFJIOlUMHWbqC
	 hQ+zD43oqJp3c+fU1cZ1zb5zqnVghHnh3pxW+ROCV3CJ2Sy8eToXGlG2/E6dcBQioK
	 xNNsRYe4b0YZ6jXW3wVfkyN9uxwBPYS6MpYPR+Ig=
X-QQ-mid: esmtpsz16t1793695014te7e09926
X-QQ-Originating-IP: nmbsjrG9Q/k+ygiAZgy/ipMAVRJ/EG1ptsNZJKn7YJo=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:36:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3319238422093485390
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/5] Add SpacemiT K1/K3 SoC timer support
Date: Tue, 03 Nov 2026 08:36:45 +0000
Message-Id: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDuQpCDRq5Qu4mSsI/hDJkpBv
 LuxXX6L9w5QTsIKbXVA4l1UlrnAPiqgIcwfRonF4IyrrbEN6hqIJ8moC2GWiRNSiP3TeB+dr6G
 Ea+Jevr/p6/23bt3IlO8TnOcFVjedxXYAAAA=
X-Change-ID: 20261019-spacemit-soc-timer-cadf3088d286
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=PNHlNjoGBqlCgwqEiENuzZY3/cTV0XgOwjEaCmEORME=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yqJB3DXBkxkFtjr2xqw3Dhhl869tV/m8RTE3fxkH
 a6nee1DRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwERubGFkWFw073bSmxC5oojL
 nHahXrHGXhuvTXT3z/83+5y9W0pDHyPDk1MFM+s1ux5vrlAXmuPtO/1ryNdJmwwLSpdwWycI3/j
 LDAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGcOLeZOn6+Xc9iI5B2rtSsjF4jH1PDw0GhPYigu5Cvs0iPhsnj4u3W0
	T37bNLRTcdkVPXglvZlkyQ63KKyeMzgPd+Jeikq9HDjvRsE3iAg1+vtf7CAqylwO5SC6n6z
	SvENZ3tK6dU8FnbIvgXSqyX3iTzwdq0WsGWWvEMgPHuxAJ8nZh2+VETdrxvaM+Ajmpa5HVX
	aDBDM215XGQHTQQkyCMRbA+RJEmx0+JxDqi7d6T5wn1iF4HPX2ZWtuN9O2ymMNbGwVRZoqo
	2JhdUxndwqaKxH3JelgJZwq9eRV0yzcTNAZ+upqEMHceqF5YPGyVQ11xeGZskboK7cU2fEe
	88DnLRpelZKbBKg6mem1aCiYMSiPuHC0B1R5V9OjXO/imhjfdql4QY03sDiU4k3CFYHq0Sq
	9myeNsfcflsC6CFG9/sK7j8yqE3mcy87tuUr4kMp2EgxXTiKBq+aSGGSAuSmHNqjr9XuRO4
	DhNeiGGZWMVswsvdnohK47+Zbj4Lr9nAbp8EYaO02ejdDqTKaH+t28Dl8NkX7C1SiH8VAhH
	n8FFUOw+ZlQZ/6cjpsFs7wGZYzp6DffgrVAGwkF293arWvK+yYu09MSIPFE4S9X6JOeI9xI
	vvQ59BsNqiWNZs1gz/2rZh+U18SrvzIAMwwSsCbGGQvu4EEDvMgyuIz4e29JP9bGUZQfXfg
	1Rc+bYZplcUltI4R08Tk5KQe6IInsPii599mIPj3CyAZJKCJb+Sp1AYCZkYEqeE+L6pUWUd
	2vsD8N7tCf2b619qQ7TC3XOX+Ylxw30qUXaihC7Kq2dT4akbKyVrh/XRrt7+Yj8RXCl+Lo7
	yzMb+KUk0fW6iGYpH7ASJXbDB6xo2yIg0L395FbPVAUrzFH7WebTGUmcXeBU/lpJ4jQ284P
	qqWrFP+ZdhzdR0uXAP9Kcb/xinSrVDuiEgHpM2j8bAuZC0lMwYRvOyVRm2qhdri2TXOhN4H
	N6DIR8PAJ8A+m6XLYWFEyDs4IkKXtBvd2a+y5tg/PuSQc8XppCoeeq/17OEY/i+eDZW8nhx
	0RmG5mTUxFdu5728C9TWmnTCwbTmkqWWn2DUWaPLjcKf3tdWn74BknI7284x+UQkZ0LKr2Z
	EePR3EpSBLfURX6rE3oAOqqrfJBWeQw9Kv1FXdbaMzTrA3wSarvrqo=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 and K3 SoCs have APB timers that run independently of
the CPU cores. Each timer block has three 32-bit up counters, and each
counter has three match comparators and its own interrupt. A counter
can be clocked from the functional clock or from the 32.768 kHz clock,
and can run in free-running or periodic mode.

This series uses counter 0 as a oneshot clockevent. It is registered
for tick broadcast, so it can wake up CPUs whose local RISC-V timer
stops in idle.

K3 uses the same register interface as K1 and falls back to the K1
compatible. Both SoCs run the timer from a 1 MHz functional clock.

---
Troy Mitchell (5):
      dt-bindings: timer: Add SpacemiT K1 timer
      clocksource/drivers/spacemit: Add K1 timer support
      riscv: dts: spacemit: Add the K1 APB timer
      riscv: dts: spacemit: Add the K3 APB timer
      MAINTAINERS: Add entry for SpacemiT timer

 .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
 MAINTAINERS                                        |   6 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-spacemit.c               | 312 +++++++++++++++++++++
 7 files changed, 425 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261019-spacemit-soc-timer-cadf3088d286

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794455999;
	b=kcp8ST8C2e3be4soL0b5PUkOw/KsTz2yvXqgsJ/Aas7xoKvV3aIHjYAmIADokSQFnDmR
	 JJpWngaT0bupRA91QpTaMGaabritPNc/sBPdeEkEaYMnAcyHSHPcdYSSW/W6w4DDNh486
	 2pCwMv3W6x9fyKKv8HoH+fRPTPF6c5tuobjkAgVBzk5TQQDj6NI0qG75lvx23tOX2cVTC
	 4x2lE6s0DuYcH44VaOJXAwRzcVIsFa9pDGpIWO3EQ0TYHBt/cUbn6O69Sn8xjr5lGXOOa
	 Q/F1IC0SapQYEzLXkCh4zwY5Ds8Frm9Q8Y8eCaO6R7vNALc7FWA7Ja0UW+AoZynSWbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455999;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ANLz23Rke/l4eT311lEL+8VsHPwwlR8dTechKyhxJwA=;
	b=RZxMBWwDIlx5u2iLD1bUjaY7BnscrPiTnPDHgaKElwfzNa16NBZc4Xmwnd+9DtpJqpry
	 XaSos3ieAdqjtkdwe+KpGqpZCz6o/Fb1c2K6MzrGU3ljt+QqmOx3WrQbNn0+ulZmEZ5Jt
	 um6RwvpRb4lBgmvu+hH3hwcPHpVAwILOn+T4HpPiJKNwTYvPIWMaZmiJUnYLpOIUtsPxq
	 WLC1ND9nZZeFXBb5u1Bf3nUSaiMJWjXQLI1KsdfcfsCSCbUE8eI41qi1FlKUHTamoxBof
	 TLNdj94pmmLii5sEoAoCXxhWKdDVoqH3OpwxT0WObHFeIgym6ygdwnHPmdAmBbmmTQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EX84Tn4e;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563C0606A321;
	Thu, 12 Nov 2026 03:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EX84Tn4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AN
	Lz23Rke/l4eT311lEL+8VsHPwwlR8dTechKyhxJwA=; b=EX84Tn4eosQEz2RdZR
	cLoRdPgl7QOxJG/7s47/d1mk/5UvXxp1Pu8GLUIkaihD4GSvDFjRaMEtmjRMk2vi
	rsChY8TskS37JT0BiPXcUZjSwbJQJ8i69PHeC+fVgyx2xLqCajjxmIdO5jB15Iib
	hdm9u/VWxm3Cgzb/2vl0TJOIo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnLyOjOfVqoxypHQ--.28331S2;
	Thu, 12 Nov 2026 11:59:38 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
Date: Thu, 12 Nov 2026 11:59:14 +0800
Message-Id: <20261112035914.1949-1-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
References: <20261109110352.1621-1-xing1989093@163.com> <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnLyOjOfVqoxypHQ--.28331S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17Gry8Ar1Dtw1xJryUGFg_yoW8uF1rpF
	W7tw4DKr4kJrWIyr18Ja18ZFWI9395tF45KF1fJ39rAan8ZrW2yFW5tw1Fva9rCrs3X34Y
	9FWaqryDuF909rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UnAw-UUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC+wqQTWr1Oaq+cAAA3u

Jeff,

You are right, and my wording was wrong. I will remove the claim from the
commit message.

Now the background, which I should have led with.

On Windows wwan modules are reset through PLDR. The platform firmware exposes
an ACPI method that drives the module's power and reset pins (FCPO#, RESET#,
PERST#) instead of resetting the SoC with the link in place, and the Windows
driver uses it for that. I am adding the Linux equivalent so that the same
board can be supported without a vendor driver.

What that path gives us, beyond simply being what the platform provides:

  - It does not depend on the endpoint's PCIe function being usable. No MMIO
    access, no config space access, no link.
  - The platform owns the pin sequence and the timing, so the host does not
    have to estimate it with a fixed delay.
  - The link goes down with the module's power, so the endpoint is
    re-enumerated and starts from a clean PCIe and MHI state.

Concretely, on two of our modules, RW135R (SDX35) and RW151 (SDX81), writing
soc_reset from Ubuntu reproduces exactly the situation your commit message
describes, and it does so every time rather than occasionally. The module does
come back on the bus, but it comes up reporting a MHI system error:
pci_generic takes MHI_CB_SYS_ERROR, logs "firmware crashed" and forbids
runtime PM, and from there nothing gets the MHI state back. The only thing
that recovers the module is a reboot, which is also the only step in the whole
flow that actually toggles PERST#. Resetting the same module through the ACPI
method recovers it every time, because the module is power cycled and the link
is retrained, instead of staying up across a reset that only targets the SoC.

So I am not asking for SOC_RESET to change. On these two boards it is not the
reset that gets the module back, and the platform already provides one that
does.

The point is narrower: these boards provide the host with a reset path that
the MHI driver currently has no way to reach, and the MediaTek vendor driver
already uses it. I only hope that the MHI driver can use this method as well.

Thanks for catching the first paragraph.


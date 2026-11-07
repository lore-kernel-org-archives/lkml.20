Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066504;
	b=1IfcpBmtEBxZIrwmOGQsUNTOFYb8C3FUG7P6rUJsra7RnTAGXvW50vZXsIFBKBHMMDIf
	 nbA5+FS/IpB0xfT2wH2keuO4oabpq+WaqkbY7RebTb5ck9uFHDMF1SrFxHIpuSvzuyxsR
	 dknEjI8yepf97mw3Y6GiQDjYE2AR1j6hGfoKarI/I7DmjfrTIgyJ6e/vPGUjpG59B3j5t
	 2N8TXIcoL76WKzVRGcAcDNtjsi2uYpM0RJOH4oMtasNPG2T4v5hZB+rNP/K3E6OYpFbFM
	 4k/oxz7ramF3pJXo6m94a5s6pLMSp58sTJ3afTfi8qBxLz0/kzwdDSO9vI23gV4mmiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066504;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2TSwzs4toJkuTQ0MSsNXskQy4m0VfDGBoS0m1W9mFYE=;
	b=1u2FA+FKYGrze6pScWzGrfqqcmiscRJKxdml9DKAEQJ+CsK1rDqgzr1JsqIX2TZ2lbYb
	 f6CFSgdavyx5cflWw+4OxjgqtjRHbFzUjtXO4Y3gKUn8pu/JC88h2bD36iEhaQYRaplnk
	 Rsvhuk+rzLovSi4T/LsyErOiAomKE9558xkItzi7MhPjeYSiStv+lpk96rAs12h67lvj2
	 KYZcDWNkt7oJ6GhK4C7WrByF5hAMzv/xHlPf438FbQ/jy3ObxL05hLYONAWpVtAVTno75
	 aSmymiIEMy/1uZFyIJT76Q1siyLhCx0GygHMkjd4cg2ktuVARe5Lxs2LzKH5/iVH8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=GTOuLeMy;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F13606A339;
	Sat,  7 Nov 2026 15:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F13606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=GTOuLeMy
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: af9fc4e5-9ee0-417b-900e-491deda6e2f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066493;
	bh=uTpTCkCVs2J2SIQukI3selteqaCydXP7zz1h7Ezajk4=;
	h=From:To:Cc:Subject:Date:From;
	b=GTOuLeMycp+Q9ysJdonMalNh8l8q5MUBe7Vyuy47zb7GIf02+khYfw4dxeU07Txtm
	 l3VEKipvkOnLLOZN6cmrympZrM5oYqbKHfvKCDaeGi6bi79X14IwZUPrjq9429bSES
	 0ixG+b6yI494RWnk05EqmCjZIbg7sYjwrB6Acyd2srTQVL5sOws17VTJv/8+vveoFj
	 qf+KEYagEMqZW9xWIxbEzeuCzkfRHdQyJmfX8PuhD04A7+Zoea03oTl8QIyAd8R7SL
	 lcCYWgEaxyrTZddugrKh/2i9Uzp/PFissUT5fnPmMXIZ7JrfphhW4x2S090Qa5PgYH
	 Vr4UlEU93/OLg==
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Michael Reeves <michael.reeves077@gmail.com>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/4] wifi: brcmfmac: pcie: S3 suspend and resume on the T2 Mac chips
Date: Sat,  7 Nov 2026 16:48:06 +0100
Message-ID: <20261107154810.89780-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
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

This goes on top of Michael Reeves' BCM4388 series [1], which also
changes how brcmfmac talks to the BCM4364 and BCM4377 of the T2 Macs.
These patches are follow-ups to it.

Michael's Patch 5 moves the mailbox to the control ring when the
firmware does not set BRCMF_PCIE_SHARED_USE_MAILBOX. On the BCM4377
of the T2 Macs that makes D3 work at all, since this firmware doesn't
read the TCM mailbox the driver used before. But that caused some
other issues as an aftermath.

Patches 1 and 2 fix two things in that path. D0_INFORM on resume fails
while the PCIe state is still DOWN, which I reported on patch 5 [2].
And with host ready as a capability, the host ready doorbell at init
halts the BCM4364 firmware.

Patch 3 probes again after a resume through the platform firmware,
since the chip loses its firmware in S3. Patch 4 stands on its own and
drops a tx status wait on flowring delete that the BCM4377 firmware
doesnt satisfy.

The Bluetooth function of the BCM4377 gets the same resume handling in
"Bluetooth: hci_bcm4377: resume after ACPI S3" on linux-bluetooth.

Tested with S3 on the BCM4377 (MacBookAir9,1) and BCM4364B2
(MacBookPro15,1), and probe on the BCM4364B3 (MacBookPro16,1).

[1] https://lore.kernel.org/all/20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com/
[2] https://lore.kernel.org/all/20261106153612.2aadef2a@kait2en-mbp15-1/


Andre Eikmeyer (4):
  wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
  wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is
    a capability
  wifi: brcmfmac: pcie: probe again after a resume through firmware
  wifi: brcmfmac: msgbuf: send the flowring delete without waiting for
    tx status

 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 +++++++---------
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 26 ++++++++++++++++---
 2 files changed, 33 insertions(+), 16 deletions(-)


base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
prerequisite-patch-id: e3427132df0f9740b79d9b3f84bc14c25f787514
prerequisite-patch-id: 1a0aae8b057854813ca6d1f20d3bf153a7b761ec
prerequisite-patch-id: 3453364de54d0d786a6126fca792567f13aa3679
prerequisite-patch-id: d40a127ef83ad7d898ca7c3d643b45b829051477
prerequisite-patch-id: 5bd50905bb42d138eb6fda7d5ad795615348ecdd

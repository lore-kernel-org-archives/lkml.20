Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398877;
	b=O8DUmwitoUS31GQn9xgyP2OzFhBHjbz/WJxQygLd2wmjeZwDw0R5CFKD1ISlOwAudXhZ
	 aSjEW9JVmyCf2yxSM9Qkp33RrC12LvlmdRyTJ4Sqr+CxhHSjOAN5Q6G4fz8sZXdnVr/sJ
	 rdU/XwQNTzMCVmO5KmJE3gZRFGmdenvR+7aQimZmHfEUGAdR6un6apwjaN6Gm/qVQ58Wp
	 PCwJJpp6qMiCLa9CoFv02yrTXsZYTV90jTEnX5yEfvpIsnySRDvANUArm1nL7yYPmzl9S
	 UNCfYM+LjcZgs5bRH/PD823ODFtbliwdkh5ooiaWy2cdqqOe9+9sZlm+qowQAd/0wXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398877;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=g5R0K3IZIHy246hgxZLfTU19+W5nQFmiPBUSilhIijw=;
	b=TczePEjr5MC88b8nGSXsLsvwSzD9DkxVuKGRVzTZbCNABUL1iXjHBAIIS0H3vXlGjn5x
	 Yr1pwMEOi0SSouCjcbTSPmWbJw++qfH66ZUd1jUHGklt4RSsXROR/XMuZFfKF6c1ynlb6
	 QlKrttplCN8xv7XsmbkzmKpSKHwFxC5NX+XMF9LNaTYjwjJER9jbzFwVHgDsfvnRbhakK
	 Ura30z+Q8UA4+znUxGkPOapqU26aNz+S/tkW2sMJVUwcTPPqmXT2ebB7I1xSYojHv6fPs
	 4r21CKE7bchlkVRVOlvQ1sXNmMY+EZP9MKnlWJE8yfWUdzPs83WxZq9g/Br3/Xak4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=GD0U2mHZ;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09288606A324;
	Wed, 11 Nov 2026 12:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09288606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=GD0U2mHZ
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 50e911bf-d1cf-4422-8090-7fd7250b7ee3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398872;
	bh=ZYz2qOc4yLXdFNBoEswBsNyVivW/h9vhEpo8PjeKUZg=;
	h=From:To:Cc:Subject:Date:From;
	b=GD0U2mHZStjHSujWcUPXwiBXhULtm7p8ZXccbDcdP1SXx4hTrqUkM3By6UhLam1dI
	 4cZdFOCR3zxawE2RoUjk1lK4gvyorAxpeD9Lcu1VFjp+0uYRVid24ARgqpM02rFNyV
	 aRiwYh9L8ALFqXOOaAPSRuZcFRodKOhp0yHQffvtGfGYLajG265XcgOFiXnoyCSZ9r
	 07nP5jdJP7i7fpNUAvh8ICj7QxcQsASfaREQZCzM1vAYzgvrYadnxmYCQvwgfzmd9Y
	 sKAHAh4+AFP6GCNyoeHJZ/Ufu06w4J1c6B1NNZtHfLFsprawnCVKzHlyfeylbRbxZU
	 PgdGnH1m0w5ng==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 0/5] wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips
Date: Wed, 11 Nov 2026 13:07:43 +0100
Message-ID: <20261111120748.23795-1-dev@deq.rocks>
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
doesn't satisfy.

Patch 5 is new in v2. The BCM4364 and BCM4377 firmware support inband
deep sleep, but the driver only advertises that it has no out-of-band
device wake, which leaves deep sleep disabled. The firmware then stays
awake and its latency tolerance holds the package out of PC10. With
patch 5 the firmware enters deep sleep at idle and the package reaches
PC10 on both machines. It also relies on the mailbox over the control
ring from Michael's patch 5.

The Bluetooth function of the BCM4377 gets the same resume handling in
"Bluetooth: hci_bcm4377: resume after ACPI S3" on linux-bluetooth.

Successfully tested on the BCM4377 (MacBookAir9,1), BCM4364B2
(MacBookPro15,1), and on the BCM4364B3 (MacBookPro16,1).

v1 [3] has not received any feedback yet. Without these patches the
T2 Mac chips do not survive S3 on top of Michael's series.

Changes in v2:
- Add patch 5, inband device wake and deep sleep
- Patches 1 to 4 are unchanged

[1] https://lore.kernel.org/all/20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com/
[2] https://lore.kernel.org/all/20261106153612.2aadef2a@kait2en-mbp15-1/
[3] https://lore.kernel.org/all/20261107154810.89780-1-dev@deq.rocks/


Andre Eikmeyer (5):
  wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
  wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is
    a capability
  wifi: brcmfmac: pcie: probe again after a resume through firmware
  wifi: brcmfmac: msgbuf: send the flowring delete without waiting for
    tx status
  wifi: brcmfmac: pcie: support inband device wake and deep sleep

 .../broadcom/brcm80211/brcmfmac/commonring.c  |  14 +
 .../broadcom/brcm80211/brcmfmac/commonring.h  |   5 +
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      |  23 +-
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 259 +++++++++++++++++-
 4 files changed, 282 insertions(+), 19 deletions(-)


base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
prerequisite-patch-id: e3427132df0f9740b79d9b3f84bc14c25f787514
prerequisite-patch-id: 1a0aae8b057854813ca6d1f20d3bf153a7b761ec
prerequisite-patch-id: 3453364de54d0d786a6126fca792567f13aa3679
prerequisite-patch-id: d40a127ef83ad7d898ca7c3d643b45b829051477
prerequisite-patch-id: 5bd50905bb42d138eb6fda7d5ad795615348ecdd

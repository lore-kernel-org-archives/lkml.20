Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715641;
	b=Quo+E1Cl2n1GDKX/m5slVcwtLBHFBp3q9LgsXkQDVGsibYADtVKQMh3JeHPLgvRtYtGd
	 9PyLOt7KXHEe2jhTrlZDZ1LlvLjoQ//V8uXJimpwAkD285h8dKulSu8rsU97Uli8NK6tw
	 4ndAQbPBv6LkSYlJlLvBVIOu9RGiCpZ4E07JIh6CzfD5OHF7vGFZvVLFfMaHM+MAJyQiK
	 jQxxmtcdN1i1BhKbCbLfv3Lw3fnRvcOavpHMb2Iz3yauVlTI+5SybgO9MfvkHJLgjoT/I
	 oFDCGEzMQ+1G9g+ChoA2rlYLYA+DcA8X7/AB58Cdao7HCe7oWAH648f2psMj2WBKcXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715641;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=3RVggftuvHwkvIwsFz0fnp4JO9GH5RXRpDd19+3u684=;
	b=bIt1ADumig7eGh5GhK32c6waRVUex1FgN3EQ1CqPk0H9Hg1iKvHq1oG+DmrQfflsZtg/
	 OVBVkcT2H3JHvfgsHDPippqgUY9j2yx8qbwztaW7Px8t/aZKNmw6zje4g9SvcIvBODbup
	 qf/gJPzMZpOWdp6m4DmkoklOBPqFMY7dDO1JW/9Fr5eEfz2MnarI3OkNfSg6vJ78+tYct
	 DQmxYrLhIw0p+KncMeYuGrdM+86ns67T49BKYZmfCryeePBIeA3bJOAuIWUqbwj47FuFg
	 z64CiM/7rXLsrRwXLw/RwRdWtaRpHcvk7j0x8WeaPX8w0Th39FR1aV65z7/IsbA6IXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=hBEMEyx5;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51F606A331;
	Tue,  3 Nov 2026 14:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E51F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=hBEMEyx5
Received: by chaosmail.tech (Postfix) id 51F7B1C9936;
	Tue, 03 Nov 2026 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793715631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3RVggftuvHwkvIwsFz0fnp4JO9GH5RXRpDd19+3u684=;
	b=hBEMEyx5d72x+n3sjqAsBCDqCkKYHjumFCwi45Nthqq+T9CANW/au396p9wO2OQl4mRh/V
	4sfk7LPtnFa1g++vvaW4C2zErPRSzPCRoaP7yhaeKdIgOZM0CVfWR8gaTIkxhwqLHe4K64
	03ma5itMnE1iEVTmLRdvybFPuiC5YsQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v8 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Tue, 03 Nov 2026 15:20:22 +0100
Message-Id: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23Py27DIBAF0F+JWJcKGB6mq/5HlQWPoaZq48i4V
 qrI/16cLkJUllfMuTNcScE5YyEvhyuZcc0lT6cahqcDCaM7vSPNsWYimNDMCEWXfI7UBQTKLPN
 JGYZJWVLnzzOmfLl1vR3/cvn2HxiWvWCfGHNZpvnntmzl+1yvd+WUUQP1JYLmMLjXeslUvlz+f
 F4wjGQvX0XLTctF5Rykssr4qEF1Odz5wHjL68foACCSwOBkCl0uW65bLvfj7aCU54pZLrtcNVw
 8bFeVg5ASI/gYIHW5bvnDdl05Wm4TWGfBiS43d245a7mpXAeNHgW3kP7zbdt+AdTkySQzAgAA
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715630; l=3013;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=IuiEvdU8lEoA4WmSDCVzkUaJ2thmJ2Vk2etNoP34VuQ=;
 b=9va4+cT0aKs/8SFkkzEsdgy+TDgL052UfCETqpRM+8DkAARASZiGbHp/LWyRxoqK7yBRsV2et
 8JRecnfC8rlB7Bi4u809KI07vHxGykMenXelppLp4zHRU86A+16HBHF
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v8:
- Rebase on latest
- Link to v7: https://patch.msgid.link/20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech

Changes in v7:
- Rebase on usb-testing
- Link to v6: https://patch.msgid.link/20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech

Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/Makefile                                 |   1 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 247 +++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 705 insertions(+), 196 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742C728C2A1;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596278; cv=none; b=QqLU/acOlt1YNiSRNnCvNjgAKWl/7tPOpbeLjkWqL9PzK/PC0SnMGlSLVwVLOogij1kErWxRacruYw8vIoXPul6KSPKsMf6ynXoIGpFe1UWIYCVnvic1VWI3IAp+vUv03V/NcSNvPT5PW9menym6w9dzecRBTsbDO4VkJ6HtGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596278; c=relaxed/simple;
	bh=31rGmGRNI+8laE6BprXBA8j1bUcX5Rkg3qAotI8jWsw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n8TOlIkxNi7poesTAi8PeTQPLJCnC39ZXnYt6yPrVnUYERthF5RFtLAqAfoi8Gk9f09FWfxzulufGf/bdW03wCZSMA5qheNr/pIp9zm900MFZfIW9R6dBnsRkS+i1JuBCKTjkV4lzJdb6FvR1jk0ugih+u1dACnMwIRmaGS3yPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qn+zgZhR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qn+zgZhR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D000C2BCF4;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791596278;
	bh=31rGmGRNI+8laE6BprXBA8j1bUcX5Rkg3qAotI8jWsw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qn+zgZhRtZJli9XDE9XU26SXqg9wpm0UV9ypIhVuCV50tE1zvGNjXZcotBQAdaIjU
	 mHLChdGMNaqK5xexEKK/V2BBWh0meb+KBaW+DrqibQYVVwtNgFjlaWpuBTTSsoJ8Is
	 vceF6BpfsmpBvH6F/IitInkfHjTucbXMEHjacH8AnqbZkiQlkC42Ymfc/3BNxuDAVv
	 +rsTDiZuhMWfwMl5ZyQu+yFf+LYOLUx5OS9cUIoDoiMN3RxuD33Y3Vv4F8LP6xbSBT
	 LvegpfhsFD1eSdGAioAPqKkGpgq2pGlqUf38R2PuznAyH3BG0+ax7wOYPIhLwGIxvh
	 umybdcuCAxy8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE7ECA9EBE;
	Sat, 10 Oct 2026 01:37:57 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v2 0/2] usb: typec: tcpm: Make tSenderResponse timer
 configurable
Date: Sat, 10 Oct 2026 01:37:36 +0000
Message-Id: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCWyWoC/32NQQ6CMBBFr0Jm7ZihoIIr72FYQBlgEmmbDiEaw
 t2tHMDle8l/fwPlKKxwzzaIvIqKdwnMKQM7tW5klD4xGDJXqk2Niw0zKrueI0bW4J0yLjIzXmz
 Fhtti6G4EaR8iD/I+2s8m8SS6+Pg5rtb8Z49qTlT+qa45EhZD1ZUFVWVr7WP0fnzx2foZmn3fv
 /5jvd3DAAAA
X-Change-ID: 20260929-tcpm-sender-response-time-5c8e2ea3fb70
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, RD Babiera <rdbabiera@google.com>, 
 Kyle Tso <kyletso@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791596277; l=1458;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=31rGmGRNI+8laE6BprXBA8j1bUcX5Rkg3qAotI8jWsw=;
 b=eMgRJ4syrBd9stXxs8poJZO3VdUQG32wA2jD9l4e9thkmBe5nU2MtILjywYkghzSiktnenvpn
 ypeBuEFo4W9CruMal8qMIpudGAiu0rKj+zjtRocaJDWcFrFrMGIb35y
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

TCPM currently uses a fixed, relaxed tSenderResponse value of 60 ms
(PD_T_SENDER_RESPONSE) for all typec ports. This series adds an
optional "sender-response-time-ms" connector property so that platforms
can specify a different value. Ports that don't specify the property
continue to use 60 ms, so the existing behavior is unchanged.

Dependencies:
Patch 2 ("usb: typec: tcpm: Allow configuring tSenderResponse via
fwnode") depends on patch 1 ("dt-bindings: connector: Add time property
for tSenderResponse"), as patch 1 documents the property that patch 2
parses.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v2:
- Added minimum, maximum & default constraints to the dt property.
  (sashiko bot)
- Link to v1: https://lore.kernel.org/r/20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com

---
Amit Sunil Dhamne (2):
      dt-bindings: connector: Add time property for tSenderResponse
      usb: typec: tcpm: Allow configuring tSenderResponse via fwnode

 .../bindings/connector/usb-connector.yaml          | 12 ++++++++
 .../devicetree/bindings/usb/maxim,max33359.yaml    |  1 +
 drivers/usb/typec/tcpm/tcpm.c                      | 35 ++++++++++++++--------
 3 files changed, 35 insertions(+), 13 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260929-tcpm-sender-response-time-5c8e2ea3fb70

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



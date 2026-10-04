Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9FC3E558C;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085273; cv=none; b=TZPANI4bTQ4KS+xzQ9XjHyOpVlcf3fCYQPSzRMD2hod1FuH9M8p7VefP0x1sqNbDTUPFHFBbM67nuALnwV6BzX5vJ02lDPcQr0RXmEF1IGokthb286gVGRdQD0BSwxFp3sWFgVbfrrAaayFp6L9FeeuU8ktK1b2HHRfnnyLiXpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085273; c=relaxed/simple;
	bh=Bw+XAt7hgXsyMtPrXK7VbARjYiUwD53FZixV49JSgUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rM9DmdBRVykwsYL9WT3HxbyA/SQKohIxL9cKXQXyZvqhT3dwUd6+PijH5v/bdoB2gSEHGJ8+zEGkwQvO/StlQAcZYRx9QjA8SEHYVZnU3HiMbnTg6kmibUSt3pZQCQ7e7tYQ3rnyKY6gL8EWQwxyR672fdphFpbEaoo8Z3j+Dl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2oaNSJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2oaNSJk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E63BC2BCB9;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791085273;
	bh=Bw+XAt7hgXsyMtPrXK7VbARjYiUwD53FZixV49JSgUE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=f2oaNSJkzUbfBKLUkXUvQBKjB1iMD6nXU1ySoXZcU46MoS8YFz6ROR1UI27LfavGP
	 x66tsWFmt2iyYzzLTBKhONXdNRCMCrE7IEHszuzAU8cfmJoA9cYYDVtb9JZhEhYDF7
	 xpoxJ+5R0npzCKTlYAf67NCCftTe+qx7tTCZfwcKyK/nXXZjgTHYoiJ0rnI/NYZXkv
	 Y37YyomwBGL2Ba6w98/X0xueL5lDMDDLWTWFKPLjCXCgam0OX2ntog81IDPo/BlFj5
	 dzcJyZUrUOgDNsUjV2qrC4QD/t+S6qP3Bv4pKExGOEyOYZckUBCTMjz0joiy4E6yz6
	 zh67m4unCQ4WQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F035FCA5FE4;
	Sun,  4 Oct 2026 03:41:12 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v2 0/3] usb: typec: report a current limit for non-PD
 Rp-def sources
Date: Sun, 04 Oct 2026 03:40:58 +0000
Message-Id: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMvKwWoC/22NwQ6DIBAFf8XsudsAjSI99T8aDxQWJVExYIjG+
 O+lnnucSd68AxJFTwme1QGRsk8+zAXErQIz6Lkn9LYwCCYapniLk96klLVCb0Zc94UMttZ9lGs
 fVnIBZbhEcn67ou+u8ODTGuJ+fWT+s1eOM8b/5TJHhkppq7lrakP21YfQj3Q3YYLuPM8vzBb+p
 bUAAAA=
X-Change-ID: 20260918-max77759-icl-typec-8dfb9f83d712
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791085272; l=2069;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=Bw+XAt7hgXsyMtPrXK7VbARjYiUwD53FZixV49JSgUE=;
 b=hLMDk5L4bX183mNfyHUFNocqiGpp45N4e1ydwnEREp/RXThhBz0iFcoW0VREHsgJzI6nr2OvC
 biNiYYShu5GDFuSUKqQDGN0Cm7gw8SkgNJT4weNE/jQ8l4YvyOcQ13M
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

As per Sec. 4.6.2.1 of the Type-C cable & connector spec when the
source advertises Rp-default, the current limit is set as per the
USB 2.0/USB 3.2 specification, BC1.2 specification as applicable or the
PD negotiation.

Reset value for the Input Current Limit register for the MAX77759
charger is 500 mA. Prior to the max77759_charger driver, the battery
would always charge at that limit since it wasn't re-programmed. Since
the driver was introduced, for any non-PD source advertising Rp-default,
the charger turns off as tcpm reports the current limit to be 0. The
max77759_charger driver reads POWER_SUPPLY_PROP_CURRENT_MAX from the
"tcpm-source" power supply that tcpm_set_current_limit() updates, and
programs its input current limit from it. The limit is 0 because the
tcpm doesn't have visibility on the USB data speed or BC1.2 detection.
As a workaround for the Rp-default case, let the Type-C stack report a
USB 2.0 current limit of 500 mA so that the behavior is at parity with
what was before. This is until we implement a conduit for USB core to
communicate with the Type-C stack.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v2:
- Remove greedy initialization of `limit` variable in
  tcpm_get_current_limit(). (André Draszik)
- Link to v1: https://lore.kernel.org/r/20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com

---
Amit Sunil Dhamne (3):
      usb: typec: tcpm: only call get_current_limit() for cc=Rp-def
      usb: typec: tcpci: implement get_current_limit
      usb: typec: tcpci_maxim: implement get_current_limit

 drivers/usb/typec/tcpm/tcpci.c            | 14 ++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 15 +++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c             |  4 +++-
 include/linux/usb/tcpci.h                 |  6 ++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20260918-max77759-icl-typec-8dfb9f83d712

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3E41F379;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895081; cv=none; b=J3CTPsZr+Zm8/HThuoR8EGwxb0/yK0Qa7ga3sQ28PWQxylU+V5W9YNOucRCE+WKekmagdJei5hEgniMv9E8xtGr/7egjIZaycj1P8rlB2fnDBjTAyMb837YfrNVM6CGeyD5MMKamVtP48qu4kDTugqA+TBnho7/DqUn3+5HgUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895081; c=relaxed/simple;
	bh=YrfD6f4Lo82zURUGW6cJqr7xJNdH6s6PlN+VnuALevU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etfcXD62vIYjpLwpC5hZhQ0vzl1k8b9mKU/6LWDUbtYN1dgxzMHKpURFzE3Cam5lwrY1n9Lsg+U/iQkLa3oYTrx5EIDzD8/ypT+G/kpjI/mON6FUsz+am4lba0KrY6csyZO+hyZKaIitmS5cwmhYvdZDjHShwDmVveRvbW+1J2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jizbaxAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jizbaxAw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53648C2BCC7;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790895081;
	bh=YrfD6f4Lo82zURUGW6cJqr7xJNdH6s6PlN+VnuALevU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jizbaxAwZHTbuL4xnqlIlVEq7CE0a9QoedHaB17cSa7s/hc/s6hc+dwfZYr2UsZBt
	 I+zhPcXfT3yE7xEQ0I3gJDnCp1e4ZE+iSeIlZQqGaxsJYUy2lTGTJ5pdmXCt/GKnI1
	 WN4nDa4C7vU0GNH0ML1I7LZcVrSaMY/5EdSst3wdTVJjtt9pMQVDPuRWQ7/uWTOKlR
	 1qp5543d/8QJaN7V01SNxVH8Jstu6c7i/sjSl+tuvA0s8upOZ69pOJnsBTtVx/kNp+
	 GZ5hgLJ9VSzEWnFdE91DzOruIt6h5iaE7VAi4JE23dAD0vhF9g/nwKyxktiYi48Ks+
	 FyD0jCDrTxmsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F67DCA5FD4;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH 0/3] usb: typec: report a current limit for non-PD Rp-def
 sources
Date: Thu, 01 Oct 2026 22:51:12 +0000
Message-Id: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODjvmoC/x3MTQqAIBBA4avErBtIo9SuEi1KxxroD40oorsnL
 b/Few9ECkwRmuyBQCdH3tYEkWdgp34dCdklgyxkXRihcekvpVRlkO2Mx72TRe38YLwunRISUrg
 H8nz907Z73w94IQwyZAAAAA==
X-Change-ID: 20260918-max77759-icl-typec-8dfb9f83d712
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790895080; l=1851;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=YrfD6f4Lo82zURUGW6cJqr7xJNdH6s6PlN+VnuALevU=;
 b=yXhA0wxE+WnbapdtWpIVV+HwjH2Rn8Z15JsA6cQFWRZXwr33/yEtJI06ux2bl3YHrNanqHmq9
 oCNCN0Ew9/yCv+0259VaG4lUJevSYjmLqC2cT0jdphCwpFkDtuNfUbt
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
Amit Sunil Dhamne (3):
      usb: typec: tcpm: only call get_current_limit() for cc=Rp-def
      usb: typec: tcpci: implement get_current_limit
      usb: typec: tcpci_maxim: implement get_current_limit

 drivers/usb/typec/tcpm/tcpci.c            | 14 ++++++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 15 +++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c             |  7 +++----
 include/linux/usb/tcpci.h                 |  6 ++++++
 4 files changed, 38 insertions(+), 4 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20260918-max77759-icl-typec-8dfb9f83d712

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



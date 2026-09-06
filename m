Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1682F1FF4;
	Sun,  6 Sep 2026 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698613; cv=none; b=ImiFg6LJGG/xv8QjWfhOQTmqr34Caxn1V+Qk6bDW7vOrnCeP0/CqTQcr1Cyx0VfEaTtw0JLP3to/AQPp7oZs0q+8NsBAa6uXUEYLI77wITr4QCy4LrWLQlle7h+6R0Ur3tBr6O6U4KiHkjgH/vHJQoO6m+d/HzQSRtrcrQh4fDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698613; c=relaxed/simple;
	bh=F0fgm1i8HFGP9oMA1VAKRxErBO1BdcjfJnpab90e2YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jfi5ywggRV+8CzTUi1ow6JmVbKmXBK83Jtw4gtRKDZKqZKK5Uzz2aIfzdBukWXCBPf7m6wTJYXVcULjjG6D/LxlvglHosssuPXvfXMP24MLN9OoAt9y6leXt9vZlFlnHBap/Bx65CrQ6OgGX/bIq4g80cExbcI8Vk0zF2J3RAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuHkG6Wf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuHkG6Wf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AE59C2BCB8;
	Sun,  6 Sep 2026 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788698613;
	bh=F0fgm1i8HFGP9oMA1VAKRxErBO1BdcjfJnpab90e2YQ=;
	h=From:Date:Subject:To:Cc:From;
	b=NuHkG6WfzmSeYW4FwnrVEAuDisNLBDjpDUVwJij7VBqRl+GGX1vO/oBuODOEr/d+N
	 VWJ3QaTJRByvjd1I+HkKaYzfanSb5p4Lt20ocTm6NkMnSHkX8zLL7/nsLtgCrzVjbk
	 3lYxfnv7xmZzkFB/z7fRf4qsY2Gp4oNsh9/dOvDZ/6dtm67N+qgPuHsscbslC77izq
	 eMykNJ0YxQ9eRZRYRZ003tbqofVZsPKro8XUxtE4uZ1nkqb93DFpSQWj70zU3qXNyX
	 V79yhGdX3LaTcvFCVUg+NC93DcPnp5M58M5UvmlxXmUlLV2nYRZz7pQ0AD6gdsd0rn
	 eJkFtKnjDxsZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45748C79F85;
	Sun,  6 Sep 2026 12:43:33 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 14:43:28 +0200
Subject: [PATCH] usb: typec: tipd: Zero-initialize CD321x partner
 descriptor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-tipd-partner-desc-v1-1-073559f142ff@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMPQ7CMAxA4atUnrHkRNCqXAUx5MeAGUJkB4RU9
 e5NYfyG9xYwVmGD87CA8kdMXqXDHQZIj1DujJK7wZMfaaYR4xGb1Iw1aCusmNkS0jS7U3B+ihS
 gp1X5Jt/f9nL9297xyantL1jXDXtL0+54AAAA
X-Change-ID: 20260906-b4-tipd-partner-desc-07915a127b0a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: asahi@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=F0fgm1i8HFGP9oMA1VAKRxErBO1BdcjfJnpab90e2YQ=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bc+E8/pjcv2yXwrrvGdsf2Ba8/Xj54wZLfxy5rzcdo7
 2n5bnzdHaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJlHQyMmzhWywm9kzqh+if
 dyG/J5hxFT7wWvQs8bSWFI/2qzcJb34y/NMLcxHTn3l/y89DSxS/buqbWWdfrcm+etXEn+umTdq
 nNp0BAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The typec_partner_desc struct isn't initialized and instead filled with
whatever values happen to be on the stack. We especially don't overwrite
the attach/detach callbacks. Just zero initialize it to make sure we don't
run into weird issues in the future.

Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
Signed-off-by: Sven Peter <sven@kernel.org>
---
I deliberately didn't cc stable@ since we can't even reach the path
that would try to run these callbacks on platforms where this is used.
Just noticed this while working on the USB4/Thunderbolt series for Apple
Silicon.
---
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 522f56742aa9..07d6d88e3a0e 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -841,7 +841,7 @@ static void cd321x_update_work(struct work_struct *work)
 
 	/* Set up partner if we were previously disconnected (or changed). */
 	if (!tps->partner) {
-		struct typec_partner_desc desc;
+		struct typec_partner_desc desc = { };
 
 		desc.usb_pd = is_pd;
 		desc.accessory = TYPEC_ACCESSORY_NONE; /* XXX: handle accessories */

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260906-b4-tipd-partner-desc-07915a127b0a

Best regards,
--  
Sven Peter <sven@kernel.org>



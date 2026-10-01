Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C55456DE6;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895081; cv=none; b=UpmQPtkS8n/7Cp1Zes9oFiy66FlTNw2A+O4ozrLWdzx2rYR6rKRskGpDIu8Gd/g/IW3sSQAAruUPjdT5t/XXc651/cX+d551Qi8Fcqs6dlhVm8xvQyKvu+KMISl1WVs1szO6hun3ffT4HcRoo89lGoQySXntiLdCKzR2HbiWBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895081; c=relaxed/simple;
	bh=1gqPDNarY5IwkcppncKoMUAil2o9jHv5HP0ubKeUxHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5NiqEo32LgwoFj9d+G0UqGj+9jCl7uE3w+3YGolfeksuYG4Di32K4EkiLWvgIQDmvEjvQq10iK0mbmtdoQb13IhThumviZltPocvftmz64QsfBfk1DKN09OFbdnXYb43+wrPLeDH9GGwfvAInVledbL2RiCvs022OlXIeN1u3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chcdNRzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chcdNRzL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C6AC4AF0B;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790895081;
	bh=1gqPDNarY5IwkcppncKoMUAil2o9jHv5HP0ubKeUxHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=chcdNRzLyTL/IccP0165V3hOgW/CAOMyNtB97DlaqXZSdSAsOzthfHw2E5WyIG2F+
	 qtbadJgVbg7eC6Efy9J2ausB/8HiJNCTATwTK8OFQmw9CuPel4/KweksPNSo8kNRzA
	 /oEXOfR7fp6R5RSDkoMo805qpHI3E5Si03cVMsfMKsCOUarpxAQWERZt+C63L5/EUe
	 ThRjTp7K6q61MCcAaTWYLsChKjgQa6KFxwm6582BRdv07lmkMTrat2nLNfiqBj2vQ+
	 1UOAlhDe90hOf6R0U5FmfOHLfn4JOizyPEUJzZI1b4aHrb6qrf+qvrr2nZVBIc1j9v
	 zjt8utkC/+58A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1FDCA5FCE;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Thu, 01 Oct 2026 22:51:13 +0000
Subject: [PATCH 1/3] usb: typec: tcpm: only call get_current_limit() for
 cc=Rp-def
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-max77759-icl-typec-v1-1-99ada1f65ced@google.com>
References: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
In-Reply-To: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790895080; l=1684;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=McNPTpZKO0TXWj67OGyGFn9ea4C0Lct3fPYqxSH5xyw=;
 b=4MsviocYxjRD1uhjleG6KxeIzsXmnqA8/HtnVK0BMhQa4UP4kF2EK6ZW1DFVTuQikbieqDP2y
 lHVyqfVTirqBCE7PPxGqej9biOF6qqqGxGvLrDm49zELeZ1KhKpdLOd
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

tcpm_get_current_limit() folds the default label into the
TYPEC_CC_RP_DEF case, so tcpc_dev::get_current_limit() is also called
for CC states that do not advertise Rp, such as TYPEC_CC_OPEN,
TYPEC_CC_RA and TYPEC_CC_RD. Its kerneldoc has always scoped it to
cc=Rp-def:

  @get_current_limit:
          Optional; called by the tcpm core when configured as a snk
          and cc=Rp-def. This allows the tcpm to provide a fallback
          current-limit detection method for the cc=Rp-def case.

A chip driver has nothing to interpret in the other states. Therefore,
split the cases and report 0 when CC is not an Rp.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2d6b14aa20856..2e7371ada8642 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1268,7 +1268,7 @@ static int tcpm_set_vconn(struct tcpm_port *port, bool enable)
 static u32 tcpm_get_current_limit(struct tcpm_port *port)
 {
 	enum typec_cc_status cc;
-	u32 limit;
+	u32 limit = 0;
 
 	cc = port->polarity ? port->cc2 : port->cc1;
 	switch (cc) {
@@ -1279,11 +1279,10 @@ static u32 tcpm_get_current_limit(struct tcpm_port *port)
 		limit = 3000;
 		break;
 	case TYPEC_CC_RP_DEF:
-	default:
 		if (port->tcpc->get_current_limit)
 			limit = port->tcpc->get_current_limit(port->tcpc);
-		else
-			limit = 0;
+		break;
+	default:
 		break;
 	}
 

-- 
2.56.0.rc1.315.gc6ed9934b7-goog



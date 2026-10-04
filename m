Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9743E1CED;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085273; cv=none; b=uZQdTj+3JgrkxR63nLM75LGRcLBhRlv2s5DEfNm+olm+0nT+PkEpfC+x2Z+wbMDHoILENCH99WgNl0vf383/J1/uyBiHzPupwjqFkImo3qSLgwNStqwvLBhkPTPih8c7Bll3ZL/dMjPo03TR7dlo9M21V5oiwaSFW3FSJAH6/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085273; c=relaxed/simple;
	bh=4Vzg2D6gcjEi2TA8J1Nn86vbNll3iI8MNeTMoOyIB04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwOu+47KXyuitJqx4LgmCCWF9U4VOECgDqmEaz2dHJye45mNeTKQBjRpKM+p7mRgOPdAgKJJIPv/ZAixYq0WMd/j6a3oWYEE4Sxx5Us7j4sOx/VFJLLSeeZT+XtRPR22BvY0unJoU5GYrjMCDuLk+tlRdQ3TP5Iz5YZnOmswLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5yTbHa+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5yTbHa+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28A8EC4AF60;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791085273;
	bh=4Vzg2D6gcjEi2TA8J1Nn86vbNll3iI8MNeTMoOyIB04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t5yTbHa+gqPMiGOmFqOgZbVJtkmrMlUXfxwbujynu0aUVDViyMmnwEKus2ZhaAbuY
	 4Qcm2yaYlBszIyLg2M0Suk29jFPYlJ9clUiRaB3isByBaos626459K1rTGvi8qPt+l
	 TtFoLwVXozI32WFkzUudCT8wtTCDTA7a5a82lkdZ9840QAi7maufw6spjPN+YMHBPt
	 tGKmlVuoVI23AfIadCHmOWSpUaKbUKzMy3Gw8pdJNSqNrm1+WoP9Ybv8IBTvxUIgrV
	 BGG6Sk4PYY2kp1sonSt4dWvW/PydJO4TMHqTSl/XICLdz3Hzy9wQ4/cwlGFlu2ZXbA
	 4pc9HxpeHPEnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACBDCA5FCE;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 04 Oct 2026 03:40:59 +0000
Subject: [PATCH v2 1/3] usb: typec: tcpm: only call get_current_limit() for
 cc=Rp-def
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-max77759-icl-typec-v2-1-866caf9e7d9a@google.com>
References: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
In-Reply-To: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791085272; l=1432;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=iK2/hBXzgdZn66DvzCM0XiHxb7RopJwYmn1QfE3FqAg=;
 b=jCeIo6z6e6DXKAzlFzNMbYQ3PEMtyJwH74RCYggxKFc/lx8+MMTmQDH9P1UYRvyup8BMfvqyG
 iWerQ/lR2EQBilvnLU7p40Nl1MYmTlgnv5N+Sb8hqaF+YxcMmr0hIuc
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
 drivers/usb/typec/tcpm/tcpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2d6b14aa2085..cb69d6a7ce5a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1279,12 +1279,14 @@ static u32 tcpm_get_current_limit(struct tcpm_port *port)
 		limit = 3000;
 		break;
 	case TYPEC_CC_RP_DEF:
-	default:
 		if (port->tcpc->get_current_limit)
 			limit = port->tcpc->get_current_limit(port->tcpc);
 		else
 			limit = 0;
 		break;
+	default:
+		limit = 0;
+		break;
 	}
 
 	return limit;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog



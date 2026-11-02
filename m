Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602031;
	b=ygZcwTXaf78cs75AfCRsvIFt6lU7yaXYTq4/+aAeJdrKqz610VPrrozyB2AbF0S6N8R4
	 BkSf7yiLMaTkBfxdvq8Wm/C9KL3fA2ZiG0WplRZb1C6bLKYxvazs6/MTTS+YxfkXOZQG4
	 kJQC5PpEG4IC/uD+yTcbTnZcBuCRJk/PgWx0xRHkcwJnl/1kLeE6b7Po0hk0TLWgHFWdq
	 jjiVH4yp2QCN5cy734MsEjwXJdnsWzdio9QeyHIFrYyKoTGNv0Rsen8cXefV9iFt5PHQH
	 0Aq5jGAqDDHDiCUX6S1DbrtX+mzpH6e495lxAHmT5DFAYuGuGKhgtMfXmRY0D+cdQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602031;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nkhheCwH9L+tBFyhGay7Do8wQju4PMsW+7y8pV5il6M=;
	b=5LtEy+30os5Cfn/MVIshvSfxS5KyERgE0YB354ZA208ZCnnaCPWdeFoecwHFqzWF8oeT
	 9DWPS0V2pR5qStWYDaIO5pFiXfjUWEBLr2AathBmVmO0VTdsUF/v2ynq6sr6iAa2owja+
	 yNwXR9/91LUe7i1VKGO3ftoV5K0ZrWnAk8qt6Uz5DGhmBHR5j5Y8RxPBH9bJkSCXTN9FN
	 J98F+Uf2BYPZl7S4R5U5STQO9VJfJyiDWf3a8fjQ1sW+mX+nE3GqXHU6UyAYYvPt0GrNP
	 ztrPGpigsVPvFrv7J/ub3vzE1e7qWyc1kK9vsjn6QVyvxz4HQAvtBcbABRkK0Mxs2Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXJY8ES7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E4606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXJY8ES7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AC21F01804;
	Mon,  2 Nov 2026 06:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602030;
	bh=nkhheCwH9L+tBFyhGay7Do8wQju4PMsW+7y8pV5il6M=;
	h=From:To:Cc:Subject:Date;
	b=MXJY8ES7gUSMSqhE1AbpYrMtXVwsh4cC3DFQNxc+Efi72XLezAXCqXCXFnlQJp9IG
	 IlqBs4ZoDzrAIABwevuNn8Az+TPQg8zUNUnRsHxtfu+jHPgDkHqO1mD/ws2CZLtwXP
	 exlpI0MTBErXVAiR/4Q/is1AgJ6JDjpPA4AAbkTen8vo57oMy1BaepUe9yceQKsRwa
	 oZxmn/Gd85MFkWnEXJ4i54kpv+7Z6tBiVE+90Nk+zW4iCMEmY7XLaFIlvNwxKi4H+y
	 4m9IV6BZ/maJMuaETyYndNoxuzCvnxQynl91UBW98CQL6/TXjYcbwzp0QAikwwJkRp
	 GzgzkDKIiDd3A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
Date: Mon,  2 Nov 2026 07:47:06 +0100
Message-ID: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
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

Both emails are bouncing like:
  Final-Recipient: rfc822; rjui@broadcom.com
  Action: failed
  Status: 5.1.3
  Diagnostic-Code: smtp; The email account that you tried to reach does
    not exist. Please try double-checking the recipient's email address
    for typos or unnecessary spaces.

According to Florian, it should be first.lastname@broadcom.com.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Scott Branden <scott.branden@broadcom.com>
Cc: Ray Jui <ray.jui@broadcom.com>
---
[v3] just resend, noone picked it up yet
[v2] fix emails instead of their removal
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04f465490612..88e010e78eb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5318,8 +5318,8 @@ F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Maintained
 T:	git https://github.com/broadcom/mach-bcm
@@ -5616,8 +5616,8 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
 BROADCOM IPROC ARM ARCHITECTURE
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -5654,7 +5654,7 @@ F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
 BROADCOM KONA GPIO DRIVER
-M:	Ray Jui <rjui@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
-- 
2.56.0


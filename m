Received: from seashell.cherry.relay.mailchannels.net (seashell.cherry.relay.mailchannels.net [23.83.223.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6203DB320
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366029; cv=none; b=QZnb4pEXoB1+A4slqH17YeCC4b15D0c92heQr1zGG6q7sUFZh3SB5NhOI6Oc0gfZj7Fy4B1JQipXCVK/L6/JOanJ/DQVsGuVunmceO9hpBvPs4jauMhptnFFgeKcd/Kc5Yl4R7FSnZ8SNC3IC1O+R5n8NR+gfEPrv/UNh+hrpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366029; c=relaxed/simple;
	bh=72hNAojP8hbrktQrLO0lap1jzX6R6Qo/yzeftON3utw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GrOmTmns7eb2Jfi1n5lSwdKJ5wwcxJb5SGCHuD/T8Wa45vnB8UToJkk64AS9vp0bPjwCQghWucdIEaQF7netKH+6sr8/eM2ksgOFXuyarD1SczDYbS3GXDCUZR0qkaiK3snM9mUtW/RBNWuSvKVPd3BnDloNGk8BrimOLG3bRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=Pj93fdN5; arc=none smtp.client-ip=23.83.223.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="Pj93fdN5"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 170BE7A1EFD;
	Sun, 18 Oct 2026 23:20:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a253.dreamhost.com (100-96-21-213.trex-nlb.outbound.svc.cluster.local [100.96.21.213])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A229D7A1E4F;
	Sun, 18 Oct 2026 23:20:34 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Stop-Grain: 1d82831b35bc6619_1792365638878_2061766694
X-MC-Loop-Signature: 1792365638878:2130402678
X-MC-Ingress-Time: 1792365638878
Received: from pdx1-sub0-mail-a253.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.21.213 (trex/8.0.2);
	Sun, 18 Oct 2026 23:20:38 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [172.56.178.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a253.dreamhost.com (Postfix) with ESMTPSA id 4j7F5s64Z4z102n;
	Sun, 18 Oct 2026 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792365634;
	bh=iGssDkMKOkDMTgnof+Jz7YdazPxwR7tkZNErXSOjf30=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=Pj93fdN5Ir+nGDRabem5WsfnB0/umQvhqMnSNnvkEopc3QSMfqekFIuuxFXzCRqu5
	 95r4rwgVVYHzsz1u8qD6O87L+/Uq0arHiXhWc7i7bYcQyfd9VcGwuH75Azu+XZUVni
	 ETHsruXPrfGsBHqolFd9WkgC9xm81erIzzWATKparshB3o0dHAvJkmTabjOVw3QmhA
	 46zIZurVYdc/gZdQifRwQjOPC+PA7t8gRLR+OkrX2Ua+TDO1lrkhwir+enBrDNkRNv
	 CBMiFUcC3MVhdqymqjVmKy+zwdxHsRFsJfjyB+6ijLW2XQC/8n7hwZNxa/vfweh+cK
	 f9MuK9fB0/knw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: Remove unused REG_AMOSWAP_AQ
Date: Sun, 18 Oct 2026 16:20:16 -0700
Message-Id: <20261018232016.1771835-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its only user was the shadow_stack lock in handle_kernel_stack_overflow,
which commit be97d0db5f44 ("riscv: VMAP_STACK overflow detection
thread-safe") removed along with shadow_stack itself.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/asm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index b8bf842d4c13..80287b3f68f1 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -29,7 +29,6 @@
 #define REG_L		__REG_SEL(ld, lw)
 #define REG_S		__REG_SEL(sd, sw)
 #define REG_SC		__REG_SEL(sc.d, sc.w)
-#define REG_AMOSWAP_AQ	__REG_SEL(amoswap.d.aq, amoswap.w.aq)
 #define REG_ASM		__REG_SEL(.dword, .word)
 #define SZREG		__REG_SEL(8, 4)
 #define LGREG		__REG_SEL(3, 2)
-- 
2.39.5


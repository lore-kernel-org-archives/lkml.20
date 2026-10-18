Received: from giraffe.ash.relay.mailchannels.net (giraffe.ash.relay.mailchannels.net [23.83.222.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90938F639
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.222.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365477; cv=none; b=fxngKk0dFNp9rdwNb1yFl7Zb+74/ClRhS0bNatuUq1Bdhoih7VihxFVq3jWLZ/ERQ50pwZwzooZuy9eLxVtdCM18tzGOSVfXVEFV4nRayszNcpqwOTMLBIyGKSAyTn3S9p837zdfoHFaucS6cIw4blylO5Hyh63RdcA4nCEbcu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365477; c=relaxed/simple;
	bh=Zrhk6L+yA+nfxS08hMuRUtSSqS+SLKAeqb3lj45wbJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XX3ehiQ5Y5AoyaTiJuLD84sNImm1tZg0ZTjygCCbbGAQzRJIeeV4eBrUfBPr9y1fJ+DrEdkH7lHgzrGaOh3eOEFPtBYcVjkKo4QCxljHs1prkfYERso4CnDkOS/3YwaG4v4RIA1X5d8ZGpilomoR4/UQd+kuxcwXvpXgFEJi6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=X+xHex6o; arc=none smtp.client-ip=23.83.222.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="X+xHex6o"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D4CC44C17FF;
	Sun, 18 Oct 2026 23:17:48 +0000 (UTC)
Received: from pdx1-sub0-mail-a253.dreamhost.com (100-96-8-137.trex-nlb.outbound.svc.cluster.local [100.96.8.137])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 703D64C0FF5;
	Sun, 18 Oct 2026 23:17:46 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Average-Bottle: 4eeea253467d22e0_1792365468709_783431510
X-MC-Loop-Signature: 1792365468709:4135546109
X-MC-Ingress-Time: 1792365468709
Received: from pdx1-sub0-mail-a253.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.8.137 (trex/8.0.2);
	Sun, 18 Oct 2026 23:17:48 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [172.56.178.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a253.dreamhost.com (Postfix) with ESMTPSA id 4j7F2d4pyHz1044;
	Sun, 18 Oct 2026 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792365466;
	bh=nX42rawjGZS9uhRXyyy2xQVWTYF1zQD/dRyD2IOTcAg=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=X+xHex6oMrORNOUXARQhlKJGbN6kWM7Eieol2jajImP/J9e5Gu+/5x4cekat7Vopz
	 MWDNlwIXimCjJx+5nCEVU6TWkU4b2UXKkgFvgLUl52po56vzLhGKrGGBhZWYzi++pq
	 uadxa/BUFRO7HQZmkSVNKhKtddMX5bQJepAfjg1bM74Ew/uKTfmxgNMgQZVuHAEqt/
	 K63pgwbYnDF4eCAFpqeK9kdxcTrLoFDtemYJewztkniKusErfLlumlNgpiPQPA/Dx0
	 hEHh2kd5mPi36LZi+v2vMEYWFdR7UgR5cd6/L1mSLiWBUW/0P1XNgNgrio75Rxgnkg
	 k/fQAz0rOkgSQ==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: atomic: Drop stray semicolon from __atomic_release_fence()
Date: Sun, 18 Oct 2026 16:17:39 -0700
Message-Id: <20261018231739.1770964-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... correct this.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac5..c6f05ffe0cf0 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -22,7 +22,7 @@
 	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
 
 #define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory")
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
-- 
2.39.5


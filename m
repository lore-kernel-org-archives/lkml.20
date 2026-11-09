Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251645;
	b=P0ugtvNch7YjXkZHmOOOZfslOVlTyLTipJ5faOuXUPOcvfLQhH/vxEzNQ+4lRBT7Eq80
	 tzZwZ/hmYSfzv+Xv1ryNasfsZn4uNhdBHm8t3S/IeyOlfLBJSd4W5nIwnRxKD6HC9HIHj
	 yERiCvqqHUR47eHFsnvTnyBBAHVT/ff9YJCu93GV7dsuII1EzyRkSMcSUt8g31RqDW/iP
	 yYRPlTAS6jlXfQ9DYau2wZEkL1SdfqeWsimUR8qScfs4rLkV7ONQT1INhDEqxhKx2FQKr
	 1ijhNcs/Fh132sHqyk9DtSkef4WVHsId2bemAGq9ABJUY7mh169QLIiw9xuqYirKBNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=yZaJbqiWzu1BnyVRQfTEsVwAWHw9OV81Ev5Wde18Goc=;
	b=oQdY6pInQoLh0jPIAaJJQ1l3mLrwfhEBvx9/O2pBIDn7eBWGQZy35OmHayUTgqltBv63
	 eeT7XreeTM6gbG9yZiBe/H2CcXC6uiWBEdJN9Hh3OLLoHgifjlFS4xl6MKho036jyFjnh
	 WR25WzIryT3e2hxaOxj5rRy/HT2dG7I+biwt9pfTT/imJgwAcmEX1RpM517yNG7W1zQLa
	 gDxH8XSt/uYqzi/hEB12GiZfH45V9UGB7tizD170QwltdbzSRMUPiVeYnDZqlMSllMAxO
	 slwrRMDFDKMydkGTNA19oihZZrT7Ir+0ccm5AhYaICPGfhe9Vqy/3150wXfnqd3GmuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FPHrKalg;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418660A2601
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2418660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FPHrKalg
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbJ5SNDz1XLyht;
	Mon,  9 Nov 2026 19:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251641; x=1796843642; bh=yZaJb
	qiWzu1BnyVRQfTEsVwAWHw9OV81Ev5Wde18Goc=; b=FPHrKalgZc60DBHZ038eU
	/MBxS6xI28VkVIULd6ieBAj1ttwa6cbXenC4VzFbyq4jVoo7JfwroDdDVk9qvCzZ
	AbBvDbf59JFAjg27w5LlnfLG62ZR2l+6x5w2/8nOucRZHtxmVMV0hy/wF3q3UgpD
	tlno0Ce+anM3FaP1SL5fjsq4c+Yb/dNiGlb6R4STwmbG5Bsu+TodrzonUXpoHYSa
	8YRUF+UoWVWKFmQ6al7x987O5gkd8Vx3O2/ES+b3iwKtr8v/rbWKdXs2YEgLCicR
	V/S4bt4tduIvWn+MoHu12xKaFogjyiV6VhwxJVUEticfM07ZbklxRV8wQTJp+z8T
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DOE2m6qlZ3VF; Mon,  9 Nov 2026 19:14:01 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbD56cXz1XM5kD;
	Mon,  9 Nov 2026 19:14:00 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 07/14] nvme-fabrics: Annotate nvmf_lookup_transport() with __must_hold_shared()
Date: Mon,  9 Nov 2026 11:13:15 -0800
Message-ID: <c21596c7f210678042fa95435ff56380cb2794f9.1794250850.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <cover.1794250850.git.bvanassche@acm.org>
References: <cover.1794250850.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Annotate nvmf_lookup_transport() with
__must_hold_shared(&nvmf_transports_rwsem).

nvmf_lookup_transport() reads nvmf_transports while holding
nvmf_transports_rwsem for reading. Currently,
lockdep_assert_held(&nvmf_transports_rwsem) implicitly assumes lock
ownership for Clang context analysis. Prepare for removing the context
assumption from lockdep_assert_held() by explicitly annotating
nvmf_lookup_transport() with __must_hold_shared() to declare that
callers must hold nvmf_transports_rwsem in shared mode.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/nvme/host/fabrics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 3d7ad86c1955..d3d00adedd14 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -644,6 +644,7 @@ EXPORT_SYMBOL_GPL(nvmf_unregister_transport);
=20
 static struct nvmf_transport_ops *nvmf_lookup_transport(
 		struct nvmf_ctrl_options *opts)
+	__must_hold_shared(&nvmf_transports_rwsem)
 {
 	struct nvmf_transport_ops *ops;
=20

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655328;
	b=kn205hNSRECKp5PY+nacPs1M79qyLEp5SA81NVrChTJYvp3mZ/3fBl3rVTvOZlEryCjR
	 UG44BGTuNi9Xx+h1SO0QdCMsG/WfhJBnB1yg7MaQ83zQCEkUEqRUWuCub2n8yFzxlYsXW
	 FPSTFUnt4xoEyHGt+dFh68/PRr36ocuN0NaKiLsXcPM4jD4jkB+qWyN99rfpPN1RuBqOU
	 u4KfCzJ/wJ5iU1IZOjxqjTaiIarCw1CicZu3tROuVPXrhlu8/EYcP9X+ZRm203LPYhYnP
	 FwvIrDum9/ieT1KHYEMXr5mUHjcdI1smYaHwaFy1m1m6tNRumBZbWY3XqlXAMbkTFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=yZaJbqiWzu1BnyVRQfTEsVwAWHw9OV81Ev5Wde18Goc=;
	b=n4d/U+PPOm3COEWdzAF0PsO2rINQzz4MOE9N8LOiYWtusW6wnjTnshAHDX/kYwuxrhhZ
	 /05AtBF938rcLxYWqKQ3RgPBsVJwsqc+EUw4SHXzZ95s80K7Yu+hzByLKCSebj9m/AAUT
	 Lu1kmT0Ja+uJhc8wyQLp0hcyQURfH9Xyb0ili6Rvkf7P7O8Dbph6qLAjCabOF/swQ8PgD
	 OPeB/Qz9Ui0t8oLuQr+LIViNM0zPhSYq8m0kXwvhNcrGibr2l+uPw4W3so0iKl+pNFp+G
	 mKle5Uc0nfTBAlve6DNAYvC/9WiWqt/lXbmcsYrmqiClYO55ZMdrtfP9t8DYYDQmQvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=UTkSxoEI;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BA606EE88
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F16BA606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=UTkSxoEI
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3g443vz1XLkpm;
	Mon,  2 Nov 2026 21:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655324; x=1796247325; bh=yZaJb
	qiWzu1BnyVRQfTEsVwAWHw9OV81Ev5Wde18Goc=; b=UTkSxoEI8P2FDBV8PueNj
	nbVPK3g+NwZaY+IC8WrSGADmQCacjHoBdif8fIHc0iPNwUEyYao8kjdVSAB3Otvg
	rmThzfGtWcqLMX7IsQ+zOkPa77q/JNoBDaCC81o/3WRJ2qpL2F4SmzfBucVAQJ82
	z9cOW03Ibj3VtLkGUzKGf2NnAUX/UZneVa0Oc6/Z7F5OZub92Q2AcnDlrvPnTpJQ
	1qgFBOC+Nb9oc4wGcFlYkBDZSvJTsvxbZoVJabu+xRfT/d0OMy5X/Td8Bf/qARMp
	NhtHNx6PLsmhv0SMbsExY/uvHbGpxZb6Em7x84EkaWWAPBJ4e9FtqGlahDt/+5fu
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id b6c-fG7HP5k4; Mon,  2 Nov 2026 21:35:24 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3Z5BFFz1XLksY;
	Mon,  2 Nov 2026 21:35:22 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 07/14] nvme-fabrics: Annotate nvmf_lookup_transport() with __must_hold_shared()
Date: Mon,  2 Nov 2026 13:34:37 -0800
Message-ID: <f7be25530c5ddb30da2f13638a35e2daa8002c0c.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
References: <cover.1793654853.git.bvanassche@acm.org>
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

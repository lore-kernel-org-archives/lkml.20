Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759626;
	b=YjdZEnyhH2RAaRYG3fPSnyuSqXjVJ/SJ33r67YadaBXRkAhsRj0YeqNDq8ta4uIagSgV
	 pbcD6iptxMz3UlwdC8+gY3WPhFoYHyYEVS3qNb07szJW48nIi6lpT7G0RxZzM83uutZra
	 wtyGggg4EFVgv30ahV/tGbtG2KK7veSlO4OfkHg5mD1an76yWpA7aFnq4nehTaLOTnHLu
	 LQWuVS2c/+uiXKgDCZnW4sIVLIPEdndXHjItO+plWPzLKNP4VenHd24LryMmesX7kJTWF
	 eNC8BxjGLI66OcQ/4mG4EbjCrL6aE1JDpIBPWI4LthujDZez0ljPf+bwkEB8Pw+iUaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759626;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=C93F15dXYgg+A5lW50QDJhX5ONKlj8WJyTaRPVwgx90=;
	b=wdcODQ4FFn0WkjSA7XgxYyM5LkwPY3Xp9nl80pH3YkhZlK7kTinA+lzaEScN7fwDMcZ2
	 RY18meKZYTPQJi3SN4W+UTI3j+5XO8+gjstA0rYGajKSEpVfyXFriTfzGeyaSKs0gYC0O
	 2NvU5LBersk/FWwxfSmaR1xWWPQ91Gd2INXkz3gtCeilNhY8SlJ22hqlVp5RBrlF6CteD
	 xCRijJz96XlPnqo+YJYWTk3cpKbhmO+Yo7inTOoXIDwWaXpRCpu2wphjUFLAE/jJjtEWD
	 YOnbTPqLuv/BpXqoPXFiN9EuXnBu0zUzzHxd9gihkqz3tKiwSfbIXMhxGxC6OnlKueA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=N2p90eA+;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E53606A326;
	Wed,  4 Nov 2026 02:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=N2p90eA+
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5367d0737;
	Wed, 4 Nov 2026 10:33:36 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: drxd: Fix potential firmware copy leak on release
Date: Wed,  4 Nov 2026 10:33:35 +0800
Message-ID: <20261104-db9e3c75b3-media-drxd-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1a4679c0c03a1kunmf01a1af116369e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHx8eVhoaHU8YT04fTBhMH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	1DVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=N2p90eA+8M2KPkafsbZLGJCqN9e7xuCvep7SzcO41KLlxG+NgGELv7CndUw+zB4oMsktEXoRRlbn3AVdLOWLfQ7zVxxvXXrUwe1XrR050yIhV9e6qe6v93qEK0AEjjZnJZZ0A6pD60qYdMJEp5uEEJvY0xjz+5gDOh66CXSyzHs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=C93F15dXYgg+A5lW50QDJhX5ONKlj8WJyTaRPVwgx90=;
	h=date:mime-version:subject:message-id:from;

load_firmware() copies the firmware into a separately allocated
buffer. drxd_release() only frees the frontend state, losing the
pointer to this copy. Free the microcode before freeing the state.

This issue was found by our static analysis tool under development.

Fixes: 8f19f27e3e0e ("[media] drxd: move firmware to binary blob")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 GCC W=1, using defconfig
with the driver dependencies enabled. No hardware/kernel runtime test or full linked-kernel
build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 drivers/media/dvb-frontends/drxd_hard.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 4d673a108f61..a9e3e43c5b43 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -2870,6 +2870,7 @@ static void drxd_release(struct dvb_frontend *fe)
 {
 	struct drxd_state *state = fe->demodulator_priv;
 
+	kfree(state->microcode);
 	kfree(state);
 }
 

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

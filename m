Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122821;
	b=5N1kGh0R8NDQTLmifHw33jiW987lA24bXYfrDaqt/qeyevpxZZn0YtvIVn6tu7ghWaae
	 YKRGwfqiPG2gED1pXrGp6WqaBco8S1AcLYrj6Si22OkPhDvA5WmOTBOUp22qeUL7YI5PQ
	 U80NrvFqvS4r8IR/hY5X1PEP25cyQ26MCiakmhSvgwByu0pRKeGkEJB/cQoE+IodrsTsl
	 Pv1J0RpqEK2iuSCjjvHlbD9KwaUcLqMgcGquNV9dTeLrnxJjQzGNsQmXvJCGc1TQZcHvA
	 SmXW/M+ZNK9BGJZMpbn/vuLhn6rSSH/eKEwp5FCh3AgZ7ocI1JiABLWOyy7CD/+RuyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122821;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Co4uS0oaq+dGkYZsO6YucjUClFdzoKosdUQvmkQf2P8=;
	b=g8fNOxgWAD8RrLGHXyPW21qgddEEA6CSZN382YQMefddBxL2fVh5PZjjm7s9y24uRsUZ
	 cuMAg/OggyLLgp9A62OOfB5bm/NzdmLo7SNLkmml2/OziqF9dyqRmZni3XsBPfcdy+YJN
	 bVGWU4ReypYXxnLXNLYk2ydeC9CCnxyxyjC6WPI1eA0bGmtSMxYPgW+3FY1uX6gP3h7sI
	 ynqS8IL1U8xLXXiuyzdDFtiy/AdpVj0zXGV9BYqEyMtH4mKleqr7GGiFQgJjAxCKiiXIR
	 lnfr37aqRDgnw1IXHp8ennZiXobPLNznRtFYfU/AVAtJI+1yOlr8KfzYncPHFdaNiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YvrKIEIA;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2711606A31A;
	Tue, 27 Oct 2026 17:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2711606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YvrKIEIA
Received: from pb-laptop.local (185.221.143.99.nat.pool.zt.hu [185.221.143.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B0D44BB;
	Tue, 27 Oct 2026 18:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793122686;
	bh=TB3BA3rMh2UG+iRzpT4eyAl5X1c+8JakRBmUU+aJteo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YvrKIEIAIk9oQfLxRY6zZflqSV6ZCE8b6aO2anjScz6k+Pmdyk8qRMOBren4+LAoX
	 2OZEm6WJjFrDS0YS9smQ2eVg9sbFw5OLc4LlIsD52GseYnwLiQOic9WWje2m8q2xPK
	 xsGzfEOAGqPEMPu0MpRfJRI1C3EFd3uXTF6Z4x18=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v2 2/2] media: rppx1: Update shadowed registers
Date: Tue, 27 Oct 2026 18:40:14 +0100
Message-ID: <20261027174014.315061-2-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>
References: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Certain registers are shadowed and changes to those must be explicly
applied. Updating the shadowed registers after a frame is complete can
be done by writing `RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD` to the
`RPPX1_RPP_HDR_UPD_REG` register.

This is already done in `rppx1_start()`, but this auto-update feature
is documented as "self reset at picture end". Therefore setting it
at start will only auto-update the registers once, after the first
frame.

For example, this causes that the LSC module cannot be toggled after
the first frame. This behaviour can be tested by reading the first
bit of `LSC_STATUS_REG`, which will show the same value after the
first frame regardless of what was last written to `LSC_CTRL_REG`.

Fix this by unconditionall triggering an auto-update when a parameter
buffer is processed in `rppx1_params()`.

Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---
 drivers/media/platform/dreamchip/rppx1/rpp_params.c | 3 +++
 drivers/media/platform/dreamchip/rppx1/rppx1.c      | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a75a27a8afd09..cbc9847ba5be6 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -110,6 +110,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		}
 	}
 
+	/* Trigger update of shadowed registers after frame is done. */
+	write(priv, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rppx1_params);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
index c03dd061783a5..a3c923a57d922 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
@@ -257,9 +257,6 @@ int rppx1_start(struct rppx1 *rpp,
 	/* Immediate commit update for shadows. */
 	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
 
-	/* Then for operation update shadows with picture synchronization. */
-	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
-
 	/* Clear any pending interrupts. */
 	rppx1_interrupt(rpp, NULL);
 
-- 
2.56.0


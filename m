Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471814;
	b=B+Q7Qy53vVIA+hl/dE5RZpYnE+V2adEVUFsD4j10QUCk8y52YVezSX6vvNe/jNlCnRjB
	 Pe3bJOOVXVyWHOfurrOOoFrjACJNgeqNefunzVDGqUsG0k5aQW6GmjMk/8Vx480+aFHy3
	 sx+WfMVGBL/0pzNTGHlkrUd1fHX6Lqsxu0mjmWg6ejD1oI/swZ485H/6BbtLQMWPFVyZn
	 Ad4YsLOKVnN+uBElkgg5KbaSnISKj9DY4tiaUOnmtruJmselS1ekjSPfMen9eEIV4Nhbo
	 6qz3DcTHVhOoVjNwoubQvRVUZz+Ppgv7HepRtJhnHInUcnfmBHO1JgW/v1uJXX8j06g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qKYjBYnR5WGa5NCIh6j5J0rCxP117RMta7GUqAqVAXA=;
	b=WqZNmvXj1/EGT5dbbfMGSQWZw78DrGjZG3tWMUbQqEnjRAx30BSy40Cu5YzGeHGG6O9F
	 f6Oa/IjWX9/kWpMSPLISBw2gQWkzix0R9T1cz1kakJlwiGEefval9hrhdb/sL6z/z3Lwp
	 3uH196Tvr1dtAJPt7BvSr1d73qMfxqW+c4RTW74rB0P824GaFGDO6YEnWHK2omPtehsa+
	 meXQIBKxiULE24Rl1a/RXo15Vo95u4uWp38dA1EhNWcQVQwAZcG09dGkrXItES6mljWaw
	 mY8T+i2iLd3EPxv+FeU2UXS8uVrh4L+ymShd5xKiRnzW0aso5UeO9ExbV+lgcUpTo+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XU5tzQTW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AAC606A327;
	Thu, 12 Nov 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XU5tzQTW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471814;
	b=1e2vDISgZGwm4TgjZ2t+Lr0muW3unKhckD0ZUyExOvsbE1c2cGVgonqCCz95KmgBRSfU
	 ECX23hnppeKl6IuEi1gRBH3QTA1Zt/I1Kqc6wiEXdscfOpn53fUHykzAgrb5CqSii05rA
	 2U41IUIr4uS3otNDRF5g3A6oqQfSmYleu6Zwwu81ebhaTKHJJqK7PqVbBDctuHLnNbV9Y
	 Pb2nEhW4U6e2eIiI2lgZn5/it/vMZ0khAUmtnO9vRscanlvMlGU64TAgFD+l4KNf8NcYX
	 29zIS094VLHojCRYWlkBRqFbTy9Xyt06hAEosVK/Ds0T3t6QZvXSbo10B8pWU/+GlPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qKYjBYnR5WGa5NCIh6j5J0rCxP117RMta7GUqAqVAXA=;
	b=EXn12fEFNp+Wj9i0CuZmq+rPNQWGlfjNvNhVeMzhjf8XIrWlzpFyXifleWUQR5K0VmSz
	 AHmhU3adXN4km0qRqV0g7IiVS4sRIIKRjj0Z52FcBO1CoaFlIsoKCadWBiSV/PWj6jwsJ
	 iBUXnpk9X/ZDNnOABTyjBtswd/Fe7APXi7lxaQk8rVl9amgaAHb8SsFlXzHqJSZBk/HQs
	 472FO+cuR/KCHZNWjelg+hw/pi3QecXf65OJ4+6j2gS33Aj0WotQ0hC4fXHgOZIDiIysT
	 Lxejx0oZYi3ZLZBKRupXFifhzSKIqpGw3kjgAnTGzYHy5FBxb8gXRO69+cTd4fOAnew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 649661F00AC8;
	Thu, 12 Nov 2026 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471814;
	bh=qKYjBYnR5WGa5NCIh6j5J0rCxP117RMta7GUqAqVAXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XU5tzQTWCT4XiZ6Y2N6PKN1MlXwoot/4gcxImIf4zxM0NcspUo8Bx3fLjVrPfFCbf
	 2RaQ/PYsWWLVok6qt0YUDEHMqZHclsnCZ05bIzYIPQODArvxgQfd7nwh/WpqPhU5m7
	 0bAqwK+dTRSrGrbun9h8SAxoEHiMFCq9xB7Q/Uv7EqE3nWhW9XVYlc4TrCf1tDrvoO
	 JwNO5HJ77m9PEsMf4iuu8a2g3ylMeC4NduZqpH5p2JzNOVqFIq9UMJx9Rt9tN6Ctgl
	 FZkjxne+6RzYd0Ls9Pho8bwN1oiR5OATIEolj7IJHd+x2oVY99NpSfq2U70RTJdfBJ
	 PBft74pJJWo2w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EC45E49361;
	Thu, 12 Nov 2026 08:23:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:23:34 +0000
Subject: [PATCH v2 2/2] usb: typec: fusb302: Toggle with the default Rp
 current
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>
References: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
In-Reply-To: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471812; l=3585;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=tD7FYH82nlIArIvaQxvwuexRhWGTOTfnEzwgYwR8d8U=;
 b=spjM5HPPpWe+lrfW7WRU681uie2NR8dc4+wxVo2n+3xwGB6vSqQ1bU1/Os7tSe3znFz4XI8W2
 2ONr7RyGZJ1CXPtw6TxihfctXruTMpLrgQehwYMr6XuEBm3iocDr10+
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

tcpm_start_toggling() programs the Rp current that tcpm asks for, which
is the current of the source PDO (Rp 3.0A on boards that can source
3A) when the port starts toggling from Unattached.SRC, and the default
current when it starts from Unattached.SNK after a detach.

A Genesys Logic based USB-C to DisplayPort cable connected to the
Orange Pi 5 is often not detected after a warm reboot: the FUSB302
toggle state machine raises no interrupt with it while it drives the
high Rp current, but finds it within seconds once toggling restarts
with the default current after another device was detached.

Toggle with the default current, and switch to the requested one when
toggling stops on a sink, before tcpm is told about the attach, so the
sink sees the configured level from the start of the connection as
before. tcpm does not set it again after attach on every path (not on
ports without PD, for instance). The Rd detection threshold used for
unplug detection follows the restored current.

The FUSB302B datasheet sets the toggle up the same way: under "Toggle
Functionality" the processor writes HOST_CUR for the default current
before it sets TOGGLE, and a HOST_CUR change after attach is applied to
the CC line immediately ("HOST_CUR Changed After Attach").

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..44aa05fd4ba2 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -97,6 +97,7 @@ struct fusb302_chip {
 	/* chip status */
 	enum toggling_mode toggling_mode;
 	enum src_current_status src_current_status;
+	enum src_current_status toggling_src_current;
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
@@ -942,10 +943,19 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 	}
 
 	mutex_lock(&chip->lock);
-	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
+	/*
+	 * Look for a partner with the default USB current advertisement.
+	 * Some sinks (seen with a Genesys Logic based USB-C to DisplayPort
+	 * cable) present an Rd that the FUSB302 toggle state machine does
+	 * not detect while it drives the high (3.0 A) Rp current, so they
+	 * are only found when toggling starts from the sink side. The
+	 * requested current is restored when toggling finds a sink.
+	 */
+	chip->toggling_src_current = cc_src_current[cc];
+	ret = fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
 	if (ret < 0) {
 		fusb302_log(chip, "unable to set src current %s, ret=%d",
-			    typec_cc_status_name[cc], ret);
+			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
 		goto done;
 	}
 	ret = fusb302_set_toggling(chip, mode);
@@ -1357,6 +1367,13 @@ static int fusb302_handle_togdone_src(struct fusb302_chip *chip,
 			    typec_cc_status_name[cc2]);
 		return fusb302_set_toggling(chip, toggling_mode);
 	}
+	/* advertise the requested Rp current now that a sink is attached */
+	ret = fusb302_set_src_current(chip, chip->toggling_src_current);
+	if (ret < 0) {
+		fusb302_log(chip, "cannot set src current, ret=%d", ret);
+		return ret;
+	}
+	rd_mda = rd_mda_value[chip->src_current_status];
 	/* set polarity and pull_up, pull_down */
 	ret = fusb302_set_cc_polarity_and_pull(chip, cc_polarity, true, false);
 	if (ret < 0) {

-- 
2.55.0



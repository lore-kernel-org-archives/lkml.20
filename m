Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net [160.92.124.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45884AE13F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212244; cv=none; b=hF4rH1aqSqsmwFlLa4flfePMQq4JjkUAcSfxD+qwHVIASdCu8nFDG5Qg7lMdI5drdlKoNA9MLx3m/Y/Cnrm2fTekk/pee+4IP27eeqPz495LujxjsaPRBlmn/R1sLhpNRrcUjOEABK1GKEPKOM9mGn7HyGFTRv+ux/2v/Z1IgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212244; c=relaxed/simple;
	bh=szB7F3YLrVD//tRBzxkIElu+baYA89HuD69TWFldQjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DM2UwEqPUh9jgEOK6c++MeX0gmjS/sRNxfPEaRw+DTzOTAFepb/SP4PekXUUfyHBIxaeG/zRo8YN+Co7aAmivhS8Qc9HuekQvEq4j76cHdacNmgaK2rpHJvOxpWyC6Al33slpZX+z0lTyLfWFtAOpeu1hztOki2JNJTzMcxTFjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=HEYUsSM1; arc=none smtp.client-ip=160.92.124.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="HEYUsSM1"
X-mail-filterd: {"version":"1.9.7","queueID":"4hyztJ1xgRz14K0Y","contextId":
 "7e68ef25-5f83-4a8e-ab04-f578f50ba642"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0109.laposte.net (SMTP Server) with ESMTP id 4hyztJ1xgRz14K0Y;
	Mon,  5 Oct 2026 14:56:56 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hyztJ01dQz14K0V","contextId":
 "7560e1f7-a970-4eed-93da-e332476f2fa3"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from PAR-95296130.bcg.com (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0109.laposte.net (SMTP Server) with ESMTPSA id 4hyztJ01dQz14K0V;
	Mon,  5 Oct 2026 14:56:55 +0200 (CEST)
From: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Subject: [PATCH] usb: typec: displayport: defer instead of failing when the port is not DFP
Date: Mon,  5 Oct 2026 14:56:45 +0200
Message-ID: <20261005125645.17899-1-jean-francois.bobier@laposte.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791212236; bh=szB7F3YLrVD//tRBzxkIElu+baYA89HuD69TWFldQjQ=; h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding; b=HEYUsSM12x+uNffGYuV0rqdcDkwuWdKQ+LblZR4HrtD4KfEas3m03jnwp7vokCxQiIDhKgQdvGqzHe1+KkMszqN39xj3K/T+bUAcNiFkL+fV9Q4KugR1qqMbqX9z2VvjyehsJ931jXBcTIm/u8uKAI2uDZJhTKMtzJfd/DGxeBEyCEr3+xUlSlw8GDaVpGYEtLytCvTBw4n7Oru8E0hOn64T4TNA38E5PRmPRasClRCA3767vUK0TfB7P0J93btn8T+3JK5S0LZsB2RHrMnen7nim5AiV17T6gTyszCbvrXfZqWx34ofeIckVuHJ9XkCrTEckGXwXVaSaIhXRddnEQ==;

dp_altmode_probe() rejects a port that is not yet TYPEC_HOST with
-EPROTO. That is a permanent failure: the altmode device stays bound to
nothing and the driver core never retries it.

The role is not stable at that point. With a dock, the partner's
alternate modes are registered while the port is still UFP and the
data-role swap happens afterwards, so whether DisplayPort comes up at
all depends on the altmode happening to be registered a second time
after the swap. On the OnePlus 8T this made DP-over-USB-C work on some
attaches and not others, with "dp_altmode: probe ... failed with error
-71" as the only clue.

Return -EPROBE_DEFER so the core retries once the role settles.

Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
---
 drivers/usb/typec/altmodes/displayport.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
index 51c92dd88..d84785309 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -766,9 +766,19 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	struct dp_altmode *dp;
 	u32 cap =3D DP_CAP_CAPABILITY(alt->vdo);
=20
-	/* Port can only be DFP_U. */
+	/*
+	 * Port can only be DFP_U.
+	 *
+	 * Defer rather than reject: on a dock the partner registers its
+	 * altmodes while the port is still UFP, so a hard -EPROTO here drops
+	 * the DisplayPort altmode permanently and nothing retries it --
+	 * binding then depends on the altmode happening to be re-registered
+	 * after the data-role swap. -EPROBE_DEFER makes the driver core retry
+	 * once the role settles, which is deterministic and stops logging a
+	 * failure for an ordinary ordering race.
+	 */
 	if (typec_altmode_get_data_role(alt) !=3D TYPEC_HOST)
-		return -EPROTO;
+		return -EPROBE_DEFER;
=20
 	/* Make sure we have compatible pin configurations */
 	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
--=20
2.55.0


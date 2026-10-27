Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118683;
	b=L76iQdm7vIzzxzCX2sv6lKYm4i66jHckGIMaFE2QCqbEXfp1jJonPaYtdvr30D3r3lhN
	 ZEd4VV+Q5TpVmmIM30GOZwX4G5fiXBULOe5DwrYSGYqWuOTZoKIL4qt99AlaIY+ycsrZB
	 zW24j3FvwsO0hTtZ3v2HhgKCxaW+TaL5pmmafZfLFlSPa5gBbRsENzEEnN0SVm405UHWP
	 vyk0+gUAXKtrXbEjc0iFJm3pPLy0Ir+L6pInjFqZmVSkIkpJRlEADQqF26+vaVuesjohc
	 5TS69oHBbE5GmofUYbHFUIszMSwn9BKeFoB3SaaVdnsufNaKysU+9krd1CgDXGzNdLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118683;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=WRlQjLqSSanzAjPiuI4qEjre7T3Pirwo0dI+Zxx/i/k=;
	b=yHnnhWHtfXnxcf8k8Dovmu5kox5lHXjxSGC0nHcetVIXBqLolzEVX6ILHx//+zhFNYIu
	 Q4/iGYWhltWCGBflhsTzsbQy8EJflZMmSPgDhu8SVli8mwj5+iLRz7q705p7WhAviFR56
	 mzSrvViQSa34OE+MBg+OOLYOcfs3iZ0qMJm7FAxtsPYBSnpjEZQNXwNdWxsyfS6j3CZ6J
	 fVdVje51HoZtBwoZ9TM94vDMr2+hOMrLdva+jUjXVAb++S68+sI9Mclvrp1J5WRur3LK6
	 ht6FoZu3q8WnCutX2UZNN2o6WpEjYsLK4kV1M25nKJcpv2+Yw+8K68uA+1sExunfyYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JuiLpS2s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EE606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JuiLpS2s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5391F01829;
	Tue, 27 Oct 2026 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793118682;
	bh=WRlQjLqSSanzAjPiuI4qEjre7T3Pirwo0dI+Zxx/i/k=;
	h=From:To:Cc:Subject:Date;
	b=JuiLpS2s6J+K5rTpsfmIUX2N8V1SLAGNRMQqyaGliyhq5IW8/89QAYD3zdA1xJAOm
	 1TkTsf33MDfR0R/alNz65vYY46WkzAQua+uRn4tywkZ8FdqJ5JMgMTo9lFg289U5qn
	 KzS2Dtci78yHcU/SKrc9KCs62Xb1qdYrhoC7eXAw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: w.d.hubbs@gmail.com,
	chris@the-brannons.com,
	kirk@reisers.ca,
	samuel.thibault@ens-lyon.org
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] speakup: don't use the ldisc data after a hangup
Date: Tue, 27 Oct 2026 17:31:21 +0100
Message-ID: <2026102720-shakable-voter-f08f@gregkh>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3386; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=TLC9h7fPcxjUYc3Fb7PQdW1aytuDC8FROk+WMo42eVs=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPLt4oarD+p17+m3++E69ktdmb16Lryi3XcU19pZl7w rNycat4RywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzkgA3Dgq3Kj2QEAjitqzco PmfbrFkiuvfCUYbZLHP5ftwW0WPuORNsmpz3ZPXFXpNjAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

ttyio_in() takes the struct spk_ldisc_data from tty->disc_data and waits
for its completion. The structure belongs to the line discipline:
spk_ttyio_ldisc_close() frees it, and leaves the pointer in place.

speakup holds the tty until the synthesizer is released, but the line
discipline can be closed before that. A hangup of the port does it:
__tty_hangup() calls tty_ldisc_hangup(), and as no file is open for the
tty, this one calls tty_ldisc_kill(). The port is hung up when a USB
serial adapter is pulled out, and when a serial port for which CLOCAL was
switched off loses the carrier.

After that every call of ttyio_in() takes the lock of a completion in
freed memory and may write to it. The LiteTalk and Speakout drivers call
it through spk_synth_get_index() whenever "read all" is used. If the
hangup comes while ttyio_in() sleeps, the completion is freed under it.

Take a reference to the line discipline for the time the data is used,
and report that there is no input if there is none any more.
tty_ldisc_ref() does not sleep, so it can be used by the callers in
atomic context, too. Also clear the pointer when the data is freed.

Fixes: 6b9ad1c742bf ("staging: speakup: add send_xchar, tiocmset and input functionality for tty")
Cc: stable <stable@kernel.org>
Cc: William Hubbs <w.d.hubbs@gmail.com>
Cc: Chris Brannon <chris@the-brannons.com>
Cc: Kirk Reiser <kirk@reisers.ca>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/accessibility/speakup/spk_ttyio.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/accessibility/speakup/spk_ttyio.c b/drivers/accessibility/speakup/spk_ttyio.c
index 6bff78e3d872..44139d870ac4 100644
--- a/drivers/accessibility/speakup/spk_ttyio.c
+++ b/drivers/accessibility/speakup/spk_ttyio.c
@@ -69,6 +69,7 @@ static int spk_ttyio_ldisc_open(struct tty_struct *tty)
 static void spk_ttyio_ldisc_close(struct tty_struct *tty)
 {
 	kfree(tty->disc_data);
+	tty->disc_data = NULL;
 }
 
 static size_t spk_ttyio_receive_buf2(struct tty_struct *tty, const u8 *cp,
@@ -291,17 +292,24 @@ static int spk_ttyio_wait_for_xmitr(struct spk_synth *in_synth)
 static unsigned char ttyio_in(struct spk_synth *in_synth, int timeout)
 {
 	struct tty_struct *tty = in_synth->dev;
-	struct spk_ldisc_data *ldisc_data = tty->disc_data;
-	char rv;
+	struct spk_ldisc_data *ldisc_data;
+	struct tty_ldisc *ld;
+	char rv = 0xff;
+
+	/* A hangup of the port closes the line discipline, which frees its data. */
+	ld = tty_ldisc_ref(tty);
+	if (!ld)
+		return 0xff;
+	ldisc_data = tty->disc_data;
 
 	if (!timeout) {
 		if (!try_wait_for_completion(&ldisc_data->completion))
-			return 0xff;
+			goto out;
 	} else if (wait_for_completion_timeout(&ldisc_data->completion,
 					usecs_to_jiffies(timeout)) == 0) {
 		pr_warn("spk_ttyio: timeout (%d)  while waiting for input\n",
 			timeout);
-		return 0xff;
+		goto out;
 	}
 
 	rv = ldisc_data->buf;
@@ -312,6 +320,8 @@ static unsigned char ttyio_in(struct spk_synth *in_synth, int timeout)
 	ldisc_data->buf_free = true;
 	/* Let TTY push more characters */
 	tty_flip_buffer_push(tty->port);
+out:
+	tty_ldisc_deref(ld);
 
 	return rv;
 }
-- 
2.56.0


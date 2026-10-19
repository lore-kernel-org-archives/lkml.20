Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426259;
	b=L90Gi2z8IUfESMwBO+zRY3Qg8eRI/CF+XjN8MbSGLUMOkLyFu2t9lRe78Zi04N9Fmji5
	 +FrfGgos6fIQtIWcML1m51afQEoTY1C4KFH0f5NHfipJ7/W30EXP7kUOa3uBhTKsdMqYx
	 NQ/PpCzrM/4wAtommCPyj0jeg8gfOBxg9g+v77qoa5GX7qkUgws740LzTEaSwhccz8YVE
	 E/1WVyjptL/Nrt6JZyZbw/QFwnh5VlYJFlva8q1xF5GvJ8TtFdkFklG+gOtrtj0cWH3J8
	 BrNDqMFIOe5fA2ym5lbkf99uNyqEuOPaxkU/0hXi21eqQxsJELwngTNFvGde0wo8Acg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426259;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=895q4O/O5NLKu9wQiRohSicaxYK30MS2Nwv73h3W+2Q=;
	b=r/NVtujuE5Q0WNq5SJ3qLiyEojXPDNDfniGyeEGDDRi2Jj0Z58b/qQ2NKUbet18a0PQo
	 Czu3ourw9etc+wwphMbQFfgq37FRC8PMOIA7TXI8AYm/gj1SOtiVliitNKwlnnvB7KVAo
	 DCGh0dsNLR7n8FEcKtNu5FbfVTQiJ1SU/YZF0yymy02yAL6raZKUyOoJt/hnARQBIr7CX
	 IG4PDKfHB3lQDt/ZdvEviYRXm+p7h/VkMZf9/Sq9x6CnMf3k99NE1gdnez5OHrVPMi0Gh
	 DCnaccDVIy0bp/8UzS8b0fBw7/5cgw/Qx+P/LRCrIOdXx16DwJyASR0tZk+fguOpsZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpHmsWOg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCC606C908;
	Mon, 19 Oct 2026 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpHmsWOg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4064A1F000CA;
	Mon, 19 Oct 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426258;
	bh=895q4O/O5NLKu9wQiRohSicaxYK30MS2Nwv73h3W+2Q=;
	h=Date:From:To:Cc:Subject;
	b=IpHmsWOgLnawKLPNH9ZZgjpCFXlbFErhC4IekaNTgq/bWsrebDhbfyVA1f0h8DjG5
	 gFpY/heECj4vlcUIQlxeESGOUkz0pZ5h60G6viQOsRAnHy8bQ9DASoLdnEme82Ow9v
	 fRSvyjKydw79VHzVJQqzWLbG+vK5wEaL0/BBX2g9hHPfni/x46kNG9oyBKehKd7h3U
	 bEFOFKXWEiJ0hYRt+EmmrIXVoRDfgXU9Gac+2tcA6xv4Z9wvFmqAaSVv6A/Y46j/HE
	 QAUfw5RXdDe1zsY2M+ut8QKs8Uy7OQeHfBo48u71SeDQH8jhDLjYRYcoPxWs5P4wZN
	 BebceuPfGTQDQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3D93B1AC57D0; Mon, 19 Oct 2026 17:10:56 +0100 (BST)
Date: Mon, 19 Oct 2026 17:10:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ieee1394 tree with the origin tree
Message-ID: <atZBEI6G3PgKHKaW@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2dX/5kNb4qnOzD+"
Content-Disposition: inline


--J2dX/5kNb4qnOzD+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ieee1394 tree got a conflict in:

  drivers/firewire/core-transaction.c

between commit:

  7f9f2d6abc40f ("firewire: core: fix race condition in split transaction h=
andling")

=66rom the origin tree and commit:

  0f7228de31f1c ("firewire: core: expand close_transaction() into its calle=
rs and remove it")

=66rom the ieee1394 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/firewire/core-transaction.c
index 016070560c742,a0379fc3e60e5..0000000000000
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@@ -89,53 -94,28 +94,32 @@@ void fw_cancel_pending_transactions(str
  			break;						\
  		}							\
  	}								\
- 	if (t) {							\
- 		if (try_cancel_split_timeout(t))			\
- 			remove_transaction_entry(card, t);		\
 -	if (__t && try_cancel_split_timeout(__t))			\
 -		remove_transaction_entry(card, __t);			\
++	if (__t) {							\
++		if (try_cancel_split_timeout(__t))			\
++			remove_transaction_entry(card, __t);		\
 +		else							\
- 			t =3D NULL;					\
++			__t =3D NULL;					\
 +	}								\
- 	t;								\
+ 	__t;								\
  })
 =20
- static int close_transaction(struct fw_transaction *transaction, struct f=
w_card *card, int rcode,
- 			     u32 response_tstamp)
- {
- 	struct fw_transaction *t;
-=20
- 	// NOTE: This can be without irqsave when we can guarantee that __fw_sen=
d_request() for
- 	// local destination never runs in any type of IRQ context.
- 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
- 		t =3D find_and_pop_transaction_entry(card, iter =3D=3D transaction);
- 		if (!t)
- 			return -ENOENT;
- 	}
-=20
- 	if (!t->with_tstamp) {
- 		t->callback.without_tstamp(card, rcode, NULL, 0, t->callback_data);
- 	} else {
- 		t->callback.with_tstamp(card, rcode, t->packet.timestamp, response_tsta=
mp, NULL, 0,
- 					t->callback_data);
- 	}
-=20
- 	return 0;
- }
-=20
- /*
-  * Only valid for transactions that are potentially pending (ie have
-  * been sent).
+ /**
+  * fw_cancel_transaction: cancel transaction.
+  * @card:		interface where the transaction has been requested
+  * @transaction:	transaction instance to be cancelled
+  *
+  * Terminate the transaction by either canceling the request subaction or=
 the response subaction
+  * of the split transaction, then schedule the transaction callback to no=
tify the cancellation.
+  * The transaction instance should be kept until the callback will be inv=
oked.
+  *
+  * Context: Process context.
+  * Returns: 0 on success, -ENOENT if the transaction instance is not foun=
d in the queue for the
+  * pending transaction.
   */
- int fw_cancel_transaction(struct fw_card *card,
- 			  struct fw_transaction *transaction)
+ int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *tr=
ansaction)
  {
- 	u32 tstamp;
-=20
- 	/*
- 	 * Cancel the packet transmission if it's still queued.  That
- 	 * will call the packet transmission callback which cancels
- 	 * the transaction.
- 	 */
-=20
+ 	// Cancel the packet transmission if it's still queued. That will schedu=
le the packet
+ 	// transmission callback which cancels the transaction.
  	if (card->driver->cancel_packet(card, &transaction->packet) =3D=3D 0)
  		return 0;
 =20

--J2dX/5kNb4qnOzD+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZBEAAKCRAv73Ows9A4
iYIrAP9stuLMCh0vR618/deQaj37KO/ZxVZK6v+QzlLdaZwtYwEA9aQsguCB5s89
i0YDmPv+Z01WHJL19wKJIsKh2PqKKQw=
=sCYX
-----END PGP SIGNATURE-----

--J2dX/5kNb4qnOzD+--

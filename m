Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5D4BB5B1;
	Thu,  3 Sep 2026 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445611; cv=none; b=oWlUb6CbXwNGw0jiR2RDbyOYFgtFxL1ymn68LdoU8gQ+JZtNNUW00+TMUVRIlLYPKRgaudpzHId7iIHxmG/kbZBOLsvO4mf1OMqHT4+VH/o0O06t3BnU2bgNV47uqL/xHA7jj9QYSv7zzdlwUbMFAKHdo5mJAbDNaYr8Z1wy/BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445611; c=relaxed/simple;
	bh=KTSc76Y1CWXzyjC2AUKrMmD3iN4klFWdR/enhZjkPRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+wzvPBpC04+4LY1nWdgch5paHflwWu7udSXme/zPVXrJ7U0/pg75SaR2MfaMB8qQKZqKX1Z6+q3MoE84RC29IxLDYYVGPz+WrYSxcsZ2toj4SVNyaARI7Kofqc5Y/pNXFs3IQ+mMGp4xSjLFCNqP7f/1m238soIbcfs70SrPXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdyccQz6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdyccQz6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA251F00A3D;
	Thu,  3 Sep 2026 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445605;
	bh=/gFG7KA65dJAnBc1N6mFxITdnVD3dIA1oxoqY2blTUA=;
	h=Date:From:To:Cc:Subject;
	b=jdyccQz6ZMqV8hXiLnDzyr8sSmWwWWbFkYA+r5TaBpakkhEjHc09tu/13H4TS8o9T
	 nBGUHBq75P3meEi83F+F1PvgUE3S4xTOx2bYbLogQphPGbKPg0VM5v4QC0YDvQHZld
	 ulFUOwbMWciymz0pLdNQoGdoDBlfNYd5l2s9g+PGeC9TIR4Ko2RCeVvXfu34tj16jN
	 zYzrlgSyYBFM4pMWNErfXSNSS5XaZOuN/dbdIwQpE1oYnLcY0Od0NyQSQh1kvLdcaq
	 fh3/322vSSHKscvhScLBOBqE8lPyd6xW4TY0dRbEU2dzs5ZRtuNR5XVjDQlJXQcZ6Q
	 W8cGPrX7jYlQA==
Date: Thu, 3 Sep 2026 15:26:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <apmDoVCOBFFFETjF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1hyZhZOl9DKrk6i"
Content-Disposition: inline


--y1hyZhZOl9DKrk6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0c9d2588a514f ("Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728")
  14a97a38ba8f2 ("Bluetooth: eir: Fix OOB read in eir_get_service_data()")
  1c08039e3887f ("Bluetooth: RFCOMM: Validate MTU in rfcomm_apply_pn() to prevent infinite loop")
  1fcf216462ec3 ("Bluetooth: btnxpuart: Validate the FW dump header length")
  262cb784c96cb ("Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path")
  26cf20d065b31 ("Bluetooth: hci_sync: add conditional locking annotations")
  32b42c0704fdd ("Bluetooth: hci_bcm: fix usage_count leak when autosuspend_delay is negative")
  40c621391de93 ("Bluetooth: RFCOMM: serialize security confirmation handling")
  486f8908aa587 ("Bluetooth: ISO: fix use-after-free of listener socket in iso_conn_ready")
  54c03e6bc7188 ("Bluetooth: btmtk: Do not discard the subsystem reset timeout")
  762385e862009 ("Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv reports on BCM4378")
  771e812f94b32 ("Bluetooth: btmtk: Do not report success when subsys reset fails")
  951d9f743029b ("Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX")
  99672791e9c9f ("Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference")
  9db7e5fffbaec ("Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN")
  9e257e3586428 ("Bluetooth: hci_h5: fix usage_count leak when autosuspend_delay is negative")
  aadb3cd4bbb47 ("Bluetooth: do not leak an hci_conn when a second LE connect is rejected")
  b8d936018ce2b ("Bluetooth: hci_uart: Fix false success return in hci_uart_setup()")
  bc2791e60e082 ("Bluetooth: hci_intel: fix usage_count leak when autosuspend_delay is negative")
  be766d775060e ("Bluetooth: hci_core: use skb_get() instead of skb_clone() for req_skb")
  d1b752f552896 ("Bluetooth: L2CAP: access chan->conn safely in get/setsockopt")
  d2d1c215ce117 ("Bluetooth: hci_conn: re-enable advertising only for peripheral role")
  d67f4a43e7ef8 ("Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan")
  e4d6d16f1be19 ("Bluetooth: hci_event: clear HCI_LE_ADV only on a created connection")
  ed516e3f1aa61 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request")
  f716a05f49671 ("Bluetooth: btnxpuart: Check remote M.2 connector availability before pwrseq")
  fe3897b4ab57b ("Bluetooth: RFCOMM: serialize session teardown")

--y1hyZhZOl9DKrk6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZg6AACgkQJNaLcl1U
h9Djwgf9EhHlgrw+jpvMPlIBIyQnbrBrLnjLe3fAUj3cMdndH3UVlejOOwpnhldo
eNQxqUR1pxQVOnmRIsv8cP5ZyjaPWCto4WxmY26nDfoXYaVZf9wRZhbtGpiz5sug
ic91C+nBF7Fmh1ZVBbW8vgGsKlLJ58P73cJqzYFV30jKTH9hXOGwvSWGiHaoaodp
ZV7/CUg+qPlmQijLSD0GGLFZoRJeHTeoMAHhPw7hm3GEKVkf0EbkrnHoz6WkIdVC
WmziZ8/M6jXn4oPpD7GtTtxtIrvqOdwf9z+aaF70IxWnx3PRs/bE4rL2QM+K5XSN
kMiF4Uxe6BZM3LdcMo4Gx906HZrGIg==
=eEU+
-----END PGP SIGNATURE-----

--y1hyZhZOl9DKrk6i--

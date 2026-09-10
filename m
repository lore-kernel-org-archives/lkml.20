Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50487481FA5;
	Thu, 10 Sep 2026 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049752; cv=none; b=pdWbusMeDB/sUr4TaLa+akGl64Qk0UmwCcXx4gYQXLYdztt3gbeq/3Df7iRn2bvFVYSNiIuNEJMUa24HQ0T+SXpKu1vVpyFH73i/9NaVlB/LaBjUEIdMHx0sLmB+0wCjANkE39IyQLPutqdQ06dMMdJTAh6SeqGFNUE3He1VUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049752; c=relaxed/simple;
	bh=8YWRGn0R+oDy2NyfaTQdvAmDHKskRsQFv8+R9XWFe0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyHb3yJPSfhnN9aRnxT2UF9vD2TBgs1Uj/ilHVgNUjtXuSDNmxeNSzHw2Ytkk4IVNUdzZWpYGTpEleaslgO6gxia04QAj2p1sW8mCNivz83a0ANoAoA2+wKNWYvQBJbVMqJlNwcHClDHh8MC9lSo5byplmgKUwWiUm5qxsv2iTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7iZzbC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7iZzbC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2E21F00893;
	Thu, 10 Sep 2026 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049750;
	bh=/yH4MZFvNssLe7LhcRcjOZvWNt3Rjr+95H50hRGEwbs=;
	h=Date:From:To:Cc:Subject;
	b=Z7iZzbC/DFBl0hy86EuHmWLxJ3PHD416OzdYOH/8gB4kyhtMC7i4mMJJfTH4tWU5m
	 Y8LJVwfLgHKBI/NGSqJYmg20VytzmtF+sTJNwiDFfoUHexkb+l/Hi0S+wM3vGpzxaR
	 K/n9pjCbgHjz6Lhx1hNCW+TCcWQNpdUQWoyVA8hzuR59DobVrKvptxp7fwxj3OJ+yT
	 V40bTxfeK/hm39XbHmZUFJRvko5lnbzR8PXWpHwx2m6RxYP5w9RA1kpw+8dz7pL8BR
	 o3zIRmudkDGOPG0hDP085E74SRTuRbhOb/WvZAR+i+Y/PkcTLjw2RgPggPeuZhkvwW
	 LU8Qcoe185PoQ==
Date: Thu, 10 Sep 2026 15:15:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <aqK7k5Sw4pP9nKW0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EGKBu8cFwYredfMg"
Content-Disposition: inline


--EGKBu8cFwYredfMg
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
  58c6f5ec1d22b ("Bluetooth: btintel: bound firmware ID by TLV length")
  762385e862009 ("Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv reports on BCM4378")
  771e812f94b32 ("Bluetooth: btmtk: Do not report success when subsys reset fails")
  78f08df9649c1 ("Bluetooth: hci_core: Fix race condition during device registration")
  870187be23621 ("Bluetooth: hci_mrvl: Fix wrong return value check of wait_on_bit_timeout()")
  951d9f743029b ("Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX")
  99672791e9c9f ("Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference")
  9db7e5fffbaec ("Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN")
  9e257e3586428 ("Bluetooth: hci_h5: fix usage_count leak when autosuspend_delay is negative")
  aadb3cd4bbb47 ("Bluetooth: do not leak an hci_conn when a second LE connect is rejected")
  af04b0e3176e5 ("Bluetooth: L2CAP: clear FLAG_DEFER_SETUP only for same PID/PSM")
  b1f1766ef7691 ("Bluetooth: L2CAP: fix chan mode for LE_CONN_REQ + EXT_FLOWCTL pchan")
  b8d936018ce2b ("Bluetooth: hci_uart: Fix false success return in hci_uart_setup()")
  bc2791e60e082 ("Bluetooth: hci_intel: fix usage_count leak when autosuspend_delay is negative")
  bcb621272aa04 ("Bluetooth: btintel_pcie: Clear automask on spurious interrupts")
  be766d775060e ("Bluetooth: hci_core: use skb_get() instead of skb_clone() for req_skb")
  d1b752f552896 ("Bluetooth: L2CAP: access chan->conn safely in get/setsockopt")
  d2d1c215ce117 ("Bluetooth: hci_conn: re-enable advertising only for peripheral role")
  d67f4a43e7ef8 ("Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan")
  ddaccd985bb01 ("Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect")
  e4d6d16f1be19 ("Bluetooth: hci_event: clear HCI_LE_ADV only on a created connection")
  eb656c5bb7543 ("Bluetooth: btintel: validate version TLV value lengths")
  ed516e3f1aa61 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request")
  f716a05f49671 ("Bluetooth: btnxpuart: Check remote M.2 connector availability before pwrseq")
  f8c8fa407aa0f ("Bluetooth: btintel: propagate version TLV parsing errors")
  fe3897b4ab57b ("Bluetooth: RFCOMM: serialize session teardown")

--EGKBu8cFwYredfMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqiu5IACgkQJNaLcl1U
h9CGGwf9F2BvGIHjgOc0KfzqMkM5ZwxxiN92G7g+IgTgGVzGCyx7IjuNUKXHulpC
vPi7w8JmMR5N/FOBvJbLQFMSxs2/kawf5fkthTI0HfRGcnQ0C1tMSaV9oILi2l9S
mjuGgaN4ElD/vfPOe9OMae/FZ/Fos7nyWOViqrOQir9Txq0IMkywbkhO05CsLuMy
LJ3IUtSnZDCp/0Cvl5bKkSAqlV7WFu18heWD0u+I2v+uP/pHSRa7vyirri6ZlGss
DaunvxigBCfdp5cRjTHsy0m80XZmca69ODbIe+P8zjDdH/K5kXg0un4888wtZD12
Xzs6GTJIHCChz/7AKN5uYEDG506/Ig==
=+H4f
-----END PGP SIGNATURE-----

--EGKBu8cFwYredfMg--

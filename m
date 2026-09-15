Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6A3C3BFE;
	Tue, 15 Sep 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479248; cv=none; b=UOxeMTGlPAjRwljbDQebCSu2bdbDJvPyFpHEav3FPzmJQQ8RW+XMMpXp/+a7mFeCXhqmFKVrw/cY0TaZmPsqoNnXwTvWN2qXh18EzFEDz6LPJwaKlZT+bpQA57YtwwW3Zp6NOlyc73VrUcL1x86c9D7n1lWd7yCfRtYsfdA8cD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479248; c=relaxed/simple;
	bh=99+EfvXvqJmNpnFMaIUnPpylwzLVn/bctl49YRjMUgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/y43T7u+Uki9bghYMA3bRVRYh+1a+8sQJJccrU9Pd7cweXrXrBAFLlzpWk22Jo89sCMc47flM8IlEY7DBi1PLTMQ6v1Ut+oea+Etg7r1HnGPeI3hoIbDS/nix8YwFey/7uKmZ2JN6VDYHXC4a3q6js7RG0U01JYuogOcqamIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5D971AM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5D971AM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066C31F00893;
	Tue, 15 Sep 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789479246;
	bh=LcE7Gw/KwVDibkJjtKCrPN4nA8Vl2D2EtYX7itxwCP8=;
	h=Date:From:To:Cc:Subject;
	b=S5D971AMwEFiyTVrxZzL0GaBiUtnXRFKA7vISBAFddyWAUytloFymDovJvoF9fqlb
	 QXArR8xVOygwhiN/gkgFE1LV9LdmveyKryQMtiDChHOKmzm2a3D1ORSg/wA3eIjcjS
	 9dloIXx+fXZnD/++vN6ejPi1G4GmGGe+uSTTh8yXv8vipS9J0rHT1FDMpAosdVFeUd
	 Suz1ZDNWOd5ZCAMQDu/hoHBB0QMdZGL/hv0s21KYB78ZSl7gJeRpqRndZY36AZah7E
	 18uQKTIfGiF5OTmMCrBJEyiVuLG7KqNZl3PqSu/io/mZmVS+GOBOo4gKILR1XU1ayv
	 ByngydMmlCYDQ==
Date: Tue, 15 Sep 2026 14:34:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <aqlJSqGCxOEryntW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ASo97lH0smGmKnQ"
Content-Disposition: inline


--9ASo97lH0smGmKnQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  088ef4eaad98a ("Bluetooth: btqcomsmd: destroy RPMsg endpoints before freeing hci_dev")
  0aab041d532fc ("Bluetooth: btrtl: Don't leak return code when parsing firmware format v2")
  0c9d2588a514f ("Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728")
  13e96569bf6a4 ("Bluetooth: hci_sysfs: Fix NULL pointer dereference in device_del()")
  14a97a38ba8f2 ("Bluetooth: eir: Fix OOB read in eir_get_service_data()")
  1c08039e3887f ("Bluetooth: RFCOMM: Validate MTU in rfcomm_apply_pn() to prevent infinite loop")
  1fcf216462ec3 ("Bluetooth: btnxpuart: Validate the FW dump header length")
  262cb784c96cb ("Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path")
  26cf20d065b31 ("Bluetooth: hci_sync: add conditional locking annotations")
  32b42c0704fdd ("Bluetooth: hci_bcm: fix usage_count leak when autosuspend_delay is negative")
  40c621391de93 ("Bluetooth: RFCOMM: serialize security confirmation handling")
  486f8908aa587 ("Bluetooth: ISO: fix use-after-free of listener socket in iso_conn_ready")
  512bf44847667 ("Bluetooth: Properly disable remote wakeup for MT7922/MT7925 on Ryzen platform")
  54c03e6bc7188 ("Bluetooth: btmtk: Do not discard the subsystem reset timeout")
  58c6f5ec1d22b ("Bluetooth: btintel: bound firmware ID by TLV length")
  762385e862009 ("Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv reports on BCM4378")
  771e812f94b32 ("Bluetooth: btmtk: Do not report success when subsys reset fails")
  78f08df9649c1 ("Bluetooth: hci_core: Fix race condition during device registration")
  83a1797b2020f ("Bluetooth: btusb: Fix UAF of btusb_data by rx_work")
  870187be23621 ("Bluetooth: hci_mrvl: Fix wrong return value check of wait_on_bit_timeout()")
  88a8184cb44c8 ("Bluetooth: hci_sync: Fix not setting CE length properly")
  951d9f743029b ("Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX")
  99672791e9c9f ("Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference")
  9db7e5fffbaec ("Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN")
  9e257e3586428 ("Bluetooth: hci_h5: fix usage_count leak when autosuspend_delay is negative")
  a8bfcece8b49a ("Bluetooth: btintel_pcie: fix tx_handle bounds off-by-one")
  aadb3cd4bbb47 ("Bluetooth: do not leak an hci_conn when a second LE connect is rejected")
  af04b0e3176e5 ("Bluetooth: L2CAP: clear FLAG_DEFER_SETUP only for same PID/PSM")
  b1f1766ef7691 ("Bluetooth: L2CAP: fix chan mode for LE_CONN_REQ + EXT_FLOWCTL pchan")
  b361e99dd3fbd ("Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware")
  b8d936018ce2b ("Bluetooth: hci_uart: Fix false success return in hci_uart_setup()")
  bc2791e60e082 ("Bluetooth: hci_intel: fix usage_count leak when autosuspend_delay is negative")
  bcb621272aa04 ("Bluetooth: btintel_pcie: Clear automask on spurious interrupts")
  be766d775060e ("Bluetooth: hci_core: use skb_get() instead of skb_clone() for req_skb")
  d1b752f552896 ("Bluetooth: L2CAP: access chan->conn safely in get/setsockopt")
  d2d1c215ce117 ("Bluetooth: hci_conn: re-enable advertising only for peripheral role")
  d67f4a43e7ef8 ("Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan")
  ddaccd985bb01 ("Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect")
  de8d29ede6f32 ("Bluetooth: btintel_pcie: validate packet_len before skb_put_data")
  e4d6d16f1be19 ("Bluetooth: hci_event: clear HCI_LE_ADV only on a created connection")
  eacbfff162377 ("Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset")
  eb656c5bb7543 ("Bluetooth: btintel: validate version TLV value lengths")
  ed516e3f1aa61 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request")
  f716a05f49671 ("Bluetooth: btnxpuart: Check remote M.2 connector availability before pwrseq")
  f8c8fa407aa0f ("Bluetooth: btintel: propagate version TLV parsing errors")
  fe3897b4ab57b ("Bluetooth: RFCOMM: serialize session teardown")

--9ASo97lH0smGmKnQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpSUkACgkQJNaLcl1U
h9D7SAf/bLRSFBSWNETA2zZTWq6pZ7dRhTvc5/fsWKzrCT9XuCvBO9S7qY4j/Cjf
HtJ59mtj5nKu3TKZmmwdMQdhGS9VtqPG3do51nJC3XSqsFm1vAp9S6GYvQQ3oomv
qB7+o/YdBO1c9Ed2+6IcHR8TaD0RHXP7eY2WCeAQEr6QMHfmXBBfpzVBl2ZIIKb6
X4EgSyRYwSPtU9O2qsJsu+BlzRRSs5yvLumg6bf9mFTPTEFsO+EfG9wUokcoFsh/
oCTQK0ek9AuJxbDICQb9ACLu3OAfdI2Z32ud2QZ6fAIYw320tJt8CcP1xipkeT8d
p5hat/CeWy8YgoenFVFdqXO37bGMAw==
=pqTD
-----END PGP SIGNATURE-----

--9ASo97lH0smGmKnQ--

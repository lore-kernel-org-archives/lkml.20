Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1173C378A;
	Fri,  4 Sep 2026 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538026; cv=none; b=aPkiH4xL10kLWNF3SBIqJIE4mii7WT5/hoHeW8D2g799sKBi6Cj6Sozbx9Ecb/UpKk36mWNXmcwtTvjyPmUVOQ+hGWoSvzzwL4NFodIA/x0yR+HRI4zo3JiW6SKE1uh1cndvIw/heEk3CTC31yB69R/APF760Xrkt3cqs+OpjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538026; c=relaxed/simple;
	bh=CkMbz54Vx95DbwL0EX0iNFPQRFdWRl+WZRZvrnfqcTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqHSxsR+w62uwwTCb+hka+adNnb4zR2yVOe6+KUirPdhILkVw0sT0ft0YuLDYy6if5n4a6veOu1FWjYpOWk7nZjSDH+0EzTP01X04S3c922tg6W7zcsh8JGF2Npr/Z/fENmvsQ4Z8S+nBVWh8NGhz/FMShWqVgD8gKrHAIAayp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBs9YbqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBs9YbqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0213F1F00A3E;
	Fri,  4 Sep 2026 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538024;
	bh=p2v4GujLO7RfTntGI9SLCkz0DPRBzZ9DJJ9rdr6oa80=;
	h=Date:From:To:Cc:Subject;
	b=KBs9YbqDzEhwcmTCAkwh2M928GODf8S7+yQBxMXIa+8XglNwilE4iwl+XOslu2KGq
	 eGS4Mov0FklzlfAeEzJIkK2BnL51TC1zPBXOaZJUYIfY8plblprPx3UkzG8IHtEag8
	 a3TRG5y1v8aR49lYRNfSeYGxqPsJ3TXwAaE0vAgLvGZnOa4/TbKjO0+FKkeXFsj2JJ
	 NnhvlKKRvEDGJ3hz57wlll9XYm07aj29qHh5I3RpUmw+eYKh0Bj2i/fcZcVQomLQlo
	 MCoi8r8KD0PFU6TyZCSEge+Z0nPiS8oRalrYYSZP3sMKvc2jpMzOvBt2ZI99vVaJgF
	 8faZULMyPCmeQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BC73F1AC528C; Fri, 04 Sep 2026 17:07:01 +0100 (BST)
Date: Fri, 4 Sep 2026 17:07:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth tree
Message-ID: <aprspVnTJDpAp7O3@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LYKWPr32NRXhLh6b"
Content-Disposition: inline


--LYKWPr32NRXhLh6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  71729d60938f4 ("Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset")
  a78f54e23804a ("Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset")
  b3850074b2c49 ("Bluetooth: btqcomsmd: destroy RPMsg endpoints before freeing hci_dev")
  1cdf710cc2a13 ("Bluetooth: btintel_pcie: remove duplicate BTINTEL_PCIE_MAGIC_NUM definition")
  21c3501e5f464 ("Bluetooth: hci_sysfs: Fix NULL pointer dereference in device_del()")
  860043e482746 ("Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware")
  9aa9447804c7b ("Bluetooth: btbcm: Add Synaptics 4384 chip support")
  29d82dcf72731 ("Bluetooth: dt-bindings: net: bluetooth: add BCM4384")

are missing a Signed-off-by from their committers

--LYKWPr32NRXhLh6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqa7KQACgkQJNaLcl1U
h9BqTwf/R7j/4jGqh5v0BpdhIj2DrWpfgivY4JOUR7wOYPwTlmkI6BHxTw4s0DUM
P8gdN/6bO6zbroYxcY1lhDGifmXLSXmZ7qi//I4hJgJkJ9VNgzCWVYYhTtzX37eo
Mz19KMtL6+Vw2mGhvIZs2VOEcJ/4uUh4llVfsArAO6JGsmM5U1uKfkPZLLIVcvR4
EP1Th3CLjzOALMDnuJf/084xPb19FiRkIDMbNHZY3zld07dISBiUZDPI+M4Lpqn9
TT+tmZr5N+oqoVzpdBtENLsHymxedZS6CVHVjDvMGlhAKe7rCIFjaFZ8X6HrOkYs
bXP62HZGDmEFlgCyhl+fNI2Bk3dKBg==
=QIpI
-----END PGP SIGNATURE-----

--LYKWPr32NRXhLh6b--

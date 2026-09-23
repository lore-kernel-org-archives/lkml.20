Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3B471266;
	Wed, 23 Sep 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151763; cv=none; b=VQdcE/1XozkwXwWH1pbB+08j7/N10k6Y6lZvzToi0p+s02prJDwqAcp+H4l8Azuu6XUkC2lRIInEiLwmJAC5wlbK71MBmsRdGHz1KzieVYAMldqvsDvzcCJe2GDJ5Unm+I1arfUWzXu5vGKFJfPm0dnPT1eCwoMP0aEwrBVKA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151763; c=relaxed/simple;
	bh=JAUmTEaZkOXDqj8MdRiMX6sdinQSDFAIC48LAAtPD7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNnVeeOMDuR89t3kZLQah+pnf5qt/BYs5ZYV5kd9wqc8zkqeS1efCfKVpfoT+AaFED3NsM71Ez69eQTD2xJDkE0NBOpPnv+WfTSuN7/Gw5aRqezxc/1bTQ6fWlOOe2TLrDwHz77eJcqmrARuRNIcXK2sMQIYDTDuJTJlbUIgeIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmS8XCTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmS8XCTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E796A1F000FF;
	Wed, 23 Sep 2026 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151761;
	bh=2PbqryHaSNRLlh016npZSucreMlG0dAXfSNZrM7J1gQ=;
	h=Date:From:To:Cc:Subject;
	b=UmS8XCTTHYcOlpd5NUky+AQQoUqf3pU2iCLb5w1gGDNE647jGzNMymLqTrjeafJ5u
	 L4NzYzdWZjAMZhmHSuiFQetjQnFJ2ZGK5u+KDujor1D64xTwWcJlPg6Xaeq/INF0yu
	 lZ6F/GCt6FMI6glCS3w+HbUrptx+gt9c3lL4vLma4EzatkZdQGUjfhFkfxqgqDF3kO
	 re+SDrzrEHy+F1o5rLEJFPR4c27j02wiCjox8Lcxo2TlqTvdKqCNNxHFhPU90ICV1z
	 7400Iwyls7/OZnxaJKlu2Ey76OB0K8CatK/5LMjanqPAZTWupkVMDX3jIV9bJvI5WI
	 gISmmHTXjZizA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6E54A1AC56E4; Wed, 23 Sep 2026 09:22:37 +0100 (BST)
Date: Wed, 23 Sep 2026 10:22:37 +0200
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth tree
Message-ID: <arOMTa0L7QhM5RyA@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CYp6D6yFBvSWuvZ0"
Content-Disposition: inline


--CYp6D6yFBvSWuvZ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  4712bd9a14cbd ("Bluetooth: btintel: validate DDC record lengths")
  7348abd83a3b2 ("Bluetooth: hci_core: free the HCI ID if naming fails")
  ea983244b99a3 ("Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems")
  2b036342b623c ("Bluetooth: btintel_pcie: reject oversized TX packets in send_frame()")
  6d21e89e69775 ("Bluetooth: btintel_pcie: fix plen overflow in btintel_pcie_recv_frame()")
  4145a13c1a044 ("Bluetooth: btintel: fix buffer over-read in btintel_hw_error()")

are missing a Signed-off-by from their committers

--CYp6D6yFBvSWuvZ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzjEwACgkQJNaLcl1U
h9DytwgAhRvRkW3q9tHb7Icl80uORFGVALH7/nHKPKT/qKWXb976ALqdC5a6GDGG
+YiVvqtKT3LUF5D4eIrql72+wIp++ldUBp+gCHbWzrcVYVCYvXGvXrKdnaqG/YUx
JakMfEK6qWB79Cb2Nb6QcIAo62+AU3fyEiDK+8n5cscjpQuwxuqG0QfN+X5olCJA
mJENH11GJPgCjMX3W19EgTx7T9K8GzTCivh4BMrQJS1J/oj7x8YDIf8tZWf9aTsE
gE48ySEvHH2MZ1Ia8bDEoj4llRKfqLIAyP0BXwj5c86NrMbmDbLENrNRKKYxLr5w
9TROzRovq7FReNqiuQdGfzIOlTV5Jw==
=9RG3
-----END PGP SIGNATURE-----

--CYp6D6yFBvSWuvZ0--

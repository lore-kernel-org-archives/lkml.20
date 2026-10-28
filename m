Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200500;
	b=X7x9BwG7a8rbynn4jYQzqewjeCOKIZeZ0M3kPlz1s4KRjFM9+yuAqbnmIgw1N9jDdGvJ
	 iq3qFDdZAZzet9xbBK0f77QuXQAPzFTVDGm83vQASwOf1gM8Qku+bwZqkhCN+Orqs7Ylz
	 T34Ix62Pt0Vi3IflPpSm7TnNqeXDgGo9VyqsXpkh+qsBICYc66UMdEj3LbEe/plvOO6VI
	 lu6B7S8z9lu+abelSH5hhubgMt8PSN7RJayxq64ev/ZNbD6upYsxBee1gzlSusg83vD2C
	 IJgjPU9dl+ZBLVVZS/UTY2z7EhRshGD5XJU50OXDf6Obh6vkxAP1ucv1GnMLqzZa4Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200500;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=86Ur0Xu31OBN1PsIGAaHX+QzHYZsp0uUi38LC60Tz4A=;
	b=1aNXLKuBOfKa5AFGH1Ys+KVD2QUQ6+hbRIBAL6Ip7tce8fAtNDipQc3iCTtIHMsOGKMY
	 fs1huHa9yW6e3WpdSNxYTYOO/X0apKqtFcRejSBLh01RVf1TuIiLwgu0U9GHyVqchblCl
	 /zEGsz5Bne62/yPHMuwxWKb8GuXBZPEyhS+aBhQ7DNxepRUXW/SnbBeGWuqDhg9HkXNYN
	 BpWwXBOU13E8EqLe+vkYXnvYBymX23shlKQgVlCNLHZGpgwg+AdIt4EQDmHnTooKNCuQR
	 sJfpmapHIQE0S8X+KpPX9J10JrRBflNosPfyVXbpckPPhxRLxogaMeNp2Ax5C+qbSVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D+cT7/D1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745F1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+cT7/D1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4261F01825;
	Wed, 28 Oct 2026 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200500;
	bh=86Ur0Xu31OBN1PsIGAaHX+QzHYZsp0uUi38LC60Tz4A=;
	h=Date:From:To:Cc:Subject;
	b=D+cT7/D1STjVtrS/SSdD1E3VyvxDZ2xpqYavXsC5DDYSMTvSMFrWgIprDOB3dU5Br
	 2rAHYrhZ6bN+CgJi1w3P6SVfKVCfssfjU0EBkLzfMTb1/JiMVY2XC7O2nc+arv8RwK
	 SctqZPGt9VNG50+4DHDp6ZELWHQYDVntQHzQ2cEKmFYIQsrFf9rn4FgkYtASL3fu6H
	 V4fcBRtyN/FlUeFRJTCQclgCbVjmwzSRRR6XHXAOdcRFXUwC/yjTyw54wqNrPISVBY
	 RNzDAyIT9ZGrT3HB0/zPW01LaiSznvbpEdT/xXMUrM9V8V+Q/IJKkHwOs1z6EWYnNV
	 Ne2PTHSu7GNpg==
Date: Wed, 28 Oct 2026 20:44:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: soundwire subsystem updates for 7.4
Message-ID: <auIRcPJQY81j6U81@parshuram>
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
	protocol="application/pgp-signature"; boundary="tYGocxy9fI9/Q0Fu"
Content-Disposition: inline


--tYGocxy9fI9/Q0Fu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus,

Please pull to receive updates for soundwire subsystem. Driver updates
and few dmi quirks handling.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-7.4-rc1

for you to fetch changes up to 2e9eff8847a46530ab937696f340b9d5bea2e4ef:

  soundwire: intel_auxdevice: add rt766/rt767 codec to wake_capable_list (2=
026-10-03 10:06:17 +0200)

----------------------------------------------------------------
soundwire updates for 7.4

 - CLOCK_STOP_MODE1 support in bus and Intel driver
 - Dmi quirks for disabling ghost on Lenovo Yoga 7 Pro, Lenovo Yoga Slim 7,
   Lenovo Pro 9, Lenovo Yoga Slim 7i 14IPH11.
 - Few more codecs as wake capable, tac5xx2 family, rt718, rt766/rt767
 - Qualcomm Shikra SoC support

----------------------------------------------------------------
Bard Liao (5):
      soundwire: bus: add CLOCK_STOP_MODE1 support back
      soundwire: Intel: add wake_enable parameter to stop_bus ops
      soundwire: Intel: stop sdw clock in system suspend
      soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro
      soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7

Boris Faure (1):
      soundwire: intel: initialise quirk_mask before reading it

Charles Keepax (1):
      soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Pro 9

Hemanth Selam (1):
      soundwire: fix repeated words in log messages

Mohammad Rafi Shaik (2):
      dt-bindings: soundwire: qcom: add qcom,shikra-soundwire compatible
      soundwire: qcom: add EE-aware register layout for Shikra

Niranjan H Y (1):
      soundwire: intel_auxdevice: add tac5xx2 family to wake_capable_list

Oder Chiou (1):
      soundwire: intel_auxdevice: add rt718 codec to wake_capable_list

Richard Fitzgerald (1):
      soundwire: bus_type: Use devres to free slave IDA

Sataporn Saijai (1):
      soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11

Sergey Lebedev (1):
      soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (I=
ntel)

Shuming Fan (1):
      soundwire: intel_auxdevice: add rt766/rt767 codec to wake_capable_list

Srinivas Kandagatla (2):
      soundwire: bus: iterate DT compatibles for class-ID match
      soundwire: qcom: cache SCP_ADDRPAGE1/2 to preserve MBQ atomicity

 .../bindings/soundwire/qcom,soundwire.yaml         |   1 +
 drivers/soundwire/bus.c                            |  54 +++++----
 drivers/soundwire/bus_type.c                       |  16 ++-
 drivers/soundwire/dmi-quirks.c                     |  65 +++++++++++
 drivers/soundwire/intel.h                          |   6 +-
 drivers/soundwire/intel_auxdevice.c                |  14 ++-
 drivers/soundwire/intel_bus_common.c               |   8 +-
 drivers/soundwire/qcom.c                           | 123 +++++++++++++++++=
----
 drivers/soundwire/slave.c                          |  28 +++--
 drivers/soundwire/stream.c                         |   8 +-
 include/linux/soundwire/sdw.h                      |   4 +
 include/linux/soundwire/sdw_intel.h                |   2 +-
 12 files changed, 255 insertions(+), 74 deletions(-)

--=20
~Vinod

--tYGocxy9fI9/Q0Fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmriEW8ACgkQfBQHDyUj
g0ehehAAk+8egAW21rwrGqN1brLHlMavTu7G5xDxnkbOVbHy5YpuZ9Vhvj/bcYrE
YLVSNXucQqITROkpHxsxrW3+RZ+dlJ98pxXMSHa8tjn7sFw2/szJ3g9Oc/Rjvvd/
6CofbeNjvRjAGcPGJiFtWpTBwvYegepuRbil1Xw08J/jV6qibOvEJUxSqP+BwT9h
8xwxTT1AbvBjClhlFW+g+GYcAEucNxA5D+aPWtYXgfENeGyWJWvkIcQjP2s3HkBK
qhVd2mUrC9PffKax+g1BZdsMQUB6dhWT8YoTcb1X/X4bPuo3zOgVrgzmJB9y345i
yLZXoVnlOqzkHr9AeEfi7Cwx+4pWQ4cX8TeaFCi2AksYWbTQXH9H9UEm5oi6P25p
Baa2oF8eAFxY3hMmA1qsq4h8DCSB5YNZh8P6rtUIPbmOz6+sxxQI/JCUzBqQWRz/
k2Wk6PRF/M6L5nSshzaWtqX7L5dUWmF9ASnexbNaKHIYDh+1pHiPGnPMn8r/pgGB
WVrzIvC67cDe4EiDX6kuJh4zYEZa5s9FCLfgNb3xgoJ+be+Tgqsk4cd6c2zrLRvm
QCV2dbWqMf8L1krfaiDkSXE6tDtUNoA1kjNHKcRIgQGx+lOUv1B0tuC54azLGkgW
6UrWt27jxZHattkxHA6Pct6MqyNp3z09o/bJ2XT8eWfFv70vWm8=
=MKRv
-----END PGP SIGNATURE-----

--tYGocxy9fI9/Q0Fu--

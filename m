Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46C51A121
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905491; cv=none; b=i28pL3G66526vJuuVJmAgIagYSWZSH8JhGUsoNybxbN49C3Z9ekccSHpALj33R7Pt35MVJh5pm35fpM2y5FZfxES9IXw+ItoUvgtOD/UDAkYM0tM45y/cT6w9MjaeBfdNxsdzoZKfcr5JFVsi9Of5StsH67U0dEENbrL8mJ3xgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905491; c=relaxed/simple;
	bh=ko82K1Jqzm+7uP5Zu8WUB0dPhh+VEsn/b6E75Irl69E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJ2nwzoc+vfo0i26VY0vDhrt2uqqfqHnf9XNqYZ7hhlCRCYm8WZlvBTN7EC0mlneUsU9Li9L40PVK8xDmiJqKf/2I1oxS8iZK1jB628i90STMOf3iJPvt9zlImCiQF7Pe3VKe6pTeSxqX8YAP+5OS2M7VEqLVXn7buJaG769yjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0hazhnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0hazhnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5111E1F00893;
	Tue, 13 Oct 2026 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905490;
	bh=2Z+wy+HJU5krqdxCh4MNGqLRoB1+mk+v8/zUlqrh22g=;
	h=Date:From:To:Cc:Subject;
	b=W0hazhnTnW3hhi4sanfiSqAdRpV6jfBRnjttjUxgx73EEKBTm4DMvONWgZRBdTDd3
	 O1vK57fDRcoS5rHIKv5PnpYdMNrzpGzVrqCBijE8P+brD7x6qVlIUmu/rQFyljdNa/
	 kOpZC+H+OZ0sPmWyq6/hmh1x+jwvSSlJ6atzLYVe2GTqoAVXZdGN8nf7Q5QkX6myjx
	 POR/Zh8YFH3GVJu+S7Fwk9G0jNXJbWrrIR0gNLTKTjvNtoTJVKsMm+fWWPAD9SqALf
	 WN91wJ2/VXMCb6fWLYG/yeT+XePn2WDckSEZOOJWFGxGw6/GOtpsvI6W2lHKz7A8tQ
	 VCTL2TjSpMfow==
Date: Tue, 13 Oct 2026 16:31:27 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][2/4] RISC-V misc. devicetrees for v7.4
Message-ID: <20261013-easily-lint-c427bdee2754@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BotAtISf3NwQU4DG"
Content-Disposition: inline

--BotAtISf3NwQU4DG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Small enough PR here, I was hoping to get the StarFive jhb100 SoC in, but
that'll have to wait for 7.5, along with the deprecation of the Canaan K210
that Arnd and I discussed last week.

Cheers,
Conor.

The following changes since commit 82ab962ef6c2a3571e3d590b30c023118c92b776:

  Merge branch 'k230-basic' into riscv-dt-for-next (2026-06-14 17:14:51 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.4

for you to fetch changes up to 2186ec5f59c23fcf0bf896ca0543b6a1135d7bb5:

  riscv: dts: starfive: Correct pwm nodes (2026-10-02 18:35:12 +0100)

----------------------------------------------------------------
RISC-V misc. devicetrees for v7.4

Microchip:
Add Valentina as a second maintainer because Daire is largely inactive.

Starfive:
Fix the PWM nodes, because a opencores,pwm-v1 instance only ever provides
one PWM channel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      MAINTAINERS: update RISC-V Microchip maintainers

Hal Feng (1):
      riscv: dts: starfive: Correct pwm nodes

 MAINTAINERS                                        |  3 +-
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    | 28 +++++++--
 arch/riscv/boot/dts/starfive/jh7100.dtsi           | 67 +++++++++++++++++++++-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 27 +++++++--
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |  6 +-
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi     |  6 +-
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  6 +-
 .../jh7110-starfive-visionfive-2-lite.dtsi         |  6 +-
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  6 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 67 +++++++++++++++++++++-
 10 files changed, 200 insertions(+), 22 deletions(-)

--BotAtISf3NwQU4DG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5OzwAKCRB4tDGHoIJi
0n7jAP0ZtoAQTFjlb0T6hm8d7m4Df2HMXwWGTS/jd1xsoqOtCAEA8Y5C14AWIoay
z7URj7kOzL6Us6y2I3I/7k44cd3xoww=
=8T9u
-----END PGP SIGNATURE-----

--BotAtISf3NwQU4DG--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36B49B20C;
	Tue,  1 Sep 2026 18:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286889; cv=none; b=FgRh+C4qZsTgZDU/9+s448fpQKyN3xZnyYyzRze/LZ5YRT31Uazx85YApZWep+jWBgt/gpB/oInynC9SMg1veO+HcqbkPnvLGnTM6mlMuhjFgpdhBHtvlc4NgDZtGTZUZxqLIDQb9GIpo0d7AxqArdNjGSPwmyMfEhHRua3iHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286889; c=relaxed/simple;
	bh=niY2U7SadFqVf5LZsXrtXbWAMJj+OCx/dd9QMUbQJdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YbvrO69FzrEsyQBqicYxVH2HfTNzq0dMBH1U7hACDTFReIUe9RR+5wdzGurUfxmO14Tj1JOsXV+npF0ofCrLwPppEws8arX53PMddFNdILREAnkjZJi+aoDym+rS0/kXryHeUriyr9In98XtX+TYJzntVv4pUwls/DAXi1JbLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDEyCo4I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDEyCo4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC951F000E9;
	Tue,  1 Sep 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286887;
	bh=8YluAxGPWwm2MYwukTHJXv+YZKj5wOb9JLbpEd/s/JQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bDEyCo4IJJnx4ET3pCQ7L7SOgIes6NE5AMise4Y44tns0mX9CMzhGmr0h7X5Mt+DO
	 KyjISIWznM/2uudVu4WvHFYDEnF1JOxropNICWTyjYZ77HeRN76juD+yj/ufE5wzDD
	 J+jI/DDi4HuX4WiYVt8lwAGKzcl02NHPmjly5H0RHB9rA8lIABUTGzVbAH+mSXqFs0
	 hXChLvWeRJI7UDGRj24NV2RsTqtJUIIb6uvFOOCh58PLed59gCw/BeMVRqDukgfrpa
	 nWb/yf8PadLL2g+blOXs7sYDjg3nj/Uo+LCSsmRq3EV/SkrxwftE3KlERfXo98zQ92
	 e5d8EsUGHOg6g==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rudi Heitbaum <rudi@heitbaum.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <aousEdwMni9ScZBn@0d3a7a881997>
References: <aousEdwMni9ScZBn@0d3a7a881997>
Subject: Re: [PATCH] dt-bindings: regulator: fan53555: add tcs,tcs4526
Message-Id: <178821342421.439600.14864702163491014046.b4-ty@b4>
Date: Mon, 31 Aug 2026 22:57:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=niY2U7SadFqVf5LZsXrtXbWAMJj+OCx/dd9QMUbQJdY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxej4T+z5XMNDg9dHCPQe4WKAngqClthIQG90
 /ulzQplK0yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXowAKCRAk1otyXVSH
 0GeGB/sG+A4gabyxuVuWY/dR72elGCe/DSmaSgNGkya6zteUK4X3VEHWKTBNTjH/+V51jdNDZiS
 TlsWYy6DYWN/ImSkqQpx8jdL64CKB99tZLJbZ/x2EvLG6k7HKrxkTWKuz/ludS4qE0Ox/9IpM/W
 EZWlWxrHwy3OKaGJiLQudfS611gbhn0Uc6vZqq1CNLyTlq8IdI4KocXXUsk3uF6b1Ro4NPv7z/u
 XVKEBm5h5X/IMsXtlrSEUiE/qHoYdxdHcA/Ul8WRemCNV0DVqp1nSPkPJVWO70VI124addgHYum
 w7t3EYqNfWACvzxksgbo7HMr3i4v84tnYK8yAcmIVzHe2wBA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 24 Aug 2026 02:27:29 +0000, Rudi Heitbaum wrote:
> dt-bindings: regulator: fan53555: add tcs,tcs4526

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] dt-bindings: regulator: fan53555: add tcs,tcs4526
      https://git.kernel.org/broonie/regulator/c/ca12149896ed

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


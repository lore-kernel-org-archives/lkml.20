Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928030;
	b=SRyTd1eFKmsNmI3O2oLF8rhjQ0Ikz1RIV+j6YIf3vcUoN/9w6bNdqTHiSvMteceIswYU
	 dr73IvbdB0Yr5qjSL9amJ3XRGvt5znve+KQeryzXhinmP9VD5vIcmdKWEeW2Mt9TIKzuY
	 miXVW6WkNZq3R2AVbbotmtU+t0wlr0HEJvvMl/6ZbjxzBumfCOQMUkOhkEvVOFT0w930w
	 pzjIRC4mdU4k3ubjYd+oM+hAK/wk6mO4Gz7OWxueUSVvw+j60qc4foSZUvmqYZqfrdjRr
	 7m/1XR/Fzsa+ENDwXfPrL0y3nlGq1NkagP+1o5tbJwyg20CInCVi+2zM8e5crv7+xEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928030;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ov/54IjmzyRGEmHUeI8L4nUadWme30lJOQSa1BrVlY8=;
	b=fPxtb8UZz2ewNlRm7GPtsA65QGk0g/6++xjxacT9q6oqOMBmXYdyIbJQ1tQp5XbDtO32
	 phLzqswHv0d6NLu8NPMDqutbrSiG52zNE8S1OyYxGsHsXPvI1xAClXsLXRgtiwpkqSpYJ
	 /G6BBGJwVMJv3NiZfEiqkjeifYq0rvkk0PuxF8oMxt5ivx1TC8M45eidohAMHZJO4Nj3C
	 uTLWbLaDFvaljZraWjRaPJ68hPsSyHEF3NS4PM99W1j+CAOQJkqBBU3wP09kVCac5h+Xo
	 7Il+fmugNHnA+s4UK7KYS2EgzPTZZYpXMl0LPtMukATYNFtppf9rS1Ri+ffcmFZvgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ok/qdum4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C18606A32A;
	Tue, 17 Nov 2026 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ok/qdum4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B977B1F000C4;
	Tue, 17 Nov 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928030;
	bh=Ov/54IjmzyRGEmHUeI8L4nUadWme30lJOQSa1BrVlY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ok/qdum42GvLDLYkVs6rEoTUa0/XVzKXyjmo1MpguOkAJLQZfnaXtP2n/wEIX15xH
	 S8l6iKrBjxEn0tXkmrJKiDLxo+mFnMNOLq+iw6U3rucEtQXCTTDICQdZcAtCm/dtIL
	 BdQ0cBwDp3fxnHTkqzjR+bVZgABOWyhRgzfJ4xJpjh5wDFcxBXhARTO71F6jBoR/4W
	 7RSWwEmmHck7T9+8r6b5VGvgnO7PSMrzPn+tGB4ixHl8bPtpWYwBUSBSvQOr8ewcf8
	 Lu0cgrTUBXn3fF41H0/RBFBKCi/lmnR7tk1y6qNkC0KXLZV3aTZWdj+qZfgguA4cH4
	 FnR9+wl7ReC9w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, ben.dooks@codethink.co.uk, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261116142314.3702643-1-ckeepax@opensource.cirrus.com>
References: <20261116142314.3702643-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: SDCA: fix __leXX types in
 find_sdca_control_range
Message-Id: <179491950660.77896.12912618666114216237.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:45:06 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s+IIcwTaUhe0eIwnLnZgRoH2Vp2d/F8prPxyeBGj46M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+5M7a8jH85O2LvQoHV98v4a4y3lU3q2utefDfuWtui
 DnN33mtsaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATcTjB8D/fYGYK78qYgCmm
 M1Jv3eHKej+JK+Pajan/74eennroZeApRoYW/S3M31Uuvks0sip7krHh2cmXAZVmZ2JMJhTcXHA
 sexcbAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 14:23:14 +0000, Charles Keepax wrote:
> ASoC: SDCA: fix __leXX types in find_sdca_control_range

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SDCA: fix __leXX types in find_sdca_control_range
      https://git.kernel.org/broonie/sound/c/584b499bfabf

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


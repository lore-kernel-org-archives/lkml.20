Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623321;
	b=W20X/rsnxAAD+eJRJgB7RrguhxhcT/CsHMGCRqtWb1BwPkg+p/rj2djj5M18etZphXhN
	 xyvtaLCO7GCo1Q4+6LUE3p41eh4s2PRXU+kGYStBVpLR/HX7GO4FX3uqcmZ679zZ7uBcb
	 BLbo/4Lbh9fKc173VV9lbxcsOZFCdBrMR25COlq9lbn2Pz5PiVKV9sx22Uoo3R2C2klVa
	 4FFayBo3AqIbe5d08UvxViSVe0xAXVdey6dmOQxuPjp1I4XTk4wuR6gVgPqoV1QNQdIdB
	 g0c8d56mViY5+jsQk1700k8yuFB1FsO+oWACbUbU9yF+S7FraZ5PasPjGHcAxJNw+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623321;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HM8GKFt+n+zfRkhYOLYg2mYTiY9M+SnbrglBY4vDeKo=;
	b=b8CHfd6MbuhDtufT0TDZvTu4Sz8tXk51F+OP9olkNy5NxzPbwV8cEoW4qRtXvwYz5J5G
	 tHKC2hXqjnFQSZQW95OW747wq6iRI41Ibootz5BvxLmewSZV2yvsxCmoIX81WtvKkl3U/
	 s4lS+P4H2O+6SCwqLRmLK4/4Q30HjYz/RhmoD2is/MYG0k++zOPxCplWoDb7xxg35dCh4
	 9pUv+KhTNmNYMVP49Vh0EbMbu7qjWaU1LUYbWDJUeHllcMUrF4+Ut3sZsg2PIzrqUxkwV
	 eI+i8nRKkwpixHcyvFjItZ/E3A8O+O7V2T1P7YewvZQb7OCF5Ex79RhxcaTnzVoGFtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zknam0R6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341EA60A2639
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zknam0R6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1951F00A1E;
	Mon,  2 Nov 2026 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623320;
	bh=HM8GKFt+n+zfRkhYOLYg2mYTiY9M+SnbrglBY4vDeKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zknam0R6/XQGMIXSvgj1T1KZ9ZPpJjirBnEjR4jqDF0WD0bAmfLEOtiBpPcrnrDlF
	 hj0Wi+K51ycFlQSk9hz12eAYwt9BhkyMy1TU56uT+W9gSzl7765GHmtKLnZjYT1c+k
	 fnBiijME4zm0bJMG3y21yLvVeuuA62WITUXFHDhV5d4HAtYiUjs//l0adD395HXwrd
	 NjmGwEM6IlMvwaNDvaC959c74Lx2030be8ZOIo0BuJg90WM6l2w8SktnmbWLeT3PB0
	 D7thj9Kl0kk+5n6+/S3aUcdqT3ul29Rrp8+pm5kBgSn2oC6WcIuhGW5duAC3T0auHQ
	 5GUSlgt9knahw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 128BB231044B;
	Mon, 02 Nov 2026 12:41:59 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261026-regmap-maple-bounds-v1-1-446f3eb8d406@kernel.org>
References: <20261026-regmap-maple-bounds-v1-1-446f3eb8d406@kernel.org>
Subject: Re: [PATCH] regcache: maple: Don't overflow the register number
 when inserting
Message-Id: <179357856401.1716893.4099669365696228086.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:16:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=psQUEwnDjLR6I4M9BZXGg2caG8elQ2tOIvgi0vXUayE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetIrlGf07fUVs7TOvZxfflpS9emPH1dXY/MPp7CyVz
 Rl9Zz72dpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAixsYMfwXnntiSdC9Rq5m3
 YN/y47qvdiQf48l6px+g8zdjyutHx9wYGTa7nSrYstGSiemWmKRl5JpsRdurhknat1X3qR9ae2n
 lGgYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 16:57:00 +0000, Mark Brown wrote:
> regcache: maple: Don't overflow the register number when inserting

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/1] regcache: maple: Don't overflow the register number when inserting
      https://git.kernel.org/broonie/regmap/c/e1b6fd745176

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


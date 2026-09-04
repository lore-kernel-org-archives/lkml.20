Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C119A3D3308
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552705; cv=none; b=Ki9AkAPYCDXPSUafrvYjuA8WtkytVWz/49WQfvnGAdNCUL7BBPCbhALiXHUYEj4Lwnm85pJfk/+o+vy/kvORS16v7FSoqxDWYJGjAGoN0SZQ1tU4Nq9A7wBQJRQeEi0Vg/ir6FkfsNddEc6KxbRwO3j2gR3nh0D2MUEI1uZqf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552705; c=relaxed/simple;
	bh=tBgfHBdFaeHVulrE8oTTOyLS+2jY8CUbxzkSED5Fe14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i1Nm+d39nUoo0I43ZXnEEw/ReQCm+JZfZqpvvHT1uovdO+miyCMTTt5zc/XgItLURdDPIN0fSbtOQKVXJRaqruxASqZcIRHoryi8HDvyEQ40PcS3Xax8pNJYb3dKedY5pXUT1DbYIEhftIgZQoK1LT14/mXkK/zOFiHrOpYOXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q28qFf3Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q28qFf3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707841F00A3D;
	Fri,  4 Sep 2026 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552702;
	bh=YhgoeMH2mlO0KR6C9C/IXzyhZk9dXM8agxKda5kT4Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q28qFf3Zxw2q4w3Pt9mx5Jd/+eVUNBfN6oWL79TYrKJvw5lWURicntlljg1xdv5+z
	 XxabJ29ez9QLdrp7/l44X8c7SX+0lvDtlSTYEDSZVKkHTmxPeKaNw9ORI3gwbYBH6R
	 B8XawKumSs8K/BptS3+qghekYAvRULz5eH4c20Yca2yA7BMykXADAyOj3xgLrnfLyw
	 ZHvIJnLs9DHbprj1RAYZXr4/tdprxlfMLw3+rneFiYGmUzS2ez+KWJ7xVTJO31hJeY
	 zDXsoX3DYC0/YmIZDWeWC0UBSsDfnTaOOtdbVkvgLmtYC6UFm7Nj9f+rwO3GNYqjFH
	 vY/uhRrCUYHAg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>, 
 Yufan Chen <ericterminal@gmail.com>, 
 Surendra Singh Chouhan <kr494167@gmail.com>, 
 Mario Rugiero <mrugiero@gmail.com>, linux-rockchip@lists.infradead.org
In-Reply-To: <20260904144728.1629471-1-diederik@cknow-tech.com>
References: <20260904144728.1629471-1-diederik@cknow-tech.com>
Subject: Re: [PATCH] regulator: tps65185: Remove redundant dev_err_probe()
Message-Id: <178853989858.632048.13657280228879604798.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:38:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tBgfHBdFaeHVulrE8oTTOyLS+2jY8CUbxzkSED5Fe14=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmyX5dNG4OS5eph1ssfUGGn5p4JZl1mVH5mkkQ
 oazdDv14aSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapsl+QAKCRAk1otyXVSH
 0P5gB/wJd73agvz/tRJsNifvwj3c2l+NwKuqlaVu23v8HGtYeD8mmDQODZ+Bsq+ntpLYwWTb/pv
 liECMctBYMsIFMXAuTC4sHJX9M8hTuZjatmHKks0rtxUlGu6vETDggxp/U6rwi/xSMf29A/lfdF
 UJck4xQ40Ime6mG7RTu9DkLEDyDXbFnEHQPUnXQJLunHBw5uSVWaWJltsv7A5op7au01OpuY2Xo
 ksEdRQUo0B8v204oxM80q2/j5GSixpu3ME806wjnaIe/mYtKVXoJIhg+RFc06Yc82Tj1eeMi8e/
 Sm/pzmWSTVRAHTWiUyud+uOMRvAfNhDBHcazDdTv9YDJ2CDm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 16:46:31 +0200, Diederik de Haas wrote:
> regulator: tps65185: Remove redundant dev_err_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: tps65185: Remove redundant dev_err_probe()
      https://git.kernel.org/broonie/regulator/c/761f34e333ac

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


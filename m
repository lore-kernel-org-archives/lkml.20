Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1063515FA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368596; cv=none; b=fCl98MbHg+hGbjdnoLT1DB3K6PixA37jJezgDco+51gAoPUv3rOOvgv7ZtVuQ5xa9tavRrNxgM0FBjJ8dN1/9tpqD67UKmPY2GGrXVzCJhGGmYdFJwrJVrvgdBQTYnod8VM17miXXjgbHaZTwWqAnJlw2Y3ttzl8VVz7Sz0cQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368596; c=relaxed/simple;
	bh=zTnJ9YoWd10h5/mtfTymaNcs4l2FqbJo980Dg8AISY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JoJalsFcdgTP/bIfN8zk3PcTkKCLLl/X1/8fWwhOVzR6jydrsQlR353VnVVquKbq0OsaedRHhKuSK2Ss1F4N8MQXuJhiEqU4tgYQm44mLZIbMKON+TJ2rx5z2jG5d74wCua/ITUWk6EzGuliNU06+Xcj0dSIXdlJ4VTvOrfV3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUcYisYL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUcYisYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE171F0089C;
	Wed,  7 Oct 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368587;
	bh=vObePtnGMmBnP8qhFPoFtYFxbOWdjnKoMLBrd7C1MiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gUcYisYLg+jZ2kSBOg7eoKrPavOAnUK8LRdE+YYjkWXs/BKlOQT1dsHOrIkkV3hJi
	 9XaUK8MXZ0hP8sCn1XUkmScvtSrNAc0Rr3UmiI/ctEmKWn+WffzN9/TLW+ZbAdNVlB
	 kR3P056AZ8W7RMFdxg4WNjPrubrGWwxlKvsXk7t5mZecXZFvzHuK9YakLaaqPpaB24
	 OYaUhBQ5HIWKO+DmX+LBgDmWE84pofHkBjR9NQETVfjHisS7eMcg2Shsrf25PJ4oUe
	 BXq4HA4vUD8AVWC3g3wdylf4epuxHaXT+M+cVi/c//D1aqoqd2LXAD/AiRN+syKEy/
	 Vs4vWDgYLKrZw==
From: Mark Brown <broonie@kernel.org>
To: Mark@mail.savoirfairelinux.com, Brown@mail.savoirfairelinux.com, 
 Abhishek Ojha <Abhishek.ojha@savoirfairelinux.com>
Cc: Liam@mail.savoirfairelinux.com, Girdwood@mail.savoirfairelinux.com, 
 lgirdwood@gmail.com, Tim@mail.savoirfairelinux.com, 
 Harvey@mail.savoirfairelinux.com, tharvey@gateworks.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260902010701.3360310-1-Abhishek.ojha@savoirfairelinux.com>
References: <20260902010701.3360310-1-Abhishek.ojha@savoirfairelinux.com>
Subject: Re: [PATCH] regulator: ltc3676: don't read the write-only HRST and
 CLIRQ registers
Message-Id: <179130238523.150114.4620200289929153130.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zTnJ9YoWd10h5/mtfTymaNcs4l2FqbJo980Dg8AISY0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxh2F8Xn3GlnD/PT+dctiz7zuKUPgZ96+4oZTK
 ovv+qDhU12JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasYdhQAKCRAk1otyXVSH
 0NPuCACC+PIJycESnzTJJjGCKAz8GQP1Erkh6CZbU3cPrZr6hI6LoDe+dzHMh0hlcpq+fxQ43j5
 yavmVHVMiPxbj77McS97DfarIY1aclInIJsgQHRWRWBnxH73RQ4emPwdhV2lF8uz/7F9uDPY5tX
 RStwTQsODI4s6DobjMAYW5Tu2tmDCH72GN3GovXVqiu+MeJORQ/smjqPlZqHR+X3Exnwf1t8FG5
 MmoKhMXBI/WDjSh3fGK4ilEQTWfUDQDVTouqCxps/702ToFhq2UiVBUoQz/E7t+oUj6OaYIvgTU
 toqHVODYQJNOm3muqYSqba+woL7/ALX25sRMdeDnQQyLL5Al
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 21:07:01 -0400, Abhishek Ojha wrote:
> regulator: ltc3676: don't read the write-only HRST and CLIRQ registers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: ltc3676: don't read the write-only HRST and CLIRQ registers
      https://git.kernel.org/broonie/regulator/c/28c2388ee24c

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


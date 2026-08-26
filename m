Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8B26CE05;
	Thu, 27 Aug 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832819; cv=none; b=O6BQhHh+1t7JYlTFeddkLTT47UiYnECPWcHgCgFWFYWmPrGag7lvc7fiStzMKxa6Vw4yCsPHJFz7r/jPo7Dy5E0jtzNYZDrydoz9c8k4ow2uAuOiCsWB60ovSltKoqpfHxGRh4B3o9tSUOpL+khkmXSJK9QMpPashH+9h1X/xkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832819; c=relaxed/simple;
	bh=7mJPMTcUzciIsKhxmZgqiqME4lm6eMXGzz36MWvbkLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sp2nzcHueLDFdzeY4peZd93gZNAvAcD5iW1xZnk214iiiTxQO+B7p/1NXc+PyiMQOIzFIN81V+PBQq7SjMqCY31ulM9RQ5wjr6krKrWhiLm4v0LL06kq3eGGU3Oiy6cMFguJN4xGES9cR6Cee19WaCCQhFdA648GIVjeBjCwhuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRk9Ejmg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRk9Ejmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96E81F000E9;
	Thu, 27 Aug 2026 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787832817;
	bh=Ykgc8ndVGXjEBJ7yYVL59pOYqTkPieFvOUJ+xVQW7fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FRk9EjmgJKFF3yEZCrXm9NMGv15LbkQthv6KxSsxxgDzFS9JP+vvoB3E2V7xI2u+E
	 MHwYsMlLuYAoX8rh+OwgeOYjmz6odFDNcSO53GMCSFn7PE7oRg4v5NnDpvIEB4GiVH
	 WlCoYbWj9Vmk/K4cwC5wV04hL61Vlt9L3Za9DyiQWY1B8Zgv5eaPoYHVX3dP6+eILv
	 ZjTTiowgbQVX7BocYdrgZTTbP2YdNIb+K9Mr4TDb19DNyYSGlK0ajqDxC/Kl4RWaTn
	 LA6QT+F9W7IKkOORBLLyX75D3DldIrcdvPDyQBg6WUYbvKhzMmkOY1lkS9GYprnsu0
	 qeifi9ctEvhoA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Syed.SabaKareem@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengyu Qu <wiagn@4d2.org>
Cc: wiagn233@outlook.com
In-Reply-To: <20260826172050.15686-1-wiagn@4d2.org>
References: <20260826172050.15686-1-wiagn@4d2.org>
Subject: Re: [PATCH v2] ASoC: amd: acp-config: change quirks to cover all
 ASUS FA401EA variants
Message-Id: <178778615313.88371.7197074338897722219.b4-ty@b4>
Date: Thu, 27 Aug 2026 00:15:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7mJPMTcUzciIsKhxmZgqiqME4lm6eMXGzz36MWvbkLk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqkCntdTbHSKE6dc89PMq1IIlmUXSmsSxv2odqu
 UY95QA72fiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapAp7QAKCRAk1otyXVSH
 0KWTB/42RMzZ1TVtHm9IdZNXaFkSs6uN0/IBwrWtJmcfeehYcAE/e4jKcoAbeF5ZdvYmwRvbKwE
 0J3dF2FGdmxHgxk3fywtIXhy4s8+fboJgMwfHAHGNVCXXhbMfAbWxTZ9mXs9UtOoCskM0oUTMDq
 GHZ21BHa7YVsc21un1BZxZbXWfmUBhuGsqKsfL+KCiXmWL1AizB9tcX7ldPw9TdFpfG2kt5jh6Z
 CS2Wov21ffY2FVE5MdqEJInCbAYyJhLoGZcFlCRTMWeLPY3aRoPw66RJ0QqJRzV7qHo/AmB1nE6
 zz2JhZcDRCXtA0AGwUwTtAnFN9q/n+UR4D1Paxr2VvhyHlUu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 27 Aug 2026 01:20:50 +0800, Shengyu Qu wrote:
> ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants
      https://git.kernel.org/broonie/sound/c/15596a87fcc6

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


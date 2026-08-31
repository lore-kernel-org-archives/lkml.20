Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7E14963C8;
	Tue,  1 Sep 2026 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286840; cv=none; b=R3paPlkWydGK+26uVByxCpWYychnLs+Xr8uc6ayJL3cqiu82a78dOQvYkYjZ6+bXRPRHkvn2aLYlmI5YzVZr3E6OXvJ1PX5dDRlfOoeYIUiHJn3SVo5kp81tdfdjjWsGz19Odc1W5xr5y+SJgBrsNfxR9f2GZ91r7Ul+fyVtJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286840; c=relaxed/simple;
	bh=+cuywiZvMaSDrp7bDiwaW9GjdO8GjGApckjdiFeaADQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fMvjiKkoqH+MCknNFnT/tbSREaKNd16eHQXfJepcgLLlpFWNqXfob7aLbF3lQ1qn4QtDOMt5u+4cSEf8iyLoyZhiLhO8sDVWdwR2RPXipy4sdLR50GWl8MVCpu6HCUdAF840akAvbceQmaTDFEzrUA4o6Tzs5DWS3kKeeGNAo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S537gvZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S537gvZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C28E1F000E9;
	Tue,  1 Sep 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286839;
	bh=ovRM2zLw+k+uBPXtcrOfIyC+qC55B3PAyx5J2jKwbq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=S537gvZ/cK5pOljhyhnRJ8QUFrdsa56XUHwXC/z8i8n+plg+TTUs+96WajXHORfiI
	 6cpz9sPB40cxJh4AbDTytSzzDCzjxiIi7TITBlBgb32w6GdcK0PG91+niNZST43mMh
	 yrvt8QQd0bIaGIYVNFBn0p7rUZ6pgoCJID6sqzILLv+0xoROed0FKJvJmZi45Ze3Hl
	 Iy3seGiKDWAq10AjAQFLn8DU7RdIMcpkgDFNBiNmh0RJTyWBiMGHINvRJptDhHyyaj
	 uyX2ROnVKXKR4AgPWiCGQ/RHFD88n8wyj4P69hCVUXwRjUiKzTWwPrGTnpnjbxWDaC
	 lItBdVtm6uthw==
From: Mark Brown <broonie@kernel.org>
To: Nick Li <nick.li@foursemi.com>, 
 Zain Aboobacker <zainaboobacker33@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824201951.3116-1-zainaboobacker33@gmail.com>
References: <20260824201951.3116-1-zainaboobacker33@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: foursemi,fs2105s: Fix typo
Message-Id: <178821169199.439600.1122507683274859963.b4-ty@b4>
Date: Mon, 31 Aug 2026 22:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+cuywiZvMaSDrp7bDiwaW9GjdO8GjGApckjdiFeaADQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxdzAeyJTMapFdYUDsVou4gsG2RducuuHzzFc
 4Z5ltHAkE2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXcwAKCRAk1otyXVSH
 0APKB/41N0urNu3AasQ9EDTjfRzjRE//fc2uZQqQhoDmJ41r3LapjkVHAF0avNRKXIFkLCGQ+/x
 ynfOeyqqdrem3w0QQ/kZwpllVQZA5JLiojicL1U6rzAwltUwlz/XTX6kHDegSToNzOhBdMa9F+0
 LORlaNJ61gjeiHwfQ3P28bdLgyRdLQnKopg09sFspmi0QG1gSLWo9psUJ00X0TdrwEvxxhDcwQF
 49ewdVU1AIJqYk1olfSp7zVN267jNnEckeFUB9fQCJlRX1iDbqZh0rc/rUsv/waavSiWb1lOVZj
 Qp2F54ve55dYdPG+9yTJtl1CBitlnbF85WXXNrZbKjSnuUG+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 24 Aug 2026 16:19:51 -0400, Zain Aboobacker wrote:
> ASoC: dt-bindings: foursemi,fs2105s: Fix typo

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: foursemi,fs2105s: Fix typo
      https://git.kernel.org/broonie/sound/c/27bb680f9556

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


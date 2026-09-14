Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815949BD91;
	Mon, 14 Sep 2026 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408966; cv=none; b=Lb9MpGKK9kcnTNwtsCbeFQLCaFku/vAtufLpjA8pDabeG2627cULUOoH2e2X0nzmuzOJJxzjTMIuad2lZFTt5CKoxl/3K323IRXSHx7+m2DQbUFAzSfkAEB9l2gjKKtTUJikCPQDIfy+VZBS/8TudmMK+YJV+cKrdXA+hlEZlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408966; c=relaxed/simple;
	bh=bqxP6sc2QEjALXQBKUwOCI9jW/zTvnOiDGBvRDbQu4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M4mLNKvmcdCtQqxtNKjdtCFC81umpfXMw/FZLOiSD23zEuP9nFL3whr5EhPmNiXlKx+rQPVFi8ipqtUG7uWr6KU8SffrzgMlY+j7nqSgRx+6aFwk7eOto5pS6xrMnk3hn4Rf/VboTfSO5uVL5sWcl/2abqwzYJaTTXgLfQc3Q1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABgm8/NN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABgm8/NN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1031F000FF;
	Mon, 14 Sep 2026 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408963;
	bh=nJSCJtj+BjfxnkldKwVIs6Y28B2i4ncWNgyuiA00XQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ABgm8/NNQ1dnJiIaWuOuk9KZ7LDjuy5bTfaz+qsbMV5L+62v22OZn0Z0tQNPenzqF
	 D7+0AGYfs7w2ORUdjD5bh/B/QX/siYnbs91yAXVv4dWwVNArjkH/uab2ZSsTsXEkba
	 shBdbHEjKnYJvIhA3av9piLxcxcuTNSzTHKkXa2leS2ECRNrQUt1Y5syve68UEt/Xo
	 jAILPCYm2B5BB9fzeCnr44kangd1fPhYFcvPAqi6IC79ZItLQ34jSPciSZ2I9prijR
	 hxOzb/8uTn5iOeHf/h2IBVbjW2cbTPQmkj3an9F4R6zIjAP2/a077gytbOZeVManfa
	 qRxu3JhwlKi8A==
From: Mark Brown <broonie@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
References: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
Subject: Re: [PATCH 0/3] regulator: mpq4210: Address the post-merge review
 comments
Message-Id: <178938078782.1239410.8957648663391965889.b4-ty@b4>
Date: Mon, 14 Sep 2026 11:13:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bqxP6sc2QEjALXQBKUwOCI9jW/zTvnOiDGBvRDbQu4M=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqwVZptK5hTWlm5Z4KuyafNdXnNFaQXdQuf5r75+y17tX
 NXQqja5k9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYSOpP9n+KHbzNi3exvGkJ
 e7FK7Iey/I1yXpklVmlcPAGKnf3NvrpTG4pv7pMQOP+l+NPxsykpyolsEtZz37a+sNV7a/hxR/Z
 Fv5M5f/9ncPiF1aXsWH7u9WEJ+8lt2zm38P7w2XDXd112mObuDbbGGix6TfYbZgVUrfzrMOnrly
 Uxk96aqpzvZhTJiDnMKPvFt0I4UkY5qsbi8B/DQpE57a7MjQs+zXW/8vpFl4DQj/SleoZvj6vMS
 GPyds5JfOY9j5Wrwkvynk3VvXa/NbPDm00bApkiRbRMKu8cuT6hrEFevGTqvN/TCpLZW4tbbRUO
 zT6ntqYmVKAvROrDr1NT1aQVs3T9NaPOfrqg+GI2y2onAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 11:40:15 +0000, Tapio Reijonen wrote:
> regulator: mpq4210: Address the post-merge review comments
> 
> The MPQ4210 series was applied to for-7.4 as e3c05a881fc9 and 61879d561e91,
> and two review comments arrived afterwards. Both are addressed here as
> incremental patches against current for-7.4.
> 
> Patches 1 and 2 rename mps,fb-voltage-divider to mps,fb-voltage-divider-ohms,
> as Krzysztof asked. The split across the binding and the driver leaves one
> commit where the two disagree, so they are meant to be applied together. The
> suffix is worth more here than the convention alone: mps,mp886x.yaml already
> describes a property of the same name whose values are kilo ohms rather than
> ohms, so two bindings from the same vendor spelled the resistances
> identically while meaning different units. Nothing in tree uses the old name
> and it has not appeared in a release, so no fallback is kept.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/3] regulator: dt-bindings: mps,mpq4210: Use the -ohms unit suffix
      https://git.kernel.org/broonie/regulator/c/7a145b72280c
[2/3] regulator: mpq4210: Use the -ohms feedback divider property
      https://git.kernel.org/broonie/regulator/c/69bd71e55b71
[3/3] regulator: mpq4210: Drop the mod_devicetable.h include
      https://git.kernel.org/broonie/regulator/c/4cc0c5739ab8

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


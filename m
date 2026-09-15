Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916E73D649F;
	Tue, 15 Sep 2026 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489115; cv=none; b=It6E68aVzQg1fwHj+rpLNrxemgpWBrTHwShd41uFUpt6RPcai0xzdCzkjT+6gG4Sik9s63i7j/mjsc27iSoApCpFs23gvhyqqDQVhF2X3Evlt8t/9CtRhqcxd5kh1oaEVjujhddw3kxr10/1tlugBkSFjcWhIrcdn+YvzcjoP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489115; c=relaxed/simple;
	bh=oIUi5zM0JswPz6Eaohs11M2P2un/qJ0kRTN4e6pVni0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LhJFiQxvLOtrZOUlSaOfadVn0wIm0ObY+g+0c2iQNe1O1cxkfm7yOcbKeetybMIwBJDQSLUZ4/ya+BYJO4KkS4h3VO4FpW/OLejIzWTFuSaucEtn0vf3dkMddt6JWZQQplL+QDhxdXp0hKgBxWiOArviEUulTW/nD3VhdvBhh3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZ4Dsvs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZ4Dsvs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FB01F00893;
	Tue, 15 Sep 2026 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489114;
	bh=+TB+R6nkjojeSDXcGzPReCTji8eSl0H09UInpV+gfgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IZ4Dsvs61xttHUyh5YSntPi4eiJthWO5drMJDoJcC8jMgbdM0pjZgwEp3qeyg4aDu
	 G5XDgAPJD1nEW4uxuZYuRkLlDo4QcZdsMQBXMu3LqE55sEyF1VJ1eTIvpLlOWROpi3
	 OZSIemuY6gPjqM5xkYK0t5rpil8NW+Mv5jK4nzBNGFnBJZwUGcVjpfoBx+PijUm0ac
	 9Fb4gApWEKivJNWrvA9I5tzLEAGvh+ST76LFFVmBuZuwmRioKT3l0EhzpdL2EtFJ/f
	 NPYUtIBlI1pXPyXOEb1+rd94ohKj50MlsSbKh1Jif/ATQFcaJLlUhaplFFyGHh1YyJ
	 k4miBJBwAYfXw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Andrey Starostin <ndrstrstn@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260914131610.46732-1-ndrstrstn@gmail.com>
References: <20260914131610.46732-1-ndrstrstn@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for Acer Extensa 215-23
Message-Id: <178948261574.151760.5544799719130228545.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:30:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oIUi5zM0JswPz6Eaohs11M2P2un/qJ0kRTN4e6pVni0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqW/Wlt7Ao9EO3YRcAy3yWPZB6CnjvThc5HYnZ
 wCfjR8geluJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqlv1gAKCRAk1otyXVSH
 0F1qB/400QBpE6FtyC+5VYrxbjIdvAWkWnky6JTSvdWz4vphMi1qesghUPkdKLfkbJFWEJBxx9v
 DFepqh7CRRf/kdH0HNjFZsubOhu74ZbgQdGDRudt4Cwm0T9zC34q1b6sLy/Fz72eqaXWW6OFDpZ
 g3Q1ZkKvjwr0SWvwGeoORHihiUezJg63ycD764a01rF3+2Irj7bdlj2r099IkNOOlOwuIf3wJUD
 e6CYrMZ1O9U7jcQ1QXsRgb2mh1s2IQVS0T6r80mblweAC9g7jHAFb5uZ8qezVjyKW7+FEElqewW
 sWfrcX66LcVoILWV+h8myhdxBVMMMX50KqmS0CRtGPVPp7Z3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 16:16:10 +0300, Andrey Starostin wrote:
> ASoC: amd: yc: Add DMI entry for Acer Extensa 215-23

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry for Acer Extensa 215-23
      https://git.kernel.org/broonie/sound/c/581289734a6d

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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881A83EB0E3;
	Fri, 25 Sep 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356256; cv=none; b=KbRbVcKbseayIvoeODUK7nds2UXL3WPNmXa/pt27y2A4erdZ1jZ/fGMCxaASxmMvpqD3wyaZBo9oyqw1JR9o6pGShLP8eMOMKWdXrJV6lEmdWBxkiAVRHChReyvNF+muetrFFNUZodpCLEm4+RMiVnDGaJjfJbzcTuRIu5oOrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356256; c=relaxed/simple;
	bh=btAJTGQM17nfINWzcM50CcOirwQ19hxLz8BOtzLcA/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jioYejq1YyrGMWqsKXTdTgklb9Gh5G6+GnbTWzBMBUlpPiSnqPh+dMmHfc+8PeEbpILxUnaTe8YlclyfcHlm36ScRZqANHgxU+e5prsuo3Fl+qDeqkNZ32/fTZgKXJdKQ7evVziEi7mL6NiQzd5W5p0lim6b/K5JThoK09ydi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIC+TS1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIC+TS1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBE51F00893;
	Fri, 25 Sep 2026 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356235;
	bh=ZY+JAmDmWtIQ8nQAOLoeWreSqeSKKZ9GlEGYCiTzBVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lIC+TS1r64GhqZtFkfmCigk1hjosRIX061L6K5cF+BPEwCRYpjdqz4Ln0COS4tOPS
	 94wL7/3xYqFbYeHI87Z8kZfD1UvrnFqJxNz60hux26d0t1TUq9E9uLsGaRRJJStXrp
	 4zRbds65I03aBTW2g/q2PiMln3Js9V7iGbDcnMCjEuOOZ5QoyXByz9K53bvXBt8q8t
	 JrfzR0VSRzK42JJAgmbvvQgyeuYucCfB36XtpIdDADgBLe7V9Bp03bvZev+Gkap+Dy
	 CJ/Fr1jXZcH6ZDtQioEZ3eBQ6k3VvjSiy+EViVUmOgkZCER58IUfh3gyQf9Bpux1r/
	 Ho7EjK6pp9kPA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260924083420.461715-1-peng.fan@oss.nxp.com>
References: <20260924083420.461715-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] ASoC: use regmap_assign_bits() for conditional
 set/clear
Message-Id: <179029244481.149798.12087901953016730058.b4-ty@b4>
Date: Fri, 25 Sep 2026 00:27:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=btAJTGQM17nfINWzcM50CcOirwQ19hxLz8BOtzLcA/4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtqsGQa3KIOzA11v0aMkbM/3taweh3nHNDOqXK
 AAibBZBC0SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCararBgAKCRAk1otyXVSH
 0N4wB/97dJj9Hb3yE5W3Pex5aZp39b0z9qdn81f1AIzfdST/6WhThVQiD4g6s8ASSEuZVonETLW
 y+6NKn2YLYrx4NOLTIkB9C+aPVQnX9DR5ImwcbskduGdmau5yhY6+PoLs8m2/h7WHqCVZbbSWm/
 cofCyi3KOsmAO2IhDSMHqe/7PW+NOyQnsed8VYpyzAgZAT9lhbD3Pmafc7E8iewke8OKw5be+Yi
 OqT/PNwBAIwMCl/SYUAfQD2TS4Frk2LNncRRd8xgw2KcFDMAoS9vxTDMO/yDNHeUa8RtaWLdoyq
 9Efk4Cu4eYqbHcWiXY8ztpQwzngPTY0WjSvF061FZZIzKXw6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 16:34:12 +0800, Peng Fan (OSS) wrote:
> ASoC: use regmap_assign_bits() for conditional set/clear

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: use regmap_assign_bits() for conditional set/clear
      https://git.kernel.org/broonie/sound/c/286ece639c37

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


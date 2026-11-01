Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623278;
	b=KFWYexmVza7ZZP6L4YX6sxQnH9Q7LTi/8pepIQNVHmKa3LQ1YUNnmV0tIQoMvKfv18pO
	 7pPH4q8ToanbqiSmieR7hQKPGUcuBsVL/3BSy9KRrv0jgFNWnJFpDb6ay9NS5pLrTqNx4
	 /fU+Gho9IpBXdhn3vuzc9LC5ecTaNUfVqdl3MxP5OUN4FLDE/HyCq0lhRNZf6MeA5DV3F
	 27fYKmo3jWjEKJ0p4lpS9TP7S+SCPnQUdNBK1aOSaFQF5U3aJd5Mgr5lw2YPnkRM3R4h5
	 mFqmct8TlOEnRNPO9xpAiLp6c+a4BSLv45sJvz+NH/J1wBS67P/s2JGQ52G/XgvRniA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623278;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+Vjb6Gd54FzlLm1au7vNUtFVhC1XMBF7CS18IZRVlSY=;
	b=ydJvU/gG6REdIFBIKVZTvAV0tAmL6jm8I59ksZmDhPizDS1ZrR7vaZchvX+CpuYddikJ
	 35l+AO2NtOHO/OEzVpOh9ko8/85JPEHOsrJgG2DiBgtodDflqr03u8xTlnJF8M7Rby71T
	 byhn8qeKWZGpMMreTKYMz2ICYeq1uYp9vS36EnL9aii3VhJUVsrrzTxhb/zC+kTIBe3uo
	 9Qqi78QC0UxLtYH0QHz0edwlkUp+Wp2T3gcf7cTiwdwNl7jUK5rdl0ZRm8l2Cw1X7OPWr
	 W7aa8i0GISYkupHzdrumEk059nU2SjNuDYHmm1jLI3XTsHHmU5hncJzUxPnCKR9kS4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JzTwVICe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56893606A332;
	Mon,  2 Nov 2026 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JzTwVICe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B871F00A1D;
	Mon,  2 Nov 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623278;
	bh=+Vjb6Gd54FzlLm1au7vNUtFVhC1XMBF7CS18IZRVlSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JzTwVICeKjwBHHIeKK/Uc+SmddID2MCNiEr9kXT8CHtvrGThVuNKiVOAypQBYGpKV
	 CqlTxAjsoL1yA4WBzxh58ZcONJqNMT5nXegXh8FLG7zHyhyujFMqjpd0pKEkZExvwF
	 5J515Sj8hF40osxoOqiTiJ89m3f++eIXwII+X8nlZDxLS0tcL9cWh5o2JYS5i4VojA
	 d4WVGouratxzRMtKGjUBy78uojn4xtXKd9ou/aSAH9UiRC9XoTl1Kgc6K3iZGz2vol
	 FOfX67EbcougsGR5luLNXEYex2dAH+Qopd79FkHmKJ7YjJ8Wfbbv+n4lPVZvTUmxUL
	 0WB4p8k5ICl1w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9E697231036B;
	Mon, 02 Nov 2026 12:41:15 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
References: <20261028114501.2192-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: fix PM ref leak in
 swclk_gate_enable
Message-Id: <179357681408.1716893.5561825001174172891.b4-ty@b4>
Date: Sun, 01 Nov 2026 23:46:54 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Frkpn1r8J7epxPDbbpjHDtgCCdzs3sEi3GmJ7d8zrWI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetDxljOvbO5spsfjU/qudDO/bL/N0zcqWXDKZo8to6
 9Ibp98Fd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiHjUMf2UsXb8ZL13Oeu1/
 xfbeJ/89Qnb6rfL8zsugxRl7/PD0g3sY/ikxfzFoXn1v+mefYz1hM+aknxNqM5w8TSSJ4wTf71T
 RPWwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 19:45:00 +0800, Tang Bin wrote:
> ASoC: codecs: lpass-rx-macro: fix PM ref leak in swclk_gate_enable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: fix PM ref leak in swclk_gate_enable
      https://git.kernel.org/broonie/sound/c/e2df0223ba6d

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


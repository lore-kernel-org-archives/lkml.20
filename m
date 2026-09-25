Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2463CB2FA;
	Fri, 25 Sep 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360632; cv=none; b=V+ZLNFnucK/md9zqo/oASMkOCFodu6IMlSk2qYLQsrSstPR5Ktn22OnyqegilGX8cBwrCTnjP5MCeAOR/T8F0bKwpOrDtu6cXHeQ5cxUWRfgLGeXWq09sDAj0GoRb2/9uqMfipUiR/Wab+8vI2lbZXHIiMhMh57zO0Ch+SKlElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360632; c=relaxed/simple;
	bh=H2E+YAazXimyK9ibWbNnbq9MRsByRukyClerxEgaxTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VtgGx8kcI3wA7GJ6q+4/bRM98SKn3MmTyMt5afwuG3Dz5jTkhxx4AI5k66+mDcmFmXNoiN3tIMyqdJAotnrUWIuQS6JBGUdOgzausnogdhjQJSYjrl/XZ6ugO2XsHXhkuNDp2Zu59NuQl8YjQ4PFQF0xEGjkN2724sW0K5i9WIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djWD8tsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djWD8tsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E37F1F000FF;
	Fri, 25 Sep 2026 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790360630;
	bh=F8lzlAMzxSK1W51YWyM1G6tp1kskzFxGEYhXxBt5ciI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=djWD8tsapMQ6w95RpDmt5dd6nTawfpBIer/u2hXRgW8ey1N8a5zjpBQ8LNBZr/J6d
	 onBlPtMw6YmdfxMLp3PebcddqRbSfIHCWXBQOrKlAZDICUxTdCsCbIAXhEXSxl+eHK
	 s7SKO44aWgaNyB0l+Zjdu8eN3I18zaqVRBaTsOVTXgOLgDNczt1kiTksJEKmpgT0TE
	 VOqgABJogEa/85QrOQFs4pXmSeDU6gh/IfuUrHV39DSps6Tdx01WympQDGwC5L0glT
	 R4XloIONvdeds8Exw0ZZl3DEnMRIiAZX6Kim2bGf7AZKL2iNYTCqLfy7bnX469y6ou
	 wEewbDctTUZow==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925131137.146638-1-arnd@kernel.org>
References: <20260925131137.146638-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: add EFI dependency for selecting
 TAS2783
Message-Id: <179034759252.204944.10852197030838990199.b4-ty@b4>
Date: Fri, 25 Sep 2026 15:46:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H2E+YAazXimyK9ibWbNnbq9MRsByRukyClerxEgaxTU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtrwyiQF3WAjDatD1kdIBoFVWwsXEPMosRuqbr
 mWp/U1RxY2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCara8MgAKCRAk1otyXVSH
 0DF1B/sHQRMdb8besb09GqRJJgNXcOMZGXZsDKdonr8/uvbrhu/h3xjh1A4Ih6Lv44+Jp+rfKtM
 d/Bum1KPECon4tyx9Cwu8ruosb0Y00s95HiG8tPe4UzsZo2S5QJXHB0UW5TfCYQjpRVWb6r1TbG
 1Q3XkQSAQUU/R+jQO7zrfds5euvjdrqH6VzXtMOJ6vn4O6OESPL0iguxGDgq9uym2KhoqWPA6Hk
 rL4Hhr/1I4HiQnNkRyx6Bsb3SwRZKXT1JtE4Yq9JdNHMiM7FkspufqIDFEfktCEL8nstK1CZvKw
 BDddmC5gdyHDKUzqbAEn6FWog5vj0o+HYFOqEqbcQ+bMwVmb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 25 Sep 2026 15:11:27 +0200, Arnd Bergmann wrote:
> ASoC: amd: acp: add EFI dependency for selecting TAS2783

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: add EFI dependency for selecting TAS2783
      https://git.kernel.org/broonie/sound/c/4d2b92b82ee8

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


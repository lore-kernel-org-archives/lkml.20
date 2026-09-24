Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25514485CD7;
	Fri, 25 Sep 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331371; cv=none; b=d427XBU+vewqci2EuJHSBS+HqXbkvXi/H5UGYW45SPrtC8WPtJrC/F+Z/ScxR6NJS3oY28J4Np+Rnhf+llaXR+S1M+oiCcU7AudM3aHx28h5qd0LFz4hunjxo8LJZJKqvQCWJoJWwOC7iS0KgMPNBDDe50flH7/dBpSpNE2n4Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331371; c=relaxed/simple;
	bh=iUO2JpnXzlAInWi8HTqSgcPDVX5U8rPRjdvAHI4MNHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=paVvQDwJJbMuJSNhT1xfQ6XP4ax7DkLt+IxznzCk3AlIVe5iSwkpxgg1jbHXr/vvlee80Xxb3Gqh07kTC2m/wAdbxXjVrmkM4PR+FNXueZjpvPmwh8yw6yuP8iZN+QnJjIBWGcxybAg7tEjXoXmiMcyUULq375C7mTFMAzfhxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvR8IMlB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvR8IMlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7BD1F000FF;
	Fri, 25 Sep 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331369;
	bh=M+vBDpkP85SOhgMfPHtkH9MMpFsUvijVL1VAyC6CrHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fvR8IMlB4je/GfgVEEoXQFbK2Q/DJFuPLuikBHOFtGk9HrrZwvDyBb4DL4oOp5xJw
	 kLNFP+1M5C35wxxe1jPfztcdVes6W8EeKCz83M3cXUvMDg+Sfmj5vvWVKtFWqcJc3W
	 mowmQ482ecFln1yhRn1Id1olv92FWFhugoUV/Fdvs4Pz5V6O38ga8swApzixusZlcI
	 u4JdCxW5eOgiUPfKNqaIxHvPc+YiiiGdQyCqoDvcREO3WebP6gZys7C3SS98iqbp8/
	 Df/0rUd7BhjZye4xzBBubOxpIDl7aZULAwu7qUkV40HEA5zgl3QKPe45xj2GxSE5Gi
	 11Bqe76eEgPsg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, Slavin Liu <bolin.liu@seu.edu.cn>
Cc: festevam@gmail.com, nicoleotsuka@gmail.com, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260913125147.109920-1-bolin.liu@seu.edu.cn>
References: <20260913125147.109920-1-bolin.liu@seu.edu.cn>
Subject: Re: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Message-Id: <179028904061.149798.13069346951239387977.b4-ty@b4>
Date: Thu, 24 Sep 2026 23:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iUO2JpnXzlAInWi8HTqSgcPDVX5U8rPRjdvAHI4MNHA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtknlTqkxgc8EuTdMZ2N0h1vMz/mdcCdJv8Mxt
 n54N7wtw/aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarZJ5QAKCRAk1otyXVSH
 0NK5B/9Zyjl5+h0lBKOOrT5R1v94ccmhe4sOX94NrIq13oUq34jWwSIhp188KV/FCAizYQ5i2mM
 9sqOKCUUvoNa+MRcpYE/ivCDMZLSiMfz8IDhkXoYOE1B4eFQV0+nIuJaVPu6idvcsnuIyO1MGR8
 ke5xroUf/cT7nBKoAQBblSgzhfbMHVwp7wy5mYVkvemnBz2crtgRAb/Yrc+rf1HU7APXlz8oVz9
 Iuy4EolSzeEUHsQ1efj55CWvjxZoqszxKloNkrtYbEo6lSOq0xbzZf8v7maDt8wd1owXOwfp+Xi
 EW0QY0MjAP9/MPWdJp32nN6Z3xWbi83FJmJ/rUNCqLl/cQUO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 20:51:47 +0800, Slavin Liu wrote:
> ASoC: fsl_asrc: check the second front-end DMA channel

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fsl_asrc: check the second front-end DMA channel
      https://git.kernel.org/broonie/sound/c/b4136c0d69ea

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


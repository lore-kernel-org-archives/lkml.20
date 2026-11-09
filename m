Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253432;
	b=UCKe7L/4kn7N4lUitnBRQTWen4Gz+MJ2/IyKTIqX7M+Qy9Gt5LVV4V5C+aEDlwfzgjRZ
	 cg2dr4I22Udgczg1EGN1k/RIFNafU30hBzm1+7WTUCB02pY2opcFwYohh7FolZOG4R+v4
	 v+fpwtu3CiXb7pU+THKsG2kTHxdYc0fbiCCVCRh8LU6SYi0iHSOL5xBz6/OGrueeKbgfJ
	 DEOkLNAe+M95GUo6wWH+A6duSkfUEzXTUiWdX4pp6oqyvc45aM2zUkUv5UdBc0QTQ7UB8
	 4FTlV3axzRxfKKYmEkOIuXE7eAaT/egiNXB2MR32wERYZTsJMaggN2PaWRQE3EXFndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253432;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=82dtHlvq0l4ELnCgcdHwVNzulXvatY26Ghviy9Z4izc=;
	b=eMxoiZR85IjXJOcweP1UT5yM53QG5tl81M0rNjRjrpfMWwwnORVs/HB5lHuhGUndTjkN
	 zP6c6Gv6yFndxMdL1xn+bIoSsXMmdkr/NSw9ZS9vWWzAKPLmlk2aD+EpauZlIG/CI5815
	 hI+FUmM/ekRwi/amjNC3TJlHiLklPmlcfQkaQBoqvSUeop+a2bl4Fth46yD36o0zb+bBK
	 YS+YEmnPk8+dXTnlQxythgBsI7uhz/DheMVZtrY4WNVZ4EspGQKGmtA0MGap/5AicjA/C
	 ioET2I+ImZbB1gdBrPMj6889GNEvYwL9gyopllupfib41A60G4QYuvKAm3Rv0eTo3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ktf0N/Kt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1C606A31C;
	Mon,  9 Nov 2026 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktf0N/Kt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D6D1F0089F;
	Mon,  9 Nov 2026 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253431;
	bh=82dtHlvq0l4ELnCgcdHwVNzulXvatY26Ghviy9Z4izc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ktf0N/Kt83MKPUw/JWZRzBW0X5l2rC1LZmcr6JRb59suawxR/cqNm1UJAxl678PDF
	 n/QH1PZ1Br0l3qaJBg6E/tZH8TD4H5h+oxerLeDBv88jeuMf+LkuPFeap22SruvkPd
	 k8UERJ2nbYbIO/nQ5Y1paDq6gMjz7ZyiqhnXjtsY2LBZq7CzbrG/6RdpLernPQD0zT
	 t67P8awK5nX0WqxZqOUFLgqzRUTO/TuUZXhM5XzdBvd7m6lmICFJOQmBwrJSc2oTxJ
	 QLtA6Kt6w8wyanP3dNkGGxq9GhBYJ+9u8j4mJMf8helyf34fhFcpUORVziWZJLKJd3
	 g1EVg+vuuW2Rw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 200F12FC6BE5;
	Mon, 09 Nov 2026 19:43:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106064408.2224910-1-sammiee5311@gmail.com>
References: <20261106064408.2224910-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420
Message-Id: <179422863326.3711751.7864762434656919974.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:50:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vafu6f8W5wKENjW0piKyE5D1gjwMstC1OTWrHVLaOVs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+KUWcLDx2I+D2n+NpRaVhznEcm8rK1ljFP2medSo1S
 nzXpSusHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIrzkMv1n3z73xQsJCPJFb
 /83XZNFbf2bEKi3TedCU0lgyLcVj3RtGhu21Jn3pkftPzxKqrjeQDCzQeXQyJHHPjTrXJX9XOrC
 EcAEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 15:44:08 +0900, HyeongJun An wrote:
> ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420
      https://git.kernel.org/broonie/sound/c/c1a503972029

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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835567;
	b=eEXdrKvnxdCE60cN/Jh7nNfMau5/yg0bwtdJipOfUTHCDGeneGEaYqHPzzEgyt+ba4GZ
	 G8e5gP3RIgUqoCdAdnnnCafRENTTB0h2K3SVT/79nu035wTsISifv3uBJsnIzOv5inHpw
	 D8wsGR5jP2qKSA/YncWcC2O5fHDgN6yQubHpj4kHWepDC6c32fpoBXRkU9UGPSKDi1qlm
	 vVVBp1OmKaY2KhnPA5Zyvugd+nKeDt9UFHaxnaTE4Kbo7JDwJ5RvJ733Nsk6rCZzbryQe
	 y1GMbi/L6u1VPODGcmj8/5B2AD5CeD3l886cRwKqiYe4hwb2M38szaKU9PdPStooUog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835567;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wV1uJInLusVv585fK3kDQzS6tz7tXCsUgiPuQYP+aoI=;
	b=RvtAnhURiArEEWES03cGm9IVaFKsTJXGlmSzZCiSeUnuFmEK2dZyfnX85GNBR20AINBq
	 yXVgXmO53VpOclQ+8idQF5kpyv7MDIqeuM8UTC7mjXb0g4Rx2w5KN9tr5edhV128PdEDE
	 dW2yNfxpMQv0OjX2lpXfCfAWP2yt/xa6f241MztYBxMt8+C76EsCzFhJEbssFbh7J7WmT
	 7fLyXTof4HgR45lYhA9Pj9WU1MAkQO/X7FAN4/ENPs5ZNWetCnBe+1z0b76AsZE2lkucc
	 kB0SK+FpqmhLEywAJmGJKjarLnt+oQ0A3vAB+ImLDrpguDr+vukquEit1Me+9/6W/qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kdw1orWb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC70606A334;
	Wed,  4 Nov 2026 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kdw1orWb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC7D1F00A16;
	Wed,  4 Nov 2026 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835567;
	bh=wV1uJInLusVv585fK3kDQzS6tz7tXCsUgiPuQYP+aoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Kdw1orWb5PLTRwwIhdL9XEJmjzHpIlqXwc/Nzd4TE6dnadg/L8wZyz7PfBp3xsgZz
	 SrPsYbk8VCvcZLKuLUpCLK6TjWoQ64L0aQkkOQ9PEhdG76ERb0S8UCCl5C6IBPabV4
	 R6jy0tGasvtnPcWSiV+CQWn+FSHEQIgbBbzYQqJPq6jx6KZeyDvwykZuD7X0A7H5Km
	 hs7ekAr4ktTGeHXrcZcWtgGeQipI4GR0lJkZiywPpTv+zcSrxSIsAIMOkNoegObIl9
	 ehj+ybnciS2V0c3L7o0tc129Oec5sYDXMqg4HgmGhlMoQrn4tAG4WvF4upd9ViBYmt
	 8u9sesVEs9tvQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 20A2926926D3;
	Wed, 04 Nov 2026 23:39:25 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261104152402.1153795-1-rf@opensource.cirrus.com>
References: <20261104152402.1153795-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Fix memory leak on cs_dsp_power_up()
 error path
Message-Id: <179382036950.2456854.5834583890748599492.b4-ty@b4>
Date: Wed, 04 Nov 2026 19:26:09 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6oFp6tmzvlDfpw9hW2ryT6vUdG1gUdtcbcRU6kM0MDU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeH9Kt0X8o+P/rm0Pe/A1Vaa0vv6kLaAf/X3om7OZqi
 a/f15ot6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEFosy/DP4/sql/oHHwhtW
 FS7/znacXm8jMnvq7w2tF/qmN31MLGFmZJjOuk+tTPH1JjveHxsfuNm8C3OweMHeWy15P4Dr9/4
 1ajwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 15:24:02 +0000, Richard Fitzgerald wrote:
> firmware: cs_dsp: Fix memory leak on cs_dsp_power_up() error path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] firmware: cs_dsp: Fix memory leak on cs_dsp_power_up() error path
      https://git.kernel.org/broonie/sound/c/39d31f76ad1b

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


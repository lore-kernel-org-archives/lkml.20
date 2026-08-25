Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690440A937;
	Wed, 26 Aug 2026 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778280; cv=none; b=CTT3QZiIRHAV8NSHsgydDUeuxyl/SPB0AEcaaorr9HQygQWrABEgapFRmx5/IROZ3yKvBviCSAbKPC6gBxTjr1t1VEqVl+Y1uSpbtPWeO9BrtHVEvVaLNXoo5cwL9gK3Ks7htja16XAmfpZJNdtyNgzORZ2GBruHwQFqvuwzK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778280; c=relaxed/simple;
	bh=8pX5EpiMfRMhSwybbFyJuVanr/yscJsG8zRoRaYcAN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fZvyTiGTTK3T1honflkKksdaxRuNIyiosxLuL8KephhEitOXJk/TagNLnP8Dw2WOez7pILNlt359L+4mPLRrCT5KKXmuhrlQLq6btNAVFMkpFEPR5Yz+zzhXxXopARr8fnIdJTbjomcgOv9O7Kpfb8koWHEpiYpB/JwPjy+TB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJXPhzdR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJXPhzdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F261F000E9;
	Wed, 26 Aug 2026 21:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787778279;
	bh=BHdfHPHiq6xXKgEPBrbOZfsPUsBNMKy7WgNu/YPX0RY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fJXPhzdRztopjFv3mfYyIHYBpTOcRzHnsWPfk/Mz36/YYZrxd4Me6Fsfrl+PKQxg1
	 slSIMZp7etyae2Riu1/KdX37zP8i4WE4hk+EYvxrGViI80iY9uK9h44qz1be0Fxz5Z
	 kFTryZQppEcjNuzdQKktiKfq4hGUtk/CKYEtbgnqjyBT5BSlLhGnKvdHuFR06NFTS2
	 qJ5hPM1RV+mC5aPV41bEQAKAcQ3Ae3t/0AdpOCnG39RP6ZS8TSsnFCi1ZwWHkhj9jP
	 WOH3WEvNgU5oFDVkmxSyJEekEYWgU8lTKt9N/MlbHx992M2/o/B2Jz0jzYLzqsm3pW
	 KuCc7FH6tg++g==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824130302.553419-1-zhangheng@kylinos.cn>
References: <20260824130302.553419-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for Alienware m18 R1 AMD
Message-Id: <178766549824.119896.14686543944727424611.b4-ty@b4>
Date: Tue, 25 Aug 2026 14:44:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8pX5EpiMfRMhSwybbFyJuVanr/yscJsG8zRoRaYcAN4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqj1Tj8AEw7YHT2WgOboD07MXqoxEh0om++6DI7
 bwug7MB796JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao9U4wAKCRAk1otyXVSH
 0FcXB/9j2NXtDZcjIBeEacZA44RoGF6R+4p28d2u+tQmnSeU6DTO5WDDiDS1uZ8xXc3TktvAUOh
 t6hEgDVCiK0i/RyI9FD0GFM8K/18EzswO752tlRxmXcLA0nqk3f1CU74PFl+Wu9TyfRCFd9lPWC
 NXrZwskkQgerDorewlTUb2bobnZb20dKMZIhEE9pMoiY+o7mhQZxu0baTjqQwCDHYA71kRgaJg0
 Sh/yKES3i9wv4Vdt1uOX01D8uIvIbQrCMksSWOY5zG7ntY3eB8FcOgteasXR1jeH8i3jHUbv/u4
 9XOY1xGgdkn9Upgsva+cX6w15Pyw+TuzCEVsdNR+ih/SBoGu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 24 Aug 2026 21:03:02 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI entry for Alienware m18 R1 AMD

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry for Alienware m18 R1 AMD
      https://git.kernel.org/broonie/sound/c/fd8ed52ecea6

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


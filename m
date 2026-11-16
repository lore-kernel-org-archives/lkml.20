Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871011;
	b=UVSN8JnYcDn6AEAmvTZWEMKy+ZkPFDIPcx+oBxwXiQhB7WWx7dGL8BDsHnnzutmwn2uh
	 AY7NUyRxf4TbyNSAbM9CE39fWMkudaW6UTcAgHh1utaGd1JxeFljsXR4Iq8b2LeknR9Ea
	 OOcs/XZPazT8cF9ehv5CrcYPd95aUFtIVFo3Bjg1JLoiSoMpVHdtT2hN08Gbc7IryL3Wz
	 NjubM2ltcun/mIi1sIimD/ePQspzMbsna7oxY3XEi9aSE8Kmyv7wCFuHgUyOUP2vGEsbz
	 IWJwMO4j2dWYmtj5de19KhFmvutm9+py/Eq2fDqTYsUHgwXml2Lk+gxuqY4ryYNLkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871011;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=D744codKNdjWB0cIKo4OC/V775hatd/33THb99xe3yY=;
	b=JOZNuuzUPZaqfwdVdbzAn1XKj8dargVtp7nogQwla0HjQbb1ymxBDOThXol59UTBUvIs
	 hhholf7JxdE2zLQyDG4dGb1vDeW6Cd0P+LQtOGU5TrimOvJsnyo+7BEEIahllAdtv7+oi
	 YOKq5di1uF7CRGvPU9fMBybnQsOSsHiOr9IqjGtCFA/lJ32OIzOd+mobo4ww3ri05TNBM
	 7jO5QGR4wq5yHM+u4uh6jG9e8Jr27V29LlicI7xf9qPMC025GYOFq8ZVBk4xPYLeFWPQe
	 FquYAOVnITN7bVTWE1mpuil4YPpbg0p7NnDuLDOZ+e0Q9Q3OeRgN6k2lanDEp3ZivgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IZ/dM1u6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90240606A31C;
	Mon, 16 Nov 2026 23:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZ/dM1u6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43E11F000C4;
	Mon, 16 Nov 2026 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871011;
	bh=D744codKNdjWB0cIKo4OC/V775hatd/33THb99xe3yY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IZ/dM1u68/w4ysDuF2c/9CTIYBd8/rFn5rCBuddDvWtSTc4jm3uO+TCFPOfimXYSz
	 t8JmCxAfr+W425w+VYBo9mBMQMa/YxwMecLbewFm6yXjEZp+OAjE5TlqPKwTE8nc8K
	 +gkYfojo8Jk+EN8F2g01KQ8p8kyXahhMagLjnu401xUHol7LTWXQ8cjPuGg8cF3QKv
	 K9ast/IxtW9TP+dTJ5mp1g6c0Q3YuVPr80OKJlP5VfYwqzZgnwL78gks74c2qSO3s0
	 J/i9DphSXgS62lUxieCZv/CS1km+yTO6GNrBDVt4ndV2QIPzVvG/zbemvxwFbFpndZ
	 o3Uf7zZ1pyuFA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when
 spinlock is held
Message-Id: <179485994155.2504946.8052884083469699014.b4-ty@b4>
Date: Mon, 16 Nov 2026 20:12:21 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YoWPz3fhDSUGPyw/AXIX0PwVKHHA0Y9uh1d/YQgfCLQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+993bumy3uZLDM+M/qUWzL133LQhcMW93+QKdmB1TF
 i7eJL74XUcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAm4iDC8FfmtI6mlqnJ1wX7
 Z01zdc73m8ehtmeF0TS9Fb33LhxLPVrC8N8n8ECJcFeYUdvV2R0zrzWoheWauH9dt2bpb6nn9Xm
 rZJkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 14:56:34 +0100, Valerio Setti wrote:
> ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
      https://git.kernel.org/broonie/sound/c/0d40a91ca56e

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


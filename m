Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767236;
	b=3CYA64HNbD9qfJRjvIMI8cELOBMW47crH7DapFV7GCxbPdKWGxg6okcx3MR0C8V0kZnw
	 r7fWAootES0ta71+KQbarEJIQkCFPSBchSEdsBS+baDZunz+xPbaIEevTaocGW+upw1KC
	 DfwaOUb8L06qxY5UpizDOUKc0gs4b1cLM15nJRHkpkZYU1PncqljIamyeBqwXoV6emAkQ
	 gYrBBmS83klNLQMwP5WV8U4NttwnJZTqzSAY6NgchZZHwlkJvB2cj1sZf2VP3RIomw8nu
	 oiUeiJq03rrlVHlvokolUG05gavHnBUx3PW7OjU+pdTEoV7FstHGZUIUUP1RMKpp5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767236;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4v9kEdXT9EbKxbjfyQTCBXpQmQO0tv1S0oBUI2ZRadY=;
	b=Vzi/5i8vOCxS2FKJB2hbGYKgRf1a7rmYgZi1RR6VIaShjeYpDDc8/Qgsdklnz2ivf77L
	 jcsLqdTSTvxCpjdZhiT9/MxJA3ww8BtbxAshKPWI+wt2cqOGCRWaWDToSQNF+nKQ3zfLR
	 k9urju0yBycEHKQxzZMnwWpIx03B/RQMV/GrjnsKZU/7lS/KDsQZtildZxu+CbfjJNugn
	 KK5gLA7o5PXH6TIf5DXMcEfRMJT3nBsugPZ1PjeIm5GDeW171is8SJoPOwfozv9AhIYzv
	 g/zuFhpcDAl/oC0yOKU7dWIrmyrwVcppi/ccArKzIlT7sKNuOF/wF4UbVYvN88hEGpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hs2wFkU6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2B606A323;
	Sun, 15 Nov 2026 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hs2wFkU6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6721F000C4;
	Sun, 15 Nov 2026 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767236;
	bh=4v9kEdXT9EbKxbjfyQTCBXpQmQO0tv1S0oBUI2ZRadY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Hs2wFkU62DxMVcVeVK/hAY2ufoadWt+Durtr+oAEZEZAHVRiIPzUn8lVsPDt5Gn6A
	 LCjm667oyvLp/6VsY85AeLD12M/krbIKIgKoosrrjyCH8Bs+p2meRhASbg+kMC2cvM
	 QzOEgYrkeLy0x/CLwV2gYxtqqx1ssQUFYhJbA8s+gu69qB0zN2CezYt1IxGO1LmOcQ
	 ChvTkCD2Egs8VWSW4BrQHtHenMBDdDB7z4bhmmoqPKGANygD0zgisrIdYkxydir576
	 UAuL+0VtHWziRhbhZ1qJB9384CqIX5ydm0HVaLZ2YWAeT6u2+v9nTXAYzi/wxW+YGW
	 95lD+ddDCxnWw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 4E20633D38DA;
	Sun, 15 Nov 2026 18:27:01 +0000 (GMT)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/22] Add speaker and headset jack support for
 Apple Silicon Macs
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>, Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
Date: Sun, 15 Nov 2026 18:27:00 +0000
Message-Id: <179476722024.140154.15587190322612964079.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ytHYPz0XriWoB7CgG8WB4aH/P5ex9L4TMTkLssWLVm4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+/iz9N/mHi728XsdGBVdR5aNnVf4dbTT4IdmRdP2n0
 KttyacyOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRD6wM/9S72z3mLK8tSzx9
 4NSkAKUV6/Z/7dTSuuv6b3nhkq3KnrMZ/uk++dB/R291D1tVuZfLHucp3HoXysLSk7c6Jx4XL/4
 swAwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Hi folks,
> 
> This series adds the machine driver and related bindings for the
> primary audio subsystem on Apple Silicon Macs. The macaudio
> machine driver is based on an RFC sent many years ago
> by Martin Povišer[1]. 

This needs a rebase against current code.

-- 
Mark Brown <broonie@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705302;
	b=M4NgpwtM4SV20GeaIXhsaL+rL9APNhljv2Mf7qfbthvsOniKiS/zxXXWCaIkiD0Kgkhk
	 ntIHi4fs05xs7q8Y3oAX+mTiUJSdesbOujOLQNwjzyhp4e4U7tgro7x3yChDuym4vmuhD
	 /6PgP2dF9YKTPcKdkPpCzvrVnQ7pHCFsdfeqo23m0/s3nQMB35stEjKy7rsaZoFLkC1x8
	 MaSQcprVCS1Q+zKPZ4QXSjJyLsYbKp/C/8gL96w0HYvD+B+mCb7m0O7SoA5fsmfJ/2E5x
	 PyxH2AtsmvB/KlyW5c/i3WrrURuiRO9vlFHRt6ODiYmIxv3cwq4NM16/KbNGoto6A7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705302;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Ctv6f6SPElMhe03wcDM2NsTs2B3j+mv3yU1Rvb6aEl0=;
	b=ZZPG2fVSZqgj2XPuXwv+8DmQVZFPL+yzGFg6TcnPlIJvrM2RtNmZZVKRjzAJ5rCyoBdW
	 SwCV0w5VPWOdVgRsWYfKsncC8+ixDaIz24l1Msl4lFFKg5lZeaQC6F27VxtMbG3QVIN35
	 XzfCDqS+n/qU6JgPoyfP4NpX2TzzeIzs/SpJsRNUVB5Wa47Pq5PpoeEq6vX3E0f6OaNCU
	 nFPwTc9ajz0WDTu16yf+0h07HLJyRCT1nWyghj9lgena+W45XSJeAoS8KXJ+sMXr/M1lt
	 reWL3c2YphGo3jDQlk+S24a7uciH1NfQSfLZBWOFsVT2tMSrZLPM0gQeJLjgKQOIo6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXBVepxK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B7606A327;
	Tue,  3 Nov 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXBVepxK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3051F000C1;
	Tue,  3 Nov 2026 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705302;
	bh=Ctv6f6SPElMhe03wcDM2NsTs2B3j+mv3yU1Rvb6aEl0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lXBVepxKUlrdhOHQ9zaFYCcP1FS6y2kyxKS+Nc5ooTKvn3liz+8svzcHQ4eVA3fs2
	 txT1a2uDPAeILfad+kD6fLPL2QIa9R43kntzYhlcsiegdG/Ai86731xY8/5VUuUXkt
	 9kFo9QiGiEoP0sWWq80TpDco6yRjkGtcbmp5h5G+knWKuxwmS+DUqKyYREYr4YPgrg
	 tM3o9bSmie7qwAjMSImrm9xxZy4mrrxkg5yNsR9VKaiZAmHPLMuBbdEOjg3wVcVLoy
	 1jFRxvTMw4hMuxW/yBskGZtHT0bwmS94jU9yr7Rra8leAJyJZYSIfDMTHsZ2j+b95M
	 SwbIJP+/ugnew==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 60A56253A242;
	Tue, 03 Nov 2026 11:28:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] Fix GPR callback registration race during
 probe
Message-Id: <179365911191.2186205.9914776732628687068.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:38:31 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m2aDQPzER18ibzNvHD75KyV8HotyrnIqXniH6Onb+p4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeHg3Z27Xqj1p5+tIFMrwrv0j+Dd0uYThF+If5dIVl5
 o6e16uFO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR7DJGhmsLv8jE/Tie/5vp
 9Jfd/T4XSrZ6XdvUHMvHPrVQ5LyDfzAjw0NDn83zJdi3/JXQ3JpYnn9UKUh9mvJKOy/bFw17YuP
 KGAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 22 Oct 2026 20:11:28 +0530, Mohit Sharma wrote:
> Fix GPR callback registration race during probe
> 
> GPR service drivers can issue synchronous commands directly from their
> probe callbacks or indirectly while populating child devices. The GPR
> bus currently publishes the service callback only after the client probe
> returns. Consequently, a DSP response received during probe cannot be
> dispatched and the command times out.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: qcom: q6apm: Guard callbacks until probe data is ready
      https://git.kernel.org/broonie/sound/c/ef7062864c05

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


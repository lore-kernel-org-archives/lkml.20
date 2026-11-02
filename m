Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628544;
	b=gI7ws9Tq13aHo3Cz2vA03stpj+tN81eh2zEnfW5hYoCcCi/vZEDz7qSSqyJTSsjARDtR
	 xoghBfADMSVPNsMBtYmcrTvwyHdHijwBgWExMB4ASau2sSwxPxq8xPRzZnFtsv84Xj5Pr
	 eN2KjsfeH9Z2N8Pa90IO3ifYKy0xyZ3dIwymL7ws4Wu721Y7xO8DPRuNvaxANeu3Q1I3J
	 zAxayTTleW7TiP3N/kzCe115QeBJ6fzBeOdMn+s7FrfQxR+GIMIsEWLukzEW8/g97ud95
	 +eSo2JqG7cxl6jz6+OjvSq4kFP5ADFIFoSVTYW1ehB3u0vFb/PaUw1znQSM0BmHMOrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628544;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=b+3qEqV6PP1N+bahRHZFZzZptyewcuh/Bsmjmgo9eKs=;
	b=QBQk2OFW85Y662XzWOefwL0fYPekJLwZROHRdzkEidkp64VMosP1yK4kpjk1mpjsjnXL
	 1F6/Z9B80JPu7O9L9IUwsCWLGpgXuCaXYOoiGf+5vNTYIVphoOXRxr3Z0xZjLXtqDHm/9
	 53mxRX0/gtlVKbrdj1EvhD6iRWyqWFmDTyaJY2c4ZsLENKc1vHmVQtD1uHGQsj5bMNq6o
	 qUk8gGwxSgQT5H8z+IfOrv3XffN9GKHq4CH/7361o7pE/IGv75HzQ2ZNyGRyEO263ZRzV
	 o64rDYip7MPxvKY2ggjGLeVKCeTwUjzI9VGjND7yBnEAy0F4FxUlOlFugqlRP043+ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iXDy/hwl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A1606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXDy/hwl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72B71F00A16;
	Mon,  2 Nov 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628543;
	bh=b+3qEqV6PP1N+bahRHZFZzZptyewcuh/Bsmjmgo9eKs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iXDy/hwlb6Q8s+YF8z977KRi6+7a0fH89M0oWcgtvqjaStqofshzCo+Fs5efNIsvK
	 5n02OSsnCArB1GcaGc6BbIpLNEw4kM5aQwARtZwk+RVm93t5/9G2HjYAyUdr86A84I
	 OGSdY7386i8WDrv0zzO7XeMtweO0mjapcjjnjccdNSSRZwNcTu3cEYM7aQu2Pqt73G
	 84QtAUl9Ran2E6IzCD1ExBTZueH6T/Q2trSiyuUUd0sPAmnYJsThFeco4CYgwoguzk
	 fAT2atJKaVLUVlkDfl5dNZIV7YHW7Md3BQ2SCgJCmqcEj46QzHeIr7Vl1Ir6wTD5UB
	 5wryxtYdWCOig==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261013182221.11963-1-kaloz@kernel.org>
References: <20261013182221.11963-1-kaloz@kernel.org>
Subject: Re: [PATCH] w1: add a scheduling point to the slave search
Message-Id: <179362854259.191254.14004117673693007425.b4-ty@b4>
Date: Mon, 02 Nov 2026 15:09:02 +0100
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
X-Mailer: b4 0.16.0


On Tue, 13 Oct 2026 20:22:21 +0200, Imre Kaloz wrote:
> sgi_w1 busy-waits through each time slot and has no triplet operation,
> so one 64-bit search pass holds the CPU for more than 20 ms. Without
> full preemption that delays every task woken meanwhile on a single CPU,
> enough to underrun an audio ring while the bus is searched.
> 
> Call cond_resched() once per triplet.
> 
> [...]

Applied, thanks!

[1/1] w1: add a scheduling point to the slave search
      https://git.kernel.org/krzk/linux-w1/c/3ade61837e8e61420e37edb818abc9a6199fec6a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


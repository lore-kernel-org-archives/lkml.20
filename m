Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169487;
	b=PcY8fkbXa3tiAPww/w1UyZyHvdA2+4tDBKj9k6I4jqgJmBgopQMa8ikS6LECMU6shKJE
	 ykNefz8dQzIYEgwJtouBpapRG/HwiJSsvOeLrnQJbc+23DfPqQKSCh/AOnUmEKKxR4zkJ
	 3XLk80l3Ntb/z0Hj4K5wFXwlX3i14HUYZdBN/ColCmKaqAA+M6PxG7CrqmViktZuT9hjo
	 3fUXdUOr0Tcw6KLak1uzW3EoDSxRwrEv9HEpGtNzxQNrzzZ8Wvnfg8UVJ0DTDFLfN5Nx0
	 Y012VPKheXO5Nnn9wWAtZzYYr4PsRBufP+eU7KESxXFicCe9dRorDvZ/Q7+3zhtonsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169487;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VtNdIhmL272RDcJm5riI8cPLLEdSVlWAJRPHhTfsZWg=;
	b=n1nqVDZCM4zDQaqnpu8k5YDCYWfl8UH1uO1XB7y+CpVNXDoe8ATNrutJM9wjwm0J/GPs
	 sSI02L+FTgz78ZST7jjbMCBkyLvz+Az6EGTrHRjvjAVFVUGcvrM7KalMC59GEZZ173oUP
	 OyYOf7CmL8rwL+LE8iEFqyowTPgM3KK5CST/sUlzYBo8ThTwQLrpS9lkifgjw9Iv/W2ax
	 VjFsBPiLv7/8gglL9OhST55nrDmuqsJCLuokxV6icDQJobHija6ycuML5DsGYdxhmuNj6
	 j0tRB8QEbW3UfU6IZ7TRTdcVpNTZu+Ar2PM94KymZtvOY3o4xUsc3i2ANUKxxOwncQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SylSCJRa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5568360A6F74;
	Sun,  8 Nov 2026 20:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SylSCJRa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B561F008A3;
	Sun,  8 Nov 2026 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169486;
	bh=VtNdIhmL272RDcJm5riI8cPLLEdSVlWAJRPHhTfsZWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SylSCJRakI3orl0IHUeHJQnyLHdLEl+r5NeOJY49Jyg0EaM5FH3WinQfinHrf5Yk2
	 /4iGvX5kU0ZBF3PVB6qMWXoVhhaH2eTnKLYNsLUgs0BK7PU8Mq+OaOqfcbsQT2ZHpx
	 HzJLituPYQb8nwm3+9UNVEXQd50Zz0A6ykC5dp0ANzZLutv2PreR21bgGZgQUr9E/o
	 It/kLXhoCF/lvXrQTI/z48lgngTdh/8rSRsm0E5QhaSIe2MQ4zVcnA4GoF3fjsDkyu
	 qeRIDAFzJz7a42aGUfC6SoiW758sJmawbEztCxGy4rt8X8R14x+tDbdb7nQbmBva8Q
	 I99jN89iO1BYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Shujath Mohd <shujath@outlook.in>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI and IPA
Date: Sun,  8 Nov 2026 14:21:15 -0600
Message-ID: <179416929237.628393.6934614690624200929.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
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


On Thu, 10 Sep 2026 09:35:08 +0530, Shujath Mohd wrote:
> Enable the modem, SLPI and IPA subsystems on Sony Xperia TAMA
> devices and provide the corresponding firmware paths.
> 
> The modem requires ta-service for initialization:
> https://github.com/andersson/ta-service
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI and IPA
      commit: 21158e4e168c02eee659de9fae4c490892060869

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

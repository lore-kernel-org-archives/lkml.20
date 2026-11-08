Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169450;
	b=vE5Tq9SS4PoONlLkuD21h+c6An64fzjoFxH6Nlxd9NfDH9ylfcnRE4Fwsy5KBjZrw7xm
	 jMqkFPCTcdcOwlSFzKcOSjQ1+tvVtHSeQnQdE11WgDPAAbMRhk4yDgCixkA1IavBCH3kE
	 i9sB2Qcc9Rgs1uGDhO1IebdQB+N9dX1q35xc7x0IMtbGQVVVPw9DZWUyqe4TJe46RjFfm
	 gkYeMiAeZgS+bUdVcra4ui6MH3silj+bi+ukunK8wFPDk2INCBc02hac1kfgYs1yCOFEb
	 bOG/fjVqtVIY0uc5g7exQ1tNsvi6l9145GXEQdVfJqDaNAm5nBidyzM7CNvwNS+ldcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169450;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DOkuGSYX7az1iSHCoVCPOdIABXdrfT561STZnCj2quw=;
	b=WTixgLhR4KhzoOo1/yo2MfAKZfHDsa7Hxo5M1d8q/yQXSZXssAbLEbu/xap7we/JEPqy
	 2RQ4UBvmtTHJDAtbrnYfe6oeqJ7fulOkhSMCibP9+dsLyk/h4ZjbnxFLm4AaOe/xIxtaO
	 Su+bkshgl83Ql2CazEXu6S4A+tXCqIlpkWgE6px+zSJvIuV0Abd/hye1PsgI3KEP3K71t
	 9xdvzk4sCc7zcLyp2Ps3zGL1NAjthZFWIaJOEk8Q3wjM6aLM0s0wAfHr7OW6d/X6pJduv
	 rqmlHO2uZiZos//lgiV9w37ddfPzuLdSqL74dNmVTWnfNNN94P/DToj8XHrEyik/JKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYCQnkiY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879636078010;
	Sun,  8 Nov 2026 20:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYCQnkiY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FA01F00923;
	Sun,  8 Nov 2026 20:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169450;
	bh=DOkuGSYX7az1iSHCoVCPOdIABXdrfT561STZnCj2quw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EYCQnkiYL+M1rraqWfE+/hMFJToKFBDYHIGc7l5FzVs5XlWt2Poc2dBanDjC1m0Fl
	 KnsW4rGkBI2OmK9TTF3CAC/hfQ7S5vEEsEJntXgvV7bhY8esuUAAzCCpJSCuKiJuvh
	 ELnvqZS6TUT3SlUoGvw/REKh5xprb4EeK4gaRLvWMXMOHIb7vPxrP7A25w4y/KtaB2
	 +OPSenq6EqFCThN5n+QjvNW15GQF21pwiXaZP9cm9v90nH0EfmZchJH/BCe+b7LsnS
	 2qJuDYOjCbBz/94XNDUwAlnXomZ0dK83rP2df+cSZQeaokQJc5PV8vtdi3GzsAYwKn
	 PZBxXIOVF90NA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: qcom: shikra: Enable audio on EVK boards
Date: Sun,  8 Nov 2026 14:20:47 -0600
Message-ID: <179416929477.628393.5736814085032983289.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
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


On Mon, 26 Oct 2026 17:14:28 +0530, Mohammad Rafi Shaik wrote:
> This series enables the Shikra audio path on EVK targets by adding the QAIF
> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
> board-level sound card wiring for CQM, CQS and IQS variants.
> 
> Shikra EVK variants use different audio components and processing
> architectures:
> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>   PM4125 + Rouleur codec components.
> - CQS uses modem-DSP based audio processing.
> - IQS uses a third-party MAX98091 codec with modem-DSP support.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
      commit: 65039c993039ba7903b01a1b08ae78889da0d719
[2/7] arm64: dts: qcom: shikra: Add gpr node
      commit: 388834e31ed2170756c26321620f38b61a9d657d
[3/7] arm64: dts: qcom: shikra: Add soundwire and macro nodes
      (no commit info)
[4/7] arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
      (no commit info)
[5/7] arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
      (no commit info)
[6/7] arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
      (no commit info)
[7/7] arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers
      commit: 6f769d4e24a6b8280edbd0da410183e39f33c25c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169458;
	b=Apl35qP1GH825CUYD3+/37k8pwZRBVv45bFldQao/s78JhK65hF5lBzknBA/jz1w0ZPl
	 FUUkVhEGl+6Xq9wU+5Fxx/0LQMPzm+TbhrpDT5xBKuindJWmCbppmnwCBByxPM+v9b7RU
	 0CD6FLIfjo9J32LwNo5QFXc4s4A28Ryxxzg0kmL9qt/0fy41H5TpRXaC5ZEOE8D6x0BoA
	 LIYNmkQJ0EzTGtqzMeVd22AcJ5ZtAPnIBcGyAnaakk92EO0mW+Fdc0DJCixUFQEguWnPX
	 LNBkLZtDSnm+FEF8oAKOHBPsJ/D0gDG8aJTLIy4AlpH9dOJW+EZedQM8NCtebUYsHiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169458;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=knsOuQxv7z99zN/nJ0HIhzuTCBqbTWFDFKW1SjAZuZs=;
	b=kaeAmqSeD/EiWpHJD27f+vfulYoCdUJDbzNie8+nXEokWbZ8UD0o6t8iA6XvgNfXMS/W
	 53hj2p8Y8MW2XHTE/MNI7K6joZ2sN98HQGYFTmbSY9iD157BxbCo04S7QHNuL1Z63KIYy
	 D2Bv5fHX4aeHXw+TEHbEfm4zrQNEykZHUfDjxL9SpADgIJB2P7A6o4gWZOIUjvZuaNpxo
	 0kFWCSwMIFuswner7177GTO4MDao6A8bOIK7cOczpaqcJ+jgz/5ovqiRGi9tmTwYRKpKU
	 i/XmpUICIf9U932F/HfcBDtGaZj4c1GV/ViacRKwsXDzUsfBxKr6yESt5Nn2dCwBLKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cy862oaQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4FD6078AAC;
	Sun,  8 Nov 2026 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cy862oaQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DB91F008A7;
	Sun,  8 Nov 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169457;
	bh=knsOuQxv7z99zN/nJ0HIhzuTCBqbTWFDFKW1SjAZuZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cy862oaQh2lmv155w7/OG65SVVO5XDSgAgwLsZxx7z7dAVSED2hpZcdiaYvMNDvmu
	 YvM91WN43UmRzjZWe9WkeBW+ojd/uG3jyn/iDMhNrHU1LThjcE2HW7pib5/7rVxx++
	 TitZ7dKS4Y3eBpRWxX8Ms7p0UET+vMfSn//tXAjouPsxZLgKzuVm8rYL6OfFbY0ueO
	 RaaZygHKOuZHu7QJZnRLnpXuhzFQyPnFnvkytm0mbnyj3aKhQCk5BuBDwfUB5DCbFf
	 leFjH+0NXOF2vQ2BGwF1rOBbsqR8nlijtyBvRCBgcSHJCeelptGH7JC5Clo5DSeZ3o
	 w/3swHXE1Fj9w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] arm64: qcom: dts: Add display support for Qualcomm Shikra
Date: Sun,  8 Nov 2026 14:20:53 -0600
Message-ID: <179416929287.628393.5571647288691112633.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
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


On Wed, 30 Sep 2026 16:45:10 +0530, Nabige Aala wrote:
> This series adds display support for the Qualcomm Shikra platform.
> 
> It introduces the Qualcomm Shikra MDSS display subsystem support
> at the SoC level, and enables display on the Qualcomm Shikra CQS
> EVK and CQM EVK boards with the required DSI panel nodes.
> 
> Dependencies:
> https://lore.kernel.org/all/20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
      commit: 2aac58ae1dcb80a0eac632c268f1b3462f150fe7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

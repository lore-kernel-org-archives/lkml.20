Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285312;
	b=tRrcsjnVPCHJXxtGKwzm7dLjpdvIkuSGnMPA3V/XssnlMXLn2ZKSTo+U+DZW4iaeocU/
	 4WwQECaFPuoMZUNh39kzKS0yC6oWP858xU3G7mf+lpvAp9HbtBgKUtsN6fjo+Zyd58slV
	 c+VJi5Vyt4fzfMhTKd1pi30nFcqXFAojjWAJe4R0KXmGTQevGOVdRzG2Eldc4tefZOmzg
	 1aIVlyy5+FCS+ve4CjB/XofZxpXke49QeNDprr951Zzm6UdE/62hRaIjACcDGvhS9mD24
	 26bD8A1jPlxElVGOzSIV3L1NyAbhyRfUYZm4heWvctcQmBs24mBjUqoJZi9KTiBibaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285312;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/3NXahwG9rYFR45RPGHoLrUQ6PoSRiAulDYnegs2J9Q=;
	b=D9y04/fUd5DSiSj03EzgR5ZjJyiauzCfVJRtooJFnyt+I/EP33Xa2yN1J4eruFGI9jo0
	 bmAyrLDBwuFRHk+4v4JWigPYoRiIx1Z+KDbjVfilX8L5aOUn6a2VAlgF1mGDRwmhbiza1
	 sXeuqidHb+FR9IhR5m0ASNLIO4Gqe9c4djBrsBZmbSIU1WKeZUHjJCu6gHHiWEOVxAeR+
	 YX/gCtlCv6A5TS+FNzH8Fy61KGDfbfQv8mL7O7/y0a5IrIVGUjfRoYaw3/JIET7V7zztg
	 LHv7Hgj27MmH+X+wT2tW8tJ8YOXSAPmJ7xtvBstsSh+pFKyePjBkAY37VlKGIFMtn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hV4MVI00;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD07606DE9A;
	Tue, 10 Nov 2026 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hV4MVI00
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFF71F008A5;
	Tue, 10 Nov 2026 04:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285311;
	bh=/3NXahwG9rYFR45RPGHoLrUQ6PoSRiAulDYnegs2J9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hV4MVI00CVqmynZNPevLOOzYoqok+v5uo3wDMPdSEuVTg9pU60GL8jIBlxZnDGpPS
	 17j3StEIAsaybKDQxWLn+7WZjZQhiKjNlkiAYVpkom6RWUDL7hJ2iv38VmmFX/KMdS
	 eHHOdr4LYX4uzdli9qk+gYjuEq526NgVRsiTz/PpJyG18dbu4YsbwXis135ukKf4/p
	 lEai2DpeeuNcFGK56H3rBUx9M6bXnL5Sp8L76zLMLPmv6Ew1BltWjk27mOKyAyMpUn
	 MybO95h2bAD7s96JHfH8Zs2L8Wzj4Pnab7jcj+TPy3bZThaMpzTGMVwMF5Kp81w/8L
	 X+JSqP/kYXYHg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/3] ASoC: qcom: allow SM[456]50 HDK board to play audio via I2S
Date: Mon,  9 Nov 2026 22:34:52 -0600
Message-ID: <179428529338.1061455.1619866756274375415.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
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


On Mon, 31 Aug 2026 11:13:18 +0200, Neil Armstrong wrote:
> Following [1], this adds the necessary settings to setup
> the I2S link to the HDMI bridge to allow audio playback.
> 
> All dependencies are merged v7.3-rc1
> 
> [1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      commit: 84feb53ed8a80aa274b030f37e602db03611c304

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

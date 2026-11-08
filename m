Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169350;
	b=HJvFyWD58kJwWntSwb+sIqpX085yz4LsW92vNtI+N2PeZBCk8/1ioXJZ85jGpVTp2Js8
	 rYSVq71h8CVgbAzSig9gmFSrGBQ+NYPx1j+ONLwS5bU9DBpq02ULc6bpO5ZeUEdWAZLCN
	 kCFJUKtQcsIeemzyFbUxT1eYSqht0ptaASdZfYk5GYuGl+x21FpPfhW0lpXTsksdHYzS7
	 5f3zGVolwpmaRc02FDc/mYN3OGV8VWB2nTmqspLBMb8ombGlin0iuOiey090yiU8rHAs2
	 RNz9ZOEMxh17qx1mBYSvaOMDFKCB3iB1xXHPPnLchrmO7z25NqNfIXISJ067LoysvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169350;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dHdYsBVn5EwkVJiTWyMdC7gQBzoWk+m6qQYWiebvhEA=;
	b=zKbvdk2/MfXtfRoaZT7cZhFq6g4Hmju7R69M2Qn/XvMHr15WWQZHn3fjMdUV41NBthJM
	 A7pQwJb8w4YtGB5T64vIFjjmY19IpIq6SbgEXk6PCM8tMZRKhLXWhwWsBPGVS8496x4QC
	 BrS0nz/UAEmlGEsLRNq1pcZVOtzffU6AmKuMypDH4UNE0VbfbnARrtUf5TNtu7ac2lZ8a
	 j4oZI1B3gaJTHXOUMss3xCPvNM4cZ+BbXnkiqMu41MRaEnpqAisPpPGbQfznMRGckKECf
	 HqbY+k5P+g4jAViaeKu2GYPmcQbNWCXueTUQFxfrA5Dn5cONqqwhOo5QpD0Lme3dWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJ21zVlf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA11606D82E;
	Sun,  8 Nov 2026 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJ21zVlf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DAB1F00902;
	Sun,  8 Nov 2026 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169349;
	bh=dHdYsBVn5EwkVJiTWyMdC7gQBzoWk+m6qQYWiebvhEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kJ21zVlfsZWS0WWICPhzWR/inXw5n+56R2zhCGieWuLz43B4zdamCwtO/3L4i7fsd
	 cVhEC7o88YTW+3+Pkgx8xwMNx7Vx7MDe2g+YB/SHJPIm95oTQN+JUqeiFy6RFgkE5O
	 pQtcizX8PdpoZc9f5o3SfKoQBZZkQH459rhKJzfJB9xupVFJkWj3SzH9hMChHcwP0Z
	 JbLguFcvvfF6N6iX816vQilhUzoRXvtU1Hk2sY36dUTRupIIJhuRPstRSP6Wm906Uy
	 ogEilB4+kTRO3FrCiDyZX9Gobz+zvwDjB4Id2hM0o79UhICYnt7LPrirRUB9YefXM8
	 XKxLNIEi5EU0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
Date: Sun,  8 Nov 2026 14:19:37 -0600
Message-ID: <179416929457.628393.10726172922960756911.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
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


On Wed, 21 Oct 2026 17:15:02 +0530, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

Applied, thanks!

[1/1] arm64: dts: qcom: hawi: Add memory-region for audio PD
      commit: e60f4ae23a488c745301311f29dd41da69c3920e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

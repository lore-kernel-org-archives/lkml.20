Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169504;
	b=YeP6neH2QBKAlpSrDuXxoANJUI/2n/qFKaCB2XN6f6NFqoUxopb7MscTxH+AgPgou5DG
	 jih2yZ9ZVsJfyAu4nd4fOMZOvDVn13vtxvTpkSs+Laehd7siGyKbXcRTjttTToXIkJfal
	 o2kP0pCia33a9a3/Fw5hJ3mFmiCr6g8nmHEj5oJGyU8PKG9Vj8wvkcaybFk/SI/T8ZmKP
	 Vl/S2sa1P7l0uudodL3SnO+W61XvRi0Uz/zKXzYtPGqr1xOQi54oGblrMw8Cmqjj0skuG
	 2N+hKaPBA6LIMEIPX2j/g5esMD6s+KrKvxaIrBKQepGBN11Kh3/NsDjj/MQdDPSzdGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169504;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fBDoa8c79e/xFCczEDSjXYKOrR/DyHcADjVxK/XT/98=;
	b=JGBejh00SEXhOVlfCj0lLDhwzKUqOVV6ELZALtbxxH1eVcmMObDoQgMRcY4kxeZZKs6K
	 6Ko2TjcMBFsrv0oizGrCLKUuk9x8G1BjqMBlFOF2fLmbn7Wdqa1zJ9SDemBYrCW4Q9PuS
	 ztbxbQNyW5ocrRHUsAKmNTaADmfT/fKNmDdQWnCUTXBYQY2x5PpeWNzlFTYuqW735q2Tn
	 bwz+0M0zlDYrOFj2P2keVGDwRuGfECAK/hIKQBt6Y+2BgRGUOgmFR1nMYplR5I5EeYu4q
	 S49lu8S76PnipDsBnepAR91aOsmosdFHYsHCTQNa60oX/51N5+rB3ftyN3Ut698vC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HowTKSs9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B2606A9FC;
	Sun,  8 Nov 2026 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HowTKSs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3159A1F00900;
	Sun,  8 Nov 2026 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169504;
	bh=fBDoa8c79e/xFCczEDSjXYKOrR/DyHcADjVxK/XT/98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HowTKSs94GjB8ZCNa1h3ocarUueWIrzDoIb0c2NwbFSdAO6lAwpXD2NRceteoWxER
	 crhGuO0GqVO9XVsBFXzcMtx92U3tfH1Bl2z+rVJda8t3wxKPPPUGBqopjs7CUT8eyJ
	 GuDlsPjk/Faxut097KfG+TpC39UWBMjz5D1H3ZKhInMMgfMiNCl4q6uZR7QD826RCA
	 1Nr93pAOY/nHDKe/fqH8lqH5H8i1/7U8RzN9uWOiu5E4Fj1+1BdpAYUhvOczMw8gfA
	 Bi4pf7yjVUs6feUGdSy+TwJtg7R8lRnG/BycW4ml2SzS7kxRNG8Mk/5TW0YNnbTGuD
	 Hbm7lQ0HpMw1A==
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Enable soundcard on Motorola Edge 30
Date: Sun,  8 Nov 2026 14:21:27 -0600
Message-ID: <179416929399.628393.2387253236708275253.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016073157.611956-1-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
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


On Fri, 16 Oct 2026 04:31:48 -0300, Val Packett wrote:
> This series enables sound support on motorola-dubai, at least the
> speakers.. The WCD that handles microphones and analog USB-C sound
> is left out because it would first need:
> https://lore.kernel.org/all/20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com/
> 
> The senary MI2S patches were previously part of:
> https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: motorola-dubai: Add sound card with aw88261 speakers
      commit: ba44607caa70c16a6c36d1616b669b853ffd518e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

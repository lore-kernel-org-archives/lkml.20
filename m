Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169459;
	b=FL/VV26vH323JXY4psOXcwGhB0Iw5w3dLUldCBqCSmKYY236nT47gOSrOhFEfkEf+VlQ
	 FMF5292GCqzjBUCJM51Jh+VVbCjppxMxtFjjAFq1OyCmHPuLH182LsdyIxuyb1qXm+uTE
	 Gad3VotD+Z93vMIGpg5UyXcQbBHhYFb0+oM4qlQ6Td7wyqPLU74ZBN5rO4RexT7tegvIo
	 Q9QkTY7kWA6o9XS+YrYzIwI8tGrlPev3RPw4U2YCbiKUiGYXPNHz3dkx5HCEFFl++3mp+
	 EwwG/aJlm8q8+yJN/N2Zf94RtDM6Lkg7zJV5QNpqV8/5ocnpt2m46OLzNBGFzB4Kd2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169459;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h3Kq5qUeUCpcAu5DdBtBQ8U0uXGTAuLnHch1xohNHlM=;
	b=srYdG2Bxp8bhibUejTOx8vWMSZz8ghI51XmdLY/K/HmOlLjPCEwF9NOmstnIi4GAhZea
	 Zix0V54o0xBJfHa1/hQocdzHlUlVpJ7Lmbm4d0wLSgERBPEYf/PlEQumDQNSM27TwZBSd
	 nnEIv5QCqMkDz0gNpt/Z0cmtVfLEoy4cbT5mMCE2QwcDogJUwx4i6FM5Atqn71EYLf3xu
	 J6cu/HBC7Awy9Ynl5tynrGIss1XRQ2o4OoeaWPVrh2BC1el/mN8avSalkr/AG7g5Psauv
	 SNhF+iUm0aB0fl02Z78W29l+yV7hD9AF3Mnv72yeXnGhOFV/QjvK3QWZFdoCbITih1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbAwqr3P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491E60A3825;
	Sun,  8 Nov 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbAwqr3P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E9A1F0089F;
	Sun,  8 Nov 2026 20:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169459;
	bh=h3Kq5qUeUCpcAu5DdBtBQ8U0uXGTAuLnHch1xohNHlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IbAwqr3PEovStbnJytO3JeRx2tGBnvPg3Z6h65oBjzCCk1Ow1nErIzmikc0e2k9I3
	 LSuA9LhV2miAdroUlZYaIBL8CVPTk9GAWRjbFSPyDcqxW224QjToebF8tLLOykEfQf
	 bqFTmGYkrjNmo83e4Uobjllo+AWdIyNB3e0IiCWQFk0N/z0NTCo6WlFj91BPlV+Jf3
	 sDFWz+GFJ6jLBvmfkRnwSjDSbP70PnCJ3jFsk3Dy4oK+o2+EZHNy7/76aZMYqqCC6J
	 Jr8ubBfooifZjVJ+lXWVBY9wE8tT4D0rqaokRppINu5cwugkYY3vChpYnI0KMyYScQ
	 8RCTAYdEiqFRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
Date: Sun,  8 Nov 2026 14:20:54 -0600
Message-ID: <179416929573.628393.15031676743197932343.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
References: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
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


On Wed, 04 Nov 2026 20:41:49 +0100, Nizat Mikayilli wrote:
> The cpufreq LUT on the Samsung Galaxy Tab S9 Wi-Fi has a 3.36GHz boost
> entry for CPU7 without a matching OPP, so the frequency is dropped:
> 
> cpu cpu7: Voltage update failed freq=3360000
> cpu cpu7: failed to update OPP for freq=3360000
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
      commit: 2fd7a169faf3a87cdc22a15bf55fb00cb621a522

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

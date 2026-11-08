Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169468;
	b=JHYgHzOPbaVbBLxreNYku+rPY4QbjngG8RQ/w80rEGQaYevedZ+AoIvvlAaiGWwO4c4c
	 C5NlYR0pSAeDrZAgcO9eRDSFkg4JBoeFzM3TmM86RYwLPzSz9mDTuBFM0B4eB2mGY/e2W
	 E8PwRNrcU4Rm1T4/AxNPTNFJtKT+ai4+G9ZsMdd2NOkFZ7q5lb6LS+V3c/dY2Zo7qqxwD
	 MneFsg4BA0+tbBC4Uj7cSSgIKV8cj7VHM5KV1uWLCTjYeECa5tzK9my0f+OBHExpoo0v9
	 j9fY8VHO0ITUXW5ekuNUzinsaQ3m7lKecyJGB+6SA8Sru5O8UYqBdEknbWrOu0dUoLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169468;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=M02SiQqr6L1QN3inZJdBPTD7subEIlSZCr76hhFAvS4=;
	b=hEP5r99pRigda77XnF3S9/VH+FHua7XI7kE1PNhGiMzkD3AIi2ZQX2K1lsSCPQiZYL21
	 K1UkQ7poGHq0yw4KSIg2p/DMdl6jJOSsJVD1uWgJkfkBWvFtVDz4fWuj+fMNbLvRqBQjs
	 pA54sNPTbNeb/A8qr6fmJoq8WHb8MOGevgTX45BGmQQ5mTgl5ie5B2NzW8iRDkEWZBzq1
	 vNoiHhd0wpcAJWYiD0dZLrje1xwSvzUqu1biz3kwmCqcPqMwNaP1uKr7H5ihIU3QKprxM
	 /h4IEAgt3WQX1VMuDl4RHwQJeyNMWg1fimfFltAH9D440hDq/LjYws7WbSQKoXDerPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iw/memjQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B521606E017;
	Sun,  8 Nov 2026 20:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iw/memjQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7F01F0089F;
	Sun,  8 Nov 2026 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169467;
	bh=M02SiQqr6L1QN3inZJdBPTD7subEIlSZCr76hhFAvS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iw/memjQMiAT020EfWBxLxheTgPWmniNul6Ftg3ruwtRpdwj2hWJCa1W8KXqK90Ro
	 +B8hHo/t94hQTioG46vMR4+GQhYbfjcZaYqTOqWe2P/bRgazqKZchOSNbx+Dtj15AS
	 NjyDXaQ6FjY8rrAeKHpoM2XbZr8Kjq3Ri/xxj04GtX9w0VFNwEz5+h/nUEtAWl9SAn
	 cb0Ppl2gnfHDagaUHySmZKdOkIXe5TSY6UyjbGrWQr1MGH1eDrp8ENvzKiEJRaRaJd
	 /R+rClm2yDiCsMecjVv3aD4tZaQx2rNybEvjgnyJ6OSmZZQTpsICu1+mIA93f5HhWa
	 hPttayDQ6VXzw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Pablo del Arco <pablodelarco1@gmail.com>
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for monaco-arduino-monza
Date: Sun,  8 Nov 2026 14:21:01 -0600
Message-ID: <179416929324.628393.3949635695718160748.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004101849.34191-1-pablodelarco1@gmail.com>
References: <20261004101849.34191-1-pablodelarco1@gmail.com>
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


On Sun, 04 Oct 2026 12:18:49 +0200, Pablo del Arco wrote:
> Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
> from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
> for the Monaco EVK.
> 
> The board boots under Gunyah by default. This DTB lets it run Linux at EL2
> with KVM when the boot firmware is set up for that.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: Add EL2 overlay for monaco-arduino-monza
      commit: 288c04d58f3cb8178540661d10ef95798170f545

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

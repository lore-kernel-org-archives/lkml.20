Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5D47C10D;
	Tue, 29 Sep 2026 03:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651803; cv=none; b=VgS8u83jarhGVrrjhL+X69OznjEgEYx4TJPz1ylWKzJ7YkxIEzdZzQNVm0aAMQb2Z5TO8YqD92DnKyywo1lkFLNCTjyLTJ/CZtZcCXk/xyP1guPomp+/ShPFdhQIEZAHnhRHlsEkxhKeVyP0F43jdnXS9SmPbDi3aawq967L2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651803; c=relaxed/simple;
	bh=6tN5CEVYj5jBG2vniOsVB8Cm7Tg7pM78+QF8p60M8yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilEFsbyLaKhJ4ASBsVpqHCf0Z2ILPP5OcOK1d1U/PN5shI9NyP3vGqU1L0R9zayUruT34o2n3TxwVZfnj7z788yDY8oaVGQKqkqoHp7+L5PoRtY4fIVByvDcKzATrCFJBw5SyH5SmpJD7uIFjfcqaq+yEOt2SNanR8t+XtKCNxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8hiC7kH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8hiC7kH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066041F0089C;
	Tue, 29 Sep 2026 03:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651797;
	bh=SAk50/VMByDkZzHloQEIJCabHtI3km5qzVF0xD1kP8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W8hiC7kHRZPTq451dGwHfhIQvVuJ9Xa83o/w+kwfrcLqK3m4/niSe8yjF6rPwZkEj
	 l/6IZfio+TFTj+6hav7yF9n0W69+BWAEZt3Chj1U32vY+zzUQHETxigJHukMC0nmon
	 DWAB+CJn1yc1j3EIF8yALhJHe6iw3RYjLO6Y/7Kf9UNG4Rc+/xtOrRfNTVspxsKZco
	 6vwGK+3k1U8wx+H2B2XMBS0KRyDC8F5EF4OONrMaDcltGOCAmTWJH6uOkMDZu/+T66
	 Q6u+J7gfQyipmtWLJo2TE3zQGENO3KkMdYbem6R7DoPY6LCfgb85Y6sK4Jm/GOML/8
	 YmeZnebqkZ/+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Mon, 28 Sep 2026 22:15:23 -0500
Message-ID: <179065170913.2673486.7478996186995916391.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 19:20:08 -0500, Aaron Kling wrote:
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: Add AYN Thor
      commit: ac99695769bab4d9e21b0458e0f7b0c2165fe2de

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

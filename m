Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425C48F842;
	Mon, 31 Aug 2026 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198854; cv=none; b=MgaByGgvGySlHHtz1hdwJA5AyJXCVvgM6AdaXj1Z5fQRN8A5szTrBuagDRNH5stJoqW9l2f6vOQ8hNjJza9XqXyrJqbxJPy7b8oGjnkqY6mLiLjxvSU/X9wWw1ddpjd3GBlsxJE9/DgiFnbhYbdJhhkZ6ELo9VDoGR9lIvC8hHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198854; c=relaxed/simple;
	bh=am3KNQERca/hGM7f2VX74+QK9QKUJrfXnQmeym38r90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lhdYIdbSn6n/YONKqTMopxkdTvMP43kq4ZjoqZoWss25LjuRRWbFJnhVu6JGTlRiFC2hcxSxE/gQCdVZ1dz78DXoFtSuqiqmIaD0zpYo9Wekv8s707OfkCcjygdAmDbDmnaQvFF7RyeYa3P3xVsf26mhT3w3kKQnvw6hxKv2/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsfQ1Ocn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsfQ1Ocn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890201F00A3E;
	Mon, 31 Aug 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198853;
	bh=3KMsbgd6yA3Pq06vblKLEI5yu1lLh395SyJcRfbks0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gsfQ1OcnPZNoU1VcKOsePG8E5kMDU2cmrRtTstJz5JZqHGsbUliLn99pCkP0stxG3
	 1OR5G43HuQw9Qsg+2JpW88wp+sbubcuicRQwL7ELz/udg6Kyqvwo16HqxJ4v1CS4Qq
	 RiKu8Siqz0omopZEZr59tCk0AihsFOypeLu/aIeGTrwa8gRaYkTxMF5c63YzoKbj49
	 k2LFftXKm4K3zQJMFHqv0Pt/6UIabOTYDSr5UgsWEp04dzk/rkQaBXJDXmUzrn4eID
	 tLFvmbylCBWqbyI3YH5S2X1MMbMTTGyc2h6D3Fd5lbDEVTQPzc0KTweg8OzYr8sWB9
	 hfhOZs4XqZexg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard
Date: Mon, 31 Aug 2026 12:53:42 -0500
Message-ID: <178819882962.1411250.4180599647063575185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
References: <20260731-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v1-1-0528ff6ffe38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Jul 2026 14:36:49 +0200, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
> of the WSA speakers on the WSA2 port only makes it is incompatible
> with the default SM8650 generic sound card.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard
      commit: 42c21ec175d45bf0df1a4a93da6f23039f3ed485

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

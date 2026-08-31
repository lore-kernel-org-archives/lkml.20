Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C919490BEB;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198855; cv=none; b=g4iwhk71mzbrQVgIeVJxYEo6a7kpeUDYssoGamSUyQXAbxrJpf0dYZjjiy7RHwTpsydRQA91mr+A+NWnnR610zI6nE3KwgayivrMAiWeERcggFgLRTevMEJtFX//awGfdjZ5DM1lko8W1RXtwZiaUp7TUL6H0B4crl2OZmTfDYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198855; c=relaxed/simple;
	bh=82pjp5+Ega2O0uNZMawgHlJvRS7MMHzb/8Gbs3IT6vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B87eva9FB4nY7hrGJr6Yefo8igxVXNdCWGg1pe+VTC3urSPPy+kv/6P/iNhmdDsM6hR/h+btSnJMNmtr4tTfr+fR3Z1dlvZLwUZ3bNQfqkKn+he2iExOKV9oASnPURDe6fZuOBQ4H/YDJaZBoTilH2xPi4FBFtOrhU1mC2YtJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUy5aE0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUy5aE0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A36E1F00A3D;
	Mon, 31 Aug 2026 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198854;
	bh=eVYgz0lcvZV0bA6eCZsoUiO5bq+S6kQI7vE9iC/PHI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iUy5aE0sqP92ahZYOgmHB5DPNyg7pR+pq30dygkxlGiheSnecbQf1wYPiIkaU9KYn
	 D6iHtpGGGKXJXhpgGZbyTF+ovAWA5LqOakBhfVPHNH0pXpZKu1aa6ZVTtyYcWwMaDu
	 sUNkgsw7VlBr3o2OrbvlkNFmwKAQyDmcYBoidLEvTBPkeuoDsY/zBvXe5idUcb88rG
	 CSXDUexAmp8BsEiarifz4Gp6prcVIsh98Drp78UliVbEy1pAWpbmcSa9/ghEWSmkPp
	 Y5yM9mNabrjzvehCOYWE/JR2hdmrBjtlLSN91XDKjreTT9f0QmqcdbWnW+HRguSLc8
	 EHI+AxCGUhPLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard
Date: Mon, 31 Aug 2026 12:53:43 -0500
Message-ID: <178819882965.1411250.10881741114592289394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 10:29:37 +0200, Neil Armstrong wrote:
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

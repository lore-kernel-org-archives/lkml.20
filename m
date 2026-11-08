Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169430;
	b=5p2i9XUhASRfwKDwdiSOSB4si58db/wVqPHifEIVkJBBsfiCzVCS5kfFfIWx0hhFK6nX
	 b12EuUGjxj79lGBm9URSEIIm4uYz5uibyRDBbwjpATrxGjPIQvPZX9hyK073Nny3OwlGo
	 Jgntf9d0d88cOmornz7xAyyR23PHD0KOSa902qrsrSU1wruf5CX6AhwxB9w6DklZAE77S
	 BAUM4O9VQeyzjJyJ1AlX7gUHKVaU4HAkkTYKTsykJNOtjiv/WKnYxTPJ6AFj6C6RYl9Xa
	 wvHiRxJ/R5yZqbWohTcM+ku/2m0TdwGK2OnlIhl0HWvP/PMu8Dhe8Kf+gLksTrXoJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169430;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=M34d7hbyVKsSsKy8if3xrijnsuTanm9CoUgNloPwrSs=;
	b=a0dTMwnA7BDHvcRKBWf8klmrr0rcQqPGcKCFwekLjPj/LVbFY7RUZs1k65E16ezn6qKZ
	 tbbiLRp7AHhnJ8U9Zwd23uLczJ7Tex9He2NgtTPP5vgb9qVJO92hE7RJ6gYZwQrL/8CKY
	 bzNi7DdIZ2tY0h/5C1nDLG1dXuOdjKXpgtvBpxGU7npaVCXXlSPnua09fqOUW8el7/snX
	 RijVE8eSqHp6sfPdIwqQXl6aGRFbfZmx6LlQmTDZX3ZNogB++y1oyQAAUKPTpnb1qw6kK
	 sV+fAJU/32Jw0jPzumT8mgUIX81pWZ95XDUBbvsqdTOs4ImcGjf0Zah0RrZtZ2ezBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMCPOgS3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAD60746A3;
	Sun,  8 Nov 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMCPOgS3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7A61F008A1;
	Sun,  8 Nov 2026 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169429;
	bh=M34d7hbyVKsSsKy8if3xrijnsuTanm9CoUgNloPwrSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VMCPOgS3hbYFL7/2ctUaD8itpj9JiSofs1iOCwTxvOYef7brxv5iS14G9Blsol31f
	 q+jVuZWkBeoHypLvGs/AfMAFXMrWBwmvV7cTJjDddDwdcKNmynIqXHJ7+nK+2hKgfS
	 K/G27v3+C9sOI06L8Jas2mc0BfC0e32hGKG7O4Gyb3fRbMBom+Iz16Rw42mA32JtA4
	 VXCTjEoh6BL2WlZLfATT/rNGXTEXvidyuChKxcNl8ynpY/HK+//SDBznp/EhE5+ELP
	 Io0nYMCkow4nkuWUz+0kyC+27kKMivElQ3lsoQRVNIHH3v5iMg99WHOR51MUFCVuCy
	 WidXP7EqoLVSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio link
Date: Sun,  8 Nov 2026 14:20:31 -0600
Message-ID: <179416929339.628393.9787673686309085886.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
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


On Fri, 09 Oct 2026 11:04:04 +0800, Le Qi wrote:
> The DP2 DAI link is missing from the sound card definition, preventing
> audio playback over the third DisplayPort interface.
> 
> Add the required codec, CPU, and platform DAI configuration to enable
> audio playback over DP2.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio link
      commit: 043111daa4900b601a777d8575b938368a36b5c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

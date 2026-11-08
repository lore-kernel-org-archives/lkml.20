Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169333;
	b=LCCHAkJOWND8lecEyBtZtc0+026bEMsY8IeDBIp0ql0birrUcv6I6GoyLPmCNANASiJq
	 xvS0GACklqd+cLXi02NL5/iz7S7eFAw1Iv9lrHQ/otlWA8eUDZgbTx0vCFkl7EyYsc9f6
	 73TCGdsKscgIPBtlkLUhadE9NUjwfxJ44sDsY892viDfXTh8grm6fp8LNlectMOWv+RBR
	 UlC7imFB+OiiAC2COkShSsQHJDGSwA6oso+/yExaf7De5kTpZTJqpNpMwa3p7Z9I8+4tp
	 HazypT06kSpp4PnyyQJNOCXzlTF7qC3GyFXQkMagMwnnN6u0m1pLGlUI9yni0TehYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169333;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ThUnCMLTdWbOUbhvSRp73yiZV8kdFhxkHbsG27oSbso=;
	b=iKOKz9+AGQ1EZpEl60wQF7Ay+itkaYhk2z+i3FUQKpIfvqHDMxAKL2Z/MhMDq9Zm9CGt
	 D+ScW/sIEqNHym5Mdi2Uhhgj55qoH/okT8cSPCeyS2XXSxFbttqZRhwTWt3XyMEvwv33+
	 S44vi9vwmqjVIDE4fgpHg/K1rGJaDUIpXpi7OeuxnQTl7ujop+NPmXviN7i1QH7pO5EtN
	 4RxZTGsYCaMirpHG+cvFRxUYw1phihc+UumICMJgK7uSA50YiK/sA7vvFnqL35+0QQpxh
	 Ts9PuhdI56DuHiAQbFlMxmLO/jPgZW8O0t9hIW6Vl06om3K/XEonQkoQNr/K0LR9E9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htnzI+do;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887A606D801;
	Sun,  8 Nov 2026 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htnzI+do
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2483A1F008BE;
	Sun,  8 Nov 2026 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169333;
	bh=ThUnCMLTdWbOUbhvSRp73yiZV8kdFhxkHbsG27oSbso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htnzI+doboP8bZ+n2MxXeFeuhJfzmAxjTf3VgoXVl2y+zIz7qUzsDvMYEXMTkyfS+
	 QndEpFClutCLaVyqiwriR4KlnPHOMl3xAljLN9hUWfrtnL+F4LWPjwpcSpe3w+YrWz
	 zszfeDxzQD5Wfe2nPNCq1IafpoGLq/de5aqklCW+1T+S2M/0nVZh4mc4UPVtFYtuFz
	 RNE/T/rBCz+Ge52LPX1UpD7Y6ANFqOxDGd2887BdBwarzMGo2/JrDohg9JHkq4j/ut
	 U+79MHJdSw0GE+NN7H8GKBHQaj9Y4ScNdbwe32KUd5VvQJo3l3wzYMnkqHbfws5Ue7
	 MJIlLMRBJPARg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Haipeng Lin <jimmie.lin@gmail.com>
Subject: Re: [PATCH 0/2] Backlight fixes for X1-based Surface Pro 11
Date: Sun,  8 Nov 2026 14:19:27 -0600
Message-ID: <179416929416.628393.6374210428119516635.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
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


On Sat, 17 Oct 2026 18:52:24 +0100, Dale Whinham wrote:
> The LCD variant of the Surface Pro 11 has had no working backlight
> control since the device was added. Its DT took the panel description
> from the OLED model, where pmc8380_3 gpio4 is the panel enable line.
> On the LCD model, gpio4 enables the backlight instead, and brightness
> is a PWM output from the PMK8550 LPG on gpio5. The supply is enabled
> by pmc8380_3 gpio10. This is the same arrangement as the ThinkPad T14s
> LCD and the Surface Laptop 7.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1-denali: Add missing pinctrl for eDP HPD
      commit: 2a9f7dd326116f10f6c4be60cadfc7293c2eab74
[2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for LCD
      commit: 28184d5a3698d125bee804aafa638ce38a033c88

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

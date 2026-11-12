Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482418;
	b=dbrC2YBYCdbDKJ4T7j6AXZZCTNxiNr35t7/2dmFFYWqsukW0TV+PZ87DmXY17KMcAs2B
	 88D+10aqBMjGQ5fjPOaQ16cGVgMF+Heirw/hl0gD7CEEnBHyI9LXaWsmJs6Lo6Iy3fNld
	 KqzyRQeaxmnw8U2dOIWF5mxnnens706GSD9oWJwM2ofngjCbJdLdYGL+0Q05xjxj1bNHM
	 +5hthxfYOlpYSbc1MD7GbX9/GUfixzVhh/J9GZI0Gr4fqYF+7r9e9iVWQqtVxG0Y/5qsM
	 cTcA66NABczHUO0twYol9eKAgRKOcD/MwWdhDucpIZrdV34yaU6i3kmu/G6GNEY20ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482418;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=BXzZFv1rViA+t/kvS8iAtCAtd1WIdvaY0MOKVvctdWU=;
	b=v/pGTjrd6ijRqDX6AFEiDTP2KP5sR51od34N6u6enZeeq+N4nz6JNEWw2GOWWOu9d2O7
	 C2BppIcguy23Y2QK7HYNM15Jyf9XGcrZ0t4cgITXdbCc0ff+dIExCG+xmIQwrnhZe47Cy
	 W5wImy1MBp84POptq7Wtnyzf0Tao+jYJCVh8mv925o6jOtN9vuq6as22jRBKb1q2D47Ry
	 1Ts0WhkHAJgTpVmfsyG0s8Er5DrM4xgSsstV4KRIyDz9ZmWEu9+WyYah/qSkM5qxv8Jpd
	 eLfkpMN5cTBzuVtGkEjuljscwWVK0CR2NVSNgDEuj4bgzclm+PIckntpFA/UgWb6dVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jo/HQb17";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64B60A3839;
	Thu, 12 Nov 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jo/HQb17
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B6A1F00A07;
	Thu, 12 Nov 2026 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482417;
	bh=BXzZFv1rViA+t/kvS8iAtCAtd1WIdvaY0MOKVvctdWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jo/HQb17E0i8jEZbQEXkjWKCg/LQKfPCSEM9JA6Gm0rDmS/I3ESUCninPxzJNnJBz
	 YzP+cgVGD9/rVDFkLdBJgXSIVpHC7buwyHCBUSfqinFgIMHrOZqtsHLZR7g6Saj/uY
	 u3rQDKPOda2zHYOrLdB43qK9/NrMzMs/p/J64838H9kRXk3G6jU3Jl5rESOPpP4NRf
	 RRSsUB6gV5/ugibkJPdUykpx0RSWzw8PB/SOYCRFj0/NZ2fb+NCswbCMWaHOwB3L4M
	 NVsAWiSD0JqaweWMrnV7zqPWMRwi9+TSxc9hkPpO9QCupsVoWaPlruCIZOTLGskaGj
	 is/VOboU3j0Dg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
References: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Message-Id: <179448241404.492462.11258139095481555571.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:50:14 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 03 Nov 2026 11:35:51 +0100, Bartosz Golaszewski wrote:
> Vinod: Sorry for the noise but sashiko pointed out I forgot about one
> comment from Krzysztof. This still should be good to go, there were no
> more sashiko comments and this is just a rebase + a commit message tweak.
> 
> Add support for the firmware-managed variant of the Serdes PHY present
> on the Qualcomm sa8255p platforms.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: document the serdes PHY on sa8255p
      commit: 0eeaa6e65318b14cfecb3e7e4338f4eca7070c48
[2/2] phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      commit: 4cc9f70c3dc187cd45eac2815117ea81b101a1ee

Best regards,
-- 
~Vinod



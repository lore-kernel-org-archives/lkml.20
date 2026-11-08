Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169323;
	b=r9+JUiECyHbi6YInZG6WJAS8+cvC9DWGI9jmAWK48ATRQpRUXwnnBGwYJdEkNQzby12x
	 yxpn8lFOJNySpNUwW8JKPOcjk1AtAwKpx4ZKLwR7dwrnv1ORKEMdBycHKYYvpxo4CuU2k
	 9CRq8FT7/lylCqBU1xwXW8KptqNf9LJpTFgb+P7vFOQF7REYSasHy2ciRGmoX377+Re+W
	 WeSKEoRP0CG9DqPcowpiOSYp92YPpbLVBC9uEm/YefJMqtiNOjG/ag61UZbwQF1cb/+uX
	 vQyCdQ+8D/V80AfHTkvXCM9PQfvsvgmhnljP5RwkNArfOEEIaWvCBXgf37A2CHIbj9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169323;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Lg5aR9cJlK0c0fy15wrBWhYR9j7aaIkGY9kHxc4nno=;
	b=fqvYVh9C88RBKc+N6Sh0whIKyj+SIX5UG4yUZ2vjEeVPEnautZC2VANDosvy71qCp9Um
	 VObJXa27heKI3YQ0h7WYidq2CosOI8hL+4XU0u36nCKgmXT7gSZipjA89k4HkwXQbjDRB
	 SBRQHU5RFi7f9nHKwt9t04MBHVtyzIAIQU8V/TlAxn8pAvtVWTUaPuLsZz46hbXKFh37p
	 yx/kh0SQ0aX3c8HHycdwN9sjPaNlEtamBAxP2mptJRMkUEkkmO/eTEiUi9Nw2YMy/6YEG
	 WpSv+bz1jbW1ppyH0iJbblfqS4wLSf1ITGPJ3iZmyoeuWicQlY7fyfTbjxCipnVjtCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wi9TWyXu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2375606D817;
	Sun,  8 Nov 2026 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wi9TWyXu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869C11F0092F;
	Sun,  8 Nov 2026 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169323;
	bh=1Lg5aR9cJlK0c0fy15wrBWhYR9j7aaIkGY9kHxc4nno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wi9TWyXuFoWP2Pqcq0u8/GU4DWsQkFUlF/loo+s9CBU9ANoQ2bBw1Pb8rIOXgOErD
	 7Xb/2fLuTNPCnKvUF5RQlW7xgvzqXp6vsbmC1QrwqouVwwQ70GJ7pJQ/kdjl0IioyI
	 hflhQdtFDHpbjc8OjXiCjezxYR+1z7ZlZE68QYPHRFkMZECKZ/juuliiK26BeYRNVg
	 8OcZQbeSzhIyDb3rNdmMqlt+QFRtfueCFKHzbgVRa4dz52fDRFyNihtFUluB7JQ7cl
	 XK+K/8YyH3u5K1Lcr/3SjNGPmIyOM2erqF2k7/XBwYgaUjQnBvl6O6orIG7tF0aGEL
	 veLQapRD1GV+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Enable some more hardware on the Nothing Phone (3a)
Date: Sun,  8 Nov 2026 14:19:19 -0600
Message-ID: <179416929530.628393.9745437066564765057.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
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


On Fri, 30 Oct 2026 22:41:25 +0000, Alexander Koskovich wrote:
> This series enables UFS, Bluetooth, Wi-Fi, IPA, and the display panel
> for the Nothing Phone (3a).

Applied, thanks!

[1/6] arm64: dts: qcom: milos: consolidate IPA properties
      commit: 2201c0bb932d4cacb14843f997db76470f978f49
[2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
      commit: a44dec637b78d146ea40278844137f9308f927ea
[3/6] arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
      commit: 780a9233e791c1a7a7531c43f38d7bdf45eecee8
[4/6] arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
      commit: f7ddb90396fa68571337adfb09975688d03cfa5b
[5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
      commit: 234311ff4e60b7b3737f48f06cbfdc9d28c32d0f
[6/6] arm64: dts: qcom: milos-nothing-asteroids: Enable panel
      commit: d72c2b5d2e03405792c529d8ad9db5f2ecd9eaae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

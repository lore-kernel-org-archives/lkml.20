Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169492;
	b=jyMf8p8/c9kNV/NjwiJfOb3KFI/in7UAPYU+aBtSlsAE8Qvx9L11R+BEuAB9LdV1jGpg
	 3of5viRMzXj+pZdD+gvrm1ZnrwwIHg/BywFwrcYyu9LwyROSrkIxEKTBrYhFufEmo9bw/
	 OEnEuvaVwG4da90dSdVYcYe+bjQltbDCEqSYCXxUpXBGDjUc05Tl+qeyiUoA//xW9JNcy
	 17GZjFUzCkI/OC5P0Gj38IFNSvSLvsiLPoPLyJupHFo4v6meSe+tXI8IAubaw9M+2iRUf
	 mzjqq1APPdGV5r8eQ/RuqW10UvwmKi6CtLOUNE0GaiZOBtXucpMsISZ3vktdniaKb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169492;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqI2BeVuF5y/RGOq7tOqreiH+gzsy68D7SybMVh4HLc=;
	b=b035y9H4JRpS3mv/dYFcmTDgtFNM1fm4pp5MrezIWKdF13Y1Tdecvv/dOer9fRM4+DaP
	 vNuxCjfjbpGlwfCqYE6ve8AR7ptySUmgCudZ21Ftgbr/OdkGn0Mu38HUlkj1gQLka3/bI
	 nCx+hqOYLeD79bQbsJd9UsMDdbiVusdiqhbkOIxNxHAAQcP30ouU/8t9zhJIhBswN/EZE
	 tPslJZE+Envzsg/CgOI3srQ0FTBVVcnLLVpf6ici3pQaEppPhJTR4SsXwwB5+0a9vUi8G
	 jsTq0w5C9X7UOOBXMPlXBQhPJBBwRp1auL38MWz+E1rURVYhjJ1hVvOyBcofFeBqekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Y4dr/ZFe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6A606A9CD;
	Sun,  8 Nov 2026 20:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4dr/ZFe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FB31F008A2;
	Sun,  8 Nov 2026 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169491;
	bh=QqI2BeVuF5y/RGOq7tOqreiH+gzsy68D7SybMVh4HLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y4dr/ZFeRROsf+B4ZeDAN/4RMZtJlYdga2OFk8mVzw7nBI9WKl2GLi2ZvxfU84cBD
	 ntBokYTcC0QtEteDSxmpojr3Crxo4v49mNfxc0I5pJPIczJilztgnWTwEN8SxHWmmx
	 17o6E7KAX/ll/0KrICQ++jVelcsgiPcL29eatpm4kaGrUxBwgxAqep5xeOxDYV16tQ
	 7tVbmpxREu4GcsH+8qCCPUT8zf/v81+A/S0m3U19t/bGHv1ZJUX8pAoI2SdYNVmgX+
	 OEQdka0lC/kcZ++pTJBu5DrS4RR3U61FTpaNb4rarH3T7yeGXBla9wN6V6d90NYlNv
	 YfKwpafA5P0Vg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dragon@radxa.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl states
Date: Sun,  8 Nov 2026 14:21:19 -0600
Message-ID: <179416929510.628393.15246454384618080287.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
References: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
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


On Thu, 29 Oct 2026 15:52:32 +0800, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.
> 
> Define common four-wire UART electrical defaults in the SoC dtsi: CTS uses
> bus hold, RX uses a pull-up, and RTS/TX use 2 mA drive with no bias. This
> matches the Bluetooth UART configuration used by the existing boards, lets
> them reference the shared QUP state directly, and removes duplicated
> board-local pinctrl definitions.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl states
      commit: 08e237329a6a7aac877e978246609db9a49d2519

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

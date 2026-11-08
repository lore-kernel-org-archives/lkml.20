Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169491;
	b=xwqXpEQYIfyVCtwrrpEKZZ0bBoISkRvTTAGPaRE3sYfvpk3h2aGrlTqvgJTf6Cy8/7iu
	 kZHYCTuDygeEB3PNk6CDBVLYnG8La7a7HMQ0QcmK8Bu1SkwOV7Olu1zZSoJs/Y/NrIiIR
	 NwFlAO8oidbvHyTLBi75pzIgoIyaX0vpWbWrrvHv0fV5fxc1jWofH+w//qYnSH5spkxWm
	 ZKwSFEPG78sU9f+iU8f8qxa+xl9OvHN2s8sv3E7H04TByNMnAc+UBB9oiBnsdTTU/hPBy
	 Hn5C0/JWgdzW0nfpGawJ7f3Ui4XJi0NkZd0TRGDSKsZrMttaGlEHHptzUnQCH9kIpNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169491;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EkXXX5fq7vutAl1QGldgEPxD4Ya+/h+78+WTSiWEBck=;
	b=xkj2VcXXxYoj/yyHKhSm0pO5UE/8UuW7tvfushUv4YpIGm+XStfATGNEmPt1f6PhwtZS
	 X8t8vTToWWrqw9f+69isoDYCzg9ryjKFgfuFFry8eKW5abFwXO12+mVDHa7DL17pguuuP
	 6NQ5oy42rmHW2Ijstn4dQrkxF0aAZoK15GR/K1c+z5nB6UFcQpC6mai/UyhP837EpTMTw
	 CYAoQ8BLk9cRPX5EtrL+zWVbM8MH5T8qJ0toTj2VDgEK+372vzca7Mm3xLVw6ZunIZ40d
	 z0zf+GvX+h45BOL2D4NUQzQAb8o3o0h9Nfe0YYNBQbWXbGfvolRCpHxrR/u3Tex0N2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWC8av7P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3C607F916;
	Sun,  8 Nov 2026 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWC8av7P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD6E1F008A1;
	Sun,  8 Nov 2026 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169490;
	bh=EkXXX5fq7vutAl1QGldgEPxD4Ya+/h+78+WTSiWEBck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fWC8av7PgUz9UReiWcf8qpvpkJM6NG+OmMrPqbKBd4FNQIk4BjaKBwFbCSLAS5tLk
	 z1excnoZTwwzUlKC82uDP5+B5krL9hU6cfUILmvwc3PwHB5rzCMg0r1iqXmgTZ2s86
	 xcQViRo6UyJAKCAKRgyU+XNZcNdXqdrbMiyHmk/Ec0dwvb/evdVwJ95WzWNPcENNLy
	 2UJ8LihNkelHBeBe9MV2fQbrVYJEnaY+U1mEL5bGBiiHsSCfuX1WdhrB6MwTQfkd/P
	 28v7fjnckLZPHE4M0Bh28Jw2b6RfFFx4pmiQgktklsSLmuIUALnZKewRfUikAn0mSu
	 3krfjGabaMvWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dragon@radxa.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault interrupts
Date: Sun,  8 Nov 2026 14:21:18 -0600
Message-ID: <179416929381.628393.15500834185988130981.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
References: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
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


On Wed, 14 Oct 2026 17:27:48 +0800, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register context fault
> handlers on the wrong IRQs, leaving translation faults unhandled and
> potentially stalling the GPU and preventing recovery.
> 
> Replace the context interrupt list with SPIs 680 through 688 and 703 in
> context bank order to describe all ten hardware context interrupts.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault interrupts
      commit: 89083b1e9e315805a93ca6a6e4c3515c7855b0a4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

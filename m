Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169451;
	b=zOhz6RqY3yV+00nsFoBitih2HILzKVle832f3HU77gEWV1pUAIVKpJaba1a9fJAawqHp
	 JFSdFpaeTHRzuDhSpUbmLK4wlcbn9S98HziFgMSBZ7j+WGv+kZClFfuHOjnRNWTeXxwt5
	 4EQk0xAcsxkxhSBHE/+gSm42PuGkEso0s/jyvkRkbKcdoIr+DPfBii0wKS4BFqtOJZZkX
	 SmjDpqcftiCAIegGd8azDGhva9Hz4wQvEflWA7umjyJy+nLb4HTgTcr8nBzWdMzGnjReN
	 8h0SsVuQcS5kLFguFkjmoMdZS65t1AYbnWB/tjvb/JofXNlm1/j0T3KDgQS6ZG1Sfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169451;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pEnsaXLd8rnTY5ZGVsmZmGJuwWD/Jt/TR9ObbkA9kQM=;
	b=THlVr7IdkT+BYm6wSuflrf0b1AvguKjxTxR1f1LkizbjmyzZEO7oKZfByycCsyBXrP6z
	 OWG6PqPjdWCk6p3W6PCrUIsy5ZlhMHwlNdaGHrGCGsrzqHiBf0c6jmdCVfWvHuIoN8waO
	 jmoOzdJ6sFWxcko58X8ik41vc3oTzVCTPgY598lQW9vx9Mv5e08yqyndeU6FXHrqohpOY
	 YKrqVrbCfqF89MaOHdK/YGmTZhqrP/ivZa8qUJ/IFULXCmGPY1n4J6Vv8hIcghBB4XEz3
	 9LJLeZIDFfLprVON03smzW7tHrM17YRlXwXiNA4F9VLtDMiRvuJJV1tTwuuP9dtOqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4ecHzdR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA466078022;
	Sun,  8 Nov 2026 20:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4ecHzdR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EB81F00907;
	Sun,  8 Nov 2026 20:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169451;
	bh=pEnsaXLd8rnTY5ZGVsmZmGJuwWD/Jt/TR9ObbkA9kQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g4ecHzdRtCuMhJ1PjtlGJMklXZPB4kmC4+zRGuDX4IUGmG9otSNMK7Rk8kFVooa5f
	 HztJoF19ZuQCqeMBlQMH6s/ngsRseCqW3ugZsNPaPn6TdbZVvbvTi/sRPEbeSILC9F
	 DKerzPfNg414un90NSEtLDDDmGy9IZ0kJYQrGBLY3oOQrKNvdyjkYhWCqD5Du7G/VD
	 DuZMRbuwrunpIJZV98LgxSdnA6rVNRFRp4bO9ImP+lgzcEoG0ZIajO1UweTLWZ48Ao
	 jYgX9A1bFUgKK+uENMqrC0Z6dBYVZB5OxFK9s6WdSWbH6UZoIRVf/ine7Zb9SInw3V
	 Ev/OgEf5x6WuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 v4 7/7] arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers
Date: Sun,  8 Nov 2026 14:20:48 -0600
Message-ID: <179416929479.628393.10836518750576254409.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-7-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-7-cfebe0809467@oss.qualcomm.com>
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


On Mon, 26 Oct 2026 17:14:35 +0530, Mohammad Rafi Shaik wrote:
> Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for
> headphone playback and capture, and the WSA8855 amplifier for speaker
> playback. Enable both drivers as modules in arm64_defconfig so that
> audio functionality is available on these boards with the default arm64
> configuration.
> 
> 
> [...]

Applied, thanks!

[7/7] arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers
      commit: 6f769d4e24a6b8280edbd0da410183e39f33c25c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

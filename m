Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877525;
	b=ogse4WYej1efYtUVg579PjpCyRZQ8Nzmi+KvsMTXKIg6nmCqGfd9iwLYX3gjQ/Moq2ts
	 xMtGPRg9lIF5lVA06LMK5uiVNuUYKQMMGjG9GepQ1Hh+W7fFZdLGzZx4xdhJp59K1xD08
	 PCIqTW1ZiYa/OUKBfV98HuvSO4dKeFCRTXhRobRnDLwcfM8XY7iIqPxmGYcFQIptKRyJD
	 14AWMEVM8lxhzzAoF+JD6x88MDdMtLoj7wqg7YQ3VNuOkQuVWce3/iYvhMm8msmnzBsER
	 c0qsfBy18ChqshjDYJ+MM/G9H5GR4amBftE4e7u9udPu5UfywxAVc2yHBnLKg+z0YJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877525;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UHgziUss+brjqBbHBOgvBClWaskNCi/K4btUJgkh9pw=;
	b=ZUxQfcnAna/4G2/tXw6tmnAiQf7O4hlPwKflgf55X0q84zcG8Ca7AsO+g1WiU/eGvpwL
	 BJ+8kvwVYoSlsLQCejvNNxkTnlhJfnjQqkjLR/uPPobVcLDSSsPxyUjctNFXns+XmKkxz
	 BWIwN2bYACwoH3UXLGAW8nmRHk+PsaL/xxw4glU6Gm6/2Bn53lHc9EN7IptN/lyisJc54
	 LkfdUs1EzrEpASA/LQmSRb9t5pO7XDZXSAADKApqxyHvtlg4aWU2Umfx8uSOZWEk5Od9C
	 3HlFLFUskLoCrKeqlgTufJ/KF0g2tfV6yX4o9rpSPKtaaFOdrP6fSu89LiutULpd6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KP1tgcQT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A50606A899;
	Tue, 17 Nov 2026 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KP1tgcQT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800E61F000CE;
	Tue, 17 Nov 2026 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877524;
	bh=UHgziUss+brjqBbHBOgvBClWaskNCi/K4btUJgkh9pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KP1tgcQTBYQf3spV5rxgfGfs7AY6zn0Boyn1avqNP8hIbELwqDccz17NGx1vCYm87
	 9UkUs05Nm01aPhwY5p/IvMwujGy6176hIqadmZczstjvo6zwkiLIemu37tOlX/yTqM
	 pBexmI/Nn/rGXRCNaffFINQu0Xo8TEyCe5hGZjp/EHTTVtDXTjoIoKujSMWryAMh4r
	 TXcZ4IQ/qrIYK4BYG0B0Jo/QHEU5P972Fl1Af82KDEQeuQFyLIGYfSrhpELxNPYwiZ
	 Nd3zP+AKLCGIxgpeL1vPqSReaH0+hNaTLohEicCjlVg9NJYwJBRQkmZf7w/1m7sfVv
	 ZZMhGK4/45HAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Add Samsung Galaxy Tab S9 Wi-Fi (SM-X710) support
Date: Mon, 16 Nov 2026 19:04:52 -0600
Message-ID: <179487749323.432567.783251449924999926.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
References: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
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


On Thu, 22 Oct 2026 23:58:18 +0200, Nizat Mikayilli wrote:
> Add devicetree support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710),
> an SM8550 tablet. Two patches: the qcom.yaml board entry and the board
> DTS describing UFS, microSD, USB 2.0 peripheral via eUSB2 with an NXP
> PTN3222 repeater, keys, GPU, video decoder, ADSP, the CS35L45/VA-macro
> audio path and WCN6855 Wi-Fi/Bluetooth.
> 
> Tested on hardware on top of linux-next next-20261002 (boots to a shell
> through U-Boot): storage, microSD, USB gadget, framebuffer console, keys
> including the book-cover switch, CPU frequency scaling, GPU firmware and
> render node, video decoder node, speaker playback, DMIC capture, Wi-Fi
> scanning and Bluetooth firmware loading.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Tab S9 Wi-Fi
      commit: 095234e837450893a45f46c369f51d177ff20589

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169460;
	b=XpBk7R43rtRSLIapmWARVPoyVmLpcnRKdqN7kOKVUnWfac7jDUuoZio0bIjh4prjGrHf
	 ZQ32Gxr20etRB/IcJVS/D5P7aMngofMIhn11EWUXQMm0Ug0ViTcS9HhyoBX45JMVFvRzT
	 duMdepAp1e63Slyq5ZwE7T2L03wTwwoOrL6yOmArU2ILFL2Qqn9Eo7+VT6cYJJf23IaB2
	 p63UIOkjflQWu7unZbkcWUBLjAgD/e/ovSQwukH/r9gFSQMv/lIukGPhCUJZQjmnnY+Ks
	 AQCKnK8/baDfCI/UBliyjEWxIC0a3frNdEHebmHmO1OeFFwmxl8L6typvwurWFAOF6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169460;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vzxQIzXIkRhzxrK3AVz7Qm6YhaMaHbBHLPgJcPIwyts=;
	b=ky443xoiEqmlAiFdEUJ4CC34RFxr6sxyGwo5pTCEYAZA1wydnU6zb8TxQD4bDLXc15Wt
	 fhGX3+mBI8lROMXMcUGCwYZuqGIsoWzGjefxzM4RgXmw9LJ7hNDcAv32lb7KDKDG3u6ZU
	 GY9tVrCLjGATZYkbHTjBGoC3chkwDbvkE2ywUg47xF7A2L4+7TAxyWrtLU40ej/BXnk8Z
	 JEh9C1oFyvdBoYgonjrve87/10rdhScDlEYp0PczEJVe1sA4DD4dyffYMdKqSZuxTQ+33
	 bNysbYvRwB991aKyN0j/EcKwOe4Xt0hspL0JoKAY9sps4Qxxr53kYX+yPj2tlEecsaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mt0G6NMP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693786079415;
	Sun,  8 Nov 2026 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mt0G6NMP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4123E1F008A6;
	Sun,  8 Nov 2026 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169460;
	bh=vzxQIzXIkRhzxrK3AVz7Qm6YhaMaHbBHLPgJcPIwyts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mt0G6NMPpRoW52KwvBjGyVtSoVVtBc7FStaVYouHxeU9d/yrrPbZv4jDgL0kdqWGX
	 ZmK7OxF5oy0SAFIVZGGHOuITzlg4PaQ/Q6LL3DT6/ngt8sTQL0YiqbHRD/FICKNiaa
	 WY4QnDjXjxaOsHXniOWIaagGCfVNcMBpVLzwIIlz4RMl+UEXuhzu6Du6Q9rpvFS1Nf
	 wLWWZTJt7gIVU1l+8i4JGqxkDzKAjK9q++WFxH7LbHRgtVjXJYOiC/UqAPvj15tCy2
	 gm88bx9fm1E3/alw3ag1tHw977KO2Yepa6qE9TDIUmM8zrFeY16UqZxIR4rlQpmpMD
	 aOoMrEf/lmLrg==
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
Date: Sun,  8 Nov 2026 14:20:55 -0600
Message-ID: <179416929465.628393.6808030568990049146.b4-ty@b4>
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

[1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9 Wi-Fi
      commit: 3d392cd1dfff35d748d8390f1bf5bcff56e82eee

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

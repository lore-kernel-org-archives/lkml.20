Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169381;
	b=LRCbzP5O7M6IB9nvRvjp56Hzb6UCmt11Mhl8FIR3lq2y8PL6nBdaV5upltLf50VfN5KK
	 OA1uyPxrXphKmOE6UUFZRMS9x6xzx2LlEL10mRtny1x5rApJ1bpHZk3rpQ+/URsFEry13
	 N2vb44EXIxrMjlwDecYDCfdcSP09/Iwumj9lFLpen7TBpRrZXKUMnXB7RXLiT3l72Zgbb
	 qeJsAU+fBNhFTyel1Dq01k9yYkHBIm3Pl5TBOV26kP/EubA7jyymzkysRFGt84XnsVqh1
	 4oIbRPoArqtycv4IVyZwq93+/8mAiP7XtG3NQh6uS2/AqZjG4meDx5jhygutlg77FbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169381;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MA767eBMFY+AgdzEUS3U7TTeVRTve0+I5z7cZs/TKF8=;
	b=A5mpmvfz4LeohRfJf0DpvxBCNpxwGSsEltpLuo/mBqX8va0PSKAYjjBlzYdmJjJRsoET
	 0CTDqFIXS7MkMEbJ9Rgh6s+2xe9L/SveE0ZzU6qHZgWFiUbXXnETYMeoLIf5uNS3/dbQA
	 tor5c1ADWqsWsw2FpAKqnx7d1FuJZRWEreXbP5d0FC0mPDLE45vbJ+dYuIyKJTjMvOopo
	 Q4rHHo8eJ9qxAFzpPcEzRrCqZvydYmzlla6/Z1+FOHK/HeIEwA4dlnp4oumhfBZC1k0sX
	 A7MtwC7Go/A1REzWWjHRTYIs2Jt78xX29I/OEiW4KZ54QF8ONs+WXC+tIeqbloarOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cbz/01tD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3EF606C760;
	Sun,  8 Nov 2026 20:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbz/01tD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEB11F008BD;
	Sun,  8 Nov 2026 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169381;
	bh=MA767eBMFY+AgdzEUS3U7TTeVRTve0+I5z7cZs/TKF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cbz/01tDBuBdOlJ5Bgh18a618ajKhJfIRDBxZ1lgUMczbIrdaL23aS1JKwauR3FdF
	 zjRd6x+5ei1gdn7DToaWJjzmifgpnvKPbzxYkC0ZR/C0ya0J5W80yGnF1EGlKKaNC8
	 Is4jOLivvuDNhm9m1SvsHu3zvzSoCBwmw13BiQveIzjaFk5hF5sjvIuKkqFngWr4P2
	 qreHEDiGLvVdyLzHDUvkj2TpjExa0/XPXwhYGswRcPHhv6ybhzrqaWEfyv22siK3iG
	 L9YLV7qqxT0eZk/WmfMIT7qFDxXiyOR4ZyVM+5FNRj2eIPlgurdhK8IoFZawuczItP
	 vfbXKFhFb+9TA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: Add support for the Xiaomi 17 Ultra series of devices
Date: Sun,  8 Nov 2026 14:19:53 -0600
Message-ID: <179416929444.628393.14790231637289198553.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
References: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
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


On Tue, 20 Oct 2026 16:19:13 +0200, Igor Belwon wrote:
> This series adds support for the Xiaomi 17 Ultra series of devices,
> consisting of the Chinese domestic region version of the device as well
> as the EEA version. The only real difference in the devices is the
> battery capacity.
> 
> Currently only basic devicetree support is added, with driver support
> for the display panel as well as other hardware blocks to be added in
> future patch series.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices
      commit: 7678f72bbfa3d0551c414bf2e34c9b520b4210ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

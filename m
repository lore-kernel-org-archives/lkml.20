Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169435;
	b=uCMJQ40OLS+EaGNRlEdhsOVGph1FS+Q9BSWIUnWqSzJSrAwHQOrl+GWaltbskYapBld8
	 YmJQ3Pq2/2/ufYKeJN0zlARZMxsjExCQ8fvQoqSYQygZvJk8F0DNReCZ33x4U7VboGZkb
	 l2gw2IiaLT+0uCdFEfyLG0bAyLBxu5g6wkW52roVNazXAsdiZ/jC63Clt12nnc0mbykML
	 vEvqnONlrK7AL47sjdyn8evW9QXUPOc4sAZQpi7BGfuRNhIrzX/jQTT8uTZfGuc+1uQ9D
	 nYmTUAmp6G0ebuC3weutUmX9nBCPovTD7qablQjKEnPfbQrcLzisjm6FDRSwo7yy5Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169435;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=T1K+95ZwJDatkbP5ZFT8Z0TT0QVdJveWTGK1BJzI4uE=;
	b=cq9Nt8OuTdkExULpqfkwWLFShsdjx/Qt2j10kpl2W3ijvZfl4XFnq+pYDLSIOKCgzbHH
	 Pcw3zJY2+Gywgl85Cpt9Frj10AARyBOdnxcICE2/VyjuMjk1m7fVO5D4jPCnTLe/bDi5j
	 aCVw16oJ2RFvD4kycbTHlDrZXjjFmUNnABfAC2PCzWzJN67Qeod05Ms1XO+/r4jexju3K
	 GlFIyZEI5749+hUOY0WbapFr3bi6+FIbZY5WqWE04S1I1i4tJDxlkLInWB5019b8F+ONI
	 R+KK9ceDa3yEf6rwCvH93X5T2WrRXNdpHCWQhY1TN3kqSsvXg6OiPYp215KE9BONimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckz3L2Xa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11DF606EEB1;
	Sun,  8 Nov 2026 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckz3L2Xa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929A01F008A6;
	Sun,  8 Nov 2026 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169434;
	bh=T1K+95ZwJDatkbP5ZFT8Z0TT0QVdJveWTGK1BJzI4uE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ckz3L2Xa4mgqPIPGve9szzBKdoEr2k+yawkE6y6WKwwS8ollvLBS8Cq4ozekf30lG
	 V7Kt2wsdAdsZSq1tYRQkQg0/mRtmPWiNY4QMw7nPn9qAzvuKeZ1EVnLiELaFzvukFJ
	 UwGkWVG4d4TlpHdd3/XVfBKjegIICLwUL3QpFyExfOh7cQr4sXKBDLLKTi6Nd7jgrQ
	 H32tP3KWyOGmT2q4n9t/RT0zOc3qr3oiBW9teOiYkUFdF+jyOAGS9p7f0ddZoFRdi1
	 25XOSYK32foz0gFGpdjdKu3VMtKfsB3ak+V6FaVvd4l3byMFVB8vAg06CbVTqTjhQ9
	 vfpQg2pfRpXhw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add memory-region for audio PD
Date: Sun,  8 Nov 2026 14:20:34 -0600
Message-ID: <179416929420.628393.3530533303129530569.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
References: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
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


On Mon, 19 Oct 2026 11:59:20 +0530, Luca Weiss wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Add memory-region for audio PD
      commit: 25bac6a9c03ecde2b317a72ba4aa1e023e6c45e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

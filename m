Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169385;
	b=M3VCzCL5YjSXGhOqLvXP7xW6ZFJsD7inDOdmY01m8A7FmN+q6d3Fyhrisi1cGaZ50VpQ
	 wHVNWyomKLN1VsIIjzUv/bSkLMkaHMnPZE5FfKm6VHOD5c/u0An83nGCoYw0X4rOBGWzA
	 1AAqYZRwyc5qBt8/WildfqGbeHEtcVpZcjExDRL0d6oUdmkVL3wWAMjI5Xsv+x4PHY5bS
	 IWRBroFsw4mdwByZNBoWXVnHUVgTnp/ld/PG4JmBBOBEecEmMH3Vz28ldIgfiTvLlZ6Qv
	 Nqs+GRgHwyoY9K0dY3/okLn047S8Yjs8QyMmYu3K34WtJ4N26ccChT5dUVkCGcj/OHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169385;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G8ZInKyMiYCEvt1+kivlCkkmODdcHnH/jt+X2SPvf+Y=;
	b=WT8wfUwzxIqnqhGhfcqKCbfxHfNQffkwx2hGwqh3UgA+/6L4UY+cFhBL6MG8K0SrMA9z
	 Kz+ot2kO/7JoWUjkuyjuS+qgzwCot3vdkAl9tbMY/6xSsmM6dIqo6gegxJBIlsbRaHbpK
	 rMlYHnRTEitW9fnJXEjm7QPHfh7qU5FmklIIKVTFyJcYd7uOFb6Da0HXE4u/gUqfYk2lf
	 oXju5cRlsrCZsmmXSbEPez8eEq1DK2dY2Oqf7aLq9/dJQsP2SXV6+L22oUIMxTojIVS3p
	 /uunVaesrR1kM4zimgUI/rvELT8te5GpMpdYdkgXLBc/aYxPrDLdNhEEnQrADKJg2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yir4YigR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E1606D11B;
	Sun,  8 Nov 2026 20:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yir4YigR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF661F008BC;
	Sun,  8 Nov 2026 20:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169385;
	bh=G8ZInKyMiYCEvt1+kivlCkkmODdcHnH/jt+X2SPvf+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yir4YigRBa/Xh1h7wEWcoEfmSqbyqtbYkjP8Y0J5JlbPGVp1bSt462tkC1JAaIES0
	 JqrWp6o9t6zoP4sYQJemHZAU2g8ONHVWHRjDK/++sId+nv4Kc3j4h1pWVxJHVIkhW0
	 U4gMni93UgSEi6Ju6T+QdM5zcm19cIIQvZDbQrabeyK0E50Ia9S6vClACDMvdb7sdh
	 GjgdZbUMW29GR7B/W9Qa4iivyt97Cc4+wYILcho5ZeEPFMmmE7FCfFp9Zc4QyQKRkg
	 E+tU+KPRJncsP+PWkDM88mDCgtazUlYxicbCpP4AhA/q4LlBx8M6g4bILgnFqqc5T4
	 wwW355i+h+t+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivan Verbovoy <ivanverbovoy@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix da7280 pinctrl state name
Date: Sun,  8 Nov 2026 14:19:56 -0600
Message-ID: <179416929553.628393.10439136050675894033.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
References: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
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


On Tue, 03 Nov 2026 21:27:19 +0200, Ivan Verbovoy wrote:
> The pinctrl core applies a device's "default" state by itself and the
> da7280 driver requests no state of its own, so the state named
> "da7280_default" is never selected: gpio42 stays as the firmware left it
> and its pull-up is not applied. The interrupt line is open-drain and
> level-low; after a suspend/resume cycle it stays low and the threaded
> handler runs continuously (about 2900 times a second) with no event in
> the chip, which slows the whole system down.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix da7280 pinctrl state name
      commit: 9c4d2fc8911a9be378c6f6ee19bc792858e15c32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

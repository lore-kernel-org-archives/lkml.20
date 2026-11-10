Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285309;
	b=4BlznEhjOSNS1jJxaqMwzwAjGpl0a4o61NS375073szjYkm6yiqab4rKy75/VttZVANk
	 APkWLH8Brgnj/faqoMWxP7Gm5TImfyTKT6cDQDS4K+XsadlBSGf/V4VEMnwUGGfPD4ee9
	 zybdBfuNGzxjd0ApoU2m4mFQiqV4wlpWimZ7oxLUSPT5GnqhC9PMi83vaZuc4yQw86Plc
	 mnMgefWuKtcOYsfGOgH/dfbynVaAH2EeC/aslAD+hc0fyVJRStkmYzl5pAvHTH5tZm/1A
	 dDAccUC8DCZbTkMcumcR7+uyd2ees0K7fSzqUDu+wwz/CyIKUMPWFEqLhbQv01ESXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285309;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=crZyUUQE2/M84BqAMX/aRkPV4MGGeswqi3566mAlMu8=;
	b=gx643+SL+Cy0JlT0EUJ0z+ESaflNNMJ/Rcyu4boLYxGO3QiSTdyy+sz2SIZnnNVDVHDr
	 dQze1fUIdRa9ywWokVDraQi1qrzujUj2kktvK/B/aZojJmhrt3CGRZsrqoJIJkO1kd4as
	 FmYcQ0DuUapEV3nffFeVK3JN0PtNArfhVx8dpCsMRQkD9Bz1hw3mGfSW2g/HwXLARcyRK
	 bshkaRvaUAyPdGmmLmtMRGvMlzD3C4Ao/foAmMPMi4VC4mPC4I27flL67V/RgQKpYEbGn
	 spIE7lCmmQFBlDimItnqHiU8A0xC6k1Bsodi3Isvvjcbkk8KPs/UQWPQmUvYk4cesmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aef4mJfG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB08606A8A5;
	Tue, 10 Nov 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aef4mJfG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281061F008A5;
	Tue, 10 Nov 2026 04:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285308;
	bh=crZyUUQE2/M84BqAMX/aRkPV4MGGeswqi3566mAlMu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aef4mJfGx+XssVDlJ1KOAg/Kb8wAewcHECZaUx+eC3pMppBvB7tIbChyWGzId7mUc
	 lAOqTCumx3uOpJ2WykgTHeL1Tt6tKcaIFnHslp+pW3mE2Dc5+nNAr2nVI0Wbrog2Vw
	 135couv7z/J7Nifjd4+ZGCn3uLjv69gEC3y58xEv+CBlCvQJMYtWOsDvz1ACj/aXwe
	 qMAnLH4Ptvc70QSRxTOatC7BQQ93i6ns7Vx5bcHFYHczcvLXYcFVvxLfPOhVSkbmU5
	 cvtYkQr8uF7KsoztVcq4gkYWVdYCoMlBT1fi9WMHhIkwjqCEty+wleGO6EKitY14PF
	 s1wj/Ilpg/hgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Remove ad7147_captouch
Date: Mon,  9 Nov 2026 22:34:49 -0600
Message-ID: <179428529345.1061455.14300631403027340638.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com>
References: <20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com>
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


On Fri, 11 Sep 2026 10:43:47 +0200, Konrad Dybcio wrote:
> This node lacks dt-bindings, producing warnings and is reportedly only
> present on prototype hardware.
> 
> Remove it to get rid of the warnings.

Applied, thanks!

[1/1] arm64: dts: qcom: msm8994-octagon: Remove ad7147_captouch
      commit: 895f14315d636dcb313db8dccfa100b53c361b13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

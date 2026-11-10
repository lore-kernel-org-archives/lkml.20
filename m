Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285310;
	b=oqIrcR7gzCPpeOxebnOFg2MiDXM4oTLQkKbdfc3Q/y3tKP/fD0Dow8s59Oa4BiKCZ+Yw
	 RdwLKbiWneoCgxQCrY5xIsRdiLW8+qFslLFg1FfQ7kTzXPyQlw7rd/6Njkr8i3MPNi3CC
	 1eh1l4PkBW20BeZU50UL+zoQV1r5d/scC7gIoYp+NCBIS4vMRotmQw2pYhLZp+voBUVrk
	 Vj48emWj5VuGMHQnr4VXcEAkAsyJfF+1h0UlzJeYsJC5DeqlUrg3na80vcrPjYmNi3fep
	 P1AlpTYSD+A+OU2c5lWxsaipzlR02aJEa/eUGI+hcAznzhXC7kXXxe+KCgEMJsHBjgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285310;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e63F4xJK85t/vceTbSAf9OXrOgGwXRgT3yCBrctHLM4=;
	b=kzufBafXVxv17zPNeQscaj9PaHzRN2Oidhd+l10dLrgdmBF3tH4DChhEYXsL2G0LMHVx
	 Pi7TCaeVB50hpkz6wepkcIhfps+kkVRMIBWe7pgSwReEYEZyThmzcjDbcYqML6JuGEIKh
	 pPcp/UMdWGjE8w1qKe/iQjzR7VKAXE5GutLJ6Qb9G6NtI5x+TJsCe31Af7jdnuU1JnSIQ
	 Z+y4rj4lpvGXiMnToMvB4vWt2/iPj+XCuSJxOw8WruwzUn2Gvg1BwJuoSPuFNKDPeV3vu
	 0MO1hbH1Ub3A0ASTNK7nGcJIyUR2GW5Fu18b2B0stPAADlfSil9dFjnjZ2FDze2Px1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azGEMG5Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE444606A8B0;
	Tue, 10 Nov 2026 04:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azGEMG5Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AF01F0089F;
	Tue, 10 Nov 2026 04:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285309;
	bh=e63F4xJK85t/vceTbSAf9OXrOgGwXRgT3yCBrctHLM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=azGEMG5ZYJ5BxBZ+lnUgHCNB5mBVtN8f77q/c0S/fRUxbYXRrX3wzcIhE9FkjSkXV
	 xFxRXdeLvwaXc2mk3iTuj5LIZha4e409M3H3Wu4Ps0JeyAYakM4AD5IKtR18YbzwDa
	 c4yYC78zLv6QgRXS4Y27CvwvByLNlxKYdN0RgOnD98xUna1DeUm2UZ4pgYJJLG3Py/
	 ZKj/USJH/e2/SImn5aVlk5TTpzkJ5XXQU1SglyLkS26ViVgEGDU7ISI/PugxjBlvod
	 5WmWU37A9RKKlk/EXu4uIat7OxcLL48Ja0kctUBsdHw8lUvPKeS9dgYCMBPzPXv7/Z
	 aLTJYvDdim4cA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-tama: Enable RGB and flash LEDs
Date: Mon,  9 Nov 2026 22:34:50 -0600
Message-ID: <179428529347.1061455.14966282554610037250.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-topic-tama_leds-v1-1-863badcf5ac5@oss.qualcomm.com>
References: <20260911-topic-tama_leds-v1-1-863badcf5ac5@oss.qualcomm.com>
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


On Fri, 11 Sep 2026 11:57:08 +0200, Konrad Dybcio wrote:
> All of the XZ2/3 series devices have a front RGB notification LED and
> a single rear camera flash LED. Describe them.

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-tama: Enable RGB and flash LEDs
      commit: f94de513c6ee685062b3cfecea1fb464cf8bed9d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

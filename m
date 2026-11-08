Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169446;
	b=o6N7E5txGH8omjaFPybSXYsYiZdslQF+jPjYHKWHN8kR9UazqxOmSDbsmGlDv7NjzDDc
	 F0Cv45RCwO/3BsEYJpSHzkCSVEsq0mi0lgpZSzE5clpDhpqAM5C1ddbz/wNAX+/BG2GBM
	 0Smwb3xkfoDZR3RwsvF07VKnH/2bDRgQEg4IRAQyBIJ1Lbft9gcCD0WVm5EQ5s4NiVDjF
	 WGW6Nd1rx6IuC7qpgqBQ9DjKIDyJDJ3hoc1f0bz/axdIbqwpF1KN3l6BctyPuTTTEXG5y
	 iHhXI2vCFaHSdrQcXYIbx4DCMZYmdbdU8pLWlG2g5Ru/yEXidWqSqbt5Larvv7Bs93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169446;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oFdTrj/Nf7P4F9/EoStBlxIBVzLaucAwTN9JEkijf20=;
	b=vzxeJoOaLYqIn+wIEmOzs3OGO7CzFyO97HJvDvZSgQkxm/WeyBzderFiYAgqrdYZ3MZM
	 CYA57srXGrkfLc00+LjQCzx1RBe+Iq2UZN2PGnsSmN7ARriCsU067XUd6Ziq7HRxmcdbL
	 DXDlS/pYlBIivD0/1s+EMktes+F1RjFfx8M6RoeNZg6sxmRwlhImIrsYBeA3fb9U/J0/Z
	 cuZ0g8dLgpOppA9SS+DPtSXruF/WYYh/kiStLhkvj5lAcOCjtOeAQ6CaVo2QV5b8mTC0i
	 1LkMBGOLLxgKcWjhx7Fwo+5eHukIqcDJlgOpJO2N2OtZKh1w9nwVP3KsQX5leNSfY9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kc35Fybm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8876076C34;
	Sun,  8 Nov 2026 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kc35Fybm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B951F0089F;
	Sun,  8 Nov 2026 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169445;
	bh=oFdTrj/Nf7P4F9/EoStBlxIBVzLaucAwTN9JEkijf20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kc35Fybm8BwXxcrwGYHfYpm4ZYxx0cFLdWNjT5pp8Sn+ekfTJuYjipWs7i3q4B09o
	 KxKGV7Kq6EkBb2bnaA40UHYL/gfKdpVDn7OgFYJuR5YcZDoNj9NZI1TCZsPqYEyqzH
	 lR/FK5iGu1XKA4SiQ5wNTvbw0ygn01DFKluTDSbozyNDbf8FUUBtT12Mk/pjcjfZpv
	 Xz1dHV6gBJZgeHOWu8IIHtwKc5jkz5fUTu2VBrhnXjFsoQPQyV3zUkVo1hGcieVncN
	 pCzowjCSvMsSS3IjceUzK4P31IqUJ0/vPJuKhY1+ZhQQ83bM/3hiJinDMyPOd0Kv5J
	 nXtKEeY7Qo23A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Demeter Barna <me@fromdisposition.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm8350: Scale L3 and memory bandwidth with the CPUs
Date: Sun,  8 Nov 2026 14:20:43 -0600
Message-ID: <179416929388.628393.7999703057327479473.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
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


On Fri, 16 Oct 2026 06:01:14 +0000, Demeter Barna wrote:
> Add the EPSS L3 provider and CPU OPP tables that vote for LLCC, DDR and
> L3 bandwidth with the CPU frequency, as on SM8550 and SM8650.
> 
> Tested on a Razer Edge 5G, whose board support is not upstream yet:
> copy bandwidth on the A78 and X1 cores goes from 8 to 22-33 GB/s and
> DDR latency from 200 to 125 ns. Idle power with the screen off does not
> change; with the X1 busy on compute alone it rises by about 0.3 W.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8350: Add the EPSS L3 provider
      commit: e8c26ee56a03d1d774f005e7179a541b4cf3c7e1
[2/2] arm64: dts: qcom: sm8350: Add CPU OPP tables with memory bandwidth
      commit: 3af17a599d46d1998f80c47378ca673329d29bb7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

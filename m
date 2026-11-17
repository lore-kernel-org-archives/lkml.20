Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877508;
	b=C4PwJqi3Q5TbRNf9jJJjRldkVnTzx2hA5RpdyJbASCji6HGt6LDwMROXVEICqnqToile
	 TYwI/EW72xKJfWpAIvvCfqNki0sO+2H+ulBf0KK8ab+shZ3gTjU9Lbi3q//kaI1cfxB5Y
	 eCF5JsCOmIwimnkGQuHL1QUSupUwSKT73ikVm335OcMWfwptHOdqskIklzt+2DjQ7Di7I
	 FULlE8Ypc/LuqmFmzgA+Kc13OMsGASQxtuBLt1XpKtBXDKktDZYm0j3mn+PKHY7L6IhNr
	 JWYIO4P2pcQI6df4xlhZMG2xg/Zc6j1oSlRyzdgEFuYr8cMJg+1Dr8OXO3lJOLlSMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877508;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=biGlWn0Jl3m8BL2GiqbKXlWabAcSMOyXxHhMwdh2Do8=;
	b=KLyxkWIK1kN0JV7EIrvhYrcO9L8RQDbE+cCnlEaIfxBS0yKgDfydj1d660epzOMT7W3d
	 P2eIgNLx42VP1G/nt53vucb1NNyFLcRfP+OSGxpRn5TuZUPflf7lONqZary2wF5naEFyF
	 Yud9mrQoUlBon9G8pTbmq0UPdvccnzTZ5/Xeu13pMjde05nedjcROhD6GuXGqliJ4v9Tq
	 QMeE3YxD9BHfUvngCTLjoWGX1k4eYalBa1NmLFbjYEvEWH4YblE5+cfI4ZdHjGFJlT6DP
	 9ddcbqlH9IjnUnMwPW4L9asPEw7efn5K7gQPe6c3aj2nyA8aovBD3x+i/qADHZwKBug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYzbIuIt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDDE606A337;
	Tue, 17 Nov 2026 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYzbIuIt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D841F000CE;
	Tue, 17 Nov 2026 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877508;
	bh=biGlWn0Jl3m8BL2GiqbKXlWabAcSMOyXxHhMwdh2Do8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SYzbIuItCq4qMjfjdfSfzxktak8DqM35g/JHAje8A48BuDvTGVEnSo0Z8ROgqsEv/
	 5LhQMkb14fhWfspQezq5IDv5bGRmvFcJuAvGmcY8mnYiw8mvFEDR8J1etCiIC5LLgu
	 +r2za7ZhCu20zEk4A+zh6dcYSO4Mmx0Lb96HfbGqowVgnbzu7DCngGZwgkjlsWewgr
	 x+ZZUJO5RI+aGzRIdjSm4XPIL4vXBQCOxaEnCPN/AkNFRipJO20EF7Q40cGYwA2P0J
	 wJS4FIR2QT+EqKIvnHinRhDxgVUr/xLe40N+Hvt90EXo9dAW5S9SYYnuuRQefKRv5Q
	 9r/CTmNCwhnsQ==
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
Date: Mon, 16 Nov 2026 19:04:44 -0600
Message-ID: <179487749321.432567.16903571745010192218.b4-ty@b4>
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

[2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones
      commit: c0692181aa90a0b31c25abce757c2cf61e5532e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

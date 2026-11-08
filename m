Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169377;
	b=gtG55469hd+roQlQNgmXhOZmeA6A2TI4/eDa4osyWCsqGtFOU6r3arVte0JSADmdjDNM
	 l0JchZv3zKLs38tkku4KUdiBtiyriPdWY5gB/g90/riBtqGZxM0Wdr7/PRMbc3cP4t6VE
	 r2AyCJNQaW6JqWKsqHJ32Mp8CwRMlphcZy6wml2V0yMVMI/W2Rauhxks4gQyg8GUX30B6
	 R1ZO17tpFrqG0zyhjoHaYB/+ut0Z1hxWT3TzFnJjXYtagn8PtUdZERNAgwrRHaB4axRuH
	 X/wbLV2cCV0wuDWcydpLBAJOkTAXMGJNXNTT34ErZRJMD2w7VrlobUEszyFn7YGMW4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169377;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+TGNtBkbY9q8F7TsjFNpGCb5Omd+5aPs8mlI1uZL4OA=;
	b=19N2DMqiljrhatFA5jeiMKIeKd1zbsrv1p3uS6sssBoXpndZ3hypu5ZHyXCAsLZxxS8e
	 3lIf120LzvGjZYq9bvHXdpffI/udfYsCE4R0bMc98D5wXRFz1xSfehDAe/Hw91fy+K3oU
	 aZAyD3XPZwqblmV2IAixGqahyYCEFgFQV4ndbsz3dpBSSfbA/gDCRH+pFaC1mUG2wdHhR
	 CMpTGbqwKuL5KjvhqHmaiunVgLOOufXyRk8OYU9FD85yX6ZVGXbURvuvr37Kiiu2QSfZL
	 HzzEWXi94FVvPLJdKzGJXia6AGlKHGSoqxGt0E1WorAkB3IGvMWNTTZYCAW9r+O+n0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnAjCatM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74067606BA7C;
	Sun,  8 Nov 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnAjCatM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841471F008A4;
	Sun,  8 Nov 2026 20:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169377;
	bh=+TGNtBkbY9q8F7TsjFNpGCb5Omd+5aPs8mlI1uZL4OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KnAjCatM6jtU5Iv559+8anP65FzZlX7oYCx74Fw01CPC5a3xdNRotIhg1ODU06D0Z
	 3O1AJitHI8qNpJZ2TdesIlen+KA2pweXMoaeeHhllEvRpgnrKYuf0ca+5X+X+T9PFM
	 e/mBp6YgR/gVUPKPhiNoIDdM14QFYZOpRJ09ag0pzjshIOv8+Y81RqT/WW64I0qwoX
	 DtDmRmZCQeEWg//12huru/SDg4iR2BmknRNu5YUL8sWqyRS8GFsfjJplxY7V1MeZFX
	 qw5EMIto1jlAmgezvxoMpI6F4YHfNBQi/76v2ANljD9tyY7j7gIxQfpF2huzvsHkkP
	 4Ur940OSHY4ig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
Date: Sun,  8 Nov 2026 14:19:51 -0600
Message-ID: <179416929284.628393.3018595425203478493.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
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


On Tue, 29 Sep 2026 15:18:05 +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
> series (bindings, GCC, RPMh clocks and power domains, interconnect,
> pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
> only the SoC and IDP board devicetree, plus a small geni-se binding
> update that lets the QUP wrapper use one address/size cell on 32-bit
> SoCs.
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
      commit: 7f6a63bc5fc9bed3fac66ac57000882926d25f84

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

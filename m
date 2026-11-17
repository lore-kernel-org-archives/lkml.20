Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877529;
	b=psZhEUAPT21cPlDjFIQD6osE1lCVRfx3Uewu+HjwCZFghdYgdPfhWTTNVjtRUS6ane1Y
	 3Ftii+Nep+OqS0VaLPv1cLibDFrm1R3o7XcXNcNBoLyOoSXVTCxSjs8kjUSXTlJN3xkt4
	 Owc4cBqXKZT1EEzrL7hcuIYzs9/tXGrVuB/PzYQsdYxsw/lR7KlxfAKktC60pfSlAKJ43
	 YA9GhiQAqkxHOcPqbGsoJ6Kk3UEQV9Rgug4EUbf0JTC1r+JnhRKdwW/kLiuKJ2kF5O7/t
	 h6Skh/YcJYkdhxZMuVN+19KVdc8EyBQeFkD7gKDz7O1eWGn8Pe/jlRqC0PxmOoz6qMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877529;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aaneaYuk4zwfN2AHPfQmDqDldjV+rFAyh3wcKEZIRyU=;
	b=222bqPQxicTcdX0Y1unc6JujA47A0SCjbRHIKKg8R1AmFnPJdNHC2h+R9gx/ssSJzgF5
	 5qPzrBIo9Ut2MwcAQ8SOlYRmvDiCVGYWIVzH6kFiPE5IY2SiRDqQqbex9b+bc2CzcjCuc
	 1w8bT4n0urHTKNRdeZE95q54y6SAyLmKu5I6nbUc8cjIqd6Ooc/FRO6D2YS4klnxhVhtM
	 BybbXg1Xe3TjTuLJmCB5jR91FsA4EzQjFspMe4uJ3LZ0mqrOHA8Lgc/7rcFlxpC6OdZca
	 D/P34g9Ywii+dzkG7uQRDN09A7AI4Jj/1YIb5Cel4egISMXL6WP6PwT9BDYsPRCOlHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EE19l0vg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B260A5BC0;
	Tue, 17 Nov 2026 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EE19l0vg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C36C1F000CB;
	Tue, 17 Nov 2026 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877529;
	bh=aaneaYuk4zwfN2AHPfQmDqDldjV+rFAyh3wcKEZIRyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EE19l0vgvJuStUePHPIWkMNZDe4JTq3vqeHuYqxyTful/0GqfxprPh0jPTAS5IPHn
	 BM7ucTie6sR2q9sr7Q+GkxtWkN8ICjfy2VdrwoACNEkfYnZpibzjNv9VMhV6Q0x6Az
	 lSUedX1mJ0dFKB7sP8OYTx+7bVyvmDOHwKYFQNxZNVbQhQgj/DBINOy5i/mP2RqgEL
	 eywvG9WIyYRFnPzYWTcywYgEuFNLkGMo9ADJfXLw1QoiMwaAoNjb8CSNbU1+Bqof5w
	 sWDmGLyYN5345eCu8o+UmpddV3zNn6gcQ9fnD9ylggaGEQ3D2BuNRjKxBSbNAF/9B8
	 bMredddmb/04A==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Mon, 16 Nov 2026 19:04:55 -0600
Message-ID: <179487749337.432567.17386126514457747489.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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


On Sat, 31 Oct 2026 21:10:36 +0800, Shawn Guo wrote:
> While the patchset [1] supports SA8255P as a standalone SoC, this series
> offers an alternative by introducing SA8255P as a Lemans family SoC.
> 
> Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
> platform resources like clocks, regulators, interconnects etc. are
> managed by HLOS, and GearVM variant (SA8255P) where they are managed by
> a VM acting as SCMI server.  All Lemans family SoCs actually share the
> same hardware configurations like memory maps, interrupts, DMAs, etc.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support
      commit: e7a91614a2e3d6c7b436618b74f223fb41b7ed00

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

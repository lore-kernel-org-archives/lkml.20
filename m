Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169329;
	b=2iZDwWvuRNWnyOlWZVi+lcxLNPEzBi2e5L7fINYrRm4/0lgq6DKXjdixAOQgQQ7QyQeN
	 nMmrmcShI2WOLBEyNkB9Gpa0sIl3qMjk4+21qYPTvZWxpw1W3sTTZny2Ag1966/t2aaba
	 DCnAfTP416mQiKM6S8zLH2cBJJMhTXwVafWW4waY2C5CnbOr8TW+8hTVfk32jpql/+T0c
	 L21thp/Q/VG2qJLjV/2+f41vX88SbatBbvaN30oZWE/Fgs2VysYJzcovvWHGKoC4YnerM
	 4Y2hOxEMMKwT0nrFpJO/yzjBo5maX9HPanrcInMUIOXcQ+Pj0dR+FN2xwrLdQYjzrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169329;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=150PSyBdgBguenhiu4um82XJh6rG/Gu4UUVZ+zPsSCo=;
	b=TAueT+ie/iBsv0TrIkZeCKaHmU1oEAwporN+ROEgjc9dyVGuy3L/e5MA604P+IFnOtpS
	 wERs65vFpPlkLTWTfAKGHe4VdkwsvlRXodw7lVMqXpJlPpfe1NdP7L38nturYbgFnvpfQ
	 SIqHYnTOMYWVmBwIwL+lyYz4Zyu0P589k/3kFLAA4+P0CxHonbYyID6IivHgfZFCoZZIC
	 TLjuUP1KWI8Sd5mp/qLEYQ1XLqUJi8jbNkwPjsNQMSpofyA9uOMTao5tBgWdv+oe0hSk6
	 xCKXGYUXEZ1qJtrQ/54LgGJssEObKiP6TGYfYiV9+WN+/BeEUfZs1ASCgx5uaVunlQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDShO6fe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75838606D817;
	Sun,  8 Nov 2026 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDShO6fe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B36A1F0089F;
	Sun,  8 Nov 2026 20:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169329;
	bh=150PSyBdgBguenhiu4um82XJh6rG/Gu4UUVZ+zPsSCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fDShO6feAhM9wYQUMLezEspHZUxXuay49Fb/F+6ICvZt52fftDPNBp7Zdx22Yy0gW
	 45FaTWHKw7c6aOVP2hKTlwIqSBJHyXmkPuyrQbLuRrsxgWzy78longAQ7B986Ck1Cp
	 seyfoW148VM5T2sV/sgA9hCJ9gRWtmI+a7GxwFsmW4Ng8AhGA6AkJ7WzkJjleZ5KCl
	 lQpvjFqGm2q6xek2piZpeM9bLmPgWTlKRDnkGK3qNUfoCGnYw1W+kYKZxpfqLzDGJq
	 FmxUDfqIeLisdIdVNl9qD1G1zLviL8E9sY+8Q6fzIEahB7VpspByRM05stwzknV7dg
	 ZHSAN9c6aIpRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM6125
Date: Sun,  8 Nov 2026 14:19:24 -0600
Message-ID: <179416929505.628393.14548120843339364360.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
References: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
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


On Wed, 28 Oct 2026 21:20:41 +0100, Barnabás Czémán wrote:
> Add support for the Qualcomm SM6125 SoC to the protection
> domain mapper. SM6125 shares the same protection domain
> configuration as SM6115.

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add support for SM6125
      commit: 932e8a6405bd4818a646d58ee152403670826069

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AB3D9556;
	Tue, 29 Sep 2026 03:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651769; cv=none; b=bwTXUMg4wUQyakr5c/UYbN1akVPrvnDvAowRzOcJMDFtDkbr2k3s+z3N6JBd7ThxInT8XzRh2Vw0cWC8bHZzagJN90dIWNV+ThE7vjEvMb5iOHVBThlg2A/U3XvSJ96Ib5xlujcrdbBVCn4hCb3ZjO0k920pZJ+DBt+JBvws6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651769; c=relaxed/simple;
	bh=RbACIMJ9oasMI+GZFEONoOSvqRpm0S9sLKaVJ11+IqE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKvSimIHPTL5NrPoxajwVZmNW+e1rkvZRpNUBHO3rVhhCN6l4pDw32ro0Ba6QlzF7C2dRygrzpMvW8jIaPDmAX5pqqHfXE+1bZSkKJ7e3JoedJand9BX9H85fBdeHcCqBJL69iR/TQGF6qkHokzf89OR1wnrMFZkw9hh1oFebo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRNJU+JU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRNJU+JU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFF41F0089C;
	Tue, 29 Sep 2026 03:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651764;
	bh=2teGGgSyOf7SGzGLzh72wNmoxvCPWrKsGv/D6UNkCVQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TRNJU+JUHTTmiuQeWzVbfA2wrByxyNJgjOi5EUOfHebmE7cDltZfMZDBZEfgP4B55
	 Pz7dHKRlEltG2DxA5eUtffuUk+rYkKC1kcY6FZjwd0sgUFJVAdVgwJ5O11tvLEEhxQ
	 hMYGC1ZYnbSAwSq1qmUuH3aREMvvE6caJGNS2QY6bTMeZcWOLAzE64gzgwrS8vlC5X
	 GG4vi5Pw90x5i9yyWCDQ/N9dDUXJj7cfzcCoZc7J27UpJ9L5YSbfwSaPdhlmtyys4M
	 KJX0Wj9f9o60SkK9VkLtQXOCSaaNGl4h32+7Urlz9cJGUj/03WtXAYIEBiw2MJv50e
	 Jsc1hDV+HuEKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Correct white-space style
Date: Mon, 28 Sep 2026 22:14:58 -0500
Message-ID: <179065170920.2673486.9914064510117487722.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:03:44 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/1] arm64: dts: qcom: Correct white-space style
      commit: 9f06fcd862b586678438881b5f73e373b6ba2dc2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

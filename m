Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A893A257C;
	Tue, 29 Sep 2026 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651741; cv=none; b=rVplKC+OP6nRjg3PFuDUIjNBo4yv3/sETubJ/JkdEKdxP6zDBmoIt1TLm0RCdWAhfer2KALU5ZU+0d0daYbsF1l1joY3akLVZzcJwIWUWDSwIDx7hJvpzruKukk/PyGrqO3N0IZKt5p6EpbqaCZ0nuZrFnBTDDP1qlnzeOYAWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651741; c=relaxed/simple;
	bh=8tFdiHfD3dRdVcrb9QpxTnJR18OGNSWY658aZgXDxeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHv7kfIdHyseEx0K2PELc9bIGuHvRhUKDtA6/QusfLlpHICG4K8BE+aJvLTaTFAAU3IgfSZsVT33OZKUTSKO244gaumFDeLNpq3Q6LpntX1puqBawr6+oWPx0CtIuFZCftfwka/ZR5Gp9kF4LOSfgdIDDGYQnYTm1ZjaMHqx7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hA4E6zyH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hA4E6zyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707411F00898;
	Tue, 29 Sep 2026 03:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651734;
	bh=eerAJG3UtvTdTTyRiy3LW6JmDsYeQfee7QbJVfGdg0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hA4E6zyH1WbW8Ac48X7VvTb4Uo3HZkTsLcCsBwBcrqASTjzlvi1AIlNz0TYO3hOU4
	 Lb9rX/1a8O78v/w0RAgj+5mSiWDVqS7KSCaDNzuPSuYsRkPcA45STRwvEHFWeHp/GT
	 R21sshbIEwLqjWlKiJEFHdRPLSzRNAz57LAgSKo9YpCRMehodZEK1z83dOFp7c1KUB
	 84gke4xbTLVINlNbMP7trutbb2AU3v2oTOf7eTXQG+Lhxhl8usSpPUEg63J6+RaE2X
	 1o5qMyHRMLlHMprJZbjEAaILzs8nrbigYcGzr50qYpLzem930Nh3uL3qyqMp6gCjBn
	 JdzYQicLyosjQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot <sashiko-bot@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC power domain
Date: Mon, 28 Sep 2026 22:14:36 -0500
Message-ID: <179065171031.2673486.988019039395011592.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 11:44:14 +0300, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_CX binding
> constant, which is the correct power domain in this case.

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC power domain
      commit: 475aab59d9870d250f521e202d191899c50a3ded

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

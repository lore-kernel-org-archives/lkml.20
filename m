Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1843712D;
	Tue, 29 Sep 2026 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651774; cv=none; b=f2djXPtkJW7P4lwapzkSWn/Xeo7xqiqQvBWKTQSzdUWF9daDBhAjWIWsYRryhFq6NTXt8/qxysELaZnoYlxFUxTJvz6Bk7tSISBqjhEfUkJYMvnee24R7DEosH3YwXuFsrmM84702SCiM5wj5mMbOcPj+xvpBEG3LlQRAypVI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651774; c=relaxed/simple;
	bh=przm6z02MfEjf6TnFSWNzoaAGJ35y7C+RSQKFlpsHTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QuGjXlGLBWjX27Akjc9dNH4WRB2cbd24nXMs+5PyjrEupnRd1+XMwFtuqjBPWeP8vshl5FlU+xeVoG4yeMKUR/lor1NeRBjU4SwECOilxkfU/fG7amQQ5AXTZCkFwTSTDmMMfYIz5I+bE4mgk6+3p4LVFggOIdkaKM+s+JwydCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhRDrf4A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhRDrf4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2371F000FF;
	Tue, 29 Sep 2026 03:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651768;
	bh=Zi3AWAsWdvM22GjvQIVPQFc6Mxss+rvbYqBw7UzGyeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bhRDrf4Al/KtmagUUzQAZ9RFwOOAQMhc9aJe9mNq2QsB7TezKa4K0KyE4N+bk/0Jg
	 4zOAPoMzmsXv+PP7hWcHS953mO1xKuhXxeB4yOmvxhJa2yeFfuBcVAsi782Iiau22V
	 hzY5ufLAndBul031v9zQC30xFbEI/8TU4IUIeK9KKoQRQ7T86RHVIJjUvXZuy8TdL/
	 YKKyiI4q00o5y3DI2E3/u2QSowUSpVhD331Ee0IqaaScn2UwwBRd6QRGpr0rymC2BB
	 NjlqVKCEwOG38eHPrx8gwVx60vsZlzvMaYHAvPsZxOC8g6QAo5P3PqWPDmEjECs/xK
	 jcYRg2GnwMOqg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
Date: Mon, 28 Sep 2026 22:15:02 -0500
Message-ID: <179065170895.2673486.235864561326858076.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
References: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 09:51:55 +0200, Loic Poulain wrote:
> Enable drivers for the EMC2305 fan controller and PCA963x LED
> controller present on the Arduino Ventuno Q board.

Applied, thanks!

[1/1] arm64: defconfig: Enable EMC2305 and PCA963x drivers
      commit: 8b8d8aa9d482b08d5315e4d26631b9891c90e02e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

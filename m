Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1603EB10C;
	Tue, 29 Sep 2026 03:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651783; cv=none; b=oiEqIVL1WzTuzobjg9OPaIbbm8MiiAMLdNRHNffXBk1c2dRPpNDQCxW9g8zOlpe6AEpQRG+tjnTxuDmOx7fEuUkWPT9edwfolCx7T+cHUt7s/oJB0wTdPw2wvYCToUSoANwZmCzj2Ex0ZLuRyFF1lzX7mCu3z7o8sNWXIH7aPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651783; c=relaxed/simple;
	bh=s5BSovUdcHssxwSGllmO/zVmVn2lHNh+hrz3BuW8nfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbPo/K3DSMmCTWb5lJnp44o9TjubcfQL1SSZ4RPWdL9LVpeDfYU3e49CS8IBuF0Unx7n5mgsCZxC8UXisqEhFWuXam05lO7w4iEYliY1r+fF30dZjuJXVJtYluC/UyBLWv2OgHFMstaoZu7FvPLWvUinaFlu0+Fkjlasto3meI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZUf93zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZUf93zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C68B1F0089D;
	Tue, 29 Sep 2026 03:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651777;
	bh=F0EXfyEPzEZVtm24gpdqVeZtY8nvy1qNIwszpr1+RQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hZUf93ztZJCuMLHE6Bn1DsBVLnxaR+y01EO9i5nLJvpy8lu8DCsZJ+EEnDTGygmWa
	 H01WgCJvg0B0d3bHfUN9+0PduoDU1PZy/7XwzEGbKeijvw+dE2rpE2mI3OrViJ3JG2
	 jBTqtQuDeqWfRf+UQsklbihSs/4K7/IlSEBlaBh53bK4hNTKxmluyWxEQ0RGYdQDZ6
	 m6P0T4jrA7CVOz1THe/lhk4zECz/mZ5vkSEc2nC+I1MBkOSrVUrAvkH+Svq9GBgwyn
	 eDPitkVW3v79S9Ul5tR8W1kSMEUI/trk26WnETeLUWaDxhKnykyqHriJWI1xhqiYEm
	 8ZVoGfguOeKpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Day <me@samcday.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>,
	=?UTF-8?q?Pablo=20Correa=20G=C3=B3mez?= <pabloyoyoista@postmarketos.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/3] Add support and enable the debug UART in the Pixel 3a and Pixel 3a XL
Date: Mon, 28 Sep 2026 22:15:09 -0500
Message-ID: <179065171021.2673486.13962030509876280557.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
References: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 26 Sep 2026 18:41:31 +1000, Sam Day wrote:
> In order to get logs through the SBU pins in Google Pixel devices, it is
> necessary to add support to the devicetree, and enable the corresponding
> UART. With this code and an USB-Cereal board, I was able to get full kernel
> logs through serial.
> 
> The previous paragraph is Pablo's original cover letter. I (Sam) decided
> to pick this series up and send this v5, since v4 has been sitting on
> the list for a while now.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sdm670: add default uart pinctrl nodes
      commit: 3719685788549ee7545e5b0b8fb954487c4b71ce
[2/3] arm64: dts: qcom: sdm670: add debug uart soc node
      commit: ec67dd5c5eac15e08ff5a19dc4ec502dc01ee32e
[3/3] arm64: dts: qcom: sdm670-google-common: enable debug uart
      commit: 8adbd3b5ba2a610cc37a2c9daf009a2a3a3c1f8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

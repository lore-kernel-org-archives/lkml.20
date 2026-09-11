Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE643E49C3;
	Fri, 11 Sep 2026 02:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093561; cv=none; b=CgeHi36x/xFyulRCoXfOV/+Chgyng+OcHX8sUWGBYaPzkBuOUbUQL0ueVbOhM8mVMgHsYgkg9+66rEQV/fJX5mXuHUNFY1xRh8aVQGBkWyYmBywOzGIkwWodIGaA3i28UrsfW53hYpYDo951mM23wHPazRNztVzVvisZpRu21ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093561; c=relaxed/simple;
	bh=Hov8Rm2jwlnp6YgqA/Vf06GNQyN0JrcNPtLXlOeUzhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbScS1LAOWfQBDyitk8dXXpDQ6hBb8n82UjGmuK1sWuN1hS8oQMu7XpreH2hTvszoPa4q0E/+r6KMyErK9j4cJs2V2ckCKq+XfILN5HXdcNXWcZxgNKi8IOrgv9mW+6dF1FijjD3M0WUNqRCZGdR+B/Wim/Ziq2v3tLeEQ8AMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2P9b6B0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2P9b6B0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D4A1F00898;
	Fri, 11 Sep 2026 02:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093559;
	bh=Xpwjo3o5ihdCOgH7734DEew75Gj86Gf/99xqR3ebonk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d2P9b6B0sTgrGKR0SWSdYtkNe/5NAV3tQmKFfH0av4VMpbMAuXWuSsbowV0XUBF6X
	 BWECIAyZ3qiIysI8yp9MUlJKkb/G7QfUVDftLa78GYL0/Xgca/9RpTKEuCZAQnARii
	 0IVlZf3YN6QpD6mobLTzOmlsK9yjvhBd+Iw8ZrWWebAiMLJJzspx2vRhLcUIZodSEX
	 mgKSQjFrhAwKH77/yjOGBYUmj/j61Ke5XU5Bm00BQXNEdvjEmirdYlrjL0C2eYXcHB
	 rxvO1XuO0evBurAtuZ+66jCpTEIWRWJVbYjdLykJT9+N8UcX/hOuoyPhuulUhVA9hq
	 NUXqsiFvl+beQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: shikra: enable ST33 TPM support
Date: Thu, 10 Sep 2026 21:25:36 -0500
Message-ID: <178909353848.920241.16570368219263062434.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Sep 2026 12:48:52 +0530, Khalid Faisal Ansari wrote:
> The Shikra EVK platforms support an ST33 TPM connected over SPI5.
> 
> This series first removes GPIOs 14-17 from the reserved ranges so
> that SPI5 can be used by Linux, and then enables the ST33 TPM in
> the common Shikra EVK device tree.
> 
> Changes in v5:
> - Add Reviewed-by tag from Konrad Dybcio for v4-patch 1.
> - Keep node references in alphabetical order.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: shikra: enable ST33 TPM
      commit: 9f27d5c53a4d3b5a5ab80fe2efa7c72ed04e350e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

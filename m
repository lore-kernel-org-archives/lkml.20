Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7995493638;
	Mon, 31 Aug 2026 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198857; cv=none; b=Z1K8lr1YEmQPpGEKZEtCH5uBWtLMyV/TZADz+WxNh3N+ML3CSKQ60YfUijWf7qnX4nbvozUv5gGZzfBCGc2ekyDYfXnhUFkmceSAMjCrHXA44qvmVqLnqej6/zaESsC6LJKaxTVGwxGxQeeuwwFJFdUgfW2Djidav9H84cfh5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198857; c=relaxed/simple;
	bh=t+brYZ6ejWzF06djIicvE3pdT+97rLezo71I4dBWvn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JV4qMLtnqCpQr67ixRPxWHtcFV+SrVL8bvgdx0lACLYh4PV7aVGYR9oReV60O1GhiJLvArcqbzVGBvVnx8ZBYcBSXgUUPB5LyLgizx63p4wd+DDesB+XfABKbnK9nj0WrOoxnPtBDNRNGFpPG7RQCY94TF0Mi+ALJPt5LEpj5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=To1gEt25; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="To1gEt25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5451F00A3F;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198855;
	bh=8K8mr3K2ZRGakDpvMsTuQC0YW+VO/gEKJzjJpNqUvkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=To1gEt25778W6tDqyl395F8gbTuVe5E+X4Malfr0/Pke1g5uRfI+yJ5tc4LtstaQF
	 YS34mDfbiet2hMKl4R5FqFf2Ld2ZVBF/HLuYJr74rfeHaEdfJUKgLwr+pyl87epI/G
	 r2wqxD5vE5W9+0yNgmoQif1cZlSMipqXj48ZC975U59tUL7gtmZSenpbo4JkqlPifa
	 iwoa9m/Rv+zl84x/9e2HHklFrQJMMYBC2yxpx9c97fmSZi7HWaSo3TLoSwDO/v1jax
	 Ebe1cBNQyVKZ3IdYSaoFJioGFF4v/t9+LGva81O9tijNlBZEpbbNbCi2Z5k1yFgY32
	 KZ/ul8z3kD8sA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	KancyJoe <kancy2333@outlook.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes
Date: Mon, 31 Aug 2026 12:53:45 -0500
Message-ID: <178819882967.1411250.2986756065298458712.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 10:20:52 +0200, Neil Armstrong wrote:
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes
      commit: 3465c7448d209ef807f4575b5f1eff0e2ad8dc03

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29E53F58E5;
	Tue, 29 Sep 2026 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651773; cv=none; b=JFeoFBS/LEkbtLHNBVJH+nh+Pyx9rlT0STD7QF9JHHzL2SCGnKvjOXOu5r4o471hwc6+vvtaDx1bx6lcvCdew5ITf8ao/ZocAI0lYo7uESrOCf/y6tml1tKZetEixNo2irt5BkMr8nEOFY2oaU2fxWx73FjvHa/G+j5e1eEVv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651773; c=relaxed/simple;
	bh=aEQ32ZNSBlY1H1fxZEPRPyxZ95WkZlLTOL/ux/70GQU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1bwhZN6YmXB+FDpykn7fH/gho/S5EHnr6yAENZ5QOlkQoUsdJOZ0yxts//8Xw1W/1EkGQxpcxLY+i+bqeQ+i18hiGjkE4GjjjqKyjVeFpsA/tgVei/HtASY39lbuObuC/R4TE8Av7gb9hl0N2nSKoNtu+ZDvjKxxx4mg4bqob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ST1EV9Zj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ST1EV9Zj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F8A1F0089F;
	Tue, 29 Sep 2026 03:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651763;
	bh=F/769CA8jSk8LJ9LwhK0JrbLxjBCtyQiWyWBhGTx9cA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ST1EV9ZjDE6CLuXJvtCGQ8JEh64RRjNv2aIuouOMZCVC0nHBqvpUGqvwHV5pwOoT2
	 lH8E67u48eBTbRw0nVAJ0gOmy55eRBwYTJik3U7bQ44w+kapOiHnyRgFf7c+5CM8BS
	 yfIEV6vtgEDWZDbmpwaa18GKX07Nc1ueMAREsHQP+3/D1UcATV0NahhWmiwJJgmMxF
	 Qw+kjJiP1IOkrK9MWM7M4DHCF6e+X4VJxdLQl0F52D+IV0aX2yo9ILh2AEffUDzplN
	 5v/qIcWgNCvXo8NyU+yELWRAMogrXd7UMVgrhLquhcV+pzrnDQzCluid+O05qMjQdl
	 b7bHWha95YWUw==
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
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
Date: Mon, 28 Sep 2026 22:14:57 -0500
Message-ID: <179065171003.2673486.9124815945126051013.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 13 Sep 2026 16:14:41 +0200, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Correct inconsistent indentation
      commit: a6ffb0b51502d9803e43db9b44791f992f39bc46

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

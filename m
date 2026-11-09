Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230321;
	b=g0DW0PaiNiXLDCLFRIWxhUiXF47kBmu73iVzj2tWvrhWxwLnNOB4hIr9VQdoSjIiuqWa
	 zFLdyM4X1rC3yKpkv5peeDhG7UCbCH/ykpXtOWVNK6rsgwSS/qMsi3etB6GpNCq96147e
	 i1ksxAZwggk4jkcAcjJU1BQj+G3OyltZ0MQdDDJ0Po/pdTFAKr/WD+u1Di9lFdau7tOPm
	 EZ4M8J/ZuU/XWg4l+yzOddUJndMx9Fd1kuF/iAAwq+5fHHmuu622OyWipiDQsSN+wyGnh
	 PKinnVZvwmUMD444Rot8dn+Ry5QQ6RoXmTh+5JiPJ6TMBEPpmMUT4Wa6GFOsKVsPApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230321;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jUC4xU7GLR0lUXcG/Ph02CbwZeP2anHiOEbdvE2QjrA=;
	b=besXYvuefVp1zDP4AODgXNDKo1gS4tFtl5o8VLBp7iBbTd/eFhtKmLWVMAq0WxWLVyiN
	 XmpZKyk1ZAEXfrD2J7+6M1mvtIcFd/ov4v2wIQ1oMI9WQKvgycWv5LO0Yj+Zt2M7LtQbk
	 Ncafshe+5ijfEGqnqa5EubWPpIVC0XZnDbB1a7oLFwdg37AZRtUuIC6Hc6qWRyJnaw1A/
	 vbMgyIxj7EjQHh5X0DGjlV79t08kdmvJuiFvhd0NC67UoOZnNGnhWCEIbKXSsQL3Ylxjk
	 /W198nLKArUILhfNlvub568P1dpx7iJYXniFM4OjyvUfgAaOMogk/17qVpeYaSYb8zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYklXe4m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A5606A331;
	Mon,  9 Nov 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYklXe4m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF181F00902;
	Mon,  9 Nov 2026 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230321;
	bh=jUC4xU7GLR0lUXcG/Ph02CbwZeP2anHiOEbdvE2QjrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYklXe4mVOfsiajj3ZoFaH+Sk9ouDYm+pIn3jGwOoeCGkbzMmapayrKEU/jak9aXb
	 uWbEMYARQkUurWIWglMagalspD48xDoTs5n1fdUHdThPwtg8Fd14y446Ylvlj91AUq
	 bAmZILJ3BZpZzyyXAoNwK2jtf3ZBx31aQqG5ItqXKfKkn9MZKFN8420C/HXlmMMDsp
	 QgMLslwwkTcQ6tNOW0eMMRJREp6NodtCEhld+0HzGwgdKqhsxhsh7co9B1EELmsvvM
	 SllX1yAAStNBNauGO7PGwgv+FyFHWkXTfqsWd7v3A6KYCp9HnsyPKSsANMETpJqr3Z
	 JbGF0iMzGpQtQ==
Date: Mon, 9 Nov 2026 14:18:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: power: Remove orphan mt6765-power.h include
Message-ID: <20261109-nonchalant-stereotyped-goose-1bf3ac@quoll>
References: <20261105143647.2727937-1-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105143647.2727937-1-robh@kernel.org>

On Thu, Nov 05, 2026 at 08:36:47AM -0600, Rob Herring (Arm) wrote:
> Commit 22a77ae9bae2 ("dt-bindings: power: Convert mediatek,mt2701-scpsys
> to DT schema") dropped support for MT6765, but missed removing the
> include.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/power/mt6765-power.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 include/dt-bindings/power/mt6765-power.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


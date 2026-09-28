Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7620D4FC;
	Mon, 28 Sep 2026 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633889; cv=none; b=uVvyjtol981PfDRItNrvJUGFNmyEp9Vo2NVNgLHRF1eMbHAS5XYyxHCZvg9zZyZkQZ5P2bTi1EUza1E8g7D77jt6fw9IAUzLK5w6bY0a+pcUQYud3B8e46+k1cJ1tQyxbyF5nrakoyU6PQbhyIPwG4pHHrlXLY1bhEpBN0+ivi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633889; c=relaxed/simple;
	bh=8R3/BbhrDMmvNHH76fn5GwLsTMpqwHu1f3r2mdLQfXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI53gOjX33saRzA3sLfBf8LuiOwMbg5Tsv79IFJCzufNlNcfenn0DUnwVQ9aHcWyekD5RCusxg4nGgX6jbJ04WOWUKtibXj7JCO3lfWCJ7aeMlK01s03uCSDAR29+2i5wztqvfnTkPR3cCyn9tnxKShbZjzmpFVlrH67WH5Y6IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyOf9mY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyOf9mY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D991F000FF;
	Mon, 28 Sep 2026 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790633888;
	bh=Y5njVTOmYr+X0yyc6IPDazh9pfwPlRrvD2EpwW79+6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eyOf9mY28UPgiDqEMYs96aVfi0epPdGLf4MrlL933PScyAN37kECV9Uda7IREN3UA
	 azMmRZFdshY3RtnwcddPcE+aABaU9RZyfhfsF3bfOOfVFrWaNZWV7+VYFNS3+MiU0+
	 mxXzNVa6dvUy+d76IKyWlRdranl43068/+9ScQfLBEiefTcicyTH7Id0vbz3PEkNBw
	 hHZrUph3xJ85ZIlSJe4BBZkwCxowG05gNJ5bTt1ODvH5JIcdgRkiN3iUK2Abu8KLd5
	 M6rXWMyrcerb6D4EZPjTAjZhRcv58MQuBh+1TxZTZuTk1hafBukUnctf5J0qdcSP5E
	 Cg0ANitDfcpZA==
Date: Mon, 28 Sep 2026 17:18:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, 
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: Add initial support for Nord
 Ride Embedded board
Message-ID: <arrnd5wzif1ALS_z@zenbook>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-7-shengchao.guo@oss.qualcomm.com>

On Sun, Sep 20, 2026 at 04:49:20PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
[..]
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> new file mode 100644
> index 000000000000..09ee525764ef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -0,0 +1,442 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "nord-embedded.dtsi"
> +#include "pmau0102-nord.dtsi"
> +#include "pmm8650au-nord.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SA8797P Ride Embedded";

What is the actual name of this board?

Regards,
Bjorn

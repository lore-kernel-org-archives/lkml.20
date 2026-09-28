Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75E4973A2;
	Mon, 28 Sep 2026 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590351; cv=none; b=VVKLRMhRK8r5cZ3PNKsH1fCWy9N3//4kC9W7zQeu8h229Oni4SONRzQW4vzi4yRKgp3dBqK7+vNma9noTTxMUp9vutmDXFZ9hxdwSt3JUTdnFn5jldvj2EXca4WqlvIAP4GidEHUPIKjKh8VUia0MySxQGw5iqgB+BBxuhDOXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590351; c=relaxed/simple;
	bh=Y1Kt8mJvaTh/xjAd6TP+xz+U92kmxMTNpwVMwRnN+18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwWwDfpQjjaFiGp5e8b7OZP01g6HnpGqtpWaxCPQH9vpVyAAzRIMW33kbSS+LtmR6HHtEPqTMXdKzVFgtlbKKFbcQesqEi9Ljez1C4dxs/cu7WqE45Yh3FaqBp3ifvXHCLjkzOeBUfLqRI2Id/fT+tV0XYgzBMd6u43OxpCDjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8Axq38J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8Axq38J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAC61F000FF;
	Mon, 28 Sep 2026 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590349;
	bh=LPXBbtH8arx5Ywwa/MpxBRIT9dp2/co/kq2hc9i8TR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8Axq38J6OIqckGMFib2U5D1Sie4VAL0YAFq4joRnI0DQAEjf0TmLrxj1kHW0cKH1
	 bq2w19oBvbwJqT+HE5gkIZN8+/UZ8s4KQQckxJmZoPhgYtrRzbs/QQah/ciaM/B+Qd
	 claU/pBHVnGoJ3HlbuMixLBti+ZaGSbjS8BllxO9IG4ZSVXqr0Q9eRZpk8DkqQbTJQ
	 oy1p75z3IZFk7pUc9KX7CU7mhkGORPnCALDok6/x+gxPXLC4OP7hdZToLZ9kjjFe20
	 q9y7spoYszHvWL8iB1ZzA+Qc+JVHgvyglxqcaKXJKRQKhFgks9bw78I3ab2rDnTc+J
	 +P+yGkeMseMNQ==
Date: Mon, 28 Sep 2026 12:12:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Message-ID: <20260928-futuristic-overjoyed-bobcat-adbe8f@quoll>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-1-ac2b1b76bfd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-maili-dts-v1-1-ac2b1b76bfd9@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 04:19:58PM -0700, Jingyi Wang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Document the Maili SoC binding and the board which use it.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


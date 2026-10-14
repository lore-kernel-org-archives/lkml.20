Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591D4BF949;
	Wed, 14 Oct 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977133; cv=none; b=Z8aRcu8FFqXD4z4aQUK28BE0/DiS71JMeycWO/VJsvuAn55KV53ePoj/QlIW29usbUVta+xttP35coRiW9akjL89kC5FiO3sDVl1VZW/PC02kQtBP5x268Tf93ArThVFQ2rmxQpm/MwwFJ050PYL4jXbJKF+9FWzLm6svyiKHP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977133; c=relaxed/simple;
	bh=IOXuADb4afen7zNJXQF61Bxu+j539tGD4ROIqw21Z/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiEYMdwm4/JWgim3vp4oq0AN4hac4R4JQoAijn6qw8Z1qc/23vTj+D76CXaToNCaKrdJiz7CIxjnMMoi5nwZn1iitrzcvBxg7cGneQDLGDcu0LZ/+eFJ1lnQ53E6UlzUUMyy/85WhVAPvu4/ci0vL6v2x2mnRSR2CMcwpRJaT+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJYyk2/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJYyk2/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E002E1F000FF;
	Wed, 14 Oct 2026 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791977131;
	bh=fHVDW+jUX+tKqVbvfQATwTLnX0a6WAuAqIrF+8CjxJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJYyk2/W0V1+w7nSWu/WRNGKJbxaC3AxXWnjyVKFF8kgTWOSZHM4pU3ZQFkq55Pjm
	 1ZaEb1uNipgU5Exb7SUmipY7N+UrWgRWvMD4kYgamZgfGj7WnNfFITTgwVwj1n3Xmk
	 CsdXnXUmA+/v0/qnEQ5uU7vVsiIp77ue6UlwZcK4Tt+NgZrOCFZSXIWgSMmAvY4GUp
	 isFvwWXq/tRVDo5kVxSIbf8W0hyMCocGjqqgnBpg0jDru41to5hKMBdY/gDLYA7RdB
	 56vl5wgIbhrlLR6HGGevkfhoJyzU3bqG1TSEpIwiEwT6PqfS3GCQL0cfCA7EVMnW1+
	 ATPW9e7TmTb5A==
Date: Wed, 14 Oct 2026 13:25:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document HP EliteBook 6 G1q
Message-ID: <20261014-frisky-vivacious-dormouse-d4b40c@quoll>
References: <20261013-add-elitebook-6-dts-v1-0-f22e67fc7f9d@canonical.com>
 <20261013-add-elitebook-6-dts-v1-1-f22e67fc7f9d@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-add-elitebook-6-dts-v1-1-f22e67fc7f9d@canonical.com>

On Tue, Oct 13, 2026 at 04:40:56PM +0200, Juerg Haefliger wrote:
> Add a compatible for the HP EliteBook 6 G1q 14 inch Notebook Next Gen AI
> PC, based on the Qualcomm Snapdragon X1P42100 SoC.
> 
> PDF link: https://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c09121784

I think this is usually "Datasheet:" or just "Link:".

> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


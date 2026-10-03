Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931063164D6;
	Sat,  3 Oct 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038282; cv=none; b=SyzeBrtyw5DmnPIvOF1jtJy/lnoee5W224x4DFnxOLpBsdWslGD/sZT+CB7fACVPZceq+xfTdzD/Y38oPPExri+SAV9N3Cg6MQJ2LV8yG7ffDevXIdbEc/5I33/H5owjvi6+MfNXbIRPpYxyPlj5yiM0parlQtMonmaq0IDDYAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038282; c=relaxed/simple;
	bh=vgov6xBBjZPDi+H2RlfVYCA/EqhqRcvzwTv1paxWAdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EutT0My5FUZGsWV+D2QYBskD9o6LY8gse6hjfkQvvoRTjfj0eCeGI18c20X5VuYT+r+QBMf+pa52NPNIeH8JJ3/NaK5WOV2DvIlOPTtqa0ZIU9STpOjLthxflzd/0pXv1GQuBSUV/U/jSsG6vuuo9ZWF4imtqScZ0SYAAznJu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkNjdnQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkNjdnQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9B81F0089B;
	Sat,  3 Oct 2026 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038281;
	bh=yP/Ub+30zHvSU5UOjAMQOlbfGUXbMvG8ihsUSS8KT4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkNjdnQ37F4LsVH0DzITRMrmcQVA0cbLU2WhqtycxRNlI/gx3HNqCR//z+i4bc1AQ
	 JvOYlHDBgb3l0KPpPsZdGSlVX0CRPlYsMukQ/bxE85R3pzR28tZ9adawAr1VOGifBu
	 3yZMsnJhRMfS3mKonivMavc1y1bUXIJSymPX4M026d5kvDowHfsQDM1YoODULZ+/mV
	 IdVyZzdpTomKKly7eMY3HtgjFjCWUGgVJrH6L2DQitQynaAVrgb9a44OypAeFopcfz
	 nkCySMmfBEU60+7Yawqt6TiDvos/a8Li9JamQ9uJl1ZJuhHubd/ZzDMipSXYjEK1g2
	 83Bj8CDKP24qA==
Date: Sat, 3 Oct 2026 16:37:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
Message-ID: <20261003-thoughtful-daring-limpet-200228@quoll>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
 <20261002-imem_restart_reason-v2-1-61703c6362e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261002-imem_restart_reason-v2-1-61703c6362e3@oss.qualcomm.com>

On Fri, Oct 02, 2026 at 06:33:02PM +0530, Kathiravan Thirumoorthy wrote:
> Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
> and IPQ5332 SoCs.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


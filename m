Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44D2E4257;
	Mon,  7 Sep 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761547; cv=none; b=IiR/+V/IoPh4olJLIviNjPTEGmt3qaQ5bH2iuooulO4Gux0fi2yws7l9sSeqRvufKKCZG6gQLZFDg8PFbhjEyzD+r/s7u7pW0OnHf9rHXuJeqzkIhzB7p+VQuwP7/VbHqKfWvljFmRPcDNvDv1k0cyLV9nZUeh58OIGcluCvw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761547; c=relaxed/simple;
	bh=b8DPEUF6Dcf8dRSHE6FIljtsfPZ2f4lFfNYbtFxDW3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slEOZyIbqae3+/SkvEw4kvLAUc8r+xwTTiXWw+0aUfpCxMAuKcoytKtSxWHxZJWCdMy+yWvytpApwLQfncvsE8fUCWnoMoaVPJ/Qa08FoEnrxHFrXObYIGYieNJlBm+lcjbcXRhWzMi8+ynnnJu8SGMwv823ZT7TCZAEw+XbQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gU45Zf7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gU45Zf7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA6E1F00A3A;
	Mon,  7 Sep 2026 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761545;
	bh=JAvrEwXqqWCVQAuDFZAxAYaZ+IyHoFVwskUDWUWe2i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gU45Zf7maoHD3FyxPH6/dIJhv/vvtxjqcFSfJPFrpReivmUZBJEghMrjQzbv2450+
	 6zBnyNlO9HwuCNVk8ZXZCmKZaEdHfULW5Qy7AjrnY2gr2EceDjGyHHnyj6ptBy5iEZ
	 EAaKTZFZDPlNtRM9jjNDCJy1SaqC/qCLse6YQWHpuY2Haad5BRutPpnx4C8AG9rhe1
	 PosbmSL4eV51y2OdynuhwFHDnsaYY1LUqAOuecgIfXuy2JuUDDKUWTbZpJvzE/ftqu
	 DKOTNWjfNLC9Nvl4Gv2ENmUHWm1BwTjJ8whZMWvYMZA5Zpi/MWKmcbn86wt2KjzOQH
	 tbZya7bOeWoAA==
Date: Mon, 7 Sep 2026 08:12:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2-phy: Document the
 Nord eUSB2 PHY
Message-ID: <20260907-eminent-silky-dog-98e56a@quoll>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901095055.42229-3-shengchao.guo@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 05:50:53PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
> It is compatible with the sm8550 eUSB2 PHY.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

This should be squashed with previous patch. Why reset is being made
optional? The change itself had not meaning, no sense. It was made
optional as part of qcom,nord-snps-eusb2-phy requirements... unless it
was all about drivers?

Best regards,
Krzysztof


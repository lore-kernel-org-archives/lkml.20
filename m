Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A744A3F3F;
	Thu, 10 Sep 2026 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052746; cv=none; b=Z1aoYlgjIOl9fgfvmyKnD88Lv2KB/sdwiC0fTAJQAGkJi5XuhrhKE3LJlQMOrrtHW6Rlqg/RdR/h9VdukvXztZkSd6gHnIAU6YZD7l9H3cLO8GAukjwCX1UwgkB91Q57kSFiNh0dvB9eR7/8Fj0Jx8SPSvIG8b6KZ9FulTFEqmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052746; c=relaxed/simple;
	bh=O70yEI1pPnFpud5qoO9FT7VNRhm5mP60rnj+d43hRhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMJGj+eMP3FnChYUn/Qdh+ynDJWAT8IL0vbIrgrRBPvIz9qfwQMqXuR7Mc4PsCb7CcCZJ1c4fdwUt/me9VPhyRBA60YynNvWdZbym/LcOJ9oblalPMMcrVkm3uvI3JVtctZ6QDHcaASrU9clQf4RCm0nMP7bz0X52ALCCjECI7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTPa37ao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTPa37ao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10D11F000FF;
	Thu, 10 Sep 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789052740;
	bh=fNJfBB0dtBLdMyGIkCZwE78OBlB5VJOhJPRoi8njbN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eTPa37ao7xBiYzSwzThZutJOJBBh0xOQF4YPJKD+xCGi9HfM2APjrnsGGvsV7weXa
	 pGJRLbfk8jLgQFwKz5d0MMGa2lgoUZUiUF7PK/QzJZUD0tJo8u6Ys3WFlip4Qz9Dik
	 PPPpX94Uoj5/+yCpolZUWZmcFwl3yC4sJXoxMzqfPdf4feBrgNQ4T/A0eYjtodLqdv
	 rr26gTf0pYPxChuopk8YOf9ph5g+HylQuMqOrJjBmtLO+9C+QzGww+9g8ykqmggtnZ
	 5CzdUGefnQUUQYbyneZ7bz2U3orcUFAxhIKtszxSV38DCgiBxQbluzO3ojX5j29CK7
	 CsIyDT0aFhGow==
Date: Thu, 10 Sep 2026 17:05:31 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ronak Raheja <ronak.raheja@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Message-ID: <xvq35z7lmbbeu6e65m2wcepd3mar4uhh2nuhf25n5xibrjec3g@y33hgycfqzgg>
References: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811160835.2968717-1-mojha@qti.qualcomm.com>

On Tue, Aug 11, 2026 at 09:38:35PM +0530, Mukesh Ojha wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document the Synopsys DWC3 USB controller found on the Hawi platform.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

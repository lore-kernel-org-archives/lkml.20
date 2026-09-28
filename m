Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2139733E;
	Mon, 28 Sep 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624885; cv=none; b=ZYtDw5CV7TxDHPGloTHnwM4vbHnW7QR1yqOV1zoVvTtTbbhai4ztnTs+pOgr6U5Ggn4DDFqlce1zaIfjmDeFNx2n2BcxxmhAWx4Z0RcnoH2vLpZ310/cCMp1RPji8wNLSBHDpzDnUPsT0OmjL3oFlQZG64aCm9HuFrBBh4sJxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624885; c=relaxed/simple;
	bh=q86d9jgRZikGjVflNfaBvoUEHbKTTsEfz/kaHycH2OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXPG7E4MPv5C9Lh7XCAkG9JYJ9+/Mvd65yK4HeCNT0i12xDUIytb9COPaRatOPGwcoNWipJvy7kLPZSykrTvSmyuYHVr7O1SSADwuYzEyr3mAg+nH8RWkYFRbCQHW3NHX7oOQeRWO28mqlEykPypqWveEbhKxgXxVIO+FSgtpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzCOqkhg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzCOqkhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A3A1F00899;
	Mon, 28 Sep 2026 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790624883;
	bh=Nn6UfohwSZWRhwAdtoNPetXC5ALQ2NXtXpw/s08SktE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzCOqkhg8LxCQ4KjVQb6fAYDokRLujyVNJ6c6bpkmkacZpNNWh/hM4JIh8fovtsN+
	 4RI6zkyWeS56IW52DJyhfE1ZeSWQcMTfPx64culbNnplwntlnLFuX8FtLJUx24d0mA
	 E5ldYkYjFIso10gIXNdEn33F/0ilEoARtWZG9IDxP0Y5dietY5nPIV+JiTHOIESf3K
	 24tYLPPBYSeF5/OBVPseKR5U8pNGodXZr71dYf67xN2g/RyeTvC3VBpJ4/nMAseg7+
	 eJ/ix37aXs3ePZeeoZhOTkTqZ2RTBH1jE5BDNwAPNDeqDb0jJQhRi86pibEIwveNqB
	 WElxUZ5Vom/Fw==
Date: Mon, 28 Sep 2026 14:48:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>, devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Message-ID: <179062487989.455878.4686687002936770689.robh@kernel.org>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com>


On Fri, 18 Sep 2026 22:12:45 +0530, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PM8010 can communicate over both SPMI and I2C, based on whether
> GPIO1 is pulled high or low respectively. Since the qcom,pm8010
> compatible is already taken in the SPMI PMIC bindings and that set of
> properties is heavily tailored towards SPMI, introduce a secondary
> compatible to handle the I2C case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


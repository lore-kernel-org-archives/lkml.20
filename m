Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092115;
	b=EZKACD3jtsg8R8oec2yPDgOj3xXkmBkVHpm+bfqsNJlGCKNLj0zwNqcotSTLclaI/1c3
	 x28vC8W42MTJitAPnIQQXzdbqsnJkRA4Mzj3QDdw2321ngjnw54Jxf4N7bj063VhvGcQu
	 KHG8GgsX2KP5uQRZdoUe272EnA4Oi8vsdQzhgmUjN5OuAz07WNMLcFvO60xjIxH8Wfunp
	 KbGmNtwBzSMIA4Y+7L5Q/GNjQ9NdbY0PIFYkqWrHE1Lw6Ys9soNSA/JUGEwzS8LGB9zPC
	 WHyeMhee5U9vMAW4Hascejd1exBs+8G/jfr7AacI08xi1YTBPdZ9LXSWbGtmR4MptsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092115;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FVM6vTB/7eDdSwBHkkyGuCuKCEXrOdJ0onmA66YPA80=;
	b=gRZaF5wixdhFu/xHOJ/G24IwB7mIr7ntb9oQX3XiZQrreZ2prR9aQYZxYyU3X7yz128f
	 MrAaECrzmmi3mAY8XJ1MhfdAR5nOmRqSI7lpbOP4JezjV5mK6APn4BJ0XXJ1l6chDGktL
	 OQ2L8mXmgijHLD7mY20gNSpaLEXoRF1o2siL5iNWmUPNycbyHg3kkJ0+06Ghrgc4b6/TJ
	 fS96+ILwKYMTMHtlp+89dFebfEXaK7qlr+7wka5xIaambhGFRTgXusV1OmRcKYT1wcSYl
	 RYOsEjjoNSkfMWddn+kpckN1xCIjvArAlZWcJJPNKC4pmosb9G0RWZxAdmR8qH6yVBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUbTT+3Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB825606A334;
	Sat,  7 Nov 2026 22:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUbTT+3Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C6E1F0089F;
	Sat,  7 Nov 2026 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794092114;
	bh=FVM6vTB/7eDdSwBHkkyGuCuKCEXrOdJ0onmA66YPA80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUbTT+3Ywk0rFTlfiIED0M9qdScuZG/gleAeiG9j5JfiMNtJXXTR6nr+C7F3pOlWO
	 BZr+71O2Jeg0hGeFIn6xRv1u+3zuqr7n/6bjH9viNKpcqVYvhiwObltNvz7mrIpv/8
	 scLIdeamIWpD5NXv5bZIyfgSuXoKJGTuuM2cmylwXP6n/wrbPgZuAXJShOAetV19ZQ
	 PwVU0dYt8zE0Kp+5CBIOUGW5DmPh9e6583jHTiETNf0etfHBUGP73eHwlWjqvMAr5m
	 cAB25H4lLUpBrwEwx1886DLyfApkGvPxzGchFc9/TQUepg7weYa/i2QjwQykvHKIxJ
	 AxC2ulv+zWbLQ==
Date: Sat, 7 Nov 2026 16:55:09 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <au-r4tTc2DPirKL3@zenbook>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
 <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
 <auMOSm_roh5S-DTY@QCOM-aGQu4IUr3Y>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auMOSm_roh5S-DTY@QCOM-aGQu4IUr3Y>

On Thu, Oct 29, 2026 at 05:13:46PM +0800, Shawn Guo wrote:
> On Wed, Oct 21, 2026 at 11:56:55AM +0200, Konrad Dybcio wrote:
> > On 10/21/26 9:36 AM, Shawn Guo wrote:
> > > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > > 
> > > Add support for the Qualcomm Nord SoC to the protection domain mapper.
> > > 
> > > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > 
> > [...]
> > 
> > > +static const struct qcom_pdm_domain_data *nord_domains[] = {
> > > +	&adsp_audio_pd,
> > > +	&adsp_root_pd,
> > > +	&adsp1_root_pd,
> > > +	&cdsp_root_pd,
> > 
> > I see 3 more CDSPs:
> > 
> > https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/
> 
> Yes, we have 4 CDSPs on Nord, and they share the same instance ID and root
> domain. I will add the info to commit message.

Please make that the default way of writing commit messages.

Regards,
Bjorn

> 
> Shawn

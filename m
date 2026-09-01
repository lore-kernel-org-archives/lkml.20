Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C35318EC5;
	Tue,  1 Sep 2026 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266760; cv=none; b=m2yEJd7EHWUnbNoJtTnwp7/vsdty/+EjQOMQWUK/hzP/RXrxMqL3G+AKBoJnp4sNUlIX545/qqVGSsDdj5kK+y5Ao8lGxn4tDCmNKXQxU138txdSXNLLavofJag99PRaqU3AlwvOb38jqhuiHQmkCGJJEMiVuG0knb6sWOjS/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266760; c=relaxed/simple;
	bh=MoCpk0/6q0hwvTP+Dqr3dVaVQHUMFmukWcDaSMjIQSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV4GyKZIj1ZYXPgenJ0sp9vNfh2xed2tD6eaeM1raL5CJcfVQrdtLo/AVlCf0za8dzN/h4EAj6+GK5G5ea9z61KDoGptUTgcZuRSpyPw1OtC3PguBHRvzlI9wgfnzWCniWIDI+R3ClzT2wrCHLlCxgsC/SM+unI1OxWPrf7Qcsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+YyZM/9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+YyZM/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214431F000E9;
	Tue,  1 Sep 2026 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788266759;
	bh=RazYKUpdfpPz7uZDCd2IAM5cS0JehNuksA95BlTXXuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V+YyZM/9th644UkgJhS0rwA1eOOguyJl/Tw6IS39JJv59oidGUPG4T0wKhj+d+Emn
	 us/8pJFRJy3nhL5wCaCb6ceTXHaZEkPiKvLJ/G5Pls18N2jlxSbDIyP1I11Jk64jM8
	 fRtIlpJxZNsdo6EwbJgav/sPrJjUzUL5inXm7GCtSioxGN4JeiT2qsv0mdjIwjEFoZ
	 oa9vBhdnZdeJz22V3QLoFfNPDhl72YB/r3h/QkXA6YplT39J4m5mkjV257VfjILosC
	 6bNJiu5MRFE0ELYQI8wy9aMfVr6YuEN4y72e8VszPBGHTgPy7KhRLt+mvyaBLdLJEP
	 56bOhW9aru3tg==
Date: Tue, 1 Sep 2026 14:45:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Message-ID: <ltdod75qfvs5mvuwx5wvqezj4nzwt76joszjksxjiejfg5qka2@drotnkjgrcui>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-4-aec9d2cb31f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820-topic-usb4phy-v4-4-aec9d2cb31f6@oss.qualcomm.com>

On Thu, Aug 20, 2026 at 04:24:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the offsets and configuration tables to support USB4 and
> Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

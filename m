Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9C175A88;
	Tue,  6 Oct 2026 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255402; cv=none; b=YO6WVl7cLyfTrlMgD7djU9ZcMwTz46F0dHYxuSWh/NFHtDAJkSsKyAUnTeYEyRfNNRreOCD+mVaFCgHBtqKcMvWztjh7KXuk7jFT0N8mcA/2uJoJWBGU26fXPnxMcL+dqn4c+Etd42mxKubxhZC0uxRAvZxX6Uv9z9dNY9kbe1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255402; c=relaxed/simple;
	bh=uKPrbF55Gslv65KU3HGDjed2hDppoFNvUTJHKR23S7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VclYOsMnIF+NMkODQHGLuPX9fgTvM2maGOlh0PjcL0OOaMr3y9OhhjvbJ3ZJquIEbrZAYPiqXInijX804HCkhPm/tzjAbUlzXJUYTlxb6xftZ+MnOx1URGP/G7FqEmU/mDQ1sGz/zKwvpBFVHQ8baRawfAlJ9XQW7T7XLKpZCzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AL6zupBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AL6zupBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB4D1F000FF;
	Tue,  6 Oct 2026 02:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791255401;
	bh=9zHK8j23wbr7hC5wphrEJ3qYPUmzN5TFe/Q39Z5TS9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AL6zupBoHJ8ld7liOmebku7uVBpd6mml8pOeBOYa3rZvGWZteN/ghO61e2qCSiLwG
	 wwbeu8eHcqXOJQMG84KSVQOfz1hvCDas+HYzbFTKZTzLprkIJcx+X0sdI/0LSHqcPV
	 RNlc3SwOpaR1vsHEC6oPPobDMQJW1NDQvmxAhS2ZT8VOnMTTjW2reEfsXdmrUD8qtY
	 mwfl/ceLtadFr0I7ZPUMfVe+LZXq8BnWshDJ+73AwGd+NnCiVRIrONpVRDPTVsn3sl
	 MsO34r/xHXmbLvMzWxs6zbfdwfSigRydoN2ALvfT9iE4oL0JSEVLG583mB71hsuhet
	 bPWbApNUH7reg==
Date: Mon, 5 Oct 2026 21:56:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	jeyaprakash.soundrapandian@oss.qualcomm.com,
	Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v18 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
Message-ID: <179125539959.3457124.1576210148320223378.robh@kernel.org>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>


On Sat, 03 Oct 2026 02:02:13 -0700, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++++++++++++++
>  1 file changed, 303 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


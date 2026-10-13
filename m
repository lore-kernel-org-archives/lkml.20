Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935223839B4;
	Tue, 13 Oct 2026 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877028; cv=none; b=LuJuPsoXat8w4Z7lEDaKwHS9deU6HtPeBY6xWzgfwCYmEe9l59cFYkJi8xZ39wTPa/YXbaETBAZltAsiAC4vel6vNrc9+szc9dBuvuu4bjOVyF931e0Grr7YsA+5J2E3TiXzoNaEPNjzIKM+1+yKeW7ZHR6bsNF5svKuM1i4Fwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877028; c=relaxed/simple;
	bh=mDB2AbQVbNHULnGx9eibPCIGXpaXbBa52iepvToiFvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBpyVC5egloPDe9PMHpx+qsuGVGHpBi9bjmz2MZRXMi60gyCN5+p4/RdU6hUf7MtnfG0+XwgpjS60UyIWJGqT7hdhMwqECmQCoAPrBvwauzaFpjomS0Os8aBap2qPnG3dyPbCK3EC5mc1hbp5xZCO12+TltxnYhcOl2eMtzUt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldKtogeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldKtogeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25D61F000FF;
	Tue, 13 Oct 2026 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791877027;
	bh=i+pC2obaIGGB4V4M0zaUFjWaDrcyP3lwZCtySrn98To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ldKtogeUzd/aBwyOxdYNBr9Qa2OiQSHlKRmb3TMb97JKdmzFa2x/O4ieFa2MCayxr
	 /KvURpTVGnMGWYr86fLjT5xOOuHdA7/pJPPjH9TWmKqr3jNM7qxrVCKVwk22Ctzzcv
	 Kl4EtgiURLO68qYkqtl9f4z81chc/V50/vsFOW4CwyJ+JN4zzGIPq6KuUZLrH0IoPz
	 kEm8pY4Ugv0f6VoD0p5zX7FlzQXYJCDmBCg/ZDRhYdRcpqS5TcUSdcMdijrl/ixhNv
	 pQ3yQvdc7CiXvDoarOdnvAcV28s+zjijopI6fMGCxgEl2zqSrAO2tCZFYoADt0cEvs
	 n5mMBmCNFnf3w==
Date: Tue, 13 Oct 2026 09:37:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: phy: qcom,edp-phy: Add DP PHY
 compatible for Nord
Message-ID: <20261013-vanilla-chimera-of-rain-efb58c@quoll>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-1-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-1-a2ab9af954d2@oss.qualcomm.com>

On Mon, Oct 12, 2026 at 07:02:11PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Nord relocates several PHY/QSERDES registers relative to existing
> SoCs, so it cannot reuse an existing compatible. Add qcom,nord-dp-phy
> to the compatible list. Nord also needs a dedicated ref clock besides
> aux and cfg_ahb, so add it to the allOf condition that requires
> three clocks (aux, cfg_ahb, ref).
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


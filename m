Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32043905F0;
	Tue, 13 Oct 2026 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881320; cv=none; b=MCMiAe8zSzsBgw64Y1JczpkJp6guu0Zj7h1rnhv0znyjQZWMoK8Sbw+FXvLUUutRPt786yY5b4tni9v8miKU88OaT0NZKUGKtC0P1vqhpHJHg7z7UbBRYuRNZ8BBBcSjkx877J29ZJJM0mzhUnLyo2c4N8T2+atuD+zju4cEw6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881320; c=relaxed/simple;
	bh=BBCyjJtBPBTxkdSnpplfXjqQcr0bfhPDtzccPXFzJ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNOqn4mctTNlVviq67V6embi72NSK6oOrTZQ4dkJKqLnN0Ksow7KbDFARjejBZetNdLlfI2qif+J/yZCV0hzZI/39NWiUtU/qyu27eJgeLiYjTeKbP97KoAz5urlTiap3ei3741YQ55QBRP74fC0LpSjfGI2XMmoKBiTkyNpTgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGXGjOhc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGXGjOhc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E0F1F00893;
	Tue, 13 Oct 2026 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791881319;
	bh=36P5CpgdnuQ4CoV44/SKhsr0TCOPh6qxQXHvG9Dgu5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGXGjOhcc9psij0rrEqM/LpPPJCe3tWvDn7YM7khlzZlzUZhnVTd6hOsrFRnKdgvh
	 oyGFczU1xntEjvmvoagTrbIe0yySuqByu73Gtf6CkPiBg1uIbqU151QTy+sVuBd7fu
	 2itMFOi5JYJlen3w003Y7h739T62k9buitqneKGhhp1eh6BtxA7Lk/cAx8/FAjl+uV
	 czBZoUK14IZZi8y3wwNiedPDlFDsfERM9g80F/9JrR3kQC1okmoTQhjs12Rrun2Z/Z
	 tU4b9m+RBQE0LLOVaVh2ceBFrux/bRg4ra9I9ftkFuY8P6JSffx3rTtRpi6v8fRZ+Y
	 v+kM/2oHg/idg==
Date: Tue, 13 Oct 2026 10:48:35 +0200
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
Subject: Re: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
Message-ID: <20261013-honored-bear-of-cleaning-bd8108@quoll>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
 <20261013-tangible-wakeful-swift-a38f8f@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-tangible-wakeful-swift-a38f8f@quoll>

On Tue, Oct 13, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
> > From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > 
> > Nord uses MDSS 12.1 with two independent DP controller instances,
> > each exposing two DP cores at new IO offsets. None of the existing
> > compatibles match this layout, so add qcom,nord-dp.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> 
> Do I understand correctly:
> Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
> driver limitation is preventing compatibility?
> 
> If so, let's fix the driver - just add more addresses to the
> msm_dp_desc_sa8775p array?

Or it does not matter, because top-level MDSS anyway cannot use
compatibility?

Best regards,
Krzysztof


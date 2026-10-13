Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C63A9854;
	Tue, 13 Oct 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877460; cv=none; b=bnNzdvBCqkyUF2iKOV8APr/i1b2LEalZ8+KaTe68LGpan3q/KCmkw2ZT2G68tz0+AJ2TkMw8QJ5ykHm5nF1tIaqSbjt91U1xkhJAMrXCO8bQ2fvBIgMq1kHlBlYWh1eE/oKAatIfxvMHFSev7fVnDhYNSZ7XVvGh8rcqZZQsQ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877460; c=relaxed/simple;
	bh=jKQd6RrTk1vlq8mOZFBrxMb9+Bl8cOG20ssbu42aFPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFLo/MFsYgVYYyxwBCE23SDqP9uuByD3i3ScFSy3Ph9dlvSBNjX3E/Y7gkH8ClI1QPbMU0q0GDfC7jkBzeCl0u52MW/PGjSo55lvzimYT3ZKCFYbkBLFi5hMI+QHfxUqEO8h0DamloLtSe9R0kpWn98Uw5G1gKl8qgrjgWSKAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ1iNRis; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ1iNRis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC351F000FF;
	Tue, 13 Oct 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791877458;
	bh=HYvpkbg3bM0lZjaWpN1iEes4TNSBAyDxgJuCv3mMd2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JQ1iNRisyw0myBjkG/d0FOkYKgA4v2GrUEEM/v/+lIoIQMHTsxHEQTl7alEpcyftL
	 k7l0zHN1ZaMgDzBW0KtsyxelZW4lS3Wd5mutI8B+vT68ChvYVxQ/XDuyxv7WBiJwDt
	 V2BhfRJKOObjxJ3HwC8uvQJTPOHxpoCtf9PkqOxmIVAE9w/9wbGSIBLJbuv4+vDJL6
	 p2TkABiIhfdpecL2HyANlxNbBeBVQjufZchEF+AKGKN3iz5BCsP8h7bKQH6PfmgVQl
	 rs9J9p2RBwFZqWcg4kb9yZaWcfkbZGUxi7ksjNREZDz3ERArwKgKVm4k0EkjPBBUW3
	 cau0XNmDq087w==
Date: Tue, 13 Oct 2026 09:44:15 +0200
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
Message-ID: <20261013-tangible-wakeful-swift-a38f8f@quoll>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>

On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Nord uses MDSS 12.1 with two independent DP controller instances,
> each exposing two DP cores at new IO offsets. None of the existing
> compatibles match this layout, so add qcom,nord-dp.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Do I understand correctly:
Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
driver limitation is preventing compatibility?

If so, let's fix the driver - just add more addresses to the
msm_dp_desc_sa8775p array?


Best regards,
Krzysztof


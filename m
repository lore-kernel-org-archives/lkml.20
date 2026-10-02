Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7637880B;
	Fri,  2 Oct 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950606; cv=none; b=B5exJiznTJNLkLltRftyHR95Ts4uR8LcYJVEzg7a+Hb59Tk2Et+Dv79JP1EenLEyITU7NJMqrRvi3/O6Iirx9jDlHDh7SOpvpVQfEKMtn0wzFosCZb+xaYP4g37fSxGka9eNh1CPd4Htv2u7CMdFiTllP9mvJQuXz6MjN8ed+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950606; c=relaxed/simple;
	bh=jGExqyDQhFQF+3g2+uVyhfsaIZqU3Lvppx/e6qLy9Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMBMOtI2PGPoCZqDlCL0soYK8JO9x2NBdW5ptCZ9GU+he5CPKGT4Bp9MYMPQrU6f25gviDR6KOZetlmiYy03W9f/I5vAt7Kg2a3OjpX0B58EEWyTI91BrMQngyEsVf9C3hbbmBjpefAPhG82297YGAgxkQnqjIQxFYI8m07O8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWDUXrhz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWDUXrhz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6FB1F000FF;
	Fri,  2 Oct 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790950601;
	bh=H4xQPJP+IlNawbaAChfY/gJ6vPnlKc8pFhDoYQjhO2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dWDUXrhzx0Tqe+i6H/NzOLWOLHRdaKHJb0GsoU319+eYcGlxe59SuQAu0TFUgM1ej
	 cs1Toobn7AIWuZ8MSpvsVUp9pGEJOvAJiz8o2sOzl23Pm1x6jrot2+QihNQEkVx1Bt
	 vjDvAXe2xGRnPbz4uLNDNrxWUlLn4WofLiEAwFhw4SZPAXuOWc9PKAfnZ/EEtIU1m8
	 Ed8XW8YCBrwE2cfYgiSq2saRZzCxUC8Vpo9cIAt5FV1T9tkaNtV6S8SAz8jrb2FDQl
	 IzYxbdnX2SQiwrOTegSpXhIbKSewV+CCrC0vbbVc+Y1fNdB3X4iJEwQQKHyRD0bYg5
	 f2+W5snXqHwEg==
Date: Fri, 2 Oct 2026 09:16:39 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Add Novatek NT37705
Message-ID: <20261002141639.GA1579700-robh@kernel.org>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
 <20260918-fp6-panel-v2-1-6695c4008920@fairphone.com>
 <20260918213518.GA2337779-robh@kernel.org>
 <DLUENYYQNULZ.BMYEQYCFZ258@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLUENYYQNULZ.BMYEQYCFZ258@fairphone.com>

On Fri, Oct 02, 2026 at 04:00:49PM +0200, Luca Weiss wrote:
> Hi Rob,
> 
> On Fri Sep 18, 2026 at 11:35 PM CEST, Rob Herring wrote:
> > On Fri, Sep 18, 2026 at 04:40:04PM +0200, Luca Weiss wrote:
> >> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
> >> 
> >> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
> >> from BOE) using it.
> >> 
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 ++++++++++++++++++++++
> >>  1 file changed, 72 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
> >> new file mode 100644
> >> index 000000000000..1c796599f6fc
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
> >
> > Did novatek,nt37705 get dropped as a compatible, but the filename 
> > remains?
> 
> That's how himax,hx83112a.yaml and himax,hx83112b.yaml are as well,
> which I have upstreamed before. I *really* don't have strong opinions
> either way, but as in the email referred to in "Link:" the versions I
> have upstreamed before have been accepted without issue, and even
> discussion pointing in the way I have done things here.

Okay. I guess just naming after the first panel would be odd for 
everyone else.

Rob

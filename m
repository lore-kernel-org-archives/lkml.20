Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419083793DF;
	Fri,  4 Sep 2026 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509111; cv=none; b=eEsVCieAChe+rEFBaVQacg3H1cvnG77QLuJ6YXspreM+bg2nInX5MWZWQ/5Un8qGaWkSOZHASDgNXta1GMAhZdnyGK5nN2K+8DnoXX0UCScvwwXYaSdxKZVRusEBvaZqyg6ev4jz4qMB0cP5tFdDB/WQCnnBM48674zC8QAv9fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509111; c=relaxed/simple;
	bh=1Kc5Qzb9ZE6Unv1qjDSqEpoERMdsTLHhrTZXiAxSiwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3+AhlNNfHl+5+vZd53we4YDshUGRMZ58wV9KHiOPjSJlEvcLDgkUir+tIZMHD6AcqFcdHG5ysqcsq5Jbya7KLDU0CsW2jQMF3Usrf57qFq9ahT2VzsxHLu4KncncghqLVG86oqK1mgXxwJ3jgSJQlvx6Lahw/BvYiMtDwyac6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+wJVPa0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+wJVPa0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88C81F00A3D;
	Fri,  4 Sep 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509109;
	bh=TqNLCesX2SNrm7Jswp+E1v9760B2VFDRX1NjrjFhDbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L+wJVPa01ltnhm6yS8sGMmIdlggoMUkPoGV2isQtt9tvcl8J6ZiNou1NCbED3W601
	 /SNBM0RgYXMNQ0BldNLlX1oZb51HBrlFbSyDsQ67bB2xnFysO8saIZ3cGyuVEPPj6X
	 Jgg/704ElwA675dE66f5Gl7Jhglkk5VA72jhZXjLjsHlzWvzXOfNUTmGlSxX0vGsGa
	 C/QqIQDWhpp3FzHk7r++EU4BYM4rXIyFL4Kx1DVh4GmBGFuIa1up6fkZs3Yw+S/b4o
	 6LlG7ST1AnUFhD1YTgZMltJY6g82y+5yqxj22KKe97tTes2MiUwRWEviVk8QI+96ib
	 Uu39LctKoYFtg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x2Ov5-00000006jvW-0Kia;
	Fri, 04 Sep 2026 10:05:07 +0200
Date: Fri, 4 Sep 2026 10:05:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <app7s9GZySBj7Mzs@hovoldconsulting.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>
 <iynrogny3didip7cui3ce3yq3woaqzrr7f4aqdzvls4j4mslfn@aww5qjpy3gdx>
 <b326edbf-fe34-426b-af19-912edc18ba84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b326edbf-fe34-426b-af19-912edc18ba84@oss.qualcomm.com>

On Fri, Sep 04, 2026 at 09:36:04AM +0200, Konrad Dybcio wrote:
> On 9/1/26 2:44 PM, Manivannan Sadhasivam wrote:
> > On Thu, Aug 20, 2026 at 04:24:12PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >> and DP signal processing capabilities. In that architecture, USB3 and
> >> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >> The DP part is roughly the same as on the instances without USB4.
> 
> [...]
> 
> >> +	case QMPPHY_MODE_USB4:
> >> +		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
> >> +
> >> +		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
> >> +		/* TODO: disable DP PLL if there are no active tunnels after router setup */
> > 
> > 100 column width generally applies to code, not comments. Comments should still
> > be wrapped to 80 columns.
> 
> I believe this isn't a real concern.. checkpatch certainly doesn't care:
> 
> # LONG_LINE_COMMENT     a comment starts before but extends beyond $max_line_length
> # LONG_LINE_STRING      a string starts before but extends beyond $max_line_length
> # LONG_LINE             all other lines longer than $max_line_length
> 
> (all take the same value, preset to 100 at the top of the file)

Checkpatch is just a dumb tool. The coding style says the preferred
limit is 80 chars unless breaking it improves readability. And that
exception generally does not apply to comments (e.g. unless it contains
a URL or similar).

Johan

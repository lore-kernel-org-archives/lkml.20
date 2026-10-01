Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44F35CB7B;
	Thu,  1 Oct 2026 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866970; cv=none; b=uB2tuF0dRv841cIXiWe/hTlmUl5t6dM3/32hiu4BmwknZbyZkfuCE8X0HpGt7FLtoGNouwdEomfqaATaiIXOFguFd63JsPmn0fe24WjnNsRfu2J/v2Z6pSZ+mrCVcy4e0na9DfwaD/Henbl2AnNckP2DMhxBtmWgXM6XM3EBrOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866970; c=relaxed/simple;
	bh=/kwgN+PuBVbO8westGewDMOdp19vmIkC/fjU+0PDaNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agFEjoDbg8tfxSDh+XXsiX3lpqISz6wGH5QmP/MMdYqUa1xJFwnAgxzAFY2yf6+cXuk1berGaRdw4kmR9ec0xa8gw68+F+sSB4GwGsVQcNRhDEdttBa9sVymRqmDSinBe4fAsvG3Wu/Jl16RKGMyKDqI+pV9kHXZ+rNTFiAyZrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpCWa4Sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpCWa4Sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D668A1F000FF;
	Thu,  1 Oct 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790866968;
	bh=JWj0IzRMkYtiHqUCqAGBiBrEoLLPy1dCDBwjIuD2i78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SpCWa4SyhglpuwNqaNss/dJs0mjZIrUnZk/P5u7rlaTNPDWyDiDi+h+HpTb1IuqEN
	 nPLZatdVCr04QS+bB1SWEbrpug8cPqV46WzThUPJW9oogapgwQXKAdBVeqzBIFPc1F
	 acThuOPa0xzqqdFNprFqBnjXtMAN+KNCiPrAQ6fa0SEobNRZmayJXXll6/Q/dRGsk1
	 /gNrD1vcA4m1nzwlhnk6bzZ/J4acb1vMEHg/ZBWQoYI0NA92XgP3qZIFZMdQqfYxs0
	 Ut0Gs+P/30MPrdnKFHjKags6HUjWs7gKegqlA9bhM2ClvWV4+y3Y6LXlIARM6xqQ1B
	 9G7SsgHyBEW8w==
Date: Thu, 1 Oct 2026 10:02:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/3] Add DT Support for USB on Shikra
Message-ID: <ar50erRON6cMF9Oz@zenbook>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>

On Sat, Sep 12, 2026 at 08:17:00PM +0530, Komal Bajaj wrote:
> Shikra has two USB controllers. Adding both USB controllers support
> in device mode in this series. Also squashing Type-C enablement on
> CQS/CQM platforms [1] into base USB enablement changes on these
> platforms [2] based on feedback to squash related subsystem changes.
> 
> While at it, also sorting subnodes under soc@0 for consistency.
> 

When you repackage scattered patches like this into new series patchwork
is often unable to determine that these patches supersed the previous
version.

The result is that for each patch I now have (at least) 2 similar and
conflicting patches in my queue. As the patches was altered to the point
that patchwork doesn't detect it and nobody told me that the previous
versions are no longer to be considered, we now manually have to spend
time to detangle this.

In other words, this series doesn't apply - please determine if there
are any remaining parts of these changes that isn't accounted for in
linux-next and resubmit those.

Regards,
Bjorn

> [1]: https://lore.kernel.org/all/20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com/
> [2]: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/
> 
> Changes in v9:
> - Move usb_2_hsphy above usb_qmpphy to maintain alphabetical ordering
> 
> Link to v8:
> https://lore.kernel.org/r/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com
> 
> Changes in v8:
>  - Rebase on top of latest linux-next branch
>  - Sort /soc@0 subnodes in ascending order of unit address 
>  - Squashed with Type-C support change
>  - Individual patches were previously reviewed by Abel, Dmitry, Konrad and
>    Mani; however, those reviews do not apply to the squashed commit and
>    are therefore being dropped
> 
>  Link to v7:
>  https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
> 
> Changes in v7:
> - Rebased on top of latest for-next branch
> - Added Mani's tag from cover letter to both the induvidual patches.
> 
> Link to v6:
> https://lore.kernel.org/all/20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com/
> 
> Changes in v6:
> - Moved dr_mode property to shikra-evk.dtsi
> - Merged platform specific changes into one patch
> 
> Link to v5:
> https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/
> 
> Changes in v5:
> - Added interconnects and sorted nodes alphanumerically - Dmitry
> - Updated commit text mentioning that device mode is being enabled
>   since role switching changes are not yet present.
> 
> Link to v4:
> https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com
> 
> Changes in v4:
> - Enable both controllers in CQS/CQM platform
> - Fixed iface clock in usb_2 node
> - Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
>   controller also is enabled in v4. Also specified dr_mode as peripheral
>   for first controller.
> 
> Link to v3:
> https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/
> 
> Changes in v3:
> - USB changes were sent as part of consolidated submission in v2, but
>   they were later dropped since bindings had to be updated.
> - Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
> - Uses &mpm as interrupt reference (sashiko bot)
> 
> Link to v2:
> https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/
> 
> Changes in v2:
> - Moved to using mpm interrupt handler for ss phy irq (sashiko bot)
> 
> Link to v1:
> https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
> Komal Bajaj (1):
>       arm64: dts: qcom: shikra: sort /soc@0 nodes by unit address
> 
> Krishna Kurapati (2):
>       arm64: dts: qcom: Add support for usb nodes on Shikra
>       arm64: dts: qcom: shikra: Enable USB controllers and primary Type-C support
> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  43 +++
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  41 +++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  43 +++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi     |  12 +
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |  23 ++
>  arch/arm64/boot/dts/qcom/shikra.dtsi         | 515 +++++++++++++++++++--------
>  6 files changed, 536 insertions(+), 141 deletions(-)
> ---
> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
> change-id: 20260811-usb-shikra-v7-2dc0d3afc3d4
> 
> Best regards,
> -- 
> Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 

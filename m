Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761547126D;
	Mon, 31 Aug 2026 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200845; cv=none; b=eCnehAVfqOTNaA69l7A7ZxJbp27OO3YdaqrLfqR02iTWt4PYXZnkyRlNdSiI6IISOGRav5oKjkkuALAPRTPHtmiwwd8A3seSKQYdUDV1pAgXiGFgXKDCRIe8CCfCMUmQVfla41iQnS1rk/sokS1Sa6tqCdd9drUEjyyn0DS1UYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200845; c=relaxed/simple;
	bh=urSK/T9UPl1QGabGZ+SRc4v6qbYavUCpPlVzwoBkwRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuwt4tsUfgfG++up5KgKSl9yU4W5jWx3pCHK293tU61T65iTWwRaL7IyH/qDto+mJFp9g/n6UkT4qCDK2GhHG5sHgeA8hH98vWVQxD0Jd32Tbp9aXL8Xvsh25TL4tbM4mmj+mit7H7Xpy5ZuEnJ0FBpIQ3EK+AVm6odfdgazYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5rAfokq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5rAfokq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176581F000E9;
	Mon, 31 Aug 2026 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200844;
	bh=UofIsFzrTXsnboW9JVMv443Kkl552tUkRj3AMbCFOWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5rAfokqagJ3Ylr2e5dHbjQTdqucLyp5qzzj9uRpaPJMfr/hSGHNgKUIwtk/Yoso6
	 iGlZTAKF6w8EhHxdBWrWULSIHhVOBierpyeRlyhqU/ACt9U2hIUtK8fTHmfMRbqjXy
	 O5dHnbKy1k9GN1H3xLuZWaI5L4VXlesZ5+RE271ou1GUVr2hjJpUOBgHCll/XoJp8p
	 yIl/RQjvmkbacfsMnJ2mHngGjR5PM/ps307UnA3fAnF/Kpx+NMlmamYY4PofrgJeEr
	 QCxXHdlk1WfyXON9LWMVQCIQwredfsMpghSTsABWpsmRCDzPs2BXuj8mhKjUyRLRYP
	 8E2D9iPFv0XnQ==
Date: Mon, 31 Aug 2026 13:27:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Add CCI and CAMSS support for SM8750
Message-ID: <apXHKDEAwhlP-eA4@baldur>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 05:03:49AM -0700, Hangxiang Ma wrote:
> This series adds CCI and CAMSS support for Qualcomm SM8750 SoC.
> 
> This series has been tested using the following commands with a downstream
> driver for S5KJN5 sensor.
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
> 
> Driver and dt-binding are waiting to be merged:
> https://lore.kernel.org/all/20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com/
> 

I don't see any progress on that dependency, so I'm rejecting this
series due to inactivity. Please send v3 once all dependencies has been
accepted and this has been validated on top.

Thanks,
Bjorn

> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix typo for mclk2 and mclk4 tlmm function
> - Link to v1: https://lore.kernel.org/r/20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com
> 
> ---
> Hangxiang Ma (3):
>       arm64: dts: qcom: sm8750: Add camss node
>       arm64: dts: qcom: sm8750: Add CCI definitions
>       arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
> 
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 541 +++++++++++++++++++++++++++++++++++
>  1 file changed, 541 insertions(+)
> ---
> base-commit: fb80987f81756cb697a01362654a8e55fb505600
> change-id: 20260518-pakala-camera-bf03e3df1db8
> 
> Best regards,
> -- 
> Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 

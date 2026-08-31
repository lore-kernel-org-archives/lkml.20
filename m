Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919E448BAC;
	Mon, 31 Aug 2026 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193518; cv=none; b=FTziatNGp7auL8iRan2UO4KvQJ4syKGZNJiy0izfFpKQMRKN6F5Dib2km/DGp78K58n2Aaqk7AOchGvw37uHkVbx3A2jDf+UayJJSi9Af/VoWbmwHqMOmV+TFnSg53cguxF0wVQtxDRUWjD3wT/jtEFnpVqlZnhaaqEY0UQqNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193518; c=relaxed/simple;
	bh=Zlp+e3ClCOnPUrhIpq3Ju3yEMhy50FtSjDAl6SWGWRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Il4Nw05RMyqaQrbZuUlPqxI1vZlkGAJJ1HbWXt45CAPlQvExSy4Votb9ACkGb4id34sgr/aqzWzLBG8legQehhfDVE4CuHv7c14RgUzULv7zuJrqIJabEE9n4bqw9xBRN9S8LIN5YKUmii+/FgZpRQC2NgSdO/PobAEavsKBYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kytwMMwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kytwMMwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B471F000E9;
	Mon, 31 Aug 2026 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193517;
	bh=5nASZx5gj/Vwh4999m+BDCpKJMDooT3AyaSVyMLpEl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kytwMMwbqGmFvv9yV3Vzwt3Y5dOmUaT2p8f3kMhWsV5iTgewrD+I/TYIZnFsIdYcv
	 rLTYiJ/Gz59TfkJVBTSCSItGunrWmoMw/YYPkyv7HPWuU+yqWVg+WA/Fy61DmE0THw
	 Dy6P2QQUqoG5YbFFzK0IsScX4crsi/k7icLfKcRdbcjB2kla8NCU15dpmyM5/nT006
	 PXPBIX387v4zLeKP3DX84mmFwLC34qJnM3YDDK9cPdgb+9NxZ3DDU2vwFtna1IGTWD
	 ScQWtpLGT9MYey4pQMRvkFsQyVdc2LGmYP4L5hDjTuQ49BZQUSJrPjCda7/ohqOWUz
	 cJ/0QDM/sdKUw==
Date: Mon, 31 Aug 2026 11:25:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs
 for ADSP
Message-ID: <apWp5vxhRYozKQ7Q@baldur>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
 <6ae07fc4-fa79-4c05-9958-67154e850563@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae07fc4-fa79-4c05-9958-67154e850563@oss.qualcomm.com>

On Fri, Aug 21, 2026 at 12:54:03PM +0530, Iranna Mundaganur wrote:
> 
> On 19-08-2026 17:16, Konrad Dybcio wrote:
> > On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
> >> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> >>
> >> Add the missing SIDs for the LPASS eNPU masters to the ADSP
> >> iommus list. These masters are exercised during audio record
> >> use cases where Environmental Acoustic Intelligence (EAI)
> >> models run on the eNPUs.
> > Could you share a bit more details on how we can reproduce t his?
> 
> This use case is not enabled upstream yet, we validate it downstream with the
> AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
> access from those masters.
> 

Even more reason to provide a proper commit message, clearly describing
the actual problem.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Regards,
Bjorn

> >
> >> Currently all transactions from these eNPU masters will result
> >> in global faults; fix them by adding the additional SIDs.
> >>
> >> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> >> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> >> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> >> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> index f04058d2e089..6b06e0acbcf0 100644
> >> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
> >>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
> >>  			reg = <0x0 0x06800000 0x0 0x10000>;
> >>  
> >> -			iommus = <&apps_smmu 0x1000 0x0>;
> >> +			iommus = <&apps_smmu 0x1000 0x0>,
> >> +				 <&apps_smmu 0x1040 0x20>,
> > The correct SID base is 0x1060 (although the mask makes them equivalent)
> 
> Yes, will fix this up in the next re-spin.
> 
> >
> >> +				 <&apps_smmu 0x1080 0x0>;
> > This will bind the eNPU streams together with the ADSP firmware stream
> > into a single iommu domain - is that your intent?
> 
> Yes, we've been told that these SIDs would need access to all the memory
> regions ADSP firmware stream is given access to, so we want them grouped
> into a single domain.
> 
> 
> Thanks,
> Iranna
> 

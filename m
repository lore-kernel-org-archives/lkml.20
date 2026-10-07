Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648053CAE95;
	Wed,  7 Oct 2026 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405460; cv=none; b=obUJZQ7fqJJzZ4uFYXgAOX/mI3zLTKJSxizSSmta+k1s/YHqxoVHadMlraIzzWOh02EIAB2lMfmJC6QowvyI5ln55MpAdfXOnuP2TZV9QIl2xXxtmmL8n0QX7P/UwjthqFIiOq4yfXrQ9rvFzDbkZShdSKLpK0Ce1JZUJh2fcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405460; c=relaxed/simple;
	bh=6k8YcEswPzaENwyt7ZpWB02QJ4XIqyK1IJDBX5Wf3ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnpqQ3vsBbOrjg4sOCfZzCmFhrMCiZRY43mSJjeyKQoCLiIOH6BpMnOk55dfeldVcr2T/YDOGCJZeiQLiCfA3AiA077D0ejOVN/ky9ddayKHh4Vsyo7s6B9bBV6pb4EqLw+wwkZZ82rB8eOpeVuP57J4129SMmTL3pURHturAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVsdp0HK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVsdp0HK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31A31F000FF;
	Wed,  7 Oct 2026 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405459;
	bh=Qryu86Je5oc7DxajIRUVTEqV3BFIwP17ANzjPK54YTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RVsdp0HKyr52mb8BgcnjjtFyejcRjjTf7ekqy42YgXbn1dwJbJ3rMQN3JJU/beZBf
	 uJAUZ8/cdsE8SppnLobhc+gMhN4X77m+bGMD92+aKM12nCxstqoi4MJJHqQiQOYuEi
	 kaZ6SzDcdBcxRgDCN3Rb8FJ9lnR/p8MN+ImMW5xhF8ePW/Mq+NvAVNojpFwcRMDzop
	 AsvzyHCmy5754/I33Dq4xkMXpuFLS7je4GUx1hmixhOdysEkyYksVDp5/ewL7rIkdX
	 qg+NknWnujQIpSdBTjSL2f8Pay09pxcMbiGMwHHuR1n7/3CBMxfpldOyvveGLaEzCL
	 S4WzVL+Lm6jhg==
Date: Wed, 7 Oct 2026 15:37:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Saikiran <bjsaikiran@gmail.com>, devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 3/4] regulator: dt-bindings: qcom,rpmh-regulator: Add
 debounce delay property
Message-ID: <179140545772.213414.3332111127307702392.robh@kernel.org>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-3-258ba9612da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-regulator-off-on-delay-v4-3-258ba9612da8@oss.qualcomm.com>


On Thu, 01 Oct 2026 18:16:30 +0530, Jishnu Prakash wrote:
> Add 'qcom,regulator-off-debounce-delay-us' to describe the time to wait
> for an enable vote after a disable vote, before actually sending the
> disable request to RPMh.
> 
> Some consumers toggle a regulator off and back on in quick succession
> as part of their normal operation, a behavior this driver has no
> control over. The appropriate debounce window to absorb this varies by
> which consumer(s) are wired to a given rail and how they use it, so it
> is exposed as a per-regulator property rather than a fixed value.
> 
> It is placed in the qcom,rpmh-regulator binding and vendor-prefixed
> because the underlying deferred-disable mechanism is specific to this
> driver's RPMh command handling.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


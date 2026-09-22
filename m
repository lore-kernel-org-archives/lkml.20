Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A648A2C3;
	Tue, 22 Sep 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069842; cv=none; b=XI1R6nZnSaCaAoFRKpi4x/0/ew7nnKt4QNSUITV/zsHi4vX0Yg97ZVSq2dWdDZ7/rwk8JD1dI88I6AIQqObxA7bHRYQvu5K6Mhl4sXhIhpEEbqyjK4TDXFN0Ov1/Dlame9HEJf2yidr31gqVA4TpyKUk3Zs0j2ZkSy4pB23hAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069842; c=relaxed/simple;
	bh=5aq7lGTUqhMH2dGXV38IqVhdsxHhzL1eljtkrAmUWs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuzIHqGJqFJ/pb+9mPxGOnjqvUY6/3zblsrMg9nhk8dvz4UAcUPkB2UZLNyGuQaSeZoruLN50SA8lCnEV0Pm7OYh3YlhBbyYVKNzrFXTLTxw+mOIG6tnExPJCbgzMiPEzvRtRyznuELb5ER/APEQEAEt2nzWD0Jnh4gFQ9S0Hn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=nfUBOOoS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="nfUBOOoS"
Received: from [10.10.11.34] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A47AD2FC005B;
	Tue, 22 Sep 2026 11:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790069417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vGIGn5qbkhPubwb7oPvaRDiVslYcOo17GXapH5WYTMg=;
	b=nfUBOOoSPM5I9GDqZCxqskQ7B2Ukz8cNP6KzQWxEepkY2U/Prs1/7JuYk6bCqyLjc/9bDp
	KTkFrstvQzusHbWIxYRdvxjJVwdoYy867mDZZ6+Qy6wiWqMEhnPUrM4FPqn9/9bb4ffUEs
	BSLw9gk6T77hhI6C37or/+ExcRSS7SE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <c030a400-fcd2-45f3-b874-67ac2d6d9999@tuxedocomputers.com>
Date: Tue, 22 Sep 2026 11:30:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] arm64: dts: qcom: medion-sprchrgd-14-s1: Mark
 the EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Marc Zyngier <maz@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Konstantin Shabanov <mail@etehtsea.me>,
 Srinivas Kandagatla <srini@kernel.org>,
 Ettore Chimenti <ettore.chimenti@linaro.org>,
 Georg Gottleuber <ggo@tuxedocomputers.com>, Xilin Wu <wuxilin123@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Val Packett
 <val@packett.cool>, Laurentiu Tudor <laurentiu.tudor1@dell.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Dale Whinham <daleyo@gmail.com>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
 <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-7-fde7f8a53382@oss.qualcomm.com>
Content-Language: en-US
From: Georg Gottleuber <ggo@tuxedocomputers.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-7-fde7f8a53382@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Am 22.09.26 um 09:51 schrieb Abel Vesa:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> index 6d26d73c18fc..9b599917c15a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
> @@ -1268,6 +1268,7 @@ &tcsr {
>  &tlmm {
>  	gpio-reserved-ranges = <28 4>, /* Unused */
>  			       <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */
>  			       <238 1>; /* UFS Reset */
>  
>  	edp_reg_en: edp-reg-en-state {
> 

Looks good to me.

Reviewed-by: Georg Gottleuber <ggo@tuxedocomputers.com>

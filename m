Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089457;
	b=0FchOIodgqD98JLp9UUQwfFnyj/v78jRn+L1iiqj/ebKxmYZ45Ev3OvXHYnuyAaFOOdp
	 2Mko3LDbpcfwCnJkOZk9TtWvrV4oyNaM0U4OUjw2yJPmWUjHQccxzzikiPYp6O+JXJ8RH
	 x2yWB4YumIMTKzljw1PTAh4W6pchWmqR9jSD7dBB/xhVrUvOmI1Ai0t5KexCc1G65p/T8
	 XTQnV9JI64608Up0sdDgzm7GtzgnuZO0SWRiJU6pk3V2HbzCthoFZeGXH76kLsD5UdmUZ
	 dpHdaz8eY+H45KaTCUOy9gHNfemDeBoEOIOyl1vGpR5q3OxooVdaIDTtvgjxs4YPKhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089457;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WjwTOkbaD36OAJXXSDw5+sWElmJk5hvdIJVhydpral0=;
	b=M49aFqnswOV0jRLa2glb+qD2bx0jsYJYdDgCYADOY4VBJnsxgtBNvJWpLXKw7WA61MQY
	 Ff2TFPWZrIE5dxLth4YHt7Enhl4HVoGtg9CeC8OCxaf8jaWgEeommBnOdrfeDucxBZq6K
	 Tu1hyBndHCYocF0/p3/pRh9nF3xOFMF9JvkWCrkR4LALBr1FKo/nPh5EbJZi438aGzdRX
	 Mc3q3rwo9bPnY/Y12joLHVeLzQhTTjefOopRYLa0JWZaUMbh00WnHuQzrOsmyYiPg4Gso
	 ckXm7odwdd8y4qnyHPqUIUO5JYMQQxop0NfBc6pfXMeM9qfB2Uoj018RNu0l2Pj49TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRJopxbS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C4606A33B;
	Sat,  7 Nov 2026 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRJopxbS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9240A1F008A1;
	Sat,  7 Nov 2026 22:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794089456;
	bh=WjwTOkbaD36OAJXXSDw5+sWElmJk5hvdIJVhydpral0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FRJopxbSLT3vMhYgdGS3XIaWOQWXnCcTz7ly0+dn0K5dtbFfjcnrse19z8utukR8o
	 qzHRflLFQ78Xn7Dy/+f9xiJl0bvKCq2YVK8FQaU2oqGjY/3NBdid2LSrXRP/SgHx0h
	 KCaLJtgRzwfYUHonQMa+/PrUz+Ez+3EdKWBZxUBDTyY4XyhhGLqfCe+dVH+DIIqgMh
	 XtwsuMwekUk8iieudjYUlHMw+xyF6W/RechgLelzS09avfb/AI5TVZQxh60TV2oaEd
	 LtIIDBT7BWY8gi7IkMZ582P2nrKZUdNwvIQ7A0D6K7gqYF8TsCobYap2TA0bKVdc4f
	 TvToJINOl/GMQ==
Date: Sat, 7 Nov 2026 16:10:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com, 
	Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
Message-ID: <au-hKTUxMOPr4wvW@zenbook>
References: <20261007-resend-upstream-attention-v3-1-c2af21b3def4@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-resend-upstream-attention-v3-1-c2af21b3def4@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 03:17:31PM +0530, Arpit Saini wrote:
> From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
> Changes in v3:
> - Added my signed-off by.
> - Link to v2: https://lore.kernel.org/r/4f8a2731-4ea4-49d9-924c-ebde9fc58170@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 64bc1cec612e..9ecb40e7e39f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>  
>  		vreg_l12b_1p8: ldo12 {
>  			regulator-name = "vreg_l12b_1p8";
> -			regulator-min-microvolt = <1200000>;
> +			regulator-min-microvolt = <1650000>;

The power grid clearly states that L12B is expected to be at 1.8V.

So, while 1.65V is within range for the NT37801, it's not what the
hardware folks has told us to use.


Please review all the regulators and ensure they have ranges matching
the expectations from the power grid documentation.

Regards,
Bjorn

>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> 
> ---
> base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
> change-id: 20261007-resend-upstream-attention-f964719a0733
> 
> Best regards,
> -- 
> Arpit Saini <arpit.saini@oss.qualcomm.com>
> 

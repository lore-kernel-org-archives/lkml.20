Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585729C328
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429696; cv=none; b=qxnyN8gRm6OKcckEicu0P5UjoSn1MHeufSwEBbOzkb6a3JueyHX+vTIF/cC648hwdHMIo8ZIcTwI6OV5Xx4jqHUC02hABM1Sj/JQThh8vUP6HDDTCqahpf3fUFQx3VOhXF30NiS//qVXHxnxnjtEzenCH0lXihTOCHvGvdeGgHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429696; c=relaxed/simple;
	bh=3CWJLlofZQApttlhq+kpMHCeVeEF0wllP78y3q08F/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lT72+WH4OD3dXv41r9BH3oDluFAPDrUm5AjmIG3IQNNTtq9QuOk6ti1pNWWPNzws1SD2RkwJyOvaWwet4mY3FjX1TcGfLavGo4TFfFYJhXH61fHdrqQOO+ZTKrUyz35afRR4oXdkq7bv/RNXPz+pIwzMoyCbaLB0b5I3GwjsKIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5gT76e8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5gT76e8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so990059f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429693; x=1791034493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfnxRYVPxR6v6awtj9prtQ+scY/SGqS6pi8ulBW0ptg=;
        b=R5gT76e8ka3FKKJgaJPAaXmpOBM67BCN4ULBx7zq1oJqtGgnARua0vbh9cM1gJ6oiX
         9irFqkkkh87vKqS0k1c4sQnWlyp/5cpEQ6LcOPbdcIxANIrxEObYH3siJsbFj2NK/wbW
         y0ZzH/Xku9oT4lGkyJ3tQThbf5r/B/P4Hu0mCowv2NMLkiISlzRF/pANPqZT5ssW74p7
         j1gkpJokbefo2TKRJNKzd2SepF2l8Gfpw9+iJpGuiUohj9uNQshq32ImooazTLcO11Xf
         F9Anub4N1w0PDn/IVmzvV+6iMzSXlM8AOTZppHZD69LoyfegXiJnLFA92TznHAwzui0l
         sDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429693; x=1791034493;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfnxRYVPxR6v6awtj9prtQ+scY/SGqS6pi8ulBW0ptg=;
        b=AWmfflHAo3C/K3KizSQd4hvonnbqkjsqMy8mFcL7fRD+UV3qakcHnQBEdWrrd1qv8H
         5M/Rdy820vSJlltulwP2gZ8R3aI3afycwS8PAhJj6WwOKaPGTW6XcbDcH5ZP7hP2jPsA
         xOIkeFQPS0IIcXhexTX+AtYnRfqSyPI1o+xVbY5ahNXHDElbkRrVD1pHL4hwOv1Jqz+t
         2EcnpLxafrGPRVGzLrGxhHJaRNCZTf6tH/3LRoM4LYUXgicz881qZELLvpb+euGzdLwS
         Ps0gOo9pdFPdC8Pa8bqEZYffy6a6GxaJfgvS0BsrIUnLGV+B9f+28vhyvtDEWDrzXJaw
         nLuw==
X-Forwarded-Encrypted: i=1; AKwUvBxjHJJQj4yGnZSHWDSkExbWKhfxYo5ElVIdV4oKzhjwtwykBrWXV6eJ2DNfUd7D9hxe8wtOiF+PYBd4s3M=@vger.kernel.org
X-Gm-Message-State: AFuF++l5yKQnXTml0eFANyqRva8JF4CuRL9CYzD6qQjAlPhqMFVyNRSK
	sX0KCJBNeJGeLzYnuiFrZyXoIxhi9Q+C65usi96XJhGdBxGhCT6859RMyQM/4yfvmA8=
X-Gm-Gg: AYBFou1ORSSDnwjuqEWL0V3Xmbv52wM0dHUvS6R1YeGauaoFFSw1JxYm3bhFOCPR5Ai
	T5lIzZhz8cfmY6ZLH4cHqqXncJrPAd+C1o8mVm5gQhcCxoCwceX2G/dV/vfGMlSqdoLBZCmmZYX
	9eRVnTwoEnxma2+2525hUEWuObcXOszi08bLSp9GxDHSxb0QQ+r2SjMB92WiXhah56/QAOlA5tf
	DMP6VWnIC/TcLdcGt8xTyxvUs1qWkXztGfOEAsffrVcWSeFBDDlhiPL6/+7R8DAMietKQ8nB1qv
	fjCKt4VhNdVU1VQDFwDRSpkr4lKQvrZRjbiaIoT0hVqJntWnCcHTEioDjZhtRpP5OoaBchmX2Nk
	L22IYDJXmMlNheqmxJIEnTJT8faQS3rz+KjEf7kTsZ20d8ybyrgvIBAcVOjq/VAuhFRrnFoALIj
	h+u0FPXNpDzYngLvRNdygmZjwuR/qO6TiqQ5WERR72huB47W8coiRkvTYd1HNqHWGoFyC5zfVTR
	3Z2MNy8N4E=
X-Received: by 2002:a05:600c:3b0f:b0:49e:7cc2:e6c2 with SMTP id 5b1f17b1804b1-49ff06ed8a4mr87510495e9.27.1790429692711;
        Sat, 26 Sep 2026 06:34:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a744fb5sm12791808f8f.33.2026.09.26.06.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:34:52 -0700 (PDT)
Message-ID: <f9e0f1d3-efb3-4c56-8c1c-9a608097c2a3@linaro.org>
Date: Sat, 26 Sep 2026 14:34:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/12] dt-bindings: usb: qcom,pmic-typec: Update
 example with vbus-supply
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vdd-vbus-supply is deprecated, thus don't suggest deprecated usage in
> example.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index ba790c4488b76..2c8b11e92fb28 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -163,29 +163,30 @@ examples:
>                                 "sig-rx",
>                                 "msg-tx",
>                                 "msg-rx",
>                                 "msg-tx-failed",
>                                 "msg-tx-discarded",
>                                 "msg-rx-discarded",
>                                 "fr-swap";
>   
> -            vdd-vbus-supply = <&pm8150b_vbus>;
>               vdd-pdphy-supply = <&vreg_l2a_3p1>;
>   
>               connector {
>                   compatible = "usb-c-connector";
>   
>                   power-role = "source";
>                   data-role = "dual";
>                   self-powered;
>   
>                   source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>                                  PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>   
> +                vbus-supply = <&pm8150b_vbus>;
> +
>                   ports {
>                       #address-cells = <1>;
>                       #size-cells = <0>;
>   
>                       port@0 {
>                           reg = <0>;
>                           pmic_typec_hs_in: endpoint {
>                               remote-endpoint = <&usb_hs_out>;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

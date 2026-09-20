Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BC3D3D11
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939297; cv=none; b=if1/Zc+zYDJ5pXhZWxQCspJJ3MXhc8MmpFdX7IPtK1Bwavgack3ynn1euThnt0Q/T+XKVRc8JENxT2vQdhlcg43T4kUQB44PXA4mtFeKKFkhMnC7Z+9bxnNKlM1mEjbdGYR98JMnVQSD8UzOoWaE+Mc1tIMP+kOAo+hludRtisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939297; c=relaxed/simple;
	bh=qoKr8F73jXZwuLTCYhGa0Hp+b6lJiLywfTbygYS4GYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmPUUD0xALB8zIAOrRAxrg2UZRixfoPtNY+IE5PQtas27FtZQZoHqUaOSQDwZo1/6oyL9oDUaeo48JoFIVGQUptB7yykXsNECIPrPIVe1SAR5fEu2DlvAyrwJJKAuNqSGVi5o1BvAyZRQhyhxHoi6jIMhQ/7fyiz2PzRVXPCze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9wPDC94; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9wPDC94"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so3862322a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789939294; x=1790544094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHL0bqzjiVcWZ4wR3C4oOtKMYoG1Qe+r8qIwvuj52cY=;
        b=u9wPDC94k93C89cV8kHPTS7s6kfPnF6GFUD++1XUV8QXjWXUty5xJ1Bp3DsznbitbU
         JLZPyogRvCqN9XhnZGHiFWveOHMQd3MIl0eMFIAcTw61QdZEKL1Cyf8+9OKGY5frrbwo
         8Ht5qjvtf7vvmB9Y7Pq9dd/57B3Pn4rg61n5oZgHiLcheEvuXforkZNbyeTmwK8OR2rU
         aLNDpgcokBV2tJwhM0YjD8gwnvLiNdWDGTj8EI6rcwL2vgjqnWy7SpdaNGcHi4zW6WAy
         A+09nEqJaJnyuUyitvs2VX0YWufWSQblrEMVQP8Sdev6JxkTXAw9LNFGT9avVJtkhAzo
         /2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939294; x=1790544094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHL0bqzjiVcWZ4wR3C4oOtKMYoG1Qe+r8qIwvuj52cY=;
        b=hKhIP6DbPN1XDXzzLiQAsQS6Tlc2+k15YKlZJ4p7fptOuKNUN0EWXhaC7tmpUr4jiq
         IoMPZiweFkrUa6M3uMEwfVSKV3bV7sr7oZRz5RE/b8/SFnjtjBjcs6QSxjZabkxyxbjZ
         Jq6trfvz+G7OVIYPVlGBY6ArNiTaGuUJTO/xrYBZwulfIgJwFV/JkuD+ypLLwygbS947
         7zNXJ9S1svkYIsoQ84qjJcJVt3RuUIZYDYNvmOIvr5GNmuGeYHh+RK0at7gPd2uLYaEv
         Ee3WGHs8ThyC1v2vMlis0mmHMnoDXA8CjqsojBVwQgWgGUfWlcA5FatceH+DTbN0kKQA
         gB3w==
X-Forwarded-Encrypted: i=1; AKwUvByQMEnejZHvDu3rT2rBlPbz8hOh1sYgoAbZI/Qkv8kF/yw44plhoM560b2/bx0IEw0rJ02gQyx9uGDrC3w=@vger.kernel.org
X-Gm-Message-State: AFuF++ll6gS0SFwluUGobecOvfqoHrGPKU9shfLp0idf9IVPDTDHSjWP
	1BmAHVrqXU5CwBhcZy9Vv5onhVcCm3k63F4PdaKzmN6wgArUgbE5puWQj9Dyf2A9iTk=
X-Gm-Gg: AYBFou3poxqmQO95nSBocbYHoW7y75OZ01TeMEPL4iJDkrg3UvsDRVdGwNuoAWo00gL
	R6muSuesHc2Lsa6Lmyg2EeQ9gU3AguwqsSxnHGOAm74TRYoMDgwSRQuh42+fp/FkHjoLv4M3Cu7
	LBsJTX4JJFE3TQJ4S6EU325xXq9UpWDXye3rYl/zKw3Q1hOJgzWUkUUO9UhBcQrglKa5kn/zgNV
	DrMKRVNkvLoSypn47ldwUELzjtm488+xxG7ejYh+VghwlsXQtL2mQ4QRagx+sx78dI+A3Uj/oew
	PDleMkuXsMTWZ73aSdQjGtkB4UU8AZ3vtbfe3thyApMaXW5iHMxfqK5kL7Vy/9p0/qiSBrdH1Vw
	6a7TmHjqCidOx6nh+lOX9SPHcd9120Ux/7ZjDzaHAyNueA4nm0GFYoQBQ9F4H1z2ezYFamrkkzS
	T2+Y2h0a3UQYoCm2RFCFKko6xPq1ttR9LXjzalvYXsIu7r0YLT/ZNX3D4aMSl2YF0jz95SVF9h8
	kUwof0qVi8=
X-Received: by 2002:a05:6402:23d2:b0:6a9:f874:6de8 with SMTP id 4fb4d7f45d1cf-6aa559cd4dcmr5546423a12.0.1789939293867;
        Sun, 20 Sep 2026 14:21:33 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.73.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dd0000sm3062351a12.17.2026.09.20.14.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:21:32 -0700 (PDT)
Message-ID: <95cc550d-8eac-4d1e-a61e-60595afa9ce8@linaro.org>
Date: Sun, 20 Sep 2026 22:21:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2026 15:37, Dmitry Baryshkov wrote:
> The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
> device-specific VBUS") switched the schema to use generic vbus-supply
> property, however the example continued to use the old, deprecated one.
> Update example to use the expected style of specifying the VBUS.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index db487562cec4..dd56dc8afe03 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -176,7 +176,6 @@ examples:
>                                 "msg-rx-discarded",
>                                 "fr-swap";
>   
> -            vdd-vbus-supply = <&pm8150b_vbus>;
>               vdd-pdphy-supply = <&vreg_l2a_3p1>;
>   
>               connector {
> @@ -186,6 +185,8 @@ examples:
>                   data-role = "dual";
>                   self-powered;
>   
> +                vbus-supply = <&pm8150b_vbus>;
> +
>                   source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>                                  PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6074DDB41
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970716; cv=none; b=mMrnlZ4Ea+ucB4gj9ye33i7bdBaseRtdVX6B+ZVLehYZN8pcPgQ1aBA2HVu0R/QZoUoyDeDHE+dy04tnBDaP9G20WF7ko2nHndLjyZ2qIxDIE/4NmGtgCAS3jBwT8vy14/zfTXd5qOzMdzR2+dYBjFDCnl8kJv81+a6yEeyiKVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970716; c=relaxed/simple;
	bh=ieAQq8W05Ldh6ypvnca0o/oiaSqWrWwDpTTeoe4YWdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph2T5+twkHsNZNbDQ/UU6oXtaeoO0/f6WRNt/TQbzMhvkO+FsJ/89FtViCN3E6Z1AnJiYSot0qafzN3ehQToW6gmk82Cdgxb9/R4JUSuzUpJGxDLVFBqwnemDu6sVRfJ4NIx3M5NgyzaBXrUAc7VkcuV1TRsVx4TyvOP1/KuPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vE4seWoj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vE4seWoj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e8c710847so483152866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970712; x=1792575512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+phdlrYB/RD28JPtIDO6lYJBfhoxurBJxdEKdj89FI=;
        b=vE4seWojajhrXAXU3xkwRJahawNuJ33pEC0+n+TRATlgWD9pK4vOTKM1Nl41iSYS6U
         NVaLwS3CuoaOhOk47H8rHOk9ctsVFASx6ad2sXWx2MDFEtPIvFTS1r21sZyRcR/lNQaf
         J5r4Flv4V2CoXYuuWIKCX8QdWLero6zPviAcFLQ2Xc/EOa+iXWaFmeIEaV8MdYtSgtuI
         m6K4eA/mM5/hIaGSBnkVE/DkR1SZmWUWcs8gTQ4TQ/s8TFg8aQssW6bVe/grxJUrsn+2
         nHIYaQTqeJ4t2pLmiWHdx42xejEQpS6jU4J48SCTFCfgEcG+Ntc2yFjk2lMSfUdTxpfl
         J2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970712; x=1792575512;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+phdlrYB/RD28JPtIDO6lYJBfhoxurBJxdEKdj89FI=;
        b=UdCFDicp9cdFdREXv04v6OT4C7zL+9O6SYn9yeFL/1xeRq+V5nyUdXV0Qdp06w4ka4
         hvnRg5/k9ApnsZ/GQIg+NTe5uuuPLzAe9SSSEjCU+4W9QVqO3SgCaFrVg572+GBTmTpz
         FZZP1RL2n1r+NWcSA2D0U6ayXYWbrUXAqhK75YHXAvbwU2EELFjQ8e4PvkqehkZxNnsB
         pB0RQbLFJbqjbvWs5cTmERperrH/Q4brjlGsdR38TwWz7T8566vnb67+KJgO7AuXldBu
         /79P+E37y+u5F5oqM6KEYGirR922ZGd9c6ceS/XOwaUhjsJIDbEtKljQjxtmMuGlHYPE
         Ssxg==
X-Forwarded-Encrypted: i=1; AKwUvBzk0QseCLcypaDdg66F1Ioyck8Et+KsP7bdPLYU5ii8rjBripzgzEMo/RYy8TxkyHl+sAHBvuZL1ksiNCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQSOhJ/SaFLFEbTyEFRc7V+zudTHwBKJIJFllwAe2W1G8fEyx9
	ambOUs4LKDo949K+6XFoZrixSk+SyCKRR/QgQzbea/P0YNPxR+vRx/bWujAaK4QPKfU=
X-Gm-Gg: AYBFou1OOzL33Oe/NMgmiHa9l8jW2v+RSIGgarg0JCe0b/SmY85Tk1+hC5Bc26+LNhU
	QJ3UwgX9bN4YUXZIp55Gh/YPxQKemWxylu3JTbXJ3GUydtiQek0Z3+lp4MprZw406KuhpYH1Hqs
	CluaxdrC1m9kVqV/h37xlrdTWEtbF08ZFKYKNL21I5mOlyjHeDXeBmgXEBtzesIKLcTj7FiArbG
	93IEKFIAXmodHugU94IKPV8ZEyKJF6Fh5mgqYTcrzilGfQw5gV2xcvKTUXOcKdgFcTGmB/kERZj
	AYOuMkh3Ttp8HoKemlpldbtd7PiIUdfgxuljb5jrHyf+h/GS/IgrmJ811mE+xkjH1O28K3wWZk8
	lIb9RnebLLdeQMBhcIRaLEgqXvEqo4ne+lIBvb7eEgOmUBmP85clYCmyDoLqO+XNAuP8ktR+RGr
	BwxTKzoPasqYQPjLOKmDj+3jrfzGeLwnctKzohL+cLrrIshbf+YcWtSyfeE12A32YIVE1SMQFXC
	bkXSPg97s5y
X-Received: by 2002:a17:907:2d88:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c31a9a07db1mr1358197766b.7.1791970711490;
        Wed, 14 Oct 2026 02:38:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa5953sm693842466b.58.2026.10.14.02.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:38:31 -0700 (PDT)
Message-ID: <47c2af33-05f1-41a2-958f-11ca13568acf@linaro.org>
Date: Wed, 14 Oct 2026 10:38:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: media: Add CAMSS device for Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> Maili shares the same IP as Hawi. The only difference is
> Hawi has six CSIPHY while Maili has five.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> index 5bf0dca3d24621bfc4a09feb8e5037a925869751..d1d53d6f024cbf7d2a0f2525aa4040260353b200 100644
> --- a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> @@ -4,17 +4,22 @@
>   $id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Qualcomm Hawi Camera Subsystem (CAMSS)
> +title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
>   
>   maintainers:
>     - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>   
>   description:
>     The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>   
>   properties:
>     compatible:
> -    const: qcom,hawi-camss
> +    oneOf:
> +      - const: qcom,hawi-camss
> +      - items:
> +          - const: qcom,maili-camss
> +          - const: qcom,hawi-camss
>   
>     reg:
>       maxItems: 13
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

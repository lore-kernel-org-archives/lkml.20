Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069977;
	b=b/x0h7cNuK3M5x72xwQrpcDqwmsu7uDm5bGrjfT09nsC5GzdhHmxfvfZs1B53X1J//7Q
	 ZQ/sFN1LtE/VWt3zehoZ+uEejMT2XHXxkhEgOY8VEYk+P78V6/F1ks3sogppSUxIoEfPO
	 jm7G8yaGV+BQvdGi4nutcM/w4FwbTLVs8qnFe0t6ZNc21mmHfro9H637fQMD+UrTAg9h7
	 b7cfzVolO9X2qASf45PxThPEG2MFdkAaV9lx/gxxcAMeVcdD7Jml8OT5TXXyoOSvEjseR
	 1QJKK8taH1s2uGsEXkqnbqe+W+ULtSwSbuJrUI3kKTd8LJhgAPVQ5T1WwQxqlWH+tZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
	b=0U4gTTnAqtW9+0c1ogCYPLnv4u04ZJXPPQbNyTRX+wF4u+fzEZHKS5Ojf+tIp4EI7wZ2
	 mpCc9Uj4CZLTPQUwCALG6lVLZryGB4gqgMNaLiIlqdcJ3BiuroYPIZTnl3jTN4E8EJOd4
	 44BQvPn7bn1lqpuLL48f3Xw292JeIl9Tji27Be56oVvD6MyWZeYxgeWX6MzYFINfbT6jG
	 9o+4YcOtDaCpfukRXfePKwH7DXteVqRRDK+zsUWIrURjRi+dkDUepPMnSq8vZFrIzPuVQ
	 2bKr51/h3NtC9QiYOV634nfTdzlegob4BIZJA6pamBLUKUdUkV44dqEuumRLf7Vsu8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqPieSzT;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6412606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6412606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqPieSzT
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso20253595ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069976; x=1793674776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=CqPieSzTRnCkJ8rM6iRBdGSlNKE/l4IOUn6nhqhCKR3eN5UyjZ4YejMK7uN59tO960
         0yu/KRBg4FK9xogLSEnUuK8UuoDvXhLTaAYlp6EwjRsd+FiylLmYDYdtyIFvMYjqII4d
         PrD8pzYLMxiCE0u+GZlurVLeHQabNRFGQBDzN160lLbae9otfAf69kqhEPC+kRVNo2MV
         VbL+XM8AbqeOFxiCh6f+MPMEk3GynSem1BV/9x3DzYr2FpsSljxD/hMHwCpKZUlzQKYO
         eG6vbr+4vbcsFrcNNwz+xlY2ensSLFllJFd8SEv56tKThwBAm877UqxcFeLxj25Gexb3
         P9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069976; x=1793674776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=Wb/Qziq0g2Yf/rkSNEl944dbtFq1206h8WQwxvXDdmoW0Foei3Vz5S/22JyvCK1YRv
         KN0cZW2wDQK2bd73IQbpNuSsl8lWD/Q5QWmOfAV8pS1filZDHk481UkabB+6kT/N4qoF
         zlghFEoRkC214ESYCzz7rQYWBdPlk1TzmsINU3f6Sf3sT5Yw6OzZLYyMfXvrw7zOZcbN
         DOAdQKEfQvH+m/SW4x4IpGmdLQixIqllmUd1FMLWkVee8JLEm5WIhydZyUfmyaAnLWju
         KxXoSEwkmPe0zahyI46OxW+hxXJu9LIY9hQaBnF8XM3+DNB2bEwxMV5h6dfilxOEsEYE
         +D0A==
X-Forwarded-Encrypted: i=1; AKwUvBy78OdsW+6yjCawHyWic4qRDawgk+SRpMxn4dahVi7Lm+oFNyq6VAizAgVtB82lPALJB5W96G8AlkmOCHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfNxQJmJWwvqVs6rgdh7UUdLvQQCjdpdaYeW5pdtxY4hSF2pdk
	xDtCTxZNVRp/CBlnXvOIymYGWmnQf17uRMMyJuSNgxHoK3E5dyxKJMOd
X-Gm-Gg: AYBFou1qiTo9XFZYjS6HQgPkhagGg1oRsjHmsLugph++FJmOF2xbAL1T+oR00D62m/j
	OVYkyT+VhXcibxP1Z+XmKe1ZO1pNc6ClrxlwCt4vOeXtS5WzUoS0aQu0vDMhE85k8xs6iHwzqJE
	GpzzFW2DprTit16NtQpNaztUxBndTE9iqQO7vDzsjkS0wq3MeBmiGAmtbzp02LXTmK8q/TMl0HE
	HLf9frkTT4LqAixVsnukvAOmakVNSw42zBLg4nXGWyRNYS2q10xmwPtwFeT4qHZ4SGEyszVrxQm
	FEe3O0xC9iYdkoHFPxUpv64OMgiH6VcpGgqhs0J+tY6LAbEnzR1sE1FmpTa8spPjGKzQHn0mkQU
	8/s18hDHBpCmRXjXaEiPJCWg5GPWKgoZR7Y2n3IcoDOQeaOuIHfYaPunGaeDgKYbVefE0/QF0gD
	LhdvMHu7xAOqi/NeHNHosP3KIJafBbGwwDUOC0jo2LjfnJJE3iV26qhEbW40tTGjDMdqqLP4H7b
	yNm80QgYtpF3NGqB3l1WaeIetOjeNX6H3CPYn0hbuJxf+eGIN3UyIKtxi87axn0JehpgfYZH5Yg
	fJc6/Ozg2eTYt0RevOdZ
X-Received: by 2002:a17:902:d48e:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2ea9c9875fbmr71515405ad.57.1793069975922;
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c912f9sm2255465ad.60.2026.10.26.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Message-ID: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
Date: Tue, 27 Oct 2026 10:59:28 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> index 7785eb1a68fc..750046e1a5c4 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> @@ -222,6 +222,12 @@ cpu {
>  		};
>  	};
>  
> +	sound-mqs {
> +		compatible = "audio-graph-card2";
> +		label = "mqs-audio";
> +		links = <&sai1_port1>;
> +	};
> +
>  	usdhc3_pwrseq: usdhc3-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6416 8 GPIO_ACTIVE_LOW>;
> @@ -390,6 +396,70 @@ &micfil {
>  	status = "okay";
>  };
>  
> +&mqs1 {
> +	clocks = <&scmi_clk IMX952_CLK_SAI1>;
> +	clock-names = "mclk";
> +	#sound-dai-cells = <0>;

Above 3 properties have been defined in dtsi node. No need to add again.

Regards,
Chancel Liu


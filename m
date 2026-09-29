Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB2A4E5355
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672551; cv=none; b=qByh4gmMdxMMA7tNDdODdMCvLh7JbxWi+9Q1BXmoaRB4ulJsJhAFUSmwGEq+OwKAVckvEvXkgxdbJhQwr0x98A4wuv/S7sgK7OH52/VTii54E0IOhEnY2qVzI357P8JDtPS0F18u7wCGin8harCaZ/26jyBOp+YJr9Udh3cPDwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672551; c=relaxed/simple;
	bh=+E8vF3OM2T9aBuCele2XoJ6uplIMu6dwqmf1wFybHOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIfEkkL4sVH+vpV65aA3vfp16BrigkFirXm03q2Orw/sBbWwxcX3MIPGnpyr7BqrfnV/Q5aeUoUo3/uBU6vRrwbMChgLB+T1uSCKuhKWmKooWbTHI7Q7TUJdEQ3faGcLbUKbSKx1ZwDhn7XAeWXTJmenrfVDu0JTX1yQrRx0S8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IE6Djk1J; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IE6Djk1J"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so2522156f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672542; x=1791277342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=IE6Djk1JwBkjZBnhb6zaOvVtY6qWfjaAZr8DYgMSr9fbfHPc5oAiQP3WfY8O6IBvlK
         2pBa2FcqY9kCYXglwhYDTocIqIX3xAYv6LOYSvsoUTtvGoiJF9+gHKOVOy72616iZQIU
         j6TXzFqJPIBl9mKXHRziWSE29clCi9L9fvzKq4qrbde2bFZ5V19jHIVDLRAdaLYyc6YF
         SQKBhUcvTtZoIQIa/rry4ARk9mhOk0RNAae4Ri3b4tjObkdTlC6vBgkR6dKjHl/yZpsQ
         /fBKLoxCWfeuwxWrhyDrK0/w+piuiFOg8STzKauGhp2UDu6At7dhMBlaBAG4L14Ar7sM
         GHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672542; x=1791277342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=A8jxX/UDRnyIJwvQIUtgB9OEuTgcsgk4JPe5Sj6XKyDLUbnBLZTI5C8/REw3aH80bK
         s/e6ZSXynyVYd3mmACN3wIIgn3+h0/1BAbEZ/fmMvcNfPlFlQpLJNNluGbh+kqxiWJzF
         NyPZjwKEw9Ijw7beSCynIBlWGVx7L/sjSLX7rGIUgKz1smahc8OS8U3rdVnOKUjB7y54
         uI14ynAjG1QflSVRvKqTTPF33sMxc3RrkS8TSFamKkIIWckOCeEYixzLxr1yWabiZr+X
         r0OnPKDi00F5ofnV1dY48QkMf0yt1RUb3kk5dhnA0tewjTlKDZOmJ8djXIG5kGmfUgCk
         jrXw==
X-Forwarded-Encrypted: i=1; AKwUvBznzulv99d5AIB5Kagee3rvEg3BXhFHlr0R/wiJtKSXKNNPwztQbf2SJqzB/6Ve3eIuQUYFTXKY7ujNXx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiVIJCJKKtJoPpDwBLXBzQV3roWuDqKTWdLnor144UCsWgqiU9
	hD+rydZFqdnBuwhNrJBiAO69t+sYJsXWfPhnLZ0/dif9N+K8WIqrR26/rjn83tSj0XA=
X-Gm-Gg: AYBFou2N5avjdaV2ZM5bYlNsoDvt6Qy8tpkMrP7CLfvHXxOCVlucY7SHF/W7AmV0iyd
	mHFzztytsVA6g9veA0CwBD3O5KoLxvupd965xLUNjW0MO6OsHooUnnc1TdHUt1VClst28VBKU3p
	iFciYKEQ/DgOQEuO9h4BQOVkM5IdSISKwUG23dIoB9OHHeKuyFe5iwWfYE0204StRj6Ynbk+PWG
	l8oMN59+zRw3t2XVmiDrzFVW6d1c6aeTLSUo50GntWBRefOv72f3V+cZA2KZpfdFK472pkAIuK5
	ULuAyiLs7W5nb/9JSEAwEt13Na4UkspQRBM/faQIehKyzGaOPIWSyraN2O6Hc+q11aLvery4LQB
	pn3yjzMTpg+YMid7eTzopmioOs29WLkRrmc/huDgjqcvC84vV7UL9p/PSKvfycupA3Grc6nCc1P
	lLzKfcslH9Nnt5A3K7WafzAtuRrX7o4riG/ZjS04/fM3l9646g+Xe/U4pLGyjrZkC7bmYcC2wtP
	VkENJsk
X-Received: by 2002:a05:6000:4009:b0:487:92e:c608 with SMTP id ffacd0b85a97d-48af1b1cc9amr3124751f8f.1.1790672542160;
        Tue, 29 Sep 2026 02:02:22 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm2748227f8f.19.2026.09.29.02.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:02:21 -0700 (PDT)
Message-ID: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
Date: Tue, 29 Sep 2026 12:02:18 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 9/29/26 6:10 AM, Alexey Klimov wrote:
> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
> protocol provides interface for all client drivers to actually use
> features exposed by the APM co-processor.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..91c6cee8f483 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <dt-bindings/clock/exynos850.h>
> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> @@ -170,6 +171,18 @@ timer: timer {
>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible = "samsung,exynos850-acpm-ipc";
> +			mboxes = <&ap2apm_mailbox>;
> +			shmem = <&apm_sram>;
> +			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;

Why do you describe these clocks?

Thanks,
ta

> +			clock-names = "cpucl0", "cpucl1";
> +			#clock-cells = <1>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> 


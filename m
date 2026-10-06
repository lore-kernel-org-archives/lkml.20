Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3272857EA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246656; cv=none; b=k4Get9blyQC+67IFas1Y1Lg11IDeks1XrgXXl/hvJ40y4eYQCsLlm5yg71XeKE/sJELZes0DrbyisRdB4bmJ6w3XH+A1aAWqmzczjuVfu23LmcQK2QsVbLHLvQ2zBL3WCIilEe3MrK0QhM7OIc0ECYbbQYfkPS4jjsUAbcXU9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246656; c=relaxed/simple;
	bh=nlfOu/Cx3dx7WAl82DavblqM7D6pKK70uc9LSQAqkOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YJPZXw/NnzOqMa9K7wgJhJqXFqvcfIJ0vBXmWBlT09HS6uggd95+lBqheNk80tkHkJ5lgSRBaCrdPuoUSBL08Wa0JtR+TlJx3QQKf/3j/QkrRFvYvk2jlvrwBaULZZPlGMVedAfqfdf1MQE4CronKN1mB0wMvy/5DfFFfBJbkXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=inEWEQNc; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="inEWEQNc"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92ed3993c1eso140713685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791246654; x=1791851454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CN7LmvsZdWmYM0BHY8P9OeOGiwwpFgBTQfuLY2b1oDc=;
        b=inEWEQNchdRW0C5a3Ij3mnDWP+Qn1rJrUIpRlz2ecpMH35Ys//re8a8PPze4x9avVQ
         nNjLlfoKRHSHkIh+/CyaRyJpWSxgf0PiV0cWEoPXGGhdz3u9Kw+nsR17s45eZ6utSHTK
         C5i9HMTUDqoiWXey6NWK3/Xc/QDXs3mgRGfTtz+Fr6gGWDfBgz6XrlQs3EGcKz1wLC8p
         F2aHMYXEuvlE06f7G2HjcFaRDWlmEuv/YxOwrS8DJnmF0h4HH1zZstC18YGeUrpay9Sg
         fX3hj1IGJ9R5TTbyvNz4/RXdgdura0ILpu37dGTBRTXhwFiFT6VU76l0GWHTMkWuJ/8e
         JI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246654; x=1791851454;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN7LmvsZdWmYM0BHY8P9OeOGiwwpFgBTQfuLY2b1oDc=;
        b=D2Sj7SETjFu6seUa+cBx1FrSj22mQtStg+cZWgLT2lOeNb2fg45Xjv7hs66otKselJ
         KQIjjSs71qfIBDuQDp8Whq47dyhDFoc/ADJYBIsXxuiqHKUBfb0ib5/a2JvlTwlFrdiv
         PF0rEuQ6kKoHVl/bneSkAW7VecOpe1mJZ1UBToShvFD+UQ0ixkiXFILHAPhXjrKnGVd8
         TYQwlWnE2zUsyTlahu8haIDd9JPBqXS4+88H+jSkHTH/LCPEcKCfI8WDmihCCI8sRXt8
         L/JyPYJVP5nPTwfP5ZOEgfmjt/t1Zdnugp0vM5aLlZFvAF9naa1CTdj8Yan6TwumbIWM
         Vmog==
X-Forwarded-Encrypted: i=1; AKwUvBykafRerCRczYGuX/2OTNCaGzgeV8TlXJMr+y81hRhooZD6j3btM0z4vFx633ES0nMa74kNH74FN4QWLSg=@vger.kernel.org
X-Gm-Message-State: AFuF++miCrEbFOEez9qwksVvYBzh5F4LHXbugXnQwTw4QNQC/vGBa8YN
	nNTRRxR2YRqI55bXXKaI2U7BJNzJMvcQ9byT4UOJfI+/yYEm/rEvjesAZLye1sgijF8=
X-Gm-Gg: AYBFou3sK44q4Ak1eesys4WREDM0X32m7SGQM+HIAR/9Jan+vPJVnGUjHuDolLAnyzt
	ddfIxcw8U12GW99gRZe6UfChYSh/7xfE8ZM1HjS3UnOF/ivXcCR9Rdf9/lkq6udjWbK237FAFd9
	ZvfuA1qwavDsOkYVDdBPo1olAHGkZNwFZVSzkmthJynD1trWc+nH9oVz1b/7QFTa6RMiwkPXlQ1
	nCkV5+Y4u4O4kIK1bY0HHM6ZDr69WGVn9dSg9AK2u4jkZ8ROY4QQX4WaoBtBUBZ+aW8Es6schp0
	BwGc5l59WdxRBW9xggiJzCkzeLogXFOHi2EFjGs6pq3TKC2qY8m0GPTNXvmdRoo87TvzOLw5eiX
	uIOt6pLNAusCk81dirPSDFCbnmOARKhDArtibuD54oc2kV3EwT1Z8Is9cgCSIp8FP36fSB9Psq2
	SOC3nhDSjNjksFX+/Tk7KlLdiV/qubrgrEksgsITPoVM1xyO0tLBbxFi+0MLIXYX3mmE2Lxfw=
X-Received: by 2002:a05:620a:800e:b0:93c:326b:43b1 with SMTP id af79cd13be357-93e5104ee28mr1517731985a.36.1791246653835;
        Mon, 05 Oct 2026 17:30:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca26371bsm998476985a.30.2026.10.05.17.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:30:53 -0700 (PDT)
Message-ID: <c92b8d7f-20a1-4bca-b51e-40ae52155099@riscstar.com>
Date: Mon, 5 Oct 2026 19:30:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add the clock
 controller
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
 <20261005230927.2000398-4-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261005230927.2000398-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 6:09 PM, Alex Elder wrote:
> The clock controller within the TC9564 SoC is accessed via a PCI
> endpoint bus through BAR 4 of the first embedded PCIe function.
> A syscon node is created to provide access to a range of memory
> that is used by the clock controller and shared with other devices.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Moved the clock devicetree node to be a peer (rather than a child) of
>        the syscon node

Whoops.  I dropped the "reg" property, and that means
the change mentioned above leads to a warning.

Either make them peers, but keep the clock node "reg"
property, or drop "reg" and make the clock node
subordinate to the syscon.

I will address this in version 3 of this series, but
(unless someone suggests otherwise) I'll wait to get
feedback on the rest of the series before I send that.

					-Alex

> 
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0e3bbdaf4661f..06246d185b50f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -9,6 +9,7 @@
>   #define PM7250B_SID 8
>   #define PM7250B_SID1 9
>   
> +#include <dt-bindings/clock/toshiba,tc9564.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>   #include <dt-bindings/leds/common.h>
> @@ -961,7 +962,7 @@ dev@0,0 {
>   				#size-cells = <2>;
>   				ranges;	/* This will be updated dynamically */
>   
> -				pci-ep-bus@4 {
> +				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
>   					compatible = "simple-bus";
>   					#address-cells = <1>;
>   					#size-cells = <1>;
> @@ -989,6 +990,19 @@ pci-ep-bus@4 {
>   	};
>   };
>   
> +&pcie_s1b5d0f0_bar4_bus {
> +	tc9564_config_syscon0: syscon@0 {
> +		compatible = "syscon";
> +		reg = <0x0 0x2000>;
> +	};
> +
> +	tc9564_clock0: clock {
> +		compatible = "toshiba,tc9564-clock";
> +		toshiba,config-syscon = <&tc9564_config_syscon0>;
> +		#clock-cells = <1>;
> +	};
> +};
> +
>   &pm7325_gpios {
>   	kypd_vol_up_n: kypd-vol-up-n-state {
>   		pins = "gpio6";


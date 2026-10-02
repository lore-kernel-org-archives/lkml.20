Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C706420472
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969470; cv=none; b=VhHzTdcLS+jgJUfreZVsUlr1Z5Hx/WkvhqKMT14Fa+gqjCXzP1dpz+34ygNJOi/IqDEwqjSgTUCHkS4mGrvxWpSt65FsKsWSxJy1X5aAIQZ8ejpB65x16hQBn9ET6f6uZdwqjK/iQKwkoMepVtTNpyZVNbDyY70p69VeJHeTj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969470; c=relaxed/simple;
	bh=QW1y/WM5UmDpron7TwpLVurcIiislY7epjchT7E4Ako=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTMLFU2gWvjmN2jM9wvab+8vbHlTFZujMQkzcH5/qhD7XAmpRcyc3onU19x9TTY0In2UxYK3+NrkhvnDOVWeKBJwGJQhA2IaH3b3xm9zFsg8xcZHgEO2vmj027MImbkJiTOnhV06aN3malMpv8P5oTJEky23q5Lo0WXLiGIWhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFzXBu/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdXuvwp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFzXBu/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdXuvwp6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6J4h1675842
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5jqEnb3+KWwV7LjCEDcEU0qQxB/nxY+bjbGVXdzvfM=; b=HFzXBu/xR86DLJ9k
	Hno7FlJoGYDO/MUXxFe4YgCTURHlPZOYdSyaArqBPjwtz16STrwvkXESccyLBxUl
	F2BIvJugdaJjH+yTPbNTBb7B6zLUaafe7b3HP+uvTeIMdG1z5jcmvA2IdRNmsRMC
	fP6PVWKlar2t+4nvsiCmUWKgYzXc4GNBODotpy6aMChP8Dl7R7kknQ1UnMsfFvsV
	0GeNl+/feZbtGlFbpB9xefBkIuZwqtPRhWxknvkejJZh3GXZVNoQerV1Q0vzF5ed
	utfxci/7wbrVO6MJCR/I6z65Srpss+ebSu6Glv6ROGLrNN0ptzXVCwfRr+gpdaje
	l9Cg5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8rtpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:31:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso374513085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790969464; x=1791574264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5jqEnb3+KWwV7LjCEDcEU0qQxB/nxY+bjbGVXdzvfM=;
        b=hdXuvwp6PRiKvklwlz+YpXO6ayMTkMawGXMv1U8Gb7kV4zoQla2nULTKyu/QLL5Ef5
         Z+JfEUseLXok1lyGTKg0tvf90WpqXbmAYJMXesd2bP6K7gUUaQfgUtFsC3osS5LZtRa1
         D8005d0cstf8nwq9CHA3PtVnmD2rl+KItmvcJfwaUzzs9gjFM22HZbgkQw9ApWyuICyO
         eNuoQv1pX/wVG7kyndUHQbX8XrUO6aWfPZFwQPI3P6iPJYIzV0F4qec+eXNosDvqOjZ4
         S4OTIzaTt07kTzxYUqReOzCERsAJjAsr+cepffSVwG8L1CEGmiuQSmIMFNY1O3bnxN2Z
         wAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969464; x=1791574264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5jqEnb3+KWwV7LjCEDcEU0qQxB/nxY+bjbGVXdzvfM=;
        b=w1w364WGkcuZnVqxaVYStj8BYn8qZ7vcofT5uUHFdY/OldaBXwCxC1zVBUHMSsokBB
         z8BpmbTb1I1rc+YZyxXJT/G1ZJYREA9wzsLoNleILzgsJVedEnmFCDxU9QbtO5WuyLTj
         TzZDLpLLYH+Ng3LrDFGDmD6nGUrTyDn269zSVra3FUeilvP2QkTyWK7i6TNtwjVjMIz1
         XCnf3hHaGQyzDHbDsfS+I7ir7snbUJjKtFk51Sj9gTO8jmi6dWbcHCcB4u6bZt3Aebqq
         0REj+YbWAkZ0Ecg2J+MS7q84ImaD6xYC0OHEQuWRS5OYZ8pJM9b7+KsHUAifLIQ4iO8K
         tDkA==
X-Forwarded-Encrypted: i=1; AKwUvBwPwhVXN1ptkUDhh+YzA0LVbJMH4jHU4MAr20OO24AtMlmrk6iU77xgXKcUENAgS1fbVx0MWRGWB68enLY=@vger.kernel.org
X-Gm-Message-State: AFuF++mg7ZiMH35aaw1PkVBSSPwDcWPdPpsrLRe3V64EcbFTyUK68Cf/
	8eDT480DL4CkFl5Lu+4pImd4J9DqDhPnRcc0IlXEnMco9BNE+2/KxA36oZwXIdZDQxGtemp2ak6
	quLptoHrN+PXbr2nmDk5gY1UAfBBcbMbG3CJXhBTNje53PtsclZI3rnqfxRkT+Fd0Z44=
X-Gm-Gg: AYBFou1hZsDkOz+9+FYYaOiJvVwOpC95GxSeAbxWNgtEZQg4BP/LjTacXe85DTFEswL
	mhbe48/r/F2coJkZh+HUBAIVwBtkeiqkYXTfulS5jJKIqJc0Vp25l8To4DfU+aGIgzESvERJB4Q
	r5Iv3lryE+S3lTyNKcTkvDA2MNO9lTNpQZbri9OCCjfkXxAf/QpIxFe04JFKMjKvP+HhPRryzGF
	mYpaoYmdIenavYftTDnAkrBGaj92Vb+rHjsx5ktPUQHyi+CitJ1RBlszWvMxCEysjToh9lypenk
	bZx5X6SkiFlO7//GV6b2G4FzSVMC60xfOnqJkgbpfqvAj6vWtmMwGQzsFS0GnAjYw9fH/s9C3HR
	rAtSuQtrZfbvCGxIaXenrLjZ5fw==
X-Received: by 2002:a05:620a:648a:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93cf1783785mr639474185a.43.1790969463245;
        Fri, 02 Oct 2026 12:31:03 -0700 (PDT)
X-Received: by 2002:a05:620a:648a:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93cf1783785mr639463485a.43.1790969462242;
        Fri, 02 Oct 2026 12:31:02 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm115857995e9.2.2026.10.02.12.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 12:31:01 -0700 (PDT)
Message-ID: <0b385bd1-9fe4-48ec-9f17-094a29c3a931@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 20:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260929221821.505551-3-srinivas.kandagatla@oss.qualcomm.com>
 <ar3FdCEat0ispX1F@zenbook>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ar3FdCEat0ispX1F@zenbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4JT7JzW_afpMdB_vXfGCuC4xuwKD_v-U
X-Proofpoint-GUID: 4JT7JzW_afpMdB_vXfGCuC4xuwKD_v-U
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6ac00678 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IPP12zauwFsLQdfzTs8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NyBTYWx0ZWRfX5iegu26HMkX/
 5RzrMIi7owBab0Z3yZaYEhJiMkZMJqVv/3Oq64pQ9ei2vpcLoRpAifdPR8uvpagNNcqXpUGxdRJ
 KsiCsSTYGf4aPq2UE+iG8U9cA0xnw3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NyBTYWx0ZWRfX5x9HYsZ95zJU
 t9x2EHDiwH9B1oHBTpWs3y39lMdTcRL1QDYiqXaSxM5O3i+68plEU1sA9z6zb1mbkBrpI6mOjcv
 KLZhYCHWsrVE9ypPZ5kgP6FGK9ACsY8/fnafWhpr9iwg6DOrM5Nl5QzzZ0feOusoNHLZ5W07vIi
 zBB1K19ARPwtwsXDNsnlrQlHFqVJDgHuKXiYH/esbSP9YV4dYzcZq1qnzBGxkkzau6/BKi7+zbk
 QrvvedKtw3tSRGiQWjckHztcSKTiaahQD0jftC+TZMMmfDWQnGvb5kSbTy/de2ANN6/5rMFFKlA
 4Mfw+IYslOyzMQnea0tC4JrB21ruibFIPBdjVXZTvr25OP9XhYRWX0ebyVRHr2dbalvUJq16/oM
 iSTzEhDZKhWZm/uTgmb0C3boC406rRZJPD5P7YSswUnOJnpX6rezjgFL+oe3utcTptPBXYXEDQe
 i1vfl61+y5U1IR2B9jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020077

On 10/1/26 3:30 AM, Bjorn Andersson wrote:
> On Tue, Sep 29, 2026 at 11:18:20PM +0100, Srinivas Kandagatla wrote:
>> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
>> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
>> design used by mahua-crd.
>>
> 
> I already merged v3, so please check the delta and submit any
> incremental fixes.

Thanks Bjorn for picking up v3, yes, i noticed that will send
incremental change.
> 
>> Currently working:
>> - Display (internal eDP panel)
>> - Audio playback and capture (2x WSA8845 speakers on swr0, DMICs via
>>   the VA macro)
>> - DisplayPort audio on the two USB-C DP outputs (DP0/DP1)
>> - USB-C (host + charging on both ports)
>> - Wi-Fi (WCN7850 on PCIe4), Bluetooth (over uart14)
>> - NVMe on PCIe5
>> - HID-over-I2C touchpad, keyboard and TrackPoint on i2c0
>> - Lid switch
>> - Internal USB2 camera on usb_hs (via PTN3222 redriver)
>> - Goodix fingerprint reader on usb_2
>> - WWAN wiring is included but remains untested due to lack of access
>>   to such a SKU.
>>
>> Assisted-by: Claude:claude-opus-4-7
> 
> Now in the future this should be:
> 
> Assisted-by: LLM
Yes, I learned about it recently, thanks for reminding.

--srin
> 
> Regards,
> Bjorn
> 
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>>  .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1277 +++++++++++++++++
>>  2 files changed, 1278 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 7ee7b98994c2..a9e372e0285a 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>> new file mode 100644
>> index 000000000000..b3c6559df964
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>> @@ -0,0 +1,1277 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include "mahua.dtsi"
>> +
>> +#include "pmcx0102.dtsi"
>> +#include "pmh0101.dtsi"
>> +#include "pmh0104-glymur.dtsi"
>> +#include "pmh0110-glymur.dtsi"
>> +#include "pmk8850.dtsi"
>> +#include "smb2370.dtsi"
>> +
>> +#include <dt-bindings/input/gpio-keys.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> +
>> +/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
>> +/delete-node/ &pmcx0102_d_e0;
>> +/delete-node/ &pmcx0102_d0_thermal;
>> +/delete-node/ &pmh0104_i_e0;
>> +/delete-node/ &pmh0104_i0_thermal;
>> +/delete-node/ &pmh0104_j_e0;
>> +/delete-node/ &pmh0104_j0_thermal;
>> +
>> +/ {
>> +	model = "Lenovo ThinkPad T14s Gen 7 (LCD)";
>> +	compatible = "lenovo,thinkpad-t14s-gen7-lcd", "lenovo,thinkpad-t14s-gen7",
>> +		     "qcom,mahua";
>> +
>> +	aliases {
>> +		i2c0 = &i2c0;
>> +		i2c5 = &i2c5;
>> +
>> +		serial0 = &uart21;
>> +		serial1 = &uart14;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	clocks {
>> +		xo_board: xo-board {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32000>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	backlight: backlight {
>> +		compatible = "gpio-backlight";
>> +		gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-0 = <&edp_bl_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&hall_int_n_default>;
>> +		pinctrl-names = "default";
>> +
>> +		switch-lid {
>> +			label = "lid";
>> +			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
>> +			linux,input-type = <EV_SW>;
>> +			linux,code = <SW_LID>;
>> +			wakeup-source;
>> +			wakeup-event-action = <EV_ACT_DEASSERTED>;
>> +		};
>> +	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,glymur-pmic-glink",
>> +			     "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		/* Left-side USB-C port */
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_0_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss_in: endpoint {
>> +						remote-endpoint = <&usb_0_qmpphy_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		/* Right-side USB-C port */
>> +		connector@1 {
>> +			compatible = "usb-c-connector";
>> +			reg = <1>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in1: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss_in1: endpoint {
>> +						remote-endpoint = <&usb_1_qmpphy_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	vreg_edp_3p3: regulator-edp-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_edp_bl: regulator-edp-bl {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_BL";
>> +		regulator-min-microvolt = <3600000>;
>> +		regulator-max-microvolt = <3600000>;
>> +
>> +		gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_bl_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_misc_3p3: regulator-misc-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_MISC_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&misc_3p3_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_nvme: regulator-nvme {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_NVME_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&nvme_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_0P95";
>> +		regulator-min-microvolt = <950000>;
>> +		regulator-max-microvolt = <950000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&wcn_sw_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_wwan: regulator-wwan {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WWAN_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&wwan_reg_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	reserved-memory {
>> +		linux,cma {
>> +			compatible = "shared-dma-pool";
>> +			size = <0x0 0x10000000>;
>> +			reusable;
>> +			linux,cma-default;
>> +		};
>> +	};
>> +
>> +	sound {
>> +		compatible = "qcom,glymur-sndcard";
>> +		model = "Lenovo-ThinkPad-T14s-Gen-7";
>> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
>> +				"VA DMIC0", "vdd-micb",
>> +				"VA DMIC1", "vdd-micb";
>> +
>> +		wsa-dai-link {
>> +			link-name = "WSA Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&left_spkr>, <&right_spkr>,
>> +					    <&swr0 0>, <&lpass_wsamacro 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +		va-dai-link {
>> +			link-name = "VA Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lpass_vamacro 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +		displayport-0-dai-link {
>> +			link-name = "DisplayPort0 Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&mdss_dp0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +		displayport-1-dai-link {
>> +			link-name = "DisplayPort1 Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&mdss_dp1>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +	};
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		vdd-supply = <&vreg_wcn_0p95>;
>> +		vddio-supply = <&vreg_l15b_e0_1p8>;
>> +		vddaon-supply = <&vreg_l15b_e0_1p8>;
>> +		vdddig-supply = <&vreg_l15b_e0_1p8>;
>> +		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
>> +		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-0 = <&wcn_wlan_bt_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulators {
>> +			vreg_pmu_rfa_cmn: ldo0 {
>> +				regulator-name = "vreg_pmu_rfa_cmn";
>> +			};
>> +
>> +			vreg_pmu_aon_0p59: ldo1 {
>> +				regulator-name = "vreg_pmu_aon_0p59";
>> +			};
>> +
>> +			vreg_pmu_wlcx_0p8: ldo2 {
>> +				regulator-name = "vreg_pmu_wlcx_0p8";
>> +			};
>> +
>> +			vreg_pmu_wlmx_0p85: ldo3 {
>> +				regulator-name = "vreg_pmu_wlmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_btcmx_0p85: ldo4 {
>> +				regulator-name = "vreg_pmu_btcmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_rfa_0p8: ldo5 {
>> +				regulator-name = "vreg_pmu_rfa_0p8";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p2: ldo6 {
>> +				regulator-name = "vreg_pmu_rfa_1p2";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p8: ldo7 {
>> +				regulator-name = "vreg_pmu_rfa_1p8";
>> +			};
>> +
>> +			vreg_pmu_pcie_0p9: ldo8 {
>> +				regulator-name = "vreg_pmu_pcie_0p9";
>> +			};
>> +
>> +			vreg_pmu_pcie_1p8: ldo9 {
>> +				regulator-name = "vreg_pmu_pcie_1p8";
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pmh0101-rpmh-regulators";
>> +		qcom,pmic-id = "B_E0";
>> +
>> +		vreg_bob1_e0: bob1 {
>> +			regulator-name = "vreg_bob1_e0";
>> +			regulator-min-microvolt = <2200000>;
>> +			regulator-max-microvolt = <4224000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
>> +		};
>> +
>> +		vreg_bob2_e0: bob2 {
>> +			regulator-name = "vreg_bob2_e0";
>> +			regulator-min-microvolt = <2540000>;
>> +			regulator-max-microvolt = <3600000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
>> +		};
>> +
>> +		vreg_l1b_e0_1p8: ldo1 {
>> +			regulator-name = "vreg_l1b_e0_1p8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2b_e0_2p9: ldo2 {
>> +			regulator-name = "vreg_l2b_e0_2p9";
>> +			regulator-min-microvolt = <2904000>;
>> +			regulator-max-microvolt = <2904000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7b_e0_2p79: ldo7 {
>> +			regulator-name = "vreg_l7b_e0_2p79";
>> +			regulator-min-microvolt = <2790000>;
>> +			regulator-max-microvolt = <2792000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8b_e0_3p3: ldo8 {
>> +			regulator-name = "vreg_l8b_e0_3p3";
>> +			regulator-min-microvolt = <1504000>;
>> +			regulator-max-microvolt = <3304000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l9b_e0_2p9: ldo9 {
>> +			regulator-name = "vreg_l9b_e0_2p9";
>> +			regulator-min-microvolt = <2704000>;
>> +			regulator-max-microvolt = <2960000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l10b_e0_1p8: ldo10 {
>> +			regulator-name = "vreg_l10b_e0_1p8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l11b_e0_1p2: ldo11 {
>> +			regulator-name = "vreg_l11b_e0_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12b_e0_1p2: ldo12 {
>> +			regulator-name = "vreg_l12b_e0_1p2";
>> +			regulator-min-microvolt = <1144000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l15b_e0_1p8: ldo15 {
>> +			regulator-name = "vreg_l15b_e0_1p8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-always-on;
>> +		};
>> +
>> +		vreg_l17b_e0_2p4: ldo17 {
>> +			regulator-name = "vreg_l17b_e0_2p4";
>> +			regulator-min-microvolt = <2400000>;
>> +			regulator-max-microvolt = <2700000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l18b_e0_1p2: ldo18 {
>> +			regulator-name = "vreg_l18b_e0_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-always-on;
>> +		};
>> +	};
>> +
>> +	regulators-1 {
>> +		compatible = "qcom,pmcx0102-rpmh-regulators";
>> +		qcom,pmic-id = "C_E1";
>> +
>> +		vreg_l1c_e1_0p82: ldo1 {
>> +			regulator-name = "vreg_l1c_e1_0p82";
>> +			regulator-min-microvolt = <832000>;
>> +			regulator-max-microvolt = <832000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2c_e1_1p14: ldo2 {
>> +			regulator-name = "vreg_l2c_e1_1p14";
>> +			regulator-min-microvolt = <1144000>;
>> +			regulator-max-microvolt = <1144000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3c_e1_0p89: ldo3 {
>> +			regulator-name = "vreg_l3c_e1_0p89";
>> +			regulator-min-microvolt = <890000>;
>> +			regulator-max-microvolt = <980000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4c_e1_0p72: ldo4 {
>> +			regulator-name = "vreg_l4c_e1_0p72";
>> +			regulator-min-microvolt = <720000>;
>> +			regulator-max-microvolt = <720000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-2 {
>> +		compatible = "qcom,pmh0110-rpmh-regulators";
>> +		qcom,pmic-id = "F_E0";
>> +
>> +		vreg_s7f_e0_1p32: smps7 {
>> +			regulator-name = "vreg_s7f_e0_1p32";
>> +			regulator-min-microvolt = <1320000>;
>> +			regulator-max-microvolt = <1352000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s8f_e0_0p95: smps8 {
>> +			regulator-name = "vreg_s8f_e0_0p95";
>> +			regulator-min-microvolt = <952000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s9f_e0_1p9: smps9 {
>> +			regulator-name = "vreg_s9f_e0_1p9";
>> +			regulator-min-microvolt = <1900000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2f_e0_0p94: ldo2 {
>> +			regulator-name = "vreg_l2f_e0_0p94";
>> +			regulator-min-microvolt = <936000>;
>> +			regulator-max-microvolt = <936000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3f_e0_0p91: ldo3 {
>> +			regulator-name = "vreg_l3f_e0_0p91";
>> +			regulator-min-microvolt = <912000>;
>> +			regulator-max-microvolt = <912000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4f_e0_0p3: ldo4 {
>> +			regulator-name = "vreg_l4f_e0_0p3";
>> +			regulator-min-microvolt = <1080000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-3 {
>> +		compatible = "qcom,pmh0110-rpmh-regulators";
>> +		qcom,pmic-id = "F_E1";
>> +
>> +		vreg_s7f_e1_0p3: smps7 {
>> +			regulator-name = "vreg_s7f_e1_0p3";
>> +			regulator-min-microvolt = <300000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1f_e1_0p88: ldo1 {
>> +			regulator-name = "vreg_l1f_e1_0p88";
>> +			regulator-min-microvolt = <880000>;
>> +			regulator-max-microvolt = <880000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2f_e1_0p9: ldo2 {
>> +			regulator-name = "vreg_l2f_e1_0p9";
>> +			regulator-min-microvolt = <904000>;
>> +			regulator-max-microvolt = <904000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4f_e1_1p2: ldo4 {
>> +			regulator-name = "vreg_l4f_e1_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-4 {
>> +		compatible = "qcom,pmh0110-rpmh-regulators";
>> +		qcom,pmic-id = "H_E0";
>> +
>> +		vreg_l1h_e0_0p94: ldo1 {
>> +			regulator-name = "vreg_l1h_e0_0p94";
>> +			regulator-min-microvolt = <936000>;
>> +			regulator-max-microvolt = <936000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2h_e0_0p72: ldo2 {
>> +			regulator-name = "vreg_l2h_e0_0p72";
>> +			regulator-min-microvolt = <832000>;
>> +			regulator-max-microvolt = <832000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3h_e0_0p32: ldo3 {
>> +			regulator-name = "vreg_l3h_e0_0p32";
>> +			regulator-min-microvolt = <320000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4h_e0_1p2: ldo4 {
>> +			regulator-name = "vreg_l4h_e0_1p2";
>> +			regulator-min-microvolt = <1080000>;
>> +			regulator-max-microvolt = <1320000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +};
>> +
>> +/* GPU/GMU not fully functional yet on this platform. */
>> +&gmu {
>> +	status = "disabled";
>> +};
>> +
>> +&gpu {
>> +	status = "disabled";
>> +};
>> +
>> +&i2c0 {
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	touchpad@2c {
>> +		compatible = "hid-over-i2c";
>> +		reg = <0x2c>;
>> +
>> +		hid-descr-addr = <0x20>;
>> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		vdd-supply = <&vreg_misc_3p3>;
>> +		vddl-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		pinctrl-0 = <&tpad_default>;
>> +		pinctrl-names = "default";
>> +
>> +		wakeup-source;
>> +	};
>> +
>> +	keyboard@3a {
>> +		compatible = "hid-over-i2c";
>> +		reg = <0x3a>;
>> +
>> +		hid-descr-addr = <0x1>;
>> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		vdd-supply = <&vreg_misc_3p3>;
>> +		vddl-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		pinctrl-0 = <&kybd_default>;
>> +		pinctrl-names = "default";
>> +
>> +		wakeup-source;
>> +	};
>> +};
>> +
>> +&i2c5 {
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	ptn3222_0: redriver@43 {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x43>;
>> +
>> +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
>> +
>> +	ptn3222_1: redriver@4b {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x4b>;
>> +
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
>> +
>> +	ptn3222_cam: redriver@47 {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x47>;
>> +
>> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
>> +
>> +	ptn3222_fpr: redriver@4f {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x4f>;
>> +
>> +		reset-gpios = <&tlmm 40 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
>> +};
>> +
>> +&lpass_vamacro {
>> +	pinctrl-0 = <&dmic01_default>;
>> +	pinctrl-names = "default";
>> +	qcom,dmic-sample-rate = <4800000>;
>> +	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp1 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp1_out {
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp3 {
>> +	/delete-property/ #sound-dai-cells;
>> +
>> +	pinctrl-0 = <&edp0_hpd_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +
>> +	aux-bus {
>> +		panel {
>> +			compatible = "edp-panel";
>> +			power-supply = <&vreg_edp_3p3>;
>> +			backlight = <&backlight>;
>> +
>> +			port {
>> +				edp_panel_in: endpoint {
>> +					remote-endpoint = <&mdss_dp3_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dp3_out {
>> +	data-lanes = <0 1 2 3>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +
>> +	remote-endpoint = <&edp_panel_in>;
>> +};
>> +
>> +&mdss_dp3_phy {
>> +	vdda-phy-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +/* PCIe4: on-board WLAN (WCN7850) */
>> +&pcie4 {
>> +	pinctrl-0 = <&pcie4_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie4_phy {
>> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
>> +	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie4_port0 {
>> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>> +
>> +	wifi@0 {
>> +		compatible = "pci17cb,1107";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +	};
>> +};
>> +
>> +/* PCIe5: primary M.2 2280 NVMe */
>> +&pcie5 {
>> +	vddpe-3v3-supply = <&vreg_nvme>;
>> +
>> +	pinctrl-0 = <&pcie5_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie5_phy {
>> +	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
>> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie5_port0 {
>> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
>> +};
>> +
>> +/* PCIe6: optional WWAN M.2 3042 */
>> +&pcie6 {
>> +	vddpe-3v3-supply = <&vreg_wwan>;
>> +
>> +	pinctrl-0 = <&pcie6_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie6_phy {
>> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
>> +	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie6_port0 {
>> +	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
>> +};
>> +
>> +&pmh0101_gpios {
>> +	nvme_reg_en: nvme-reg-en-state {
>> +		pins = "gpio14";
>> +		function = "normal";
>> +		bias-disable;
>> +	};
>> +};
>> +
>> +&pmh0110_f_e0_gpios {
>> +	misc_3p3_reg_en: misc-3p3-reg-en-state {
>> +		pins = "gpio6";
>> +		function = "normal";
>> +		bias-disable;
>> +		input-disable;
>> +		output-enable;
>> +		drive-push-pull;
>> +		power-source = <1>; /* 1.8 V */
>> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
>> +	};
>> +};
>> +
>> +&pmk8850_rtc {
>> +	qcom,no-alarm;
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/glymur/LENOVO/22A8/qcadsp8480.mbn",
>> +			"qcom/glymur/LENOVO/22A8/adsp_dtbs.elf";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/glymur/LENOVO/22A8/qccdsp8480.mbn",
>> +			"qcom/glymur/LENOVO/22A8/cdsp_dtbs.elf";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&swr0 {
>> +	status = "okay";
>> +
>> +	/* WSA8845, Left */
>> +	left_spkr: speaker@0,0 {
>> +		compatible = "sdw20217020400";
>> +		reg = <0 0>;
>> +		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrLeft";
>> +		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
>> +		vdd-io-supply = <&vreg_l18b_e0_1p2>;
>> +		qcom,port-mapping = <1 2 3 7 12 14>;
>> +	};
>> +
>> +	/* WSA8845, Right */
>> +	right_spkr: speaker@0,1 {
>> +		compatible = "sdw20217020400";
>> +		reg = <0 1>;
>> +		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrRight";
>> +		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
>> +		vdd-io-supply = <&vreg_l18b_e0_1p2>;
>> +		qcom,port-mapping = <4 5 6 7 13 15>;
>> +	};
>> +};
>> +
>> +&smb2370_j_e2_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
>> +	vdd3-supply = <&vreg_l7b_e0_2p79>;
>> +};
>> +
>> +&smb2370_k_e2_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
>> +	vdd3-supply = <&vreg_l7b_e0_2p79>;
>> +};
>> +
>> +&tcsr {
>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p9>;
>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p88>;
>> +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
>> +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
>> +	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p88>;
>> +	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
>> +			       <10 2>,  /* OOB UART */
>> +			       <27 1>,  /* TZ trigger  */
>> +			       <44 4>,  /* TPM */
>> +			       <139 1>; /* TZ trigger */
>> +
>> +	edp_bl_en: edp-bl-en-state {
>> +		pins = "gpio18";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	edp_bl_reg_en: edp-bl-reg-en-state {
>> +		pins = "gpio19";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	edp_reg_en: edp-reg-en-state {
>> +		pins = "gpio70";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +	};
>> +
>> +	edp0_hpd_default: edp0-hpd-default-state {
>> +		pins = "gpio119";
>> +		function = "edp0_hot";
>> +		bias-disable;
>> +	};
>> +
>> +	hall_int_n_default: hall-int-n-state {
>> +		pins = "gpio92";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +
>> +	kybd_default: kybd-default-state {
>> +		pins = "gpio67";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +
>> +	pcie4_default: pcie4-default-state {
>> +		clkreq-n-pins {
>> +			pins = "gpio147";
>> +			function = "pcie4_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins = "gpio146";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins = "gpio148";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	pcie5_default: pcie5-default-state {
>> +		clkreq-n-pins {
>> +			pins = "gpio153";
>> +			function = "pcie5_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins = "gpio152";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins = "gpio154";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	pcie6_default: pcie6-default-state {
>> +		clkreq-n-pins {
>> +			pins = "gpio150";
>> +			function = "pcie6_clk_req_n";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins = "gpio149";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins = "gpio151";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	tpad_default: tpad-default-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
>> +		pins = "gpio116", "gpio117";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_sw_en: wcn-sw-en-state {
>> +		pins = "gpio94";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wwan_reg_en: wwan-reg-en-state {
>> +		pins = "gpio246";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +};
>> +
>> +&uart14 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "qcom,wcn7850-bt";
>> +		max-speed = <3200000>;
>> +
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> +	};
>> +};
>> +
>> +&usb_0 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_0_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
>> +
>> +&usb_0_hsphy {
>> +	vdd-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
>> +
>> +	phys = <&smb2370_j_e2_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_0_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
>> +	refgen-supply = <&vreg_l2f_e0_0p94>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_0_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss_in>;
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_hs_in1>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
>> +
>> +	phys = <&smb2370_k_e2_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_qmpphy {
>> +	vdda-phy-supply = <&vreg_l1h_e0_0p94>;
>> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
>> +	refgen-supply = <&vreg_l2f_e0_0p94>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss_in1>;
>> +};
>> +
>> +&usb_mp {
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_hsphy0 {
>> +	vdd-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
>> +
>> +	phys = <&ptn3222_0>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_hsphy1 {
>> +	vdd-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
>> +
>> +	phys = <&ptn3222_1>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_qmpphy0 {
>> +	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
>> +	refgen-supply = <&vreg_l4f_e1_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_qmpphy1 {
>> +	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
>> +	refgen-supply = <&vreg_l4f_e1_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_hs {
>> +	dr_mode = "host";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_hs_phy {
>> +	vdd-supply = <&vreg_l2h_e0_0p72>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
>> +
>> +	phys = <&ptn3222_cam>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_2 {
>> +	dr_mode = "host";
>> +	maximum-speed = "high-speed";
>> +
>> +	/delete-property/ usb-role-switch;
>> +	phys = <&usb_2_hsphy>;
>> +	phy-names = "usb2-phy";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_2_hsphy {
>> +	vdd-supply = <&vreg_l4c_e1_0p72>;
>> +	vdda12-supply = <&vreg_l4f_e1_1p2>;
>> +
>> +	phys = <&ptn3222_fpr>;
>> +
>> +	status = "okay";
>> +};
>> -- 
>> 2.53.0
>>


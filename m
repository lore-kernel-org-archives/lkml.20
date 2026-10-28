Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176191;
	b=zjzKhrf/wxQ2FtZnkD9EVi9NSaBuYHoQNfCPzauB8q4SAudg8Jg4iPloVWP8ouAepjTD
	 w78MvUF4jOvMSTxZk7wH5haRx4h94CclzXmr08EcUi3y/Mi9MKE71aR62isi/g2wt+9+O
	 YbYoST9jyRhs58U5prpz/+2SSJo+KdTpsT08l8PvTE9Zyf3ZfGqlBkDFfj5yH2PuwWfTp
	 RY7mxtIhmn4pATtvyvaKcAN4f/5PrEVgJHCqKNDZHMWf4qJLgty/RxQ9p6Ivd2qG7DRm3
	 OsaIflHZMreB9IQcs/mdy6+4s84oZotBOplipdulGkV5gMOSRBkWw8EVsi5Cu2dMp/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176191;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=tSsll3kKf/A5nOKxO5JS6a9ssNuy0Uui3cKpvaZxhZ0=;
	b=uo8UXgS2Mlh2DP0T+am9k0PAP/+gEAWu/rYPeaJAxaSA4MXjfWj3p8uqEgbQUyW49z9l
	 121K6k5NgXwdZelrWXT92TJAJfu+BZ7pjUfwGETLmFAoTh/q/OL1AliJfScAVQxxTfYc/
	 BmMH1Ocl783CJZQGZ0vKZ5MAh6X8ArvLbYMAC708vDz/LoYADrGnfdUu77HQ8onD8/Rr9
	 52f3wdEKduyOZl6+9v4J2S1W+e/6eMri7EVvXCmx7G7pr2CPthik3+chLT6X/BdzcsCkT
	 AsHNVPAMlZmU4rhQedjtS4ohkOpr9eVKJRSabWiwgp+FYkv1cUy5rJ77DS3m4JZ3bmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJ5Q5aLb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69EF606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJ5Q5aLb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7E11F031F4
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176190;
	bh=tSsll3kKf/A5nOKxO5JS6a9ssNuy0Uui3cKpvaZxhZ0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eJ5Q5aLbqDPJ5gof5fltzVkIsyvjcisnT6uC7Ii6JTZqbS+D5XYGScuRWpa1tX2SF
	 MVQZq27HUDKZzmlR5s4xpRjwQ/IS/jZDPXPityyrXnpDNVJhMVii6hBsp5K83mmYUe
	 nMSJnU8mMA6Od/5vfvCI54TKcHyd/cLIN3y/U7+Y45y8qVycueSy+oqPYbpQwOXPDj
	 kpQlh9ZUujRsVeCNaZfzS4TyDzpMPG4yoOa8BrV8BvXwHI5crpnGofzIP5SBfNCevQ
	 r8UivzfCpUNJW8xmuZzi80gdrABlR7w9ZJdaIJAT+pa9QULQ2FjU+xSL7Y5Zu+yyqW
	 Y8ZymlLzf8PTg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso820390e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:29:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzY+j5gVQ235J+KKLKO1yktGXHklfTTo5pxaTJfaZu8jt3CkupsLgkd5PEDw/t5+yl0kwUoa6dQPjQS474=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgHzapiusaKKw5lUnW8SDxpifFPNZAPpVlpVpXYjRcU8HeGVpZ
	ud8fotiheI6rHa6mO2gjXNktDQ1efK4LA1QYKXcDtmcz+nQ/onwrHnmGfb48AgXXBdudAZRCvSU
	774qhye9eMYomSSUIUKsLbvac/2Ivd4ZW8CTU0ZCPDQ==
X-Received: by 2002:a05:6512:39d4:b0:5be:4904:d2c4 with SMTP id
 2adb3069b0e04-5bfcad7e51bmr690736e87.15.1793176189147; Wed, 28 Oct 2026
 01:29:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 03:29:47 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 03:29:47 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com> <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 03:29:47 -0500
X-Gmail-Original-Message-ID: <CAMRc=McWSHn03C9DZ8ZohebfDA9z8L=xJ05KDOYEm6n3eHPArA@mail.gmail.com>
X-Gm-Features: AclHuK9WkISxEdVMPKocpMJX1vIBeHnYYBYBtz3ekKYCE5vss8u7OwiUvounMh4
Message-ID: <CAMRc=McWSHn03C9DZ8ZohebfDA9z8L=xJ05KDOYEm6n3eHPArA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans-sa8255p: add ethernet nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 14:32:16 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> said:
> On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
>> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
>> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
>> EMACs.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
>>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
>>  2 files changed, 241 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
>> index 4c155cbc79754af632848cd55b738e3ef0511cb5..c64cfd279af458e24fb48083ae549c96cfc07485 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
>> @@ -58,6 +58,14 @@ &cpufreq_hw {
>>  	clock-names = "xo", "alternate";
>>  };
>>

...

>> +
>>  &firmware {
>>  	scm {
>>  		memory-region = <&tz_ffi_mem>;
>> @@ -3226,6 +3234,26 @@ cma: linux,cma {
>>  	};
>>  };
>>
>> +&soc {
>> +	serdes0: phy@8901000 {
>> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
>
> Hmm.. I was hoping Shawn's DT reshuffling would land first
>

This series depends on Shawn's, I too hope it lands first. :)

> Are the PHYs hardwired? If so, you can move the phys= reference
> here

Yes, they are and will do in v2.

Bart

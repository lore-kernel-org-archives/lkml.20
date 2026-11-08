Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794103402;
	b=WP3EC3T3+sxMFm3T0/RSYaGFmUUX4z4jdKBJS3gRE2kQQw9dQvVeWbjPgG1l0uDAfgkv
	 5BgBQ26l3Trzw9vFrmE72ZLR1/2B6kD5IcWab5J8H5sj+LKCstCdWivSJgB1jQYLJt0Iw
	 91dg+rN1jIyrz2pZ1Xy6fnUION3Xy1a7X9GZnEyctTnTCAzMuzHyqAJlKEtFL0JDtiFYG
	 WlJWM4AS/7vA/SaGrD8ti7QZ23zIoOnUbkVSs/hriHqBhrAgWftBnuoDiiOLBQWyZXz7U
	 OZweNe+IK0eD72ew1/7n+CAWiZP2+JFOl2zBwBOmJRaF/1zIfUGyHL4BdB5RJl3mKcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103402;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=PuGzHsk/LIqXvaJ1IohwPD9m5fePFH4W4L4+Otr9oFg=;
	b=Q7xZDdsB3aQzxXwz6p9AQ/6pz31xny2bHiwBlnttv25o9+i6wPNHyy8E3DCR6A19G0hS
	 JJCAGT5kBDHtzNp7CND4iw/uPaWEEv22Z0FtzmSD/MVfEIxtwjc+uhcaSeaSM05JhOwwV
	 mX7VBef3aPHX2kYUFZE2PEBLUrQmKZOqJtIw2bSrjUG1hFRS9PMmqZnEbypFIuitA9dkJ
	 rc8wbb69r70/KEQ5JybdIezYk9TH1Q65rRacPQmdE8CI+REznygkXUO0aMWG4xWqxD9Ta
	 jOAx/YqNCKn7HZgO/nQdGJ0izGBBh+3gOcvgeePvOA0naXEW3VrapgB7P74JQ4yz7ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=kkvwdeSA;
	arc=none smtp.remote-ip=160.236.53.83
Received: from mail-m1602365383.xmail.ntesmail.com (mail-m1602365383.xmail.ntesmail.com [160.236.53.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA79606A31A;
	Sun,  8 Nov 2026 02:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=kkvwdeSA
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53dfa8dee;
	Sun, 8 Nov 2026 10:03:07 +0800 (GMT+08:00)
Message-ID: <f5edf258-4b6d-416a-9b27-efa47be8d91a@rock-chips.com>
Date: Sun, 8 Nov 2026 10:03:05 +0800
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
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1b8e5269b03a7kunm53324d9a39fbb5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR4eVk8ZQk4YTR8aGUtMGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kkvwdeSA0JXJh94IWdoOSWnmeXYZ9RyQRqQBfDWgsti8LomJ+ryPfekPup1YK2zqCp32ezrhpwkXNcPo9NMfBs2c+x/+MOjst8p/1yt7jZEP8715nyJ1Tq02av39HeA2waphNRPwmGnFstec7rZdZfNzWes+86n1+K6ZFHurI3I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PuGzHsk/LIqXvaJ1IohwPD9m5fePFH4W4L4+Otr9oFg=;
	h=date:mime-version:subject:message-id:from;

On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> Also enable the NPU on the RK3588 EVB1, which is very similar to
> the QuartzPro64.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

I remember there was already a similar patch before?
Maybe I got something wrong.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> index 87e624d1e094..6476d9e3be6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> @@ -578,6 +578,10 @@ &pd_gpu {
>  	domain-supply = <&vdd_gpu_s0>;
>  };
>  
> +&pd_npu {
> +	domain-supply = <&vdd_npu_s0>;
> +};
> +
>  &pd_rkvdec0 {
>  	domain-supply = <&vdd_vdenc_s0>;
>  };
> @@ -703,6 +707,36 @@ &pwm2 {
>  	status = "okay";
>  };
>  
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_mmu_0 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc_1v8_s0>;
>  	status = "okay";
> 

-- 
Best, 
Chaoyi


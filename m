Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924415;
	b=NvAhVmpwUtgLf1x4+IKnqWOXACSzRk88u/QQrvBobiEvA59Qc3ZP00oBNFZsxyNJyi46
	 gvyka9KqMupjvHz9n1Llh6j2aBcLMjPbAC4MIHUTYg26xzj46Ue7L2slj3tvc/O4C8rUT
	 /rRZ0+eD1We5fML9z0TF/xl2YqzlkZcSYf8Gr42Yz5g/2BcAk5to6TP2bXxrwRTye5aEp
	 sT6AzXdxQRXvvpUjg6JuAxXBXudtdhdVK/VbHaoig6AvTCVMMKgyzQrnmhvOSqJ5lVvQT
	 IDmo4+6bmC5u7KLFds+NnyW8iE8Nr4Q25R5sZOIKbAmfW2mUh/JjHwUgW49NfBCMtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924415;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6uSvfC5jYn0SZCUdkQQtcniyMzEPTSPEt/ng2+mDaK4=;
	b=oct93Y4OtStSzck4vpbwhY0w0gGBq9zYb25YZ/pbiYR45NDYCXhKf6AxfYs8gY7xf84y
	 p51im7p0IwqxLCEjQ9ylY97aJl9F4NHjSg6vdFHa+m+zOaQVNsih7bwlp3eTNi2q6/Cqz
	 0Sa7uClbQzA9IIJ4Z7v3Ce6qtGVeQMEzuwuj1VEhyAfhbcmYTK8xSknvh1CMYCq8uf5wp
	 yL+jPdGdMj62CpPsIcozZNdPir8e8a4j6Oss7MlF57DgshfVe1QOBMSua+i87nWLkpvTQ
	 t/+9JObKus8KRpDvNxNhKwT/8fV9YtDyi5UHEPH2wi5TPP+444qcoZC5b79locnSoSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fBTBUT2U;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342E606A329;
	Tue, 17 Nov 2026 14:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1342E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fBTBUT2U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794924412;
	bh=vVV4spwHYbAauEsxYC6THPXIxk5VSqw/wZZWsp1RODU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fBTBUT2UiRc1Wfv+bZejMAlCy2ZeBLbuvsf9BWFa/aPGiC2UtcZHQTGLTB0ZKuvc/
	 SHygH84hz1USDOBqriEO2osZPaJ7bOPKXD3E4xXlGPm6oXUMNoMoQGDATgQ4aceyG3
	 FAqanQsEuobRmY0QjGkOZMz8hBbmB7xL3g5O1mYmfGqNl8ns2VmcthD2GUvjeQvPzZ
	 qwKDscxU1uCiy644O/rHCWUWae7WMghIzrA0PzgXa/oBCw6zwBn/ou8NDc4Pukf/o2
	 CpZQY9600AKwjhbN8EZC5XN+qgVH7VcOQcodCaRjUlOYcdyOJFnQ6sN/1W3SVkLww6
	 O5eKPa+ZNsmhQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5B5E17E0311;
	Tue, 17 Nov 2026 15:06:51 +0100 (CET)
Message-ID: <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
Date: Tue, 17 Nov 2026 15:06:51 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 14:05, Krzysztof Kozlowski wrote:
> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
> approved by Devicetree maintainers, because they were never documented
> as actual ABI.  Drop them, because no new custom aliases are allowed for
> years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

That'll just break everything.

I do have a mediatek-drm restructuring series that is partially resolving this
situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
recognized, but with some caveats that could be unacceptable (as in, if 0 is
disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
for real, it's just making it tick right when stars in the sky align in the
right way, which for some SoCs is reliably possible without side effects).

In any case, all of the ones that have only instance 0 (and all of the instance
0s) can be removed even right now already (still needs some testing to make sure
that there's no regression), but everything else can't, at least not until the
whole restructuring thing is merged as that'd break things.

Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
which took almost a year of development... and it also does rely on the aliases.
I was in the process of slowly cleaning up those (as I said, there's already a
restructuring that makes things a little better in this regard), but at this point
that'll need to be done with the highest possible priority.

Let me see what can I do to make the right thing to happen.

Anyway - thanks for pointing this.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 17 ----------
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ---------
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  7 ----
>   .../boot/dts/mediatek/mt8188-geralt.dtsi      |  1 -
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 33 -------------------
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  8 -----
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 24 --------------
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 13 --------
>   .../dts/mediatek/mt8390-genio-common.dtsi     |  1 -
>   .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  1 -
>   11 files changed, 126 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 6dd706b27830..971fb19e95df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -21,23 +21,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		ovl0 = &ovl0;
> -		ovl1 = &ovl1;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -		rdma2 = &rdma2;
> -		wdma0 = &wdma0;
> -		wdma1 = &wdma1;
> -		color0 = &color0;
> -		color1 = &color1;
> -		split0 = &split0;
> -		split1 = &split1;
> -		dpi0 = &dpi0;
> -		dsi0 = &dsi0;
> -		dsi1 = &dsi1;
> -	};
> -
>   	psci {
>   		compatible = "arm,psci-0.2";
>   		method = "smc";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 6ec50125cea0..868b0fb84449 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -22,22 +22,6 @@ / {
>   	#size-cells = <2>;
>   
>   	aliases {
> -		ovl0 = &ovl0;
> -		ovl1 = &ovl1;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -		rdma2 = &rdma2;
> -		wdma0 = &wdma0;
> -		wdma1 = &wdma1;
> -		color0 = &color0;
> -		color1 = &color1;
> -		split0 = &split0;
> -		split1 = &split1;
> -		dpi0 = &dpi0;
> -		dsi0 = &dsi0;
> -		dsi1 = &dsi1;
> -		mdp-rdma0 = &mdp_rdma0;
> -		mdp-rdma1 = &mdp_rdma1;
>   		mdp-rsz0 = &mdp_rsz0;
>   		mdp-rsz1 = &mdp_rsz1;
>   		mdp-rsz2 = &mdp_rsz2;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 7414c10ee664..2c3836555e55 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -35,11 +35,6 @@ aliases {
>   		i2c9 = &i2c9;
>   		i2c10 = &i2c10;
>   		i2c11 = &i2c11;
> -		ovl0 = &ovl0;
> -		ovl-2l0 = &ovl_2l0;
> -		ovl-2l1 = &ovl_2l1;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
>   	};
>   
>   	cluster0_opp: opp-table-cluster0 {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 621408439ffa..2f82eb532f30 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -22,13 +22,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		ovl0 = &ovl0;
> -		ovl-2l0 = &ovl_2l0;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -	};
> -
>   	fhctl: fhctl@1000ce00 {
>   		compatible = "mediatek,mt8186-fhctl";
>   		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> index 801eee735afe..883141d8a6d5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -9,7 +9,6 @@
>   
>   / {
>   	aliases {
> -		dsi0 = &disp_dsi0;
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;
>   		i2c2 = &i2c2;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 14a320f0c70c..f14b23dd57aa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -23,39 +23,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		dp-intf0 = &dp_intf0;
> -		dp-intf1 = &dp_intf1;
> -		dpi1 = &dpi1;
> -		dsc0 = &dsc0;
> -		ethdr0 = &ethdr0;
> -		gce0 = &gce0;
> -		gce1 = &gce1;
> -		merge0 = &merge0;
> -		merge1 = &merge1;
> -		merge2 = &merge2;
> -		merge3 = &merge3;
> -		merge4 = &merge4;
> -		merge5 = &merge5;
> -		mutex0 = &mutex0;
> -		mutex1 = &mutex1;
> -		padding0 = &padding0;
> -		padding1 = &padding1;
> -		padding2 = &padding2;
> -		padding3 = &padding3;
> -		padding4 = &padding4;
> -		padding5 = &padding5;
> -		padding6 = &padding6;
> -		padding7 = &padding7;
> -		vdo1-rdma0 = &vdo1_rdma0;
> -		vdo1-rdma1 = &vdo1_rdma1;
> -		vdo1-rdma2 = &vdo1_rdma2;
> -		vdo1-rdma3 = &vdo1_rdma3;
> -		vdo1-rdma4 = &vdo1_rdma4;
> -		vdo1-rdma5 = &vdo1_rdma5;
> -		vdo1-rdma6 = &vdo1_rdma6;
> -		vdo1-rdma7 = &vdo1_rdma7;
> -	};
>   
>   	cpus {
>   		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 898953acdb61..bf5893e3002b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -23,14 +23,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		ovl0 = &ovl0;
> -		ovl-2l0 = &ovl_2l0;
> -		ovl-2l2 = &ovl_2l2;
> -		rdma0 = &rdma0;
> -		rdma4 = &rdma4;
> -	};
> -
>   	clk13m: fixed-factor-clock-13m {
>   		compatible = "fixed-factor-clock";
>   		#clock-cells = <0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 9aaf8b6edcb5..389fb9d7ea89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -23,30 +23,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		dp-intf0 = &dp_intf0;
> -		dp-intf1 = &dp_intf1;
> -		dpi1 = &dpi1;
> -		gce0 = &gce0;
> -		gce1 = &gce1;
> -		hdmi0 = &hdmi;
> -		ethdr0 = &ethdr0;
> -		mutex0 = &mutex;
> -		mutex1 = &mutex1;
> -		merge1 = &merge1;
> -		merge2 = &merge2;
> -		merge3 = &merge3;
> -		merge4 = &merge4;
> -		merge5 = &merge5;
> -		vdo1-rdma0 = &vdo1_rdma0;
> -		vdo1-rdma1 = &vdo1_rdma1;
> -		vdo1-rdma2 = &vdo1_rdma2;
> -		vdo1-rdma3 = &vdo1_rdma3;
> -		vdo1-rdma4 = &vdo1_rdma4;
> -		vdo1-rdma5 = &vdo1_rdma5;
> -		vdo1-rdma6 = &vdo1_rdma6;
> -		vdo1-rdma7 = &vdo1_rdma7;
> -	};
>   
>   	cpus {
>   		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 2e782558fb77..4b05f6a864d4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -20,19 +20,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		aal0 = &aal0;
> -		ccorr0 = &ccorr0;
> -		color0 = &color0;
> -		dither0 = &dither0;
> -		dpi0 = &dpi0;
> -		dsi0 = &dsi0;
> -		gamma0 = &gamma0;
> -		ovl0 = &ovl0;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -	};
> -
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f3..a938539c92b8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -21,7 +21,6 @@
>   
>   / {
>   	aliases {
> -		dsi0 = &disp_dsi0;
>   		ethernet0 = &eth;
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> index f2ad9265be31..d70bed80274b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> @@ -16,7 +16,6 @@
>   
>   / {
>   	aliases {
> -		dsi0 = &disp_dsi0;
>   		ethernet0 = &eth;
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;


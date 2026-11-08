Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161750;
	b=JizUtIcR2m1o7Yd3soNLH3y+5HLXDT+Gjra5Qdq53ALt7nuKCbaroCDj4YnwJP23Ftea
	 DQmBwamgCbS/ymeD1QB3Dj7NPPgQwm3V5t1kSZjBHHP0Xq7GF/2+tay9qLupG8+CpogaB
	 Q759BWxaDVVqlC7Qo0hxW9rcb/UeKU+MrlGNSOw2RE7nvd8ln6jSARQouQGh1h5XvvTAB
	 CS9VU/D70p+qlF3GPZ1WZeELrzcq5fH/PSW43hbqTR1GJN5BmFc9XSc1hBAY3wS8FYLIF
	 D/e09Rxrz4Af+x4lO2div//OWhyYkGjvb8PcHdcXIfvCP0/fTbc+3YizpR/tdSehU+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161750;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9XXKh7vT6Q9jU2uqPmQkXruUZ4A17pBIXI6HbC2dxI8=;
	b=lbgdy9u3RMpl8x0321XYjD+3zmm3inyO98QqI8nRUX6l0jBH1g1rtzy/d5QzoTZhLcJU
	 K461VJFR76o1Et/mLAtXhtGE3u3ltHuoUyLLbmNkvzhbYpEnJVCl7d/XackDlXUwB28Gy
	 EHm2Kp3MDCmewr4/mmmJ3oPXNqhXEMI1p7EpnOoTMtLtmoOqIWYQOoPn9yZnBJsXRgfOr
	 tuHNx2tTZd19TKDgFdj831lc20iI+uDyXJdPkv9yncjePuxreDOQNDIg/wi1hkFhrGeeH
	 62S5523GiraJ7IGu+po96DO6TUlgZlpOroJ2bDavog8Jrn2Rp2rLVEW/v9JQhpNjHHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpOJe8fu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27003606A31C;
	Sun,  8 Nov 2026 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpOJe8fu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A13D1F0089F;
	Sun,  8 Nov 2026 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161750;
	bh=9XXKh7vT6Q9jU2uqPmQkXruUZ4A17pBIXI6HbC2dxI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EpOJe8fuD462bWokak//lTzCAvxRzr/1+rYPgEcxh6qM0WkQFziwQfD7EZRrWOK0B
	 KQusSYWyp/GOrFqo8nIalkTpyDoj4vbHw/t+dpp90XILSplXDo8kHwU0671KBULaAr
	 RQAXYwtaqkspNvWVcNsFoSWiTDQfzCVwnQfnHb+Tpu5hcxwiVuRo+g5nAD43diZrVT
	 zUMCtRghKc+aqiSWk/UctFlsGMsyj76lXzCEksXdekiLvuMEh60+7ign+ztb4ct3ec
	 bX1XgDkmlpXC4YFTaoR7x8oHAu7000cSocwSegkNVGzEJBs646yD1p7RdTTIZhWZ5s
	 gHKAWwG9+egig==
Message-ID: <2ec53558-07d8-4824-821b-03e39da672aa@kernel.org>
Date: Sun, 8 Nov 2026 19:15:43 +0100
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
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


On 11/8/26 16:43, Sasha Finkelstein wrote:
> Adds initial support for the new t8122 phy. USB/TB only for now, DP
> will fail to negotiate
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

So I wonder if it's time to split this into multiple files now.
Maybe something like atc.c that does the core stuff (probing, 
phy/reset/etc. interfacing, mode transitions, tunables, etc.) and then 
atc-t8103.c and atc-t8112.c for the hardware specific parts since 
especially DP seems to be quite different between the two generations now.


>   drivers/phy/apple/atc.c | 382 +++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 297 insertions(+), 85 deletions(-)

[...]

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 45f1280a6faa..256a08499646 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -100,9 +100,15 @@
>   #define AUSPLL_FREQ_CFG 0x2224
>   #define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
>   
> +#define AUS_COMMON_SHIM_BLK_BIAS_REG 0x0a00
> +#define AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV BIT(1)
> +
>   #define AUS_COMMON_SHIM_BLK_VREG 0x0a04
>   #define AUS_VREG_TRIM GENMASK(6, 2)
>   
[...]
>   	atcphy->mode = mode;
>   
> @@ -2201,6 +2387,7 @@ static int atcphy_probe_mux(struct apple_atcphy *atcphy)
>   
>   static int atcphy_load_tunables(struct apple_atcphy *atcphy)
>   {
> +	size_t tunable_count;
>   	struct {
>   		const char *dt_name;
>   		struct apple_tunable **tunable;
> @@ -2216,8 +2403,14 @@ static int atcphy_load_tunables(struct apple_atcphy *atcphy)
>   		{ "apple,tunable-lane0-dp", &atcphy->tunables.lane_dp[0], atcphy->res.core },
>   		{ "apple,tunable-lane1-dp", &atcphy->tunables.lane_dp[1], atcphy->res.core },
>   	};
> -
> -	for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
> +	if (atcphy->hw->gen == ATCPHY_GENERATION_T8122) {
> +		tunable_count = ARRAY_SIZE(tunables) - 2;
> +		atcphy->tunables.lane_dp[0] = NULL;
> +		atcphy->tunables.lane_dp[1] = NULL;
> +	} else
> +		tunable_count = ARRAY_SIZE(tunables);

nit: I think else { .. } looks nicer when the if already has braces even 
though it's just a single line.



Sven


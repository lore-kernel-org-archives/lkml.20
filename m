Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374660;
	b=MAb1mI0aq4DJXnO23zVkqSMLo1M+Fy/+j2S+fst6DP4zR2bR1v7xOomc3dXJzPTT/IZD
	 hsV4MT5aPD9nuTC1mEqfVd0KVXFcAij41wDfUhg3bKAEIlhPambrFUtvBB+yaLZgzqJ/3
	 dgzDNu4XEPa6Iaa1AtQ6SyB9WeosmDoU13vLZeQb4Gmm6Ml1y6fJPGI1RtOxsR4nidesZ
	 6VB0M/3vT1oibfle4WnT5EtQC0AKRfOlJSGTyOwMTFsxvul5Z3m5ekfHa2qIXe5zkiIBM
	 ifhlHKi1QXrWmMJVwV8vmlzHbcvITCj/3Q0b2/Y/g+qGbDitk3te5f3HK68QKDjQN0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374660;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XCiNX/JVOGez8Xk/1UsypK/8unagw3ySEZpGAE4b/PU=;
	b=mYAZMhlZCJhs52arXBrAaYF4zwfIs0mW2n5kYGe96GFgEE1A3ULD9Ueahs1PGY8f5Rbv
	 9MsHYUj7SwpV8naSDWyxEo8EOgFimd0+D3SLVvPf7207vjNF9E9QxrRBU0ZtPnUoWJKTH
	 0vHMJxsCG0rcmByBf4g4/R4B6BgQaXVPTMeU0ySS9JIg6qu1hsQDN8OBTZfRa5PxfRmRi
	 Sv2U3EQ2x+g+VqUqeQJ/efKuAG+PRNHBRXRKjwZdgTEf5KcaSQ4Htqper7ZniZUGo5qVc
	 xE7pJzewBe2jd0By3q/S1skmELQ+uBTuunR2eErztCWO3T/EuaJ5gMZthc0838ThnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYPcu94u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB72606A31F;
	Fri, 30 Oct 2026 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYPcu94u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F343C1F000C1;
	Fri, 30 Oct 2026 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374659;
	bh=XCiNX/JVOGez8Xk/1UsypK/8unagw3ySEZpGAE4b/PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eYPcu94uQR0iroKxabErt/vMeQpkS6GHmYqkY6K/hsBKExvogGDA5qavalpX7diso
	 sEnExCJ6pL+aMhcXQa9nOCRjMYYsmKIewRxzvQ/IFjkL95xYA5b3zwoQbzVWaKOOwI
	 o6B6V434EhSr6JrU93kVp62Ys3bkTc0bZyOICc97qraH8Yr4EDwiiiQ47Nbzu/GcKS
	 tQaNC5Oj8/Hl+RLjGwomsKH0cx8OXnUO7d3HGHazFoYCgzDMengZVnDPHYj5uhY4up
	 L9HAZAdpfbdd0huC7ZIv/ptlAi//Cx8KKSZPij6Xy9JqY3f/pSEXT6lNiHBz8ozRSr
	 ePvc9SbJzrMHg==
Date: Fri, 30 Oct 2026 10:37:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-msm@vger.kernel.org, kernel@collabora.com,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Message-ID: <179337465400.84888.3742821306180062985.robh@kernel.org>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>


On Sat, 17 Oct 2026 21:59:30 +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <0xff01>;
> 		vdo = <0x00001c46>;
> 	};
> };
> 
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
> 
> The generated DT binary will stay unchanged.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


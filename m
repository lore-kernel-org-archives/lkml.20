Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216667;
	b=t3jj/fPSl6Ba6J0laPVtiEAwHNCynyYw3tDkexR79wKCw9QyW6DI4IrVfWlRLU0WYLAf
	 LhNwI4jbaeqFmEA9nVtzUObin2ocooSPqbPgxryyBM4U9ow9GLtHd3wfQxdtFW8IBbb6j
	 y6EVEOdlwKhtrTpPvMSdgOxj49nxHIMa3o7XWYHEuVfkYZXPl82zjpn13BeJWZypcBT/8
	 SQ3aEcKedb55JYd41RFwYeV9l4Cbhyy3/8rZhB/bxUMT+RJ8kl1tqPohT9injW6JdHLjO
	 xkQUa3S7588ite91UQzmmwBtYs5ivFYOugnlEUSxFGE444fvCzoknSqi0PgHjhcwvEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
	b=J4jHeyrbLSYiF2sSCP+L8VMHYdiRSjCxX1cbNnvQacApmpZOCFZW8K4gpEvRBGKLOb5a
	 B4ByrDaK/Pc/24Q3HEOw3ORv3b0dIVlS4ehRE193Botl/OyzVwMtn3IE7mzxlM6MRQZxu
	 40ZEonfRg++6/tfUywqbOueDD8IA4W3kOS7/PtzzoqwqNtbsiKU+Lb1bpy2TDmWEjztJ6
	 LjeWiWZWj+VCqvET05T31wEFciq4oe+F03o1a/w7BhDSyHLk9EeMK5U7ZzBthXpkCmBXy
	 B8mITqfuDK3wk73XnU3dyGyxWAhFKRazADCo934dUIY71lCyY944QOKpRQPSpN4453w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btdyUVxq;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btdyUVxq
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so918950f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216665; x=1793821465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=btdyUVxqGllsmx7PdfZtXJxg5O3lMYfsJNs0FsMva9iyMIKwhWLF/mve8ROoc9aubS
         HPSX7T8xYnXaoPofPwwNAW44/cunAet2aDwX7SM0VEGxXtrJN1x2+EgduSKtRnZwiTvm
         GbenWrTTk0hgZdetO8jMVCMjWQ3rmiIimiwl0DKuK1Nse7zgT/y+7K7trKPAUTvy5jzq
         EnnMmalaJ4vmJgLQipA+aPnCDaMDtVB8DtzZzzzdolDCnhebzhqgAxyfZqGs4PqMRhRj
         uYVZLCCVLDzK+Rt0U66Dfl55jjKJA3SVgR78XjFAxodwIn8eFeMUpjJNA+teyBJ450R7
         W6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216665; x=1793821465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=ZqfLJ0wkkLcAJFiYAZ1T+qhRAe1Dd7gBInCuGZMJMi4u19LdHmfDWXzLYr+iTQFCb9
         5nrFglW55T/PJjNaNQjBdir0yi8bpRCTjS9YUtc1PIx1eyOQK8f5nyreRnlsLzedjyOu
         tU1yuopFKyghP2rYKDcGq/VVyXVtBesV98Gm7SKoWz0v0I0WMnzmJG3MplzovUIBdEeF
         gCKBrTB0TOphueNIi793BLD9mywdIo7OGF5bDWBpvOMTx/z038S3cZpy1W43qMvtGIKM
         ixcorQAh1mdGxpO9Vn3/M7qoC25K6r6tMoXNQ0RI/Rmmpx5g/c0VHqoui88TJynRL1Zs
         B4kw==
X-Forwarded-Encrypted: i=1; AKwUvBxlXhohAERrO5a4O14Cz37kO+oXcv+er42cVjjh1iBNW67WxhDNzQ7GYXVj5FxruB1xWx8/FdZDn2M8YCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+9wEK0ryZDm5rhVgwcyselX+XB5889Xveb3so9a34bfl3D5pY
	tjlJg7xH37n2YJ0U2eaXduWvPJcPdgL2tvYf6siRyQZJF5WuMkuBy7/4
X-Gm-Gg: AYBFou27vaYH4kaOKHViBLLV/S351p7IYNRTzHsG+dg+zB/KSZCzN6xOfNLa3RSsSx4
	fJqB7csmcNb0oiZV0/nrmBkZY6rxYR7CVNObAP5HyjGCgpnhomYBZ7kTHvHJmTY1kvTw47my/sG
	MbmQGFdU9M4Z/3FIQ11wSA0VQiCxefoqBTrg4eIlY9N6MiEurFj1/Nt25agEMmoBGmeoB13SP03
	1GgsDAS5jW1k1Ad9gMA/IN9YQvOjstTO6/vLZpgho40FqLhy75eQedec/tiRvGNNgKkreCa6XTo
	VNgehXVxGDeudfeyb/KdK7OCG9SJ/9AcRIEB0OmBhnJhJO6KLirIjbKPRY5RHvn23Y/4AChAMYO
	D94ZUj0OrQdRhVARs3W0i8W+SNvl1XYjX7TCTe6hwWE++sbS5IztBs+XIm8aCgWd2sD6qufQjqf
	0os0euAM9EVmvK2iGmhKvWKTM4qzIYMMhPGWC0tfHIX9k3j7HXqj/sjs49TMnQ7OINABLI6sxkW
	lDlnuqhPQuQ8UCgAZOEGf2DqQBe9v+/q5Nsu3R4oQrIcsBmUofdNUxuzsWACtzsyssXq/ojckOJ
	m4Aj7/0dHoBYnEHPKFe7fitee/1oyLrZQa8h3af/EWJWgDlt93p7N03roQT3P89qhsromOq6u7U
	e+hFWXWQ/C91jX8D6n4VRdohlCu6YT8s=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr6431684f8f.55.1793216665283;
        Wed, 28 Oct 2026 12:44:25 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm27766389f8f.3.2026.10.28.12.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:44:24 -0700 (PDT)
Message-ID: <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
Date: Wed, 28 Oct 2026 20:44:21 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add usbotg3 iommu information.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..1370a571153a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -32,3 +32,7 @@ &usdhc3 {
>  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
>  	iommus = <&smmu 0x11 0x7f80>;
>  };
> +
> +&usbotg3_cdns3 {
> +	iommus = <&smmu 0x4 0x7f80>;
> +};
> 

Hello Frank,

this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
(both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:

  xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
  xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
  ...
  xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
Reverting only this commit on top of current master fixes it. The other commit
seems fine.

Adding the same property to the parent as well, like the NXP downstream tree
does, also fixes it:

&usbotg3 {
	iommus = <&smmu 0x4 0x7f80>;
};

With that, SuperSpeed devices enumerate again.

Could you please take care of a fix? Otherwise I think we should revert this
patch.

#regzbot introduced: 73c3b40e536d

Thanks,
Emanuele

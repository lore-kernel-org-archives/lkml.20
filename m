Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798006;
	b=Jd5o1g+Hui+DHG6O1jQqTU6l3UM5kn+NwvHwJyK2ye8NX5rEMsJx7+wORzhXoKfLKWjP
	 VicbgwU2kgLgDYWpWXT935saK3zl74QWROCdxD/E19zPt+CovUNaRSlzilHD8IRg3QmTe
	 8JQY7YEtKOsVfwR+SHBmdRk4b6PQLdvCOGr4rzkoujDlYd7Q71pFj85uXDGySMQZ2Soie
	 Yggh6sFlPJTYmyNjO6Z5cN+Hjkf0bOQBlSNBJLWNIZlOpKG+8/zXYGVwEbUdwhrtkErM9
	 snrz29ciWx4HE7D+EppGUPmjCAMw/+ON/V60heSl3yFI0fDH8v6Ystd8iZ96v24+vrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=c/miz+XIkrZ9ityptWGlcqGz3sPpyzhAPiLeG3wobco=;
	b=5LhCH2PAqaaI973UQgHbp5nv1VNTnINkrIJxLXJZ8ayLiAZeMMQw3SlWppQEPPkkQ41i
	 WZvU0LjjdbCEVwO8WBs7ZbMus1HjWMWy7/cr8tDm9Ac8DuWv/f85pUHVGPKTCmHak4P+E
	 haDgTyxIpwgDyqgFSNp4kxBhMzH8Lsbg0wPy2A4LtFGatwr4IY1tfzol1lmXVxnWoQKrx
	 5E70nREfCF58yBaMxBsU1r3TA7np83EFKgjAz3o6RIxPmBARZx6BVUHrm8Z6qwuN8kLD3
	 qo6wLqgfJlEJSweHC/G/WkSgxV9K8Y9tQoKtWelGi4QxAr4TzoyNGShpzSGiim7t61Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCnLY5Yb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19B3606A326;
	Wed,  4 Nov 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCnLY5Yb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26701F00919;
	Wed,  4 Nov 2026 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798005;
	bh=c/miz+XIkrZ9ityptWGlcqGz3sPpyzhAPiLeG3wobco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VCnLY5YbXcyqv/hbXP9RVMCg4F8hC2yQH8d/eX7LGbTBLaC5Irhyrd6pCWT2q8Lsa
	 di3T0VEjrIF7CEBSrBJiXUfEiqQlIiy+5Ys4ps76tRBThWbs9CYvp77P65eJPQWM1f
	 cRjS5/QJJseF5PN9D+nKS5EwJp7hPFJTKNOvhex3w1p0EXH4Aezf9d5+gaK23gzaki
	 Ccg/F2DUK1SoaO4TUX3wTfGlOBAj6eXmf1KPquc9AlvWpnyKxM1EbA5H8YkPYhYF+x
	 yY1ExZ2AmKhlb+JuIpN2AueqxXwuguKZEYYhmU+zxVZF7GzHoo1iUscmtemeNYIxJO
	 C7IUDMVkc8EWA==
Date: Wed, 4 Nov 2026 14:13:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com, 
	krishna.kurapati@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org, val@packett.cool, 
	balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Message-ID: <20261104-bipedal-supportive-earwig-2aae26@quoll>
References: <20261103135057.1682-1-26rote@gmail.com>
 <20261103135057.1682-2-26rote@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103135057.1682-2-26rote@gmail.com>

On Tue, Nov 03, 2026 at 10:50:55PM +0900, Joonhoe Kim wrote:
> The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> DisplayPort pin assignment gives it all four lanes for DisplayPort,
> while the controller can keep running its USB 2.0 port. The controller
> has to move to the UTMI clock before that happens, so it needs the
> Type-C mux state as well. fwnode_typec_mux_get() only matches graph

Controller does not perform the switch, does it?

> nodes that have the "mode-switch" property, so allow it on the
> controller node.

So judging by this, you would need to fix fwnode_typec_mux_get() or
opther driver code, not the binding?

> 
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> v2:
> - Use the common usb-switch schema instead of a local definition
> 
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index b77c02c64d45..14fc7e4ebc80 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -158,6 +158,8 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
>  
> +  mode-switch: true

Drop, but you might explicitly disallow orientation and retimer, if
entire solution stays after review.

Best regards,
Krzysztof


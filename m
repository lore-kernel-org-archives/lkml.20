Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236048;
	b=ySqieZoyFviPC90Ppz1d9kirTRdbNIfsd/LogUBx7tHu9ofj6zs5zl1OVQEO5rdHL8dt
	 oD0pBAxkVZwDCI1IW2dgN5Q1jomMgNyoHiZnSU1JCoJ/4g4Eud4b0WtI6Z2SEKXSvJnjj
	 UKkP9y4viOHw1HU7uwazF50KCYGb9rf/Z4KkzWBvZyytabvdHJXvdtmWWWl3yZcCZyIy6
	 Y1lnC0T5+fJwcr4vDOV2Xz1tmIyywnzxgVMa12JdxKPJpUP4gWNXRZHWOwL9/3++1N/v7
	 SKVbNq+nal8JSZAbZHfw3MnGNaXrtRPo5aRA/G07N7RD/ICGpwHooKp1q5cQs3zhJUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236048;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/bCRk+9p2SqQHWZIi/vImrfsbF6tYr2mqV5/Ba7QIW4=;
	b=qBcOiB2nnfLP/2xGivsCl9dvoHivCNiVxU1ZWZi7jo//arRaoZ4lKh59gUElNNK1yB/Y
	 5sdtGuY/48AaY0obmrl/vFIK025lWzAJhPpJqDu57er3pIc7nOAkgk1ivnwdayAtKTm52
	 JdLfeyMl5NI/2kYdGiIW5z7TXx7nkjlwwCtGmFqJJAhxrFyy2qKjih0h6uQUNbOM1qOcq
	 iIhT92QXMV/zmelWbXBp2MVRYne7VONglDpDlclSudQ4I414H3XkguzyhWzPRaO9jF+U6
	 a2lpUZ76Cq3ROoD94FfwSJvV2UMWgWHP7tN+T959uC8vMGkcNs/cLGAZg+8BVvOEAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvNbxkIE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF62606A322;
	Mon,  9 Nov 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvNbxkIE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F9C1F0089F;
	Mon,  9 Nov 2026 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236047;
	bh=/bCRk+9p2SqQHWZIi/vImrfsbF6tYr2mqV5/Ba7QIW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lvNbxkIE2ZicME6IfBhSqN0ZJJONXcwid2eF3NVLcaJb0OPAJMsbORI3KpK3qsmrg
	 Vzdie7/SMOKFUNDqJkugPHfcmHxzY+RcvzVLR7Trmod0vRFkg2KAuiUYaII1EiELTH
	 DEjyx6Gwi52jro+pGLsGo3pXjFNPJb9Lqzy+w6zEnhHyOeXxWx53dKu6Q4+VlvLaBL
	 Jkcg2PtMy8hHTimYWPAD7/wLEguOlAqJt33e8Mdi04m8vzvIn3s9yft60LyZnm5y1F
	 RewkDCf+wFH1hHu21cu1pi8T0Lbdx6zvR94UsIjKnVYl0E5AAs2XWrJ6O57SyFJ2Hv
	 oBd+erBTWQHAQ==
Date: Mon, 9 Nov 2026 08:54:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: lgirdwood@gmail.com, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 1/2] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Message-ID: <179423604384.3146607.887205491604475162.robh@kernel.org>
References: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261107015014.22374-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261107015014.22374-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261107015014.22374-2-xiaqinghuan@mail.ustc.edu.cn>


On Sat, 07 Nov 2026 09:50:13 +0800, Qianhui Xu wrote:
> The WL2868C is an I2C-controlled camera power management IC from Will
> Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are fed
> from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and LDO4 share
> VIN34, and LDO5 to LDO7 each have their own input, covering 1.504 V to
> 3.544 V. All outputs are programmable in 8 mV steps and are gated by
> per-output enable bits with a chip-wide SYS_EN master. The chip also
> exposes an optional active-low RST_N input.
> 
> VIN7 and VSYS are both inputs of the internal control logic, which is
> powered from the higher of the two voltages, so a device tree has to
> describe at least one of them. The remaining inputs only feed LDOs, so
> they stay optional: an input can be left unconnected when the outputs it
> feeds are unused on a given board.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../bindings/regulator/willsemi,wl2868c.yaml  | 98 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


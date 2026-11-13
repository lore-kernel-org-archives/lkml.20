Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568270;
	b=FryZURbdbbR/l+MwfiaeswHZVgAdfu9XQ/w6y7MjD/7Aft2fet2gxoiWC7JN8cXdpHHX
	 vDjRresbT8uRD1GAKc1BARqCrhuRP15tdvGGTft3mkOeJwB8oRk2lCtRzrUDAC6dpjZn4
	 YUvYCOSp4n8oAcDxGyjU23O6cB84BmrrgtM1tlP3bYNVMFfK0vzfFNG3QE+osLv7qJYLC
	 EHQVA3nnSoOPhBO/utKn/GqyMKVOxLBYt2zLR0wMOi1uvFm9bXmBJZSyM/r1NKtn7u3zA
	 wArMwabuFZ23E6xSyYagh9F+ITEbTcOU0GFGE87utmVYXkJy1rpqGpZng2UtGVAXtuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568270;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lqEcBCi6g9fwnAM6iqQzvlpzjATPEsFT3r1zqIUQ8Tk=;
	b=kZo3yNUY5cJo8dUzlsriPC6XOpCTYmKjFyN0FPzOSyM8U05GW5sbMrEqMcMDmYTbxujY
	 Ht71fotwiArbavkcXZyKFBpfzTYj+S1HMnNRRRSI7nBrNtdEUng91rAaO6CTrqITEK29P
	 L74cR9wk0OxkHkYa9nomJnclrCFwoxWsJqDbTSgIC5RHXldPpZCXmlSL2JGcWys6tkHRc
	 XfsXVfT+NU12BeQqr6HOg4uLMmhnLmgSqaB9Wk6Jxr1VCmrB7Pn5sAwyX3alT6b7hhgWt
	 ulI96HnWDt2ZIEWTXr1Dhdp2Hpiwxmvmcs8nKGXKUlovkYJP0Tp/PwQahl5O3kDbwcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuBxSiLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE7606A321;
	Fri, 13 Nov 2026 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuBxSiLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D331F000C4;
	Fri, 13 Nov 2026 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568270;
	bh=lqEcBCi6g9fwnAM6iqQzvlpzjATPEsFT3r1zqIUQ8Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KuBxSiLLpDXcodcqd/6Z1c5kLetQkS21b/GRYYJhWBGZBOz7OeVUR/z+2H/rDdYV9
	 rHE3EhahueCaeq1/98yHeaG7wAXO6t+DistGcU8iW2+Faj1aulq50h2/RWxYVMZJKl
	 uL+t+8u5bnJcPaKWzrU1HSJfykstuvBNTtugh8VabewzK7Uld/Z+ln8W8J2q4Cc0b+
	 fskahHqy7glQ21N1loK2kYZa+jZCADBNT7wDmVYQjod+cVvZydRfJL92LI0JAOthXD
	 tEihX/WzVrTmxvFULYnI4xgGDN7RSGddW7TN9jjaY4qauVrK3nPGugVMqX3ddTBgIb
	 rsFddpAq392NA==
Date: Fri, 13 Nov 2026 12:11:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
Message-ID: <20261113-gabby-vigorous-dragon-6a2fed@quoll>
References: <20261111034418.194610-1-rosenp@gmail.com>
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
In-Reply-To: <20261111034418.194610-1-rosenp@gmail.com>

On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
> ath10k PCI devices can be described as children of their PCI host
> bridge, for example to supply the MAC address and calibration data
> through nvmem cells. The only compatible for that was "qcom,ath10k",
> but the generic PCI device schema requires a node under a PCI bus to
> carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
> validation.
> 
> Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
> ath9k and ath11k PCI bindings already do.

We do not need to least all PCI devices here. Were is any actual DTS
user of these?

Best regards,
Krzysztof


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553466;
	b=pp+Ysv/nJyYOj4sEGMP25/oQMMC+rzNB8GVZt3ZVXay5hV1o4WmOYi94px0mSzvkkEKW
	 P6S94UgWHnVQ5/FmVZX90okKYbHe15VpgTx7Zth2DqDbd+tWQ0HtAGw9qK126zu+iffaW
	 P+VC0ddVg4ynnH7rJPxZla6hJJ30zOX4YcpO0FFRI3l7MPAXOg6vmCrQ5ehl0jdp4+PQ/
	 9Wr14RmuxK1XFwzFtGOTR+DOXAd7745EpD741bOTXzNjiyZcFEc/WcoLQWScWm+oSwrIf
	 zUzx83LPj3ePDSkb4rTcNrlp1zhtYf2fcluxCWcjGoMrjl9swBd9pibkjeTqBu9G64Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553466;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dJvOaBqu5Qcpy3J+7X/UPbWtXYUBWXhpnp+20Y4WL2U=;
	b=ZzI1OAbbNA68U3+osj7iwQHE2sab4fDb7dP+FeYOpcDpqtPOWKtQiSi/c0ba7AKhI2iZ
	 OQMg++UqE9cC6jVm7+b0vD5fdYEiZADs9futZKfo2kSXEzL3lcBGnj6uLQVpBratWAvgL
	 61r3VbGH3pMQmiocsXYKcut0UYbxiyoNirIC2oKWTj7AbVrxzVpD7HfAsPlCzHKztUfjK
	 69LkNIH44nur7u0WGUQOvgoP6DstITreKnr3gCtXMuT74R963X3qvYkfJqrxGsFPG9o6F
	 ZrwDzVT0pXecUKvZpkCcUcF6FzbTpEoP/O/AfzfTn8VBEq+RixGQMePGcDEVwV+u8Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtxjfneK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F6606A31A;
	Wed, 21 Oct 2026 03:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtxjfneK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819B61F000C9;
	Wed, 21 Oct 2026 03:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553466;
	bh=dJvOaBqu5Qcpy3J+7X/UPbWtXYUBWXhpnp+20Y4WL2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QtxjfneKnjZhTmSYwDDo/F2fD54d5IDRDKWfAyKPHoPwuEEz0Vy0jPy+ooC98fOBP
	 5jcv37W86+ekKaF1MaLJMPVuxu9+X3gqso0JKEifRvu184RvXU7uS5ZpLKNm4Cyi7w
	 NlZOqp82wwC+z3cvF+otPXFaHc2jhnFW/LQFYQ8dX2Ci/PSKoBzzNN0jvCFkg/KU/H
	 ymKxNIJHpT0pcmDG1BTNjH4L6a125QCUPaRxlax11XdwaBM753Nauaob/yukmk+yj3
	 Dgwl6dtPdxRf8u2WbT4QeiWGEaAjIWLbDoOVzc2NoLDMYqcmTe7KOMpWju5EqS5a2l
	 Xkllp083tULVQ==
Date: Tue, 20 Oct 2026 22:31:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com, Liu Ying <victor.liu@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: firmware: fsl,scu: Add
 imx8qxp-pixel-link nodes
Message-ID: <179255346358.4052644.461378605676348742.robh@kernel.org>
References: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
 <20261019080621.194103-2-alexander.stein@ew.tq-group.com>
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
In-Reply-To: <20261019080621.194103-2-alexander.stein@ew.tq-group.com>


On Mon, 19 Oct 2026 10:06:16 +0200, Alexander Stein wrote:
> System Controller Firmware(SCU) provides access to Display Pixel Link, so
> add the display controller links.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Use patternProperties instead of 4 discrete child nodes
> 
>  Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


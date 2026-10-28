Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194289;
	b=tu0E7Z+K/rAPjrmVcZWjSMuDJjSTTRY+yci6qEgtHM2MkEap2jqikEqT7X9/FjXJ0JUC
	 etWnvcbt54Wg8OKWH8iPfErPK2nBShHfrzuVTpFq5v/zf7ULD9BvYjelD8/0mUVzhBaOa
	 Ai/7WnFn8Xe16CgCfSNXkT7qcB30Tkaq5xeRh8Viplk1CwzEkJ9kN+Wg17FKvP0/hqyBd
	 lHChwAtaAWljsKLoQyBFD2AzUNurEnDkuChRxLOEZODu/fNBHT30ahlEPAfWg/K9kKblg
	 6NYWjMqgqfY6gCbRwAurKrNA1YJx8FIbVV0DU1gdlmAvi2e02JobTo9bFdb/rDzR3hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194289;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zQ9MKvoWK3wOdLw0NA4y1sFk3KjDLfghj2utubrGxDA=;
	b=2m/f16Zmogt80Xm26ZTKkun8x5qGhRsVpTa5Eq6n3liD5N4qXO3yeGqaylCdCbELIsYT
	 BVRLNcRp/SLRArxSpJanJWd9y0YSeqVXiwDaEjbNT00Hse7MLesiW7xT69eUtP4scl6tN
	 6ftu1ZpIH609inTGZSyrZxobVD70SXGIuTrIlwb+aZdNYE0ot9qwo8MsSIRFU/rsnFQOi
	 xPHJd9yaSaVv0m0XrgwPMiqALavg+PJg2AYd85DCtm4e+z7BT8M8SCDKQQY1iChTKIzUn
	 X6yoBketP8lA3cuvE++s5en43pjyKadj/vL0f5UZI9tFoDglHyt4SJLy2oQzctpBo8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY68FYxx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC079606A31A;
	Wed, 28 Oct 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY68FYxx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3922A1F01825;
	Wed, 28 Oct 2026 13:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194288;
	bh=zQ9MKvoWK3wOdLw0NA4y1sFk3KjDLfghj2utubrGxDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aY68FYxx21w78kk13qDKjfaXibj7bF1xp9kij29+bLWFao1w87TP47ZK/QnKqduyT
	 ZvfCqY/Ckt+uY6dmYBll0/+GgEwAL0iz+7FVHsWB4IsLiGWWBzt7tMOQefRPRAhRH2
	 6YiY/8dFDFE1aAZrwtZdz2wo/AsQejewI86eFtavoSEIIbBfsGWjg4KF5n50TBWjVY
	 x7en1DB1F1UZm5k5bQs1Af4sU8qO3+Q+Dv01AqxKwnlaJDgUew8p8tDJ3aivjWeX0Z
	 I2/eWzMihiI77u29Scsb3HJUQE+Gq0LwwL3+ydxbWs+2DB3EV07dhaHoubPt2vT6Wa
	 UoLnxoDPHogTw==
Date: Wed, 28 Oct 2026 14:31:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: i2c: add Samsung S5KJNS image
 sensor
Message-ID: <20261028-truthful-chupacabra-of-bloom-2f8b65@quoll>
References: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261027051048.213177-3-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261027051048.213177-3-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Oct 27, 2026 at 01:10:48PM +0800, Qianhui Xu wrote:
> Add DT binding for the Samsung S5KJNS MIPI CSI-2 image sensor.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

You still send LLM-generated slop.

Please start using Git. If you cannot instruct your agent to use
standard tools like Git, then your work shall be deprioritized (see
maintainer's summit 2026 for some background).

Best regards,
Krzysztof


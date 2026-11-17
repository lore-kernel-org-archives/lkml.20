Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885578;
	b=IKuq+n40i14UmFi094pVUGPwNueGOAf650krWSXjR2K8ifoe5JJ2jT95qkBh2wQoMzQr
	 XrC8wZK/i/a+xMf0ze+eDaGbBcvDcQzqfqNl06AYTV4udtvJCBX3AZauJsXPv+tB8sFp2
	 RS0FFvhanTCQyzwAAaCicYEb2wMc54Kg0eDrrMX/0wpJdDzTITsfKPBKWoiCnzjCx1j/a
	 39EybWDB3SJ4G6Bgw24GZ+7QoSHAs5gAHBpyo6z0SPk0hTDLPg0naqOmm+tz4x65iKHW8
	 DveKZ3umPHbH4tLXigbBE/SByABtmpYGeXp+q3B5P5VzjwOH65Rx0RGTPVixvAMT9AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885578;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n9q/Xyom9BVqPn2fUKl3O4egzmNdG9QcgrHRJ6o+MRE=;
	b=BPEhLgfmaImYbVBuYCQ2meb425f9btfTtGuOVgVJHwpPNa1gEiz06eOBPtufMiLbS1zP
	 jC8YkT8H+MSSea3OVUllGyfwtFpNBmT4kmZkZiA0bv/gZfVh6/Bn/gp5HJPnabFShmbce
	 olX3b2W4Qm7nr5iB264xHnELDDajEz+ZUyvhLxdRohgv6REjA2bVG/T7BtYpJFwFfDlEj
	 A7UhqV/d4ODkmqcYPyIuQx55T2IaRsxWyHRQxUrOT9h/I/kWxdJVRstH8TIpghNcHEy5N
	 /kLNRVzpQYB00CzzLnkrCKM6l5BiVV5L5Vjy6Fx0HMxFb9FSYhkJreqiC5up4GB9Jzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGg+rlo5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C48606A31C;
	Tue, 17 Nov 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGg+rlo5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22DD1F000C4;
	Tue, 17 Nov 2026 03:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794885577;
	bh=n9q/Xyom9BVqPn2fUKl3O4egzmNdG9QcgrHRJ6o+MRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QGg+rlo56TGjYx6RSckBRaYUyjS1GiFfVfKZewta6IPh9Y2gPLoxqcLjATt2VZe42
	 6Yv+nYNBfJPqLZlllH14eiofpiaAGprt1qWQaGw1tjA6yJVF8CC19pmj1M3/XmEiKn
	 +SGY/t1Og0XWcebLzBVgDXEqXe70zoYKmu0aTgCE3rel+/DNzyqaLGHmXhbrHvCmVT
	 eJGupypBSGf5R5mXOlPHKNfVFb+MJhSh5QVpj6ybo2LW22pCKODBbsPo/BPAqKJizZ
	 PXSPKgn9bcQ+oTl/tFRvDVCBn8Lw6N7oTU55PEvKirvm5lGUh+Z5rE36V88rrdQMlR
	 WTW9nAB08+6HA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Mon, 16 Nov 2026 21:19:33 -0600
Message-ID: <179488556788.504986.13570274082381780818.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 15 Nov 2026 21:48:58 -0600, Bjorn Andersson wrote:
> Introduce the ASUS Ascent QN10 compact desktop computer.

Applied, thanks!

[3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
      commit: 5389b53f69b93a8c642c81ee08ad6654a6ed10a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794580233;
	b=sA2v9SQ3y6xiyt5PbRZ83xebpeLPl4J6DtHmOGTzVVf0MznMTZpPpTRncV6ycyNsXNGU
	 /0b2ZfCMcRPuvXPzvWZtpHUQ1br92KYvecbgcAzmsAUA4Os70uSrvKV10NxoCGwFRbFVv
	 Lthaig6/SDHlm5m1v5lTrJmYPnP+1if2NrQJDZUYW5no0NHRF4xuMvVThRoqMyoXJO7AU
	 3kM+994ayFK0hbdapPWVlSmsuAhTgggy4We8I81q2IUDKXHz62rejh94ljcKIaTpSsrZ8
	 PDGMc0WFnNg1QDCYFuUpUV53q1ge2g5XPHtpla7X1KKh5oIorFPr2ADMpMxxswOdLxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580233;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=7DTbJXNPRTHsl9EzpD6DaC77l/qNYG+bqbZDOTJxPx8=;
	b=BDplDb9zyN1EmV/nEsJPg8M/MR9GNnqTWJbCkx8wWsN1bKgmtjh/DKX4XdS3vzcxjCth
	 I0GS2o5fY7KMoSoJYGhLTLk4scjuatLdhBGr8/E5ITfanA4zznWjlPt5v1Ei4DGbQkMNz
	 uVSr4OPtoxi/OFVs0odKcyYnKAIn9sGaBqX4cSYcwL0uWfwYjNex20hMFFLCc0N+dpJ4/
	 5wzktTdG+KQAH/idr0h0ZfFMlE7Vn5qw+ER1hLdV4EGDsII/nNVgwDodhwB32MpWNeEKW
	 rdoSmlT02NZ2r0CysW06u8IER6hD5pQzbr350PJxXSHpFYLyJijOeqA2lxiL/gbeTyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=LorI4tvI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.51
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713A606A32D;
	Fri, 13 Nov 2026 14:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5713A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=LorI4tvI
ARC-Seal: i=1; a=rsa-sha256; t=1794580208; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=KCacjN13PHUjaLLrB6lEg/R1XYANx3Yi9WwZ9BxPIuj1ZbREFaKuPnIodEz3LcUiSC/Q2xu9n2KHkAiXdXz3YP+koTrZ07neD+S3Tbf/44f4sSeTzVZXooJ0xSJl1BeQw/9O3mpQDtV9Dh6n+vbiVzTfFw9+xzc2qWOHGlyz/wQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794580208; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7DTbJXNPRTHsl9EzpD6DaC77l/qNYG+bqbZDOTJxPx8=; 
	b=KNF/7S+1EHnrLBzg3w09hTuOK+oPlQ4Pm9mq6sHmJknc2ZazZPozEfbJgN21HD3OVhpSZBh2uulRn+XPweoTawkmyWs/o9kqNnswwsY9ZWA8ioL8YG3WqptwH2Sy7nn6nCkeFYboqJkdrn1LbqplXMwiO9wBo4urU1kysh4ls/A=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=LorI4tvIf3p+CjuuYkqU0dOOCINJxNhOwx6EFILZ+364KlSSt1d9Qh/BIxj/LMDMynmohB7z3kSgBO9xdvUA37n0snlIKwaNc3rRYvHC5vqUcBkOrEttKuloekMZiPovWlDZn5aTrUvCukrDi2dFqshWvk7vVux47PnkSBWoqqg=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=7DTbJXNPRTHsl9EzpD6DaC77l/qNYG+bqbZDOTJxPx8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794580206625812.3041962955166;
	Fri, 13 Nov 2026 20:00:06 +0530 (IST)
Date: Fri, 13 Nov 2026 14:30:00 +0000
From: Aditya Choudhury <mail@inferno0230.in>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
Message-ID: <avce6OKgtVIi15tR@mediaserver>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
 <20261113-ambitious-solemn-narwhal-cbaeec@quoll>
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
In-Reply-To: <20261113-ambitious-solemn-narwhal-cbaeec@quoll>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.12.1.5.3/294.544.16
X-ZohoMailClient: External

On Fri, Nov 13, 2026 at 12:17:35PM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 12, 2026 at 10:30:26AM +0000, Aditya Choudhury wrote:
> > Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.
> 
> >From where did you get internal codename? Downstream does not use the
> proper codenames.
> 
crow is the codename used in downstream sources. I assumed it was the
internal codename since SM7550 is publicly known as Snapdragon 7 Gen 3.
I was also unsure about this because SM7635 uses milos upstream instead
of volcano downstream.

> > 
> > Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> > ---
> >  include/dt-bindings/arm/qcom,ids.h | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Where is any user of this? Why do we need such SoC patches separate from
> the actual new SoC?
> 
I sent these patches first because I expected a possible codename
change, just like what happened with SM7635. I wanted to settle the name
before sending the actual SoC support patches, so it wouldn't need to
be changed everywhere later.

There will be follow-up patches to add SM7550 support and support for
the OnePlus Nord CE 4, which is based on SM7550.

> Best regards,
> Krzysztof
> 

Best regards,
Aditya Choudhury


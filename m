Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585580;
	b=03RV45N9iya5Ya9mk5dJ5Pq+nwhL8MQvubyarv1k6W21BMXABN7Nm4GU8B5hvhgZKeYG
	 P6VXJJxENTn3EC/XPbXD4wb1344kw9lS7bMOWcuy4Yrjbg1cA15d7vhbxmuGbNGU1c6yB
	 Icyge9kx+5ZfYV7bbQy2D0fW1z3G2Pnn1eTKrZ/SahXGHxmMgeVVP5g25qCOyyra774Av
	 j9fjrvZ/XX8GpAE59OrqQ3eg0p9lC5xAzlAdsRbAASRjS2bwhWe85n9pDSAQg8PEHd2LG
	 ghsrqge42V5PonayC7KcI6oYZwnj3lZo1oT2qK5Kd5Njq/1nJE2FOB77EDp5xes+pEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585580;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=Nl31PSuEy3Lo+qkXIEnbHDtDvbYKP5sZm75lN1/UelY=;
	b=PttbybguB7rZsH2CNsbbUslbMHJffc6a7GCUk/pLk3zL1aws13MZYAY9dp/4jY5JA7fQ
	 2nUDBx8xryhJPqMwtvgu/dgozOqs4qnac3KcUdz/ixRdv4idn9onZOu9ma/YEeGC/Sxoo
	 sIr20Vf/MPrqEZkyfJst52NkMYL/rsSwe7d9sE38/MORIa7XmRFUsMm8LxtJBnNMksBET
	 3a1In75/LE9Z/1UsmpyHXzczQLROlA4ttlqeN2OU2jWNdqSvAkO847za2x8wd0s40pwUF
	 HJ3JVeKWzf5Hd74hGezaEbVUxpgZXQiomhzaQrODePP5HhX8jubiJ3wiRjcjecx3B5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=OWMSJV8c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.51
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59760A2628;
	Fri, 13 Nov 2026 15:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF59760A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=OWMSJV8c
ARC-Seal: i=1; a=rsa-sha256; t=1794585566; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=ejwCJWvcaUWkbeGgTZIb+iy9k5lTriZ9j6jD1e02zOit4YxgqAEQ2X1Syoa9wo1FwbW9+9+8wF4GfPVV8juaj3VeKMRJmlk+uUg0mhjlOb6OzOlXOtbelwv2MTDXMffuHfFUAsF6rbljbWRac1PvpsggdUCsR6vkYN0Okcq3lDM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794585566; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nl31PSuEy3Lo+qkXIEnbHDtDvbYKP5sZm75lN1/UelY=; 
	b=IzubNrgY/b9qep5tU/q7McQWrEF/ENI4ZxnNLmWO7iErCgoP5sHeaC7c5sWt/jR3m8dUNaR6DcmwnDVEuH5gDH8o15mg8idnS5SUMDMcuNg7YNvsNlUbUekvVvmUcHRQC2VX3sY+rtlYbRUZaSqt1LumJfjRE8bUboG7lgizCNw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=OWMSJV8cqWV4Hd82XI0dtyYS+fB3lMYDWLps0Pz5sOS73WXmllhhNG0pe5BttTC7T+XeEYLq07VLsmjpi0aFzi7CQGWJKPkcOZ7C0Tpf4XQlGyL6xC0tJK+iX4SEKATPuwi+ZFdVcu/wap7taR2U5txqWEJEQ73Q7Llg4EcPZQQ=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=Nl31PSuEy3Lo+qkXIEnbHDtDvbYKP5sZm75lN1/UelY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794585564858467.445858350549;
	Fri, 13 Nov 2026 21:29:24 +0530 (IST)
Date: Fri, 13 Nov 2026 15:59:17 +0000
From: Aditya Choudhury <mail@inferno0230.in>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
Message-ID: <avcz1Z6OnT-c2kgQ@inferno0230.in>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
 <20261113-ambitious-solemn-narwhal-cbaeec@quoll>
 <avce6OKgtVIi15tR@mediaserver>
 <b945d65b-60a9-4437-999f-15b5f0307b5e@kernel.org>
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
In-Reply-To: <b945d65b-60a9-4437-999f-15b5f0307b5e@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.12.1.5.3/294.567.56
X-ZohoMailClient: External

On Fri, Nov 13, 2026 at 03:57:17PM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2026 15:30, Aditya Choudhury wrote:
> > On Fri, Nov 13, 2026 at 12:17:35PM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Nov 12, 2026 at 10:30:26AM +0000, Aditya Choudhury wrote:
> >>> Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.
> >>
> >> >From where did you get internal codename? Downstream does not use the
> >> proper codenames.
> >>
> > crow is the codename used in downstream sources. I assumed it was the
> > internal codename since SM7550 is publicly known as Snapdragon 7 Gen 3.
> > I was also unsure about this because SM7635 uses milos upstream instead
> > of volcano downstream.
> 
> As you can easily check, names in downstream are not codenames and have
> no meaning. Don't use them.
> 
> > 
> >>>
> >>> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> >>> ---
> >>>  include/dt-bindings/arm/qcom,ids.h | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>
> >> Where is any user of this? Why do we need such SoC patches separate from
> >> the actual new SoC?
> >>
> > I sent these patches first because I expected a possible codename
> > change, just like what happened with SM7635. I wanted to settle the name
> > before sending the actual SoC support patches, so it wouldn't need to
> > be changed everywhere later.
> 
> But this does not settle the name! You only sent SoC ID, without the
> actual name. Organize your work in proper chunks, not split without
> proper reason. This only limits the view and makes review unnecessarily
> difficult.
> 
Sorry about that. I sent only the SoC IDs because I had seen it done
that way in the git history, and I hoped it would also get the codename
sorted out first.

I can either send a v2 of this series with crow reworded to Camano, or
send the whole SoC bring-up with the SoC ID patches included in it.

If I send the whole bring-up, should it go out as v2 of this series, or
as a new series?

Either works for me, whichever you prefer.

> Best regards,
> Krzysztof

Best regards,
Aditya Choudhury

Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F6E3BBFBF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227554; cv=pass; b=mqKu4h1uzypoty19VA1uDzNTnUeiupQHI6mthLypIc9pEmT9BzvJnHMvu0jAS6KnHD4MOwcW3Zui4xcgC15WivH/j5Gj6d/ZcV+HnnZJGjLq2P0N1iUvD77v270JxLhu8kw1zdJ6v6OyUnazNm5Sxt0g7jhewliO0OQ0JJxp0WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227554; c=relaxed/simple;
	bh=YnSWqEYlcIxc6EKmwTVSgFIIELU0liQdEiKEpQob+bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScOlNJTyjaOmtrWRuSiBAhlL7pMXiQKgxvYsQO2CDcpaaGlp5jP8Tu89Teg3FVXpVeStaSY58OIhywSyXNZO6GeXMb9pYfv0jB2sMGjiam1C2M2xcf74Ekzym9oxSXvkgvxQAG3/ShHJNZRdnk1SyVE6QgUw/mSP+DIwLOPShUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGVGTB1R; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGVGTB1R"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c293a9e09b9so79470066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227551; cv=none;
        d=google.com; s=arc-20260327;
        b=EFZdB0fKxXz4Ak8R542NmuATlqSJN7GxuDn7FxjkzauAKG9wuJRG3D65gUJT7R9ZYp
         wxXL1Y1dbrlE8Em135PjEl+FaPgqJn5j9SuILT36uUi1yGYnk1SWadI+9MtcDgTNjLmb
         sJVdcoVsXwIlyz7YP2KKX1qx/ZqxjChzE5lRSrQNKlE7lgYosUo8TbgJ6A1D/oQTcUqk
         XMvNz7W5TQi8NQGqYViaiBcx4iwU8ndahMPq6wzAX66i0SCBi5g1duonExcP7GtnnXoY
         5xF1ZvSlxPXJIe8UetXEiQ7PQWKf0dJvExNOKPBSeTzrdGhXLZehvt6XqiE8Hu08Gl/+
         OMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        fh=MPw1J/2AZiy+utwSB+Iyr7k3zR0q47GzC3arNkqwVOg=;
        b=Wx7OoBzeiD2eEyU7Ale8jV0fuslBJfd26/nCXUGCzvWh0OVUjeZRNC5iui0S+1Yqdf
         L0Foa37S2pdclL7Clm6OMlDDH7t7pPHhiH4eUCVk/X27Bw1XeC1aagta5bM8JqWZAfN7
         vzU//7KK+xgVgMIbnJr2e81cpAalZJlXGEl4bjwOXkNMLapueCJFB135JtaBErcfgeqn
         J+h+zc1DLHLxOSgzcnryld8aJ93Qyr66q5yLfeF/kQQbvtusQB6kQsEP50tfJDX9nh10
         E2Llc39MfSLfsM9sluCk1eLPDZCd4Jxfrc5th0eaIHyxZUuR6bHMR0NOZqn4djFhg23f
         CiQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227551; x=1790832351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=LGVGTB1RZ0CCJ+y+8XehEGaT964iG66DU5X0YGqB2+pitQJZIi4tCUUuEPmPje/DBF
         1RkwdTRGNN4nQcKg7cTJwSGB++QTcoqNN1fWkfDJa7UM+59ByfVEPA0Ow7SxOnd/JYTy
         2SyuNmtVksuXYnpMQpbnjBA6FX2uoHTiLdPIgt4f5Y9pBAUXI29YQ+HyDU2xUf967I7s
         N2ZPrtPsrDqacmSLgPeTCTIpb6an/XdEFxAS4LI+DMB8b9hz8b1IJ3AahnsKtHI9pdmb
         ClzMxY8DgUhK8xaaP/BrqwBgccVHF/41TbkaHvL8p8CjhzjTFyCRCeUp0AJ7Ytx3O9Ax
         kudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227551; x=1790832351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=sKa1oJvqzY4QNEaH6NKAi+BdMNDTo0MrQpjAtrprEgkxGnHvurdGK/BZ1JGD5OFviT
         85yiAzUJVly0tdzH0Ai5Cgd1vpJLC9CSuTVNjSY4w6zqUjVm8ueI5W2wucNoTlED6ATj
         VnXvXytWwKFT3+IOOZ9r/U343aXjEmYPnI3nSSIsPMCdlTAyafrlWppiwRC7GK/5JS/X
         pBwuod2N4JcCOWnkJVrHFK6FGovG++0Wj3UNqgzeAIdeUwrxt7ZjG01MPoai8HMKTzC8
         HLd3A3F3KeZkT+uB9m6riHmWBVrt4Wh1UnKJiET0OOJD9emUwnLWgf8/bKyk8UdBUa2/
         0G8w==
X-Forwarded-Encrypted: i=1; AKwUvBwdt7iE/mHUK2lpod19vs3ZIkO/hFMhxrQhxSFzm6FDLdXIZgoKd1gFpV8aOsAgLwVcl5kfGaXGrBA6szI=@vger.kernel.org
X-Gm-Message-State: AFuF++noW1k06ql0AhnkElk43s+jATkLG9rVUWzbYqQvgGbLzOVWdC+E
	+FkQVl2OWYgvOrcwASnAXkQ4VJArmAKYmP3FqI/VPcMvnD1sK2O9SnAwbwna0N0RSmS6jJl1HR1
	Ihu0rh6IrJz09VPTl6rNgAvnEx6DMcL4=
X-Gm-Gg: AYBFou089adGUMhWO0C3gAN043/Ssi68l4LVpiFbHrRJk28u0MScgrV/eDnXJz4IuZm
	CWEzYjsH2yKNPWmbS1viLE4alixfD697YZBmrDxBpmCIT+XQ1XvWAlcdIEyhiRBqFlq/4ulcPk4
	DKGobdbNNz/DhJJkuQpGZkd4Y1ct36pH/RtdBbh1iMq6nqa7tLg0C90fniHysyKv3lSsuXKMoGk
	b0nh0UQmmtX4gTT2GW0uWL1tDwU4hNYDFCo48ee6WqidA8Evr7WhnQ7zFYPoeaLZzjbImnACy9i
	E6nCQFYe9gDhHOkZDteYhlLQOgogOf+eTTe/fCogQfglV69Uc0HOxD/L9Q==
X-Received: by 2002:a17:906:c14f:b0:c2a:8b27:325c with SMTP id
 a640c23a62f3a-c2ac24c6f74mr93439666b.24.1790227550909; Wed, 23 Sep 2026
 22:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com> <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
In-Reply-To: <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:25:38 +0800
X-Gm-Features: AclHuK__h_lDVDtTJPJ1hE5XUrq-ElYVbuKeNXUkTTzBjP1E-2gaCgXFCmYTLow
Message-ID: <CALj3r0he_NrY61dWo_ib+rj4msXZsRbBJ5f20xGEou0BfOWg5g@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Cochran <richardcochran@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=
=91=A8=E5=9B=9B 02:35=E5=86=99=E9=81=93=EF=BC=9A
>
> > Non-existent MMDs
> > -----------------
> > Returning 0xffff on reads and silently discarding writes is what a
> > floating bus / unimplemented feature looks like, so I agree with that
> > direction. My pcs-xpcs-rk does the same.
>
> Did you read 802.3?
>
>   45.2:
>
>   If a device supports the MDIO interface it shall respond to all
>   possible register addresses for the device and return a value of
>   zero for undefined and unsupported registers. Writes to undefined
>   registers and read-only registers shall have no effect. The
>   operation of an MMD shall not be affected by writes to reserved and
>   unsupported register bits, and such register bits shall return a
>   value of zero when read.
>
> This is what i was commenting about in my review, returning EOPNOTSUPP
> is not correct according to the standard.
>
>         Andrew

I hadn't gone back to 45.2 when I wrote that, so fair enough on the
standard. For what it's worth, pcs-xpcs already treats 0 and 0xff as
the "no device" values in the identity path, so the glue follows that
convention rather than inventing a new one.

Sorry for that.
Coia

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E6A3DB625;
	Mon, 31 Aug 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169509; cv=none; b=AO7Y9ANxHeFUNxOJahr8lP4vL8oIeLYHre7L+dH+NF0Vx7zJExw7XD9SwhbfmSTPHPvQ4upSd5Kxan8JeJ9ZPNz0O7TZqV8bKtpPzcTYAoeYs0YPOz5AwVTPvXRZBL1vX6kIdYuNbgIDgHQcraWnTYqzpoQFLkjI9eRS3DHS0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169509; c=relaxed/simple;
	bh=Z7HYVyz+nBAj1QqhHvK07wwKLBzPsKK5V5aWweOkC1k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IkrzB8BjVvq58OZd/mY4cmwU2aI64N7hv8qbg1FbC38zpBmi5J+Yjcpj2jwd55DPlZy1U43hzFp/ET/kMxE/qgfFe7eT6aJgzlxGSXNR1D+csAn6NUg1hmYG3G6RfAqciKp39oQJn5bUHgNwE7gVIHaQOyiuAmyy/x58qZpcw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOJ9wOqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOJ9wOqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23681F00A3D;
	Mon, 31 Aug 2026 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788169507;
	bh=/pqK5jiaMpzwet2GuvEIt2SypcJxmlRUAsZAiwVepKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TOJ9wOqmsJk/NS5EFk7kQ1+T6sMcyXFkhdo7zwHkOxVKvYBdbdJ3VOOVWJqMS9ET4
	 pFZO2fG7TdbKnq1bkS0K6rF7wwY/aVeKZnqwE9qC+bkzwXTa6Pz7eIxphEUnVg/EnH
	 6kFo/47t7UJ73Qt9i/vdM/rpyvk0ge4AUrhq//vCyYlb99u8linn82WMiNz58Sdv/o
	 Ij3ve/t6MeD0wYUb6e5IExUldEr2Q67gTyf9yXfYRazi46TbOTMG8+3Jn6mdL8I0UB
	 +1qkZyQfTSaGJZKri9ohMxZCrFtWTAZfzlTlr3nXmCAYyBgyPm1NrjL4rQQ82+0mIv
	 6pJSKyBpj3Mdg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add sa8255p USB PHY
In-Reply-To: <f9320dae-6436-45e1-b99e-f49115b6279b@kernel.org>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
 <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>
 <f9320dae-6436-45e1-b99e-f49115b6279b@kernel.org>
Date: Mon, 31 Aug 2026 11:45:04 +0200
Message-ID: <87o6eimxnj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Krzysztof,

Thank you for the review.

On Tue, Aug 04, 2026 at 10:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 22/07/2026 15:45, Mattijs Korpershoek wrote:
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: transfer
>> +      - const: core
>> +
>
> Same comments, why isn't this following established naming practice for
> sa8xxx bindings?

I've replied in the other phy driver review at:
https://lore.kernel.org/all/877blx2bga.fsf@kernel.org/

I've also send a new version for those bindings which hopefully better
document the power-domain-names and their usage:
https://lore.kernel.org/all/20260831-phy-qcom-snps-femto-v2-8255-v2-1-dc6197ffde1b@kernel.org/

I'll focus on sa8255p-usb-hs-phy.yaml. Once we have something that's
acceptable for usb-hs, I'll respin this series as well.

Thanks
Mattijs

>
> Best regards,
> Krzysztof

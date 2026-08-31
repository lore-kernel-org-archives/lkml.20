Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051154A2E2E;
	Mon, 31 Aug 2026 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185294; cv=none; b=Zqe0J06SuI1jrfqb6kH0Iv6bXCu7WJ5KPGw8ZEbmP+KCjBqsH5CF5s6R/DoZ+TS/BT06987tm43etGRpZ64dD88uujeGrPUK1bK9CTVbjD6YwyJ7+kl74GxhdDqNEn9Yfn4XgrZxyzIAcA8dPD6zPbqzPzQe9qYxnyLI7x72Y6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185294; c=relaxed/simple;
	bh=nJtzH3VZYRFmCcgn61qcc0IaTGDvdjKY9BA8si4pUo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdBEn51wJVkxgvyBptJIBIaNxGrt8tzkfbb62wQvzlJiyEbM/mItDz+9pAEi9yezUHun+yMwMSt+hDpeDY1Ksj4ic/4ri+DWQoGr9JQ2I9CFuQhCJOSTnjcHHbwkl/GDrsn6jm+y6VJUXbOzulLgKP2SsOnfG/nIRuitKKC4IL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FptTQ7Z6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FptTQ7Z6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF971F00A3E;
	Mon, 31 Aug 2026 14:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185292;
	bh=06GGDuwat+Z1wtvCX721oWBybLK7KA5BMGz84VH7Jqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FptTQ7Z64wZGUkWZeEqOe6gfDEGVMHeKV/5YQg103Xs5gHE4xSR4TSko/Cds3q/2l
	 02CKjQVvB/Qm9WhP3cl/JWpUuqYkk/w8ujJ5vfBl/deKg8gEIQOG+CO+yFP820p2Db
	 3vp7e2hOX3h9dHmMdkiuNkqI6eVpYjm7CYq7eSDd+FO5fLOyZFv0PPPnpGpaZAjjjL
	 TBtULst/PdQCan8gJ2SoHY+ajzmak1XwHJg96iPI3euZB9+DsmSUV2u8Sr/RhgdNsM
	 Ed1ZsSuvP1RIkPtgynmZXwgt3wbRzrgMvyO7aYdLz/jA+6gDeyt1Ffqkds8akK5ghK
	 MoMJIIl6sHK5w==
Date: Mon, 31 Aug 2026 09:08:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Benoit Cousson <b-cousson@ti.com>, goledhruva@gmail.com,
	m-chawdhry@ti.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, daniel.baluta@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: arm: ti,omap-mpu: Convert to DT schema
Message-ID: <178818528783.810946.818294519620797372.robh@kernel.org>
References: <20260818-ti-mpu-v1-1-5b1c71a34669@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-ti-mpu-v1-1-5b1c71a34669@gmail.com>


On Tue, 18 Aug 2026 23:29:51 +0530, Bhargav Joshi wrote:
> Convert TI OMAP Main Processor Unit MPU text to DT schema.
> 
> Changes from the original text binding during conversion:
> - Mark ti,hwmods as deprecated, as it is longer needed.
> - The pm-sram property name is kept as-is without a vendor prefix
>   ti,pm-sram to maintain backward compatibility with older device trees
>   and the existing pm33xx driver.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/omap/mpu.txt | 54 --------------------
>  .../devicetree/bindings/arm/ti/ti,omap-mpu.yaml    | 58 ++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 54 deletions(-)
> 

Applied, thanks!


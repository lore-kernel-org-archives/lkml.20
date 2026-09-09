Received: from mta1.migadu.com (out-21.mta1.migadu.com [95.215.58.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCE4F30FD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949796; cv=none; b=e4mE53BWLc32XNSzCWKbcCrh+g4FwenjSMMHPpLGWye1iaE7rV/EvxfU8hOjWrmL2EAsiQ7ZQlIlerNTKldYjxhGuCKqlkfEGlSdMH4n7wk+vigfvQOh3nnth/ZuRHvl4PKZ8gg6FpIkf6zh5o8CidEj+mkq5fiJq0No3s2Ehu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949796; c=relaxed/simple;
	bh=S1uOY2Lbxqeick8URdu0hldNgRFplEY0Z+aGMt8MGNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k2pY/f3YblOw9N3z/b4OdDBeK3+nVXhu1WR6+BctoXwQtrMBKOi/svMW4lLIEg/c/ZDCZzRnqGe4mgxfjHkhI6vRn0oK/4aAjQpdrVn8wkOfFM/JLmFOJ5kgVBI8GZNCWkufxW3PKjexkxdDGn5eifqy4LU9zCEl+cQVkpCc5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=TDdDHlYN; arc=none smtp.client-ip=95.215.58.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="TDdDHlYN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S1uOY2Lbxqeick8URdu0hldNgRFplEY0Z+aGMt8MGNs=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788949787; v=1; x=1789554587;
 b=TDdDHlYNH54z6sZAhOVE2kJX4AEndUlowGoiMfiDQl5YaeJApQ43XF2WmeG9Iii0Zp9brjXJ
 D54q1dbvFvnU9syL+wBJ6XH5Aj+rnzyoNfjbxuZidaUiaHj80AKIDFCi46qJohNzgJCprgIsRWL
 SPiYgbbdHldw+RiWi/jMEKbSPtRnL9+oJXU8iEOWDqRIlHM/BmOZGsabbwvSC6ty7R6goqTMPRW
 NCtMJ4h5bOuJLd45/GwlcQ0Dd8jhiu8ft5kfI+8Fi9EAPwnPYo+HKT4gZI2sZvHeSUUAoWFcJUR
 uPi5Qbr+kYALAR+IshWbQbYae+YyMXTKQhenjLlXzgPsw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2b854a189f54564;
	Wed, 09 Sep 2026 10:29:47 +0000
X-Mizu-Trace-ID: e2b854a189f54564
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 12:29:47 +0200
Message-Id: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Andrey Korshunov" <razor1702@gmail.com>, "Heiko Stuebner"
 <heiko@sntech.de>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260908235824.665-1-razor1702@gmail.com>
In-Reply-To: <20260908235824.665-1-razor1702@gmail.com>

On Wed Sep 9, 2026 at 1:58 AM CEST, Andrey Korshunov wrote:
> The NanoPi R28S is a router board from FriendlyElec with the Rockchip
> RK3528A SoC.

There's already an attempt in the works to upstream NanoPi R28S support:
https://lore.kernel.org/linux-rockchip/20260907-r28s-upstream-v2-0-21ab570f=
c91c@proton.me/

Cheers,
  Diederik
>
> Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index a799bb843..1d937795a 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -340,6 +340,11 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
> =20
> +      - description: FriendlyElec NanoPi R28S
> +        items:
> +          - const: friendlyarm,nanopi-r28s
> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
>
> base-commit: df2908090cda368b01ff43709f51890076c56157



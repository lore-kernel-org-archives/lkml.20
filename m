Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261751A682C;
	Mon, 12 Oct 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797665; cv=none; b=VwJKUSduy2Qy1cJaxql0T5RcPMWFkc/Ws9Y0KrJlJfbF2aLGVco7bmBvAjtIbKDpSkqYweVkcjedIXnCPVU9m2vLzwQEaqoit87AHCeVnwOS/hWFwZEnS/6uXoxHLSits6tDoO9tGY8JPWig09KQtH0OM6PYaOPO0RQ9PPlz2qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797665; c=relaxed/simple;
	bh=5CrkGArHbC39YyF7d9PHMzlVGOY2DeCO1mhmVGwfDo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOR3eB3hzFji19GjpDnM8ZbQPcJ49IkO4ngv63PbhsaKkvmzPVCArzu85QV+KlQWIyQnQlrJY3amn6rJJuValTTPYwT8HocpAwGnYBxvdQ9QMIKt2DvaZkdhSYDUNHdQ1WxzA/v7HGIKPU+E2aakEY/bJrwUdCHo5xakapisIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVLSiB2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVLSiB2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F332F1F0089B;
	Mon, 12 Oct 2026 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797663;
	bh=UYCpGx3UOIc4nh/12sRQYB8M7w5AmmkLzNcu80mAkCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVLSiB2fj39wYmvRK0+/RPtgapfIw/n4RNYfgeecqYKnTfNNCASUAyPN+3uu/OTxk
	 6pVrFbzJO5Zvm1mZWbLarVudEFB64XxYWFi+wQ2qVorS3VJn0wkLG8VQRUCY+l6D1F
	 8iEpXWrve7TAd9VLMGj04SFdpvKBrbx+cWt4fteIv8fD2rAte/JA3eg587a1E8mQxE
	 zHfp/sM2ObJkPC2phs3mvXVDFLHVw4IuUNKubun415CsCGlbOkwNG9Xh/IlGPN+WQ6
	 QRgAO4vteeD8T7Kz+9zEvB9Ub9F3aZ3H9Kjlja0LnM9VXwGsQdKxaC2RtJNJzHL8Ac
	 GinbaWsnBT2Sg==
Date: Mon, 12 Oct 2026 11:34:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Auchter <michael.auchter@ni.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: extcon: tusb320: add SGM7220 fallback
 compatible
Message-ID: <20261012-flawless-economic-marten-a937c4@quoll>
References: <20261010081907.479226-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010081907.479226-1-jerrysteve1101@gmail.com>

On Sat, Oct 10, 2026 at 04:19:06PM +0800, Jun Yan wrote:
> The SGM7220 is register-compatible with the TI TUSB320, even reporting
> the same device ID, so it can be described in a device tree using
> ti,tusb320 as the fallback compatible string.
> 
> Link: https://www.sg-micro.com/rect/assets/bec47c84-84b4-4015-8d61-9433e0d76583/SGM7220.pdf
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/extcon/extcon-usbc-tusb320.yaml           | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


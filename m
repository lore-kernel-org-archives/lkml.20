Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41674963C1;
	Mon, 28 Sep 2026 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590321; cv=none; b=k77+5tDwhziGCHqpvwFe/+PGLp/6rU3zD/QQyVt6o4OW1gBbdYx6fT1GLaUI206j7A8t9E8d44OXvaVopMJ8qAyH/6HaOo/h57597SnibBpPIGfYRxI/cO8gRi/Uyl1Qg9+EuwsyrIiss16eYj87FO1txEzjCLsda9IaHXzA29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590321; c=relaxed/simple;
	bh=h8XPs+oMhFOZbXkthKtxJzo8SxVaRvixwpiJi5DvyOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5EuNTtt50WjYxYx5KQ/tEN5Q1KD5jy8HxLpUBgpC98n0Fn9PSruBrSdggYj88m9idHAp/c6lP07Sphg+ISTGPN35EiQX5i7MmD0my80WwxCgLie2lzZ32RaALE3XObLQ7H7a2fwWUqUBU47CUs5QHfBmA5tLwE+qqlorUdtd3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB9ARJXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB9ARJXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9211F00893;
	Mon, 28 Sep 2026 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590320;
	bh=xKKYYbi6Wt3RVUnYaw2KHtHKnm8mMYQucrYPSRYDn/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XB9ARJXqe2mM0ec8F9bYdzQUjvGLewfXtQILKYxpw3MpwxDdVcTLtZ9W+wzIiHX7f
	 ms/KsBr0B766ktynZlyk6eL0rn1pnMxE/AM9H6Tk5rQ/2vgjgghB+V3VGh8jS5rwgU
	 5y2LckLSb/6Zu2DnkYEpd/c+3D4GjcYgFw0KaCFGuuddCUbdJhFAYB0sKkS3Yn1pqb
	 ccgZV2r6AKts91dcv165w1hIjddy88krRagP3aPFPlxNbX/WQi8JUqBY/bbs3PdrKW
	 21PEntQDGVNJkoZhGdadzK3yKXG1C6oxkGM9ThgHyHJJKZB4PCBBUspfwMXePgwjGJ
	 hsV18mTa2Y2jg==
Date: Mon, 28 Sep 2026 12:11:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
Message-ID: <20260928-laughing-malachite-spoonbill-5c1bc8@quoll>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
 <20260922-maili-socinfo-v1-1-a82bd7d4ca77@oss.qualcomm.com>
 <839c556c-a322-4e1d-b68c-84d404f435ad@kernel.org>
 <8157618a-7b8b-4c2e-871b-5bd3f5ec17c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8157618a-7b8b-4c2e-871b-5bd3f5ec17c3@oss.qualcomm.com>

On Thu, Sep 24, 2026 at 09:28:20AM +0200, Konrad Dybcio wrote:
> On 9/23/26 9:06 AM, Krzysztof Kozlowski wrote:
> > On 23/09/2026 01:06, Jingyi Wang wrote:
> >> Add the ID for the Qualcomm SM8950 SoC which represents the Maili
> >> platform.
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  include/dt-bindings/arm/qcom,ids.h | 1 +
> > 
> > 
> > Standard question: where is DTS? Why is this sent separately from the
> > rest of the patches targeting the same subsystem? Please organize entire
> > work targeting maintainers in relevant patchsets.
> 
> I see no reason for the grumpiness here, this is perfectly okay in
> my books
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Still, having it separate from initial DTS for the SoC brings no
benefits. I am not grumpy, having this groupped makes things easier to
review.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


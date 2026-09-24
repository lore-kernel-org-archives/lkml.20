Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900F387590;
	Thu, 24 Sep 2026 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255332; cv=none; b=i1SxhMPRfka5XIJ1e0sEC6Wz60GTOLnikcAT/JUMhtj6gdPjbJIDLPLM8JBfP9utaf6KMQikeeQ91Pj1lPiqpaEgLjqcSwoxWqmLuHrm3V+DqawwRJmhfJmQG5DUuRRqqH0b43gOTQfviUSCmeaA5Tlev61Pq6KbKPXFX6yEEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255332; c=relaxed/simple;
	bh=VZI8N/6gYLzZLpoXfBFDH6LznFXLoUL16QxpdfMrlD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+dYLAApED8IgvVB272ZesCSACHR2Oh3GSTWZKg47bjaAYLohGLHmutxea1DHonZQi2V21rhOBYUAb/2Hf/m0ifwlFxB0gGajVMYDWUgc/rWQstlTMU833+obx6kyBGhm4VpoEkBeJZt55YgOZjaeROMGVmXgOOYvNqyGxClRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nvc/kL1C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nvc/kL1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7351F000FF;
	Thu, 24 Sep 2026 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255330;
	bh=JNe0+MEvtNypgipOUMWCXmfWLOPV9rh+tWFM3Th3Ytk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nvc/kL1CW2y0ABPY+myLno+5JzQjxspwUjAueSpk90kyvYN58g/YGGbXFjh9Kw9L6
	 DZQziEBkhgkvMLbzCVSDhhuqSvHGMhjYVbkgUnZrzb1HpgQxW0dgE0OQnOBH7lXV2C
	 Fq6zacZvIkdCvQNVxE+vvFWQDrGxPElHMNRZ7G0wpQUlCNZNBwRVeVwXRvbPmWXDHX
	 Zd7oBib2Qk3lRY55QatoCqQaVy8JkVpgXQIPAoiV02sEK69POoNPzZpmGmRFSJLc9p
	 FQPo3C7+OTMWtWK9eTOUbXMxxw57T5qQsjnS6TQ9Lwnwi57UNvkIfj9qX+mg+F7CTu
	 l6ZvWrwQap98g==
Date: Thu, 24 Sep 2026 15:08:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	abel.vesa@linaro.org, abel.vesa@oss.qualcomm.com, johan@kernel.org, 
	konradybcio@kernel.org, kirill@korins.ky
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
Message-ID: <20260924-curious-sociable-nightingale-66ffaf@quoll>
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-4-mstoretv@cern.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920184148.31541-4-mstoretv@cern.ch>

On Sun, Sep 20, 2026 at 08:41:04PM +0200, Maxim Storetvedt wrote:
> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
> 
> These use a common dtsi derived from nodes that were able to work on Linux
> from the initial Galaxy Book4 Edge DTS by Marcus:
> 
> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> 
> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
> 
> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/
> 
> as well as a few more adjustments on top of that again to get additional features working.
> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.
> 
> Based-on-a-patch-by: Marcus Glocker <marcus@nazgul.ch>
> Based-on-a-patch-by: Kirill A. Korinsky <kirill@korins.ky>

There are no such tags. Don't invent own.

Either they provided SoB for the code you used, or not. If they did,
then you could take them. Otherwise not and read obligations on your
side expressed in DCO.

Also look at Co-developed tag, if that's applicable.

Best regards,
Krzysztof


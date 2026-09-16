Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899DA37BE75;
	Wed, 16 Sep 2026 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601186; cv=none; b=bnjdEuTUdAgxGzoIhb45P+QRjptdQoXMUfflIf7riZ+BrmASTX1u9kusna0GelAsifLRfGyLAUWceErA9eSjshWLCz3Csv4DWWKRg/MBeHnYYyUtdVxwEBBErig2byaFVncnNcF6t+8qZtYLbQAci8ZWcv+iYDNNmwfoy5342cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601186; c=relaxed/simple;
	bh=t1SKHkKzjFAxFiudhxAdEM8nJWM0RZmUr7uidHT/DXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dx6urSvmPp+F6yQFatS1VXlR6vquR8jkIUY7LEZxHSVyqbrsMIw5Z/Z3oh4lfHTXw0O6uFCdbUUy8q+TausgMsDdwrDYRFJaqIrtoIb4kPj7bcj2eM/Pr9lyNR/hXH9xmlyzsCoFLBlflSynH5l9erOYCS3a2Moz7XK4Py3HhY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxFKKnsb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxFKKnsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E4C1F000FF;
	Wed, 16 Sep 2026 23:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789601185;
	bh=5cCX6PEia6C63BkkFvkvNh/Lx1QqHRrUj2a30TwF+dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GxFKKnsbNIgRLEuGqeWV7/FYV5KVkVll72Sg0nK1pEqSBfQDVKRMmmdP79QDV8JTc
	 OpAwyYuPAHCRP7eFoabb9sINdmTxCy0sE2OGCr7k/m6/qa4IYcVEKlkpzAyjuPiNrI
	 VW+YFE8FJNlMlfHNme6M/6d0YG/aYdyiLqcsD26I/HWUZwQnkPxT38gAh9PmgJjy7m
	 GQDbLtDbDvnnzIBrVcV+QBLqhI3jjFumUPwyGHvynS+YUis0WQxkppyk7SFkl6WrTy
	 PmyywxEZNVLMoElrSJQyW7FJ3WSBNOJ+4DqryvC3iPNJppoLDB8Y/svdvjGWKom1S7
	 i7iMkKGJG13aA==
Date: Wed, 16 Sep 2026 18:26:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, jens.glathe@oldschoolsolutions.biz, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <aqsj20VhODaklyEy@baldur>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
 <ap_RKfCbXAVBRtSY@google.com>
 <4d2c00e1-8331-4a08-93f9-6564d0c46aa6@oss.qualcomm.com>
 <ap_rUIaJGAk-gZVP@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_rUIaJGAk-gZVP@google.com>

On Tue, Sep 08, 2026 at 11:02:40AM +0000, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 11:57:33AM +0200, Konrad Dybcio wrote:
> > On 9/8/26 11:11 AM, Mostafa Saleh wrote:
> > > On Tue, Sep 08, 2026 at 11:05:34AM +0200, Krzysztof Kozlowski wrote:
> > >> On 08/09/2026 11:03, Mostafa Saleh wrote:
> > >>> Hi Jens,
> > >>>
> > >>> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
> > >>>> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> > >>>> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> > >>>> chassis, different silicon. Stubble and the DTB loader need distinct
> > >>>> compatibles.
> > 
> > [...]
> > 
> > >>>> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> > >>>
> > >>> This series does not apply to ToT nor I can find this base-commit
> > >>> in it.
> > >>
> > >> It's a public/standard commit, next.
> > >>
> > >> What is ToT in upstream development?
> > > 
> > > I am using Linus's Tree:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/
> > 
> > This tree contains the latest release/rc tags, linux-next is an
> > aggreagation of each submaintainers' branches, effectively "what is
> > the next release going to look like" so essentially that's where the
> > development happens
> 
> AFAIU, linux-next is useful to get a view of the next release.

That's exactly the reason why you should develop on linux-next, it gives
you the view of how your patches fits together with the other changes
staged for that next release - before we try to merge them.

> However,
> it shouldn't be used for developement. It should be either Linus's tree
> or the maintainer's tree (as mentioned in process/submitting-patches)
> 

Please develop and test on linux-next.

Regards,
Bjorn

> Thanks,
> Mostafa
> 
> > 
> > Konrad

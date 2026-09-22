Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DE314D1F;
	Tue, 22 Sep 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084177; cv=none; b=eoTFNPskchzMphfdQMrRfRX81xa9U7QxHBUslGKnipm1c4R6Qm/sRGg7KQKHl0E19XD4sqpF0TGo0sZKBBmhi2Rhn/fFx84r27m+vwdrZoqlD1rjBjzl1xGp17dqVcQXxUx9FhTnYHGXhpTGu3YDs4O3+ogXfMXruQ2ACMgS0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084177; c=relaxed/simple;
	bh=9I3JAYVyFY+vxxTTOrUnMofRkEOgw46B9OyiszK/WCg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k1cezSLnTKKEyREujm6jg7oTaen/QAq1L5QUlwSsY9LDh2asyfzo3NAW00tig7rOA5TsVkJnPAxGeN/mx9eqyRMpYyveUrTS/aErZfK37q+86NLEuKjQ9UJmoYiD2n71J6vD2eWnJx0qwx2r1JbnrfDset1IdA56x1/ZsaJNbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4SxMuqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4SxMuqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B13A1F00893;
	Tue, 22 Sep 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084175;
	bh=cXSyuOB9bQOU1bE2UbkHeTifAOp/12fZtgw/FWOm+UA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=M4SxMuqy6gnQ2FZeRSHfSUthE7lVYD2KJuAp9aiyCltDYjd36UO/MIiVk2ktyc2pu
	 b1S5j1sPVm+Wxu0zp7G1faPLXFpDc/Gkk/Qw4Uxt1v1WtGq9nnZe495UmE/ow5MmMn
	 jR2XIQTUM4oNRBcjrqP2Ap5W0YFr5qPx9LzFYROc7xfcihRYr/EvkQnbACrzVcCYVg
	 Rg//ID/nuYNiO/O0B8Kffprx0Oc+8cqOXicEC5UQeNcENhWUTEZYdsrPgrwtIIxn1y
	 HyZgPtPgIp5nv8zTntUFxCNt7H4v6+BdCnmrncmhKR8sLoO3z+44x2YQiGgZghFZzb
	 rcpstu9faUVMQ==
Message-ID: <d9a03faa-3df9-478e-aa73-fa6e7840b3b8@kernel.org>
Date: Tue, 22 Sep 2026 15:36:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/3] media: hws: fix shared IRQ and video quiesce handling
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-kernel@vger.kernel.org
References: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 15/09/2026 03:01, Ben Hoff wrote:
> HWS quiescence currently disables a shared IRQ descriptor and calls
> vb2_streamoff() without the queue's state mutex. This can prevent other
> devices on the interrupt line from being serviced and race userspace
> capture operations during suspend or shutdown.
> 
> Remove diagnostic register accesses first, then restrict IRQ quiescence
> to the HWS function and serialize monitor and queue transitions. Runtime
> readiness checks report an unready core without resetting shared hardware
> while capture buffers may still be owned by another channel.
> 
> Based on media-next/next at b38d06ad1e13 ("media: ipu6: Fix up missing
> IWYU issue"). Apply the three patches in order.
> 
> AI assistance: OpenAI Codex using GPT-6 assisted with this submission.
> Each patch includes Assisted-by: Codex:GPT-6 to identify the agent and model.

So I'm marking this series as Changes Requested.

It is not so much the code, but the awful AI generated commit messages.
For example. patch 1/3 makes lots of changes, but the commit message doesn't
even say why this is needed. It tells you it keeps code, but obviously
you can't see what that code is in the patch because it is, well, kept :-)

To me this patch just looks like a big cleanup patch, ditching old debug
code that is no longer needed. Which sounds like a perfectly find commit
log message.

I suggest deleting the commit messages and rewriting them yourself in
words that a human would use ('serialize video quiesce with queue state':
really? What the heck does that even mean?)

Remember that AI can be very useful, but in the end it is a human (i.e.
me) that has to review it.

Regards,

	Hans

> 
> Validation:
> - Applied and built every patch boundary as an external module with W=1
>   against the prepared x86_64 kernel, with CONFIG_PM_SLEEP=y.
> - Strict checkpatch and git diff --check pass.
> - Hardware capture and system-sleep tests have not been run for this
>   extracted series.
> 
> Ben Hoff (3):
>   media: hws: remove debug controls and lifecycle tracing
>   media: hws: quiesce interrupts without disabling shared IRQ
>   media: hws: serialize video quiesce with queue state
> 
>  drivers/media/pci/hws/hws.h            |   2 +
>  drivers/media/pci/hws/hws_irq.c        |  84 +-----------
>  drivers/media/pci/hws/hws_pci.c        | 181 ++++---------------------
>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  14 --
>  drivers/media/pci/hws/hws_video.c      | 144 ++------------------
>  5 files changed, 44 insertions(+), 381 deletions(-)
> 
> 
> base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
> 


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742532D7DEA;
	Mon, 12 Oct 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810298; cv=none; b=a7xEokKyn4JKaiU300cAzirpWxvKOjHtRn+kXSQKZ3bGCheSxI86IVlYkHIBw6F6kPct5MbOB76aBpEpxvuyKRSdvmZQyQALkGJ4CDi/UJtHjojcHzB0zzm6CMdWNIUjX7UtKLYnQe9BmhH9M9pDLWvQljlEGdvLAyf1kLrEfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810298; c=relaxed/simple;
	bh=4tfCcg+tZ+KlmR6bVcHroHw1/3zKOV4g2fQTMCGq7bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He1QEDr/pxTBd4sfOTogbiDLyP5wm+jDt6SL7luQl7RZ3aUTx6kPjuBjl1umCfSxM8d+OZHw29ZLjM4PPglhlYcY9XCAx19G/hnPRb6w9oYVeDJ5hSMPC5yjdhieo4aYVZYUg/d/RO4z+117m2ir0czu5x9Zik0G4g0EDPRMDUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ikh2a0R6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ikh2a0R6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0FC1F0089B;
	Mon, 12 Oct 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791810297;
	bh=NFyDzZZnulEtABctZn/5hjXr31sVNzue7aFgXemMH3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ikh2a0R6ICAvnaQa7tMudCXj1cnV+CemHmHhS05bZojPGpuHBqGceNJwnR+gOzGlO
	 Fo3LJNxP6hQGAoOgGrVDwWqzvyukrhybiXy8qSRQ3ZtmI1QdqcxWuV5J8CfutMJOHC
	 o/uj0ZAFM2lL+PiLdW8ewQJp8m127o7HLnnGlW1g5kGgONNV7bQ2XfiIBQpFLJKVIp
	 3R5aumgs0Em8criqmtTdQkfPxt6QbgxrhrQQ+Cwf9vjkNGczTDO55G4jQJJF9/6bTI
	 OdPTxTceOWXhAsiB5DMqZvZoF3qFMsrgdBjN6ltjvGJUpBFqoYgiGNdGspJbqiRsS9
	 8LCv8i/+RrZ1Q==
Message-ID: <af1ff8d7-16a3-49ce-86ae-f944978f869b@kernel.org>
Date: Mon, 12 Oct 2026 15:04:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Handle payloads starting in the middle
 of a bulk URB
To: Ricardo Ribalda <ribalda@chromium.org>,
 Muhammad Waleed Badar <walid.badar@gmail.com>
Cc: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20261009165248.56440-1-walid.badar@gmail.com>
 <CANiDSCtSo2nmbjzWC8CC3GAg2vsh-OBBW1-Skogb4tFpZ240-w@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCtSo2nmbjzWC8CC3GAg2vsh-OBBW1-Skogb4tFpZ240-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12-Oct-26 03:54, Ricardo Ribalda wrote:
> Hi Muhammad
> 
> I understand that this is a RFC. Let's focus on the problem before we
> discuss the code.
> 
> Currently, both for isoc and bulk, if the camera appends some data at
> the end of the frame (let's call it trailer data) it is silently
> discarded. With your proposal, this trailer data will be considered
> part of the next frame.
> 
> The trailer data is out of spec (check figure 2-12 of the spec), but
> having multiple frames in the same bulk package is also out of spec
> (For some reason the bulk cameras are the worst at following the spec,
> no idea why).
> 
> Your proposal (again, not looking at the code yet), will fix the
> problem for some of the broken cameras but ti will completely break
> the driver for other family of broken cameras (the ones that have
> trailer data).
> 
> If we want to automatically handle your family of broken cameras we should:
> 
> - Add heuristics to also handle the camera with trailer camera (does
> the extra data look like a uvc header?)
> - Add a non compliance warning so the vendors have some feedback about
> their wrongness.

If I understand things correctly from the email thread + previous patch
there is only 1 USB vid:pid combo which needs this.

So although I'm normally in favor of heuristics over per device quirks
I think in this case a device-quirk might make more sense ?

Regards,

Hans


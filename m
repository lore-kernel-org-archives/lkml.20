Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7F484238;
	Mon, 21 Sep 2026 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990157; cv=none; b=Ts3r1L8eVO81Tn1hrFJ5xkc5v7xfp9oZ/KUY622GbDvbY/DBHteessNHqy+/HpxRgGqEV96x9qyFFngO9ZcPZFr9swDOvj3CjUQ9Z2QiKb+6mHcgg0Wk6jp1SF/DygKRk2tu4tIcTWRvh5K8p6GEvCYQiD2ISqBijz0loAXVGMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990157; c=relaxed/simple;
	bh=2LOrNaGQ5mj1zA9I9cLkssiYpHQbuUlvMHtAVgfZL7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MebAw2BQxEl9y4mm5K0C5ECcfaEJ4uEYyl0DbX/UNuT5XYN5KXfnOsG+V/5WO2ly/Cl9fB2LKfnof304VuLxkKillAIN5nG4Cw5vu1a8JWe0PHM+MLBFgBJgXJg4hgRKS7COacLTvFXrc14QdOgjznfrUYyzS4E6TiCB6sfBWM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjdGLSf0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjdGLSf0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4444E1F000FF;
	Mon, 21 Sep 2026 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789990155;
	bh=ytrNY/dXC+o9MsksDs8zljUzXO8YO7DW51E9SEVgNHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MjdGLSf0pnoFhBwFlwXKcoZ4RH6OhswMlzB+ca+LLAi4BVBhJF0Ii+BUxLGyWaY+y
	 miWNElchQPLZ5c5juVsDDLHGHtw7kELk/QG/SjyoKE5OmS8wgREk/xYBJqq4ztOCqN
	 +PfouMSQ6nLARjnmV29YoWBN/S3gJhXEPVPslTbTJciXPdB676gdo5Q1ElTvxKzgJp
	 3ZUAJOfcWaP69qmZRiJOwFGoE08t86wajDcB3k9SktFzlYryVdKaUtXKumDnjwQmJ6
	 cHnCvjpcWzZI8OI09GeuN6x8usPirLR+3K5gm6A+dZuTmKBWTcTwk0oIbh1ETFge8M
	 vKgOW3oDLaFow==
Message-ID: <367c1fac-a665-48c8-bc28-98b0cb6e6f5c@kernel.org>
Date: Mon, 21 Sep 2026 13:29:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: add capture quirks for 1e4e:7102
To: Ricardo Ribalda <ribalda@chromium.org>,
 Henry Paradiz <henry.paradiz@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917212951.558283-1-henry.paradiz@gmail.com>
 <CANiDSCsoLGGewmpV6cL=wgkMh3qx=5dU_mVWUi_NaBdfZp+hPQ@mail.gmail.com>
 <CAMfFSnDa-nGr-mxzuK9FibOCJGFFCBjB_HiLBwGJ3btuFR=WVw@mail.gmail.com>
 <CANiDSCuUBCbiE-8Pteo=fpjT8AK9WN_s6AcR-8K43da3inteXw@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCuUBCbiE-8Pteo=fpjT8AK9WN_s6AcR-8K43da3inteXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Sep-26 12:52 PM, Ricardo Ribalda wrote:
> Hi Henry
> 
> Thanks for the extra info. I still do not get why the device keeps
> suspending if you have the UVC_QUIRK_DISABLE_AUTOSUSPEND. Are you sure
> that you do not have some kind of daemon in the system doing any kind
> of aggressive powersaving?

Good point, a typical candidate for causing issues like this would
be the TLP scripts which are somewhat popular:

https://linrunner.de/tlp/index.html

Henry, if you are using TLP please try disabling it, or at least
opting out the camera of TLP's management.

Regards,

Hans


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9F2D592D;
	Tue, 29 Sep 2026 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697119; cv=none; b=jQwDVd430HtfN9wMLb4cg1pdr/LXXl4y/bErmvHtpAwyyIt9a2sBWVa9Km5YX22ALSXmwjA9OPDnCdGN0aaV94+J9Bwr3V0ElEdzCnKTDYNl1zZNhDXoysJQyrCWA1GXUHLFsXymD5RjMEhLZBI0u80XD9f+xeM+JExqYkZYTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697119; c=relaxed/simple;
	bh=w0H9AgCIDSOYnHeOg7H1/u+5oD8WeVajZbmfMOihN3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAexDNwrE333H42FdIlyiY+6oO2sqeMJPZ4M55BbWExs57AB3xJyFuCdFLEmpNrQ2ZVAmarZ11ZCZqesc2DAQjvwEnlmZnyLWkiUeNV2fWmyg4tTZpNXMVPpfqVSrGSf/Y6MnZDCCNvSyiwDBGIRvicxtkhWNNEQBz7u2VpQF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0dQO+w9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0dQO+w9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A221F000FF;
	Tue, 29 Sep 2026 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697117;
	bh=D4ButArKtQnl6U2HL/VNmx0z1fOubqFkLGC9RJ04TSo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K0dQO+w9AlWByAMa755xbocemVzVAr5S6frimmsbsOb0OOnKVdFKdexe6Jre06vUj
	 hW1S411YgLC3tge4EMXWI4CGS2bHBh39aXLkll6upBBmlOG6hj6RhtDramWkWncRnz
	 qdrDY2sPVBOP5XiljP+OSTZ6Q5myNPw/zAQ/+/Zx5lVWOO2TXN0qGgsnkVLTLxQtPc
	 cTLOiOxsF/dXi0pt515thwaLzey+cEb47GAZNKikClf5MpWV+jBnWlvbcJivm/PlIV
	 Z3M/cv7ZW56ZaBgoOGcM/Qj0YbNYcmQZ/j9unvNed1+aB1Y06NuaRP8QmV9aqk6Rw/
	 SXYx/yM+Jul3Q==
Message-ID: <dabfa389-6bb1-4884-aede-bc7b7969bad8@kernel.org>
Date: Tue, 29 Sep 2026 17:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] media: uvcvideo: live pan/tilt/zoom readback on
 OBSBOT Tiny 2 and Tail 2
To: Michael Jordan <jordan.mymail@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260928215021.819064-1-jordan.mymail@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Sep-26 23:50, Michael Jordan wrote:
> The OBSBOT Tiny 2 and Tail 2 do not set AUTOUPDATE in GET_INFO for their
> pan/tilt and zoom controls, so uvcvideo returns cached values for them.
> This series marks AUTO_UPDATE controls as volatile, applies the flags
> fixup table to all controls, and adds entries for the two cameras.
> 
> Changes in v4:
> - Shorten the commit messages (Laurent).
> - Use "Assisted-by: LLM" (Ricardo).
> - No code changes.

Thank you for your patch.

I have merged patches 2-4 into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

For patch 1/4 lets wait for a new version and see if Laurent likes
that better.

Regards,

Hans



> 
> v3: https://lore.kernel.org/linux-media/20260928152416.766957-1-jordan.mymail@gmail.com/
> 
> Michael Jordan (4):
>   media: uvcvideo: report AUTO_UPDATE controls as volatile
>   media: uvcvideo: generalise the XU flags fixup to all controls
>   media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
>   media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tail 2
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 126 +++++++++++++++++++++----------
>  1 file changed, 85 insertions(+), 41 deletions(-)
> 


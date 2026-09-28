Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36144DEC0D;
	Mon, 28 Sep 2026 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607322; cv=none; b=Gg9B45yEL5A53uXvPIXgeQQKd2LEA1LZbF+O3CLV2W8LEMKcIc5K4V8BibB5hB89sjJ0dc0j4WD20SClorCXNgJyfgyWi4811fGXZxpJ2aL1OeU+vWoD1bjzkvDSfg0p4UX8IUTCNnCFAFcUwIGhiGen/9465HPYB5X3SLkZeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607322; c=relaxed/simple;
	bh=2F/N0QY1osdQhkWOHUl7fQDIFPeHSRPiIzHiWkV6I30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoPFVsgq6YiNXf650bPqWQe8bp3BtUN75GtiU9SdNUR8pRgrQ2yfe1UgHcucRRIGKtsmg6MTqttFpmr9wVoAd8ISTGSv8tMWMl+jyqREPYOKwZqlAtANPiZIjLfjDwHcKp/GAT0CDanD4JEmisB8olXNOvutczgUJVSA7RrhFiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lP44yQ99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lP44yQ99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC1F1F000FF;
	Mon, 28 Sep 2026 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607320;
	bh=A3m+xWdKCTU42CaOmSG74OzeVKz/VUuzoponKOs7Wo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lP44yQ99/ZZJDoYa5nDyB3Ebeisvw36hpwyjZzKB5ApdCwSB0jvRGhOMc1142mm0T
	 UHeuk+lStAMkhaCCEbI39iVp4hT4Z4NDdy5y2jwbgPq6u+IJHcDIS2eRm2iOwUv3Av
	 KcUfuRKrHbUanIygL1UHN/OrqO0MMJZw2zWWK6x5AiF9RSQnwteo++uR4H2YJUbs7y
	 cYC8TKC4MBCx9SKG5Zi8IIVtBOat7ky1+r6l6HXjPwmlc3O0M6+tT3Lb5HaGejs7Nr
	 TqSt/qCqDcluC4tjCvumVDRm+slJM+0oTs21R/qG5z+t6yykiQSttCUxh/7mqgle7h
	 22dmyD8CN6FUQ==
Message-ID: <330448ae-3496-4489-a8fa-332fab02adde@kernel.org>
Date: Mon, 28 Sep 2026 16:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the
 OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-4-jordan.mymail@gmail.com>
 <20260928115713.GD157191@killaraus.ideasonboard.com>
 <20260928143448.757683-1-jordan.mymail@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260928143448.757683-1-jordan.mymail@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Sep-26 16:34, Michael Jordan wrote:
> Hi Laurent,
> 
> On Mon, 28 Sep 2026 14:57:13 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>> The device implements an interrupt endpoint. Does it report control
>> change events for those controls ?
> 
> No. I checked today on both the Tiny 2 and the Tail 2, with the uvcvideo
> status trace enabled (trace=0x200) and a stream running so the status
> URB was submitted. Neither camera sent a single status packet during
> commanded pan and zoom moves, or while its subject tracking changed
> pan/tilt and zoom on its own. GET_CUR reported the live values
> throughout.
> 
>>> The vendor has been asked to fix the firmware (support ticket #8220,
>>
>> Any public link ?
> 
> No, sorry. It is a private ticket filed through OBSBOT's support
> channel, which is the only way I have found to contact them. I have the
> confirmation email showing it was received and is awaiting a reply, and
> can forward it if that is useful, but there has been no response since
> 2026-08-04.
> 
>> This belongs to the commit message.
> 
> Agreed, I will move it there.
> 
> With the Assisted-by tags and the shorter 2/3 message, that makes a v3.
> Hans, let me know whether you would like me to send one, or would
> rather fix these up when applying.

Laurent is also merging some patches atm, not sure what his plans
are for this series. With that said:

I plan to pick this up tomorrow morning, if you can send a full v3,
with the second cameras quirks also added as a patch 4/4 on top
of the updated original 3 patches that will make things easier for me
tomorrow morning.


Thanks & Regards,

Hans




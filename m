Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841897;
	b=1om0f+bKhBMh7wFC4I6D8FKDMsEW0o5dAvNFW0/aJ2XnKprJhJTAs9tWiJtjqY5J0rxv
	 6JjlGt2GVTDbH9X9c1d3k0uV0iyAlnHwO7UXtyBMEFBUs+FMcFNoJiVSpmD6kJUtLlb3Z
	 hCFCjZSFLWYjdfftA7tPFt9tmRbdjsnAVZzDv1sFvqurlzOzPT9FNgdItZh8ENDKTWGFD
	 KrONqYeCyPWoji8ylvgSGnTlLoHcRuTbzyeuC+WgZPdmpHw8ua35o9g9NSFM/+YzphDjy
	 ytwtTowC+Yp0dsspkcjWDlmAsO+GLm5lXSSiJ4IO50AaV6xiOtOZU9jl1ji8qHm2Xmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841897;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=OhBxQLyc+UlBggGXFY7J26oX5udFii//2UhfOrNq+7Y=;
	b=MRudz49rXM1dEG8FubfPwzrwbBUYwOSwDxIhkbrp8G+87BPcBwUAO96sRkl+kZjvNSJB
	 dvVklaVEQ7nIsNCOQQRFFoJ3p5MSF3F3F48OTSv+Ek/QklEaTVOBHN1vGpxRs3GXalPw6
	 HqOIK/dqoxUJdfJ4iBxnPddSZPn2K2wGSpK/zZvHQ+gxbwZvRfPZmHc7TaClOhU5+EZYw
	 iir1/hsN6RBfJAmpca/CEgxNrwl8MUIC0KDlTEAaJBF2Hvrgc/GCFQZTmbuzbSZ3BqmWT
	 nuLS6wbMlyoK/efyfBqg/7e9Dsi/Ky3PVLJD2WlHl1jykEcCeT0vMLSvQfOLwdyEc6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=dz3C+ckR;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AF606A338;
	Mon, 16 Nov 2026 15:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344AF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=dz3C+ckR
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jSrtD45y6zKr5l;
	Mon, 16 Nov 2026 16:11:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794841892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OhBxQLyc+UlBggGXFY7J26oX5udFii//2UhfOrNq+7Y=;
	b=dz3C+ckRStHyLkCMfLmW/4CK1Xmgbb+eFk/94WfAaGXVpUpUR4aKY6A5P3q/8ahuWAMGQj
	7ToxXzmG2qe3fWpiHawprgr9NUptapCqMPcjyLhBGtG3tyXPAmYzUO3gD77apFmbnWUD/6
	Jy5KVpPUQ8GN6v/Jc7uAOvPxuxi2gDBCFAFBqxQ/qWkjbyPt/PzG5P/X2cS0IPY5qQEQ5L
	Zeg55+Lbgt0TPDz8dXXMHaPhQa5ij3bAVk5jzvCiTzmqrVi0dXOrIGEDK34+ziJKNHxK1O
	F+8Bhn4EGXcOOh4pANzYOyoc21XAp9k/6pFrKvwRApclYUPWSyxQy3jQM+TcsQ==
Message-ID: <fd24b5f7-52b6-4e6f-a0e5-32ed29683a87@mailbox.org>
Date: Mon, 16 Nov 2026 16:11:29 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: doc: cs35l56: Point to kernel.org firmware
 repository
To: Takashi Iwai <tiwai@suse.de>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-sound@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
 <fd865483-1485-4042-b938-2012eaa65043@mailbox.org>
 <3b620222-ba1c-4c6c-a06b-2dd5fb391fb6@opensource.cirrus.com>
 <49f749ff-8d34-4806-bca7-403005600c0d@mailbox.org>
 <575412a7-9f7d-47af-83b8-a0933b4c729a@opensource.cirrus.com>
 <87zev9x8jh.wl-tiwai@suse.de>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87zev9x8jh.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: fd37157f19718693fae
X-MBO-RS-META: usak8cirobmjn7ei6rakn863htj8bdck

On 11/16/26 1:30 PM, Takashi Iwai wrote:
> On Mon, 16 Nov 2026 12:26:32 +0100,
> Richard Fitzgerald wrote:
>>
>> On 16/11/2026 10:57 am, Marek Vasut wrote:
>>> On 11/16/26 11:14 AM, Richard Fitzgerald wrote:
>>>> On 16/11/2026 9:22 am, Marek Vasut wrote:
>>>>> On 9/14/26 5:12 AM, Marek Vasut wrote:
>>>>>> Use the primary mirror of linux-firmware at kernel.org.
>>>>>> No functional change.
>>>>>>
>>>>>> Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about
>>>>>> Cirrus Logic CS35L54/56/57")
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>>> ---
>>>>>> Cc: David Rhodes <david.rhodes@cirrus.com>
>>>>>> Cc: Jaroslav Kysela <perex@perex.cz>
>>>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>>>> Cc: Randy Dunlap <rdunlap@infradead.org>
>>>>>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>>>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>>>>>> Cc: Takashi Iwai <tiwai@suse.com>
>>>> ...
>>>>
>>>>
>>>>> Is there anything left over to do with this change ?
>>>> You should send patches To: a maintainter if you want them to merge it.
>>>> They are not guaranteed to see it if you only CC them.
>>>
>>> Who is the maintainer in this case ?
>>>
>>> I used the get_maintainer.pl script which should have done the right thing.
>>
>> You have the correct people but you sent it to them CC: instead of TO:
>> Takashi would be the best person for this.
> 
> It seems that the patch fell into a crack during my vacation, sorry!
> Now applied.
Thank you !

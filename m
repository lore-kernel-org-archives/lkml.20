Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0353955E8;
	Sun,  4 Oct 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791097676; cv=none; b=VwqCLc68duOgO73RC0xWVwdBDKEy/EBUN26vE59nOq2GsI839e2NG8HOmkRslbUrMZhXRAw0Dj7mXCyAzmTKrHNl2nci1rCvnIhdtNN5qJ2rf4DdQtsctoQmYJRzDldc6JUHJcrOq+bHZURjbJ0pjtPuattODhR8VS8oVvMCYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791097676; c=relaxed/simple;
	bh=ECAV9gWPwQI8NfivQoHyKEHZEuCqyZ8f9ZPgCVJhmuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a45tU53rtVsiogEFtX9Ocs45C111eODXGZQHyDk7Av6RFqc8w7Gc4EGuuVg7aRW7Sabd1zdW2JleHddG6j8QfuKIOUefJriY1aKx4XDlUIoyXkoEwV/Y+SNsVdoHdvL3AzTm9IEZ3gkOrLrmb/U4QwTRpvMWiOg6ehemFgthZD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XkY97rpg; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XkY97rpg"
Received: from [192.168.178.20] (i5C75F769.versanet.de [92.117.247.105])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 412282FC004A;
	Sun,  4 Oct 2026 09:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791097670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw1EPrJR3xdIYEUNJeJbEYKzSm9jXp3V6frtK86JaTA=;
	b=XkY97rpgIttQk+/r+rsxZcv8+uFpJ96MAaMZ52G42fbdeHEYFSZEQ5XjQTpakTs8H4frzK
	TR+tL0MI4zLlAbpoendDGGMvwp5CIFP++PAw73EwmVCo0ytGAPBONdhwoo8Ddxtjd845fj
	G+BbU6yvTEcBXpjGS7QKg7vlhzXMI+M=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <72bbd640-8d3d-4645-9b8d-79b6715ce28a@tuxedocomputers.com>
Date: Sun, 4 Oct 2026 09:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASRock NUC BOX-358H
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Eckhart Mohr <e.mohr@tuxedocomputers.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001183403.103990-1-wse@tuxedocomputers.com>
 <87ld8fxi1j.wl-tiwai@suse.de>
 <80121f8d-c272-46f8-ab8b-2479a70c0186@tuxedocomputers.com>
 <87pkxqvv4d.wl-tiwai@suse.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87pkxqvv4d.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 04.10.26 um 08:26 schrieb Takashi Iwai:
> On Sat, 03 Oct 2026 22:40:40 +0200,
> Werner Sembach wrote:
>> Am 03.10.26 um 11:14 schrieb Takashi Iwai:
>>> On Thu, 01 Oct 2026 20:34:00 +0200,
>>> Werner Sembach wrote:
>>>> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
>>>>
>>>> Fix headphone jack detection for some devices
>>>>
>>>> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Applied now.  Thanks.
>> again i forgot to add cc stable
>>
>> can you add that in your branch?
> Just send a post again to stable once when the commit is merged to
> Linus tree.
ack
>
>
> thanks,
>
> Takashi

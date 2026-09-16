Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D5045C714;
	Wed, 16 Sep 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544615; cv=none; b=stnoignM5ZmI/QCva11R8mxsWCXNDfnSxpDPj2utjfdt9PLF0EE6cohY8nJ6y5LjBbZ4IgqXz+nwT7mv/s6O0gjjeOeUn6QO916iVrgFKTub0NroOlEJWHGm+y+p68gfth99Xq3rftzlzTXM+mzotcdhSApHMbVTieBGM4Mk/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544615; c=relaxed/simple;
	bh=rzRL3OyhTcnufJt3pvWkEq0P77Hr+fA7mcPihIjDB0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m09MSU7PnK1L32C08piIjUDDij7w8fjd4xmjkwLvW/Ir4nNfPGTIkfofOnfIeY7PShNmBgoK1DQ/4ckr+1P8vkYeLyN/g7Hejm4GOUzSn/j1Ft7VvR8u+bluHqrRV/7ksAAbqPJcVXp4KchnJZxAycR91/CdIy3GbrSNcgjx5LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=L/r8qrzf; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="L/r8qrzf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE16792A5F4;
	Wed, 16 Sep 2026 09:43:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789544600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ttF87G2qEt6DPtDm3W8hI21JToURDEmqGv1ROgC/o+k=;
	b=L/r8qrzf19qRHtxzL5rM4zRoIso1CgjcRP4weZvDInZ9Om6HT5u8QHSS6HwE55Jh3GJftK
	INMiYNNMqHKtwZxNmKK5oFFnX7fhDOf8GjQaAdcDFNvoF+sGwy7l8nmvhH0hXyXygsEfb7
	q59M7OX/ejIiCJrl7g5nmVaExkBXIwowWJ62xe5mdE1u6lU1CQa9Ih6fdrVIK5QS0lv3+A
	q/1b4/XqVjy6xtEbKoZjVPWrHjn6U+JRS7B6OPqMEy5816YKp1CyXGtVzC/tnTX5zdNgOF
	3JgbHPZeo9qciDnSncivQ9OsH50VGMjaUvdnzUBz2/sR1XASvygko0eykGDoDw==
Message-ID: <da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
Date: Wed, 16 Sep 2026 09:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR
 and RANGE
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, perex@perex.cz,
 linux-kernel@vger.kernel.org, tiwai@suse.com
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
 <87bj9yn55n.wl-tiwai@suse.de>
 <59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
 <8733vamwaz.wl-tiwai@suse.de>
Content-Language: en-US
From: Zipdox <zipdox@zipdox.net>
In-Reply-To: <8733vamwaz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/15/26 4:19 PM, Takashi Iwai wrote:
> But your code also blindly assumes the MU_MIXER_CONTROL that doesn't
> fit with other units like feature unit?  I guess we have to set the
> proper Control Selector value depending on the unit type.
> 
> After all, this is about the correct setup of wValue.  Let's try to be
> minimalistic at first -- just tweak wValue in get_ctl_value_v2() and
> snd_usb_mixer_set_ctl_value() at first.  If this becomes too ugly, we
> can think of redesigning.
I assumed that mixer.c was just for the mixer unit, and I seem to have 
completely overlooked the fact that that it also controls feature units. 
I'm not sure how to proceed from here. Do you have any suggestions for 
how we can store the control selector in the usb_mixer_elem_info struct? 
The control field is presently used as the input channel number, so 
maybe we should add a separate field for the input channel? I think 
maybe it's better that someone else fixes this, I'm kind of out of my 
element here.

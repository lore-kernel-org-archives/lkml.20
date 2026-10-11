Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302C361961
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746930; cv=none; b=XAU8P8KSWndnbDD0Fm/txZq8wKABgLidlnr12KD4YdvkNFFGVgJxYPIKwA+jcQxc5mu8zzSHQQK5rAF0xwaNG0GVITAaLL4NqdWHELESddt1aa0/FJmaxa4V8EURi+WujXqLN7g4WDOZfOH0uNwdzvGN/xtzjEYP/qqdsWFA0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746930; c=relaxed/simple;
	bh=QSznnEnpdQVi9WdrWsn++f0OiYNOnZ2QGWOMD1egIC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRPk2IpbUiIJrU7ALkKHrvjBjCOzXUSFSIDWaOGGbTNzGfIb4vp8kfB/KhuUdThxycM5e/3ft461zcSoRFet7+d2dZcpCwOmzrj0qDKqk+sOzLaFlg4llx4oArVTt4SGKV8JrUntliUjNlqz/csxua89xXkTNKHEAnAZG/Lw3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOCt16J9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOCt16J9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c33bb2f3e6cso112105366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746927; x=1792351727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=suZZR6RHE7rP748UZ3zwlAVii9ohslanZfx2IvpYQCU=;
        b=KOCt16J9n1epj/mW71+bxjcuvn7M0Bgip5Dye622mUZhwURjNWBte2A1+6yP7OTdWF
         +M9ytITOvBMLKn/s1StgUNS2UMLFxGHBilwHwNipP/JjOyd+f23Cg2tOysZl7ivXO9Tc
         74x1zRLd4Bqev/kFTL6poOdqSHDkAiACMfyS9GM4KpdaS7PoC2AvOmGwt4cxRQWeR+qc
         mwUXWwB7V5uWnMm1kNA1TL2uEIyghAnyS3fGE6SmxxgQSsZe6i52No4U/dD7ovzaW28u
         7dPRAvZs21FpM/YsvSrS0UVRa8+LGNfyj0Q/91QJNGYU99RaMmaKKR6zGGQU52J/r5Sc
         Z2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746927; x=1792351727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=suZZR6RHE7rP748UZ3zwlAVii9ohslanZfx2IvpYQCU=;
        b=qCYvu9nSfqBdSIMygnYbOYxLgs+fEjNqvr9WEO54LVeTSMC2VQeRTdyk0qiOv7IkT8
         DSghvTDCPpgtaTJvi29J6rHrw5v1VvO+ruNk7zr6Fv9oRz88G4SScaFVB1g8W8WCZ7LY
         rnOGEZ50dV8HuFNxE0CbVYazP5UQT0eqTohgytyQOoosTf9f/eQgSLFgJFotX/2iWenH
         Q3NUjVyeq326I+LUWqS6w8sPKROqDes/Glwejq2zVtP+T1uKLv6QF/rmq23xvVl0fDIM
         dbTtSh6SKKOHRawwfT9k78UdGOJORRYP6jWpaGzTsCBxTwh/h8mJg3nTE0ktgx6KbyPO
         0vBQ==
X-Forwarded-Encrypted: i=1; AKwUvBypJl6QJuYJAhpWVig5yCL/x9l/WSCGy+NSvR+ECdznqcQeNFOzq8DoKOApzE+Nj7FvqLGgVDkNG/YGuDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSHwY6Z60NpldurMmLbP+8k/BTipAOrrJx8eO1w0qH0dr//Xv9
	qaZlhzO7VmYa/4QiYk9G9NWEkIwAbMQIdt0ETwNN+uwLOokNW3wTFdAd
X-Gm-Gg: AYBFou3C35UODB/D+FIm5/fcRcmyKHQuXwmot3CIRd3orGu5+vr3v2yPn8bIB+FC46x
	OW02ZbCeSJw57kCBAp6IS0y9UMxWMxCjtm74Y7h6uCmYha7FMJxwiZF0PVgPXsjZ1txdG5+DFY1
	+Y6qqBigmC3lV20vKdTHAyOhv13nKa2ICxN5EU0oKIEF+E2FXYE9AcRNHZx3BxTkJ/N8Z7I3d7n
	L/jFid4O9DJ9OPdODrqrGZWvIE0f+DuCtLLHiQB00WZclKPic+x4AKkkc5C8fV3Mh63JFTKjkY5
	bO6tBHJrqFq8Wf8jw8tuAvMSChWPIHMh5hEL57mf2cLZw8ruSCALmipKJp8hPhuSEN+LUsBJYxG
	l/osbWT0c3jsyo6nvLG5WYeoIL156iMPRA4PVpcXMReUmqm3Asigy6vB7daKRBrZgLVoVgxP1a6
	IezqB2ilJUHaYab7E/ngCwb+ZimdXNA3k4NZ2PW+0I+k54uPnxNygoGAbn4EjMtdVh2YSlj0hpQ
	9QSViKagvN9mETPRrsKknxsJdsWkGr31NxsVul1WPMX1Zn5jacUIWc/7NHYfGIrjdJVstkw1r02
	PWwBhpHC/qkWfhkk1gGNsw==
X-Received: by 2002:a17:906:f592:b0:c26:19de:912c with SMTP id a640c23a62f3a-c31aa07ba07mr845018766b.31.1791746926798;
        Sun, 11 Oct 2026 12:28:46 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:6152:f99d:3762:f020? (2a02-a466-68ed-1-6152-f99d-3762-f020.fixed6.kpn.net. [2a02:a466:68ed:1:6152:f99d:3762:f020])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm399541866b.74.2026.10.11.12.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 12:28:46 -0700 (PDT)
Message-ID: <2fe443ce-2d3e-4a1d-aaf0-0aef68da4cf0@gmail.com>
Date: Sun, 11 Oct 2026 21:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Revert "serial: 8250_port: Drop duplicate NULL
 check"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 John Ogness <john.ogness@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Crescent Hsieh <crescentcy.hsieh@moxa.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 stable@vger.kernel.org
References: <20261010193755.187706-2-ftoth@exalondelft.nl>
 <2026101151-regroup-caterer-b92d@gregkh>
Content-Language: en-US
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <2026101151-regroup-caterer-b92d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Op 11-10-2026 om 07:35 schreef Greg Kroah-Hartman:
> On Sat, Oct 10, 2026 at 09:37:56PM +0200, Ferry Toth wrote:
>> This reverts commit 7885af04df6e4efd72910200c1bfc079d61202e4.
>>
>> Commit 7885af04df6e ("serial: 8250_port: Drop duplicate NULL check")
>> added `up->dma = NULL;` to serial8250_release_dma(), with the stated
>> intent of making sure DMA would not be used again after release.
>>
>> However, up->dma is assigned once at probe time.  serial8250_do_startup()
>> only calls serial8250_request_dma() when up->dma is non-NULL, so after
>> the first close the pointer stays NULL and DMA is never re-acquired.
>>
>> On Intel Tangier (Edison) with HSU DMA this causes a regression: the
>> first port open uses TX DMA, the second and later opens transmit in PIO
>> mode, producing 64-byte FIFO bursts with ~50us gaps between them.
> Ugh, sorry about missing that.  I'll queue this up when I get a chance
> in the next few days, thanks for posting it.
>
> greg k-h

No worries, sorry I found it this late. I have been behind testing 
kernels and only now trying to catch up.

Ferry


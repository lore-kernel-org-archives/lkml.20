Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC523B8BA4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543454; cv=pass; b=gcNKbZ8hCgpjO7n6LD0vHCBbsB2JwVz+Da1M3YW5c8huKdrVJKjc7DLuwDGg7+3RhM8FKTVDDk40/Md48ds6Psy+82GHTFw0eyJahOKPtmjfVj/niaLysbi/ybDu1/oXR5O9CnhM58td5Eoz59R51fTSGTdaGP82rMjnUTYD/AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543454; c=relaxed/simple;
	bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2ss/KtS9HwBpF2Q2MIhU6xDfn0fgnPJNOCE+8637ZteoZZ0GhqOcgvkoFpwq7qBcduOZ0MPyidkJrfNujCavZ3zRYp9WevrftagnEOSmreMGQ1dsLnNCMQl08kR3/jK3cfZIL10ELyX+6XClqYPQmb4sdCO1/Q14KNH4RApZBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSwhkhlf; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSwhkhlf"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf5e6878fso2781545a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790543451; cv=none;
        d=google.com; s=arc-20260327;
        b=B1rAsAXeiUrNpUnPOnW8/+2XjES9kZ1Kbv0NeJjPHKtoZSBukJ5WuVpyiguvjoC8Ab
         uR2Is1xuVzg2Ms1hdL5HeOo/bUZ7XWtSaIuMTadV4tNtW4pe3ZjCYuVKWnDvZbH9hAlH
         IFMx2RDMVnyr1cnBImvhwIzaNkfqp4ioqmcMu+zuRFLo9+Zsygdhe31ye+VCd9FKhQM+
         Tx+ncdcWFbMqGEpEhgycVoQJ5u9WNqKNB7GKpwQU8XPQMmhWfySSSb7Aj0Y+4mIkFxUb
         xBk/brj+kjglV2fUyxTytzmSegESR43O/xx3NLbh/f2QbM1Dba04qj8kD4tq6tlb4eb/
         1rKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        fh=+pWkdTOj9PztMF8ZBUMa99gXKxqTIXJjfrJI+Q9YVvU=;
        b=e0GHOefCSfWMDbA+F36natFPjzdxoIDeBpVvJZEjhdO5AnMMP7D97gzXeHdBhWp2aL
         w92+AGrZtPUyGrHlInU5ERZpXTvIR0PrWXT5aSeATZoNDZekgvTk48k4+CUFckwNHQPC
         rY35fATaMZfvEBOKfX8MuX49VwVKSyFPCpL2IUeP9BJIQOphj/6MXzPH77vgDY9AFbKv
         HOBdjFZNtbshvqQng0bbbvYosKwzdv8F5lK9+ODz6wYjF9+1Xi2oXlOi6zuO0L2jQL7d
         u41TK/l9Hk84tOgMMp4dtWuChcigKoYHsprUXlWZCDMrlhANRrKmign/xn5K5CTnNzOF
         oQ1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790543451; x=1791148251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=oSwhkhlf5AxBUNHBP9ueBnjtMWNC2CFksnniRllzgebZw6iCtl3TTIv8ZjsUMJPLMh
         Qjse3mO5n1MNPjgtM8Hjq1jtuKXq3f/q+IQisE0iw2DaReXegMd1x8v0YHfI5Jh9Swy1
         QPGfOlkjzkdvHoz/lSbRY2+l5s0Y4EF106rQ5PqTGflvvJFlesu+WqE1ASShoRFvs96+
         Szo8TF6uS0yn3ORZTPuHe6aavRYQTp2CP194yJYPbKi7hvFY+unI3RHSRlJFr+kbZ0Nz
         EJ5IieKyOoQt1qfcXBbI1NiR6FEjoTEM4Qfr0eg6NkLhsUzwuomQw0cxyvtOfzUrQ6ua
         xbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543451; x=1791148251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=X/Pswlk7zZixOm06OlCb6EmOZ7DGr39UZ6qfFSJW4nCISTO7TELVEDeprMgQ2VWzA5
         3/eCyXuJ2RFQrn5dUJtsMJeIGtBMdiDTjR0sA+MgcgxHzraTUaAqI+q3Moi6frItFlnx
         pG7YqO5Wq5UzyXaId/4wN3XeXJ/z2njgyYSCEMOnI4MAOOodORFZHtKwSZYOa2bvtUBH
         Sneeuvx4B/pFBIJu1ULGBANLKLRZbRTg3ROFNOhCtUxLo6HLfPRTufegpyiKRDbse6qF
         gL8nL+YTJ4QLGrB/bSfLaUaI7Oo274GubORn2WEGuwA+g1BtkZyHpryxFOIPcu05bx6F
         i0ag==
X-Forwarded-Encrypted: i=1; AKwUvBw/MM3YLnMmZ368uxbWiBwZag28xiW+tC09Dk7scqp7uC6Xtls7zWoZgROpQP+/LUN2YxI3TCbkrZUPkNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFo18pmDvw7fgViO4dzBLNaY/MROjhLKiXW6IFrSWvtym7vJFg
	uDUM80/s4CpDoW2cL7RxiwOKE0NwpBQiZzyKRa9FqHE1dCp7WQpuF3oFC/3Cz9qr4N6AiYjAxGO
	q0iAS4Y/BEFS9Adep7Cxtp10RwrNMsHs=
X-Gm-Gg: AYBFou0Wc9Cr2W/56HN8lpA59HpjIZWYVFCCU93kJl1ctfcOi4fvO4uwsiM4a/bXJgA
	g854zRvJ180f+vOcDNF9rhvNWE9/NSjT4cRUDZrdDjsnU0QOjNlB06B1qw9erPInD6zuKlZWieR
	FoXU5zdMLtre2Hwdvg7E8mBCLhBQ+8w8xLpa6VsIbJxz5kkBuPdasH1FjnOs2Q74HEmWeR98vM6
	IgkRz4xUZ1wyP3SSfAwk3I3VyxKg7J1ixztB9Y5B+XWsXfRoAcGDAzne0ddVcgJOd3aPzwlOseM
	41QZPS9AKFN6xEW9pWCX9xupLgSRJkRk/zPl3pLzbrNT8OAcUB0srjuIJ9iPIXIf8XZpu8FSrgQ
	wWGfhh+DjhwMPHUEVbvLkOECgTeFpjVrefPxFWHqhnpoarE8N9YLGmOyb9VE42ULYunDtbeEdsy
	dm6RZDhKdr20sQgJxmaFLiQvdLTh/CPUnnvGO/jGIkAk9QP9dgBecWcawZNRkCNrad5A==
X-Received: by 2002:a05:6402:1e93:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6aac8ecf40cmr8425968a12.8.1790543451233; Sun, 27 Sep 2026
 14:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924233831.127617-1-rosenp@gmail.com> <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
In-Reply-To: <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 27 Sep 2026 14:10:40 -0700
X-Gm-Features: AclHuK9nXtwhKZKT8OEvWTXnJF3sAiZwWnAZputjHhM41eg1WXS42W-4ztR4xkU
Message-ID: <CAKxU2N8JeJi=cNkXKKdCS7HChvhGHziCTz3j-wm27Nr04RMD-g@mail.gmail.com>
Subject: Re: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/09/2026 01:38, Rosen Penev wrote:
> > bcma-hcd currently drives the USB power line by grabbing the
> > undocumented "vcc-gpio" property from the controller node and poking
> > it through gpiolib. Besides relying on a non-standard binding, this
> > cannot work on boards such as the NETGEAR R7000 and R8000 where one
> > chipcommon GPIO powers both the USB2 and USB3 cores: the two
> > controllers each request that GPIO exclusively, so the second one
> > fails with -EBUSY and its port stays dead.
> >
> > Instead, switch the driver to the standard regulator interface and
> > express the power rails as regulator-fixed nodes bound to the
> > chipcommon GPIOs. The regulator core reference-counts enable/disable
> > requests, letting both controllers share one GPIO without conflicts.
>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch -vX` helps here to create proper versioned
> patches. Another useful tool is b4. Skipping the PATCH keyword makes
> filtering of emails more difficult thus making the review process less
> convenient.
I will make this change going forward.
>
> Almost all your patches for months now do everything to escape my filters=
.
That explains a lot.
>
> Best regards,
> Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794736046;
	b=J7nuXO7aSsBDIVf9cT7pbnd8j4wyw9W8VPlsBv3F/84a2slS7LlTTgM72jt2Wp5HpZRi
	 hrSxHKYSO/mZR5jj2ToCbhL4iYZFoqioTw46TAWykSVNvqUOh2nw8bUd3D1EzMPbMbBYE
	 eOxolHN9ITyj+8ggerCrK0P+tC0v40mkM097H5nilbAhF65a9IJtxssQRWVdzPnS2XNoG
	 aiShH1lJkTDlVKFfs22u+E1DEBIeQxCSU2rlbCwiJG10EgyrgMxITaxUjqaWwhDElrV7J
	 11nzg59UJ4Y1/grY9wnbEfi4yBMtb5OjgBHfYUBKqoxzQwN1wVIYnS1T1N4QLOMbhQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
	b=uEAZfqwhmws03uHGvy3H95oedv4HS8nxAxFJjPCrIasxBiMCAtewM/VCIjIV66HProt2
	 05mkuI1JzP8kles4DsEs8nT3yn7U2dCCjmk5iJq8VA6rt1WOEgbbwtPQcb7Qz/nH82YMd
	 MmeC+wQwk/eVHVC3PzffjcqnAmTo2n/kB/vdozR7Wr4zicoeDcA5bRGWFPLkUaqwxr1KM
	 27YdYGN9QVEpuG9CiXF8TqMnFXve8Cvzb69OD/KFiZTfydHOLj4lb4UGpAhjKLZFZY3IR
	 GML/QciReeWxwlTFXXwlB9RZhHcG+8bXdL4Ks0WNdxEotPqgAkl8fZEctOPI4ZjCCqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULcSl0tj;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFB606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CFB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULcSl0tj
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso327627a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736045; cv=none;
        d=google.com; s=arc-20260327;
        b=WagcvZAI9xt9NgVX5JAL5ht7UCqzEvFiY9rirfjEpv2SvYgwBA8QHyfCoXt7NxZJMD
         N0ElSXnE6VJWVZRMuLLaMBsIomavrJDCVKW3492ozYA5C3WgpAdixoQdwTVHuD5+GZI0
         rrDI596Onql4MXmNN8T44MispG4Srm7C9pCHtWHTLdfAb21QiJIcmLs4x80XKh5lSB2Y
         nvUgQQOiClwLE2GYASrXbQvz7XcXNj0+Yv5/ibypMPU3Mn8jlP6C3BfZD4ZjLBHBIrWN
         wPYGC6UKPqjGpG7XmIabzwpNeKYkSSH0IMFyskzWTfhsv43ru0rlYdPMbzIS8nkNkl+i
         9omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        fh=wnX6Kxy941pc9oWioGQcwQb2nL6RbrpcGnsxvGBzXSE=;
        b=ZB+u9lPiipn66wOmx3NXEyARAbFsLUYYyuS9zLd06gGhynbdTD4VDCfnfY/P7Kt+ZP
         uRtfQsgJxyeQ2whHe0bLRYerPhA+7l0IikX72ZxcrA9ozjFlYyUEFS62QIICx9YzgLJq
         on1R1hfolzoRMQxQ/Thc9i4Bjtp8V2ZissGILotkMXvqcvEEdW0CwoEOVMtb6Yne/KXS
         /67+5KAXrvhgZkojGLYTxNp8VeVjkOy8RACJcE23GW5dgBnKYHoI2hOey0oF+iLAQTR4
         6jSNTtEaAcNeDlC9ti4a9vp71X49nSJCqB7BpS77rxsy9HJduwdmkAkAZDJlYJV8vi5l
         yoNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736045; x=1795340845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        b=ULcSl0tjXJEeZizN5NqOx7g1xOkL5/p3DgK9rLhn5627DhSN4mIwoV9SIny66Hap9q
         AQpN0gv4ZOs66D+BkwP264e+8bLRMf1Iq5chGtVz5+sOu68ZGxQjSCVPowfA0dy7ca5A
         JlJOfHn2aNQSa/jenvTLj3+qk3LhHZEnWvERYhDUcIzvGioqHC5TPLu32QoNpgxDZgon
         KNHSnjfV25+rIf7/4I2NEIr5MFM9xH23Zh6pV4bOZXDLbjINyX1dgB1+OyJIy8R09gRB
         ZEXxKFcY7SWTMGuHOgXLda+qhot3falzJyzaM8YnS2Av7PPg0p4tlzK0Sc718MjYdLsm
         dZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736045; x=1795340845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfHEYcb2rNE2iyrm94zQquEkhGNgVZsRO7MYguIDjP8=;
        b=q6JCbETV3xP0wnNIb1+iYvBNmZozFfSo8iurPDXrtByOvAgx8aw/gMpMdAIUPsbdjf
         J+AMr/n9GTr12EkazATp6TiocGkKmQirq4+PgdycnADafceujJOoOUeSohxsXNhqFClx
         8pn2zaldIqf/SBWPTeFVj56mkdHXXbIIpSF3yhd5QZXSdo+GoNdp5/nC5dPQ3260urxE
         AvJrUMhdjBxrPwjMlVSSueXXAzFefhSWEVov+EuS7ODT/mrUUS8bPMnnY4EP/0EP5l4G
         W1Hb7bmTkLriY8BYDBphIXNZCpMWpfFSxI5lAS4dBQKWG0MIOCp7ex+4OOv+atiamaBK
         hCig==
X-Forwarded-Encrypted: i=1; AL+hErF2xQq/U9OMSLLYPpYZ2hzomIqUxmqC69GzZFr3nuQS2piv4DcwNkrYKqMVzm9WPMt7y55p7P36FyXy4VM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JB6iw22ltCC1FzGB01YM+NfPDjA1tzA3Z6+9T3x9KsNbcHIul
	/ygVTmCH40wO0QgmwbcjDz+A6cAmgm+X64YXweSMD3iLZsESjHW/kEP+PcHR8rNlP53psP1PHWQ
	O8FBGZR+M8BBpiTSgXbfZy4ZTRzluirLxEfDXAl4=
X-Gm-Gg: AYBFou1jgjp04IlS6y2X3X6QDF2iZnZwxOQQR+nFMf2kJRzAfhXRjqR+7hF+JFKJCPS
	4MvodBCcIfXPt6Rgw691uGVHRU6LrxSQHJTYuRJ1att1UMjwNUVa/n5Dg0uwThFPiMKPEeUUb0L
	xfBIiFSrthvyzDdhCrQ6lhoCG9cHMbF/xFbgbt/hMW5YfYa4mqiqUZ3++SFtH2bdVWZXw1gngzJ
	bgP6cFUvvPQjjkXlg9qWKaAsYLyMjVBQ1sJrnCTCglYG0NYK5ZUl89iRwXToobhhBWah/hTSCCc
	3epdDKtU+BCT2i6cPFQVqj/hfJvUrHYufM5NaP9hZl5cSp9mOyywQJ7yKXT8v9/XMT5L1BkmbzI
	RYsADsZ2cLpQsHqjwJe1Qy8yg87HETu1XDc7nkND29QFYvcbGtm0AImM6/ZjKNhtcf7M88awqpd
	dZSLADbcKAk+BEfxW/hrc2rF4=
X-Received: by 2002:a05:6402:4010:b0:6b7:f9e0:a5bd with SMTP id
 4fb4d7f45d1cf-6b7f9e0a75bmr1572741a12.23.1794736044483; Sun, 15 Nov 2026
 01:47:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com> <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
 <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com> <3f6d66cf-8a1a-4074-a234-dfe571622aee@roeck-us.net>
In-Reply-To: <3f6d66cf-8a1a-4074-a234-dfe571622aee@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 10:47:12 +0100
X-Gm-Features: AclHuK-agHSxMvaTLWSNegaTGKIV9gehw4JdNQIbbkxCi9Nu8UmTXM9oBoYmDgc
Message-ID: <CA+=Fv5SAtweSW61Y_N5_k0ukEektque1gY41LKSjbO0R_4JRnw@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 4:46=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 18:50, Matt Turner wrote:
> ...
> >>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
> >>
> >> Which one is it ? Is it distinct ? A "fault" means
> >> that the hardware is broken/defective. An alarm means that
> >> the voltage is too high or too low. A faulty channel
> >> should not be reported as alarm but as fault.
> >
> > It is always the voltage being out of range: Warning is the reading
> > outside the warning limits (5% from nominal), Failure outside the
> > failure limits (10%). Both are reported as in_alarm in v2. The limits
> > are not in the console's packet, so they are not exported.
> >
>
> This could be reported as inX_max_alarm and inX_crit_alarm.
>

Only if the direction is known. "Outside" covers both, and in_crit is
the critical max (Documentation/hwmon/sysfs-interface.rst, in_crit vs
in_lcrit), so an undervoltage would read as too high. Matt, if the first
threshold in the packet is the nominal, as the comment in 5/7 says,
comparing in_input against it would pick min/lcrit or max/crit;
otherwise in_alarm alone is the safe choice.

Magnus

Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EAA3E51C6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819551; cv=none; b=rK3MQMYEEc7sc0CFI1M041+0CTfzJBJUwuaE2dS/muFYwCtxrHogv6hKnSkY9l81UKoANx9UrS/8dlafV+DofNPoDov7nQDH8zP/YvVr3h6XeXJ1cC6nIzP6PDDx1235cRnIsXGgh8U8jyPR2Edx83Fm+bQeEc0qdwvcwn/SQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819551; c=relaxed/simple;
	bh=rZzR+yf93K+PnGtMcoNVsRJRZznBLNBzioI9OxXIhjM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GpujRF0nK3qvL4BNNW7TpGFI7yy9kRG8HQhi5Frl6G/AX/z+dHGu+3iS2yh60Eo55fBufO0SZotexGHeRPlNGzMIdBrdiOUVvnd8PCa2W1c93K/zjy1CtCUgI1IX+Mdev3kym3GWakMtngmU6a6+mD1TSM9WICjBxdzZIvkzI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxGuUZQw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxGuUZQw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so16171685e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819546; x=1788424346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fx0k7lUgkRvvHF5rIziI+hAaGi/yRir90ddwCyh01Zo=;
        b=gxGuUZQwvCxQZfMarmbsSOw4q0Ovm1xLaQ5E8wm8xdDl2jzw9SIc3n4P6CFakmEPob
         VX4OfYtV7fXCZGh8NhmHq5Ltx5VzJXaaBv81F0gj8gV953K6F9QuH/QKRZR+AVFUl/Dg
         8FcdHbpkxYD1prGNb9i7FFNDp5Jfn514YdGNuxk1mToaAH9aKb/hU5ixdEpMzEDvicwd
         SVydjQrcR0jE4l/n8HZ9hI154vc2z2e/UrreZlXAnF0ZYI9qOOmb1pdxhQE0/mV7E3fC
         lkAtMQtXhxjXNpjVwuEKxCJ3CBH4DY58PzNenru/3jFOdLfWmWUks6P0BRWpvE5M956V
         0qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819546; x=1788424346;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fx0k7lUgkRvvHF5rIziI+hAaGi/yRir90ddwCyh01Zo=;
        b=XLJb9LhVMUu8mKZ6p9qWZnILDqKMr+FeAW5uDBz1HC/GcZBy65j4Imfj8dj7RptuJY
         gqtoQRsBa9WglIQUim5b3HkmDvrfxAzNbJmeuEJ/DyGL0oTzAX3Dwprz78McqchvvEXJ
         1hVHzoUwadeh8WZFVpdahJYV1q4XORpZLrOJOCpES5+ATB3E224PPk50tNcq0+LZ256M
         kwYkCsHUoWs54fv+U+f7p0NIdMjQNYiMLUret412qczB5WoOI3uhGt1bphRKDQw4Caub
         8XliOjUoTYIjzUVxFgLufoLnT8ALSVPKKZbQ0bys6Ep6ehO0QFXNj+7K14s5ebECvE3v
         7WFw==
X-Forwarded-Encrypted: i=1; AHgh+RqXRa7CBssYJQcKNto5chg0tLvdfk3BHXYEEZEFQDk+g/R8sFzy5eYB/Nx4KknE1tnNyS0OdknlXpeJD0o=@vger.kernel.org
X-Gm-Message-State: AFuF++n+7y6z9EsYSzuy/eAEHAtpQo98n9ehFWrnUpXWxWglxa77SQpT
	dUOj5jA4znyAkoFoczcn88vtqLoEn1ViLXf4on2bsYkh1UUsMLGbK8tT
X-Gm-Gg: AR+sD10EmtF0X3zuQQZSF1XGHe/yI0nIM+UeMb9aSxF6gm1bQbDoxt5eGCCwWgH4kgg
	si4o0DWsAwEm4g0O6kwnxr8LVRp8zayWlGn4RhMR8tFjSycfzOhmjQys3riLfr0YzR8gWrj5WV1
	WV4z9attsP0CrgCpedfhKf8S0aaRbmPALitWt+kYGfZZEoknAu2szqGya2LiztM6VFvsaOiy6Px
	zhSWYibIFq4xy/f+lMTt9CcizWJSV58NUukwVg9WYbetWzQvr0afZxm4JUmRwUXQ0MqRbtjGwa5
	9fgs6Hce2XwpTdUaDo4d4ivj6dDD0Zak8miaWf9mgRJmCOwLIgOM1xXkcoJVdgt29xcpQT69B8s
	EzmgMUmF4kOmNcpUMOzvGqiWCrriSRY8fjWeB3Qu3m13zgL0C39T2h4kDGbnG+f3C3AuMNWknDP
	saJrjpMJTt98a11YWyKngKNQ8J1kkdBh63SH/lPNIoGW2ziEizqFVgmYwEWnZHthSXUHnFHpWos
	33hK+esGFayXP9vLUZPItCb7Q==
X-Received: by 2002:a05:600c:8518:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499dc6e998cmr161660475e9.3.1787819546000;
        Thu, 27 Aug 2026 01:32:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c3211e1sm32616955e9.9.2026.08.27.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:32:25 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:32:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] s390: Warn if kernel command line contains
 non-printable EBCDIC characters
Message-ID: <20260827093224.6d4b1971@pumpkin>
In-Reply-To: <4ed90c1e-0edf-4d12-b4d7-d439a8113669@linux.ibm.com>
References: <20260825150840.537653-1-iii@linux.ibm.com>
	<20260826145129.204b6517@pumpkin>
	<4ed90c1e-0edf-4d12-b4d7-d439a8113669@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 16:08:50 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> On 8/26/26 15:51, David Laight wrote:
> > On Tue, 25 Aug 2026 17:08:08 +0200
> > Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> >   
> >> Users may accidentally add multi-byte UTF-8 characters to zipl.conf
> >> parmline, for example, by copying snippets containing non-breaking
> >> spaces (\xC2\xA0) from web pages.
> >>
> >> The kernel will then interpret the entire command line as EBCDIC,
> >> making it unusable. Distinguish this situation from the legitimate
> >> EBCDIC conversion by looking for non-printable characters and issue
> >> a warning.  
> > 
> > Would it be better to check for the entire line being printable ebcdic?
> > All of EBCDIC a-zA-Z0-9 have the 0x80 bit set and most of 0x20..0x7f
> > are invalid or control characters (or punctuation).
> > 
> > David  
> 
> I actually started with that, but this required introducing a new
> _ctype-like table (unfortunately it's not as simple as checking a
> couple ranges), so I decided against that and took a shortcut via
> ASCII.

Could you get the conversion function to return an error if it found
invalid EBCDIC characters?
If there is a single UTF8 character (eg non-breaking space) you really
want to treat the line as ASCII.
Actually you could count the number of characters with the 0x80 bit set.
If more than 1/2 assume EBCDIC (all of 0-9a-zA-Z have the bit set).

(I didn't realise anyone still used EBCDIC.
I guess the unix implementation(s) use ASCII (otherwise too much code
is broken) but the old IBM OS uses EBCDIC.
I worked for ICL for a while, their old 1900 series (from the early
1970s) used 6bit characters (4 in a 24bit word) that were ACSII codes
32-95. The replacement 2900 series (very late 1970s) used EBCDIC internally
(I guess because IBM used it...) but all the peripherals were ASCII.)

David

> 
> [...]


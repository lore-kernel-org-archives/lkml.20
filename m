Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172666;
	b=pWCaxdUG/jY4vktAoyDBKMVv5OyPnKee/m6aHPB0hcXn6YF3Fx7HWm38++Nh14Jfd9et
	 Bc3LUgz9AQ2KozCL1ZCSM8BeeTMuaODDF2n2y6ZhSPM1cPX4+YUIu7qgCdXElgcbiHkZn
	 BS9bwgt5pCjuUwCnY4eX8lR5GzBcMa9jLnLjjs8FSsxt1OWa6qxeYHGiMmFh5y98lNXMI
	 e5rie9UQGqM/cM6t1s7O1kviVL8R46E4C7r+Wsfd1XVxtKl0wESU6tIEVDxL/tTrrGgVk
	 VTkoSWbBCpLC5kW3YD8I32U+URkcfxqIpvPnr9eEnYl0tQyovUenJcrLefwvr/FqbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ao7rOsKShLgiCy/N5eSfutkWueG04r3VMlQ4Gl+RlVM=;
	b=buj8XCXKGl8s3Ds+IT2ybpvIT3aibCxx4aj8tN+uifu+BA1cyiXFlTRcen7OaIvOcUBn
	 UAMCn6+MBmLkC/MeeelBnsTxbzShqTi3TfFeRy2azvco1OGWyJkHZa2XhCNUz9geufdvy
	 U9MctOQtQ1k2qa83V2UUdFD/hlsncfWiJ7jAUgLcia+WUWr/3SprZwZxgjZU1rMudSlOF
	 2vxp3zAEp+h+upC6pVQiD33YqdNL+kx14vfFibO5zX9P/mpfMRhrutDPk0WfrwIv8mjGK
	 MUnAHO0CbrWx9MU7RgHP7rPXBIta0uD2Sdq/4CbWNStoi9kVJpwfhEAdUk1ycq0mYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B4VcI/HY";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11545606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11545606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4VcI/HY
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2035635e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172664; x=1794777464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ao7rOsKShLgiCy/N5eSfutkWueG04r3VMlQ4Gl+RlVM=;
        b=B4VcI/HYe8DP7SjkI4HsU7zsiZQRdb8IaH86C81zOWQUFX8B+gM+n1LvK0ZiImpPNk
         zLffxuZf4rc5u0bXo8Dt/cXxNIzhhC87W/Hdp/uO6ttqK/Ow8xFWCUVObZPPThub+SIe
         4PQDX/2mf5jQlnuoWpf4V+3zQ94mtRl+LUznqz9wiRRL5eAp7x7F6uqwI0ShVopbbuSw
         nkD6/Lp7sdlM70Bo6t00X7mU1sf25fGWpSIo8va0Hn0lIK6YMGxmZSn9O/+42CiYzmjk
         +lN6WOGMEMvcgpXXKpeMeqTAxjdZTZFpfMmh3eURJ+ue6a0ZJQuuVQxA7RxfTHw278ga
         C7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172664; x=1794777464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao7rOsKShLgiCy/N5eSfutkWueG04r3VMlQ4Gl+RlVM=;
        b=jAGSJAfWA+hEJbQKknp/m6WkWJQvQv4TonTYhRWWA5mHJ960MV2yHSTPOO1FARNSC0
         1k2gNp5q6cXBb9jorL4Sbe5LeKfHP0rYVIvJdv03UMmziQntBkenpdRCh6FZ8FeUb2SD
         KjS37STWucYSyPDMzvOfYPjFslGBFNV99lyi/OuUfXM5nKdw+ABOW4D9si8oGIEYSX9j
         W4TJjsXYFpRkzsaE0LERa8KwZ3+NKqyfjLJaMdsPnYN3Cf/W+HYAV5fi2rCnR2ZSybCJ
         1CFFeJGiN6jN8HkjRR4FgG26SJMjC21+0ZFakwmJkDFBZKMVGsPA5GgaaIUFrEn1CPym
         P/Ig==
X-Forwarded-Encrypted: i=1; AL+hErH5hiUnpRxAVFpvls60KgRd2L5R0XlhOjR82Sx1/uCmAC/oMvNVo3GmuDDvDTNijvoiBJ3BXa4etazjZas=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NWvNTAwjfkeDOdsk/qgd/jJfszOt0HWXUUvS8Dqqadb0QdPJe
	mV+DLwtb2syeS0PdHpVsV0wt/nXQR4EbjK0juM2sU/cIPzU/sL8DGvY6
X-Gm-Gg: AYBFou1ap89HMXwpeAbb3+LjFVUII17D+NdsdpaLZjkaVGuntMaKq4fhbGsxOr7Yfpy
	5NcGMPPv1Q7Lteq/kpy9uj5G7Pr2WZnavWdshDLHufh09nnHYCGCqmbPOloSe3jfA6UPNPhBkLq
	DnGOdsNoC02/5IKZ/Ef3f6XoaXgE0JrOPev8GdC1tKnWmtOaHl24C/+9nwMoxBPCRyF03A1geYm
	khS63wZLXH+so1QceahRF1NX+Wg1sifM+2HvgjKGKD+2WkxbQon+eH+1lXYJYdmre8Jf+HcZQ4Q
	pDSIjqN5ixVlV49uwQEtNcvgS5GCDmtvgBuH8Uf41bDlyGqyodnCVez8RdBhk/ytq4meLzOovyo
	9XgxczEj8hV8s89lOaFFpax8g+f5YlMNqixmZXw8vq165mVsotvPUoQfQmINmu91um0NfS5FeOD
	/EMAPx524Ch5/WMp5RuBy3FswpdnqJHAF6js8bBthyj9HVYtrvmAUAE0fKKPDrdTUlHWL2wCJ9D
	GaoP2CsCJZ/zLSfR3lKLL0S5SL+nM6durvb4UoIlG5VkwZmmd46pCjDdpbmhZSW72w5rmhrFOSF
	YWUuOFYIk5MUdqaDzOxk16nLpqqZWYaYGtpkY1I0g5U/AXh8tztK0KFsjPZxr949
X-Received: by 2002:a05:600c:8b33:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b963c91287mr40478955e9.20.1794172664282;
        Sun, 08 Nov 2026 13:17:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm299322245e9.0.2026.11.08.13.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:17:43 -0800 (PST)
Date: Sun, 8 Nov 2026 21:17:42 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Blum <blum@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cen Zhang <zzzccc427@gmail.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
Message-ID: <20261108211742.18e4fcf9@pumpkin>
In-Reply-To: <87ld74yc19.wl-tiwai@suse.de>
References: <20261107004338.323417-2-blum@kernel.org>
	<87a4nlypdt.wl-tiwai@suse.de>
	<au8h4SDC6fKaY7st@kernel.org>
	<87tslsycva.wl-tiwai@suse.de>
	<au8uNTlz49yooqNf@kernel.org>
	<87ld74yc19.wl-tiwai@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 07 Nov 2026 15:02:58 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Sat, 07 Nov 2026 14:57:09 +0100,
> Thorsten Blum wrote:
> > 
> > On Sat, Nov 07, 2026 at 02:44:57PM +0100, Takashi Iwai wrote:  
> > > On Sat, 07 Nov 2026 14:04:33 +0100,
> > > Thorsten Blum wrote:  
> > > > 
> > > > On Sat, Nov 07, 2026 at 10:14:38AM +0100, Takashi Iwai wrote:  
> > > > > On Sat, 07 Nov 2026 01:43:37 +0100,
> > > > > Thorsten Blum wrote:  
> > > > > > 
> > > > > > While the current code works correctly, replace the unbounded sprintf()
> > > > > > with snprintf() to bound the formatted string to the str buffer.
> > > > > > 
> > > > > > Signed-off-by: Thorsten Blum <blum@kernel.org>  
> > > > > 
> > > > > Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
> > > > > compiler warning.  
> > > > 
> > > > The only difference between snprintf() and scnprintf() is the return
> > > > value, which is unused here. Both are correct and shouldn't trigger a
> > > > warning.  
> > > 
> > > Well, not really.  For this particular patch, it doesn't make
> > > difference, but in some cases (like the use with %s), snprintf()
> > > causes a spurious compile warning with W=1.  e.g. try below.  
> > 
> > Agreed, although that's a different use case from my patch.  
>  
> Yep.  I guess a warning is triggered only when filling a substring
> that can be large into the fixed size buffer for now, but it's a
> compiler's thing, that can change at any time in future...
> 
> > I don't see a warning when compiling my patch with W=1, but I'm happy to
> > switch to scnprintf() if you prefer.  
> 
> I'd like to bet for a safer way, so let's go with scnprintf().

At some point someone will work out why scnprintf() doesn't generate
the error.
OTOH there really ought to be a way of telling gcc that the overflow
is a false positive or you really don't care.
Doing some checks with the result stops the warning, but a (void)
cast doesn't - much like it doesn't stop a 'must_check' error.

The real this is it that it is somewhat pointless.
It basically assumes that any char[] might be its maximum length and
any integer its maximum value (%d needs 10 characters).
But it can't report for 'char *' because it doesn't know the length.
I can really imagine people breaking code in all sorts of ways while
trying to stop the warning.
In particular code might start trying to 'exactly size' strings instead
of using ones that are 'really far too big' (an on-stack char[4096]
really doesn't matter in userspace) and then getting actual overflows
(or memory leaks) for normal data.

David

> 
> 
> thanks,
> 
> Takashi
> 


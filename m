Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789278;
	b=v9SMwdWa7TulAgmKz2p5nNjws7gmfBy+sdA7wVSYpvlnzTS6kCmiuRYiwAGi9mEhdfgh
	 +ERjOwc/Ba/Wpm8qVGQWfymU8viVrwOb1nE6jq7nlrkTLHA2yAYtADrvh0z8Vn5qTUgJJ
	 hw6ap8t0Q7dIOM0z79FlPx8TuYoPIWIT7jyFDH4ZWMJy0BSXtdduTcTxv/DtP8sMwgzpx
	 TAh7q8O0wVINU0ZMj74H2RzYVv8F5mZD8DawX5Z4/wtRaWmrt1O1wMZcErW1EV3484yth
	 7LczdJnxApTergMRvoqiR6V6UM1Cq6CndG4YsNg+i5iM9P1KFSCsvSAqsawT8cBV3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/FhZ2gLZhVlx6sNQ93mhe7dJyMjd0gId+bxgk46J8aY=;
	b=r5Qk64USb0fkZpby5rb2MPLAY91Xmmq6KKmK+KARgFUfHufRbpJI0Ty1ywwt611kbhp1
	 VadcrIrOz/7ETXiROvJlGrHiC6yPiE7gyfesHP5G1Nl2DmF6tpmrSh4tLpXw7pSBurDMr
	 Cqmz+KtTs9ogB/jlYpH+8sq2InLoJqvf3r7VnaZ1IE/saS83ojNCK7sY2VmDZupRXN8zX
	 C0fjOiv7NzhTbhHUUeIEHoKFYqkhJBX25IMa8jAnBwEgtwES9g+qOvyZF3D/smxk/ddf9
	 i0+vsNpQ2o8nrRdIEqUEQd/2bpO8Qxc+5kPMz0ehZ+8K2xwIEYmWPZQkB0RiQGlW90A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bFkc6Km9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E240F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bFkc6Km9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so8431935e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792789276; x=1793394076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/FhZ2gLZhVlx6sNQ93mhe7dJyMjd0gId+bxgk46J8aY=;
        b=bFkc6Km9gMu+tBV4XTN8kkvN/8KHDDC2ym1PxsDRQs1yyXuBI1eI9Uh90kY7bOyv/j
         k00wKZBhSGWqqf8Gsz7Hf9rEKWXJsPEBZCBRv24Roco3FrcO0r6M1c08ZPilem6B/My2
         vzKwLaLz5svyZmHwqSep1n76CPZEKH39UEeS/4AN34aeptGw3k+ENP8jS+8lvvtOkwk1
         z9yZHDVZ6S9WbMkikRmW5zU+jztPUtyVC9RosB+JJO5LByB9PlwKku5Hqz1LEe2saszI
         6y4wUsjYGE3pvIalAyRAgygjPdKGU4w9r2jxWeEmv6WRtBG1bLsAkfax7eV8OJPuwPCW
         0CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789276; x=1793394076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FhZ2gLZhVlx6sNQ93mhe7dJyMjd0gId+bxgk46J8aY=;
        b=uw3FyKJtu0XZ15YCtfJvYk3KsfCkuLoWQxQnea4W0xR8RMMBYcUCUzuQb6dhWpAhSQ
         0/1k87dbZ0QnevFHKQVetyb36FUkRTzYWQbuHMao86LDrCrED47BQS9EzMm2IAZqVFxf
         +2d04frJG7D7Qc8yJ9/EC2bEU8XrZmWthvS9gdVJp9I2bpfyrTipqAVRdinPIQ0CSkNS
         tZKtuSjSQBSQkfZW7b35A/6Sh5vxva4+1wtQx2kz6vYTH9f34rDrmM9XSGenxLJkRb1t
         T7eqC8JLX2OgU4jB0E/f/5ykA3aYaQBevPGkZL6XNoOoZmGSJqGaYvAGsBvU56FhxSi/
         +sfw==
X-Forwarded-Encrypted: i=1; AKwUvBxd5qdj0f6qZP8OCe6PV11fiQxfT/6fsL6yCT0Girlf6jPfa1XL6tCPNz4AeZxGPHpKbsYL6qGd/8oQ44c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj+p1ebguq5XEBuLrThgn+mTEEHXJ2BVI4wedl43TqX2uWUtiQ
	fsV2Q+haKfB2tEoKob2DEoehHPbqnud6D3jHpEFNZBV79Cyg9vtfwYCN
X-Gm-Gg: AYBFou2kKm0WSVp8AfP9BTYxnhSlvYGctiXGXCWw0RB8kcp8EH0D+X3JW8mINhEh02v
	RNwmdMkMQVDho9DItz3+RqJ902ktwlIJVQ5cX61V84LoqugMaaqBXlpb7aVkTz4ESTvkcDuoU1E
	4NkctIklDTLafgNGaGkvaGosvs/YXdk3za/0cVOzSaBBzgrhJZwmUvt6HKmzjUgCC7USQfvHHsm
	zZJSx0KkO/srV1xvg/chEQH6k/Z8WMmVvk+Av+e1E2IEYBIIkAX0JKqDx/Pgfjg0xmtRIstssTe
	lDgf4NYScTD/usWN5LXh5GVfh6S/bSmtpYEmX1BreOURz9pXPHq9bNhNTX6BQWd6hhLIGUfIqy/
	b4e+xl9i2YPNfK/SUy/c1R2ydPF2x+T4pxKXnpSqdBmyrnXHjBDtsJBkGdFWbEWqnXNNBNaXoop
	wYwkE7E043a/8t9sWIlI1ECowbdyuTfFav5rSh59xfY8VaBvUUdD08BTzmqi05RTf9tEw2uHm8d
	6o6brHZXvHtx8BTcloWQjW+WaG1DaKfOvmFYqrw94W4fIxFxiRUl+EHwABsmvuhqkbxR/0FOUPi
	NTraIuBO/O7TKIy8
X-Received: by 2002:a05:600c:5308:b0:4a2:86b8:7e9 with SMTP id 5b1f17b1804b1-4a35ac9d077mr1208455e9.16.1792789276136;
        Fri, 23 Oct 2026 14:01:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0a9cafsm9983885e9.5.2026.10.23.14.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:01:15 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:01:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Blum <blum@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The
 Capable Hub)" <u.kleine-koenig@baylibre.com>, Zhao Dongdong
 <zhaodongdong@kylinos.cn>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
Message-ID: <20261023220114.2d8af17b@pumpkin>
In-Reply-To: <87qzhg8axd.wl-tiwai@suse.de>
References: <20261022164013.95811-2-blum@kernel.org>
	<20261023194059.4e307a32@pumpkin>
	<87qzhg8axd.wl-tiwai@suse.de>
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

On Fri, 23 Oct 2026 21:38:22 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Fri, 23 Oct 2026 20:40:59 +0200,
> David Laight wrote:
> > 
> > On Thu, 22 Oct 2026 18:40:11 +0200
> > Thorsten Blum <blum@kernel.org> wrote:
> >   
> > > To prepare for removing strlcat() from the kernel [1], use strscpy()
> > > instead with the current driver name length as the append offset. Also
> > > use size_t in the multi-channel branch to match strlen()'s return type.
> > > 
> > > No functional change.
> > > 
> > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > ---
> > >  sound/pci/cmipci.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
> > > index 9d9f784e3a8c..5722b722da95 100644
> > > --- a/sound/pci/cmipci.c
> > > +++ b/sound/pci/cmipci.c
> > > @@ -2980,11 +2980,15 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
> > >  		query_chip(cm);
> > >  	/* added -MCx suffix for chip supporting multi-channels */
> > >  	if (cm->can_multi_ch) {
> > > -		int l = strlen(cm->card->driver);
> > > +		size_t l = strlen(cm->card->driver);
> > > +
> > >  		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
> > >  			  "-MC%d", cm->max_channels);
> > > -	} else if (cm->can_ac3_sw)
> > > -		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
> > > +	} else if (cm->can_ac3_sw) {
> > > +		size_t l = strlen(cm->card->driver);
> > > +
> > > +		strscpy(cm->card->driver + l, "-SWIEC", sizeof(cm->card->driver) - l);
> > > +	}  
> > 
> > There are all sorts of reasons for not using strlcat() and various ways
> > of changing code so that it doesn't need to do the string concatenation.
> > But replacing calls with strlen() and strscpy() is just plain stupid.
> > 
> > It has no benefits and lots of downsides.  
> 
> Right.  The whole actions look to me like a crusade to a wrong goal.

There are places where you either know the length from earlier
or can get the string all built at once.
Changing those does make sense.
Similarly changing places which repeatedly strcat() bits of string.
But these ones are silly.

David

> 
> I was too tired of discussing the same thing again and again, so I
> gave and took it once; but now I change mind and drop it again from
> the queue.  The other patches from Thomas were OK as they can be seen
> as optimizations, but this one has only downsides.
> 
> 
> thanks,
> 
> Takashi


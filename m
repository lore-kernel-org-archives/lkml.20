Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211268;
	b=HP29bWJuKhJTCItNtEIZyLbmldoklK8pxsRQMgbEzTEF2p30XwWcIc+8b3IGTvYbesHq
	 1/Od4j3Bg1mmU1vg2302dwg4/NhEZlwL2ybQfLQOt6ePUTaleKhS6HNPuD74vzk5zNFz7
	 4l5Mohu10RlHVrQNlpOj/EL71aJev24XvIqsxXQImItow3/KacCHI5u2vI1s4YqJWtA0h
	 kmhRTmL7pURTgGUXZTx92jyAqIzSQy/HK9b9m1jioejkFRI40BvZxjz4Be9Rm127bNeBj
	 joRUYYId84k/uf8IUnHIxTNKojsdCC1bJK1bHfAugZV5/UV9SMlYxzJzHozUMH954sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2TayQCSimHrqSkHOQFhNJsIxBzUcw67UawwZgMjp29c=;
	b=AaPGueXhEBo5EMiz1AQyTUjmvwa6nwT02Oo5b9GI+1nAkBp1aghpb89320pSlYZ3iHVb
	 iE0umov1xSRmQc3X9H8WLILbRLdNRJY7yPzfmRcKCFBjyMVWmDAwK5BOHWB8uzzwaAoBZ
	 e1ByjoCZG/fBh5mFa5gH+hXlHfrNPY+sjuEQWC8hw8jtabZc90B0z0aibHCDtim6WbKFx
	 KwMYz4ileulv5SLhMelYm50XDfGBoC9iGN6Mj4AThVZnj1qtTypO9h8Mqud1XhEVfL1kl
	 7T0AGmhylrLuKdJ7EYRUdGDue4N0Pq0rmc/Mo+0jV3EmJmchbctvbDKIk4yiuLG305g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3RmTM2g;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D08606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D08606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3RmTM2g
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so1134449c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211267; x=1794816067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2TayQCSimHrqSkHOQFhNJsIxBzUcw67UawwZgMjp29c=;
        b=B3RmTM2gPDg9+47wuPhaPZa9rAFfMx5yuwrYSouFDOMKmyOTAz8tJhjdluh1ngFHdu
         jGMEVIuXnz7SHFeKwZQ4uxRcC+fy+uW9cq2p80lLueqijJEcmpLk8K0bifBhL4DSGCEV
         g3+penvy1egHeXEVHwMehwWaycO+6g+qaQq3o7aIzIjk5jtT6W8cTvGvH0XxM2PuyIRr
         52U+IyAOFpJe2bNUxNmMJSeV9R4fMpub0N2RE0AVdW3RZ4z1ZSL2R/VVQq24P6Vd53J0
         hr5+sSbVXLs6NO9XHMxLUaP5tQDszKNlrzBqY5NAv9Z2X7UIjO+GajvwLBLQ2tr/8doH
         j55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211267; x=1794816067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TayQCSimHrqSkHOQFhNJsIxBzUcw67UawwZgMjp29c=;
        b=GK1Wvypq7hwrS8j3fXH6VAww8YvSIm9p5/986NUbRtpip5y1uLUxzk/vpBsbtcloXI
         IrmJZ4hXz8tR9BNBhzBrp5uRQKZLvrn77k1iAsT+pwmvjlQBGQc975dsgFgNBUXrICiA
         noYYCaPSe/W9Hq56F2Jc2EGAnswyslhuNDQadsxdkoFuhiEF5wsDIwXM2gn6B+kCKkhg
         LeEcUmDoN96Ouvv0N298Gn4SrB4lMobFLmrLOLNBYEycBc9hJR2c3cP8g20uiKfKNHxR
         zWh96kRA1WHp8haaJXZzQKwlCiRZfBhx4fQV9bFXWCmBRG6y3jL+qofJoY+dgFL1HRSj
         ERuw==
X-Forwarded-Encrypted: i=1; AL+hErGQ1tCzHZ6UHWamgTWXaU1V+kRApxyHond5dbb51Am6q41+m1J4xhk/EXc0+gvRd5cwzVrTXG2TDkrjSy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hW99Ba6bFMq8baMhWBfq8Fq2XmOY8kn+dce5EkWxTZ2wetBd0
	W3fNENcn/0bjMIVvdZPLrx3XH6mDvHkEjMWQRMzvEbdiV7h/J4i9E3gt
X-Gm-Gg: AYBFou0SeylKH/fW7XiIAsIjTf+M0qq9EMmvE2qWCB52HdQhSMIKNyIldwawkKl3bHO
	nAMAVH09lNXlp/G9UpHH2KNkIxOGtjp2S5WC73wI/E3+hukigCsxEV5EjdRlJYGdK/7wI2Z8yAS
	IAk67xtjdJNXnarXddqQeCd/oLmIE+O3viKJtA5IxBAAfj5eUlym7A1zGCrJHZSGytd943Yob0b
	vBe4lwA3hcglj4f4pNoM3CCjtGiJjy0Vu5ieDM3bMmbeftr2VjKN6HdW2GFXdBt3HZp6KdAo5Bz
	+YhaYsz94sqdRIouFIr0KqrrCs80n9kLr0cmqwNcdOuMgJjtl94NDBfIrP8zvH2OyLfJ/1+Zb1X
	4776f7PPeg2Fh2cOTDn+0IUnl1jh1xnXx87gcN4RN9XIrCILioHEFHvx1k9QBDXsMrCdCXRoemb
	/tlYG+SMAsJCu4JTqLBiXFoa1JSXEIsBwLY8ZmYikHKBRtSXxO+gcymC1G7SlAaQ6ISxhCvepxs
	wIr5X5QidITPKGeEEy5JfYu8OLXMfcrDRTMV4E0J3qUhRnYhyi+TsJfCOeTeyLwxmVI0WACNgyC
	Z/j9tMJ1i7PPPoUWwPrTYMT/YhWgNRxbEbhEDbK5JBtw8uw0O1ScgyJpp8zqQP3XUWm7
X-Received: by 2002:a05:7023:d08:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-1b39fe2b391mr5601293c88.6.1794211266754;
        Mon, 09 Nov 2026 00:01:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm10659178c88.22.2026.11.09.00.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:01:06 -0800 (PST)
Date: Mon, 9 Nov 2026 00:01:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wolfram Sang <wsa@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Hyunjung Ko <hj351016@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: lm8323 - remove driver
Message-ID: <avF9Z29GYy58K53e@google.com>
References: <20261109072950.3474308-1-dmitry.torokhov@gmail.com>
 <20261109072950.3474308-2-dmitry.torokhov@gmail.com>
 <def3815d-d3f6-4032-b7f3-d2b5e48c770f@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <def3815d-d3f6-4032-b7f3-d2b5e48c770f@app.fastmail.com>

On Mon, Nov 09, 2026 at 08:53:58AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 9, 2026, at 08:29, Dmitry Torokhov wrote:
> > The LM8323 keypad driver relies exclusively on legacy platform data,
> > has no Device Tree or generic device property support, and has no users
> > in mainline (including the Nokia N810 DTS, which never added support
> > for it). Its PWM/LED handling and unbind lifetime are broken, and after
> > hardware-tested IRQ fixes in 2011 the driver has for over a decade only
> > received mechanical API conversions and static-analysis cleanups
> > without hardware testing.
> >
> > An inquiry on the mailing list asking whether anyone still uses or
> > wishes to keep the driver received no objections. Remove the driver
> > and its platform data header.
> >
> > Link: https://lore.kernel.org/r/Zr6I9RB5mibU_12N@google.com
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I made an identical patch (for both drivers combined) based on the
> same conclusion, but you beat me to posting it.
> 
> I have additional Input driver patches in the same series at
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=board-remove-7.4
> 
> It's a mix of three types of changes:
> 
> - drivers that have been unused for years
> - drivers that become unused after I remove the board files
> - drivers that support both DT and platform_data, and I remove the latter
> 
> My plan was to post these after my board removal series is merged,
> and this got delayed until 7.5 now after some back and forth because
> I wanted to make sure they remain in the LTS kernel.
> 
> If you like, I can send more of these earlier.

Please send them to me so I can queue them: this way there's less chance
someone sends cleanup patches for them. And then they will be gone from
7.5.

Thanks.

-- 
Dmitry

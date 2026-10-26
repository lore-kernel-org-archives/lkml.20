Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976989;
	b=Bg4f9HhGAeeRv/3+Xgw/rUNA2s2CvAABcCLuRE9fJO6/OiWodPXt9YuaKUCCr+pRKMlq
	 PtnVVHz8ervA7izNnF77Cw6YwrVHjcX2+ks3HVIgPDyoNSVZkySQNH3ERvLOzY9SdpkSk
	 jHr9Vv6s0YW1JUPHUDb8E1UtZ+wWIfU7ZUggCRGRCYi9sIsBqx1n2IrUNBcPoLXZx83Wd
	 gIi3QvF0kV5hdb6BuxRGwIB/17jIR4yqUawSaHdRfnFurummABiyGvf6GaBZIfmFACFGH
	 VY/ImqvFiU362XHmDd6oFMiQ9r1pYg29DVklOqkJcgHb9CLHu4Lv1D5np2oX+2qYkmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i6evN3+Ke0MX69bWlyygAZJMq2satdlGaiCf2WgHvX8=;
	b=BGBFDJYwP3b0RfGODERYqc6hpurNFKiMIwjbb9QXg5IdIChxb6/q0x5+nxTfw1ukkwGZ
	 1Gy+BeZ/b9Q+GgAuE5eWB7lbgTeje+qcfK71xsbFRPBLRys7tMqi4FtKIikAqPPd+SfnN
	 mPZsNfJsrOXZi8zu2esQ5lsQdrf3B0jqLTMMc8fxG/hjNqjisZWn6pAIO94YSPDBu3GTK
	 bmMJZrBAaskGfq+RAg5sjAtKxoQG5GbAJ5GARlTBz2AGaiqcfHZyfCW4RY38ZoKlRBm46
	 qxsqhnJneeSwoaYaH1MP5Xil7fbT8cBxf3coq2mgVkKpt1Zh2U6Fucwdob1ZDk9jE4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E7D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53512cd2f85so27880951cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792976983; x=1793581783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6evN3+Ke0MX69bWlyygAZJMq2satdlGaiCf2WgHvX8=;
        b=MMk+k0COyYmNm4YdnxYfC2ghljf4SFkUhbA6kOhdeg1cbfitG0EjUsLQQEsUWdh2mT
         DfisF8g8yCg2zHx3IasNOO7RoHrWYOPP6vcdds9StC+lsuj6pEzcWdILCdQbgNGYa2gA
         fiWfgn11b2ceufwdYy2Q/aKNdKRi3guSGdI+5531lVzJQMrxEiYtYM9XzQsCI0sgoBtA
         0SAZzsqwgQu1MOojO7vvZbQg+to6vbuYsUW3/bNiA5a27yiZ3RtFjyuvXX0S+onRwy+n
         DrhHSBrd6oFm3nt3UAb01Ka+25XOFLCV3zQMmrJj3FeDJPFc0wS8cAuNIgLE3yNxipaB
         JAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976983; x=1793581783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6evN3+Ke0MX69bWlyygAZJMq2satdlGaiCf2WgHvX8=;
        b=JbPT9ZV/M2UfDXHO8E6Wf5nMumzN7sqyOlwuLNKVGk9m4Mg4o6eh53df/gLY2Loys8
         wfKfP8mldc+hR/YQTSmGdABwjmed9TstnYvMURxGnBADx2EaBM2VuEkF9T0Cjy3FSeCL
         +QLB4RpCDcsJetY/YNuJye6r8Rxr4504Lxf3ymXC9CysLzO7BuxZZR0/ESzbGK7Zv1cU
         GWM4VholQ3OfdBlHSrTDB2d0Ig/M23zDIPejQv6XS9Tzp+vbxpSqb7yhLXDSuLDjwtn6
         vcKkCgh/k9001eo/MKW5OqZCB+5KdykkXpamjbxc0HRJRkEK+n9w+A2yVDL8QHzcxfKV
         44dg==
X-Forwarded-Encrypted: i=1; AKwUvBzUeICtxPWtpUqF8DiQSXoVbDKFD22MS/E9PpxRl1AVDVQ8YArCZ7tZpa4dsjNYJMLkS3ByIofFa574WUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgUd+gwNolR0sXR/6S+VGxorb1qQJ22aiKY5ZApNgQyzFJEIqa
	XKPmMTEcVwmG7D4voAqrp1/32FH3tGii/l8B17JpS1Ve5wRHIIZKoQL1kfryj0XWAQ==
X-Gm-Gg: AYBFou1uE1/jQRuLl1iKE8OxCvOJpYAZVRUQCQnxT268NZtypHhJIuuM1RzDVO0EMxY
	/Gi6SZ/rMk7cIqE5PosEc+u3mk6N7dP46kNQjTkJr41RHn5fcHfmo/xdMiks0G6/Dp4moV9XHIv
	vz5LylVqqrthRBxiaGMC5bDzT1rgomvV6DkPbMQf3ySgi7pZIqJNERAi6RvTC2eT6h7lCs/6yqL
	UeTMSKvgSdelzbLXKK1SQPz/6pYvz0mfwErgaQB6+DUDZL816ErAlHJer0AMOmzczHSpdXvuLGm
	cR24/rUY9lyGJVmGldcjSo4OBrzSRUNkL8j1ZMv6Nx4wJGi5vs63QO8sfA8CkRZSDkx5/YMnZ8E
	+3AuDN/62za9xoUBi95GfJylp5iftlM83FRITQA+Dh/vfIFML4apFd+w/7wseO1UICfSDvV/tC5
	D2gDrA6saLVjro7Gtz7Eeb7TmDe26zUgb0AeLRAs/VclkHwXbCg9ykP8auQdf3sptJeq97Yh/Vd
	LarOWQlmni9e4FDlqWBQBQB7Tdf4kqTvcd5fL2lmRSZRXvu147k0/rF
X-Received: by 2002:ac8:5f10:0:b0:536:8843:c2bf with SMTP id d75a77b69052e-5383b5f25d9mr84356811cf.67.1792976982790;
        Sun, 25 Oct 2026 18:09:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839739ad5sm43892661cf.23.2026.10.25.18.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:09:41 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:09:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: IgorpetinDev <igorpetindev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <4f60a287-f914-4b81-9dbb-d93528312356@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261025000643.425c57ca.michal.pecio@gmail.com>
 <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
 <76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
 <20261025171019.49c9a66f.michal.pecio@gmail.com>
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
In-Reply-To: <20261025171019.49c9a66f.michal.pecio@gmail.com>

On Sun, Oct 25, 2026 at 05:10:19PM +0100, Michal Pecio wrote:
> On Sun, 25 Oct 2026 11:16:59 -0400, Alan Stern wrote:
> > > > > +      * Even though all URBs have been given back,  
> > > >
> > > > but does anyone actually believe this here?
> > > >
> > > > Hundreds of drivers written over three decades, often
> > > > without linux-usb review. I don't trust them at all.  
> > 
> > If it's not true, there's likely to be trouble when the completion 
> > handler is called.  We could forcibly remove any remaining URBs from
> > the lists before flushing the work item and just leak them (with a
> > warning of some sort -- ideally, one that prints out the names of the
> > completion handler routines for the leaked URBs, if at all possible).
> 
> But you are now talking about developing a whole new feature of
> unclear usefulness (will anyone pay attention to those logs?),

Actually I mentioned two new features: forcibly removing any remaining 
URBs, and printing a warning about them.  I guess you're saying that the 
warning would be of unclear usefulness.  That may be true; I was just 
thinking that if anybody was interesting in chasing down the cause of 
such errors, knowing which driver was involved would be useful.

> while my suggestion is merely a small tweak which costs nothing
> and makes no functional difference under normal circumstances,
> but reduces severity of hypothetical failures.

What suggestion was that?  Using cancel_work_sync() instead of 
flush_work()?  Doesn't that amount to the same thing as forcibly 
removing remaining URBs from the giveback lists?

I still think if you're going to deliberately leak some memory because 
of a misbehaving driver, there ought to be some mention of it in the 
kernel log.  Otherwise, how would anybody ever know?

Alan Stern

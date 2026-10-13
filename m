Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745614E3781
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935463; cv=none; b=Ga+Ih20qA2Oa2X6LHLkbQHuvlHlydTEGLFTnyQ7WcT302EnzV65vqkG1tSp1Ex0ybeBnntArRDE9PVwR2qwDju/qWRx3lbnKdpc2BlsQGG3/YcNZtgdFT/VP2OO8+Pj9NFn/rQBzbnixAAVqndujNxraxaGooyjkcSWACedK5hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935463; c=relaxed/simple;
	bh=aiuMhEhhajzqsfSxE/gpX2M4LnCvyqPdOXwdjJ+wf+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUOpqzZ9CcqTGBGxTrxplKkKYKl5KBIN7x2Dsvk+gmYqeBjetDkFKVtHrERpHT98TWSl6/67AyJ2Wek8QxkhYDuav9+i50d+nPHRqaG68nczRRQUqu2ofduBFTKoDkKrf5FbZiqJ34ng/K7qDVxYEwp7rin+Vb+5tT+lMTAfjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+MN31QP; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+MN31QP"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-354ba08cfd1so5989486eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791935461; x=1792540261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz79PmNG+KXjzWnL8ROr8qzw/ZQMjbqEAKvxMlEE3xc=;
        b=M+MN31QPkphHV7La3LDPFgo5ZTNzlUliAi3odA7gMTH6RLfGQWBerXd74en7GKAZfF
         kN6QQeVDPG0Kq2MYRKKsW2/wCEU8etT7yU3jz7YqC8lzyn937SvU0KGjbLYB0NdZkEKi
         EwLNKCTqq8MJrxNJ9s03Rx1k1yOXpx0i4pI92/XrQ5erGEyDSnUpJbj+Fp2NcZuQ59ma
         5OACmRTnwpatdNWdh51bI+C4XdwmQFIIvhuKoeDOcKf9lUp0bJqyQfHgh2u8RT1nt44X
         6QJgFRPJXmWtcFHqrxVNhTVV+KgmlTDaYoc5cWrhu+eDT6bo9yIuOsgg+o0iUcnifao9
         1uJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935462; x=1792540262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jz79PmNG+KXjzWnL8ROr8qzw/ZQMjbqEAKvxMlEE3xc=;
        b=mOc3ozJH7kN32X2t2QaFF3RespqWx4BUMyF8sevFdFQ6A5nYDCwQwLXZAd+TXKuRfK
         loXhFpbRj7DoONZCWDKoGLcNo7IOyDne+01Ihprfmm/NpfEKjmAgq04h2qlLxHyckRGB
         pwtSN6nybNB9Nbbned4ghuVuXSKn8wbSfUGCquzx3ZLC9pC58qV4SHAP6xGyRcn90vnl
         8Glq03Kur5DE+/E+j3AOdABKUS988B9hH8I2oaovMRiDZOkiRp6CLJDMPBAvY2LCLQqC
         iELFSuwvvldVnjarlTq/j8+rhEHq98c8fAqyYhOCp+y+lyFvtXjQNQWH7SpEAxs38gow
         9s6w==
X-Forwarded-Encrypted: i=1; AKwUvByP4C8Wd6xeGFaroUVTOlrg7lJnSXQGoOTmZMsInYl48v+ONmYbKg33d2CfvMsyaPWd26rKoSIEK3Knrhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp8meSy5m/2SgvsFzz/Rgo1q5HCPPiKvQeTcXxAobAcUS0AREc
	Up+echTPEMNrw6+z/+vYS2z2JfTjeS3hk0VuJTjysFc0XFvie5fmMh//
X-Gm-Gg: AYBFou3tEx02snSgG9IHGmCLztdxcqAwzH/merqxjJF9898ReSTPnPiS005JkJN4WqK
	PNMTu8HhKKRfvW4aOlerWS+mmy2ZASGRtIpku28nc+OyBmnZRyodSMH6jQE8cbIPv5X9f3OEVuK
	pEpN2gbE1z2dpejH77oEOJxrg5LktKfUoTDisTMxdPlD5to5YuBCTpMbbZ95VVZPyXOWPSb4gDm
	LZhLBc8vnNuWQ8Y5DqGqDEacB0R1ChZmW53t/7uyT7uOXbLC+nOmoKeBOOq1wAnRBWQjA6/ZXmQ
	mdqvFIpgDMMdUr5U4PgUnmqDdyhQtVndKlLgYOSUQROwja5WQka5eRuND0VnEBrSJomUOnPBlEk
	R97D1sxiv09p4dlAjtKDXSW/c94HwsXgAgrBkQo1GikXYhYzV7e8ZWEG3sTChMawDpHWhe0DHk0
	Bixcl2+K9M50PpsPGvyJ9V7o1QsiUxxMBoMc5fqjsnue253iQO3bcrcbSVX5g8a6pUmUS7rg5Ck
	YiwDGTePfLcsrzfYo3khe0lNXA7/7BDqwxDpY5P
X-Received: by 2002:a05:7301:fc8b:b0:34e:67d0:bbb4 with SMTP id 5a478bee46e88-3537e03eedcmr16602477eec.10.1791935461471;
        Tue, 13 Oct 2026 16:51:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm27050808eec.11.2026.10.13.16.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:51:00 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:50:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Gerecke <killertofu@gmail.com>
Cc: linux-input@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Peter Hutterer <peter.hutterer@who-t.net>, 
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] Input: wacom_w8001 - fix teardown order and device
 lifetime
Message-ID: <as68uSzmyM3eubYT@google.com>
References: <20261009190746.803607-1-dmitry.torokhov@gmail.com>
 <CANRwn3QGaQYUZqm2Mh56v0SgQHY8mLuG+FKCtFXjUPRpP6bpNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANRwn3QGaQYUZqm2Mh56v0SgQHY8mLuG+FKCtFXjUPRpP6bpNg@mail.gmail.com>

Hi Jason,

On Tue, Oct 13, 2026 at 03:41:53PM -0700, Jason Gerecke wrote:
> On Fri, Oct 9, 2026 at 12:25 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > In w8001_disconnect(), serio_close() was called before unregistering
> > the input devices. When input_unregister_device() calls w8001_close()
> > to shut down the hardware, w8001_command() fails because the serio
> > port is already closed, preventing W8001_CMD_STOP from reaching the
> > controller.
> >
> > Additionally, w8001_connect() pre-allocated both pen_dev and touch_dev
> > upfront before serio_open() so w8001_interrupt() could dereference
> > them unconditionally, and then freed unused input devices mid-probe
> > without synchronizing with w8001_interrupt() when pen or touch was
> > absent. That created a race and use-after-free hazard with
> > w8001_interrupt(), as well as a double-free on the fail4 error path.
> >
> > Fix these issues by guarding event reporting in w8001_interrupt()
> > against NULL device pointers, allocating and registering input devices
> > on demand after querying capabilities, synchronizing device pointer
> > publication and teardown with serio_pause_rx, and unregistering input
> > devices before closing the serio port in both disconnect and probe
> > error unwind paths.
> >
> 
> This patch seems to be pretty complicated for a 'Fixes' and I'd feel a
> lot more comfortable reviewing it if it could be broken into smaller
> chunks. I know that might not be possible, but it's pretty hard to
> audit all the changes here. There's nothing that sets off loud alarms,
> but I think at this level of complexity the best I could do is Ack the
> patch...

Sorry, I do not think it makes sense to split it further...

> 
> > Fixes: 66fd9385ee9c ("Input: wacom_w8001 - simplify w8001_remove")
> > Fixes: e0361b70175f ("Input: wacom_w8001 - split the touch and pen devices into two devices")
> > Reported-by: sashiko-bot@kernel.org
> > Assisted-by: LLM
> 
> Just a note that current recommendations are to include the agent name
> and model version in Assisted-by lines:
> 
> https://elixir.bootlin.com/linux/v7.2.9/source/Documentation/process/coding-assistants.rst#L39

Not anymore since 816d9992d9ed ("coding-assistants: simplify
attribution")

The current format is:

	Assisted-by: LLM [TOOL1] [TOOL2]

as in

	Assisted-by: LLM coccinelle sparse

> > @@ -349,7 +353,9 @@ static irqreturn_t w8001_interrupt(struct serio *serio,
> >                  * sends invalid data packets that are larger than
> >                  * W8001_PKTLEN_TPCPEN. Let's start over again.
> >                  */
> > -               if (!w8001->touch_dev && w8001->idx > W8001_PKTLEN_TPCPEN - 1)
> > +               if (!w8001->touch_dev &&
> > +                   (w8001->data[0] & W8001_TAB_MASK) != W8001_TAB_BYTE &&
> > +                   w8001->idx > W8001_PKTLEN_TPCPEN - 1)
> 
> I'm not an expert in the w8001 protocol and don't have docs handy at
> the moment. Can you explain the purpose of adding this new
> W8001_TAB_BYTE check? I have a vague idea that it might have something
> to do with allowing the query response packets to be processed prior
> to pen/touch being initialized?

Yes, that's right.

Previously, w8001->touch_dev was pre-allocated before querying the
hardware, so !w8001->touch_dev was false during probing. Now that
touch_dev is allocated on demand after the queries complete,
w8001->touch_dev is NULL during probing, and without the W8001_TAB_BYTE
check we'd be junking query responses (which are longer than
W8001_PKTLEN_TPCPEN).


Thanks.

-- 
Dmitry

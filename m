Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E64B4058
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639243; cv=none; b=pO/oZEiE+OidzAox7jFbxreJjtVePlEPeBhGLDSkJST8b1MPl4/w2ZAHAV8VRLGLphwXokvZ2+J4klFyIRycVLVPeszw+GQqd9lGuU6oLqc9dHqQQoqXR0RIrooeHc8LqBtFpvsBHK2M5TL/Ce1jlQLLqMz4w03DNl2yVroaOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639243; c=relaxed/simple;
	bh=DbmJGTO38ZQmXXH83oMfgHUcchZlyuqt+YS72+gWZDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBqhEY7qz9mjOmyEWX5Wu7ixzSoGvoN7v7NKpPD7dmQgve/RB/zK37A67sCkXcx6LHNNyYEcn6m4doMFwg6ZWw8DsEx4YXFr5wvaXEsCltMtJf/laW83EHmnavQc1nQJKr/34I9vsWToQ4Wd1i876QsZMiy3nc1WZ6jlk/StU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw8qWcAT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw8qWcAT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so3940225e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789639226; x=1790244026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jjyjniKVzwPmkW/8acQ86Rlei6X80JG8qnbW9s7w6qs=;
        b=kw8qWcATS0dunpD+urqDBf0ua7rRO+qCvzeIWxMqLbAe1VhQF1EJAjaaBlR3FMl4zt
         nFigtWJu1wzke++goTCERKnvfwhVM5Ub+drxIVXlLfQ88ZIPXG8jHaO8xIJldngnUKwr
         000lb8tXkrBEUqOvtCbPA5GbPgHoFBO8n+pr5rUL6aXQAxwAJyCiY6H+wHNlCzLsvEkG
         Emq5hXg+4gB9Sgz6S+UalmZQmnxJ9IJsg4WND+/OGpqbi4+Lx66be0nx2rqCQqrQE2dS
         HMj9ioTZLKVeibju7aPUQ9brQFPCB6aTdxymShRuH2sJx3hUGA0JT2HY8UFg45zmPxSR
         KXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639226; x=1790244026;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjyjniKVzwPmkW/8acQ86Rlei6X80JG8qnbW9s7w6qs=;
        b=mOdMuw0QN9elOnDtJsAVLuEuPDFZxLHWEO+xAVYkO4cvx9OnLFFw4bwMcL7nvKY4+P
         dm7k0Uph/I37s6DVbCRdOfwUpKgbBBm507oofylU1BoBKtyNVPHHOFUDTAVA+abRDwuO
         BP+FXPhXHP0ppcVVieeCmdpPck5o0+sjgmZ5Dwly/MFVoChJDebTYRFkuKm5j6ZH3YeT
         QwLip1SpgE76MZpku50FuH3U/t1f5tjbehUTjkfDD9dM0RCfHX9GrBTwpYdTbs3g0VFn
         FrtmbUtrKpQDaafW4pVxgL+qUsmUhaG4Q0rizm9DWibfAiDntIZBtx3ZAFj41q4ezy9J
         zpHg==
X-Forwarded-Encrypted: i=1; AKwUvBxYy5JlIBGs5HS0hEeQVQlBh97UiHZtapkFFIf3secQCikR/rJMYjDIniRu+6sA0A/9byx0PNW73novzFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mg0zio9Ne4FIFjqy004kBATd0vJbPgUdyJ9XgU00Nbd3QYvSO6
	oZhE9VRmnQLo1adYgQbu+dAVrBHNYRY8HhSDvD1/x/E8Q3e7uV9zlC+C
X-Gm-Gg: AYBFou3lZDH9YCM30CUrlKUSjj11Z0VX768RDO7qhgXP2lB4Gg/nLpVTnLRmTJ8T5P5
	aw6kow6OO8fHHQiu4hRQr64w6pq9VgyK9PiTi5BAEJrVUuwq/T8qBnnSG7+FRbxHDFnPNjih8ei
	Pp26L4dwZtFetxzn096m+Y657pFfZQJP2/nEfsnKGALibRtcWGp4wWNHZGSFV6nXSy+Au0iiPcW
	7q1y+gClYb3Y9J2JesbxSBSg9mLzk+lTOK+7dRxksuyAP2bq/rid0mrb8Mf1bfhsjmfeXXqKYD1
	X12LuWgbam/iJqE+93xEy/cjOolqQaZsX19kwVmUO+P0mNe05PMvH7E+QLJVfme2exFD7LKj//p
	W47yu2GMesMJMEgX2ta6mAnlxaIU+9xHu9eGf3RVz8Vvy/xtWSHHXXbynP2TgWI/KkNN5JYGamX
	4aHH2/C1WZz1kWJGo+mJR7jkfuYtFVlQWSa5+DaxaAfJTvYSq5a1L1Zfq0EG1ERmwamjdlGo7r9
	TGzRKwmcSwBC5jLGhbDuMHAVkYaOJ6pXXib
X-Received: by 2002:a05:600c:8a09:20b0:49f:bc0d:2e9 with SMTP id 5b1f17b1804b1-49fbc0d032dmr85940075e9.0.1789639224488;
        Thu, 17 Sep 2026 03:00:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm14296463f8f.29.2026.09.17.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:00:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:00:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Edward Adam Davis <eadavis@sina.com>,
 syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com, dakr@kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Message-ID: <20260917110022.06614ba3@pumpkin>
In-Reply-To: <2026091700-baritone-clapping-685d@gregkh>
References: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
	<20260915122018.924041-1-eadavis@sina.com>
	<2026091700-baritone-clapping-685d@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 08:34:46 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, Sep 15, 2026 at 08:20:17PM +0800, Edward Adam Davis wrote:
> > Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> > file write via sysfs_kf_write() may result in an out-of-bounds read when
> > checking for the null terminator of a string element in the kobject_actions
> > array within kobject_action_type(), potentially hitting:
> > 
> > BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> > BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> > Call Trace:
> >  kobject_action_type lib/kobject_uevent.c:86 [inline]
> >  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> >  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
> >  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
> >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> >  new_sync_write fs/read_write.c:595 [inline]
> >  vfs_write+0x6af/0x1050 fs/read_write.c:687
> > 
> > Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> > properly.
> > 
> > Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
> > Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
> > Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > ---
> >  fs/sysfs/file.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> > index cd5bb0f9fee6..a63130d18680 100644
> > --- a/fs/sysfs/file.c
> > +++ b/fs/sysfs/file.c
> > @@ -228,10 +228,12 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
> >  };
> >  
> >  static const struct kernfs_ops sysfs_file_kfops_wo = {
> > +	.atomic_write_len	= PAGE_SIZE,
> >  	.write		= sysfs_kf_write,
> >  };
> >  
> >  static const struct kernfs_ops sysfs_file_kfops_rw = {
> > +	.atomic_write_len	= PAGE_SIZE,
> >  	.seq_show	= sysfs_kf_seq_show,
> >  	.write		= sysfs_kf_write,
> >  };
> > -- 
> > 2.43.0
> >   
> 
> Are you sure this will not break those sysfs files that want larger page
> sizes?  Given the age of this "issue" it's really worrying to me to
> change it now...

If you allowed to leave atomic_write_len as zero then the code shouldn't
let an overlong write through (or should truncate it).
So there must be a bug somewhere else.

Do we know the length for the test that failed?

'atomic_write_len' is also badly named - probably historical.
There is no code to loop over the fragments of a long write and (IIRC) the
write offset is always zero.

There is also some (horrid) related code that can reserve a page buffer
(per node) just in case an access is made when kernel memory isn't
available.
(a flag and a single global page would suffice...)

David


> 
> thanks,
> 
> greg k-h
> 


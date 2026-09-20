Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CCF30AD05
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870773; cv=pass; b=R2Kb0cDKe/APM+5DDB0rKmiHkDlbrZ98FDtgJyS64fshZgsvR2b4MyvWE/6e0ZLt9vVASvEaWwuZ2elRq2lp/n2IG+8vswFVS2AwwHt37PSmO9lGqB+gcNEn6p9h7qic3gHu9ursG1GhdYg01jGxaogo9FbaD5+0RSQ3MMX2pqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870773; c=relaxed/simple;
	bh=Oj5sg9PCyDUl3TeOjKEQSeMqK8FhKnxaUFXuz/wNJ/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfUlgMHQBVTVGeBNQFqLuaMqI2aqP9QOsvBS9MMFU70iGExTJh776AjYWijYYwkjju1OyZNXXS+BadMYnwSvgp5e8rXEs3IywuuQyEwOxysdnJXsQ50aVY43GTsv1yOBgbVUR/4ZTvCsXDri+TvgE+hTsKO7N+aVvpn/snVczAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdY/aojF; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdY/aojF"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ca5aa8so190363685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789870770; cv=none;
        d=google.com; s=arc-20260327;
        b=ZBpyJ4PxkPatYWP0WN0iSuSOd9ScCW8o2ECxzurYDlmIihhfFhq0T7f1EZOY+McmBK
         5PNnLFc6E39qg9AdOjhICK7z7Fc8PpFRPYnepRHxicOlgYN6uAYC4qkFC5OcQXuytjYQ
         /FG7/EedG3LCzw/28PDvubA/cbQcyTcaXEMBjZ4ekLuxQnzFJ77b4q9te6uaW4ZUCo9q
         5uw5vd2ONVDQ5qJNDLtNyilzeVXFCplxToUoVRedPovpBHuJOnAPthnlF2YtiEXxrgC2
         HFRN055VyzkX3MOAyDUw4sB6vdcPURk1qUJVvqz531w6iIeayEDqjXQMJcNwjeVy43XL
         8CjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t1jf+n9Y/HXbw9hy+wSRUxXx+QGd/8tyjA6GiwXlHUQ=;
        fh=abcoMmjGA9edUQ2C014CtHI6e+gS+V/RQ9zhPF7FgHs=;
        b=FzZUpKo6wgUmtMVXRowXJWBp8Ezw5xRn0kT1aU9EBJz2Gj457mVLtF6xp8wzpNmAkJ
         bS9/VallMfpw2DnhITArLlWO/ka+mXwoqx9JeePwTIb1/BMe9RCUurVA4kOigLHwoh/N
         LHgIYhUXcqh//oqQkBeOl58n+6cQMzhHmSNviFJuzCYkd05BeiDiZqVxocVzHDAGqT9z
         wZoT8Bwwx0OEcN5N7rpb3T7i5Dyz7wxEKz6ra0Sv5nSrVSBJGbPOYHp1tD8iSIMIyRDZ
         7X+F9ERpKwIPE7bam0WYSWAK793rhRsFifY00B3pYgaDVj4o31KH7XywrXKpp2QRAc0w
         825A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789870770; x=1790475570; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1jf+n9Y/HXbw9hy+wSRUxXx+QGd/8tyjA6GiwXlHUQ=;
        b=ZdY/aojFRC54Cf2Uxg5kJI2s7ovE/rCSqWRmZqYsrhcX5FrMmwETLowV9bl+QBfGAG
         V9RTkGu0hepuCs2TIYuIo0FoCh9W7o42lN8okRXyHvq3fTJkX6+n219g/55KehYaH0Fz
         dih1Zl7u75NLe16cg/EUIJ8cqYY32pjeZX5MGVcWaH40cnuxooGTG6UBikVes5UYSiiu
         rMt9SFFV2v8p/XqreluP5GuSnFx/JOAyanhSvajdHH4QSM/kcsNMdrs2/n3bNwnZQ2uW
         zdNXuKpO1WZOxwD01u+BtOFvRSKVeBHejKDE6kM+t9wieGv/Bfb0UeYMEyYi5doSxGLc
         NBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789870770; x=1790475570;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t1jf+n9Y/HXbw9hy+wSRUxXx+QGd/8tyjA6GiwXlHUQ=;
        b=bh48NrwUjoPICNfu3AfDqXcaC+DBDdeNKgW3W8qX7B+LaY/scCkU38QEKJ8WfUYG2M
         DQiyyrnketnjVpv8i+5G6XtJqu+pErbrI0GZ0AMhI6VE0QtdguMuy2Lb/d3QYebQY5ti
         lRg4auIV7AM80R7s/wDvFdnLDqFyuWHVgTWcFp98cxh2WIEy43vOKJp3/beg9y7zT2tN
         zKabsX8KSqIcO1b7QsPLHusvDuVyq8uvdlptaPdvSnv6Szba7QiPChtsvtKeRB2Jbvbi
         RxgJZn4LBMnS4G8fdmsZ1TYdNjeAxchbE5p1IynPz5YN8SUkY6OTsb5+h2ALuN/0U3+p
         z0dg==
X-Forwarded-Encrypted: i=1; AKwUvByIhBCiEHjV+w2pzWGr67jPBU28ipffHj3qQlw6okeUEj0BOCf97Zg0xdY/af9S0y949fvgyTZa0eWsISM=@vger.kernel.org
X-Gm-Message-State: AFuF++maOWDttY8xnemrCF4tLkMYKZx8xmnYfbUnlMEasbHyndC6unGf
	Wmn13i0yYZS0YPt2B8ZcxsUtQClVV6wQlK0/8zsX8psXorzPr05CKTadxT8eP5SuJHXR5zkAy9d
	It2qxdnHHRo7loYyCW9kTcH8QHGmO5fk=
X-Gm-Gg: AYBFou1qKaLDlILcmzt2cRK8ak+ySWhosIxCGNB7yvEH3+Ox0+2+ENIanIWTiNJ2l3J
	zV8cvMnM7iY3ICIqIOcR8JMgIqL72jomrTtfsvowS5zLeQxutYJeCKe5ReUpshZ0QoWM2NAZ8gM
	rz52Zf6Z9bicpw5bNgLxq2RgQatjTDlslW6UmgzEPP2V3L151rE42kWpXx3+AZ9+f8qbTY/vnvc
	r3j1O0AAWPNA9dbPyTGYOVE8oi+WHaKZGTs4hlCADGpXxMqkHv5GDtWo1BTqQMuphem/aw4rzKx
	S3IIq+yd2MxaYFhXQC+L6uvr/i1iy71r+0XlixunZvjtrdGsYYOlKqZn
X-Received: by 2002:a05:620a:a0ce:10b0:93b:d58f:4fab with SMTP id
 af79cd13be357-93bf5595417mr270410785a.25.1789870770127; Sat, 19 Sep 2026
 19:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919131744.131030-1-physicalmtea@gmail.com> <20260919152336-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260919152336-mutt-send-email-mst@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Sun, 20 Sep 2026 10:18:53 +0800
X-Gm-Features: AcwNN1VkMN-0syiFYPeuWa4rISLvm99vUAZPB8bHXDefFB9Y34rSJVqTJuxGaqo
Message-ID: <CAJwVaM+BmE_HoN_hSYL28nhZh1ZStqH9Od3pizAb_fyTZAS+5g@mail.gmail.com>
Subject: Re: [PATCH] vhost: keep vring addresses stable while the backend is attached
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Nicholas Bellinger <nab@linux-iscsi.org>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Sat, Sep 19, 2026 at 09:17:44PM +0800, Jia Jia wrote:
> > vhost-scsi keeps the response and bounce-buffer iovecs until the backend
> > completes the command.  If userspace changes the vring addresses while the
> > command is in flight, the completion data is copied through the old iovecs
> > while vhost_add_used() updates the new used ring.  The guest then no longer
> > sees the completion.
>
> I do not get what all this is trying to say. if you break it you get to
> keep both pieces. when is this a real problem?
>

Before running the test, I checked the virtio spec and vhost UAPI and
did not find an explicit rule
prohibiting changes to vring addresses while a backend is attached.
That is why I ran the directed test.
I see what you mean now. I'll drop this patch.

> >
> > Reject changes to the vring addresses while a backend is attached to the
> > queue.  Keep accepting the current addresses so userspace can update
> > VHOST_VRING_F_LOG or log_guest_addr without stopping the backend.  Queues
> > that have not been attached retain the existing setup behavior; userspace
> > must detach the backend before changing their addresses.
> >
> > Fixes: 057cbf49a1f0 ("tcm_vhost: Initial merge for vhost level target fabric driver")
> > Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> > ---
> >  drivers/vhost/vhost.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index 44cac11b68d2..074590838de5 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2150,6 +2150,17 @@ static long vhost_vring_set_addr(struct vhost_dev *d,
> >                               a.flags & (0x1 << VHOST_VRING_F_LOG),
> >                               a.log_guest_addr))
> >                       return -EINVAL;
> > +
> > +             /*
> > +              * Commands may retain iovecs derived from the current ring
> > +              * addresses.  Keep the addresses unchanged while the backend
> > +              * is attached.
> > +              */
> > +             if ((vq->desc || vq->avail || vq->used) &&
> > +                 (vq->desc != (void __user *)(unsigned long)a.desc_user_addr ||
> > +                  vq->avail != (void __user *)(unsigned long)a.avail_user_addr ||
> > +                  vq->used != (void __user *)(unsigned long)a.used_user_addr))
> > +                     return -EBUSY;
> >       }
> >
> >       vq->log_used = !!(a.flags & (0x1 << VHOST_VRING_F_LOG));
>

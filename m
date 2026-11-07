Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794027956;
	b=5njMi9O2LGTrfYJr470LRBJiNk/GD/TGEJ0Tmm+f/wwgOTSugSRtsp9zeeWCaCWK7Uu1
	 2eattsBibzQIcZyCF95ByULV0+HepIIfMEiFjJDHhRYH14nYzrpe7KNPDPBB+BfLue8lC
	 gunPiW83VcFM7gIdkLGI9oXQQNl+S6sz2UdzskS5N6wdcL+XRbMOge+2IPC36TArGbGBB
	 PW4F6ZRr9VS0/nJCz7gIkwPWoux0+R6m5xf9dEuWUoC++tK8GSNBatm1te/zdmqE1vP+K
	 OLDYpLsLw5uBiIvjdfDP79nDoh8vKh/BSVNdOckTadsgf0dmnQFCyYt43JdDhNiDCHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794027956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+3B/jiwJxW+xAIbQiYYm6bOuOVI/U/8kix0T1R+5+pM=;
	b=xY+bCwVAVnT9mwx2bKwIa8MgjdSrStx5TLfLa/jLLWKPrv5rbLZLSZPhf5zODPu7nczQ
	 KpGbzKzHdMyQVN9ZP3HJJMv+NiJwv/LbuJGUfhFWGFJAijpbruL9KGIiNzxHMdOZDOYRM
	 K3V4iLe+wVRc+4eTERSnpGULszWrrtB3nWjL6ZCCAVV6a32RygQiwqygk+8qpxm2RydyI
	 0tuPWvmVVR4kMDOzLQqNO26nzR79m3Ze/vZc6HsKSu/5w89JbNutc0qLozJNWZq3P+Vp0
	 qNvymvmMsr+qSeyL4/WhbLKgCTbanXW5yCKZ9YnNbJpYlQrM8xfgfiGbDXRnqyb6nYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJcr5TsZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9D6606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJcr5TsZ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so2877607eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794027955; cv=none;
        d=google.com; s=arc-20260327;
        b=QqxCasdK90trwIAooiZJVhCPFamjhkccXLfVIs6Qp/wqchCEdVu6ZCbvxFfURlFwXj
         /r0UMlSvudFL4JXCJvVKaz+0EnOAPnS9mvxxuzsXncxvsWDx2dE536xm7fhGkiNPgeBJ
         aLeRqDafFoKRmkjKscQVx2gQdroGyN0PE+1H7fa8h/ve9wzl5rRkeCEYs0PK6ZPeSdcx
         Bi1g4A9gt2ieOpjMKGKCdQo74G9LU5x8v7ixQi9AeTJlU2xVm/Erd9n741SU7Cp2Vb4q
         lLFCs0cZRqtboA6tCt3ZgDu9Dy4EU5pBg2T8i6Z86GhiA9inWcSslPzLFWjPqIRQiD1w
         Z9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3B/jiwJxW+xAIbQiYYm6bOuOVI/U/8kix0T1R+5+pM=;
        fh=LSAkeTqQL28WPjHhMXWJg+5BFst8LAyl+DbuWnw/k5o=;
        b=jKV/gMe+KxXoS3sJ25s80lUhYEBgf/ME0wD4PpzlLCn8V0ABbTcTkqzKK/3/xALhUy
         FDuJ9z3EFGPQf6fN9TYJ+0EyDnqa/nEoqR34ek/nWzktaMNziJ1XQMdtGAhIC5mUSpIQ
         P5H2SS9IPQMlWMTcSVFjlGe4GADG0rstvsG6FjU8CHGNfgIiXe0/QNbcmZQaRebGMJPP
         PA/xMNPSlk7JdpJvU0bRY7HSu96+vahYqYod6yXjrtB8ZJ2mJ3PDcBjHBQFU78sZcowj
         hAxo4ftU7eI2qhDBP8qdAXE8avQzNTH1pscYVX00g6Rdstu0aLIv8fnexO7P6ngWIP6T
         uwUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794027955; x=1794632755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3B/jiwJxW+xAIbQiYYm6bOuOVI/U/8kix0T1R+5+pM=;
        b=YJcr5TsZSqjKmrNme1j5Ss5AEK7ZrpRBvARDJHjFsECerF+1r12Ypi9REnQfQ7S8aF
         g9/RnnbNlZqeF7zaLQXfGlBpc3fpJgjwl60r1/Fmc1FJ3lPnBPdjQjF0rWOw3Dy70U8C
         yTNQFx1UOTyuq/qaDmzaGLe8C8DOI+vzQA47fZ91jl97910j4Csx+AqZgb3oxrJTwT/U
         3JfUM/NMbQuxRzzcbPI/wmc9QwSwy6x21DlZu6HGYR9G2K1yF9PqczMaeb3gJeTPJdH6
         1UlZLfjzffLZh8ZpAsSD4HuJB3p9mNDWsalkugWMo/LmcH3MUY28NYfJ7t/IjlG3cluk
         pySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794027955; x=1794632755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3B/jiwJxW+xAIbQiYYm6bOuOVI/U/8kix0T1R+5+pM=;
        b=APzSqD3DKIs4VLFBlAONiFx3QOKFf7eATJzZ+M06mIBMIFZYwJYfi44TeFyb/+d35d
         bC7wlnVj0b/9+jb9AfS/k6bTOFkpX8MLSfMSjNL1g04XURW4KzFFf5igSzVrWGZe2WQD
         V13reQ8deNgitEF2ipge+F6uqKZn4ZnJaz2XRlt4JKaf3If4fpYekDkPoNYFJw1jAC+d
         Hibw253ydDEgdJtX4DazHSUXYnxIStXL6MCJ66EJpUs9gnzDi0+dPfWGb01Xv1NJeeVy
         U3ibAwouEtvICZbopFMGuAO0STSlbVTJOCBEbDhA93qhqYx8/1rMdz2ckyPBlubn3k+e
         pCJw==
X-Forwarded-Encrypted: i=1; AL+hErEgnyjpBva8t/wpsWNzFu8Ucbg9Tlt9sl3mjoSWOJjzeabsK0ayV8xAx8wWX620eqBC6C6gw7JwtZO8tfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xgP2G1z41I/g2TfeVxvSyqX0feHXRWg8eiQBxTuokAH7T1nwP
	D/qglE87cUMbP175eQNcOxulwkKmWEa4fmQGBbqoLVJFE1LnhKC+LYKYgH9myfDfCaSqMvmV9xJ
	KA9rgDkfHxLPny/pnKSp7/u6LB9dl68lK3Mt0GcY=
X-Gm-Gg: AYBFou2ibj7rLoZTOk7Jyxh3yf4joH8TX6s5bNIhM/OIQpnLg2gLZTYoZN9cnx2xAh5
	TqdL2+psoFKEuqFbPndksjJ1nPMI/dGNa0ruKKJwf1gBi0fNnrumnQuFPJOLMgIIL9u9HO7pEAK
	twG9iObxNA9HR4rfJTvJ6M0aOikyxSGidZGh8w/qdr5GGeM+Ef2o//LSvNqglOG353RXy7m7QF+
	UvCtkjjeBt9SNdPfETXd9d7nf09hzc16HGg1lFENnY4JEjTnJTExN77bloBukqoUoxstEuklHEz
	DoK9uv9NJb4Qog8ONlU7ylgtze4IqXnQCkHMwCtcNPFhIQYtxGWYcYlPse6zMYch21PDUjrrxDP
	Jbxd9lZJJQurIEpnAxghWnYRCXtnNse5IN+A=
X-Received: by 2002:a05:693c:2581:b0:36e:8410:ecf6 with SMTP id
 5a478bee46e88-36f75440b61mr6095293eec.13.1794027954292; Fri, 06 Nov 2026
 21:05:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106174737.2580011-1-lcy8047@gmail.com> <20261107013159.7df2ab9f@jic23-hlaptop>
In-Reply-To: <20261107013159.7df2ab9f@jic23-hlaptop>
From: Changyul Lee <lcy8047@gmail.com>
Date: Sat, 7 Nov 2026 00:05:43 -0500
X-Gm-Features: AclHuK_TZI3zXzHPNwo-Hv6kt65IHQinw_K9egau9dqqkvu3RgUIkBwnYQIoXcI
Message-ID: <CAKefsHsnxGZttZ9rJGehiUX3PCSWyxFevExefkCc3mkg+FGaqw@mail.gmail.com>
Subject: Re: [PATCH] iio: trigger: free the trigger ID after device_del()
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 7 Nov 2026 01:31:59 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> > -   ida_free(&iio_trigger_ida, trig_info->id);
> > -   /* Possible issue in here */
> This made me wonder - what is that on about?  I checked
> the history and all the code on either side of that comment has
> changed since it was added.  So who knows! :)

Thanks for applying :)

The code around the comment kept changing, but the ID was always
freed before the device was removed. I guessed that was the issue it
meant, so I dropped the comment once the order was fixed.

Thanks,
Changyul

2026=EB=85=84 11=EC=9B=94 6=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:32, J=
onathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri,  6 Nov 2026 12:47:37 -0500
> Changyul Lee <lcy8047@gmail.com> wrote:
>
> > iio_trigger_unregister() returns the trigger ID to iio_trigger_ida
> > before device_del() removes the "trigger<N>" device. A trigger
> > registered in between can get the same ID, and its device_add() fails:
> >
> >   sysfs: cannot create duplicate filename '/bus/iio/devices/trigger0'
> >
> > For example, adding a sysfs trigger while an hrtimer trigger is being
> > removed through configfs, or the other way around, hits this because th=
e
> > two paths do not share a lock.
> >
> > Free the ID after device_del(), as the error path of
> > iio_trigger_register() already does, and drop the "Possible issue in
> > here" comment.
> >
> > Fixes: 1637db44413e ("Staging: IIO: Trigger support added to core.")
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> Nice find. Applied to the fixes-togreg branch of iio.git.
>
> One passing comment below given you also deleted a very 'odd'
> comment!
>
>
> > ---
> > Found with a static analysis tool we are developing.
> >
> > Reproduced in QEMU (x86_64) with two threads running for 20 seconds.
> > One writes to add_trigger and remove_trigger of iio_sysfs_trigger, the
> > other creates and removes an hrtimer trigger in configfs. Without this
> > patch, device_add() failed with the error above 160 to 1148 times per
> > run in three runs. With it, it never failed.
> >
> >  drivers/iio/industrialio-trigger.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industria=
lio-trigger.c
> > index 76926fee0f84..206ede2c9b3c 100644
> > --- a/drivers/iio/industrialio-trigger.c
> > +++ b/drivers/iio/industrialio-trigger.c
> > @@ -105,9 +105,8 @@ void iio_trigger_unregister(struct iio_trigger *tri=
g_info)
> >       scoped_guard(mutex, &iio_trigger_list_lock)
> >               list_del(&trig_info->list);
> >
> > -     ida_free(&iio_trigger_ida, trig_info->id);
> > -     /* Possible issue in here */
> This made me wonder - what is that on about?  I checked
> the history and all the code on either side of that comment has
> changed since it was added.  So who knows! :)
>
>
> >       device_del(&trig_info->dev);
> > +     ida_free(&iio_trigger_ida, trig_info->id);
> >  }
> >  EXPORT_SYMBOL(iio_trigger_unregister);
> >
> >
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>

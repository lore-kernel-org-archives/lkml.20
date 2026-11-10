Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318889;
	b=r7W8ITYkZw8wYnpEL9zJXdUsuk2vaowh0mPTvEWpXuxqnWc3aPz0XYCmcUgOIh+h83z6
	 cEYLKbw6O2GEJrMjAiCcLNdwlgMFYKjNTZHbmO9vYLUSCbz1Z/Vs7aSx/bYuAbgnf7/Af
	 14DJgb5UryrK5Dr4O8f0zyT+FkiJY61b7gSmWJNxKTMtiHcSJh2xE+vpJv14KTBhmG5Ul
	 Yf3sudO0g29GIpT6IL5/bOd5mhBuIgeNY/jX+mwniiYZ9pSHFveAcx2NTV6BEjVYbfEbo
	 cspiQzERSI2cGjV5TRpDyQduNNag8VL9/b9raeCfNMT3jQyu1xr3q7xdNXc9ylcuCNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RYPhgJGQCwOuBRuJsUZG5jqL37WaDmQ33hS03hfIFgk=;
	b=ei6SPJI4F3Cio2oXJPb4h0bSsRSCPUJfUrt8BBhW0fbtXV5+eH9icWUBFCqYvobQuaRy
	 shCWN2D3RBRMaP7Ux3CI2kROLND/xQRU+vTK2UCvH+XiEawep5mSnE3hMadyR5DFLKTXP
	 iF0F20YAW9kSBewRuQ8i4o/qc/AuLa0jM6AQ7oIZJeP7wsDLj+NRas182d3BD5AyLBprH
	 DsIUwahbUJ+GLJn+/qwrKa6vL/Dc+O9vFO5SdNcHh2M2/7IWqOS+EuFd9Xx1ufB58zJiv
	 JYAsZQnTNH2tjLRwZigAURS+56O8Blq7CDGwYSQfgFmOcE1HCqBkd6yJjI2C3MynAhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET24+BCt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF0606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CF0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET24+BCt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19911335e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318887; x=1794923687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYPhgJGQCwOuBRuJsUZG5jqL37WaDmQ33hS03hfIFgk=;
        b=ET24+BCttaFJhFjFN6Eks2eX8C7MGzZ1SLB8gH6G9gFUT8E5qOKkXXMlpScMkMSxwP
         Du7v/5gUag1yzuXJxIFaV3YF0d4wo1IWLcZbzKLDnlNn88334khYUalL7W8s8hmLYldR
         PiyaJyEKNFOkTELbJ4iF7ktMe9D9cL69s6PRaNXKL/bNZOLQD/AU9RHXCaX5vnfLYFs6
         wae4vlZoYtiIXmHxCDuImSOykO1mEIMdA4Y5xk4b0LqG4JG0DwiCmuV9GSlHgGAIrOOj
         fDeAxOs/li94i9Os4YCgtYzWf49OlUt1xLE5+7c9mNFksNfT34pPe/o+113YlMRCO7tU
         Kh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318887; x=1794923687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYPhgJGQCwOuBRuJsUZG5jqL37WaDmQ33hS03hfIFgk=;
        b=ADRe019KgcPkgWOrjhR62XFfvxIid/AzBK7qnrCyb0m2u9JWkn3ufufxfVj1tES1WM
         3WUXNbYlnQqVFqhwuEkhjX8cbyvvTllwazhrTvsrKjgvJ3LqJS0YNXz159IGvjxKZtDU
         UIz12WCZ2WzMMbrFZDbD1ZbI6iurDRORpj9GKcWf+wGltpYDsvLq4VxDTPhTvzp9NsJ/
         raOCeFE/Er41YJzU0wYN9Nlo0DNLXVIic+i+tAVrV3UnpxTeb/oquRRjMUKGj4hG5p6f
         PGAUeX8pQyku5pU7wDXKBlLpABgXcpGjfzRF5bcYfMj+3eebImJ7lJsEqNp+C0maVqPu
         Vnkw==
X-Forwarded-Encrypted: i=1; AL+hErE8PllhXoeRbu9LNlx0jmDGjjkjm3tkfEReTID4nPXYPqb0tyj7NDmB2RqbKwQjrwRkLmL8GZ+7K783YXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+APNQ+PV/9aNVmxa1E8Qcqlni3jcspJsyuCUwt8Chq+qJpvcGA
	v+im8SyKoUPcjFlicgbRu2zQKr6M2NeMc4yim/Js9NphNCt4DIws0EbR
X-Gm-Gg: AYBFou1HCF/Toky32abXU0tZTe0xfD2wn0bOV8LBeG8ayj/d3vvLsx1prMVYFiSUA00
	tYZE/WSUnqT+SjEWqeUoDssIq58pH6iWntoYQUgey9SUu2QLEmoSbD72hLWoTkUKlsqDBF+hWDc
	LeDGFBdZg2Oi54+wS3zZRVa+wTuLrOrg5+Ko0DPpFUz6obU/dYzAWZs8O351HtY5bZIlVtUQc3m
	qbBEPz7diYwXqrsK+/FIzm/iGlwoi0rVLE6YuFUH+BRo5X07+/9Pm8xXoC03Is//3RGpfc6jHzY
	XcUzJmHoR2pEbq/StfHvfZrp8SrBqQRiGVUgqU9xSnvEufG39cvSgyolpOvsafroRQbM3txAHnE
	3XkzlTNGdBVNf0Q3tjszgzCuxGVcGWWYCWfJTWkZXWeSapV1wXU8srrgZnP5xs170uaw+H/5tQz
	GDB+KMGIS+VkJmmhS83g2WZ3VKvP0iqq8HccFv5kYIcU4gUpqKceEQgfBSaBBSFh0u8/PF6GQoh
	cvh4v3DsLzlNqpXvT6tAjFblG0D/1y9XE7jbzbL5Bhx47XMr+vgoE0466WA4exn7/h6zrgapEAE
	h6wE9CAMSSPjxjEejbjAM6oq/mh9eiUVPhra7EUbgzlMnWuyBlSB2ah/e+/UABqRoA==
X-Received: by 2002:a05:600c:46c6:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ba023508a8mr51664645e9.30.1794318886866;
        Tue, 10 Nov 2026 05:54:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm104946385e9.5.2026.11.10.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:54:46 -0800 (PST)
Date: Tue, 10 Nov 2026 13:54:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, hverkuil@kernel.org,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261110135444.7d8070ec@pumpkin>
In-Reply-To: <cd073632-0919-4015-8daf-39cfe24391e8@kernel.org>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
	<cd073632-0919-4015-8daf-39cfe24391e8@kernel.org>
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

On Tue, 10 Nov 2026 11:08:30 +0100
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> On 06/11/2026 08:46, Mariia Nikitash wrote:
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls used to construct
> > V4L2 card names in the TEA5777 and TEA575x radio drivers.
> > 
> > seq_buf tracks the current write position and remaining capacity
> > across appends, avoiding repeated scans of the destination buffer.
> > This preserves the resulting strings, including truncation behavior.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>  
> 
> Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> 
> This is silly. Just use scnprintf().

Or wait for someone to add a call that just does what is needed.
In this case the first stscpy() returns the length (and it is often
known).
So you could have:
	len = strscpy(buf, tea->card[, buflen]);
	len = strscpy_at(buf, len, " TEA5777"[, buflen]);
or:
	len = strscat(buf, buflen, tea->card, " TEA5777", ....);
or some variant that will do a strnlen(buf, buflen) to get the offset.

But it really is best to leave the strlcat() calls in there for now.

David

> 
> Regards,
> 
> 	Hans
> 
> > ---
> >  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
> >  drivers/media/radio/tea575x.c       | 10 ++++++++--
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
> > index fb9de7bbcd19..2b1c7f6ddd60 100644
> > --- a/drivers/media/radio/radio-tea5777.c
> > +++ b/drivers/media/radio/radio-tea5777.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/slab.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-dev.h>
> > @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
> >  					struct v4l2_capability *v)
> >  {
> >  	struct radio_tea5777 *tea = video_drvdata(file);
> > +	struct seq_buf s;
> >  
> >  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -	strscpy(v->card, tea->card, sizeof(v->card));
> > -	strlcat(v->card, " TEA5777", sizeof(v->card));
> > +
> > +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +	seq_buf_puts(&s, (const char *)tea->card);
> > +	seq_buf_puts(&s, " TEA5777");
> > +	seq_buf_terminate(&s);
> > +
> >  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >  	return 0;
> >  }
> > diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
> > index c37315226c42..e49228eb7c46 100644
> > --- a/drivers/media/radio/tea575x.c
> > +++ b/drivers/media/radio/tea575x.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/slab.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/sched.h>
> >  #include <asm/io.h>
> >  #include <media/v4l2-device.h>
> > @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
> >  					struct v4l2_capability *v)
> >  {
> >  	struct snd_tea575x *tea = video_drvdata(file);
> > +	struct seq_buf s;
> >  
> >  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -	strscpy(v->card, tea->card, sizeof(v->card));
> > -	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
> > +
> > +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +	seq_buf_puts(&s, (const char *)tea->card);
> > +	seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> > +	seq_buf_terminate(&s);
> > +
> >  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >  	return 0;
> >  }  
> 
> 


Received: from mail-dy2-f20.google.com (mail-dy2-f20.google.com [74.125.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285E6395AD5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451410; cv=none; b=emHXAfyVhuE0cCpStIDxFfPrLu3Hms+OJmrZEEf21BVZJ/O3Zk5DeDqgmKSd8ODdddzUBwShJgdwMh5nC3mAC9Tb1Ft9+OmmeELM9OmnbCkupNeAzS3/xLTmSX7WdRHwUY9mAaO1bOdvUHYsPtDbOpkOMoQs1DnnHZ4dfLiSd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451410; c=relaxed/simple;
	bh=vK9ThpJmW0w0IXbiBvxvvEMaNfFkqS+ai7zf7CtlixM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbxVVvc7AKDkULUELCvrnYc3N8rddjvdO/0QTSJ0x652UbJZ07QryWDPH5cAXyTl+8EWad1JxadQKnTBixk/HuXlvAqC5oSNxL70iWOB1E5TnK5SvS2iZDfuJY+xZ4JD3JruFw8WnSxXDTWo7OcpO6x5GsKkDEdOJQRZsRGGswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzTjvkHl; arc=none smtp.client-ip=74.125.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzTjvkHl"
Received: by mail-dy2-f20.google.com with SMTP id 5a478bee46e88-344447f9c3dso12834eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790451408; x=1791056208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QX41ahyGOpU0kHZy9lRmPzsKi/D8viXue0ia/YOVuc8=;
        b=KzTjvkHlcaLSMTOxAK6XXsRC3xrQTbVQk81vzdWc9Rq600TVW02saUhZxkouTXvP44
         lcsErLJqwtd4k9wVSoyvXi+Nx+wIyy7djTaziTI5xwLW9aJas1Kk7nzAzEfPpIQuwvEu
         noRM+gEIJeua9w0213IBNHeMTcoMZfaw5leeo7QBA9GSiWnfs0AyvjaTTqXYGTihdg2V
         MYeD85YPEfrMEKkCFYt3enBZqCftGaCK/bjVK5tIFq7Jt0cKvUDq2w6stMb3gy6iCEa2
         MoWl34Dkj3r+AvHN2T+V2QDZmKi8Uq1oabo8eaDrBKi6W6ZYCLFXgpy3zNnJd1pI/KTr
         JWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451408; x=1791056208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX41ahyGOpU0kHZy9lRmPzsKi/D8viXue0ia/YOVuc8=;
        b=YtHMnNVSq/qLAhvLd+67oDFql45Gz0pVSkODhRMhIOljImmByb6TYQoMu0d6jGG5VH
         ldvu/aY5TnBBevgexv0+rxbyLWJOqftkoAK1ZJe7+qrYZYbXBkABVwa7kahmV5t07Fkw
         ShN0+ZX563vAsBn6aTUS6s2ZdnbhJGfwiW+KQkQpWcLO5/+hAGf0tZ8l5IrtG8/f19cz
         xHQ7vjSlGjPZRetn4OfXK30P93pEoaxJOKRZ2q9zK0OoANzGMkECT/uyx27bptZf6BUP
         xeel/wFQ1R+AJjX+2E5Op05eOt0kcWeYA0VA7VvjO0rhHeS4rct5fl+I7Mv6Bb2ADucg
         KrfA==
X-Forwarded-Encrypted: i=1; AKwUvBzflJkjfCzDn+tclPoCPM+3F2D7YQyUnZ9IaF0UhkVQ3n9iKNdC224CaEge73poow62daZjXLAfBvAnwHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYq3jOLf/inSbPI3PF+xw2kw8pwXTAk6713o1UENM0ESQ+dbPw
	4tyT3TfYf2IlgP7pgzpsdvmbqoTKFmGzC4hZwF30GINrAD2lzf2sdafT
X-Gm-Gg: AYBFou3BKPzvt1YJ8voZaATyfwrk/IRpIJ6tqGg4d5BGbb/isoWWHacn7uA0SFUYfNV
	XnIqfxDp05953qv85WeRCei1lEi1U2p7kBNEA3tIyv//tjRDN6m4kEBTJ9qBTEwwgYDBp1Asd8x
	wGW788Cpv+2LX4g4IlA83Og6tIyibe3vji6jhTzBAbY0tEENjOpBiT+Zc20aZzJnmd7nqzI6VPr
	LaosYlGhM3QQSr9ExSkRoLAjqLPLQar4wD7gujcly9e8aYqaC1zaza4eGO/Ww4M3JNt4EspCy6U
	RuOK2zyuFF3/rnFuMdTJvJIznSmeQU1VZsiFNa4ZHslHdd9VHFKWrAzgJgbmyzircU5oQx8H8zY
	xo+bMbPKPaF9+Va6fOPgY1OdqlWTwQQfU/jdNvLV8745h7y1k6w4C9e/MzLamf7fMTvtupPebpA
	5bW0w4OeWCyhicaxlmZWWfLsrfKkStlqpaLq31nZp9hu43aVPNKwWG4om8bCuuwZyak2NdER9x0
	oT1sq6bM05PlP3mTGzxxtCyllXNndceTOLXaXw=
X-Received: by 2002:a05:7301:1f06:b0:33c:719:f1aa with SMTP id 5a478bee46e88-3426fcc832bmr5527226eec.8.1790451407873;
        Sat, 26 Sep 2026 12:36:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1baf:781d:ff3:70cf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm17749600eec.29.2026.09.26.12.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:36:46 -0700 (PDT)
Date: Sat, 26 Sep 2026 12:36:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Andi Shyti <andi@etezian.org>, Rob Herring <robh@kernel.org>, 
	Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: s6sy761 - fix resume ordering and restore sensing
Message-ID: <argZ9Yjigr4nwltW@google.com>
References: <20260923-s6sy761-suspend-v1-1-6fff96e71cb0@ixit.cz>
 <ardMSVsG1RlOOkNp@google.com>
 <187c9ec1-03fe-40a8-8c97-415b1a7aac23@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187c9ec1-03fe-40a8-8c97-415b1a7aac23@ixit.cz>

On Sat, Sep 26, 2026 at 11:55:03AM +0200, David Heidelberg wrote:
> On 26/09/2026 06:40, Dmitry Torokhov wrote:
> > Hi David,
> > 
> > On Wed, Sep 23, 2026 at 03:27:06PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > System suspend powers the controller off and resume powers it back on,
> > > but the resume path enables the interrupt before s6sy761_power_on()
> > > checks the boot. The firmware raises its boot-complete event on the
> > > interrupt line, the threaded handler consumes it, s6sy761_power_on()
> > > then reads an empty event and resume fails with -ENODEV, skipping the
> > > touch function setup:
> > > 
> > >    s6sy761 2-0048: PM: dpm_run_callback(): s6sy761_resume [s6sy761] returns -19
> > > 
> > > Power the chip on first and only then unmask the interrupt. Once resume
> > > completes the boot handshake the chip comes back with sensing off, as
> > > at probe where input_open() turns it on, so the touchscreen stays dead
> > > after resume. Send SENSE_ON again when the input device is open.
> > > 
> > > Tested on a Pixel 3 XL over several s2idle cycles: resume succeeds and
> > > the touch function and sense status match the pre-suspend state.
> > > 
> > > Assisted-by: LLM
> > > Cc: stable@vger.kernel.org
> > > Fixes: 0145a7141e59 ("Input: add support for the Samsung S6SY761 touchscreen")
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   drivers/input/touchscreen/s6sy761.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
> > > index 0f24a9b730635..c52c45a7d1029 100644
> > > --- a/drivers/input/touchscreen/s6sy761.c
> > > +++ b/drivers/input/touchscreen/s6sy761.c
> > > @@ -495,20 +495,29 @@ static int s6sy761_suspend(struct device *dev)
> > >   	s6sy761_power_off(sdata);
> > >   	return 0;
> > >   }
> > >   static int s6sy761_resume(struct device *dev)
> > >   {
> > >   	struct s6sy761_data *sdata = dev_get_drvdata(dev);
> > > +	int err;
> > > +	err = s6sy761_power_on(sdata);
> > >   	enable_irq(sdata->client->irq);
> > 
> > Why are we enabling the interrupt even if power on failed?
> 
> originally I moved the enable_irq after condition, but LLM kept convincing
> me it's wrong:
> 
> enable_irq() still runs when power-on fails. That is correct, because the
> next suspend or unbind calls disable_irq() again through
> s6sy761_power_off(), and the two calls must stay paired.
> 
> In case of failure the power_off will be run anyway, thus it make sense to me.

The LLM is wrong here. There should be no next suspend if resume fails.

On unbind it is OK to free a disabled interrupt as long as it is not
shared. The request_irq() path will reset the disable "depth" to 0 (or 1
if IRQF_NO_AUTOEN) and everything will work just fine.

This is different from clocks and regulators that do require matching
enable and disable.

Thanks.

-- 
Dmitry

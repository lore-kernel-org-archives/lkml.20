Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602032;
	b=iiAq+PKLL9zXZOwOU4TqZQP7kRfPolob4N0J+KIJSIaO9OxWpai/IIejmPOqBWAAW7oN
	 e5FxZEx5XyyLXWJXxI4lN7Ho+5oCCHU8Dvh/kOJTROX05yoIiVgDMqadU/kaJpEC7V6+/
	 mB63hmZtLuem6vnbGyqxfIbcB58dK6i2qZBiYULp/4NmBY0mVDysOMyPq7TjpQfcBaBh3
	 Mle9Y1P0vHr2geycRnIdb23Z5l6C+WUiaAR7tT0teSMh6jq33hbQ35Jqh/ZHfNmq9IGnU
	 YrEz9QYj+4KVBX7WDNdKoBiyaTnrlCYuAY/hbBfmULB66bXms2ktyS5GMLqCAY/zV8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4p+sU87b0SPhlui/+SUmlIQxPYDUposWA1I/eyb2zBo=;
	b=QIP7qLUMqrP6LxCLAqkNdJ6Sza0Dyyi31y9CkwW7t/C/7pnU4HXIBCNzAh24YUhPo1OI
	 sLGODwtLxVq1Bsal5Gd1ELf10BL++D7dYfzviW/0SeDS53G0mxW2iWlu146gSwP3qMSxG
	 mnLR/FN/PAA8nuHX2HSKGU4pyuuMxYpaGYWjkDj7MZtWZwzRAtm6DoO5wBGpf2xwgZTV2
	 ocubYWuHD6Y3CYn7UuOo0etRhSIL33f/12SDwr6qMoTWotHxFddBnrv+TTmpX4Pw127vA
	 F7OV3pmI+h9EoUeKlmoYwtsq5xi4SFauU1fz9K5jZrjNteaiGgchJZiLbyk/gqbdbJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SDvSrkSX;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B9F606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B9F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SDvSrkSX
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1677344eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602031; x=1793206831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4p+sU87b0SPhlui/+SUmlIQxPYDUposWA1I/eyb2zBo=;
        b=SDvSrkSXRN7b16uvHn0owN7P9wALOR+qF5x8hSgG0gxkjdrQLtuwhv2L5BARh97oX3
         aS1S90uq9tOtN3LVBcUJNa2t2TXEPT9VhIRziQXWF5/SVExqtLCNRjJOaR/aNcbwTcTb
         2urftg2aTjo0Ncs1SWWX1xR9l7NrXFdTLhKKnyDfYlOqypf3qKvZ50JkKfSXvX7UOwI/
         L86Pv04dIDfsNWvcSpXLhdETZ3Jc2t5BuoqjWhKgX7vQ9CyQFsYYkKT4by19rmtOpLKC
         Kej+lquPMAO/imCte++Zf4948MUu8wD2XHZZanc8LpJbGt7lCjPYGF8TMGUQcJxPSdac
         yAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602031; x=1793206831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4p+sU87b0SPhlui/+SUmlIQxPYDUposWA1I/eyb2zBo=;
        b=QOyzrCh2bYi+2wb+mzyWBV3xlbMO3OWWaxqRqFI5/AGvIDXu0sZK8gk+rbeelDlLrs
         h3MwKf04B78UALd1qArmkJWO5KzwqB6CkiFUNC3dvmNzmhDzWVpbD+N0m1XeAieZUXlq
         Ds/9s7PVWxmWJZkdTaCNhy8Xlcf4K+zAaV6N+pRbEhNzAdfIqwZJ56wgCcdWSWigj3EY
         LDOCXKIa5j3LPcRo3EajC1kFzXDum8BT14Ez/0ZnjqrBsdYpGOPOBQiuue7lsb5yoKn4
         2w7wcTlQZcT2hTNMJR8FxCUTVx3guEfiWi+QKi/ouZSQKS4i1fhXstQ/rt0lowFfcIHs
         ttNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdVYbHMI4nGFpYpO5Uc+gCtedyazy3g2eI5Snhv1roygmhP7W8YquuOlyKkIyPVR7VBQKkspBgERiZPmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGHwCQX5qtiA76/mDs68XCtOMmXB7ZXeowDeBbLAFjpsA7xVsC
	VjACInTwq6TlYRkxW7/lfDUPZ8o6jtdSwNQuTcqGwLhz6i/di6BgDzCE
X-Gm-Gg: AYBFou0PaIkjse9B5StoyCtHBxJIao3bS4Fu/lAWMMcAr2A3SIOIGMbi4sYhHNkiR54
	+OYlEJWT9RVkrOcGnF1po5o/E+BtJSCRXDHA+45LcOXAx1x36Ed67uBz5qpwX71n/9yMEzbRjft
	S5glALPqkJ0seOfUgiOJasYj/xaqoQYpnkjmwr6q6oPaT4An2N9TCQauVqdFkDRDDGX7/HckUu+
	fesIiPAPOFSIGgX/10d0DxA33jy7RAMS0I3/WLP0AhjLcJp0/DtW6pmsIshgPbwawb50wFLnJ1O
	mY8bYLHbpfB3BF28HBPiO3YZxDtV41VInzESTi6/+L0G8s5IdL/phoC+z+eWc59ki7R9t1kOqo4
	gSJPj/wE4Oi7nrOyOkbChZMwiW7p75osfkzGxNX27vq035AjJWKaIpqvwcxGzsHWM3yIlyE6kdF
	ql+w6EcRheYzNBiODsRgNaOF0VmtrfZwv3bxTOT7FVKk2QIMxQ+T+7n+0eiqZ3e1ho7TLrO45fR
	uNoAYdgfP/xi+FRoMwRdtr+q0of2Klq4UMteXDfE4sCRAhE/E8cTzwTRtmFKRuUb6MBiYnf80tl
	uTWY+8tkyVQ4CgrKndnxkg==
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-3675e31ce6bmr3904222eec.20.1792602031067;
        Wed, 21 Oct 2026 10:00:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ee5e3sm8459829eec.4.2026.10.21.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:00:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:00:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Shihuang Liu <shlomojune6@gmail.com>, linux-input@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] Input: joystick - use usb_make_subpath()
Message-ID: <atjvKMOXQY_psYcF@google.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261021123146.17202-3-shlomojune6@gmail.com>
 <ati7yINv0_Z3yPMg@debian>
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
In-Reply-To: <ati7yINv0_Z3yPMg@debian>

On Wed, Oct 21, 2026 at 03:21:28PM +0200, Alejandro Colomar wrote:
> Hi Shihuang,
> 
> > Date: 2026-10-21 20:31:42+0800
> > From: Shihuang Liu <shlomojune6@gmail.com>
> >
> > The pxrc and xpad drivers build their input device physical paths
> > by appending "/input0" with strlcat() after usb_make_path().
> > 
> > In preparation for removing the deprecated strlcat() API [1],
> > replace each pair of calls with usb_make_subpath(). The helper
> > formats the USB path and the "input0" subpath in one call,
> > avoiding a separate buffer scan and append operation.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  drivers/input/joystick/pxrc.c | 3 +--
> >  drivers/input/joystick/xpad.c | 3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
> > index 52d9eab667b7a..1a11e73d7cd04 100644
> > --- a/drivers/input/joystick/pxrc.c
> > +++ b/drivers/input/joystick/pxrc.c
> > @@ -169,8 +169,7 @@ static int pxrc_probe(struct usb_interface *intf,
> >  
> >  	pxrc->input->name = "PXRC Flight Controller Adapter";
> >  
> > -	usb_make_path(udev, pxrc->phys, sizeof(pxrc->phys));
> > -	strlcat(pxrc->phys, "/input0", sizeof(pxrc->phys));
> > +	usb_make_subpath(udev, pxrc->phys, sizeof(pxrc->phys), "input0");
> 
> To be honest, I think the composed approach is more readable.  You don't
> need to learn a new _subpath function with all the details it has.
> 
> Everyone knows what a str*cat() (or str*cpy, FWIW) function does.
> 
> I'd rather improve this by adding strscat().  The reason for removing
> strlcat(3) is that it is vulnerable to DoS, and that it is inefficient,
> but it is good at producing readable code, and a replacement should not
> degrade that.

Well, there is absolutely no performance concerns in this code, so
another option is to simply leave it as is. I see no benefit here from
using yet another variant of str*cat().

Thanks.

-- 
Dmitry

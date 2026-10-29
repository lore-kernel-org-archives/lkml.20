Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289044;
	b=e1kVrEHhOp8fncUtRLSuWAT/wW5pokYsNf6RpVckP/fehhMcDmKBozznlXSWbEBAdh7m
	 KPOUcdxEoZgBI4asyeBfEkqV+cF1Mz1kzjIyJxlHmLuX5IrqdLCmngoVWA5UxJd+hSM0J
	 +iv6kgrZZZoOgGQmPvx9JSgUBNBzsKE6un6+DSz0yIEBwcO9OXUvaPWj2aMeTD/kbnRyH
	 W8nzVEMNW6zfZKo6UfPY4Ad/vQuKS8oBmJ8+QAEuWtmIDaOiinK9tLr819otoHAaJ4Q2h
	 Xs4tG7XIWtrC16gVb9euqJD0JpvT2A2xz30blDouwhRsc7GWbqxqZcOKxNr3ZxJYLsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iQbVa0edXFDC7cRO+byx8KLZb9+VOYhs4XsToamxi9I=;
	b=XqAhgD8AJ01idOGc8dS/K8HUyRTe6lRulkudyFn9k61DgnbY5AHD8xKEZ3qtjD6/5Px/
	 ig+orJdU9P9umuufVTA+7fLcQhuIDFaPT+3HkjsncZB87TnYW3pO+9/TD4D+lAJhuIpoN
	 FjPpauXmSXZqnujJZVbVxlksLnzjc5g+djNqYyUg1HShJvh5B/L0CgaV2eDT9QS6XutmQ
	 Hcv3MlAld19oMeRXqKz2d4VEFHliCyZQJtEC7kktbaDXsUw/LIpEUgZe81f0mCPZFBjmf
	 cijODJo65WMAyagDVVRtj6eAiAkczFyZM4LrgDDUMEBXS0OiqaBOkrQzwXag4mywbxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBOVepov;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE2606A333
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADE2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBOVepov
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so21147825e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289042; x=1793893842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQbVa0edXFDC7cRO+byx8KLZb9+VOYhs4XsToamxi9I=;
        b=ZBOVepovpHxtlwrUJgLpP3LiPvb7Y2olbHRZqrdIpfeYeMRp+8TpeZwfSuTArqDo+c
         pBuvqrXtniKngQzQfQOQnrxhxGDvI8n3DrQql0cSOABSSFxb6un1DaDmnPZsuoDKL+9K
         n9imh6qWeT3XwDYQ7HHQwKxwiUSXmzwxgCFfvap4unWUnNR5lIyjZbG1ZfCgGG14OI/Q
         tUMqUJQJZ1bI0gtVP+qNAL+s9kdZb3Zntv815bMuny0MWur0raOTS2VGs2EFjgtUh9dH
         GFFWflmVAQL3UwSlzwGzwa0W1O5U1tjDKR5PwiiaKL2R6FxXiDU4YCmbP+706PZ9WEKO
         CJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289042; x=1793893842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQbVa0edXFDC7cRO+byx8KLZb9+VOYhs4XsToamxi9I=;
        b=PpQ1rB5Alrk7L/yvTA+moPeLSu9wpskqIIWCp8RUO7uDn8/+jQl1wNoo/Wsk9TKHiC
         t26ZwqHo394adkRxFujTY9fjecB/5vOcaRAXSqy158O002QNn9qVRzRA5vBB9fQxwbmB
         rLc/x1RQa8mjdowHNPCU/yRlF69EvbSgEcGKLX03mZKAB8tq9u3EOi8KwTGq9xqtDh6g
         UcwENxdqWkgcn0UPWlZmmd8NOTCImDckgXff8cS0dpfLDzegmfAMimZMRX+wAUNceodR
         LT68XHDXATYDTt9Lw3xPHqjko2pmNcoIvhfW9M4RbZrQq3wOGSMVqnQAKEp6t8NtPCTq
         7lFg==
X-Forwarded-Encrypted: i=1; AKwUvBxzBWtKiscByfLdGg1gwJ4KIBBB6HErYt+48WWfYhEoU2zWH6q2oxPIUze/Hdnen3l1WK4NcdPH77J4Hfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjRm75FD4StyTVTVK+UT01FTXbHnLIh67Od/2q4TcgEj+lPMPg
	dsfR6KzD7UR8P58x2US+9cM5mxFOPsOecQQE0rc2n8ZQs41c+uYrBOmJ
X-Gm-Gg: AYBFou25YJ0KNI/gEdHI1yftIurT/HKr2XJhl/e0RGQagQZtrepTL+r6grb0FiQVe+h
	7cjezq4JArmDR1V+07GRM8hBGJWNfz8HWsBaCCO4N7lZWa04CMQHItoFSdZtLam2Siw2oTGCvoC
	kZHys/xNJAzkoLv7AVUQBFn2yYpBiwJTKz8bZuUmtOQepikDv0356THXGTLR8IRCt2EaynamP0D
	LTwxOzVQ00ysf9QnjSvPu4B+IMZof+UNsADsMAtW4XvKZ4Kh0nPGZWLCkXSwBiepG90JKixBXs4
	RKWsmMUcX5q55i8wr9Hv9CvIsNjKv415WPmRaruLu29Kjhc9h+3g8nEuEr0Mdqkh1wXhzFUaFk0
	8dGEyn5IqX24pZh3XSVMUQNeUYrxmRNjaVisFiatgUfc6n8djgyPq7w7J1VkLpA0jZ/CmO0/6Rb
	0/oYkVoqqKQmiYAZ1kUW52rynKjqN69l2Nr0XePM0JK049cfnmPktPwBqWy2QR6n9iY7uAoN4Ag
	8E0pk6AeN03z1lEvFnVJ5eWXveO/VESAT5kitofE2czGAUvPz015e9CJVgFpvQL5j9LGQRNx3a4
	yjwdv7544Z5wP0tfOTK/vvu+RbZ78EmDahl0GMtmlW80iyfQY6VqWyBKDd/cZ/+yz0OlugfdoCW
	N7iMDnfkconglxN2OYe5ZiDVvsZ51mIqXqGW1Ma8dNJALa48M543UZyo=
X-Received: by 2002:a05:600c:c106:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a9674e80c8mr103774075e9.31.1793289041762;
        Thu, 29 Oct 2026 08:50:41 -0700 (PDT)
Received: from ernest.hoecke-nb (static-2a02-1368-6200-2fbc-d3e8-e0a5-7e8a-a15c.cust.swissbackbone.net. [2a02:1368:6200:2fbc:d3e8:e0a5:7e8a:a15c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm42419806f8f.44.2026.10.29.08.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:50:40 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:50:39 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, tessolveupstream@gmail.com, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, marex@denx.de, valentin@compulab.co.il, 
	philippe.schenker@toradex.com, alexander.stein@ew.tq-group.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm: bridge: ti-sn65dsi83: Fix DSI mode flags for
 stable LVDS output
Message-ID: <sqilixoei4yw4z52r52vbwfggyjnhdzz62vz3vshrx6wbppa2v@izyujkfcrb6q>
References: <7056b23b-ed81-4d79-b782-5cfcb0102ef7@gmail.com>
 <60a24977-b181-40e4-bcf6-38b65af293e2@gmail.com>
 <DI18PL73UQKR.2YZVZ21V69H7O@bootlin.com>
 <e88af0b7-388d-4b0a-8eb2-a367e24e84fb@gmail.com>
 <DIMMKNT9RHYM.1BRF1S1V5SIKI@bootlin.com>
 <1716be56-ac43-440b-a5df-58cbf571ba95@gmail.com>
 <DINH3J2SM26P.3KE6GE9VPB1OC@bootlin.com>
 <3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq>
 <DLATMIFKDMHV.24XNMCRI2ZKBI@bootlin.com>
 <20261024095405.GA5692@francesco-nb>
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
In-Reply-To: <20261024095405.GA5692@francesco-nb>

Hi Francesco,
Hi Luca,

On Sat, Oct 24, 2026 at 11:54:05AM +0200, Francesco Dolcini wrote:
> Hello Luca, Ernest,
> 
> On Wed, Sep 09, 2026 at 03:30:53PM +0200, Luca Ceresoli wrote:
> > On Fri Sep 4, 2026 at 2:02 PM CEST, Ernest Van Hoecke wrote:
> > >> > Also, from our testing, when using:
> > >> >
> > >> > dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > >> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
> > >> >
> > >> > we are not able to get display output.
> > >>
> > >> This is the case for the panel I worked on as well. In the practice we both
> > >> observe that non-burst mode is what fixes the panel, but there is no clear
> > >> explanation of the reason in the docs (that's what I hope to discover from
> > >> TI).
> > >>
> > > I am testing a DSI panel on our Verdin iMX8MP module, and noticed that
> > > this caused a regression.
> 
> [...]
> 
> > > I think we'll need to either revert this and later apply both together
> > > when ready, or apply the second patch now as well. Right now, it broke
> > > the DSI panel behind a TI sn65dsi83 bridge on v7.3-rc1.
> > 
> > Reverting is surely the last resort. If you can answer the above questions
> > it would be good, maybe we find out reverting is not necessary, and worst
> > case we'll revert with better understanding on what went wrong, and maybe
> > come up with a new fix that doesn't regress.
> 
> What's the status of this regression?
> 
> Francesco
> 

I still need to test and look into this, that will happen either in
December as I'm off in November, or by someone else in the team. Sorry
for the delay.

Kind regards,
Ernest
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626481;
	b=cr4CMwXb3ZMOENWYAZ9I0ruuOWf/UDJHQRJe8F9zKYky/W+h0Wu2RZ7plymR5/9QxxNa
	 fcER34UTysoVd+7z3mdTqR65b68N8sZDxQfucTKW7omxL0oMV5SbHbC2g8VcKmiYf/TWC
	 3CeofQUdTS5OgUS7qmQXwWO/7tqdGpTtWNdcEjU2GDixwfScP/vIEwjO5A027GaIe/UYr
	 hXEVeOp9CAkPWpoOW7ChL3DEjHqqjjC1jtVLj8M45y5fLsBTBDuKW1XI2CtHrmZCUTzA9
	 wxeXNTkvEYoGDEj8EEOpRlHrssdWNgUPc6u2ntiVvzSrRIfsRFgACdwtKq0YoS87dhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6R/u431umGtSkGq0ekXuHtMmDyjJRoaSYLM3qGkDCO4=;
	b=c1sjlajIi7/Swxj7Si0X+lYzz0VKDv0ifAQSxn4JVUMH5h/VK6I12qnIRjxA9XEeeNnq
	 zcJa5SRv4EpU5CPUA6yrn4Mjv/lynYtKM5oxI8eu4nipGLMsMKYNduZiDJJ1LNQsUqngL
	 bNFCVr+8+OvN586iFNd4+skP2gwlzwr0MbffbQgHoE0QTMctKsHwDDUa/8jGQey8w5yvc
	 qDtnYtNv1nUU4Z5ib7/dyVRP9jFqKrstNeomL27QLh2bO1X+nuP6A/XKGKEFenrgt7suM
	 etXAR4GWjWzpKbor+xdLpP9WjAo/YulXCELVC9prBcw3vOcT+o7wl4y0T9ACyYc9LYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxkCrL7D;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8C9606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8C9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxkCrL7D
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so22764485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793626479; x=1794231279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6R/u431umGtSkGq0ekXuHtMmDyjJRoaSYLM3qGkDCO4=;
        b=vxkCrL7DvCsMFVKdBCQhqjoeH7mIRO46s2nHFM91xUvxoS67ayd64OS225aEifEjTG
         bh8Mvh5N+eeUsjMlf9qorQkDt3mSdacKQfcwrRZf46m40gx7iz0kWYv4I/SEFV4T/kyN
         yavJkGnQ9hwYQXohz7ijamiFdGtmWSA8D+w3pVd3l01M6+3pZEI6PH8KrrWgCCJvc4Ip
         YtvrJ42dOYoBenv1dgf2fEdS+Zqw0BCDOfPa31q6ouwp2yHu25lYCgkesXPJLew6R+TN
         WR0N2QrvfP817RY6/3cDexrO5+7KRVpBemi8NMsJ1TAZFVM6cXybZ/YkIscEk6kKU454
         4cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626479; x=1794231279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6R/u431umGtSkGq0ekXuHtMmDyjJRoaSYLM3qGkDCO4=;
        b=h9dHix63E0WGDmqZ0ZyYA76Ok1thW3JzC7Xk2tiVdU4W2bG/EfQ43fGdheivdmy0wc
         YaVv/XQVxyklsAacLaL0D25oiYuhXLmTl+O+8EQRsIXwO2ME9DkfFmXZDGgPfYOh5FgO
         +5AcK1/F0baBbSqZHo1eCyYEprUtWhStwxg4r3ohpeBI2eyyLg+O4nyK6ZitTMQxXofC
         KIeb+t5t77GzBBdy6OS+1WVGs36ciCgKtyEjVtyDVa0OIEtmaKexjdHaYZuBHKKLvtSY
         PLVfEDKGMCLy+r+IQwFJKISv79AsxTGUSF1W+I9J3E9peHh9hiri4uA5i6bzx+Dvi2I+
         e8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+SlZ/72ng9Eisbkd40T4Ln6awS9RZRPhjv1MvM7I6nQ+VR+BKrVJHLBEIuBljq6A4aGoB5u05DrfaYd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2eONsAYOU4xAqYvsobJdEUa4FR6LsXOJJEqs+7DZGUOjPWzWq
	+lat338M/pcKlN4AQhiY8ntH7CR7/sE64Y6oXX4mEUcrxgVFsg3DSaDT
X-Gm-Gg: AYBFou1+ON8cEkvgDjNZMMZMSWBe0yRhhbBh7al0DfXv5cx+tiKFUmwz6IokIlLPNBw
	isMZESkWfanQaTCeCC7rhuYM0JBk/00yKlf3jhtMNbgdFYpKiiwLfpm+hKEK3eh0Kt1SL/xIrS9
	ZRC+QbJrh1olA2k51l3HcHLzYHIPfyidkF001E+K+k5/WBjK58kMjwRuULUBUcAW2v9XoAfbSAK
	wDzcjsuudAMBoSFBSv3yvAFb4R6G84CY+MsC/CX69QuTegr6FLmf9lKXmToKgjhlhgdcPWKAvVH
	btEygHucC7pdylyOyz0AUHDTGYF8SA9v2n57FV7JDa3/DcY6hhLOVbdr/sozB0n8ZfkCPaNpB3q
	OEWIbg++0jr/ltl6NZbAXWlWOJvUokioVkXTTJg/aHouDhWE+DtmP+LStnV1zN+es83lqe+tvlM
	Vz7ls7M2k57V4bllHQOVrzFSmH866oSViceX9QwYXQoa3n1k/Sz+xTH6xo7dNB6K6yMfU7gGxkH
	5XcxlAeplv35EHuMmT1gXbZLShH6XHaan5X14QySBY04FUStZdy926FjmAgwYPH7szJBczFrTBW
	AfXvRgwSUn4mEPmtMNTFuXpGxzZqlMtQNIt1jneXd+uDsQplT/vKlqjluw==
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr253672315e9.17.1793626479081;
        Mon, 02 Nov 2026 05:34:39 -0800 (PST)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm274233715e9.1.2026.11.02.05.34.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 02 Nov 2026 05:34:38 -0800 (PST)
Date: Mon, 2 Nov 2026 14:34:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jianping Liu <frankljpliu@gmail.com>, gregkh@linuxfoundation.org,
 dakr@kernel.org, shashank.mahadasyam@sony.com, johan@kernel.org,
 hadess@hadess.net, frankjpliu@tencent.com, guanyulin@google.com,
 gary@garyguo.net, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a
 busy-loop
Message-ID: <20261102143435.044064df.michal.pecio@gmail.com>
In-Reply-To: <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
References: <20261028041859.1061836-1-frankljpliu@gmail.com>
	<a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
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

On Thu, 29 Oct 2026 22:23:02 -0400, Alan Stern wrote:
> On Wed, Oct 28, 2026 at 12:18:59PM +0800, Jianping Liu wrote:
> > From: Jianping Liu <frankjpliu@tencent.com>
> > 
> > hub_probe() sets the hub autosuspend delay to 0. An idle hub is
> > therefore suspended at once, with no waiting time.
> > 
> > Suspending the root hub can fail. While a port reports over-current
> > or a connect change, xHCI refuses the bus suspend and returns
> > -EBUSY. usb_runtime_suspend() returns that error. The hub is
> > resumed, and when its status URB completes the same suspend runs
> > again.

Yes, I have seen this ping-ponging before.

> 
> Why should root hubs be special?  An ordinary hub doesn't refuse to 
> suspend because of an over-current or connect change.  xhci-hcd ought
> to behave the same way.

IDK what happened there, but we have this:

commit e9fb08d617bfae5471d902112667d0eeb9dee3c4
Author: Mathias Nyman <mathias.nyman@linux.intel.com>
Date:   Tue Apr 21 17:08:21 2020 +0300

    xhci: prevent bus suspend if a roothub port detected a over-current condition
    
    Suspending the bus and host controller while a port is in a over-current
    condition may halt the host.
    Also keep the roothub running if over-current is active.
    
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Link: https://lore.kernel.org/r/20200421140822.28233-3-mathias.nyman@linux.intel.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Regards,
Michal

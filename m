Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1633B6D9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789925255; cv=none; b=Y6WArfKAKm/GRNjsgLchVnlVx8WIiKbrjrODss/v+4xadyhd7sl6ASSEb5QV06vTw5UfUWwuSV+eK7WQimqeY0/lnl06dA0iwyQ94M3w/BYec9i9+6hNfb01XMk4wTorKM3H9BXmHb2MhPlUvYrhLV2yvbOn9t+6lZWgei7Fu10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789925255; c=relaxed/simple;
	bh=1Xy4NCOAjBGdPmJvcRedWnSw8+ESyA1QrdqTyB89WTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSImtQt0+JpzS4aEwvkiSYkSXV+PrtzxfHwSuTLW5npJJFjErumW+m5ib00ubE7yEibbxdw9rrcl3r9bmhTtzjQd7BlYvjmVVpCgNiz72jlfZDt3dTs+7Ain8dhdRs/nR0TNkPq48MQRhSJkSKEXVPi2AhHvFu1CrrxGM4Jn1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgJjaQGL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgJjaQGL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so13667035e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789925252; x=1790530052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gv728gDCR5y3/MpdGoG7nq1FaK3marGJjkydLjHBb1k=;
        b=hgJjaQGL2VIO/f+HEVAky9yc7IAEMWozNceohD9NdprHODs5dMAFA29lpXbiNly1cV
         1yvHG0vWU/ibCxTVj50IVG1GJ+XrRklgoyQcXmL7jARMRR76PEBkMe1afwgSRxjKxOQw
         B930fxN/yeByttx6ulHGC15J1AdneeacMxTkOLYcOj563M5cuFkBf+yFv61/XgEyIArk
         Y4jTIAJ+mCQkErOGckBXHQyFbhWB+Z6nd6ZANnB1T91j03eVpLiKJvby3PMgLQzGTb/5
         T2oaWgdxEI8GtTFzkyrFb81nGQwKNNCA2J5Y6UdfJTJpvUx+hiYWoy1ZbSFEwVRKnsmT
         ZrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789925252; x=1790530052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv728gDCR5y3/MpdGoG7nq1FaK3marGJjkydLjHBb1k=;
        b=mmTb8pwG2mjrkT64KvslSxjoOWQUmyDYLRcwW9FlcAFzPT9SBBHtSibzO/G+xjOU4c
         fO4WAZi5re3jpcXJqbvnYqteJ1MCNUH4n/kKKiPjGujKP3+CHg41JulKsuiObjRh4bQy
         IFID8JQ3zqQ3ibYKafK9JN0j6QqWI7MYKrIMzUUaD/yQPa0n8yI2ifBpt6ZpS4zj8azx
         wqr1QYzWhq8GmiIolCbhdsgzQeCAhQOzBJ9vK7gldTV1I9QnkUG9AlE9XxJsaFKeVwcv
         2/3KpTgAJWff1ouVW4PK3WN2D4uYOV2tXULVJbpe6UWmvN3s7a/OENgk67Ssw9Kn/AvP
         24ig==
X-Forwarded-Encrypted: i=1; AKwUvBwhTryqvI3QyahaxhEO4gk+ewLXELy0SOfEJbySEc/L0wzFs6KVY9hjSb4nLQU8EjSSjC8OE3h3oRlHvFE=@vger.kernel.org
X-Gm-Message-State: AFuF++npC3zLZhYXwxeKyuUShIftEbD8UvQyEK5aff/YmeB4sArzO5HK
	5Y4Mqo5AEHzZ+3gyWI4VrO4po500tZ6imIl5JdW4NrlX62a8iuzDPUfj
X-Gm-Gg: AYBFou0cIwQ407vHyby40hG5sT82PlYX3UUbssWF2aWAzf35xFFs3METDpjwUh5gBcV
	k7IdzFdGxtBdB4D4LRDMDzRZaMxco8qQIyPcqlc4Y+otXtr/P0jz1j3QGc1ojLx2BUrNjf57UHc
	/YwA9Uyy+ClNzAtx7pQyfiJGD5U5v2cxN/eRqLpZ1+2/HQR36qHo/mH2nK7UEfL47LSEPae6n0B
	oY2rFjeI6+vvkFywiYXgCtO5MpV2VMsjfTIvMu65tLUDjNI+Eo8y/CX+YEMjeDTsnIAFUSU50ln
	YCgeuAbA/G/iNzqkPkFPLBhj3UeWAZ/QFVvJSGlaAxW6nIPQ5p5NmM5ZYQMKglEtTV4tYH0ZgI2
	wf0upj/AcLlWSCATV28YjJHPUbOne0r00R9AjyppMD8FseZtUIXoFUIDnmQRjm5iw1MUIFStuBc
	GEDf++rYMvaoc2xZJQXzxUyXA2ow6YV4jb5UNU/K4HHFzXeuVDgK57lE1MgTLQV7bggNSEDz1Br
	DgLiyUciKIw9O7v2wup8PSiq+938sPuzwk8GpDkET5psvl9kOzCfQ==
X-Received: by 2002:a05:600c:6095:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49fc566e558mr124071075e9.1.1789925252214;
        Sun, 20 Sep 2026 10:27:32 -0700 (PDT)
Received: from home-desktop (dynamic-002-214-012-189.2.214.pool.telefonica.de. [2.214.12.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm192189215e9.9.2026.09.20.10.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:27:31 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:27:29 +0200
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: bhelgaas@google.com, lukas@wunner.de, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	kees@kernel.org, xueshuai@linux.alibaba.com
Subject: Re: [PATCH RFC 2/3] PCI: pciehp: Report surprise removal from
 pciehp_isr()
Message-ID: <arAXgbTgz3YINvxn@home-desktop>
References: <20260905183905.997833-1-abhinjoses@gmail.com>
 <20260905183905.997833-3-abhinjoses@gmail.com>
 <20260912115420-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912115420-mutt-send-email-mst@kernel.org>

On Sat, Sep 12, 2026 at 11:57:38AM -0400, Michael S. Tsirkin wrote:
> On Sat, Sep 05, 2026 at 06:38:59PM +0000, Abhin Parekadan Jose wrote:
> >  
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 23b1605e783a..4e17878edeab 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -805,6 +805,12 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
> >  	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
> >  	pci_doe_disconnected(dev);
> >  
> > +	return 0;
> > +}
> > +
> > +static inline int schedule_notification_work(struct pci_dev *dev, void *unused)
> > +{
> > +	pci_dev_set_disconnected(dev, NULL);
> 
> 
> Does this not break what patch 1 was trying to do,
> for everyone who does not call schedule_notification_work,
> that is, everyone except pciehp?
> 
> I'd say do the reverse: make schedule_notification_work
> schedule the work, and have both pcieh and 
> pci_dev_set_disconnected call that.
> 

Thanks for the review.

Yes - I've already done that locally. It'll be in the next version.

I've also been working through the races Sashiko flagged and looking for
other race conditions.

One is left: pciehp_is_spurious_link_change() ends up consuming the
one-shot flags PCI_DPC_RECOVERED and PCI_LINK_CHANGED, so whichever of
pciehp_ist() and pciehp_disconnect_work() calls it first consumes the
flag. I have a crude fix but it's untested; I'll get to it next weekend.

> 
> >  	if (READ_ONCE(dev->disconnect_work_enable)) {
> >  		/* Make sure work is up to date. */
> >  		smp_rmb();
> > -- 
> > 2.51.1
> > 
> 

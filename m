Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655800;
	b=OiJX2YJ+LelNo588BmO7AgpZ2jp6XPbAylF+TACB36ZLCSoWIvIvpN/9JSnW9KfQpCzH
	 H+sn9xE7caqRnhuevvCNhDHjVs1UOx63J9kBwxFJcrJu0KMY7GkJSVzdT1ZXjgZAhDwei
	 87ZMS4O74xgeo0xIkPxU2drOjNk8+x34/0WRDekicU1jSlVgqZ7Bli0cXQOhNE51jzaKa
	 ruGk9fVym5kIg3/dHd0/N8KnFZQiNMIlcTJ986ckIGS6M6f4jITkN5Lwj+7vmvQ3mREUM
	 LvJpPvTLWBAhMIDVGigMlKD+P56q7LGjeGx/yR8PbWuGruD5zVipkqLt8Mo/i/f3dbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655800;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=LxlvDU/4QCNusug68G4LKS9QTwaEvL3BD/53nUc9d4Y=;
	b=5rSJQryl3AXg5ckcSbouGP9eljDwlyTfLCKd3hR1LifjG9Ss1nziDz2d/wwRNMypnYad
	 A1XWUsQG5idp0u64b2Sr7c5AA8x1172NZMjdixgHzNbvLMcAFr/QXOW1tKZPSE8HQQ/EW
	 qLKugKTY1E3Cv2A0itNfWOUGcBOJa8GkKj63pJLJeUQVIdPULo3vsMdIFDCxmu+sG6R+f
	 8oWHVhZ44AURlMfDRKq/eQ/aZqvZUmA2o8YiuZbCy5FxI4aSOVVVVqUxV3q7ZN/tvW/J+
	 jjDF3rf7GU9FuX0ITqrkVxWBWjz4ZSl6wNkFinQzBb9vOMmveDn4i9G+9y5S5tbwPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OflXsdf1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA714606A887
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA714606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OflXsdf1
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD3A5802;
	Sat, 14 Nov 2026 12:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794655645;
	bh=enYAqOd6eck7e0RpfjoVDMLIEaqqz3LnOMzk6zUIvm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OflXsdf1vosoudWfIFZuUeaIuqOogOYTbqjaxknNjmbswZryD2wORtnvkavvIIHbz
	 H+IHsHL3P+IvyNrItpn/RYjTl97PknE6SxYx5veStY0Ly4Y3TUkClvyh1bV6USBmu6
	 m7tUxFEwWdaX6+UYOdpxEvWXaJ/jGkmPKiVYM2xM=
Date: Sat, 14 Nov 2026 13:29:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
Message-ID: <20261114112949.GB836589@killaraus.ideasonboard.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
 <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
 <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>

On Fri, Nov 13, 2026 at 07:25:35PM -0800, Florian Fainelli wrote:
> On 11/13/2026 10:09 AM, 'Martin Wetterwald' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> > On Wed, Nov 4, 2026 at 3:20 PM Martin Wetterwald wrote:
> >> On Thu, Oct 22, 2026 at 3:31 PM Greg Kroah-Hartman wrote:
> >>> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> >>>> Hi Greg,
> >>>> this is a regression introduced by aa125180c673 (via your tree) in
> >>>> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> >>>> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> >>>> staging-linus would be great. Thanks!
> >>>
> >>> This is not a staging driver anymore, please route it through the proper
> >>> tree after -rc1 is out.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >>
> >> Hi Florian,
> >> Now that -rc1 is out, could you take the patch?
> >>
> >> I've checked 7.4-rc1 and I confirm the issue is still present.
> >>
> >> Thanks!
> >> Martin
> > 
> > Hi Greg, Florian,
> > 
> > The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c)
> > is currently listed with Florian as maintainer by get_maintainer.pl.
> > But Florian tells me he doesn't maintain VCHIQ.
> > 
> > How to proceed now? This file doesn't seem to have any maintainer as far as I
> > understand.
> > Any pointer to someone able to take this patch would be appreciated.
> 
> Sorry for the lag Martin, I will be taking those patches from now on.

Thank you Florian, that's very appreciated.

-- 
Regards,

Laurent Pinchart

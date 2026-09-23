Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DCE44605E;
	Wed, 23 Sep 2026 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146717; cv=none; b=YRskyDQyocyK+Ujd8dEvBNY5yrUolS1hb3JgBEZXqFRN+AXYJPHAmYWzotb+TbtlvqhIOojIcnNU5iWrHbwc9dknrR+7Qpk/tu61emR3fKnCNNKMFGny2Rak4vZkb+tj2ILnJrDQn+IrZ+y8NY6I3Ogkkff1wli5lp+/IXTL3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146717; c=relaxed/simple;
	bh=kORj+Ecp+1R5NMJn0p/R1vy/I4KzVbWwxiMXybvr4N0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=R3srMi9wWGv2cUJ/gUPhYOzmT4HT5xRclrMIAAZCO7VtEQ1goybZ6aUKKwJ/2Ja/s1PpHfglBH5pc+OxZvBZCHzBV2I5aa5NUXe6xBFyzDEy4ZZurqK2dyaNBkFbJslgb1Ct137ennJfvwqe7rY8ZJNNExc+ABjA2CNfXlpxkJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dUth35nt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dUth35nt"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEE1AA25;
	Wed, 23 Sep 2026 08:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790146597;
	bh=kORj+Ecp+1R5NMJn0p/R1vy/I4KzVbWwxiMXybvr4N0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dUth35ntRJ1gGIvzwrxvHyTLuC+LLiL5I7x1XRnq/B/aMFcOmCzhNWeEHnd3Kohoo
	 AfQvDhlMiRGkbhzcXu9rRUtNX0rByt7qH1ybN4bIrGj6rjC2TSrgGoG+3D+pKcDWRg
	 CQ9I7ARpttkMAipqinhyxk3t5lpQc9NKm+ULq0aI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <arNzDkG8JmIWedwF@kekkonen.localdomain>
References: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org> <arNzDkG8JmIWedwF@kekkonen.localdomain>
Subject: Re: [PATCH] media: v4l2-async: link ancillary device runtime PM to the sensor's
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
To: =?utf-8?q?C=C3=A9dric?= Bellegarde <cedric.bellegarde@adishatz.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 23 Sep 2026 07:58:21 +0100
Message-ID: <179014670130.2497080.16248724869350735374@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Sakari Ailus (2026-09-23 07:34:54)
> Hi C=EF=BF=BDdric,
>=20
> On Tue, Sep 22, 2026 at 09:39:12PM +0200, C=EF=BF=BDdric Bellegarde wrote:
> > When a sensor's fwnode references an ancillary lens or flash device
> > (e.g. via the "lens-focus" or "flash-leds" properties),
> > v4l2_async_create_ancillary_links() already creates a media controller
> > link between the two entities, but their runtime PM states remain
> > independent.
> >=20
> > This is a problem for devices such as VCM lens actuators, which are
> > typically spring-loaded: holding a position away from the spring's
> > rest point requires continuous power, and the position is not retained
> > once power is cut. If such an actuator is allowed to runtime-suspend
> > independently of the sensor, the lens can drift back to its rest
> > position during an otherwise active capture session.
> >=20
> > Add V4L2_SUBDEV_FL_PM_LINK to allow an ancillary subdevice to request
> > that its runtime PM state be linked to the associated sensor.
>=20
> Interesting idea.
>=20
> The IPU bridge has created such a device link between the VCM and the
> sensor as on some ACPI systems the VCM is in fact relying on the power
> resources of the sensor. But to do this everywhere?

Same on any Raspberry Pi camera module. The VCM is powered by the same
enable lines as the Sensor there I think which has made things
interesting in handling VCMs for those devices.


> VCMs traditionally have been powered through opening their sub-device node
> and that hasn't been exactly neat API-wise. It has been practical still,
> AFAIK, as in order to control the VCM, you have to have a sub-device node
> open.

This is an issue though, as libcamera opens the device nodes and holds
the file descriptor when it has a camera. This means that even if the
camera isn't streaming, the VCM is powered on and causes power
consumption on mobile devices which people then attribute to pipewire.

=20
> This change also does mean that if the sensor is powered, even for
> always-on use cases that generally consume very little power, the VCM is
> powered on as well. VCMs still typically consume very little power if the

Do you foresee use cases where a linked VCM shouldn't be  powered while
a camera is streaming? That effectively means the lens position seen by
the camera is 'arbitrary' / undefined ?

> current is configured to zero. Maybe this won't be an issue? Backtracking
> from such a change wouldn't be simple, and might not be possible at all.
>=20
> There wouldn't be a need for a sub-device flag and this would be done for
> all VCMs based on the ancillary link.
>=20
> I wonder what others think.
>=20
> Cc Laurent and Hans as well.

Cc Dave too as he's looked at similar things in the past.

--
Kieran

>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

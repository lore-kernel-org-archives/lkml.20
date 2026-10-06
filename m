Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E91175A88;
	Tue,  6 Oct 2026 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301054; cv=none; b=XrDbT910ReepYKaSfoc2l7iYUwgp/QF5BPgLZ9LPyqdxsy5SzY0bxsa9CQ4nqW9XALLmSRjeFn8CMJ9nmFwuM1r8RGW3LAeqc6j4SWTkVYmCltDA10WcpRSgEtjBcXIgdQ6R1GGirKL5pMWbwJmhi4cJ6K70XN4ZNB2W7iD3AKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301054; c=relaxed/simple;
	bh=B2Gh86zo7jHv0y6qiZlKzZJTMfJ+fRsbatAe7FqDDc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm9eCbooBpxbZYztweIkbJv90lSfBKvdxmeqGC9Y29b4HemoTWW3fijqEDRn2QLXTplH9c1Sr60axKLKYHX3P4k/xLm/14USfhSlCvFftJece4Pvryu5qoGm6cV4ma3gnFL45gXUal8WrJAxBPEzJf/XKemXwiqWacAlpTCa8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M8QovLgU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M8QovLgU"
Received: from killaraus.ideasonboard.com (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B51493;
	Tue,  6 Oct 2026 17:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791300933;
	bh=B2Gh86zo7jHv0y6qiZlKzZJTMfJ+fRsbatAe7FqDDc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8QovLgUHD09qoWJFLz/RBXeW4qTdGrd6tK4tK3PfJt71yaBBXJMQFafziP5EYfiX
	 4y6rkYQaBP0rBjZaItWDd82BEj6paPeOLsSV43jJ1XJkak6XZDIcmyVSXwuMzis01U
	 NsVCaDFhsbaVzj/NQ3QowR2HgiYPFabtk2s56i+o=
Date: Tue, 6 Oct 2026 17:37:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com
Subject: Re: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312
 driver
Message-ID: <20261006153728.GA622105@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
 <asSk9KW-lzuiUJa3@kekkonen.localdomain>
 <577b34a1-4c2f-487d-a4fa-e7ede2b60091@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <577b34a1-4c2f-487d-a4fa-e7ede2b60091@nxp.com>

Hi Mirela,

On Tue, Oct 06, 2026 at 04:55:25PM +0300, Mirela Rabulea wrote:
> On 10/6/26 10:36, Sakari Ailus wrote:
> > On Fri, Oct 02, 2026 at 07:16:11PM +0300, Mirela Rabulea wrote:
> >> Laurent, Hans, Sakari,
> >>
> >> did you encounter similar situations? Any comments or proposals? The concern
> >> here, to summarize, is: v4l2 control cannot be committed to sensor registers
> >> right away (even when streaming) and we are also unsure when the right
> >> moment to perform the register access may come.
> > 
> > In practice there's little the kernel overall can do about this: the timing
> > of everything is handled by the userspace. Drivers that aren't directly in
> > control of the data path don't even have frame timing information and even
> > if we did pass that to drivers, I²C writes always have some uncertainty
> > (system scheduling, I²C access failures etc.), so one needs to be prepared
> > to failing to do the writes in time, which would further complicate the
> > UAPI.

I think an API to group multiple writes in a buffer and trigger the I2C
operation would be useful. It could be software-based, but it can also
be useful on platforms where the I2C controller supports hardware
triggers. I have been told a while ago that some I2C controllers can do
that (I think on Nvidia chips, but don't quote me on that).

> On the kerne side, what would help would be a way to make an atomic 
> operation out of an i2c read (the status register to determine the 
> active context) plus a group hold update (a few i2c register writes). I 
> don't know if that is possible.

What do you mean by atomic operation here ? From an I2C point of view we
can probably guarantee that nothing will perform I2C access on the same
bus between the read and write, but only if we submit both operations
together. Changing the values to be written based on the read value
isn't possible.

But I don't really see how that would help. The issue is about
performing I2C accesses at the right time, not about something else
preempting the I2C bus between the read and write, right ?

> On the v4l2 API side, I believe the current expectation is that upon 
> s_ctrl, if the value was accepted by the kernel, it will return success, 
> but user-space should not assume frames will immediately reflect the new 
> values.
> 
> Traditionally, with drivers I have seen so far, if s_ctrl is applied 
> while streaming, it is applied immediately (but fail in case of i2c 
> access failure). Upon success, captured frames will reflect the values 
> after N+1 or N+2.

The point at which the control will take effect is device-dependent.
Different sensors have different delays for exposure time and analog
gain. Increasing the delay when interleaving two groups doesn't seem to
be a fundamental problem. What is crucial, though, is for userspace to
know when the controls have taken effect.

> > Do you have libcamera in userspace or something else?
> 
> Yes, we experienced with libcamera. I can also reproduce the unwanted 
> behavior with v4l2-ctl streaming + i2ctranfer script that stress the 
> group hold writes.
> 
> If we were to place the responsibility on userspace/libcamera, than 
> libcamera should be able to handle this:
> 
> - after a successful s_ctrl, captured frames will reflect the values 
> after not N+2 but  X+N+2, where X can be anything because we do not know 
> when we catch the right context to do the group hold access
> 
> - do not expect s_ctrl to fail, unless the value was not accepted; i2c 
> access failures cannot be catched, because we cannot apply the control 
> value instantly
> 
> - a control value may get accidentally applied to the wrong stream; 
> because VC takes effect at frame N+1 and exposure and gain settings take 
> effect at frame N+2, if the group write timing is improper, these may 
> get out of sync; so user-space may see frames optimized for RGB on the 
> stream that was supposed to be optimized for Ir or vice-versa, as 
> confirmed by RishiKesh and Jai on ov2312.
> 
> - embedded data information may help identify what settings were 
> actually applied for a particular captured frame (if embedded data is 
> available reliably)

We could decide that support for RGB/IR stream interleaving requires the
ability to capture embedded data. Some people may complain though.

-- 
Regards,

Laurent Pinchart

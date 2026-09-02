Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC68C4A3D2A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359039; cv=none; b=qKRF9zPcLjugW5jU9GxAuZPtXEL/xxyodlS95JVx41Rm5z4o2bwitRt7G3DcHXfibfLsPzIGOBQjgNTQXuumzQaTu+/BTbFKfUKZv6KWUDeHQTDOnsfcVvZ9w2LbJunx9eiX0UTivLWcv0/3KS3XigXx8tJsYxbNydOrG4CsOes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359039; c=relaxed/simple;
	bh=LcFQRYsbPcw7A5+op99U+3wZPEy3PpEg96bG+bJDZR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYQn+DpXHs95FRW3qqrvIt3ICi5XK4TIuemDtS25v11wrG2b7YTzlfMiDImshlpYKjS8JbR9AEtnlj8hag1Pf1YVb0bFKFpq1lg4k3sxJ7WpOJU9CYpkIlAlB6cmonbKvLpjMrvijJMa7HmZOX/Ce/22iBEJCP0NZ1cJnLAU/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGnM6rjg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGnM6rjg"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48442ea8f59so1434816f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359036; x=1788963836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eCEhzIHv+gI4dxAX0R87oiyrbLJH9NF0MvQOqH+iMVM=;
        b=YGnM6rjgGfUzjCCkCZ5VttIxr0JnAkfmo85SEj58Rv9dvcJZ7OgbxOxBDxEnGEElJE
         LXCl4198M1q3gYhSKIh69N7dwmPh30TbqyH87/6XbWOkxlt8LuTYPqLlp3iTjdbH2g6C
         uxUkaLL/5gqBsxBPYOdpS0oD0+c4ZNnmAX+Kck3lbEY4k5aI46xe1cHDdOQ2Jddtg0Bf
         mLNwscfwaGN5h0LiOqVqgyrIz3gqgIUDHi+6WnC0ssD72FYlq/ERoVkG4Axjpu6OByUI
         6LFY0Os5GOlIWhAloZQ7ehuI6RHVtFg4hmSx57ti4/gHjcVAI5ooglB91moTIKOIs1+S
         y4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359036; x=1788963836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCEhzIHv+gI4dxAX0R87oiyrbLJH9NF0MvQOqH+iMVM=;
        b=GCsFtqKZWqT+FnOEHbHXgjDZNyuLNTWzZajNhuojnH0TaUZyeNatpPvIdz3HizIGwo
         Led7+r2DT3hzORtb4bCj5AikXiuzmmdCq/r3+YGDmmCUDY4Oy/DyWCnfEJv7Urn5R4aZ
         7wywAqXbnc4oTj17U9IYodh7pWxNN2AtDPfjvrhaJFl1gWIyzbZH/DaILomd8zZ1xwUS
         rFy67e97kaDxP8SN8ogAo33VefPBNOpdoCJUzC42NuvmCfP3V5JKh137VYNATvXte9Q4
         vIb4CGlYjYiB/2R/Qw82qwdYsloEiB9hdF2hkA+dxdmldVn3QQbhn7sbApynbGXk5htw
         8mQg==
X-Forwarded-Encrypted: i=1; AKwUvBzcVf8UGrCI01NJ1BhvxYMQMiOruBh3lTKOrvVs3e3iR54fMUOtZlcvI16UARnyyorhL1W8Rn6MNIlVWr4=@vger.kernel.org
X-Gm-Message-State: AFuF++nLeNa+sArHD1D/S/Zq8gX/4GFDRcBHlKdIkGl7Y7cPCwJXDol6
	NAJSqr1+48YfII3nIeivo4Vy0pOls35yYbZ5FMaiax4AYVRLi7ZHmruM
X-Gm-Gg: AYBFou10pQVPpIWFUdcGd1kF9l5zH8FDCV8QE3Y2Mm3QvyQhuWuXBDkG8PaxAKBL365
	FrYjf/YUH/kpQhx5r1qndxn9vEtfybBc9IKLEYJX+uylp4lJMNSXTd8HTvkqtajYUmeR26+ZwCv
	ptkGTsGsCQ8AQVj9sjklsYBExJ2eSCqZWzEOx86pIaedFUd+QIdBm4ug6Zww3iKiq+S1TWCtiy2
	CHKZWWErbtpi0OPKiZ1TkKDa/e1RQCyWH0We1UoW+huEh/6JNRJRNRJfw2cySIlqfbnMgmhCmmB
	ra6mdWW6xY0r1IIGrDsM+gW2AWn7QQCKm0uZCHEwqUY4iJvrTs2g+X0ECmWu4kwVrUICT09Zu+u
	k2eYDzdtIC2FCZlIn2gQcB0Oqdt5O4M85epiOHZb5yhBA73j1ejDyZVEmud20LF10DJmMGOAbJW
	6oQh7ZKSFgB9bhmbJ8afss0gkQLHRrMrop43j7U90iAqHGc8+ZZi0z8GHKlFfvYhB1ml3HOyIKx
	x6gJ67bHXWPsGtBGWeE3k8qm18u0KP7RR1qgMtvtbIhmnwrCezdwX0Kc8ixyok=
X-Received: by 2002:a05:6000:4211:b0:482:fbb6:1b29 with SMTP id ffacd0b85a97d-485781faaeemr6553373f8f.10.1788359035442;
        Wed, 02 Sep 2026 07:23:55 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm6722961f8f.2.2026.09.02.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:54 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:23:53 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <qkcwnshcm4o3q5vbdgb6i33wtm3wrri7ifsi5pnj342mqgfiaw@76vnlt3yro5v>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
 <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
 <amN9zxNjXM0bSp1w@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amN9zxNjXM0bSp1w@SMW015318>

On Fri, Jul 24, 2026 at 09:59:27AM -0500, Frank Li wrote:
> On Fri, Jul 24, 2026 at 03:41:59PM +0200, Ernest Van Hoecke wrote:
> > On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> > > On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > > > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > > > Hello Kieran,
> > > > > >
> > > > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > >
> > > > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > > > >
> > > > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > > > camera module.
> > > > > > > > > >
> > > > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > > ---
> > > > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > > > >  4 files changed, 119 insertions(+)
> > > > > > ...
> > > > > > > I think with the Toradex ecosystem there would be some value in
> > > > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > > > so that we can abstract the hardware which is being 'added'.
> > > > > > >
> > > > > > > I think it's important that we tackle the problem of combinatorial
> > > > > > > explosions of overlays when we can add a component to multiple
> > > > > > > platforms.
> > > > > > >
> > > > > > > For example, your OV5640 camera could be added to many different boards
> > > > > > > - and each board could have many different cameras - in different ports.
> > > > > > >
> > > > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > > > have 'thousands' of identical overlays.
> > > > > >
> > > > > > I see your point, and I agree that it would be valuable to move this
> > > > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > > > contribute.
> > > > > >
> > > > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > > > >
> > > > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > > > >  | is still no real progress.
> > > > > >  |
> > > > > >  | I would be happy to send a follow up patchset which would convert the
> > > > > >  | DTOs to whatever connector implementation format lands in the future,
> > > > > >  | but I am concerned that waiting for DT connectors will block this
> > > > > >  | patchset from landing for a long time.
> > > > > >
> > > > >
> > > > > I do quick check for ov5640, we can use partial connectors, which already
> > > > > in kernel tree.
> > > > >
> > > > > use duplicate label like
> > > > >
> > > > > in mainboard
> > > > > csi_io_i2c: &i2c3 {
> > > > > 	...
> > > > > }
> > > > >
> > > > > csi_io_regualotor_3v3: ....
> > > > >
> > > > >
> > > > > csi_io: connector_csi {
> > > > > 	compatible = "...";
> > > > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > > > 	...
> > > > > 	irq-map =<0 &gpio1 4 1>;
> > > > > 	...
> > > > > }
> > > > >
> > > > > in 5640 overlay
> > > > >
> > > > > &csi_io_i2c {
> > > > > 	camera@xx {
> > > > >
> > > > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > > > 	}
> > > > > }
> > > > >
> > > > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > > > >
> > > > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > > > display, almost work except panel show have some problem, which is not
> > > > > related with connector.
> > > > >
> > > > > Frank
> > > >
> > > > This is very interesting and I agree with both you and Kieran that it
> > > > would be great to abstract these connections away and kill the need for
> > > > so many variations.
> > > >
> > > > Certainly I will read up on this and spread it internally as well.
> > > >
> > > > That said, since there are still unresolved dependencies, I am not
> > > > convinced that we should already head this way with this series. It
> > > > supports hardware that exists today in the currently standard and clean
> > > > way.
> > >
> > > Your ov5640 have not such dependence. You can try connector firstly.
> > >
> > > display most like can go through connector, (I remember pwm already
> > > supported, but not sure).
> > >
> > > others continue go through old method until dependence clear.
> > >
> > > Frank
> > >
> >
> > The ov5640 still requires a clock nexus which is not merged yet.
> >
> > I have been playing around with it locally now and find the work here
> > very interesting. Certainly this is also useful for Toradex and I would
> > like to use it to reduce duplication.
> >
> > We will repeat this work for the Verdin iMX8MP. So I see real value in
> > using these new mechanisms to map the GPIOs such that the Verdin ov5640
> > overlay can be reused. However, this would also require a new binding
> > for a "verdin_csi" device.
> >
> > Therefore, I could consider dropping the ov5640 overlays from this
> > series and sending them as a follow up with the partial connectors
> > support. But I don't want to block the series from getting merged for
> > this non-trivial effort.
> >
> > If we go that way, I wonder where the verdin-ov5640 overlay should go?
> > We also have Verdin modules with a TI SoC, with the OV5640 overlays
> > already merged, that could be refactored. Those live in ti/, not
> > freescale/. Do you have any input on how we should deal with that?
> 
> 1: need make both work by duplicate overlay source file, which under TI
> and freescale.
> 2: try to create common dir, and merge two file to one, which may need
> involve both TI, freescale and Soc maintainer to discuss where to put.
> the discussion start utill real case happen. This one may first real
> user case.
> 
> >
> > Personally I am still more in favour of merging now and refactoring with
> > our next series for other SoMs, but I understand the desire to start on
> > this now so there are more consumers of this new behaviour.
> 
> I suggest use this 8mm ov5640 as start, you can refact other later step by
> step.
> 
> I can increase this part review priority.
> 
> Frank
> 

I've prototyped the GPIO nexus approach and confirmed that it works. It
abstracts the sideband GPIO wiring, but the camera pipelines and port 
election remain SoC- and port-specific.

So I could implement all of this, probably with a binding too (unclear
to me as of now if a compatible + binding is needed or if we can just
leave the compatible property out). But it would only enable sharing one
overlay between the Verdin iMX8MM and Verdin iMX8MP. As you noted, we
could do something like:

imx8mm-verdin.dtsi:
	/* Verdin CSI_1 */
	verdin_csi_capture: &csi {};
	verdin_csi_rx: &mipi_csi {};
	verdin_csi_i2c: &i2c3 {...};
imx8mp-verdin.dtsi:
	/* Verdin CSI_1 */
	verdin_csi_capture: &isi_0 {};
	verdin_csi_rx: &mipi_csi_0 {};
	verdin_csi_i2c: &i2c3 {...};

Along with a nexus node to abstract the GPIOs used in both, and then
have one shared camera overlay enable everything and define the camera.

But on the Verdin iMX95 for example, the pipeline is more complicated so
unless we find a way to set up more of the pipeline in the base DTSI, we
would still need a separate overlay for it.

On SMARC iMX95, for example, we would still require separate CSI0 and
CSI1 overlays because they use different receivers, pixel formatters and
ISI ports. And there is no mechanism to select CSI0 or CSI1 from an
overlay, that would need the proposed generic connector concept, not
just these nexus nodes.

My current thinking is that this is not worth implementing as we don't
really gain much. However, it is clear that connectors would be hugely
beneficial. I propose that we drop the idea for this camera overlay,
unless you see a real maintenance benefit, but we work on the connector
topic to hopefully get rid of this combinations explosion in the future.

We are continuing to work on connector infrastructure where it provides
a concrete abstraction, including the LVDS nexus work and the related
GPIO/PWM fw_devlink fixes. [1]

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Kind regards,
Ernest

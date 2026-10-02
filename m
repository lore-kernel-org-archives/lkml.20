Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F32622370A;
	Fri,  2 Oct 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943674; cv=none; b=TtBTCxODluD0heMoLGTGjjDMgLEom3yRciH1NKdjKGbaOS+Xw2s1SJjS2d/64FZ4cxx/an7l0LGpTgeykgiF91vc1x4jX/3CSIAK34Q58WEuhbH4gFGsTqZ7GrCW28yl5sZEpkt1bw8KCHCxlVeOBhlg+VE78eyZk2zgqxB6kL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943674; c=relaxed/simple;
	bh=u+U4+GGA98/75HGwZG8Q0DLVcKXq0XVWma+vi3kkSyc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TRU9OYqRjpsTxB2/yeVwIKzvwAtRezhd1J9maszBYCVKtHbpEnR2hVDO+tpVX48dDGvbem5j8KjBwcidgG+oQgzYk9CNTZAgd9OxndY4OzmZvH6a1lAGKS+0DYXkwFPHZvJIrjggBvOR61ab1iKNv1/zlmlMft7r/S03GNEApww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3Q4KZto; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3Q4KZto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94C61F000FF;
	Fri,  2 Oct 2026 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790943673;
	bh=A17ei//BVy1gsJYVHpC6jubZHQhrRN2IN+K+8bR9YZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=V3Q4KZtoBc0C/r6cNlHPpuQpPQLrjM4ehSUEL206wmyOiEKBhmKkZ3PSOdNkHUW2V
	 t8OK5k76l38Op8MONpmZCVP8VmCBE3KGUXdjB4zFah7QQsD43EbhUgnOfSU4GtaT5t
	 MOO1BlZhjvvFyGIOJyVB8RiVd0YKJZWBVxjDoePMnJNq2I9jBIO9JKbZKyimHa9snl
	 lcSa6XCk+InygJrGue0iyZIHN90A16dNSlwlCCyDp96avU5S+WpKDjOSXLm+amTxj8
	 z9YPqgKVkDyOfYG7FJbPfQrBUioaF1Zm3DVpIIsqkWtj6SNU5rRLA9cAnC60/uTe+w
	 EZfXxMHjLzQJw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/5] media: imx219: Allow driver probe with missing
 sensor
In-Reply-To: <CAPY8ntAzRMXc61DvLRRFQBQXxWbVx26r5jCf_dg3PCeiGqKSaw@mail.gmail.com>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-3-a45993be17b8@kernel.org>
 <CAPY8ntBFTGmGHRZX0QAtbV=fQi4p3Obp19SfNHdFq_DrW3-T7g@mail.gmail.com>
 <CAPY8ntAzRMXc61DvLRRFQBQXxWbVx26r5jCf_dg3PCeiGqKSaw@mail.gmail.com>
Date: Fri, 02 Oct 2026 14:21:10 +0200
Message-ID: <xhkdb33uouwcp.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Dave,

Thank you for the review.

On Thu, Oct 01, 2026 at 18:35, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> On Thu, 1 Oct 2026 at 17:50, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>>
>> Hi Mattijs
>>
>> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
>> <mkorpershoek@kernel.org> wrote:
>> >
>> > Probe() should complete even when a sensor is disconnected. This would
>> > allow the v4l-subdev to be created and improve fault tolerance.
>> >
>> > Currently, the driver reads the CHIP_ID over i2c in the probe().
>> > When we can't read CHIP_ID, the probe errors out - which result in the
>> > v4l2-subdev not being created.
>> >
>> > Remove all i2c communications to allow the driver to probe with a
>> > missing sensor.
>> >
>> > Note: Since we no longer power on the sensor during probe, the driver
>> > now starts in suspended mode by default.
>> >
>> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> > ---
>> >  drivers/media/i2c/imx219.c | 72 +++++++++++++++++++++-------------------------
>> >  1 file changed, 33 insertions(+), 39 deletions(-)
>> >
>> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>> > index 7978fee5f4a2..aeac70123b9b 100644
>> > --- a/drivers/media/i2c/imx219.c
>> > +++ b/drivers/media/i2c/imx219.c
>> > @@ -1000,6 +1000,29 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>> >         return imx219_set_pad_format(sd, state, &fmt);
>> >  }
>> >
>> > +/* Verify chip ID */
>> > +static int imx219_identify_module(struct imx219 *imx219)
>> > +{
>> > +       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>> > +       int ret;
>> > +       u64 val;
>> > +
>> > +       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
>> > +       if (ret) {
>> > +               dev_dbg(&client->dev, "failed to read chip id %x\n",
>> > +                       IMX219_CHIP_ID);
>> > +               return ret;
>> > +       }
>> > +
>> > +       if (val != IMX219_CHIP_ID) {
>> > +               dev_dbg(&client->dev, "chip id mismatch: %x!=%llx\n",
>> > +                       IMX219_CHIP_ID, val);
>> > +               return -EIO;
>> > +       }
>> > +
>> > +       return 0;
>> > +}
>> > +
>> >  static const struct v4l2_subdev_video_ops imx219_video_ops = {
>> >         .s_stream = v4l2_subdev_s_stream_helper,
>> >  };
>> > @@ -1056,6 +1079,14 @@ static int imx219_power_on(struct device *dev)
>> >         usleep_range(IMX219_XCLR_MIN_DELAY_US,
>> >                      IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
>> >
>> > +       /*
>> > +        * If we can't identify the module here, it might be disconnected.
>> > +        * Consider power_on() complete and exit early in that case.
>> > +        */
>> > +       ret = imx219_identify_module(imx219);
>>
>> Do we need to identify the module on every power on? Admittedly it's a
>> lightweight operation here, but for imx678 and the other Starvis2
>> sensors I'm currently working with you're needing to come out of
>> standby and wait 80ms before reading the ID registers.

That's quite some time to wait. Are the 80ms also needed to write registers?

I added this as a safeguard to avoid doing the LP-11 power state change
(and thus writing IMX219_REG_MODE_SELECT).

We could replace the identify module with testing if the REG_MODE_SELECT
write failed ...

>>
>> Looking at the rest of the series, polling of detect would notice if
>> the sensor goes away again within a system that cares about it, so
>> caching the first successful identify would largely restore the
>> behaviour for systems that don't care about fault tolerance.

... or use a cached value. I will give it some thought and change this
for v2.

>> Actually I'd be tempted to keep a call to detect/identify from within
>> probe so that if the sensor is connected at boot we don't have any
>> change in behaviour, nor the reporting of the unknown status.

Ack. see below.

>
> And a follow up thought on this one too.
>
> We already return any errors from the I2C writes in
> imx219_enable_streams, so reading the ID value here is fairly
> redundant. The likelihood of someone having connected a totally
> different I2C device on the same I2C bus and address is very low, so
> if the writes succeed then you can reasonably assume that the relevant
> device is connected.

Ack, I will look into this for v2.

>
> Perhaps a more useful solution is to still try reading the device ID
> during probe. An I2C failure at that point shouldn't abort probe, but
> a mismatch on the ID register after a successful read should. Again
> that keeps existing users experiencing largely the current behaviour,
> but your use case of fault tolerance if not present will also work.

I agree, I will read REG_CHIP_ID once in probe(). The read won't abort
the probe. The IMX219_CHIP_ID mismatch will.
This way, we don't report the unknown status.

Mattijs

>
>   Dave
>
>>   Dave
>>
>> > +       if (ret)
>> > +               return 0;
>> > +
>> >         /*
>> >          * Sensor doesn't enter LP-11 state upon power up until and unless
>> >          * streaming is started, so upon power up switch the modes to:
>> > @@ -1117,27 +1148,6 @@ static int imx219_get_regulators(struct imx219 *imx219)
>> >                                        imx219->supplies);
>> >  }
>> >
>> > -/* Verify chip ID */
>> > -static int imx219_identify_module(struct imx219 *imx219)
>> > -{
>> > -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>> > -       int ret;
>> > -       u64 val;
>> > -
>> > -       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
>> > -       if (ret)
>> > -               return dev_err_probe(&client->dev, ret,
>> > -                                    "failed to read chip id %x\n",
>> > -                                    IMX219_CHIP_ID);
>> > -
>> > -       if (val != IMX219_CHIP_ID)
>> > -               return dev_err_probe(&client->dev, -EIO,
>> > -                                    "chip id mismatch: %x!=%llx\n",
>> > -                                    IMX219_CHIP_ID, val);
>> > -
>> > -       return 0;
>> > -}
>> > -
>> >  static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>> >  {
>> >         struct fwnode_handle *endpoint;
>> > @@ -1252,21 +1262,9 @@ static int imx219_probe(struct i2c_client *client)
>> >                 return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
>> >                                      "failed to get reset gpio\n");
>> >
>> > -       /*
>> > -        * The sensor must be powered for imx219_identify_module()
>> > -        * to be able to read the CHIP_ID register
>> > -        */
>> > -       ret = imx219_power_on(dev);
>> > -       if (ret)
>> > -               return ret;
>> > -
>> > -       ret = imx219_identify_module(imx219);
>> > -       if (ret)
>> > -               goto error_power_off;
>> > -
>> >         ret = imx219_init_controls(imx219);
>> >         if (ret)
>> > -               goto error_power_off;
>> > +               return ret;
>> >
>> >         /* Initialize subdev */
>> >         imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> > @@ -1288,7 +1286,7 @@ static int imx219_probe(struct i2c_client *client)
>> >                 goto error_media_entity;
>> >         }
>> >
>> > -       pm_runtime_set_active(dev);
>> > +       pm_runtime_set_suspended(dev);
>> >         pm_runtime_enable(dev);
>> >
>> >         ret = v4l2_async_register_subdev_sensor(&imx219->sd);
>> > @@ -1298,7 +1296,6 @@ static int imx219_probe(struct i2c_client *client)
>> >                 goto error_subdev_cleanup;
>> >         }
>> >
>> > -       pm_runtime_idle(dev);
>> >         pm_runtime_set_autosuspend_delay(dev, 1000);
>> >         pm_runtime_use_autosuspend(dev);
>> >
>> > @@ -1315,9 +1312,6 @@ static int imx219_probe(struct i2c_client *client)
>> >  error_handler_free:
>> >         imx219_free_controls(imx219);
>> >
>> > -error_power_off:
>> > -       imx219_power_off(dev);
>> > -
>> >         return ret;
>> >  }
>> >
>> >
>> > --
>> > 2.55.0
>> >

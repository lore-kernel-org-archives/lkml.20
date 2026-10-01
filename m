Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5639051FCB2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876133; cv=pass; b=XARy2i3sqlts4CnENhcN6lRdh5P6qUkBS0tnZTba59r3S92dWAVdhrxldqlBQOH6iojUfjwyaWNdGTUxYTtHXdZtPQrf4tXR3KzEdeaLPMfcNrhgmh4l724W10Cs2+hMdsSVTagBdM8FpaEIi6g2BFOsuCTsIUZ4rzvDQk+D1u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876133; c=relaxed/simple;
	bh=5H89zJsT1glGqIxNV28jSb1zxhMXNmpaBKbJAUPPgw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ3MCKRQBs1nqBx11PwGMe4rfWjha7EB0b3+lk75hpumqZznYTzZGTjONM4MUWZHVsYZ6VyyalVKbxAZ/b2j8E35uRZCo98M+ckbfQHvaasKf1d9anmWS6rISltzcpBGPvzVHpbsdweXrBNGCIB0yAFVkFABY1j7APyo5hRzh6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Jb/yu2UT; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Jb/yu2UT"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6bc475ffcbfso637212eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790876129; cv=none;
        d=google.com; s=arc-20260327;
        b=an4kEK6Xvvlb5B48k4uET6i4mVaJJDkV6unaFkEe+Dq579hfF4RZPDNYV2cwMYHzDl
         PIOyeuFsvOd5WcRUVlLFjKG415Uf4NTKA6forE8EVmeVIXoB/0aepC8uynoi5kuTR/f0
         sWF/rR8OMSYqt7bNy30oI1ztP+svRcR8rWHwOLDkcBfq7kziof+DG/3Mzzpll6o448OB
         dZaC/ITWz/FejfcqvTtJaFzxmRFBqntHGkH/JmqJrIfEoF7+5lxgjPgMr1SN0ekQCVJU
         AyhXQan1wGIbmUZYXx2BdR1Pddl0csrR3BDT9y4ni7OpyG6yOGGtKEXP9vdGJdCcXqMz
         bz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1DJxKX88BCdOiMB3cylf6j7NNRjIHAc5OsvnEtisRD8=;
        fh=PJD9mxEPigKHL36ueyoSXJtjLY0wXGdFwTgiNqO1gog=;
        b=GNG9/Rn/rpfgWxkbZX6dAVcbXtqTfT9vbcky8ZgdDNMc6rlZKsvzq4flwlp81b/90b
         BgV/NoJVcEYdK+Ag5UN0Eu8cqCVVYRsEEQGNaM69Try0WquT1rR0JEaTJgv8z/ogHCUe
         jVtKRUJP4BbOqMxlcFlcWapl4fn7Es9s361MWwFG0b2RT9XyZ0kjYO6qAsfwuApAjj0u
         pSzOBbXQWGGf2KAfxIVDffmRHEFwttKjlEKY1Y28O8PD7qcRbz4M/0etf3VVty0N/mgw
         P7T10QDxnEtdxGTmpuntZ+dAxfhBjCLCNgVCZGTnjn7o7EBC7nEN9n5T/pK974cCH/WA
         EWUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790876129; x=1791480929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DJxKX88BCdOiMB3cylf6j7NNRjIHAc5OsvnEtisRD8=;
        b=Jb/yu2UTC93xe+8+MkpKhOjTLyXs+OmTsoht3cwNmJ492U+Mv2wAQP1aCPRPEOqN+g
         BIrtJ9KErbxJHPzf0pjzxZT0kNdwkVn5lsC2TO5de29I7w4SjiN8XcwuIUx5756Vzjfn
         vlDbyUeJwO5gnAIz2UpC5FtnRKKJqol8MMfAnDfzMYud+F9A88irykF/B7u/3BNucyhA
         RVY8U2h9MDjJdcayTxdkM6/nvoVNvDvQuSkJKbLu3/lMFPEi2RCDX75NpW0sJG4TACNP
         +UY7nClIAeE7jqA3WSWQ2elYESXzmV4DqdQ1GtmUryw2kl1IJAqrG2BPn+5sOCMBayil
         k/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876129; x=1791480929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1DJxKX88BCdOiMB3cylf6j7NNRjIHAc5OsvnEtisRD8=;
        b=Tjdn8Y4U5BfbHNSngSeqcY+1DsGTFAHMUbvmRcql8fLBlGIm3t8oV+uwqpPabYuUSf
         AxAE9SzoNGNphNinnARB4TTpO8Rdh1ZFk08J9+5AcE2u0Rs2jQ5MXt7BOmljBCOstDRD
         6gUlnwuXixKY5wtaTH7WvXjCn9WFh7HSs76RHgBc/lsOKYejsJfAX+ELr27+hxqbHnuq
         twd1K3ziwngFUdFv0EEQ9Sdu095WE55Dx/LWBbIqJ2BPFqvqG06/Zop+MrXlEYACEYeH
         6TQrjtM7/3enapweLqa3eCtoC05X0Lkz9NwDTgSOk+nubX4D4QYxwVspglQvrHoR3xEr
         e4lA==
X-Forwarded-Encrypted: i=1; AKwUvBweBe3zIg4T+jJamxj6j3CfXEvlogSMesEirE0uEmCI0b06YTqHETxG7HAVCk3Sjll/AUAy5Y/NLfjulV4=@vger.kernel.org
X-Gm-Message-State: AFuF++md9QVvkbB55FD8ndr1eN4OSrv63YnPfnCksI4cRPEX1v2KRaId
	q8aVCNcS8fafD5bShXELxio+mITuXurhEi80Jjx8x/hoLP3BE127UHAEFnpKMf+n2x91jgwb7Kb
	AVHp3oBrHO0Wo0LFDvLxMbYpiWpEbAJ6gYClyRcChAQ==
X-Gm-Gg: AYBFou18wwB7izEp4rQ5kR+BhcruX76dw8Jj6ILTgP+GO+nQa/iROS6F5OP6abyKH+R
	EhUgq8RESjTATGNYgUtQeNksJOWqSVmgwgxhLcg8U4D2oBO1A9MLfNosSM9IsDuDCvmZDIpdXbd
	8xwUDnqj2WYIvO1B5hCR+/I+XPFYowIJZ28zXZHIx4zJZo7N8+2pqlAWYEtutbgwxdUfTkbG/gJ
	M/niB5BPhpIlsROkZj357DFXyZ4Hr30te9Agh3wCJ+zyJf4ytQxi9y4npBGyfSXSetgXLYnYxKU
	zJZIDbnIMQ0NS7PuPoSOHFgCQGc5NkYwHQ47s0+CDC3VoEx/+r5IVh4FFioIZZoVMwzZKM9vTHH
	lXlHEO3TWDDIXkGvWIt9igZflldBJso6SHsVoUR1GVBUXroWZLd2tayJIPHLLhuv4DfvTVr/d
X-Received: by 2002:a05:6820:81c9:b0:6de:73e2:4982 with SMTP id
 006d021491bc7-6df361231c0mr42119eaf.88.1790876128897; Thu, 01 Oct 2026
 10:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-3-a45993be17b8@kernel.org> <CAPY8ntBFTGmGHRZX0QAtbV=fQi4p3Obp19SfNHdFq_DrW3-T7g@mail.gmail.com>
In-Reply-To: <CAPY8ntBFTGmGHRZX0QAtbV=fQi4p3Obp19SfNHdFq_DrW3-T7g@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 18:35:11 +0100
X-Gm-Features: AclHuK_nzKwrsM4uFwJ0K2koZLlkJjsdVdz_VVCTPh2QZ6rYOUslpVzj1zpy9pU
Message-ID: <CAPY8ntAzRMXc61DvLRRFQBQXxWbVx26r5jCf_dg3PCeiGqKSaw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] media: imx219: Allow driver probe with missing sensor
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 17:50, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Mattijs
>
> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
> <mkorpershoek@kernel.org> wrote:
> >
> > Probe() should complete even when a sensor is disconnected. This would
> > allow the v4l-subdev to be created and improve fault tolerance.
> >
> > Currently, the driver reads the CHIP_ID over i2c in the probe().
> > When we can't read CHIP_ID, the probe errors out - which result in the
> > v4l2-subdev not being created.
> >
> > Remove all i2c communications to allow the driver to probe with a
> > missing sensor.
> >
> > Note: Since we no longer power on the sensor during probe, the driver
> > now starts in suspended mode by default.
> >
> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> > ---
> >  drivers/media/i2c/imx219.c | 72 +++++++++++++++++++++-------------------------
> >  1 file changed, 33 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 7978fee5f4a2..aeac70123b9b 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1000,6 +1000,29 @@ static int imx219_init_state(struct v4l2_subdev *sd,
> >         return imx219_set_pad_format(sd, state, &fmt);
> >  }
> >
> > +/* Verify chip ID */
> > +static int imx219_identify_module(struct imx219 *imx219)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > +       int ret;
> > +       u64 val;
> > +
> > +       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> > +       if (ret) {
> > +               dev_dbg(&client->dev, "failed to read chip id %x\n",
> > +                       IMX219_CHIP_ID);
> > +               return ret;
> > +       }
> > +
> > +       if (val != IMX219_CHIP_ID) {
> > +               dev_dbg(&client->dev, "chip id mismatch: %x!=%llx\n",
> > +                       IMX219_CHIP_ID, val);
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct v4l2_subdev_video_ops imx219_video_ops = {
> >         .s_stream = v4l2_subdev_s_stream_helper,
> >  };
> > @@ -1056,6 +1079,14 @@ static int imx219_power_on(struct device *dev)
> >         usleep_range(IMX219_XCLR_MIN_DELAY_US,
> >                      IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
> >
> > +       /*
> > +        * If we can't identify the module here, it might be disconnected.
> > +        * Consider power_on() complete and exit early in that case.
> > +        */
> > +       ret = imx219_identify_module(imx219);
>
> Do we need to identify the module on every power on? Admittedly it's a
> lightweight operation here, but for imx678 and the other Starvis2
> sensors I'm currently working with you're needing to come out of
> standby and wait 80ms before reading the ID registers.
>
> Looking at the rest of the series, polling of detect would notice if
> the sensor goes away again within a system that cares about it, so
> caching the first successful identify would largely restore the
> behaviour for systems that don't care about fault tolerance.
> Actually I'd be tempted to keep a call to detect/identify from within
> probe so that if the sensor is connected at boot we don't have any
> change in behaviour, nor the reporting of the unknown status.

And a follow up thought on this one too.

We already return any errors from the I2C writes in
imx219_enable_streams, so reading the ID value here is fairly
redundant. The likelihood of someone having connected a totally
different I2C device on the same I2C bus and address is very low, so
if the writes succeed then you can reasonably assume that the relevant
device is connected.

Perhaps a more useful solution is to still try reading the device ID
during probe. An I2C failure at that point shouldn't abort probe, but
a mismatch on the ID register after a successful read should. Again
that keeps existing users experiencing largely the current behaviour,
but your use case of fault tolerance if not present will also work.

  Dave

>   Dave
>
> > +       if (ret)
> > +               return 0;
> > +
> >         /*
> >          * Sensor doesn't enter LP-11 state upon power up until and unless
> >          * streaming is started, so upon power up switch the modes to:
> > @@ -1117,27 +1148,6 @@ static int imx219_get_regulators(struct imx219 *imx219)
> >                                        imx219->supplies);
> >  }
> >
> > -/* Verify chip ID */
> > -static int imx219_identify_module(struct imx219 *imx219)
> > -{
> > -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > -       int ret;
> > -       u64 val;
> > -
> > -       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> > -       if (ret)
> > -               return dev_err_probe(&client->dev, ret,
> > -                                    "failed to read chip id %x\n",
> > -                                    IMX219_CHIP_ID);
> > -
> > -       if (val != IMX219_CHIP_ID)
> > -               return dev_err_probe(&client->dev, -EIO,
> > -                                    "chip id mismatch: %x!=%llx\n",
> > -                                    IMX219_CHIP_ID, val);
> > -
> > -       return 0;
> > -}
> > -
> >  static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> >  {
> >         struct fwnode_handle *endpoint;
> > @@ -1252,21 +1262,9 @@ static int imx219_probe(struct i2c_client *client)
> >                 return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
> >                                      "failed to get reset gpio\n");
> >
> > -       /*
> > -        * The sensor must be powered for imx219_identify_module()
> > -        * to be able to read the CHIP_ID register
> > -        */
> > -       ret = imx219_power_on(dev);
> > -       if (ret)
> > -               return ret;
> > -
> > -       ret = imx219_identify_module(imx219);
> > -       if (ret)
> > -               goto error_power_off;
> > -
> >         ret = imx219_init_controls(imx219);
> >         if (ret)
> > -               goto error_power_off;
> > +               return ret;
> >
> >         /* Initialize subdev */
> >         imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > @@ -1288,7 +1286,7 @@ static int imx219_probe(struct i2c_client *client)
> >                 goto error_media_entity;
> >         }
> >
> > -       pm_runtime_set_active(dev);
> > +       pm_runtime_set_suspended(dev);
> >         pm_runtime_enable(dev);
> >
> >         ret = v4l2_async_register_subdev_sensor(&imx219->sd);
> > @@ -1298,7 +1296,6 @@ static int imx219_probe(struct i2c_client *client)
> >                 goto error_subdev_cleanup;
> >         }
> >
> > -       pm_runtime_idle(dev);
> >         pm_runtime_set_autosuspend_delay(dev, 1000);
> >         pm_runtime_use_autosuspend(dev);
> >
> > @@ -1315,9 +1312,6 @@ static int imx219_probe(struct i2c_client *client)
> >  error_handler_free:
> >         imx219_free_controls(imx219);
> >
> > -error_power_off:
> > -       imx219_power_off(dev);
> > -
> >         return ret;
> >  }
> >
> >
> > --
> > 2.55.0
> >

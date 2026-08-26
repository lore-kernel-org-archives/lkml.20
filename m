Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488E471D1A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762425; cv=pass; b=F3R4pVQyCbyKLdow3y9lhYYtm8rf34dZPkuzoi4XbC5FswYPP7gS13gnYI4X4hajO88Pqhe0hYyjZlTFEeIv8640AOM6MBkBahqTEvI5v+844tQQ0GwjLoN5TWkImEK+fIdeGKTcA2Ia0bEUkpiRVE4OY5wTs+e4JkKG/QD5dWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762425; c=relaxed/simple;
	bh=5dAwsITqa99NP8sf0R5uhtcqwGyiTGOwYJFbqySUMT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrcPRlU416KtOq/XSbd3T2oOSM+p4jkLVF096Klc6MYaIqsTXBY+ERdb7rlJ+tIl2MXEXTJbC9tXjEsCwf4Q0MO8YdrNcnPIqAvrfYL0SBZe+87VKFIj2VcuAnIvnM5vknpUTH9c4HcGBYP7u20Gxvpqm6y6BQ0FiKpJv2bw9/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prvyUWW9; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prvyUWW9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a1f628b0afso10502951fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787762396; cv=none;
        d=google.com; s=arc-20260327;
        b=iTOMEf3n6trV9C7WaahGWd9ta1KD9XwKGr3pm7DQIXjgniiTicKxLhtAvJiQQMBUV0
         PFCOsZBoQrRkJNmVm3KTEJ+qwxp0rdcOgUpRUo/y8XTTq49ZAY1lJhTFl/QDyIb/VW8R
         42+d7Ekn6pTwhPdEroesIpGBRZy5F0KqLvaMpXCKbwjoXi5pvXaoG1isrghL9HZkLbtl
         sec77fukgkwNUnVEqyjjjynY4AlpHhDI7bwIZelqvlwxCcVML98Ty3sdXflkq8G5wrmY
         aU4oz9Gt2dK49x7vzGLxkio7BrOZyocYDofTxi2kQi4ujcsbY0RradoVdzl3pP4Pigy4
         f/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hv5dPYmkY69y3WkolPDBNpeCOg/E0f6dTTzd5z8oj2k=;
        fh=Zlpa0y8zz/1A3Z1YgNaRrX9VX6YOnzt1d+KyCRzgKgQ=;
        b=P0x8FKKIKy5ab0kF4jg7y7i/8Yr5xvxqioBW9TV1GekWBtyGynhrgyqP5yuNXewIbo
         pZVx6TDb48PLw9qbbg8bxneZK2nhOm3IaVwCdco2mimazmzHyypmh8G3gzdpop97RsKJ
         kNWRYN/iMRv6LnlxWpYsTPHmhVygC5nBLiJZhJXUp9DssTBVc8ebaCcVMZPdy+2Y7ciy
         B39HU44MAq0IeV2M1Am85/e5MQi21ipn8E2ZEmdR5Ps1PrvLr96CHJVdEsKVaVgwACmP
         i6hLOMAJ9bF9izU7ov1CTmzqEhP6k+k/lZF2Mrpt1HA6YUafbp/tueK+ZGEoEFv+wOJV
         PnFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787762396; x=1788367196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hv5dPYmkY69y3WkolPDBNpeCOg/E0f6dTTzd5z8oj2k=;
        b=prvyUWW9Fik3umIkL1OoU0A+iGBd3AFMT9rJJe6SB5dnBn0mokWt7yNv9K2bBMati3
         QRboy6xQoL+vfKpYcHta7mLbg5Zo0eZcfBC4dG6Fafkm/mkuuGzZ0Hra1GpAiDCvEBeT
         LdkAdXsKdajnQABYoC+fsaMW4V7tHPAvp1Fpt6Pj1gqu6iYPCKZeowcaA5yqmSNx6MHn
         XzYpTgTXi8w55YXjZrQafNKCFp5eU13T03WBJijAm7c542apAojmjmO2fohZBYXQRPSL
         cWpIyiYGx0Pij1nvUUCGpcvBHf3G9KNB3GzXqizb5d1VzdN0HIQvahKFLZ5tROlneDT1
         zGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762396; x=1788367196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hv5dPYmkY69y3WkolPDBNpeCOg/E0f6dTTzd5z8oj2k=;
        b=ED9mYYf99rZcJYXgZJ8kUflhCrYuVfqGwjArZXnj7JOG/h1EGmzJvVKt433RSqhbjj
         974wSDv4F2a6u+gzBQfs5tTvsixZi740+UGvf2jgC8w6TWH3zBVtf1lK3+AfYAjpAd43
         hTn39XJTeVqRV853fUjQYr1bB0RKMZysZadoYWAVkhrSKbG1QTOYeQKfANJ2P7CuJcAI
         YlRN0tMocho7DhbkSyMfJe/YfYywffy0sUgje9nd9cqx8LcPJ45Fyh3d/OWnelO6UPfJ
         afujGYVUBswSU2plos22qRTgdE2TDlN9yjABuzPOeFhimNKDvLmH7TV+owkm51pAdbo2
         1+nQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQ+kfGenzuUwfRnOia/fGoVQqdgCNjfHnwf6EOkKQU5O3rmF9Ft7uU6VmUjD8zuCV9tN8TcWTMTGIgOCM=@vger.kernel.org
X-Gm-Message-State: AFuF++nE4jIibmAimEBstZ0A8fpJ55w53PeiIvzgDwq/giygGTqOZS9D
	rPQADlQx30uQalJbwbj8OPzE+LYLNyX77KyuQTRFP753fcBpw6UFnnVIT14aWGwmQKSZswyW4f2
	AhrK/QUPkksCZMGln9JPKECo9jXnnt7g=
X-Gm-Gg: AR+sD12J9zbPCMaSnISojJTcXfIzYVyLczSCuUsc0hSkT7KhDIIJ/mS3UvC1VcdAMTB
	5vQS5KItswFHJwrC/jsb+MhvMPYZScA5wLBS/QUIIk9r0M3lIrbOFfg8FqY9gXtTy8bHv/jH91y
	n7njSeAoMj9MJtS1DLr1Ikth4Y3NOAmYjbsrDPzaFuvB++1edSG52n4xn11rBQ902I41RFhw2Zb
	zYs/dkVE87UZZ1RjHKSG6qOzz6KlXEmny9r2zUOrtGCNITH+jVooOQaeV13mZ7Jr+/GQGiMoQAA
	bl6m5ZpE9rLQFfauQcvqmx2wVlwnZjtwzNXLGfr2W9aDMxaIg7dMSD1RJpYme0Wh8jbV4ZaA1My
	+DzgAg7lLD1iKJwQN6+E01EQ0mKpdwtIgJSNTlA==
X-Received: by 2002:a2e:a588:0:b0:3a1:ab57:ea1e with SMTP id
 38308e7fff4ca-3a1fd6d2d93mr18007201fa.13.1787762396143; Wed, 26 Aug 2026
 09:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787502619.git.ahmadexp@gmail.com> <a4abcd31c3a6758e219f5edcdd4acd307e674f18.1787502619.git.ahmadexp@gmail.com>
 <ao0tPhBvK1Er_Vs0@gryt> <CAOQiBWNVvHpO7X8yWyZEa3-nV76YJfRbkzo+_4U-upEj4VNfow@mail.gmail.com>
In-Reply-To: <CAOQiBWNVvHpO7X8yWyZEa3-nV76YJfRbkzo+_4U-upEj4VNfow@mail.gmail.com>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Wed, 26 Aug 2026 09:39:43 -0700
X-Gm-Features: AcwNN1VNF-tkqtBJrIUaJrE1grR5Y7D_zvjtaocbove7fXLJ9T4tZxGAP776vkA
Message-ID: <CAOQiBWPZJzic+Nq23C+=1gZwwQiOS54uuS1YP8GB0p0eyWJ80A@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] i2c: mux: Propagate software nodes to channel adapters
To: Peter Rosin <peda@lysator.liu.se>
Cc: Andy Shevchenko <andy@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending in plain text because my previous reply was rejected by the
mailing lists.

Hi Peter, Andy,

Yes, software-node handling is needed for the ptp_ocp use case.

ptp_ocp is a PCI driver. It creates its board-specific I2C topology at
runtime with software nodes: the mux, its channel nodes, sensors, and
LED controller. Firmware does not provide ACPI nodes for this
topology.

The existing acpi_preset_companion() path only associates a mux
adapter with an existing ACPI child. It does not associate the adapter
with one of these dynamically created software-node channel nodes.
Without that association, i2c_get_adapter_by_fwnode() cannot find the
channel adapter by the channel software node, so ptp_ocp cannot
instantiate the downstream I2C devices on the correct channel.

Does this address the concern, or would you prefer a different way to
represent this dynamically created topology?

Thanks, Andi, for taking the first patch into i2c/i2c-fixes. I will
drop it from the next revision and rebase the remaining two patches
once this question is resolved.

Thanks,
Ahmad


On Wed, Aug 26, 2026 at 8:29=E2=80=AFAM Ahmad Byagowi <ahmadexp@gmail.com> =
wrote:
>
> Hi Peter, Andy,
>
> Yes, software-node handling is needed for the ptp_ocp use case.
>
> ptp_ocp is a PCI driver. It creates its board-specific I2C topology at ru=
ntime with software nodes: the mux, its channel nodes, sensors, and LED con=
troller. Firmware does not provide ACPI nodes for this topology.
>
> The existing acpi_preset_companion() path only associates a mux adapter w=
ith an existing ACPI child. It does not associate the adapter with one of t=
hese dynamically created software-node channel nodes. Without that associat=
ion, i2c_get_adapter_by_fwnode() cannot find the channel adapter by the cha=
nnel software node, so ptp_ocp cannot instantiate the downstream I2C device=
s on the correct channel.
>
> Does this address the concern, or would you prefer a different way to rep=
resent this dynamically created topology?
>
> Thanks, Andi, for taking the first patch into i2c/i2c-fixes. I will drop =
it from the next revision and rebase the remaining two patches once this qu=
estion is resolved.
>
> Thanks,
> Ahmad
>
> On Mon, Aug 24, 2026 at 10:50=E2=80=AFPM Peter Rosin <peda@lysator.liu.se=
> wrote:
>>
>> Hi!
>>
>> [Adding Andy]
>>
>> Den Sun, Aug 23, 2026 at 09:34:38AM -0700, skrev Ahmad Byagowi:
>> > Device Tree channel nodes are associated with the adapters created by
>> > i2c-mux, but equivalent software-node descriptions are not.
>> >
>> > Use generic firmware-node operations for the existing channel lookup a=
nd
>> > accept either an OF node or a software node. Associate the returned no=
de
>> > with the adapter so child I2C devices can be instantiated from
>> > software-node properties.
>> >
>> > Save the adapter firmware node before adapter deletion and release the
>> > reference afterwards, following the lifetime pattern in i2c-atr.
>> >
>> > Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
>> > ---
>> >  drivers/i2c/i2c-mux.c | 45 +++++++++++++++++++++---------------------=
-
>> >  1 file changed, 22 insertions(+), 23 deletions(-)
>> >
>> > diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>> > index a8b94b97a725..b37d36d3b121 100644
>> > --- a/drivers/i2c/i2c-mux.c
>> > +++ b/drivers/i2c/i2c-mux.c
>> > @@ -25,6 +25,7 @@
>> >  #include <linux/kernel.h>
>> >  #include <linux/module.h>
>> >  #include <linux/of.h>
>> > +#include <linux/property.h>
>> >  #include <linux/slab.h>
>> >  #include <linux/sysfs.h>
>> >
>> > @@ -264,40 +265,40 @@ static const struct i2c_lock_operations i2c_pare=
nt_lock_ops =3D {
>> >       .unlock_bus =3D  i2c_parent_unlock_bus,
>> >  };
>> >
>> > -static struct device_node *
>> > +static struct fwnode_handle *
>> >  i2c_mux_get_channel_node(struct i2c_mux_core *muxc, u32 chan_id)
>> >  {
>> > -     struct device_node *dev_node =3D muxc->dev->of_node;
>> > -     struct device_node *mux_node, *child =3D NULL;
>> > +     struct fwnode_handle *dev_node =3D dev_fwnode(muxc->dev);
>> > +     struct fwnode_handle *mux_node, *child =3D NULL;
>> >       u32 reg;
>> >       int ret;
>> >
>> > -     if (!dev_node)
>> > +     if (!is_of_node(dev_node) && !is_software_node(dev_node))
>> >               return NULL;
>>
>> I wonder if this is needed? Andy, I seem to recall that you were
>> involved with adding ACPI support? Do you have anything to add?
>>
>> Cheers,
>> Peter
>>
>> >
>> >       if (muxc->arbitrator)
>> > -             mux_node =3D of_get_child_by_name(dev_node, "i2c-arb");
>> > +             mux_node =3D fwnode_get_named_child_node(dev_node, "i2c-=
arb");
>> >       else if (muxc->gate)
>> > -             mux_node =3D of_get_child_by_name(dev_node, "i2c-gate");
>> > +             mux_node =3D fwnode_get_named_child_node(dev_node, "i2c-=
gate");
>> >       else
>> > -             mux_node =3D of_get_child_by_name(dev_node, "i2c-mux");
>> > +             mux_node =3D fwnode_get_named_child_node(dev_node, "i2c-=
mux");
>> >
>> >       if (mux_node) {
>> > -             /* A "reg" property indicates an old-style DT entry */
>> > -             if (!of_property_read_u32(mux_node, "reg", &reg)) {
>> > -                     of_node_put(mux_node);
>> > +             /* A "reg" property indicates an old-style firmware entr=
y. */
>> > +             if (!fwnode_property_read_u32(mux_node, "reg", &reg)) {
>> > +                     fwnode_handle_put(mux_node);
>> >                       mux_node =3D NULL;
>> >               }
>> >       }
>> >
>> >       if (!mux_node)
>> > -             mux_node =3D of_node_get(dev_node);
>> > +             mux_node =3D fwnode_handle_get(dev_node);
>> >       else if (muxc->arbitrator || muxc->gate)
>> > -             child =3D of_node_get(mux_node);
>> > +             child =3D fwnode_handle_get(mux_node);
>> >
>> >       if (!child) {
>> > -             for_each_child_of_node(mux_node, child) {
>> > -                     ret =3D of_property_read_u32(child, "reg", &reg)=
;
>> > +             fwnode_for_each_child_node(mux_node, child) {
>> > +                     ret =3D fwnode_property_read_u32(child, "reg", &=
reg);
>> >                       if (ret)
>> >                               continue;
>> >                       if (chan_id =3D=3D reg)
>> > @@ -305,7 +306,7 @@ i2c_mux_get_channel_node(struct i2c_mux_core *muxc=
, u32 chan_id)
>> >               }
>> >       }
>> >
>> > -     of_node_put(mux_node);
>> > +     fwnode_handle_put(mux_node);
>> >       return child;
>> >  }
>> >
>> > @@ -368,11 +369,9 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc=
,
>> >       else
>> >               priv->adap.lock_ops =3D &i2c_parent_lock_ops;
>> >
>> > -     /*
>> > -      * Try to populate the mux adapter's of_node, expands to
>> > -      * nothing if !CONFIG_OF.
>> > -      */
>> > -     priv->adap.dev.of_node =3D i2c_mux_get_channel_node(muxc, chan_i=
d);
>> > +     /* Associate the mux adapter with its OF or software-node channe=
l. */
>> > +     device_set_node(&priv->adap.dev,
>> > +                     i2c_mux_get_channel_node(muxc, chan_id));
>> >
>> >       /*
>> >        * Associate the mux channel with an ACPI node.
>> > @@ -416,7 +415,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>> >       return 0;
>> >
>> >  err_free_priv:
>> > -     of_node_put(priv->adap.dev.of_node);
>> > +     fwnode_handle_put(dev_fwnode(&priv->adap.dev));
>> >       kfree(priv);
>> >       return ret;
>> >  }
>> > @@ -429,7 +428,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *mux=
c)
>> >       while (muxc->num_adapters) {
>> >               struct i2c_adapter *adap =3D muxc->adapter[--muxc->num_a=
dapters];
>> >               struct i2c_mux_priv *priv =3D adap->algo_data;
>> > -             struct device_node *np =3D adap->dev.of_node;
>> > +             struct fwnode_handle *fwnode =3D dev_fwnode(&adap->dev);
>> >
>> >               muxc->adapter[muxc->num_adapters] =3D NULL;
>> >
>> > @@ -439,7 +438,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *mux=
c)
>> >
>> >               sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
>> >               i2c_del_adapter(adap);
>> > -             of_node_put(np);
>> > +             fwnode_handle_put(fwnode);
>> >               kfree(priv);
>> >       }
>> >  }
>> > --
>> > 2.50.1 (Apple Git-155)
>> >
>
>
>
> --
> 73
> With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
> Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
> Phone: +1 (650) 924 6653
>
>  Please consider the environment before printing this e-mail.



--=20
73
With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
Phone: +1 (650) 924 6653

 Please consider the environment before printing this e-mail.

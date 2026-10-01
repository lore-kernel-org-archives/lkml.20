Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15CF3F929B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852031; cv=pass; b=DWgT/FgZ54oAe+koWz4Lcm6DHbb19FWKtaDtk+1NI9S6Djl1dmA8CSp9vKBmuzPXAtnLTHC4VpS6X5Q2vLeBpr8NNvDIS9yMwvuvTQ8jFsz3qCvTNobV7qJ7O2mFql0nbGb/fkoUP1/g+Q38nHhJs50N5H/VCkOJm+m7QVvi7fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852031; c=relaxed/simple;
	bh=Fs1edfuHx1in4X4WdK3upBMt8kh7e3INqc862LZOi+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnLrItLzl3WYp7/oWeC79j0eNWVuR2M11YOlRGFCr2PiBR9AkTKtiZsf5gBhdP/y0beaGGJ1h4oUHAJ/6k62lBFlTcp5WWjaps9+s5r4eXAZ0TL5HdW5UvpRxoBQxR4+887x5l+06jNdJp7kL/VPHzYxY/DP/PrNzwvaNjf9axA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FAbj7CJM; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FAbj7CJM"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67567ff2e77so2541074d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852028; cv=none;
        d=google.com; s=arc-20260327;
        b=oaqezS65j9c7NdnP8LsL3mYOopbOOZTRr/qDj6EJhOHvPipU17ZMCk1yWkFd4G1+sA
         /xcIA85Wc/cchw9I7BHV7BsEi5oB63LTF1rV/WqEhdpRXRN2M8se357UIaFWUBuG8yZm
         QcIPVKYvISEhav/qktNe6ZffJbrFmz0aYLS8r94L9ujIQdxpXBFbtw8W9oohxfm5J8LY
         KaC7k1pZqSk8ZlNJtdwN9wbDAGuOdNnQ2iJnD3P71nJn9pX7TglOYVONtRQEvpuyQCLm
         jGIcy64rlcPJmY3DkudB385AoCO5SkkfCPjT1HGQnvHIh8hnO0xrlrCC+wU2C0w23I8j
         VdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        fh=DmTStvyswmWdCtLeckDxc65khxYU1n1CkIyROaiTye4=;
        b=FArTYvGuHvvYwVDt0DKg3dxnAp6tMQrwVa6BL7UYCD2gKITOb+UEGq8hIur5PGAdG9
         eC5i1/xu+I7r6iL85Zy4DI+/uSuoGIaLzpZ7JigQrbo+TvNmy9RKreQpkIG6oxFx5ifu
         ylLiFrxHRxf2qJFFGBHZ4/8AqzYYHDv0HO1N/7uLe3yg7ITDerjvpFztLteRfh7Nv3P2
         H4r2gZPsIWxiW3c33jGzlukEwhUYrJ2oOmL0UfMJ2LKDEGnqoI1hy1CumIQD26gm7CLb
         cBlO+wwWaFTEslQeYYpC/wVFndv7gu4I0U1sr19cGhNixlUk75Oct9oRR23Wp00LuwNT
         21Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852028; x=1791456828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=FAbj7CJMgab72MHHmfF2iW2O3xqNR2anisVVFAtjFiL8Qh2Pe5qy3EyOrrPogoYZG0
         bHFeHvcH710U1lLtLuR3jI9u641NZFI/ayhqFd8MJYamxB6t0hvhIGtP6038fE2n9VNh
         aGUR74pT+Qqo5mbpidnVPdUTQ8clM7IBi2Ymc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852028; x=1791456828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=LEvNRoJzSDU1Jv7CLkx29ioYFNV5/toctJZQBZzSoRWYni+4pvtVfQmHrbT3IiE1FK
         2b2TDNx/Ax/vVvph+a5jMevWt0wHaKJqIeX+x3nHxGsVIH2JnQpiGg0XaRkjXE3NJiMN
         ogSh49wzeLCa8EkpjFO9lwwdaM2c1eqNo8jaTq7CtKIBEqd/PaPzAKJjD+7quEwEc0fI
         gYyE1RpB2GZfXRsF5hjX8drNx8qsoNHBSTCLvurrGnk6U+RsjcbNeEY5feJ8F68wDFa9
         Tu7Gx+szVw4708o5eGdUjUWnM3H3FB/wKL9TtfEPJ7Tp1SwAG4gRKknbYlVeB+Umejfe
         veIg==
X-Forwarded-Encrypted: i=1; AKwUvBwT3hGrKIhF245lnZ7S6z+0SiehoIpvvYOMc1ARc62fKzEgO5+CJEv/igVgsXdsitH9XIW/kKkvciq3lUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvEfmGPW/qPt7/BzCzjgWI6dMqqp4Ia2cn0yF1+OcRABIO5D1s
	i7VIbD4jJXqxyiEwwU4lfr0MvcIbnw0jhpDTHv+3UwAcdMfa+jplUhvCMoamv+XddBy4FpGqueD
	YjdsnzH38Kad8ev9iyOYLMjgpbaFo9pTKkbBe7QOk
X-Gm-Gg: AYBFou0Rb8/t418k+THYl5gEqI9VvMrI0YylfafQO6sl66hNRLsn58dDjfRMYL5Mz5h
	RPxRtsHO+MDuOMJ8CAfmzuy3VZb76Q5EasNSd9P5yG75lemZcWtOBWFX1+wvLrD9kRS5Z0AIPEL
	nvSg4cxlAwK4wM1PJI4GnWAmIEcuS3m0JB+gYmBrykD7+GpO2AXwA6SpV1klvKQNj7CRIgDkROH
	O43gFP5THCVIuAy4ZwIyfapSyneoWZ2km0MxPC398w1fpkxV88ptx3LSQyoa92E8Eob/csMqUrO
	naKksESNB2m+V8q3nOxSuDNMACbEReXu3B94m79cng2vWzMog901vP1jpegYFgRo0dqnsw/Vd8F
	g/lmI7WET0g==
X-Received: by 2002:a05:690e:4105:b0:676:9954:81ef with SMTP id
 956f58d0204a3-676995489a9mr323421d50.14.1790852028003; Thu, 01 Oct 2026
 03:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916075745.3549953-1-wenst@chromium.org> <20260916075745.3549953-7-wenst@chromium.org>
In-Reply-To: <20260916075745.3549953-7-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Oct 2026 18:53:36 +0800
X-Gm-Features: AclHuK_wafiRDk696txMZ3q8q7Qaz4NsP-wYkipLMPcHq1r5tW6zotnKrD-_NRc
Message-ID: <CAGXv+5GdBUafk6niG-UMDx=z6LJQ6iHAWhDpm1Ly2ce6CQDaxg@mail.gmail.com>
Subject: Re: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Added extra |struct fwnode_handle *| local variables to shorten lines
>   (Andy)
> - Added comment about passing fwnode_graph_get_port_by_id() return value
>   directly to device_set_node() (Andy)
>
> Changes since v4:
> - Dropped unused |hdev| variable
> - Added flags for fwnode_graph_get_port_by_id() with
>   FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
>   ports can be connected
>
> Changes since v3:
> - Added missing fwnode_handle_put()
>
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..c0a51d9b06a6 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *d=
ev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> +       /*
> +        * At this point ACPI nodes and swnodes have been removed by
> +        * device_platform_notify_remove() in device_del().
> +        */
> +       fwnode_handle_put(dev_fwnode(dev));
>         kfree(port_dev->req);
>         kfree(port_dev);
>  }
> @@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  {
>         struct usb_port *port_dev;
>         struct usb_device *hdev =3D hub->hdev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>         int retval;
>
>         port_dev =3D kzalloc_obj(*port_dev);
> @@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>         port_dev->dev.driver =3D &usb_port_driver;
>         dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
>                         port1);
> +
> +       /*
> +        * ACPI FW nodes are associated later when device_register() happ=
ens.
> +        * Skip assigning one here to avoid potential conflicts.
> +        */
> +       if (!is_acpi_node(fwnode)) {
> +               struct fwnode_handle *port;
> +
> +               /*
> +                * fwnode_graph_get_port_by_id() returns either a valid f=
wnode handle
> +                * or NULL. Passing NULL to device_set_node() clears any =
associated
> +                * fwnode. It is effectively a no-op here, since no fwnod=
e has been
> +                * assigned to the newly created device yet.
> +                */
> +               port =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNOD=
E_GRAPH_DEVICE_DISABLED);

After AI hinted, I found some dwc3 hardware to test this on.

"port1" needs to be remapped using usb_hcd_find_raw_port_number() when the
hub is the root hub. Otherwise both HS and SS ports end up getting the
same port node, which is incorrect.

Same needs to be done for "usb_of_get_connect_type(hdev, port1)" some
lines above the diff context.

This mapping is currently only done in usb_acpi_get_companion_for_port()
and usb_alloc_dev().


> +               device_set_node(&port_dev->dev, port);
> +       }
> +
>         mutex_init(&port_dev->status_lock);
>         retval =3D device_register(&port_dev->dev);
>         if (retval) {
> --
> 2.55.0.1032.g73a4cd73de-goog
>

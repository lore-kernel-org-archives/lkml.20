Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6F4EE86B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540026; cv=none; b=k5/BVf0GnmhTiiaSbHSrprkjvj8y/ZqXHbmPDpHsooBh3oNFKfn73k+7mimpJBQxxHEnK0whSANNETMK5wx1Bdsss7aSM7klzIsO5U0BrP5fSexEyG9A8w0P1q/yOCca5onMQjmef3h3xm7HZEyvDPaRowfq7gMAQlphPhJ2cm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540026; c=relaxed/simple;
	bh=jqtuzC0nR43l61D6gvcZaII5xgpzEmMh90Esg3ewQrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxm7KQqEXUpHCrY2jz5QUgpEipcsgzHSbbYGM8DBbw+cC/8puzXRyJz8ZxTcwr4LA6qSPfx7w1K21Q4QgXuxvzFFUBJ3/6PX7qpYwjAcTXBcO0EaGnEcQ/pbtLPwlbGeTwqdCbipi0Lf6GfRxd2DiaActC/ZWItOf8P2EZJisP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B6Og1LYN; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B6Og1LYN"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90f9f8553e0so14613146d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540024; x=1789144824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=B6Og1LYNEV7SN1XqVxnfFoI/W1mYZTFHrmXDgGOgAcR6zdA8m+i9FInIDLATRwtMGT
         VbE3/C+oI3NVT11Ge9pKk+U0LGi1GJ18jVPAw+vFyYN7aNaqH2TGT0HKAS1ezdQTo8PB
         HzqPUsHBn1DJNskgwgr1MQQ7iL0fvMVGWj0vhfnU6WKkCPmQc/XYjFBxnlpmly5LnlCq
         eTU5HQhIhcIs1iq2QH2Wj/Fpv2+5wv4QhCbZsxNTKIY/mZZ6DtNR1H5MdiuIw5asOQii
         xgdD7M+0fEkQLI9nZQoNC5YuIJZU1QrWsku4KvL4Q7rnRgnbDueEjLXSNzm2cs1RDn28
         6wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540024; x=1789144824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=hVtOaStn0JeBK3+dSX169P930SEMYFoKwv/GEMzNcVs+aBXCbbJjpddV4FlhJTINrv
         AH+oYJxXC7OLk3VlM9Am3JZFVOUUTraX0vNcxXEQ+lQsQgc6c0mmKFjTS2vM+VHVPybt
         /JXTJuKKWZSJUekcZBZFAlBHsl8wWCFLroS9QD5p8mVBSvQQzVQkiDJprn8mBoHrAc6W
         8p8tL8LoKXD3WWS8dUMdaW/golK+D3hebbi/MSjMhdZjbaBLsGtQ8RKx0sVQWfwef8+3
         mwFAJ8hfC0LDmJ31OXoBYqcAhtyQzL/NNojL/wbDDC/0JGG47xJzXzEDJLOqAnhEvCnF
         WkUg==
X-Forwarded-Encrypted: i=1; AKwUvBwnRGdPWuhUfXoIb2FLHFmjV8e9B5kymh+eFnx/4Yeho2inbdw1VTKb0O99Z22zsgIPWNfRzzZk3hDMIjk=@vger.kernel.org
X-Gm-Message-State: AFuF++kOGUQwHmr3XFsFh3s+p2mren/6Ic1q/jxD1YLEv46TNVVBFJew
	kajhxArGxeCSrZRmljXbf9OKwJiTJtwC3hRjBNLl21Q3lMs5Kq7m99NgskbUUtUBRw==
X-Gm-Gg: AYBFou1UsmUE1lF0I6YuDcN7Z9URIbKC5tMdIFNssxl2z2vlCYt3Q2yRb1Z+OPn6P0I
	eJ9uQ+dsjoyYqX/uU7i970XBvHCm618W9PesO3ZKMSs2Gho3LzdmUOqdxXTgQ6nHjkpUu8Ct8yA
	tDyUeLfZ9neeNwKevwO16Jjo2aFfCYw1PaR32HPOnqg4eU1ENeTW7gu+W0h8pVZWZ7gRhZ+4VIT
	wK4gxB5i2+YfDGwUiG6rSuXti1S5J1XhSteNGox0W431FlMV2FU1bNMkmqapRrCRlGm+bVLQ272
	XYPpZVhqmqRzIBSX3y0m+9hEt/1Q8xyG0xF+vm/LwHazE+2/9aZn7U9Jbpr4CuFhNCwdPwdyLBg
	t7ARJqCM3r+Vu4OMqVPHKh71cGh1oMfFf/4d068CACQe5SbV9h3ZHQKsx8EgsSkD3i/lb0QRF3q
	SE6EObjN17axKij+Z0Dio71v79j4Gtt1j54fGSEp1iMsFqEuzrfbFm1/9y03wyCA==
X-Received: by 2002:a05:620a:8017:b0:939:6ec8:6928 with SMTP id af79cd13be357-9398037ac44mr706361285a.16.1788540023360;
        Fri, 04 Sep 2026 09:40:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm246420885a.14.2026.09.04.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:40:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:40:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <6bc3c29d-aa38-4e59-a4f5-2c480ef9c748@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-8-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

> diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
> new file mode 100644
> index 000000000000..00f7500af336
> --- /dev/null
> +++ b/drivers/usb/core/port.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * usb hub driver head file
> + *
> + * Copyright (C) 1999 Linus Torvalds
> + * Copyright (C) 1999 Johannes Erdfelt
> + * Copyright (C) 1999 Gregory P. Smith
> + * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
> + * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)

These copyright notices are entirely inappropriate for this file.  As 
far as I know, none of these people wrote any of the code you moved 
here.

Alan Stern

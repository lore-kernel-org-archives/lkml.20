Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D5A4F4736
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540266; cv=none; b=nfv28DrcQn/quHL6qjPcA6++KsMffrwqSYvyji5UmQTbAmEa1zmle6piZEb0N+FQ8qEfirXgCYa9ijEFBwWiTmTFDH+DWo2mwTsghRaYuyAz8nn2GXw8JVqY2nmKEys6fLHRU6i0LuGrma2P5HoaRl6eTvOH/BPlmAwGmhy7Jek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540266; c=relaxed/simple;
	bh=zuOhkEhl9/3hyPjwkXOeT9Ut7Y3NkxiWsPCsZKsgbNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+A0Xf8IgHE5sqkH/uUpOGcGy6Vtkpog2E3Gw6pmRiMXixLVrKKfJ46STdwqzKTnDaynAInhIhNw5vI49paAxVENZHy/V6/EbkDUrANOStEFE54BebfW5n5y+2+BGqk5UYCjFYpf1mjQ7ld02udZUZ07iz3wzLUat599xDcgm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lkplYKnu; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lkplYKnu"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9103228ef53so13527476d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540263; x=1789145063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=lkplYKnuLx52STNBRE9/OmlWQ/WfYs+lwfMhZ000DoGGVaVdCgDiuDXUS/1p6Ruc9b
         2KGIuOHOp9dmFNj5tCeJ3yrQuTGCqe/vUECH0bhV9EDuZt82XUxU51E8QjSNL9E+My+J
         atNG2VhcgWGy3HUdVYpyePtJbA/G3T4Q93TvB8aC09O3Vj7NODxXvte1l+BOU4sUvEve
         grRdxqU9xVVfeQ3EcGGQQEx3qX2U9ywwIAHn81+UP46ynR1JPXIwrDnekXGEt4+MDcIR
         YI6GlKskDu9ShKEpLxWQKK8uJgn9kB32lvhylpkFZkAFM54XF5nUQSnO58yPxGO9Uxah
         iyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540263; x=1789145063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=Xo0xjexzuJKEzjqODyyZd/lxOuvfC7AwLzX4OvLY/AWkuJd4sNT0IUho3oibAOLLDe
         da6gRIO3UWGUIOyXB4kPIhM38UKo9aGcZ7yWob2UYWo3c+Np8EHejor7vktWqs6Fu8d4
         BIEujLMmeFaPO4yxNNMVd9FKNmWafZ6vZcqCO8oS81mcUzPYTE1roM6geEGV08E9HdhW
         0gjlIs0WaTXbjmaw2FO9hFPAM0uPTMVnuPys65dOlXWM1yPvjEUbQoSXW3VX5N3zohJI
         LDLKDY9z3OfnhwK0wRB3Gw3C0qgo+0GCM04JNr4Csf+/0ezudEFPQ73YbC4cWn80T7St
         +gmg==
X-Forwarded-Encrypted: i=1; AKwUvBwXhqafm+kZpQBXez+z05VXMLbvOYTGqyBvkX8PCxF2Cs18iZprf9TZvGSAEsIx+tCBBDrBxZ0Whm6qbUY=@vger.kernel.org
X-Gm-Message-State: AFuF++n4exshQMcfL2RL9vUwQY2MYYCeNAU2w3fsHpkSDqe6Ddlkmjc/
	d5TGP0TmJVh2wqWUM9chu2l/0le/lWkIkfYlKuZN9+yL9ZzFZufO9yS03t86vd0iYA==
X-Gm-Gg: AYBFou3ay67VNqZcWUdCyoTlkfeSQ70VROCvQk1AAuK4BW8r2gdRDdSFmuwdRhnK1UK
	rjysSW40J8MYMwYZqER3mtBM8VgOkufaV3HVyHn/uP9ZWF5EM1KueJU/hZ3iTCmVJuachuKOgxB
	aQT+lPPW8GPodADvEY2Ux0Bg/NK7HbChM/W/LpV37mYr5R4fdAnhOhF/HbLy1C9vjEoP3Bbddhc
	XflrTg1/z4XgUNTGt5s2bRej1VrCD/7X73UbfuxgEZcwrif6D0F9Z7tZxDiaWkN+T3EUZvYtEbF
	3L2KIFzojt/jRXUXWWYUqSaB/Eg7jcv5jyKwqL0cIBds7KlzrHLNDT6IobXuSONbabCqpAe5Ugh
	/cHnNdtO4squPuPLJrbpUaDly8vE8XkC4yja5jiGFPvmY72YocZeiGt/qpDViJMhosEzN3ZsTgv
	HszE1ILpZtSt7BbjT3YvKRxGiEqPkDKnHznk+pAzdjpq+I/uVGpzJ8a06E54j0VQ==
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr78478096d6.31.1788540263010;
        Fri, 04 Sep 2026 09:44:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm24672736d6.14.2026.09.04.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:44:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:44:19 -0400
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
Subject: Re: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <c3740c4f-6ae8-4c6e-8f80-105f1607ef55@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-9-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:47PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Minor complaint (not referring to anything you're doing here): 
port->is_superspeed really should have a better name, more like

	port->is_superspeed_capable

or

	port->is_usb3.

As it stands, the name is ambiguous.  It might refer to the speed of 
devices that the port could connect to, or it might refer to the speed 
of the device the port is currently connected to.

Alan Stern

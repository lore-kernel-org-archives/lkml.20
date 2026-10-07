Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A03F54D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405686; cv=none; b=OJx6vfkPMwfqIRGz4vuAEfEig3X3At4gPEFEHjMmj6Yh2n+O4sPYltSXxJQOgbbjnwaXHpBwejWRf4IlDLFlqfnQuT772W+THL1yYd+jRhrwT7m8N/EU24n+M+d+rwqHalDzy8MeiPcIRATvkIiEGQT+qiDy29D8Lm+UVWh9r0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405686; c=relaxed/simple;
	bh=PvtfH/k8z1BDjmBe0wFt7OCs+OdclqZtP44M/KA9cWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c27+N2weM/vLZWGKgPPzSBRju+kqIlDrRxudCu40LH3OhYdwjStpprTYrdHTm22/jHlWdYLBV2l1kkgYXgP1v1DJm5ByJEhdLN9OuN6/vpt0uFGc4vWdOiRA+Kc662MOgGRiIw9vmRGO0w8W3HUk6+vaP7unWw43s6xF2SZH6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pva2+NEx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pva2+NEx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a01933b584so20512205e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791405683; x=1792010483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73BVDVpDiA70xXPSPckSoCpnSylvrTOc8nuDs4dKWHg=;
        b=Pva2+NExCW+jsdAElXT7f1Z3+F9TUX40dIe/xvvL/8tZgDUKq5qyMiqslufuKp2uYm
         kBbgSD/JAKmMPYvBAgcYWaKYwrwOMlQC0NbSty3kZxibBeklP70hsJ9GeX2d1tflFKFP
         wJqHu57o6XQ/FiZL6hbI4ZzaUyFZchWKSc/74L1naK+uVy8fL88reN27MMr4z2eFJtAA
         2oEDoQHZS/4UK6GFq7RjDRtsjCWK2OlpXoi+njzSEZFsGK8J9Ofmvjzjm+G0oOH3+58H
         TwT+x1ky6gTVNWh+hq8l5QyUAKjOLhTV6FtzphG7LJ/81orlIn132KUgpAtEXUaelzxs
         ENLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405683; x=1792010483;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73BVDVpDiA70xXPSPckSoCpnSylvrTOc8nuDs4dKWHg=;
        b=NUliNMQdquA5Qolm++kkrlhycGcj4yeq1+5vPs1tRebnSLsRGu+XZ/sBO9BZN5sxKp
         9M80pPXmpeYKd/rgdwQsyiXFOHGCEP+6up33g2q6qyHF8Zq2DnG8dVz8rwDC+cyckf8r
         ty1yNvGdlTWWuEDI8DURjaeUlwQlyE3mlbPTNYKydNFKzYYp5lQ80fK04ooCxPJtXY9g
         efUdrXiEh0sEKnUav+fWENIKYIuqxnoKkBe36Mp0+33sXel0EppI+VT56jPs5vn0T/EQ
         X7g0HwSvA5bZOoXt6gIeq/TBMx5dAshGt456kWu3lB3Qy6as7BI6odzdx8MJceUGR+NL
         6FxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxACRrapWb0WJ8JS8jRMYaLa4GALcmCEjNxYMOz51TI2DpaN3tVPswDsdBT/AfCADNM+J9t04gKYjIjotQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m05zf6gT4RAhLFvHGIVeD2PcpW+6kfIzLXKeE2Wvj54nwHSkmI
	z4/SV4tXCdw17GCMoJDryUkn40U5cvsXy25M8v5X6cFeuHm+GaDiARXJLuJu62m/
X-Gm-Gg: AYBFou0uKRLVooENDf/naNKRAl2tkFFJggNwvf4tD8fW2gmyBWtCkX3uGcsh7WyCQt9
	2o6eICZHccolGLgHGrYBE1ARO5Y0nSLSJ4ALjFjsJFx+/nn/oGyDAda7CDHz2IfLxAwvcGdIXiz
	My2/XBStO1o+dVkGuZ1x+AXbpn9j5VKQ3ewxQZxbvsro1wxaS8mI3lMccO4i2QI8jyPOQwlyz6t
	aRY3KBbJ3z/s2D25BwJuA7QcEGWJzTKLuMfEX5b7SnI/bniAJ+xsFA/JJmxyUGUz6Igjj6NaDv8
	zIKobK6V57X4peu9vz7XKx+LA4yL9jLbfpZ7gZFCKkrfL3DG8ldO4DELPDPPvDr7KWUxiAXfsdo
	j5aHIVfg1KU71gF6ywHeXtkLQT5zLljXVLiGf0hHkE1/eX3Yo92KAT+ZDg7P6Ne8AyL/0iRt765
	xdIiwFqKjL8F48npfcg9xeiu6KIc45Mlnjix6QKKEZSLAs26sgkz20yhr72PvPbYrMF1X/s+bTg
	4fPjrHfOQ==
X-Received: by 2002:a05:600c:3f08:b0:4a1:7703:e537 with SMTP id 5b1f17b1804b1-4a180313b66mr53230165e9.10.1791405683281;
        Wed, 07 Oct 2026 13:41:23 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18044c970sm50776585e9.4.2026.10.07.13.41.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 13:41:22 -0700 (PDT)
Date: Wed, 7 Oct 2026 22:41:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Giuseppe Piscitelli <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
Message-ID: <20261007224115.755ce40d.michal.pecio@gmail.com>
In-Reply-To: <20261007191130.8652-1-ooonea@gmail.com>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
	<20261007191130.8652-1-ooonea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2026 21:11:30 +0200, Giuseppe Piscitelli wrote:
> On the first insertion of an iPhone (05ac:12a8) after boot, an already
> running usbmuxd can select USB configuration 4 before the charging driver
> apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> driver that enables their higher charging current.
> 
> USB device uevents have no MODALIAS. The charging module instead loads
> from an interface uevent. Its registration reprobes the device, unbinds
> the generic driver and calls usb_set_configuration(udev, -1), tearing down
> the interfaces and interrupting usbmuxd's transfers.

What is actually the appeal of apple-mfi-fastcharge?

It seems to just issues some control requests to the device when
commanded by userspace. Userspace could do the same with libusb,
apparently without unbinding drivers, changing configurations or
even claiming USB interfaces. I just tried a simple program that
queries GET_CONFIGURATION, with no disruption to kernel drivers
or other libusb applications using the same device concurrently.

Then simply blacklist the kernel module and all its problems are
gone forever without one line of kernel code?

Regards,
Michal
